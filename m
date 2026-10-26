Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C6E606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UHxt5G6P
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLJcF-00044g-2h; Mon, 26 Oct 2026 08:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xLJbv-0003iA-B4
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 08:15:33 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xLJbq-0006HV-5l
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 08:15:29 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6b1d8944cb0so4544647a12.3
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793016922; x=1793621722; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4johF67sE5MfY9zt0bmfEG2YtJbZ7EYM7PYAvmM4dRg=;
 b=UHxt5G6Pn9v7v+u5HHWBWzc01zkBIwWIVmb9UEfjdSvQJSoeX1fq/xT0CLNwtiTXxf
 qGOJzj9emvSwjzafxQF/X43xRWaNfknwWUpADg+y/kaaAQKVTlLES61dW6NNFoD4nOjh
 WvQjun+2whXboNKPWSLA/+VxIUmNK3QRMzB9hGQFvMR2Ss8jISPzgl8J0EBH/5vAZO3F
 suypdY9Aeyll4KH8d0QDoLAmwsIE4fN+1HSQkuRxjsM1Ln05g4oCjYOtGK3Kj0SleFNh
 qGDo3uCeQFW2Nk11ciBM7wrt0pSQnomMXwy9ZjuBz2f3adED++Hg7Xvu7CrymWgnZaIx
 cj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793016922; x=1793621722;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4johF67sE5MfY9zt0bmfEG2YtJbZ7EYM7PYAvmM4dRg=;
 b=ZHjKLvyCrqKxY/gbgAm2yx5rNXSVXxeHIc41JO96UDYv9mfDP61pPJuwfF1CslfJdL
 9VsrXv47w3X5B8bE2+BSVdVXBQlNkWzMoS0HTdx6HU784IaHbW/aHQxeBOr0rUA8k/pB
 BHReCwhvCrmTOS7iZErbh/L2AO6aMPhZQpbbwW1moQEDBLuRCjeUW15nIwFMYUb5NHzE
 vuYQd20fshjpx5/6KBHWoiQ28mSypsNCS9bp4aXsXyf4OVoAOR0z0jTsKJInal+CxM6/
 Op+45CtXI2ivLRwwQu90+q4dHpcaWsh2Q/0v3htbkn6EqEoCtuG7482pZIpWo1pZDOXB
 4Hdg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2evNwv6C3SGD3ccnYSYNIaBTRKZPR1DEnGhym7larQQPFiie2xshwU9XPfymcDYWwNibokncsjQ==@nongnu.org
X-Gm-Message-State: AFq9FYJJpJMLGJI+YjnmOLLCgz/sJwMo9BZpCVAO4xtJr3BoL02B96Gz
 rnHOf97PW7sKeg1Xf7gu5eXRxwr+TxOntrCJiuyfANFY8D53iKyrPcN2
X-Gm-Gg: AYBFou3Om+8eGewTTOMGj5g9dVzXQUlEaagbuy+kiiat7Uh/wI/tuyWB+CwKfjLV4nr
 vO0XuaNBhDIeBXNnq9EcUZ6GCuc/SAvvlXi3seEf2sXld9ASrW7y+XiOoJIWr3qSzpeQwwtLgAw
 ePnx22Z0TTcYYk89+keuHhR5YApmKpj66xKeHUZPzz5bUWmjlap0pqtq9Kk4n7SO5RTyMpSJM7n
 VTb0HDQxo5Gr1beUV/SaLd4LYGDZ0ktw5q0g2mRugaNYdgdnUNlXs5tHsxean0vTWcvKCbhLGIQ
 ZgV/VQZ/kA5BDYAI1wYkVPWHz7NHn8/TFvRnVyiO4+CcrkHhpQEYpmHFELsUkKboWlw0yv4o27l
 STTd+Qr3VNeJmsnrOpQedBpl+hlj6c067hwQiQ/FS7YigDkw01mm08wN9y/MPF2qZl3qGV1IjOX
 qJVVH1K94VqxgcuhqCseFbCKuSaqBDLSLaKmsvUSIUZzKgxNpxCg08CX0NX8Y/CEA+4YUseVt1P
 EbGXVO5S2+t9ljEVUjAW6y/0nmV1gZWvUADZiw5DFfIK7A2g0xx8VijHH1pQcrkQC1FSjFOY45w
 Jj8g8OHptnnp3NHRJmVHhCChPXR0/ZJJFH7wRxXiig3vAQI=
X-Received: by 2002:a17:907:72c7:b0:c46:7643:ae91 with SMTP id
 a640c23a62f3a-c46bdbeff8emr741397366b.8.1793016922216; 
 Mon, 26 Oct 2026 05:15:22 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (business-090-187-110-129.90.187.pools.vodafone-ip.de. [90.187.110.129])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd4ea608sm304747766b.21.2026.10.26.05.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:15:21 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:43:31 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 QEMU <qemu-devel@nongnu.org>
CC: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_09/10=5D_docs/system/arm=3A?=
 =?US-ASCII?Q?_Document_MCIMX6UL-EVK_Buildroot_boot?=
In-Reply-To: <8713C764-0DB7-4C17-ACB8-F2A4987963C1@gmail.com>
References: <20261014045605.399684-1-bin.meng@processmission.com>
 <20261014045605.399684-10-bin.meng@processmission.com>
 <8713C764-0DB7-4C17-ACB8-F2A4987963C1@gmail.com>
Message-ID: <ED24EF65-6D3E-43A2-BB80-C8CE87404390@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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



Am 22=2E Oktober 2026 22:50:11 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 14=2E Oktober 2026 04:55:59 UTC schrieb Bin Meng <bin=2Emeng@processmi=
ssion=2Ecom>:
>>Provide verified instructions for U-Boot and direct Linux boot using
>>Buildroot images=2E
>>
>>Signed-off-by: Bin Meng <bin=2Emeng@processmission=2Ecom>
>>
>>---
>>
>>(no changes since v3)
>>
>>Changes in v3:
>>- Document the RAM limits and firmware geometry rounding
>>
>> docs/system/arm/mcimx6ul-evk=2Erst | 72 +++++++++++++++++++++++++++++++=
+
>> 1 file changed, 72 insertions(+)
>>
>>diff --git a/docs/system/arm/mcimx6ul-evk=2Erst b/docs/system/arm/mcimx6=
ul-evk=2Erst
>>index 8871138ab3=2E=2Ea84b447019 100644
>>--- a/docs/system/arm/mcimx6ul-evk=2Erst
>>+++ b/docs/system/arm/mcimx6ul-evk=2Erst
>>@@ -3,3 +3,75 @@ NXP MCIMX6UL-EVK (``mcimx6ul-evk``)
>>=20
>> The ``mcimx6ul-evk`` machine models the NXP i=2EMX6UltraLite Evaluation=
 Kit
>> MCIMX6UL-EVK development board=2E It has a single Cortex-A7 CPU=2E
>>+
>>+The minimum RAM size is 16 MiB and the maximum is 2 GiB=2E
>>+The MMDC geometry reports the largest power-of-two capacity
>>+not exceeding the configured RAM size to firmware=2E Direct Linux
>>+boot uses the full configured RAM size=2E
>>+
>>+Booting Buildroot images
>>+------------------------
>>+
>>+Build the SD card image with the tested Buildroot version:
>>+
>>+=2E=2E code-block:: bash
>>+
>>+  $ git clone https://gitlab=2Ecom/buildroot=2Eorg/buildroot=2Egit
>>+  $ cd buildroot
>>+  $ git checkout 2026=2E05
>>+  $ make imx6ulevk_defconfig
>>+  $ make
>>+
>>+The following examples use images generated by Buildroot::
>>+
>>+  IMAGES=3D/path/to/buildroot/output/images
>>+  QEMU_BUILD=3D/path/to/qemu/build
>>+
>>+The generated raw ``sdcard=2Eimg`` is about 84 MiB, which is not a capa=
city
>>+supported by QEMU's SD card model=2E Resize the image in place to 128 M=
iB::
>>+
>>+  "$QEMU_BUILD/qemu-img" resize -f raw "$IMAGES/sdcard=2Eimg" 128M
>>+
>>+This modifies the Buildroot output image; rebuilding the image restores=
 its
>>+original size=2E
>>+
>>+The SD card must be attached to USDHC2 with ``index=3D1``=2E It is cons=
equently
>>+named ``mmc1`` by U-Boot and ``mmcblk1`` by Linux=2E The first partitio=
n contains
>>+the kernel and device tree, while the second partition contains the roo=
t file
>>+system=2E
>>+
>>+U-Boot boot
>>+~~~~~~~~~~~
>>+
>>+The machine does not model the i=2EMX6UL Boot ROM or its SPL loading se=
quence=2E
>>+Load U-Boot proper at its linked address::
>
>Extra ':' which prevents the code block being rendered correctly=2E Remov=
ing it fixes it=2E
>
>>+
>>+=2E=2E code-block:: bash
>>+
>>+  "$QEMU_BUILD/qemu-system-arm" \
>>+      -M mcimx6ul-evk -m 512M \
>
>The `-m 512M` will become redundant once my imx cleanup series lands=2E S=
ame in the command below=2E
>
>>+      -device loader,file=3D"$IMAGES/u-boot=2Ebin",addr=3D0x87800000,cp=
u-num=3D0 \
>>+      -drive file=3D"$IMAGES/sdcard=2Eimg",if=3Dsd,index=3D1,format=3Dr=
aw \
>>+      -nographic
>>+
>>+The default Buildroot U-Boot environment selects ``mmc1``, loads ``zIma=
ge``
>>+and ``imx6ul-14x14-evk=2Edtb`` from the first partition, and starts Lin=
ux with
>>+``/dev/mmcblk1p2`` as the root file system=2E A ``bad CRC`` warning whi=
le loading
>>+an uninitialized persistent U-Boot environment is expected; U-Boot cont=
inues
>>+with its compiled-in defaults=2E
>>+
>>+Direct Linux boot
>>+~~~~~~~~~~~~~~~~~
>>+
>>+QEMU can load the Buildroot kernel and device tree directly=2E The kern=
el then
>>+mounts the second SD card partition as its root file system::
>
>Extra ':' here, too=2E

With the above fixes:

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>
>Best regards,
>Bernhard
>
>>+
>>+=2E=2E code-block:: bash
>>+
>>+  "$QEMU_BUILD/qemu-system-arm" \
>>+      -M mcimx6ul-evk -m 512M \
>>+      -kernel "$IMAGES/zImage" \
>>+      -dtb "$IMAGES/imx6ul-14x14-evk=2Edtb" \
>>+      -append "console=3Dttymxc0,115200 root=3D/dev/mmcblk1p2 rootwait =
rw" \
>>+      -drive file=3D"$IMAGES/sdcard=2Eimg",if=3Dsd,index=3D1,format=3Dr=
aw \
>>+      -nographic

