Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CABC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 10:41:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh3Ex-0004Tp-Ga; Tue, 07 Jul 2026 06:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wh3Ev-0004T9-KE
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 06:41:21 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wh3Et-0003rL-Qd
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 06:41:21 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c029505b389so73215566b.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783420878; x=1784025678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tvOJFMQbr0WF0C5g9i+mdq40kbvleSRKXRNdDEzP2U=;
 b=Qb7ETC6kLEy571Idlfg8mDBud+X7FErltgYBemWfWPk3itKU6PBK/ZVy2mcC8UmXfs
 uZBgos/GvdPUERlUh9Av97KG+L2FKTDIn9lQedjfjd4FsA0LYkoSO6uM74MmYPbgfSAM
 H4XA7G5DFW/c/VgzlpRYvNK83XuWGh927hPafMHWiaDFVbK2zRa35w4dchbivpaAf3M6
 uLwdUxf8DepyCNUo7Nei6VPS/uthgU5q7neI3d5tI1LBIGIDBNe9bD2pWQpnhAmn+drX
 AxF9Yx9OuXvZWfgL3OudAixQiFFaOrWMHRKkp7jMVhAL7d72D17Yc5yCmFLTgYUS/gRP
 mGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783420878; x=1784025678;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+tvOJFMQbr0WF0C5g9i+mdq40kbvleSRKXRNdDEzP2U=;
 b=BLZuidj/DZ+qs6RVrxEWhVH7r3GR91rv7pRKLM4EjOn69yKx8nVyAqk2bP06yoxJYi
 nZSaBgzw+wTh/q66dbEhRGp6f1wxhqZUhve+ZsiR9HrA9zIv7Jelc1JyDb9j+7jaTy5M
 1qi66i1Erh6PyEbn29htBk1QjLhd4Yf/0+4iqDc+/f89Fq/SIv5XETTX07arO1KQGO1o
 KMuO4tQFdg/mhghxdkbZfz+8TrBbtk8QuludzUN+ZIwrU9vM9soHKkjqfAIMZZ98APC2
 q3kXXzvOPPn8yekia8fq8lRtzV8svo1dnpnCW0W29fFX6Vu2ovzjI3h3vJ2YfInlU5Fe
 n7Nw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4vE30Cp392cZ5Y/3atUwfaPfrCcFECoEmZAwUxxuFvKHCq6eEC0tCDkBOvZGOPYo6U6ikO4Ovxw==@nongnu.org
X-Gm-Message-State: AOJu0YwBfx4mt0kIOHx1nBt57FhOB12J4uNmyglXGgYYy/n2/QEsKzuk
 qqctNVDCpVvoFJNNfUrg7sQFiFFPoKQ940J+QoKqHhxmdlsoNwOsPt5u
X-Gm-Gg: AfdE7cnbi6D6N7Njv1Mm7hQ12p1UvarY8zIzKfFBn8ynsyQQrhCEY/7zEI4jwwZL/NG
 iPi/Ivq+5XGvO1u9Xqz/Ae37StkMOkLd0V/+p3VxGWyfEWVw3v8JWgMjFaUuGHUT8jZrxKKEanv
 710y9mEkl22bNptx4Jf6aIqvB0ysCND7J1C9S78whQm0o2jjEFdnvVdtmQIn6MCMwa8pMIIqCvV
 HY3U75em4MKJYP2Oal2dGJWOm711xekyMpnrFL/W7v3hPMgDsWM14NRHHYXlmEVltf3prpNAqR5
 dMUfhr1ZTvLIAQ2jJL1UBMppwThBu4BhDMADRY0sSiMIkOi13d2Eqk0J6Kk174GXWKJYjce8U8N
 H/JkMFSAxInjRyovYYJjZpKS8//THY6UtxddWpEfAKpHjvQwXdaJ9E3ntqoHaXqoNwVEJguYYZC
 chOkZ2+ZcTkALGpSpOUw==
X-Received: by 2002:a17:906:fe02:b0:c12:5dca:864a with SMTP id
 a640c23a62f3a-c15ae988144mr137835966b.5.1783420877823; 
 Tue, 07 Jul 2026 03:41:17 -0700 (PDT)
Received: from ehlo.thunderbird.net ([62.214.191.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ad9bca17sm106985066b.32.2026.07.07.03.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 03:41:17 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:41:10 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
CC: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Matyas Bobek <matyas.bobek@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: Re: [PATCH v2 0/5] hw/arm/fsl-imx8mp: Add inital FlexCAN support
In-Reply-To: <519f6e43-5273-4426-b673-71cff44daffa@oss.qualcomm.com>
References: <20260702184038.178196-1-shentey@gmail.com>
 <519f6e43-5273-4426-b673-71cff44daffa@oss.qualcomm.com>
Message-ID: <CEDCEA0C-26CF-402D-925C-3718644F9171@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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



Am 6=2E Juli 2026 13:25:51 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <phil=
md@oss=2Equalcomm=2Ecom>:
>On 2/7/26 20:40, Bernhard Beschow wrote:
>> Now that FlexCAN emulation has landed in master, let's add it to imx8mp=
-evk as
>> well=2E While the real i=2EMX8M Plus supports CAN FD which isn't emulat=
ed yet, the
>> non-FD mode works well under Linux: It is possible to use `cangen` and =
`candump`
>> either way on the host and on the guest, as described in
>> docs/system/devices/can=2Erst=2E
>>=20
>> This series consists of five patches where the first four are preparati=
ons=2E
>> The last patch integrates FlexCAN into the i=2EMX8M Plus SoC and EVK bo=
ard=2E The
>> first preparation addresses the review comment from [1], and could be a=
pplied
>> independently=2E
>>=20
>> It would be nice if this series could make it into 11=2E1=2E
>>=20
>> Testing done:
>> * Start imx8mp-evk and run `cangen can0` there=2E Observe on the host t=
hat
>> `candump vcan0` prints the traffic=2E
>> * `make check`
>>=20
>> v2:
>> Thanks for the very helpful and super quick review, Phil! Here we go:
>> * Add patch "hw/net/can/flexcan: Wire clock control module via link pro=
perty"
>> * Have separate MemoryRegionOps for 32 and 64 bit
>>=20
>> [1] https://lore=2Ekernel=2Eorg/qemu-devel/77d5891c-de12-467e-8746-02fe=
43121e3e@oss=2Equalcomm=2Ecom/
>> ---
>> base-commit: a59157f98f0b69b0bbdb26bc15fbc4d6c8060799
>>=20
>> Bernhard Beschow (5):
>>    hw/net/can/flexcan: Wire clock control module via link property
>>    hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
>>    hw/arm/imx8mp-evk: Open code DEFINE_MACHINE_AARCH64
>>    hw/arm/imx8mp-evk: Introduce FslImx8mpEvkState
>>    hw/arm: Add basic FlexCAN3 support to TYPE_FSL_IMX8MP and imx8mp-evk
>
>Peter, you just sent your (IIUC) last target-arm PR=2E I'm about
>to post my hw-misc one, do you mind if you take this series which
>is fully reviewed/tested?

Thanks a lot Phil for your R-b's!

Any chance we can still get this series mergend for the upcoming release?

Thanks,
Bernhard


