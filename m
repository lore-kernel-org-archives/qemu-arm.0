Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0BDFEC0FC
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Mar 2026 20:58:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w58pV-0006xa-4N; Tue, 24 Mar 2026 16:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1w58pU-0006xD-HN
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 16:58:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1w58pT-0006yF-1H
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 16:58:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-486ff3a0fc1so37994645e9.2
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2026 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774385901; x=1774990701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=or4gydKa0WQ8LJoYBqRR2/fe1enyIXs4mWK0LmQVX4A=;
 b=c/w6iMkmlLn56QusO2Yf0hsjwnN5PXi98jePtRg6S+V7ZD+zbUorRgDYWBXWFwPqe+
 c9WQwGP+E6FasbeZnPX+XRWWOJqsCw4g+cF94a7zWI4qZZmTJDdUC6GFSQ2cQxffJ4ks
 zGW6+qBbE7Ek2wiLhLU71KqsQ50SpXszHTGWidbeOkW/WbgzcIrS2Nj8MrPvTtChuXXE
 adYyCuaz+Sj9lzueb1IzqF9AleHmBh1x3vSNL/bWKWHZG4H7hO8b5gCuQ63bKQOIfqa5
 6AhdG5B64AUImxGz1TeaJKnplLi18xrmPtAMCJf9V4VWrkemR0Pc2RA0R/0OYsalogNd
 yhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774385901; x=1774990701;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=or4gydKa0WQ8LJoYBqRR2/fe1enyIXs4mWK0LmQVX4A=;
 b=G6PBlZe6tGBpi54EHl28kT68BbEAZ5We2RcQciL5MoSblXfqmTFi+wUjlrSDtDA4TD
 C39TYgli7tkkjRxd4CSNQr7jVT049Du7yy6FmlAjXoM+xkMvOmV/ipP6rqjRhOchr4DY
 qV1nv/0y1RvipB6x8CLfj5LrKnDSkoZl1VlxMRTlIliDtBEcHC5Rd1X3nmLfoHaWG6tM
 w3Q4O7jbqF4Vzx9HzZFlbf9uGLQud2EyMJkmYw/3Ttxpfy8x7LxiAvnnzB2uQii5qCWd
 CTrKqcCYhuJ+UBXvdPbX3idekIRBhspLhP8rIYLXWSv86kA6k6N/m1/2bpJ95SVkt60h
 iUMA==
X-Gm-Message-State: AOJu0YxIT7j8Uhry6JGKeEyVopkqtY46Ax2qyYwZ6PqyzjgTIlDirSqm
 cxwJZ18067N3G80q6T6JBifQGrBYXgLfF+UEDuqujhRDjBBvKxZlmRxt
X-Gm-Gg: ATEYQzwywxNnsvpSNhbyt5Zh2EGwWJ1y5i6gMqTeQMB3TqZ30xQL70vE2xeg0t0Uror
 LWPxTZwjIwnYFvkJg95SneyB7STAHnXO6SBn4wZr5EFLZgamtBj8RVRxdw6d3gJBPbw6xuSHvoM
 d6mbWkDhsSQTkAiC/vjU2amsxoBtrADuXDEci7XXDL3oJAHVyfdpx7en0WwIkRDOWea8zjUfuFn
 TPyJM8NUN5VhTh597OWYDbCR2GwJYEXoxDMf/yEscFHCV6UIsoc3bkReWOzHMqGZf5a0s2jIVO8
 6wVm4eX/epSOvZyYYY3SUZirCJAoZHtxi/CjPkl9fapd4iI1dm0YXVbNGKqHEkeRemvQC7c99Z8
 Hcsk2ZqbGfuh2dKIzIWqw/ET/fd+RFBgesCyccQesRS9uzPm7gCsNOnC0ens/7xdqsZe2qqqVWh
 kV21RVQtAT/NCK4/ymSLvoMAR8dEQUeGGm/U5xSj10KNwBBgnuVcXQvkmLe37BE97ErlUJ7FhSZ
 nFKUNIbRu8jie0PKIjwVuF9nxLtaYaNkmUhPrkWU6RFoBg=
X-Received: by 2002:a05:600c:3511:b0:486:fc5f:1ab9 with SMTP id
 5b1f17b1804b1-48715feab33mr17763785e9.14.1774385901255; 
 Tue, 24 Mar 2026 13:58:21 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-24e1-d500-204c-1ac0-c53f-1a0e.310.pool.telefonica.de.
 [2a02:3100:24e1:d500:204c:1ac0:c53f:1a0e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487172bbdf2sm4070985e9.4.2026.03.24.13.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 13:58:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:58:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?UTF-8?Q?Maty=C3=A1=C5=A1_Bobek?= <matyas.bobek@gmail.com>,
 qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>
CC: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/7] hw/arm/sabrelite: Open code DEFINE_MACHINE_ARM
In-Reply-To: <0528e7cd5cff7ce171b0aad0093a5e77e07c139a.1773866323.git.matyas.bobek@gmail.com>
References: <cover.1773866323.git.matyas.bobek@gmail.com>
 <0528e7cd5cff7ce171b0aad0093a5e77e07c139a.1773866323.git.matyas.bobek@gmail.com>
Message-ID: <8C7E8510-66CE-4AA2-ADAC-F7549D04A16B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Am 19=2E M=C3=A4rz 2026 19:13:08 UTC schrieb "Maty=C3=A1=C5=A1 Bobek" <maty=
as=2Ebobek@gmail=2Ecom>:
>Open code the DEFINE_MACHINE_ARM macro in preparation of creating
>SabreliteMachineState class=2E The name field in TypeInfo initializator
>is left as string literal since the macro would expand into this=2E
>
>Signed-off-by: Maty=C3=A1=C5=A1 Bobek <matyas=2Ebobek@gmail=2Ecom>
>---
> hw/arm/sabrelite=2Ec | 23 ++++++++++++++++++++++-
> 1 file changed, 22 insertions(+), 1 deletion(-)
>
>diff --git a/hw/arm/sabrelite=2Ec b/hw/arm/sabrelite=2Ec
>index db5669c5c2=2E=2E40ee8196ac 100644
>--- a/hw/arm/sabrelite=2Ec
>+++ b/hw/arm/sabrelite=2Ec
>@@ -114,4 +114,25 @@ static void sabrelite_machine_init(MachineClass *mc)
>     mc->auto_create_sdcard =3D true;
> }
>=20
>-DEFINE_MACHINE_ARM("sabrelite", sabrelite_machine_init)
>+static void sabrelite_machine_class_init(ObjectClass *oc, const void *da=
ta)
>+{
>+    MachineClass *mc =3D MACHINE_CLASS(oc);
>+
>+    sabrelite_machine_init(mc);
>+}

Yes, this separation of concerns looks cleaner!

Since this function will be merged with sabrelite_machine_init() in the ne=
xt commit, let's merge the two functions here=2E This avoids the intermedia=
te function and makes the next commit easier to comprehend=2E

>+
>+static const TypeInfo sabrelite_machine_init_typeinfo =3D {
>+    =2Ename          =3D MACHINE_TYPE_NAME("sabrelite"),
>+    =2Eparent        =3D TYPE_MACHINE,
>+    =2Eclass_init    =3D sabrelite_machine_class_init,
>+    =2Einstance_size =3D sizeof(MachineState),
>+    =2Eabstract      =3D false,
>+    =2Einterfaces    =3D arm_machine_interfaces,
>+};
>+
>+static void sabrelite_machine_init_register_types(void)
>+{
>+    type_register_static(&sabrelite_machine_init_typeinfo);
>+}
>+
>+type_init(sabrelite_machine_init_register_types)

With the above:
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

