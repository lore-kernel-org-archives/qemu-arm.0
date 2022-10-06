Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp519185ocb;
        Thu, 6 Oct 2022 07:28:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cM8DUjyzSJ2/dsq04euQfBQJtz4bg4TBMlLBtv9VNkKmnVCOct5mxPOY087CClSfwHuTF
X-Received: by 2002:a05:6214:2342:b0:473:bcd6:a3b7 with SMTP id hu2-20020a056214234200b00473bcd6a3b7mr4332032qvb.88.1665066499533;
        Thu, 06 Oct 2022 07:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665066499; cv=none;
        d=google.com; s=arc-20160816;
        b=RgRuq/M6HT98wy5qkMsnec5CldJvtJYHLFSMJ0NBhOJTm38uApnO3z9EMcpSfCRtJw
         K/8McPoyXKIdIww6EPq5D+OD7DAgfOoI0dATZNM6CqFqXITj42OBYd1m88j3ffsh1+U3
         dJdiHB2HEZqKUrKJeTXWoiOPOizlJD7oCpsbt4wdBQDMpJUtJ9GifdtTjA88gZUvogen
         nQnNObCmvI/PhRWhl4z3LcP5u9DTxSeJiVcI8P5V+PyYm1Z2UDuJNYAzs7HYUPHgwyWJ
         4Dl6xySyYlJW4lgXZ1lbF/aeKvN1Imz/evGj6fYBff23j7aidfgPYCvSQE/VF7Pw701N
         3LEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Kou65FK16ZFMmDAf8FfmX9E/o5JrpateFvs8B/giFAk=;
        b=BkB/mNuuU79sZDqmvZuufhGREMAxZlGBPMj30ekQPKPAc1mLyJLdIOfhbdzz732ZQI
         w4S5jM/kkhDraP0YGZ+Ryz0PHIeuPYzl6YUmMeVkeTjFerp07znlBoUrXj4PZlzaUvGo
         WMi4HYd5G+0he+9nf2AmBqSIa4pDV4xvUm/SrNrdKjju1smhjg5jEMYbnDpljebGS2Iv
         tmxJe4iucRFnxpFkf37aaU6daoSlruOQ4YoVFUwalO2+MinA0bc1eV5McbZpuSkPmlKG
         +ZQ/3CJnQnlXTGjAzcP/NxkSIGH6xv8ZGEcaINrVPw9T9yTy4dh0ABzjWAEKsErwWtGQ
         s5TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hv9S3bq6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020ad45ca9000000b004b17f9650f6si3421248qvh.486.2022.10.06.07.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 07:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hv9S3bq6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogRrH-0003ie-4e
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 10:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRqm-0003hd-1q
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:27:48 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRqj-0006II-BV
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:27:47 -0400
Received: by mail-pg1-x529.google.com with SMTP id b5so2022877pgb.6
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kou65FK16ZFMmDAf8FfmX9E/o5JrpateFvs8B/giFAk=;
 b=Hv9S3bq6uKbYkPHcVnW/L+SL+Bmp1URGjAPRHaYPfaGIJIvmR8MX8z7vWTC+NCjfnn
 4qOGn0FOuRu4g1aE7P4n9CXwxTZXkO6+pQHEfCL6Nmplv6u1el4B8JIhIv25ueB4X5WS
 RAArpw2/Ixi5YXaiAeeH9mioFRntkwhqU4WDMlyGtMVj+wzNidOqUPz579zmLCl1/nE0
 fjgBbJxzrJyxuGKqJQCYncCcdRHL2RqPBmBC4fPtFSEWFCUM7QedQN7HyrsCRgHsVgpV
 +qmGvSF+jjzm/1a6hLahfYJdZQ279Kif69N3NndabDShY/s15pWLxC6t6xrCcMLnWlIP
 R9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kou65FK16ZFMmDAf8FfmX9E/o5JrpateFvs8B/giFAk=;
 b=k9fBNhLNZtWxiQ4e9DjBI/S6XwzrytXTUPUxtYAAQEUFiN8i7HW7UzgFAkY7Exnb+n
 tBJolOfqX4p6kyv1zmtVOcq9541zn1yeAGQAtTY+PwhGIlxHPsJaEUuT3IUach6LWzqi
 BdCdg+UHCn7IA4b8zk1wz5l94qs7DDWtse2bdnHA3TS1ClB8UV1u9CEJaE3liPL9/DV9
 v3hOWpV0FHnWuus3vWe/fWC7ZluJBLPyf6+w3KQMONq0QtulMEQcDQYMb7RdegqeFjrt
 asexWSYKmLrnZujmKC3SJ0tetRbZ9NiSCbYnzvTRf+j8YnZIM9Tcw6aem45DF5yu6uUi
 tifg==
X-Gm-Message-State: ACrzQf3+Vn+eUv+DpHXtDcar2jZvSt61wVJn+sRx/BWfSe+5ef8sILKH
 mPyZFAiSqTbWJUpM5sXgrzmHoZnFfYUPbaLk70FmkA==
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr204284pfa.3.1665066463055; Thu, 06 Oct
 2022 07:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:27:31 +0100
Message-ID: <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PNWKuBMo20HS

On Sat, 1 Oct 2022 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The starting security state comes with the translation regime,
> not the current state of arm_is_secure_below_el3().
>
> Create a new local variable, s2walk_secure, which does not need
> to be written back to result->attrs.secure -- we compute that
> value later, after the S2 walk is complete.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Do not modify ipa_secure, per review.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I did find myself wondering if we should explicitly set
  result->attrs.secure = false;
in an else-branch of the last "if (is_secure)", though.
At the moment we rely on get_phys_addr_lpae() for the stage2
doing that for us, I think. Having the code here always set
result->attrs.secure before the 'return 0' avoids having to think
about that...

thanks
-- PMM
