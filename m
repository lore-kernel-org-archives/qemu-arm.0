Received: by 2002:a05:6214:1808:0:0:0:0 with SMTP id o8csp2882394qvw;
        Tue, 1 Dec 2020 07:53:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvH0PgprqUCusba0sAPMx020agYfycplPM95dBbDlnouldILc8XunynHAV2WwwOrbd0PfI
X-Received: by 2002:a25:cdc5:: with SMTP id d188mr5366938ybf.58.1606838004658;
        Tue, 01 Dec 2020 07:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606838004; cv=none;
        d=google.com; s=arc-20160816;
        b=IhPVYdHhXmqQ8nrRkQvQ9xTyYCUCBHv7bSyUVqx2pE09TIEudM6VOxaOxEJ3J3Ye9/
         FtHGgNMgG7aAvv9JdWkIiSAuzKpwfNEdh9tSPYu6YlQBfR2qr9Ao4lrZFkZLREGFrvMW
         WyH1OMabKVXoc3hdy/3Qp+Y+8dzFVwZFPgX8JjqYKLzZ0y1LNNF69n7niiUfRVviweGI
         qBxAGPwpT6qO+s3B1AZprVItcVhACXFF/pF1u5s5Yhsu2/zk1AQkVX3IBA6Lw4A9DIKh
         7vE/TmgfSl/tqwa02Y88fP2qMZa/yiJjRGDc7hKbFKKDGOs9H5itDcvrSs3COQOxBzIS
         eRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zAXOBFFar0ef1XB2xVRkglOP08JbejR/BbShpLggLqc=;
        b=KU0+eDSuV92SybzkjKB+NL8V6h6U2R1EHfPn5YpjMU6ygNqNYxC0wXou0joIy07fRF
         Ops326LHgt47uslN1Bh4A8YE/g9LAuepVYuoXz9Kx1ETqPAnJr4IPqG7nHA46Xea4RRi
         Az5xKBRjY87t8OJCw0sLOglb03UkZnGWxDil5dAi1hlTWKl9V+DWxo9m2jTJRKwOvqRo
         Ld/qmjj1n0Uk3IGrILDHYuRiVHwcWee/qFju3HxIoXK3H8WPe7XUYAJSfZC3GLRbPSgB
         26AMwcXSdaWDSB6w99eVZAPyAiN+BtEChaaIKXWpI1pR36XbgQzE5bFcRYWyNR0CwTkb
         cUUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdW9CkLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si111422ybk.496.2020.12.01.07.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 07:53:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdW9CkLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk7y0-0000BC-6g
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 10:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7xr-00009a-LQ
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:53:15 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7xq-0006Fq-04
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:53:15 -0500
Received: by mail-ot1-x344.google.com with SMTP id n12so2103971otk.0
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zAXOBFFar0ef1XB2xVRkglOP08JbejR/BbShpLggLqc=;
 b=pdW9CkLVF6QdPVN+PaFGv0v4/hvxoQrsZCsNCZF0gj2sVMYjIUzNG+Na//qX7DtDgt
 ToD7UaF2jimrd9U84aVtODESg0DwzSrG6j26jh7HNi91xhLnyRkQrIc2OwkatmXcmEHm
 Ys8KwChZUkvKFnts0AZHpD/IlBiLv9bhF18DYqkFmLg+0P4GBo9L5Dxq/BXWP/UvtoEI
 4tGjWzjgthTHfXxKKiGbmXkzQkd9hJ6splPaZu02LGzBzNt9Yq3MfOU/rOqndVI8VNcy
 aUKaaCjcXYzWOCYhads/Hh6eU12P3gJjfsofHgxsHV5E9/FB71qFOxlfC7+wJGnRcA2h
 yljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zAXOBFFar0ef1XB2xVRkglOP08JbejR/BbShpLggLqc=;
 b=K8WWwU5VbjN/MZccS681iKT8Al0RKuwA2lgGG1+/u3MMkZcq0WUN3Ut8yFk6QDqZY9
 awpueY0l7RGlK+FJ6vpGFsw1Vm/Hr5xQFfRBRmbhDZytKFsY8nBAeZtUrlCSC6m/djHL
 i/QpkD+gnF2l7PJXQvu5Ht9QNO2p2hvxmx4zBnA+VH2ZMFRLK8DWCVNwhbarb+cv9kUY
 zNANBsZ1/59GEzru6/8b62t7wfRVw38QaFfKzmqSTIzkJbd8k6TDKn8howDIE7ve+Bvd
 m515EpAJDvBI4Ioo5uJIwfNOZ9JjaGs0BYJAVF2z3aKtMWJdrSd+qPKo/sT7dc+Xe3Rq
 pKig==
X-Gm-Message-State: AOAM532ckmIDfIAb6ZCrc7Odljvj6BlF17USDMkTaYjEmGEbPDlOdmyu
 dchwWb2iUaxDJVP7y74WQB1K+g==
X-Received: by 2002:a9d:505:: with SMTP id 5mr2319698otw.370.1606837992683;
 Tue, 01 Dec 2020 07:53:12 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h64sm472904oib.33.2020.12.01.07.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:53:11 -0800 (PST)
Subject: Re: [PATCH v2 23/28] target/arm: Implement CCR_S.TRD behaviour for SG
 insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fadc03e2-d55f-4b91-ab1a-5b78aa24af24@linaro.org>
Date: Tue, 1 Dec 2020 09:53:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6PTyrMFrtbvs

On 11/19/20 3:56 PM, Peter Maydell wrote:
> v8.1M introduces a new TRD flag in the CCR register, which enables
> checking for stack frame integrity signatures on SG instructions.
> Add the code in the SG insn implementation for the new behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 86 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


