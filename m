Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp873039lfq;
        Fri, 8 Jan 2021 14:34:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPuCM3KT2hUZRd6f5712/iZVz3T0VXsZ5z2NHhrYzubDHyS1pUSNAy9XfLO07LbWAPNcoW
X-Received: by 2002:a25:ce87:: with SMTP id x129mr8626012ybe.218.1610145252048;
        Fri, 08 Jan 2021 14:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610145252; cv=none;
        d=google.com; s=arc-20160816;
        b=DLLF1bqtW3co3N/eO7RtZm9cq0HKcNe7FUTL/u2vN8TOtk4JWPgRvavaE6cJQo47xc
         pLWftSYVnE1z4t4zBBe42Eqd5zs/84ZUPFu2F/h522aEfJ6gXyx3SFvUfa3p/ipPhKSy
         X1cCsTY7b7ctwSae9cCNyLsC6CjrWPkz+y7HllIk52TBzqxdbwdn081GShO2/bMqcfrJ
         IwbRpAEn7sYzCMlYJOR//WwCkYGVWA/vRq0Y2Jm1+PA4FoZhiiWEHbB/8PsRiO8iC/xJ
         fuEEP+HrA3BGCTa76M5TxrQLgy/f5TCJxNV5PXIwSiTY/99PQIRYrrCyimR3qswwbb4H
         TdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0hER6CK+Qtb8Bjy/Ktns56cKHbxMqNzSvuPBlZa/m2g=;
        b=ErohiHBb8koaP8mDJooV5NYQkaZHfbZWVoVc7cdivENTz5Dt0KEp2YJrmuGmquRTdL
         5vQN5MhHXAYTp7nGQbQEqfE3iYbUC+u8vtdIjXcrNsZKj/PXwQlkgADfrac94zSldbk4
         twNG8dh+vRlCR9/mZjt2Sz2CgoJ0LMqQGLPwBFywXFQ9PSH7ObnZoilz9Bp9oCUxyDh+
         /6GTguNMY/5ul8yManILdXUN6NDmt6iIjV6Pf4hvXK36tzGepWlciNdbkvTo8NqGBNpW
         pEfNXlg8FIdTFgz7BTvKYO1o/cVK7Gxq0xeabOxgPne5wHcuSuVJ6eln8Ighbwgbktb8
         ft1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRgKeMoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o144si10153317ybg.420.2021.01.08.14.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 14:34:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRgKeMoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ky0Kh-0001kN-FO
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 17:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ky0KE-0001jb-1v
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 17:33:42 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ky0KC-0005GK-2A
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 17:33:41 -0500
Received: by mail-pj1-x1031.google.com with SMTP id m5so6988031pjv.5
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 14:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0hER6CK+Qtb8Bjy/Ktns56cKHbxMqNzSvuPBlZa/m2g=;
 b=lRgKeMoQxf1w+CpNs6J7qf+2YIQsNq0DcBXf6uKWsLR4pVyH+LRIGSVJkFV15LxVHC
 Ehkm86CHSviIW9AGi4x2lxDFknpLhLqdsCX+PI4LoUQ4v7WKnZDd4JplUhpTPIlNs765
 9BktfK0Oyc0wR70brDPFwf+eFeBFbNgdbhN77rcwGdTmH4mCc4bLeqT1yMpm51epJUFx
 lDIpoUgmbCTL8Nlsmix+e1RpWgq7Gdx0Ch74ajRDAVHH+phJ4kP+5gVmHEOsQTvcSSIm
 nASKxD/5OSYKu6Q5SB9RZDtthmo6uccx9evyRXDgaIpBdbkxJInH+J9d+V26+a6ess0z
 Csig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0hER6CK+Qtb8Bjy/Ktns56cKHbxMqNzSvuPBlZa/m2g=;
 b=S9U1Th+q9KzQD3LNfda4pBWc+dpK0KGXnHmvFEzJxAwaP2GnOmFoX5TvGx88n7GGf3
 cpmC6toc4+XtEfshqRLl692ytS+dftqLxP8pxEcLli4vv1yLQW5zoJUoRvivrk4Hbhr4
 EkoTJf+xi1LdACIiv8cHyr/gKRS2Lv6VRd5+0bKBsFZmQwL2DqrKINyBTzmPWFlNFgtt
 pLSDVj8I7R7Sw3Mqx6Luvfx1tVyw2B8ERbDVtUd4jpQwui3nI6ToRC15lQYXSXeHdYZc
 lBOKTKIERUj5/nCD1Mr1O39m08IzMAEt7Z3eOa0NTMmg5I9aZYRSgpaAcMi74KbpRFHs
 6IUA==
X-Gm-Message-State: AOAM532zCrQCgRO2bZ2U3mEz72rB+BtP1DuBqOs/iIrg7dg0OTINoAL9
 2eV1i8RQVtwBRkS2t42tQG1QXkpKXqMw+g==
X-Received: by 2002:a17:902:9896:b029:dc:3306:8aa7 with SMTP id
 s22-20020a1709029896b02900dc33068aa7mr9165927plp.6.1610145218302; 
 Fri, 08 Jan 2021 14:33:38 -0800 (PST)
Received: from [10.25.18.7] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id x1sm11171526pgj.37.2021.01.08.14.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 14:33:37 -0800 (PST)
Subject: Re: [PATCH v3 3/6] target/arm: make ARMCPU.ctr 64-bit
To: Leif Lindholm <leif@nuviainc.com>, qemu-devel@nongnu.org
References: <20210108185154.8108-1-leif@nuviainc.com>
 <20210108185154.8108-4-leif@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49ed5e5a-411d-2947-40d7-844554770519@linaro.org>
Date: Fri, 8 Jan 2021 12:33:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108185154.8108-4-leif@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.241,
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xklRMattn4c2

On 1/8/21 8:51 AM, Leif Lindholm wrote:
> When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
> TminLine field in bits [37:32].
> Extend the ctr field to be able to hold this context.
> 
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

