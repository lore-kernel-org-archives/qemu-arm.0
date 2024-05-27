Received: by 2002:a05:7022:4391:b0:7c:9548:a19d with SMTP id bo17csp2875767dlb;
        Mon, 27 May 2024 09:12:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSVVp+5QBqf+nmMmiEDaYRrpObphqPepbzhpSamjTCwvQ6iLv2cc9ykRrgdAoHxrgrOlwErsdmfl0RJvO3ktwTf63KpGRt
X-Google-Smtp-Source: AGHT+IEqpjDZAuMlqFOghGy26Q3aOmf83sua+5aJsWR5N2N3Y7FXu9X5X4x6sEYExwMOe9hiCOjf
X-Received: by 2002:ac8:59c9:0:b0:43a:dac9:d9b7 with SMTP id d75a77b69052e-43fb0eacf3bmr113592041cf.39.1716826338638;
        Mon, 27 May 2024 09:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716826338; cv=none;
        d=google.com; s=arc-20160816;
        b=ms6QFJOP3elESn4xm71eI57TnhLPOeQt8VmaFtV1gsyluLjANtznyBlx2tap0T8LWf
         kVtLGl96yjv2m3jqypV+rzZzcer71KkiyQQLkxMnKQ+oXnngkthuPDLtD5tulTRdTNHy
         AWKVfnkqKN5F7y8t/b8fiykqqxQcwAPMYMhqJy/G51Nz7982BUIXihazOn3l9aWc5EgG
         LDA1nC9FQC4BZ+bbWKCpNx0Wdtx6YbmMdtAY6dyZnvUiYSqpe7bma9PRTC/8fOfDbIz5
         MRW0KVY0R2+JNaCu7czvOOINq83rTm31QzBXDY+05N+OGLcc7csi4r7TrdpEAKrgifln
         38dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wK+f9rxtPDFop3XXEfNKDknuqQpxIyC0RewsjWNDxtA=;
        fh=kRAyUTU8lGXz0oQWkL1hyTPKW4eUPsSJi2OrHA2Ilh8=;
        b=Fml756Oh+n/6smOafmQ/qGooNpxjVGrEUNEyKyozqfNfXKS2DfCeVg8RzK49unuts0
         aP9LSjNAEAHhZ92AUF5AtWV3ENpkTqHYiPBVxKTl9bzh4aezpXyFtJQJBk2ybJBp6Rjz
         5Yy9UUzVfrKkkDTgU1eM7ZJaRS8MfRfa6KlG3gWq4DLc++k7Ue9MfSC8MoL2vonm3cvo
         TyF+qGw7DbgUGS/tMXnxdceqfyI1vc7VWGtV4tkaps8PAD6XwzXgaPgPYOjsTLZFYNZI
         yJ+Ivpq7j4wS5lHy37LZjrQGEMfsJHxPcMHKAUtnxd4vrGWwDf8FBQqbg70jZv277pNe
         gwIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BFCbsUQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18ede47si91994711cf.790.2024.05.27.09.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 09:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BFCbsUQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBcxJ-00063l-0k; Mon, 27 May 2024 12:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBcxF-00063G-Ve
 for qemu-arm@nongnu.org; Mon, 27 May 2024 12:12:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBcxE-0001wX-CT
 for qemu-arm@nongnu.org; Mon, 27 May 2024 12:12:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42108739ed8so35921015e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716826325; x=1717431125; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wK+f9rxtPDFop3XXEfNKDknuqQpxIyC0RewsjWNDxtA=;
 b=BFCbsUQbU/qOj3r3/lygwSWeqFC+nfF48IHg0/F2ExriHRlgn0gyw6KvaNyWEbF9xP
 3mOhD3s+XCqqTSrLX0aQJVO6glt0sSVO+9EE0jfuxJkwy/+HA7/rDSfzPHlb03rFLQAV
 eZhFamKBvGS9XtN2A8x5b4kEqd6edayZsieB0BZSOfwshnEjmfoh3FcOZxATgRQJSPY3
 DJpt46eRBndWCOILoO3kSdIC0+V9RtPeSx+8GakgI7qtZ/T61Z4b6QFcrNfn8mxXoJn6
 R2pgIAwcvmYiCwCH2Xt1ZkSgx7WJR2hrofdZKc4RnpD4SMUELuGbtoivlj/SbFQ3/e09
 Nzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716826325; x=1717431125;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wK+f9rxtPDFop3XXEfNKDknuqQpxIyC0RewsjWNDxtA=;
 b=SNCRXf4oJ+x2v5b0agpfhtuHrgyQX44hzBEywgIPB0ClDD/meZgQkuWY8YHVs20riV
 keGYnz5HKBIYpxcRRfBLDgwz9sf5hHt76QTj93jJJLyto7xiNWDTIWAnisvEcD1Q9Ayf
 wwx0DZCGUghgpgzzRZdoKgmFuXqbXGCqPkw3K3h9RNqfAIG5Rk0oEuzt/fgOqxohFD7T
 8u1mqV0GIBvdMfxfWSBz8IrKXfOLVP5gnhhxK9tg6h9LIGFk2w1epsa/1bkxae4wEjCM
 vx44QuvUOjVn6pGS/6tHrT/fpcoWtlgOmiw/mI1yrfpEqywUfPTNgT9QXK8Ti+KQ5sgn
 kNrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiPArsGkTt1rtMmKPgLrptJHO4+r7IfotZTNEK/w6RgPIFUFjZ76kVl82hoGA0fTKsGdBGUCd2xXNFRz2LhXSsSFF9
X-Gm-Message-State: AOJu0Yx7dt8VCWO8DhJN768BxCyjV9vGFXDYgZL5Gv3ex+Qrn2w2/DzA
 iep7dgvqT0/QMPuXUP6+5abGWmg86vIG5MPaNX20ZpdoH6NR3WQnIoD1ifHvOTc=
X-Received: by 2002:a05:600c:1d11:b0:41b:eaf2:f7e6 with SMTP id
 5b1f17b1804b1-42108a3a364mr89630765e9.2.1716826325026; 
 Mon, 27 May 2024 09:12:05 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42108966b36sm113383355e9.10.2024.05.27.09.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 09:12:04 -0700 (PDT)
Message-ID: <84f00656-7915-4d1c-9a80-943119757919@linaro.org>
Date: Mon, 27 May 2024 18:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] hw/arm: xen: Enable use of grant mappings
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
 <20240524105152.1301842-9-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240524105152.1301842-9-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YEJn9pe/OvTF

On 24/5/24 12:51, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   hw/arm/xen_arm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


