Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F4AC982E6
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 17:27:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8hnk-0000Gh-OY; Mon, 21 Sep 2026 13:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8hnW-0008VZ-M3
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 13:27:26 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8hnT-0003QA-0D
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 13:27:20 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d3931so24774285e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 10:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790011637; x=1790616437; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D9YNSAWl4KcvgdDn/ys0gAnOcyAPBG7s8COCA+VV1T4=;
 b=QVzS1xPF7QI+c/KIFAFs9MYBiKmehmDm+HRF7jHBO25u7VGdkTU+almlPRy1NF0yOH
 K1Q9hQWOvzlM3P8DmRDXkfZYGz1oJMp/kDOXzpcae3pIbneuLVw4pKZfta3+/nxTajNT
 qxggSYpaX5kcuGHLWNODS8RRInxfrdGXIJ08VQs+pthpqZ7rBfVXgx1pvj8eUJlv7Pou
 BDeSVPuZtBm0lZ2JmxAbeaNBMky7YbQacWu8R3/PA/bPkKrG+8zc8iWzRktUnCHAOBfI
 Kvjczgu0GTlkKXYVcHraFCpIUbu5UiZWY+cvL9ebEbZJTN1pNEA72kXP+qx07oLMOKHd
 bbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790011637; x=1790616437;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D9YNSAWl4KcvgdDn/ys0gAnOcyAPBG7s8COCA+VV1T4=;
 b=SB2qaRHzZj2q+mb5iVGmSqqCOR1I8YHv7dcyvap2BQVBT2m8e0+ukDmmeVHSqlirZC
 TKkZwgYYZzQfAbCPM98tJaC/jYTneq2vdhq2yB+4tosKKw6kxMl3rQF06+zQpxtbyzGP
 6X7v9k9SSIyY15pHeNvMaIhlpjyVckYV4jJae1kkXCxn8TszpX9JWp6vVggnlY553qC+
 O+IpBx7iRDUAs4jVwBB4PNVbmycndNNGaM9dVhDkbTo4LvDLCjdhBBeV1NKNrPydfZH0
 1gMorDHiZlqUwg86UmdhhQtFUx0xLQ5qEmAY+DuNYg4QKQ7lHQ4Zc+ivPndA1r0hKx22
 fMRw==
X-Gm-Message-State: AFuF++m9SZg5fpz6tgHXyTci3RgZihwbWSNNjq1U4AVeytdrIoL5G3Hs
 WJcv4Qxh7Eumn540RBVEumjKlLOEaXYEbvOV8b7kxWT0LGdUoBTG7aGb
X-Gm-Gg: AYBFou1bKvRy1xtWTlFazzKR115d30l69ajY3LInO+sroda2x/pLeyvFuLQnyEFXoyR
 x1+o/C9nhjyr4bO3ZA3GSnqY4vUU30Exwz68ygNANPZjSJkR1bW3TWyQp0dyVh5I7u34f8V0TFX
 aQYcbIOCassQNSBL5ANxEgKEHIf2xjCSvrp3DpvPNA9N2D34ZwXzBI2SGaRXYrM75+aTk7lY+AJ
 eMeX5OXIXrhToAJBPbGLp3EjQ8pUm09TCuwiL8GQjUWfI5KCdxzpHgJ03ul3MF6l4un2aSQ7LK/
 5b3nzhfmJEoM9sJv01L/hTrI8bXajfYrDQF6fr4AvpBJI3wGHSMduqNvtus7QyInkYNJ2vYetZ/
 l3Pgcq9r6svoEwHz5Dr4yArH5ffl8CGIsTmC4kbcJw9+rvEDxSk+SL8c18umkRYvYLkS8UnLlvi
 VMLnQV3lJbWKZWYbwD1FnW7P3IECLYpAfI26vnuKfAgLQjUlEOxnUAfjMm6aX8p7sDMF6hUQDti
 fo=
X-Received: by 2002:a05:600c:350d:b0:49e:8184:f63b with SMTP id
 5b1f17b1804b1-49fc5736085mr153101485e9.16.1790011636864; 
 Mon, 21 Sep 2026 10:27:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([62.214.191.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fd8a638fcsm7118745e9.0.2026.09.21.10.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 10:27:16 -0700 (PDT)
Date: Mon, 21 Sep 2026 17:27:15 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-devel@nongnu.org
CC: qemu-arm@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 pierrick.bouvier@oss.qualcomm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCHv3_08/10=5D_MAINTAINERS=3A_Merge?=
 =?US-ASCII?Q?_MCIMX8MM-EVK_and_MCIMX8MP-EVK_entries?=
In-Reply-To: <20260920115458.481605-9-gaurav.sharma_7@nxp.com>
References: <20260920115458.481605-1-gaurav.sharma_7@nxp.com>
 <20260920115458.481605-9-gaurav.sharma_7@nxp.com>
Message-ID: <5C670FBA-83BE-46C0-8B74-E15586C85B32@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 20=2E September 2026 11:54:56 UTC schrieb Gaurav Sharma <gaurav=2Esharm=
a_7@nxp=2Ecom>:
>Merge the separate MCIMX8MM-EVK and MCIMX8MP-EVK MAINTAINERS entries
>into a single combined entry covering both SoC families=2E
>
>Signed-off-by: Gaurav Sharma <gaurav=2Esharma_7@nxp=2Ecom>

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>---
> MAINTAINERS | 13 ++++---------
> 1 file changed, 4 insertions(+), 9 deletions(-)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 6be9c5725b=2E=2E7120784ec7 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -933,29 +933,24 @@ F: hw/pci-host/designware=2Ec
> F: include/hw/pci-host/designware=2Eh
> F: docs/system/arm/mcimx7d-sabre=2Erst
>=20
>-MCIMX8MM-EVK / iMX8MM
>+MCIMX8MP-EVK / MCIMX8MM-EVK
>+M: Bernhard Beschow <shentey@gmail=2Ecom>
> M: Gaurav Sharma <gaurav=2Esharma_7@nxp=2Ecom>
> L: qemu-arm@nongnu=2Eorg
> S: Maintained
> F: hw/arm/fsl-imx8mm=2Ec
> F: hw/arm/imx8mm-evk=2Ec
>-F: include/hw/arm/fsl-imx8mm=2Eh
>-F: docs/system/arm/imx8m=2Erst
>-F: tests/functional/aarch64/test_imx8mm_evk=2Epy
>-
>-MCIMX8MP-EVK / i=2EMX8MP
>-M: Bernhard Beschow <shentey@gmail=2Ecom>
>-L: qemu-arm@nongnu=2Eorg
>-S: Maintained
> F: hw/arm/imx8mp-evk=2Ec
> F: hw/arm/fsl-imx8mp=2Ec
> F: hw/misc/imx8mp_*=2Ec
> F: hw/pci-host/fsl_imx8m_phy=2Ec
> F: hw/rtc/rs5c372=2Ec
>+F: include/hw/arm/fsl-imx8mm=2Eh
> F: include/hw/arm/fsl-imx8mp=2Eh
> F: include/hw/misc/imx8mp_*=2Eh
> F: include/hw/pci-host/fsl_imx8m_phy=2Eh
> F: docs/system/arm/imx8m=2Erst
>+F: tests/functional/aarch64/test_imx8mm_evk=2Epy
> F: tests/functional/aarch64/test_imx8mp_evk=2Epy
> F: tests/qtest/rs5c372-test=2Ec
>=20

