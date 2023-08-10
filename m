Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp678543ejc;
        Thu, 10 Aug 2023 06:36:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Bi97ueuFfaptBoZlH24M6w2gOAwRw18VKtBgDzh50BSMhOGT0FgnDk7nwQViozDFdSn7
X-Received: by 2002:a05:6830:1094:b0:6b9:a84a:a381 with SMTP id y20-20020a056830109400b006b9a84aa381mr2163959oto.36.1691674597877;
        Thu, 10 Aug 2023 06:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691674597; cv=none;
        d=google.com; s=arc-20160816;
        b=qALCSfpMAY9Ikh0FOJBqsyh0jZdsGFHmmXYqDqFBD3viEFElGi2ZIdX+Mg3KpKVN4u
         XVBD5WRyVP+XMhcYD0vTxRdd1+8n1Gj3dLLAnaG1ziM+f+SD/TjoQTWNnKOBDA+HQR88
         xJ+q2p1tlaOjDv4R8iJmDX8nB/Lsv1Mkf8Usb4zklHtbbNxaNkQ30NKiT6MRrLXIbThf
         uFE6Ak212DeJNtKa51BOX2+R7Yd3lk1uyNRyCwDitTx7dtxyPf2NImkoA52jFMrATc4H
         WtF8XriSaY7krb2uXsedroXH1byIlo+jQOOiLLTmjaNa5qQDlo9pt822M4oiX/pxGWDx
         z9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ic48J12nNu44lj9Tz3lBcwTgbHsJI730JOJ/unsLydE=;
        fh=AUWhDBBcQJl/cpkEHjYZxji9DdAuAu9jPeTYApU/3e0=;
        b=FjfZdf7r2sIJqCXisT6keO0QtmMEBZBeCLuQ0DdQO7tFVQeRLKfOAaGVL5wbcMWxc0
         Rs/vB2KFPmwgHBiiOSRksoUaN0aIZoHPVt5UyTb1QLhPmNfEfTMQTU/63s6g3nrTxpaf
         fhIgyQkdAmXpFU4pt11lCH4EAFkkCAUxlGMPb6PfL1yIp4ZfvxS1cILZZSKrD7s2SsdD
         UPluuOY/kbOIpKqeomzscuFlKdBW5wfSgWYIjzEi3o8OWfQHCiCgR/TpZWzv+I5E2dZv
         wb3LJcyOwfo0kgZMjaWct7c96S/ZD6WIaRlkziZWoG4grkbmuf/VRZLNaaHjmGmiYVQK
         FiYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t4uAKePz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020ac87f88000000b0040fddae7b20si913358qtj.663.2023.08.10.06.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 06:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t4uAKePz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU5q0-0001tp-Ry; Thu, 10 Aug 2023 09:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qU5pz-0001ql-ST
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 09:36:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qU5py-0003gb-Cd
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 09:36:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-317f1c480eeso875852f8f.2
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 06:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691674584; x=1692279384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ic48J12nNu44lj9Tz3lBcwTgbHsJI730JOJ/unsLydE=;
 b=t4uAKePzxy5tmj6pulAkS9DvdT/GXdQTjErr+/G3QWToNRkrRmrafhGrkWd6egJk9V
 FegkXfnsfjxH1MDTiSRn5ucCi+f64MevNwstt2v5Jrv1yUK3NaHI82OJY6QCcbcJPQfQ
 mJaRRGgAEeU2N6ti5uKByWTiv/qn1eL4ORfIH+WnWzXYTKg6rHzGqTW1Q7IcV5AxtFrW
 9BF6j/aiziNqm52h9MKfcsp0k5Nlq2fFsIm+HxjxF/P754RVeIb2xKwBHtB4aLyn8H0P
 0wEXS+zZ7IpefBRRus76Ee6bCRvbtPtnhfOOIEmsZYQ5FuRF4ibUkX9s9G9OZS0ad86H
 gx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691674584; x=1692279384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ic48J12nNu44lj9Tz3lBcwTgbHsJI730JOJ/unsLydE=;
 b=N8qZ4jExOQtoVGgkkqhWf9GgAp4WgWcwGPTtqVRxTQn7NcpII0zbuhj/DzrXRTulmv
 njDRH0sHH8yhYnbgYVooT8Cq5xdDeD3nBV0+wQt93he1fpDAy295Ut80mt4C9/Wp86LL
 CumEF8UhfZyZ631+zx5wxw4/HjZCdnHe4S+vtz6CqZzQvOldvIFa0sib5RvAZ6oLhHG/
 Hd+efBSeUtfvlNL2QbYfoswe354UfVrbjrLjBAM44/VxpsKz3EMVcGvfgblMx6Jp8OjX
 kg2+GAD1QJbIrSuX+scfh/AwxcdZ/Y43xuGRsNmn/anPNYQ+T8WRBVNtIbk0ROacBKqO
 g6rg==
X-Gm-Message-State: AOJu0YwxLFOLgSldBPIEz3QIb62k5XrKHiY4lEu5+JE0d3TgYPQYyREa
 p1P1lCxURUaIWDh4qZAYy1hgkg==
X-Received: by 2002:adf:edc4:0:b0:313:e48a:d173 with SMTP id
 v4-20020adfedc4000000b00313e48ad173mr1965589wro.68.1691674584256; 
 Thu, 10 Aug 2023 06:36:24 -0700 (PDT)
Received: from myrica ([2.219.138.198]) by smtp.gmail.com with ESMTPSA id
 t15-20020a7bc3cf000000b003fe601a7d46sm5093191wmj.45.2023.08.10.06.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 06:36:23 -0700 (PDT)
Date: Thu, 10 Aug 2023 14:36:23 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/6] target/arm: Fixes for RME
Message-ID: <20230810133623.GA2050932@myrica>
References: <20230809123706.1842548-1-jean-philippe@linaro.org>
 <CAFEAcA8wh35V4ivo2cMP6zUGgCDi6t9-AHS0FVfeLThvjHtV9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8wh35V4ivo2cMP6zUGgCDi6t9-AHS0FVfeLThvjHtV9A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: DTghaR8NeDm3

On Thu, Aug 10, 2023 at 02:16:56PM +0100, Peter Maydell wrote:
> This didn't build for the linux-user targets. I squashed
> this into patch 6:
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7df1f7600b1..d906d2b1caa 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2169,9 +2169,11 @@ static void arm_cpu_realizefn(DeviceState *dev,
> Error **errp)
>          set_feature(env, ARM_FEATURE_VBAR);
>      }
> 
> -    if (cpu_isar_feature(aa64_rme, cpu)) {
> +#ifndef CONFIG_USER_ONLY
> +    if (tcg_enabled() && cpu_isar_feature(aa64_rme, cpu)) {
>          arm_register_el_change_hook(cpu, &gt_rme_post_el_change, 0);
>      }
> +#endif
> 
>      register_cp_regs_for_features(cpu);
>      arm_cpu_register_gdb_regs_for_features(cpu);
> 
> With that, I've applied the series to target-arm-for-8.2.

Thank you, sorry about the build error, I'll add linux-user to my tests

Thanks,
Jean

