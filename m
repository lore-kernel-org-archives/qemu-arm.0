Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E48606A319
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 22:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LM59REBt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xK1c3-0003dF-10; Thu, 22 Oct 2026 18:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xK1c1-0003c5-AT
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 18:50:17 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xK1bz-0000Dd-GK
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 18:50:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a20b122af8so2403725e9.0
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 15:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792709414; x=1793314214; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tLCX0MFq2lPBGxec7+w1MDWPAWgf45VNplsQexTDOeM=;
 b=LM59REBtE6arJOsjhJiRoGp1+3Y//OUG5wDPDkQkNbDL6D4+/kdJF/060Pe90LFENJ
 dweVeTVh1tQeM/hnGl2vD/Af0Pn9hPxuZng3OMH4TjjVJDhGMnCcJ9g1iHT4Gp6MG9uW
 MLGDxqlxla9+3/fCdDUkIpm8HnaO1p2JvZm+jJC4eZqWLDnS8fnOa7Vb+ULkCakzAIwb
 GOg54wbEpPGkMl9o7Prd5jn8NLoILg1fO3K6nYHWhzgCAFcntIZs/AW8xZ2nI0aESutZ
 51oKR/hgnKCSDChW3MNCp17b3ViIKrrSgQTrSZO2flNmGT6L/dTcYVGK96YGr9skt6Fc
 fAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792709414; x=1793314214;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tLCX0MFq2lPBGxec7+w1MDWPAWgf45VNplsQexTDOeM=;
 b=gKa1sbUHZxhiuRvwOnpLZgeyhzQG+ZYXcePCgiZtDxCaIhBerGOmigjHthTNtOajd1
 NUZa0pyPHzEzPpLBS9lnuKurKUJR+05eakYATWYScKDkNgfeCEsD89+MistZznfwdf/O
 DXtYB1QuNmaULiyBjHVzNq6OA+06Wr7s5HcFysTh2rFYInw+HUB3cdn+ZNMz/+DFIYn7
 wyG4bZIE65q2O/9FG9+K9EP3o4NfrddfNQr6WpDcy+Ao2M1mnYbazXqvDeuuR1//0QYg
 LU2WOorplGWPVCUIpneyzWWYt8bG16cone0yIcWOjpxRqyVW9O4DJ8/rC0q2FgX7RX4I
 oOow==
X-Forwarded-Encrypted: i=1;
 AKwUvByLUE9PuXMNnlu3CNNmt+s4vPwFR0FKo5im7sHHyfGevhLnOq5IKiIjIeoxd1GXGg0W7iXhG6lVmw==@nongnu.org
X-Gm-Message-State: AFq9FYKZ4jB7XmqbMwXrODhsgxsb0FRDB5jHLgQJvV4pd4fUVetez34F
 yhSbqJhLjJsJwCYmjcqgghcalhfDfNEez7OJhB/Bn5Fj59NOXV4xCzBWAwr7xw==
X-Gm-Gg: AYBFou1RQKkFS+XSi/C3bxE6oVFUApT1Y8SyjQV9f/KGrJi1+oTPv1sRc/XH/t/eRXc
 FBNRmmxM1F+NmfwwMeX7Ib09JdiLPcr0cSshyB8mQL028vpJU5lroV6hQXHvzBoPlFiyHZ/zJ++
 U7IMiLMOgbD/I5vJAE3g9CBXEc4UgwDamt5rZdMs0d23tbWEN1fBvp+TTfaWKYmYA52MjwPn3mu
 1HZZ9VTH+mCYkfZCk+oOiK65s48DRn+jNeAF5xZLFhwFBjmvBua9oNYwaiS+nAs6lwWiVII/Ny8
 CUGINb7gNPBilkCHt6kzm5AoBcBi+qxvxRzwSqRtrYFauYaH4HocA1xloGTeFhYE8UjoK6LTGr0
 zOuy0GudY2LHyrVsZ84aedFt0vO9i9oRBSOgwlBkCl8YrSEz8m1hQN5fZ2iPcMmGs+hdPpj60HB
 nuDgd/QPRJ/F3KJo0QuT3wA7tRruAXbHleTrEfpBom2UsqaeA9qJeXDFh0hnvUbj+iiO0kJKU5z
 79ePprZ0H7SQUpHAu/onSw5Q1ZfdXAjfWAv2ppD65mrbYwV3ad1U+EVtDtBHtqLxGzjMv1Xgui/
 63U9K5KLtVBSAzJv9ZAMyr6ExjzFRanc5wG2G0RxE6kjT59XtQKBsBHsdlON5xbbCSVSnKqKYwh
 /eT29mgNGuGnzlYzdBA==
X-Received: by 2002:a05:600c:1c1b:b0:4a1:e11f:b2d5 with SMTP id
 5b1f17b1804b1-4a211c7870cmr7849325e9.2.1792709413578; 
 Thu, 22 Oct 2026 15:50:13 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-1dba-0000-ec6b-a832-f355-434e.310.pool.telefonica.de.
 [2a02:3100:1dba:0:ec6b:a832:f355:434e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a210487d16sm29273725e9.15.2026.10.22.15.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 15:50:12 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:11 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 QEMU <qemu-devel@nongnu.org>
CC: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_09/10=5D_docs/system/arm=3A?=
 =?US-ASCII?Q?_Document_MCIMX6UL-EVK_Buildroot_boot?=
In-Reply-To: <20261014045605.399684-10-bin.meng@processmission.com>
References: <20261014045605.399684-1-bin.meng@processmission.com>
 <20261014045605.399684-10-bin.meng@processmission.com>
Message-ID: <8713C764-0DB7-4C17-ACB8-F2A4987963C1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Am 14=2E Oktober 2026 04:55:59 UTC schrieb Bin Meng <bin=2Emeng@processmis=
sion=2Ecom>:
>Provide verified instructions for U-Boot and direct Linux boot using
>Buildroot images=2E
>
>Signed-off-by: Bin Meng <bin=2Emeng@processmission=2Ecom>
>
>---
>
>(no changes since v3)
>
>Changes in v3:
>- Document the RAM limits and firmware geometry rounding
>
> docs/system/arm/mcimx6ul-evk=2Erst | 72 ++++++++++++++++++++++++++++++++
> 1 file changed, 72 insertions(+)
>
>diff --git a/docs/system/arm/mcimx6ul-evk=2Erst b/docs/system/arm/mcimx6u=
l-evk=2Erst
>index 8871138ab3=2E=2Ea84b447019 100644
>--- a/docs/system/arm/mcimx6ul-evk=2Erst
>+++ b/docs/system/arm/mcimx6ul-evk=2Erst
>@@ -3,3 +3,75 @@ NXP MCIMX6UL-EVK (``mcimx6ul-evk``)
>=20
> The ``mcimx6ul-evk`` machine models the NXP i=2EMX6UltraLite Evaluation =
Kit
> MCIMX6UL-EVK development board=2E It has a single Cortex-A7 CPU=2E
>+
>+The minimum RAM size is 16 MiB and the maximum is 2 GiB=2E
>+The MMDC geometry reports the largest power-of-two capacity
>+not exceeding the configured RAM size to firmware=2E Direct Linux
>+boot uses the full configured RAM size=2E
>+
>+Booting Buildroot images
>+------------------------
>+
>+Build the SD card image with the tested Buildroot version:
>+
>+=2E=2E code-block:: bash
>+
>+  $ git clone https://gitlab=2Ecom/buildroot=2Eorg/buildroot=2Egit
>+  $ cd buildroot
>+  $ git checkout 2026=2E05
>+  $ make imx6ulevk_defconfig
>+  $ make
>+
>+The following examples use images generated by Buildroot::
>+
>+  IMAGES=3D/path/to/buildroot/output/images
>+  QEMU_BUILD=3D/path/to/qemu/build
>+
>+The generated raw ``sdcard=2Eimg`` is about 84 MiB, which is not a capac=
ity
>+supported by QEMU's SD card model=2E Resize the image in place to 128 Mi=
B::
>+
>+  "$QEMU_BUILD/qemu-img" resize -f raw "$IMAGES/sdcard=2Eimg" 128M
>+
>+This modifies the Buildroot output image; rebuilding the image restores =
its
>+original size=2E
>+
>+The SD card must be attached to USDHC2 with ``index=3D1``=2E It is conse=
quently
>+named ``mmc1`` by U-Boot and ``mmcblk1`` by Linux=2E The first partition=
 contains
>+the kernel and device tree, while the second partition contains the root=
 file
>+system=2E
>+
>+U-Boot boot
>+~~~~~~~~~~~
>+
>+The machine does not model the i=2EMX6UL Boot ROM or its SPL loading seq=
uence=2E
>+Load U-Boot proper at its linked address::

Extra ':' which prevents the code block being rendered correctly=2E Removi=
ng it fixes it=2E

>+
>+=2E=2E code-block:: bash
>+
>+  "$QEMU_BUILD/qemu-system-arm" \
>+      -M mcimx6ul-evk -m 512M \

The `-m 512M` will become redundant once my imx cleanup series lands=2E Sa=
me in the command below=2E

>+      -device loader,file=3D"$IMAGES/u-boot=2Ebin",addr=3D0x87800000,cpu=
-num=3D0 \
>+      -drive file=3D"$IMAGES/sdcard=2Eimg",if=3Dsd,index=3D1,format=3Dra=
w \
>+      -nographic
>+
>+The default Buildroot U-Boot environment selects ``mmc1``, loads ``zImag=
e``
>+and ``imx6ul-14x14-evk=2Edtb`` from the first partition, and starts Linu=
x with
>+``/dev/mmcblk1p2`` as the root file system=2E A ``bad CRC`` warning whil=
e loading
>+an uninitialized persistent U-Boot environment is expected; U-Boot conti=
nues
>+with its compiled-in defaults=2E
>+
>+Direct Linux boot
>+~~~~~~~~~~~~~~~~~
>+
>+QEMU can load the Buildroot kernel and device tree directly=2E The kerne=
l then
>+mounts the second SD card partition as its root file system::

Extra ':' here, too=2E

Best regards,
Bernhard

>+
>+=2E=2E code-block:: bash
>+
>+  "$QEMU_BUILD/qemu-system-arm" \
>+      -M mcimx6ul-evk -m 512M \
>+      -kernel "$IMAGES/zImage" \
>+      -dtb "$IMAGES/imx6ul-14x14-evk=2Edtb" \
>+      -append "console=3Dttymxc0,115200 root=3D/dev/mmcblk1p2 rootwait r=
w" \
>+      -drive file=3D"$IMAGES/sdcard=2Eimg",if=3Dsd,index=3D1,format=3Dra=
w \
>+      -nographic

