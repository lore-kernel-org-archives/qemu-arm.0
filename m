Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F1606A325
	for <qemu-arm@archiver.kernel.org>; Sun,  1 Nov 2026 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZyNz5YtQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNVJ8-0003rc-5Q; Sun, 01 Nov 2026 08:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xNVJ5-0003r9-Qo
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 08:09:07 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xNVJ4-0000TD-5U
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 08:09:07 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso1949953f8f.2
 for <qemu-arm@nongnu.org>; Sun, 01 Nov 2026 05:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793538544; x=1794143344; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IGag45+yAtGfwAd6EF0IEFCLoG7qxCksERUwrXUW4DU=;
 b=ZyNz5YtQsoHa92fLr+MTwzCGseO29WPB/Nu2gZ0llSah8um/iuLklg0NuGmoj26aS/
 QTzOX0Ek6IRSRYSkYH7UJWI4lF1sOIry5EaPkLDn3Tgq4aHCTwRtKRLIVWeynhp4yQm5
 OuCp4QVakKW4OerGaouQ3cYGLS4ESzVdS+d6pn+Q5pjEdZXVttXgrxbwEkwmc2arcnut
 Xb4Uz7nD4GGMC1gWkDxh4apgVo+LUsYeYS9ufTVQUVbTsmze6cPXgdjrGmLr1SxoyiPw
 TE0bAhtNkwrW65u6W0kaApALgpqAE6Ek4nDStZb4BZt+fLqDUNXzxUY4qOFIm/EIx7+y
 W+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793538544; x=1794143344;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IGag45+yAtGfwAd6EF0IEFCLoG7qxCksERUwrXUW4DU=;
 b=qXuzYEd8WgJHmfoq7wIZCYPTIZjMqqPAEw0r+HqH/IPPa5I751qV6m+Jlq3NsxfZkc
 /YwtBL2OUmO11y5JX4NpSOyX+JRtI4AidzECpfSgh4sRM9MGmx/FpIzwgNCqX2etSaUt
 RNYuZxV1yNI2+AUcOrbrSLWf6FY/g9uN7fUCZNY6s4eFXewoW1LSMuVfKtQFeR+yRoiw
 cyNpY8Hj50d1bZrI8PzVX4PxL1aMrJdINR48mtuU4Jw/L8B0bHtZfUpi7EiwtkBMpUrh
 IOiIyrpM+6Dt7rfF28Q5uRn4MJtS4fSzPxiOKa1j3KfCbrKPXfksiMeTWThwz5ZWTCvT
 qUcA==
X-Gm-Message-State: APuU4Z+cP8Yu5ZDohScCXqdAF2PBvwnCtPW/swi+ye6zg7MZBF/dEfP5
 rCFfW6gYiscbXbGxOrcihJhg3Htuh8EjwrDXM9BxAq74TD9Vk3lFPQxt
X-Gm-Gg: AYBFou2rgLRzMGf4syvV7JJZxHUhPNvQV2eyPPiN7LPk1ueusfvnXarOWwTy9x+QvOo
 apVnUO9Pkn1K7TTY4NoGGewF6qNY8zeSMRz+uVikDtgW8o/0MKUXpcovEONCmBar/5dosoFd+dM
 e9qgL+sfUfg/OsBCbTThhOkg3+qQouZD6qVLRVdtoT6H4R1I7gwun3fUEvjxC4dgVT9wDNolm3E
 AXSMLTQG6B/vRTeZf01UL7HxmXbJZi9hfvihF4IrXamqu5RchAK1f6VMBa/YeDLJDN2Gru1jnr2
 hieBkd6kwhjgoBWo4xqBXLmT37ELlZXyvwBZC34wYhjRmvb5EtHGhE6Mr7DzgCwJkvO8TggU2IM
 PrxpOOdjDHWwkpTOoNQEufyIcEwQzUhex4Bao2fyA5dRlTQoZ9b2VR+URPZC/MWbR226mk53IUl
 LRvpC/BSGx+nOuuDYquHUNlZ3wMkNwJn7mFHdDqXty+aFmo/oRn378sAWN9qRDM1vooKcs0MuSF
 jzNbVolbML33J+oMKgVgiGER0pvJPAr9B9QWznWojQv9I51AJmxJ7E+X3kybPzsmcmlOF6Bd0lW
 O0hYPgPAFBrFyXeNvdIcAcMCjPjNwjOu90zFCEqbf5ova+60PnJw7jbU7OQzhtLGi6/Vvh1EKJw
 6uKsXy4PnGQ3Ld5c=
X-Received: by 2002:a5d:5d09:0:b0:48e:64e2:4883 with SMTP id
 ffacd0b85a97d-48e6e2dbb76mr15882727f8f.8.1793538543794; 
 Sun, 01 Nov 2026 05:09:03 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-077-013-241-109.77.13.pool.telefonica.de. [77.13.241.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7246fsm14299538f8f.19.2026.11.01.05.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2026 05:09:03 -0800 (PST)
Date: Sun, 01 Nov 2026 13:09:00 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-devel@nongnu.org
CC: qemu-arm@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 pierrick.bouvier@oss.qualcomm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCHv4_02/11=5D_hw/arm=3A_Rename_FSL?=
 =?US-ASCII?Q?=5FIMX8MP=5FNUM=5FCPUS_to_FSL=5FIMX8MP=5FNUM=5FA53?=
In-Reply-To: <20261007101105.3917771-3-gaurav.sharma_7@nxp.com>
References: <20261007101105.3917771-1-gaurav.sharma_7@nxp.com>
 <20261007101105.3917771-3-gaurav.sharma_7@nxp.com>
Message-ID: <0C938E3A-E90C-41CD-B577-B4AC6C3E7651@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Am 7=2E Oktober 2026 10:10:56 UTC schrieb Gaurav Sharma <gaurav=2Esharma_7=
@nxp=2Ecom>:
>This is a mechanical rename with no functional change=2E
>The existing CPU count and cpu array describe only the
>Cortex-A53 cores=2E
>
>Signed-off-by: Gaurav Sharma <gaurav=2Esharma_7@nxp=2Ecom>
>---
> hw/arm/fsl-imx8mp=2Ec         | 4 ++--
> hw/arm/imx8mp-evk=2Ec         | 2 +-
> include/hw/arm/fsl-imx8mp=2Eh | 4 ++--
> 3 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/hw/arm/fsl-imx8mp=2Ec b/hw/arm/fsl-imx8mp=2Ec
>index bcd91739d9=2E=2Ef599e5e0a2 100644
>--- a/hw/arm/fsl-imx8mp=2Ec
>+++ b/hw/arm/fsl-imx8mp=2Ec
>@@ -266,9 +266,9 @@ static void fsl_imx8mp_realize(DeviceState *dev, Erro=
r **errp)
>     const char *cpu_type =3D ms->cpu_type ?: ARM_CPU_TYPE_NAME("cortex-a=
53");
>     int i;
>=20
>-    if (ms->smp=2Ecpus > FSL_IMX8MP_NUM_CPUS) {
>+    if (ms->smp=2Ecpus > FSL_IMX8MP_NUM_A53) {
>         error_setg(errp, "%s: Only %d CPUs are supported (%d requested)"=
,
>-                   TYPE_FSL_IMX8MP, FSL_IMX8MP_NUM_CPUS, ms->smp=2Ecpus)=
;
>+                   TYPE_FSL_IMX8MP, FSL_IMX8MP_NUM_A53, ms->smp=2Ecpus);
>         return;
>     }
>=20
>diff --git a/hw/arm/imx8mp-evk=2Ec b/hw/arm/imx8mp-evk=2Ec
>index 3f376f86d9=2E=2Ef19d80b796 100644
>--- a/hw/arm/imx8mp-evk=2Ec
>+++ b/hw/arm/imx8mp-evk=2Ec
>@@ -148,7 +148,7 @@ static void imx8mp_evk_machine_class_init(ObjectClass=
 *oc, const void *data)
>     mc->desc =3D "NXP i=2EMX 8M Plus EVK Board";
>     mc->init =3D imx8mp_evk_init;
>     mc->default_cpus =3D 4;
>-    mc->max_cpus =3D FSL_IMX8MP_NUM_CPUS;
>+    mc->max_cpus =3D FSL_IMX8MP_NUM_A53;
>     mc->default_ram_id =3D "imx8mp-evk=2Eram";
>     mc->default_ram_size =3D 6 * GiB;
>     mc->get_default_cpu_type =3D imx8mp_evk_get_default_cpu_type;
>diff --git a/include/hw/arm/fsl-imx8mp=2Eh b/include/hw/arm/fsl-imx8mp=2E=
h
>index 2be3c51af5=2E=2E6f9bd8d2ce 100644
>--- a/include/hw/arm/fsl-imx8mp=2Eh
>+++ b/include/hw/arm/fsl-imx8mp=2Eh
>@@ -39,7 +39,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslImx8mpState, FSL_IMX8MP)
>=20
> enum FslImx8mpConfiguration {
>     FSL_IMX8MP_NUM_CANS         =3D 2,
>-    FSL_IMX8MP_NUM_CPUS         =3D 4,
>+    FSL_IMX8MP_NUM_A53          =3D 4,
>     FSL_IMX8MP_NUM_ECSPIS       =3D 3,
>     FSL_IMX8MP_NUM_GPIOS        =3D 5,
>     FSL_IMX8MP_NUM_GPTS         =3D 6,
>@@ -54,7 +54,7 @@ enum FslImx8mpConfiguration {
> struct FslImx8mpState {
>     SysBusDevice   parent_obj;
>=20
>-    ARMCPU             cpu[FSL_IMX8MP_NUM_CPUS];
>+    ARMCPU             cpu[FSL_IMX8MP_NUM_A53];
>     GICv3State         gic;
>     IMXGPTState        gpt[FSL_IMX8MP_NUM_GPTS];
>     IMXGPIOState       gpio[FSL_IMX8MP_NUM_GPIOS];

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

