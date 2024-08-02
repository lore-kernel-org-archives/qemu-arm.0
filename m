Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp20922njb;
        Fri, 2 Aug 2024 08:54:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWUIf83NzRBCHxKQ3X60MLtc3sEdGdhv/aji7pVUrJut2LObkHHUMYv/D98q4Wn2kkr6LZ+a+2j0SQqEDa9XrfxizouuQ/
X-Google-Smtp-Source: AGHT+IFKiCyI6pigzxNTl3bvpeCExz0k53NSl5gsvsTUqO2X2Cc1vNGI3c4xhtQ/DT3cCgoJbxAA
X-Received: by 2002:a05:620a:370c:b0:79d:62c4:d636 with SMTP id af79cd13be357-7a34ef3c3a3mr505318685a.26.1722614062584;
        Fri, 02 Aug 2024 08:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722614062; cv=none;
        d=google.com; s=arc-20160816;
        b=RbyipHlpy3UdqIw+r64TBFNiTTc5WhWZoe5GahKspBXuSBA2PPqbA/u1/xjHA95xC3
         di41qdBBFMnnqN8N8pxx4Q0wCXoIEfXoftWQ2AavHnEEj5JOQrtuMvUdtBxO/Jgr2BW/
         wk5gRdoLQJT2+EIMCuToOlVF0K449upBWzauVOURu1fQjoMDseYgdHNBivzFLK6NzCnh
         xeRP7aNDuqoablZ5OxJBp9HNHlpF2o0I3KPY5FjFEekgxhTCTpEthwqCcuZXwD+HYiya
         6mTFXZulcGfBNsQIY9YcB3Cea6XeFB5jnTFr+cLwmbYs1KwdhpN0KLpibdyjLFz2rE5u
         r4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ulj0JdWeWhPf6NfSKyruNSZydbupVWd9hrcQc6mnthE=;
        fh=ZW1KTbAftSURlyK97js+hsaWV0vkc/kK65f2+HnXo00=;
        b=jOAmMM0TUk/KwOasejxblJl5shy2SXBPaxmNQ8ImhGHtGEyXfngQhc6k4W1QZwKktR
         PvJoyUOmO3wZ83BzqPh2HqQxa+Yq2RqulWbBWAbixl5ctZig8QUKWXPlFRivMlDsdoUF
         aTt+5yARA7jSfWisBsUTgmQCUyJJdB45GZq4dljg/68pgAdSGCEt6cOSvem6hUrD64e6
         49+l4e77hBru1+wNQF39K3rAyWaZb+Nnma7Kyl+FJA7ozq1kwQC8oXU+uM/Q8VpKDhdL
         UHRAVnwLBlFJcxVzrFzpoN62FMvJUkJeVeSfy1dgrWZMWxpNo05EZDr9P++BLMUnwXN1
         5+YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nmf003rx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f6e1438si272066585a.183.2024.08.02.08.54.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2024 08:54:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nmf003rx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZubT-0007nO-2P; Fri, 02 Aug 2024 11:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sZubR-0007kz-7U
 for qemu-arm@nongnu.org; Fri, 02 Aug 2024 11:54:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sZubP-0001RQ-Mv
 for qemu-arm@nongnu.org; Fri, 02 Aug 2024 11:54:00 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42819654737so50171615e9.1
 for <qemu-arm@nongnu.org>; Fri, 02 Aug 2024 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722614038; x=1723218838; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ulj0JdWeWhPf6NfSKyruNSZydbupVWd9hrcQc6mnthE=;
 b=Nmf003rxwDCtrNFQt+l0qF65qPJkn75Af2VB2xvmdXoQbEPYaHTCiLFJVmdLmICtRv
 qk0n8sDvH2HB7F5oOeyxj3usTjTNFI7qRhINhv6f0Ib4+jsU9ZkJVHy3E9EA9saY3Qgr
 Qs9GuqdTVyXMdsA+xKDACzs6ra99Uq5o1+8OIqiNRdjQOVH+shqzt1niczDPsgIbOxjs
 y4jTu+0ZvWKPL4jgeuq50oJDIb74wgrl6CbmOrVWIRCzm6El4szZCxy0EaGvYtfK3TqX
 WRER40yQN6SnT3mNl4jf17cTCxsB6lGUhOje5nOrU19u2eJg1VAMqzsYCIhkCiZwIIqu
 F17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722614038; x=1723218838;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ulj0JdWeWhPf6NfSKyruNSZydbupVWd9hrcQc6mnthE=;
 b=KXJTrmGmitrhf7UFEnVWjd6WljVO4mzQwfM0vmLiAn266yIx62EM4QMqKO/GQfSY1+
 3k8vrB3LuK3jI7jYs2EK64l5mZJUO4+9ayaSyBIcHeUnamXjTY1/pxWqM8x/u31iySEG
 BiAHziSCJYiLr+UGfQpf1yu5kVhEaZn3bNJEf2Y0TENwSpVq+CeJVEKo6GAqQrVZM3Su
 IEoplJW4HfBnpnthxxzr/jPcMDpHROXgx0kninP0AtmDaPQZq4ULu6gHMLBptfjFFXi0
 6FKM2Hz+96MBozj2tueu6lh6eH7RX3Z26eUtI0sxLk42Fe+4aQJsCwYOu9nKvQeyKqfT
 adaA==
X-Gm-Message-State: AOJu0YxKjO4rcORHN5Hl7MVObPZeM+cTpPVTljWLtAyxogtPSsZK5Cmf
 IkEwt6tOu3Hcl74VbY8VeeFjj3rCilFCfpnkqIl01LcCEfGHhkiyJ+8T16Epkio=
X-Received: by 2002:a05:600c:3b27:b0:426:593c:935d with SMTP id
 5b1f17b1804b1-428e6af7aeemr22364925e9.5.1722614037655; 
 Fri, 02 Aug 2024 08:53:57 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.94])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e03c4csm37967395e9.13.2024.08.02.08.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 08:53:57 -0700 (PDT)
Message-ID: <06c4aad6-8c1d-4474-b3b6-4cc9065edc33@linaro.org>
Date: Fri, 2 Aug 2024 17:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvf: arm: Fix hvf_sysreg_read_cp() call
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Alexander Graf
 <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240802-hvf-v1-1-e2c0292037e5@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240802-hvf-v1-1-e2c0292037e5@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tnH1xRnv5Yie

On 2/8/24 10:37, Akihiko Odaki wrote:
> Commit 05b8d7249109 ("hvf: arm: Do not advance PC when raising an
> exception") changed val from uint64_t to a pointer to uint64_t in
> hvf_sysreg_read(), but didn't change its hvf_sysreg_read_cp() call.
> 
> Fixes: 05b8d7249109 ("hvf: arm: Do not advance PC when raising an exception")

Not 05b8d7249109 but e9e640148c.

Fixes: e9e640148c ("hvf: arm: Raise an exception for sysreg by default")

Updating description:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/arm/hvf/hvf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

