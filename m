Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21868E8382F
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 20:46:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs5TN-0007Nk-M3; Mon, 16 Feb 2026 15:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vs5TM-0007Ml-6B
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 15:45:36 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vs5TJ-0007BS-FG
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 15:45:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so2617219f8f.1
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 12:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771274732; x=1771879532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXVVAM2+8SfS9q9coPWxDTOqxlnTjvAg7e+RtIUJcCY=;
 b=nHxdqJt996GS5Iu+iSg3dJfLP2kFxf9sghqYeD2zTahMl7frxHuEYwO10Bc0XAszAM
 hGsRK2/6H6uX/AoN+KoHCDN5Q6sGH0peQ+WomG8ZWwEh+SmOh+S03AG9h3ksUEiYLsrN
 SCJLakIqwir8ZrjnxNbhoXKPKruyvhv+QjelsuI1v9zcLDfTmdJO7x6QAy4NdJHxIU/C
 fU5fv3j3PXtRHKYwSOgk8oGMFGI2a2yG6+gSV7joqC1GatEGJcEWWobbuoC5+Fhmj3t9
 a8bSv5fL/IPL9bX7dIh4rG+SBVl2YvYT5vBw5bVqyMZidlDeLnUAI9frxdCsRr8drEkA
 rqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771274732; x=1771879532;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MXVVAM2+8SfS9q9coPWxDTOqxlnTjvAg7e+RtIUJcCY=;
 b=QXXC47LlITdlgpcizIYcdufbZRkmqLaF88xKPdfocQpg74eb9CoSOOxYKqAJxXcfeK
 rvTxAnquUhVnWRmtsnXRKVe61uVzKNG09qe3r35mpdu8p1CYrQj5fpPk1aEQaxZpotC1
 OPyJyTf08kcDcN6Pgy36/BUZHG95rldxTKnUOSfqaQQ5AM2B9oQphbgZpIL/7LxrEQYU
 ITfL3YVj+yU51Tx2gHlqp0Ter5I5TZyub9YGRIHXgdnReDkW8aqFu+RZTQLcF0WMnU4i
 TMcTbgjvvGk5jRWins+BKJXjxgSZO1fmdKA8LiH+EVGYwNjVQl1jVgJoFLCZLCH/80MQ
 qRGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzbuTSEtV2msiciKnHngG7jAoRsaNYJ1IXGt9yRGVHzd7f9IX+5XvB9DBd2AE4Y3tkMXVX5sUmOQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRDM9R/fZSfiUKkNIy2HsJh2fCpZRYj9qmtmYHmtmQTRbDGYsy
 gCXEUJ/gsZcLkdD2DCwBvTwZIfCellLVRp/JvU7jpPZcGV7hjvhLPEub
X-Gm-Gg: AZuq6aKGQkVkE5lMa1F1An/6Sig2D7+ybf4A9wOihQHKos46u1wz/vAixRrd6QavbyO
 4dHRbScrBcWSM2SA1PQHIVN+PFXX+Yx5qSNOkAD+W3HgtRrt2UY1QSZ3E+zasInM2Sbv1/ha+0J
 LVPPifduS7cckI7icgrX3vjCLxgSw1jFf2LcgdHdchGmX4vGukxdNlZge08zMzPUTIq+gptDfWX
 WhPxmW2nOjxNVfwoNY0QAmu6DVQgtnHlgC9eBhMw0JF4XvOPwf4d9uvmtsusOhVLRKMDo0Q57zJ
 L+kORJ/VBZRmG2FDV7LhP/+05giskmnqHgb9TCl6I9R7pMIikjTKQKhLKe/IU7+PVIA6HK8syWY
 uNdrMqlRTRALygD4cPC3l6baAviZigLBnDavwUC/r/81TuFR6o1wbPK8Fl0P+gv/vMhbIEvAjnc
 nQzZBySGoYfctdes/pLN9REEBpfCNeMHKOD1rRjCJBmjeThK3DY/X3NcA1BXQBnaLFrZDlU2XE3
 +0byw9A6UIXPs7b9gpjnxGw+pHkm4izkLQAaRf/sV3VTg==
X-Received: by 2002:a05:6000:2403:b0:436:339a:9ab2 with SMTP id
 ffacd0b85a97d-4379d5e3c6fmr17616050f8f.7.1771274731633; 
 Mon, 16 Feb 2026 12:45:31 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-2363-0f00-f009-a6c9-39e7-d8fe.310.pool.telefonica.de.
 [2a02:3100:2363:f00:f009:a6c9:39e7:d8fe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a74918sm29228577f8f.17.2026.02.16.12.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 12:45:31 -0800 (PST)
Date: Mon, 16 Feb 2026 18:41:06 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
CC: Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>,
 Magnus Kulke <magnuskulke@linux.microsoft.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Magnus Kulke <magnus.kulke@linux.microsoft.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Wei Liu <wei.liu@kernel.org>, Zhao Liu <zhao1.liu@intel.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_14/14=5D_whpx=3A_i386=3A_saving/restori?=
 =?US-ASCII?Q?ng_less_state_for_WHPX=5FLEVEL=5FFAST=5FRUNTIME=5FSTATE?=
In-Reply-To: <20260215052225.22513-15-mohamed@unpredictable.fr>
References: <20260215052225.22513-1-mohamed@unpredictable.fr>
 <20260215052225.22513-15-mohamed@unpredictable.fr>
Message-ID: <03058DA4-50B2-436C-B023-1422AD41108B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



Am 15=2E Februar 2026 05:22:25 UTC schrieb Mohamed Mediouni <mohamed@unpre=
dictable=2Efr>:
>Optimise vmexits by save/restoring less state in those cases instead of t=
he full state=2E
>
>Signed-off-by: Mohamed Mediouni <mohamed@unpredictable=2Efr>
>---
> target/i386/whpx/whpx-all=2Ec | 16 ++++++++++++----
> 1 file changed, 12 insertions(+), 4 deletions(-)
>
>diff --git a/target/i386/whpx/whpx-all=2Ec b/target/i386/whpx/whpx-all=2E=
c
>index 7bbe63e794=2E=2E9d1febce52 100644
>--- a/target/i386/whpx/whpx-all=2Ec
>+++ b/target/i386/whpx/whpx-all=2Ec
>@@ -420,6 +420,13 @@ void whpx_set_registers(CPUState *cpu, WHPXStateLeve=
l level)
>         vcxt=2Evalues[idx]=2ESegment =3D whpx_seg_q2h(&env->segs[i], v86=
, r86);
>     }
>=20
>+    /*
>+     * This is a hot path called on every MMIO access=2E
>+     */
>+    if (level <=3D WHPX_LEVEL_FAST_RUNTIME_STATE) {
>+        goto skip_to_set_registers;
>+    }

Looks like we can get rid of the goto by extending the scope of the if sta=
tement to the skip_to_set_registers label=2E

With this fixed:

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>+
>     assert(idx =3D=3D WHvX64RegisterLdtr);
>     vcxt=2Evalues[idx++]=2ESegment =3D whpx_seg_q2h(&env->ldt, 0, 0);
>=20
>@@ -529,10 +536,11 @@ void whpx_set_registers(CPUState *cpu, WHPXStateLev=
el level)
>=20
>     assert(idx =3D=3D RTL_NUMBER_OF(whpx_register_names));
>=20
>+    skip_to_set_registers:
>     hr =3D whp_dispatch=2EWHvSetVirtualProcessorRegisters(
>         whpx->partition, cpu->cpu_index,
>         whpx_register_names,
>-        RTL_NUMBER_OF(whpx_register_names),
>+        idx,
>         &vcxt=2Evalues[0]);
>=20
>     if (FAILED(hr)) {
>@@ -612,7 +620,7 @@ void whpx_get_registers(CPUState *cpu, WHPXStateLevel=
 level)
>                      hr);
>     }
>=20
>-    if (whpx_irqchip_in_kernel()) {
>+    if (level > WHPX_LEVEL_FAST_RUNTIME_STATE && whpx_irqchip_in_kernel(=
)) {
>         /*
>          * Fetch the TPR value from the emulated APIC=2E It may get over=
written
>          * below with the value from CR8 returned by
>@@ -668,7 +676,7 @@ void whpx_get_registers(CPUState *cpu, WHPXStateLevel=
 level)
>     env->cr[4] =3D vcxt=2Evalues[idx++]=2EReg64;
>     assert(whpx_register_names[idx] =3D=3D WHvX64RegisterCr8);
>     tpr =3D vcxt=2Evalues[idx++]=2EReg64;
>-    if (tpr !=3D vcpu->tpr) {
>+    if (level > WHPX_LEVEL_FAST_RUNTIME_STATE && tpr !=3D vcpu->tpr) {
>         vcpu->tpr =3D tpr;
>         cpu_set_apic_tpr(x86_cpu->apic_state, whpx_cr8_to_apic_tpr(tpr))=
;
>     }
>@@ -754,7 +762,7 @@ void whpx_get_registers(CPUState *cpu, WHPXStateLevel=
 level)
>=20
>     assert(idx =3D=3D RTL_NUMBER_OF(whpx_register_names));
>=20
>-    if (whpx_irqchip_in_kernel()) {
>+    if (level > WHPX_LEVEL_FAST_RUNTIME_STATE && whpx_irqchip_in_kernel(=
)) {
>         whpx_apic_get(x86_cpu->apic_state);
>     }
>=20

