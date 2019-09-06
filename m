Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp353634wrp;
        Fri, 6 Sep 2019 00:13:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsZ17zAVIYD2tBpnTmrDeQA+Wa3Tt6RNKNFwMl88QdTEYS97Uhe3JXhBjSW/TmK5PYz3tZ
X-Received: by 2002:a37:8182:: with SMTP id c124mr5691289qkd.399.1567754004806;
        Fri, 06 Sep 2019 00:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567754004; cv=none;
        d=google.com; s=arc-20160816;
        b=Sw6+oJFKDoZtf2uroRcxFoi2/0RKCno4ji3aBSz3LQblKHHugDtzn3BZ7p86F0jVUT
         UOvJ/oZ3OsKwE1k06OIaA9dPBKOflL9kb58ilH67v0DEwXGjOMdEZJJiPBFUis3HQz/N
         wJEIkMQstubJV0utb2AaJsbFJY2mEaCWTiEooOLiGiS92b/OT/z3tlZfSqwrA881Ty29
         nJk0HOmiMF94xtlWQwwtXAX1CjBR+q92A3MKsLgbXTMEepItOMYnWSwoTt/RmKHfzwxI
         d8cmm4uThmN+e0EJYLmcNJ2yGWf7sE0Ylq5LStYrtkZ9Xg+Ipk1Han86S/06PhP3fGCa
         c5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=eMuX04htSFWPG4/wWgmsVZpIfP+FolGwUWotANMeF1k=;
        b=NNdp7xbn0+/5JJBBHqHC126fc+bLnJvYu9rLjsN1GFS7ygOxiqOZM1naDeisDsY/hr
         +lfl0OSUn+J826eEf0LcAfoClzy3lFNJ47dxdUesT7pLMghR6ZjRVI+y9aEGv6LZ+/lk
         yhPYPHpyxgJ5GboFbze4dNIXXlVZp6Asv84dfbmZsJBxJ2Mr15fktNHId+cI4sath7JJ
         3M3fpFPr+tMxYIUWGuLPqxoX+2VmLsKYBHyF7uEFDiHH3bFVHHN9hx6pCFAOTpXCL1n5
         Eg3Yy5wFNcSO1H1KWhHgF9IEJEEfRxfRbV/iOHO14Qfv3sv2VBcNd7pn8kPLIiDNAdH2
         tNvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si3195243qti.196.2019.09.06.00.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2019 00:13:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i68Qu-0002X7-6P
	for alex.bennee@linaro.org; Fri, 06 Sep 2019 03:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i68QC-0002HT-Nh
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 03:12:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i68QA-0002Gp-Go
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 03:12:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58668)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i68Q9-0002F1-Pv
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 03:12:37 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6B2553CA19
 for <qemu-arm@nongnu.org>; Fri,  6 Sep 2019 07:12:36 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id l6so2150340wrn.2
 for <qemu-arm@nongnu.org>; Fri, 06 Sep 2019 00:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mhXslH6Gl7tShrdPUShkvmnSfBFhj7bvIKzrVxJAIIE=;
 b=GzCTBYuIaTVnC5KbqfOqLY0nF7mdnJo0YSCOiQQa567pMEbyqTF0T5xVvR3nY/yFpm
 sEpxsPbfzSyQXRYuOaPiF4c+7eIluwzkTtY8mVKZYxp1kxTlzNEFsLO4EGPUFSz0B5CZ
 0SngpTBl1eSAGlQdyTG6+17fUL9bngZ3WXlPrybnwzClBiXt9yKVoTZoZ6Sp7QPQpM9Z
 nzjO9YJL4n8+pV4WH91cAQljy5imu4lfNjAwA0rx2nVLIPG7I7dGi3ZITAzOGY0bsCW5
 78Q9nY7mOsz8ZHjRSMzsXoiWCFhfpcZSChSNWSiLjIkMRNIttJuJtp4Wwxu6xYKW7KUJ
 gQtA==
X-Gm-Message-State: APjAAAUUdOiyHFIDHMwRy35/EirjhM7I3SpQ3IDUNMB4GaCe2zYUE9aT
 wfxodpM/3k09qM1DkNt7XHsOlVocoUt5ynsvk1LGxAIPu8Y5jfOOpdxC3GRIoSbWucwB338Ipdq
 TSyyQWjLjrrO/
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr6198607wmd.104.1567753955060; 
 Fri, 06 Sep 2019 00:12:35 -0700 (PDT)
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr6198587wmd.104.1567753954786; 
 Fri, 06 Sep 2019 00:12:34 -0700 (PDT)
Received: from [192.168.1.48] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id b144sm4735801wmb.3.2019.09.06.00.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 00:12:34 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <20190820210720.18976-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9c3d3506-ca1a-2bc9-174e-d981d3e067b5@redhat.com>
Date: Fri, 6 Sep 2019 09:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190820210720.18976-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 13/17] target/arm: Split out
 arm_mmu_idx_el
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yhyfWJpU27pF

On 8/20/19 11:07 PM, Richard Henderson wrote:
> Avoid calling arm_current_el() twice.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  target/arm/internals.h |  9 +++++++++
>  target/arm/helper.c    | 12 +++++++-----
>  2 files changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 232d963875..f5313dd3d4 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -949,6 +949,15 @@ void arm_cpu_update_virq(ARMCPU *cpu);
>   */
>  void arm_cpu_update_vfiq(ARMCPU *cpu);
> =20
> +/**
> + * arm_mmu_idx_el:
> + * @env: The cpu environment
> + * @el: The EL to use.
> + *
> + * Return the full ARMMMUIdx for the translation regime for EL.
> + */
> +ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el);
> +
>  /**
>   * arm_mmu_idx:
>   * @env: The cpu environment
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 83ae33dae5..19bdb9b9d6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10988,15 +10988,12 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARM=
State *env, bool secstate)
>  }
>  #endif
> =20
> -ARMMMUIdx arm_mmu_idx(CPUARMState *env)
> +ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
>  {
> -    int el;
> -
>      if (arm_feature(env, ARM_FEATURE_M)) {
>          return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
>      }
> =20
> -    el =3D arm_current_el(env);
>      if (el < 2 && arm_is_secure_below_el3(env)) {
>          return ARMMMUIdx_S1SE0 + el;
>      } else {
> @@ -11004,6 +11001,11 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
>      }
>  }
> =20
> +ARMMMUIdx arm_mmu_idx(CPUARMState *env)
> +{
> +    return arm_mmu_idx_el(env, arm_current_el(env));
> +}
> +
>  int cpu_mmu_index(CPUARMState *env, bool ifetch)
>  {
>      return arm_to_core_mmu_idx(arm_mmu_idx(env));
> @@ -11164,7 +11166,7 @@ static uint32_t rebuild_hflags_internal(CPUARMS=
tate *env)
>  {
>      int el =3D arm_current_el(env);
>      int fp_el =3D fp_exception_el(env, el);
> -    ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
> +    ARMMMUIdx mmu_idx =3D arm_mmu_idx_el(env, el);
> =20
>      if (is_a64(env)) {
>          return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
>=20
