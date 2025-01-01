Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9190421njk;
        Wed, 1 Jan 2025 11:34:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEh0JhNdeHDGNFtoTWLD31fs3kXUx9VIQ4he8TxoHoqls+gQLyzZQiEVrT1IQ/9QvI20IxxjnwabH/4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHkoVfdfxtasQwOlD+2tFC0BSlgnUpXdfxZAO0gsuyHs8JRi5eeXZtYzjgqD0Nh6vi0i6Ae
X-Received: by 2002:ac8:7f0f:0:b0:463:5eb4:6f with SMTP id d75a77b69052e-46a4a9b722amr677356941cf.47.1735760094821;
        Wed, 01 Jan 2025 11:34:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735760094; cv=none;
        d=google.com; s=arc-20240605;
        b=iR0QVZu4XP0VFqoj8YhbMpbsNhi2E9oV1UNssPapLnAZkD08I0QEt1bbJdvA1l/Mmc
         lRrfT6XvwrsNI5qlnlc/TS9tDs1Wf04Env/DQvnrveVIqszHTZbtiBOm2rtZvegx/4ep
         vQ3BeAyN8mUQgQf+XkUQSoFWAgT6LE/PlM0wUbrBmNXDdLt5UIm0yDZD0jE5yhM/0FSP
         tLxhH+TmpFn+vJOz7KA9FoeQd9pquiX0S80LDydS34Jmgh4elOA/4GF9gcpGt9Lskoi9
         FSAtd8UYSRupBYq8N2OU1EXjmqjqPvYQVOlvF838upzaVMFGmDVQxCiP6F2ezct7U8xk
         1LAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=DfK1v4tmS9NYvxobN0aIXX9j+DTkUI3+ka1LIytdvKA=;
        fh=thQZ+CJtNXqqGklWA72DL9lDY7h2Qs59qoEe5VvrW60=;
        b=G45I9qKVEgTQyy2Ks4hmS5DOv5zDafH84FdLcMb7OPtXjwwb+L6McS7Pr/TmpKnXma
         UwVhGi3ce9Lb3uR0MvBtjIPP98P//E80Po9/4Snh/c9AkYGgFoUB/SoGnXODUlXf8d83
         EayvoUUBt5ac/MDWyKBQKTlMEc2G82+uB5JHw21EOs1PL8c1v+hKMtpYRmoXV/9gF+7s
         CsXtfPdBCHKHV5PWVwleMLZ6/KJ9w4l1RC491nFR0mxCHn9yrc+bymRyUzM4v0G67nYH
         GfWXHKmK7eOGA6Y0n/uG+wjUn71a+LSjd0BZEezt3acgW/kLGWDuRVHepp/gjxqQ4MWH
         IbcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0mrAs5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebd682csi358824251cf.533.2025.01.01.11.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2025 11:34:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0mrAs5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tT4UF-0007vY-IK; Wed, 01 Jan 2025 14:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tT4UC-0007v4-C3; Wed, 01 Jan 2025 14:34:32 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tT4UA-0004Ai-Po; Wed, 01 Jan 2025 14:34:32 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso18558921a12.2; 
 Wed, 01 Jan 2025 11:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735760068; x=1736364868; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfK1v4tmS9NYvxobN0aIXX9j+DTkUI3+ka1LIytdvKA=;
 b=E0mrAs5EPAlwG8Wd0XxMvmDQ2bD+ZoxmHelG08kkoT8pa4axisoun0R+pZb8WLHgqP
 YyEXetfKb3Xpba3xpHSupH8rDRrwbx/TVoFSFNHEXyk6IuW/ApWRPuacelKQ5YPmnMZU
 RJGGgm5baMPKOg4jGxerDrVRTwxINYcg1tPQpEIY+EFHu3yEgogyCq3aYKk02uS17EJR
 dq99A5KNqbXEAWwusUpLmx4p6DJYlKHWSerdlCCDkTwbHrz3DKOYKP4266fASZJjbtih
 CgiwqeCrgxk0f5b1g9czdT+HJG5kwiucN5eiouQ40DdvHWcvEMRfGpKYkBLYr/q3NAyf
 wqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735760068; x=1736364868;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfK1v4tmS9NYvxobN0aIXX9j+DTkUI3+ka1LIytdvKA=;
 b=pjm9ngyYkrJaG5Xcz7AE/RDI/rwUuiM6Z39gTmCYPisL7M1AzPaczBrr4nSQ+Tj0tq
 Md51Jd1YMt7xLRWfGVHP4yk+2GB8O6XkXuBE0+Eqlwa6Lziw+Cstd5fdjHQZwhbVhTuW
 3ylnX3n3GAaLHNeAp4j8o4YGG0jcq+D9XZTS3Tm++WeJGTrQc0LsCixNYqLmjdq2S1Bb
 JQFo10x2HlFMnct5AyQlqOXjvsasvXPNmSJhSs3FWwMKIRbG/5TM4TYnIC/dgiUW3Kwk
 gBz2rMMpKt++CwaFGTfFf/chrz4d2rZLboTv0IPauTC2wJUTqiMN5wPiEW7OZAIHYnyI
 OVyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZthYCPUx/Uxj8mab0UOoxybiZSY9wr1PdlhDBS5k81Ow80KU7Uttm7JdRAf7m3KaYHfxoEAfEaSANig==@nongnu.org,
 AJvYcCWbZENJB3hUPh1uH7Yyyqnk3Umc9COc29pHQWoX25cH2FRyH3qDfXozZ0tyQF6x6+bhaOr2G4yM7ss=@nongnu.org,
 AJvYcCXwuyZlUWGA2l9lLWqh+F1ZfdMXWKc2S1VkuY0ziXuzQELAyfLuKj5ae7wIaacccaW+w/Q/ujwD3g==@nongnu.org
X-Gm-Message-State: AOJu0YwTEz/s9pa1wwjUsl0QsME6rf6r5PAJAB+nHbD+2wsW70Mas3QA
 7ZASDZm2hl6vF160nZW8yRZEs2oVutuy/pX5p/MjSMh74rgo2sreBVDuyQ==
X-Gm-Gg: ASbGnctR2bIg+9mNhxdfoC18uJADbxV7bB4+1LmJlWLPk9cGQuuLTNgilLOequYeSU/
 8imeCygYdw0eejWMTaO+iSNI4y0vUnJN0TkFYsMfMnD75rlhGOEYpGh93VR7ee0kCxqMGakSela
 4uUKn1qavovrjFFkdoWzoEyeMXc9r03H1h9fCPozYLci+WmXa1XhNlsVW/6CvXKkj0tYMeiP6Zq
 1SCKsmJSsR3nLUmXLaTL8SCxh8rLdh5moTaq3XjvyhQ0OKPguKv4uTRU8MPjigC9G0pIGuiotxL
 1Wg6/yUZQBgBcS6UDAT2IgtPMv84IA==
X-Received: by 2002:a05:6402:13d2:b0:5d0:d91d:c195 with SMTP id
 4fb4d7f45d1cf-5d81de5ce94mr37088332a12.32.1735760067490; 
 Wed, 01 Jan 2025 11:34:27 -0800 (PST)
Received: from [127.0.0.1] (dynamic-093-128-005-073.93.128.pool.telefonica.de.
 [93.128.5.73]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806fed2a1sm18060222a12.67.2025.01.01.11.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2025 11:34:26 -0800 (PST)
Date: Wed, 01 Jan 2025 19:34:24 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Stafford Horne <shorne@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-ppc@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/3=5D_target/cpus=3A_Remove_poi?=
 =?US-ASCII?Q?ntless_re-assignment_of_CPUState=3A=3Ahalted?=
In-Reply-To: <20241230153929.87137-4-philmd@linaro.org>
References: <20241230153929.87137-1-philmd@linaro.org>
 <20241230153929.87137-4-philmd@linaro.org>
Message-ID: <AD39CF0E-6C1D-45FB-A168-E7B87089B34F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: VSjAFWVNEV4N



Am 30=2E Dezember 2024 15:39:29 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>The CPUState::halted field is always re-initialized in
>cpu_common_reset_hold(), itself called by cpu_reset()=2E
>No need to have targets manually initializing it=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/misc/mips_cpc=2Ec        | 1 -
> hw/ppc/e500=2Ec             | 1 -
> target/arm/arm-powerctl=2Ec | 2 --
> target/hppa/cpu=2Ec         | 1 -
> 4 files changed, 5 deletions(-)
>
>diff --git a/hw/misc/mips_cpc=2Ec b/hw/misc/mips_cpc=2Ec
>index 772b8c0017d=2E=2E4ec8226c416 100644
>--- a/hw/misc/mips_cpc=2Ec
>+++ b/hw/misc/mips_cpc=2Ec
>@@ -38,7 +38,6 @@ static void mips_cpu_reset_async_work(CPUState *cs, run=
_on_cpu_data data)
>     MIPSCPCState *cpc =3D (MIPSCPCState *) data=2Ehost_ptr;
>=20
>     cpu_reset(cs);
>-    cs->halted =3D 0;
>     cpc->vp_running |=3D 1ULL << cs->cpu_index;
> }
>=20
>diff --git a/hw/ppc/e500=2Ec b/hw/ppc/e500=2Ec
>index 4551157c011=2E=2E8b90b5b2448 100644
>--- a/hw/ppc/e500=2Ec
>+++ b/hw/ppc/e500=2Ec
>@@ -785,7 +785,6 @@ static void ppce500_cpu_reset(void *opaque)
>     cpu_reset(cs);
>=20
>     /* Set initial guest state=2E */
>-    cs->halted =3D 0;
>     env->gpr[1] =3D (16 * MiB) - 8;
>     env->gpr[3] =3D bi->dt_base;
>     env->gpr[4] =3D 0;

For e500:

Acked-by: Bernhard Beschow <shentey@gmail=2Ecom>

>diff --git a/target/arm/arm-powerctl=2Ec b/target/arm/arm-powerctl=2Ec
>index 20c70c7d6bb=2E=2E8e948171c7c 100644
>--- a/target/arm/arm-powerctl=2Ec
>+++ b/target/arm/arm-powerctl=2Ec
>@@ -67,7 +67,6 @@ static void arm_set_cpu_on_async_work(CPUState *target_=
cpu_state,
>     /* Initialize the cpu we are turning on */
>     cpu_reset(target_cpu_state);
>     arm_emulate_firmware_reset(target_cpu_state, info->target_el);
>-    target_cpu_state->halted =3D 0;
>=20
>     /* We check if the started CPU is now at the correct level */
>     assert(info->target_el =3D=3D arm_current_el(&target_cpu->env));
>@@ -194,7 +193,6 @@ static void arm_set_cpu_on_and_reset_async_work(CPUSt=
ate *target_cpu_state,
>=20
>     /* Initialize the cpu we are turning on */
>     cpu_reset(target_cpu_state);
>-    target_cpu_state->halted =3D 0;
>=20
>     /* Finally set the power status */
>     assert(bql_locked());
>diff --git a/target/hppa/cpu=2Ec b/target/hppa/cpu=2Ec
>index 9b355bfe902=2E=2Eb4092037888 100644
>--- a/target/hppa/cpu=2Ec
>+++ b/target/hppa/cpu=2Ec
>@@ -203,7 +203,6 @@ static void hppa_cpu_reset_hold(Object *obj, ResetTyp=
e type)
>     if (scc->parent_phases=2Ehold) {
>         scc->parent_phases=2Ehold(obj, type);
>     }
>-    cs->halted =3D 0;
>     cpu_set_pc(cs, 0xf0000004);
>=20
>     memset(env, 0, offsetof(CPUHPPAState, end_reset_fields));
