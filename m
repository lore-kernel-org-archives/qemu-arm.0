Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C162A606A31E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i1u5XOVY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWwLx-0001L5-S9; Fri, 27 Nov 2026 08:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWwLw-0001Hx-Af
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 08:51:04 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWwLu-0001lt-Ff
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 08:51:03 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-67bee1f693bso6312291d50.1
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 05:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795787461; cv=none;
 d=google.com; s=arc-20260327;
 b=M8jcRkdSxPo7aBusa6+CAatgUcGPtK0QD2idd7Xqtd8MxYCAYfMB3UqsQTKwz69aI4
 /N60cm43PR00uckcoyguapsEcEXlvhkRH8E7FFN3tTSGkFjPCHbYoPkwNeRphrvkqmN+
 L6ORFDBNsAZq/i90aBKRg1mWtYv7t19I//02pDmJcrnIxckAIvo0a3nW8pSbjg/OMENB
 MQsA4A9WJImCajz+jBbRux2NoeUjDxfEaERuCaaepCLqbJUVrM4SPn3BcUJE87U/uRWN
 H2lVHHJJUCF1Nuwo/5VaGI/pueVCA7VHMHnexVM39DHNtOKhL8JtHqfjuSC3PB4QZ2r4
 C8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=yWmYTTgYAAv4tYcLeqHqnQmFB7yGxhcFhP3aXN7ZeeI=;
 fh=IZMRvqvCTcZuBLdyL8vYTE2dbKTN2FJgNg0fowBYsuo=;
 b=rDP6vHr49vK4jvRFj6yTYUPQKT14h/qxRUnxmu/h5TaGYSPDqyEy0ALgeqeZz1jeKB
 uWz2ZjPxoe4yBItCAkvG7uOfuwOKr9cPijli/X3xKq96GmWFdQH+oQEOzv9Tr619OcQ2
 U9gToiKQniXgmRjyzLs8uFSnQ3hM0L8pKQA4R2eeipL4hJhlQ1BHGefBo9ZcbSctyf94
 kYHWwzLZYp+3qAJWjk41QZBe+FF5htfQWDKBCxrBjPRqshMe1Vf8XoE+DcbGgpetDrXb
 qEhiqiWYiHcQNorRvaojLRu0VQ5aONwPe6dGumhqwpt6Ze0kKXuE1qoWETCmA8VdT9y+
 HkBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795787461; x=1796392261; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=yWmYTTgYAAv4tYcLeqHqnQmFB7yGxhcFhP3aXN7ZeeI=;
 b=i1u5XOVY0jMHqZ1Prp4iGY0uz00OzEVbxyF7mXBCMNYzs5ZNTFDunaRaQ1xZ1iPWjp
 eiePe+LRnWnuZfEfB14jOPChdPOUkPZ7udgMZbASZbjWnj5edseSDyiUoTfFHBsuvfcs
 8kHOSQu1ak0SxdlES4fYYMNmKL8Wa+UHHcHlHNqsccZfhexq4ee1ym7K9kyY6R9/l7zW
 nrZ/gX/YU+Cc4CLNPFhMpG0SNuhUmNeqQKBj93NrD2ySN42QZVJtXQpM+jUzCTWBP2KD
 dRHWXANXX8c27Z9Ijj8/rl1gxVMU/oCqnADuvuU56ZhRni2Xk4Fex0HjYFBpWgrkb0yj
 Z/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795787461; x=1796392261;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=yWmYTTgYAAv4tYcLeqHqnQmFB7yGxhcFhP3aXN7ZeeI=;
 b=SBlLlowCu/A8MnTWnRoJziAdjgx7JmR6SarZbCHp4JbwLuOrHT5A1MCAsoy6g3DFBV
 ksEWzz8LL6rGpR9OeDsuNKF/ktWkhKrS3kNrlVk/3X3z5oXmafuTYlfEs1X55bObSek5
 8L5GM0jCru162WzCwt67169Y8dhgZTCduhLjl2kWUYN2Sj454LybnRRYyqW12GxOt+5K
 9ZBRrSjIhDhEK9i4Macae9PRQjdNcGuNJvOSi9HSvTDvzFnqYL8iEE+PzepGZBPzoFo7
 bFyXbXi/hdRDoFOyhaQ96RrkPtRb2pdA1dSbTSvF6/dfSw7J7yuAzk3GPUQbJaSff8sX
 Kevg==
X-Forwarded-Encrypted: i=1;
 AL+hErFiBmuAKdY2+YnOoF493lEfzNXnKprdVa5hBC2NE7z3anIFaBhulFQkippRYpzb3lUdbFT0zxjf0g==@nongnu.org
X-Gm-Message-State: APuU4Z+Uvf/Ww95trBddf3Qp3wwdmBSJGJ6u3OphxWX39HDDZFdDP5GQ
 PJduC0s2ChWvgDxKv0IPuvE2XcNmoctXqTEKlZ7M3/+Usbf9LZENFPqvV0BrknG2EwX0S6c14Xf
 ord4k4yznEjfCezrDVz9LcOmDc3lcIl4EGa5bU59HPA==
X-Gm-Gg: AZFdTZcVdIwy5j7/5yD+w3CTZVAWjoyF4xbmnjV98nAMGWdi8gWitoR9Jz2t6L3mhmE
 k3VTOQCyN1X7K5s0Zsyeqf5HkH3TDqVxl8UCRWw0ZWy2O5HgsP9ebp2v1QMbdWNtBF7Xs4awbBX
 uk4qudozUH1+UVtRMzlKkCEIQWHT7x3xD+49KRuh22kZHA+D5RP3HURJ1TAILS81voAC2dxDpb4
 T+6Bu/PhzA5BBwpXzaQbi5NKtaaPhJ4y/TslSH/lA9pwQ2fPmPBYzcukgKE1GE6eMX1IDMP5TIW
 hUlTD7B09uPzjQhOwd+no6HNqA65qlM+oU2KaxtiMkGIU3nU4TOlZTjlXXPu6v6Gt865xSI+XJR
 2gk8IIW1WxqFHf0gtfIQwi1b7Xg4FOU4n7WqsLfOblsU2/P3wDzHXx65RlyTs/8EJZHN1P5qiTg
 t+xArbgji8tmPu5SQbH65c
X-Received: by 2002:a05:690e:1918:b0:67d:bedd:4939 with SMTP id
 956f58d0204a3-67df42b4d63mr13092270d50.5.1795787460859; Fri, 27 Nov 2026
 05:51:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126231631.3392756-1-peterx@redhat.com>
 <20261126231631.3392756-9-peterx@redhat.com>
 <87pkvqqtlm.fsf@suse.de>
In-Reply-To: <87pkvqqtlm.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2026 13:50:49 +0000
X-Gm-Features: Aa3M54qR64LBYNeWkubydr5Cue5eVlmHIL17yF2c625C2iQPfhFMpF-vh01h_-g
Message-ID: <CAFEAcA_By1BDLuZKaSVyKKwefe2KBaTf_4+tHMu_AORxOpWp7A@mail.gmail.com>
Subject: Re: [PATCH for-12.0 v2 8/9] arm/machine: Move all VMSTATE_VALIDATE()
 usages into post_load
To: Fabiano Rosas <farosas@suse.de>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, 
 Juraj Marcin <jmarcin@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 27 Nov 2026 at 13:42, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Xu <peterx@redhat.com> writes:
>
> > To pave way removing VMSTATE_VALIDATE(), move all four such uses into a
> > post_load hook instead.

> > @@ -1177,11 +1128,48 @@ static bool cpu_post_load(void *opaque, int version_id, Error **errp)
> >      ARMCPU *cpu = opaque;
> >      CPUARMState *env = &cpu->env;
> >      bool ignore_s_regs;
> > +    bool valid;
> >      int i, v;
> >
> >      trace_cpu_post_load(cpu->cpreg_vmstate_array_len,
> >                          cpu->cpreg_array_len);
> >
> > +    if (env->v7m.csselr[M_REG_NS] > R_V7M_CSSELR_INDEX_MASK ||
> > +        env->v7m.csselr[M_REG_S] > R_V7M_CSSELR_INDEX_MASK) {
> > +        error_setg(errp, "CSSELR is invalid");
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * Check MPU_RNR in-bounds. If no MPU, we still migrate these fields
> > +     * but number of regions == 0 and MPU_RNR is RAZ/WI so also 0
> > +     */
> > +    valid = env->pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion ||
> > +        (cpu->pmsav7_dregion == 0 && env->pmsav7.rnr[M_REG_NS] == 0);
> > +    if (!valid) {

I'm not really a fan of this use of an intermediate bool, especially
with a generic name like "valid" and that we reuse later. Either
the condition is simple enough to do inline in the if(), or else
it's complicated enough to factor out into a function. I would
just put the condition in the if().

> > +        error_setg(errp, "rgnr is invalid");
> > +        return false;
> > +    }
> > +
> > +    valid = env->pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
> > +        (cpu->pmsav7_dregion == 0 && env->pmsav7.rnr[M_REG_S] == 0);
> > +    if (!valid) {
> > +        error_setg(errp, "secure MPU_RNR is invalid");
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * Check SAU_RNR in-bounds. If no SAU regions are implemented,
> > +     * we still migrate this field, but number of regions == 0 and
> > +     * SAU_RNR is RAZ/WI so also 0
> > +     */
> > +    valid = env->sau.rnr < cpu->sau_sregion ||
> > +        (cpu->sau_sregion == 0 && env->sau.rnr == 0);
> > +    if (!valid) {
> > +        error_setg(errp, "SAU_RNR is invalid");
> > +        return false;
> > +    }
>
> Shouldn't you guard these blocks with the result of what .needed would
> have returned on the source? Otherwise we may not migrate a value but
> still try to validate it here? I haven't checked if the unmigrated field
> may end up with a value that will cause these checks to pass.

They're OK because the reset values (zeroes) pass the checks.

We could rearrange them a bit into

   if (arm_feature(env, ARM_FEATURE_M)) {
      [csselr check]
      [sau.rnr check]
   }

   if (env->pmsav7_dregion != 0) {
       [pmsav7.rnr checks]
   } else {
       check rnr[M_REG_NS] and rnr[M_REG_S] both 0
   }

I don't particularly have a strong opinion either way.

-- PMM

