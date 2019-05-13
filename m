Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2956586wrg;
        Mon, 13 May 2019 08:37:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJNYXL6i4EfKIPoVehnvzByvo9vuAV1Nwgxfsrv0k9/q8lXepCscrsd+1z+7oUOFMy9K5e
X-Received: by 2002:a37:b484:: with SMTP id d126mr22618150qkf.342.1557761832349;
        Mon, 13 May 2019 08:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557761832; cv=none;
        d=google.com; s=arc-20160816;
        b=lZGQbiHnnu44qq6KMadjQsPc8MRkSbcC25TDM5L2gCOmU8fupAMUJuD7bAMUV+/in9
         pfefaLQWDVzmYECM2n+gXxZ0y2ajTWUct0L3NJMWduy36/RQkkeBELyaIYoMuTxu9Acp
         0PvGpS5iAVTKkJY4qYYCJw2VW5vd9atjRlJ3poCy5ATfCRKmYTPzawWCsDZRefUOXpu0
         kN8iEyikFWgxJqgm5WYyWsMe6E74JG2chL9O9HJ4fnnDGg5Ra+2NNu1NfiQKsGR1sBUB
         AkchERdHWLg8khR+kMmeX8djug+RdWvjpqoGQEdkXonLaLGritAO3h8Sa0AIz4yUb/55
         j/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from;
        bh=5YqSeQN30L4C9rnGua2KlrUKtvSFKwP1ZBMdE4iCSjI=;
        b=heAvfSCnwj762IsAdIWXBd31dpZDjdrmxX28lo2xVy0oQ/SOm2x9Wof8G4hpiCxXUA
         IspMSQE9n/UVsXUgAIyRJ+2Ko/9oGGy8h1Fq1VyjMqoawY+CPgP67LM7HHWfZo6lfGqQ
         21n1zRMwJPZqfvPuFjSwKkfefl19CancqFvd8+aNd3dthd8TzBtgff5niw53gCl9mSd0
         s9bazeoHb4Ea0ESykRF8dZpJ1DkzVrP4PyxKqIzQk9CV6ZFSTXXzJc4S9yqwzbRSPLjv
         mlwpn/Mk1DcS4zcu/R0OOTZJ/1CuD8Am0Txo6aoLNHKPW1qBuaT+yAEEUljPeBk1zYcF
         2GUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t7si13247qtp.60.2019.05.13.08.37.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 08:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67AD6309266D;
	Mon, 13 May 2019 15:37:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com [10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BBEA60C4D;
	Mon, 13 May 2019 15:37:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9B99B11385E4; Mon, 13 May 2019 17:37:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  peter.maydell@linaro.org,  richard.henderson@linaro.org,  abologna@redhat.com,  alex.bennee@linaro.org,  Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 13/13] target/arm/kvm: host cpu: Add support for sve-vls-map
References: <20190512083624.8916-1-drjones@redhat.com>
	<20190512083624.8916-14-drjones@redhat.com>
Date: Mon, 13 May 2019 17:37:09 +0200
In-Reply-To: <20190512083624.8916-14-drjones@redhat.com> (Andrew Jones's
	message of "Sun, 12 May 2019 10:36:24 +0200")
Message-ID: <87tvdye57e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 13 May 2019 15:37:11 +0000 (UTC)
X-TUID: Zc09KIWDTf/u

Andrew Jones <drjones@redhat.com> writes:

> Allow the host cpu type to enable SVE in guests with the sve-vls-map
> cpu property.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.c   |  1 +
>  target/arm/cpu.h   |  2 ++
>  target/arm/cpu64.c | 12 +++++++++---
>  3 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ea0e24bba8b6..a5c01ff42c78 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2222,6 +2222,7 @@ static void arm_host_initfn(Object *obj)
>      ARMCPU *cpu =3D ARM_CPU(obj);
>=20=20
>      kvm_arm_set_cpu_features_from_host(cpu);
> +    aarch64_add_sve_vls_map_property(obj);
>      arm_cpu_post_init(obj);
>  }
>=20=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index f0d0ce759ba8..13731ccb39f3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -976,11 +976,13 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, u=
int8_t *buf, int reg);
>  void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>  void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                             int new_el, bool el0_a64);
> +void aarch64_add_sve_vls_map_property(Object *obj);
>  #else
>  static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) =
{ }
>  static inline void aarch64_sve_change_el(CPUARMState *env, int o,
>                                           int n, bool a)
>  { }
> +void aarch64_add_sve_vls_map_property(Object *obj) { }

qemu/target/arm/cpu.h:985:6: error: no previous prototype for =E2=80=98aarc=
h64_add_sve_vls_map_property=E2=80=99 [-Werror=3Dmissing-prototypes]
 void aarch64_add_sve_vls_map_property(Object *obj) { }
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Did you forget static inline?

>  #endif
>=20=20
>  target_ulong do_arm_semihosting(CPUARMState *env);
[...]
