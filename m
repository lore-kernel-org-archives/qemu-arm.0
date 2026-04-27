Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D7FFF8860
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 12:32:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHL8H-0002ae-NE; Mon, 27 Apr 2026 08:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHL87-0002WP-AD
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 08:32:04 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHL85-0007WC-9p
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 08:32:02 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6563f83ae9fso3964297d50.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 05:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777293120; cv=none;
 d=google.com; s=arc-20240605;
 b=PBe9wgwbCpD5aCIGSMcKx2IFM+2y2NUxKns/vOcAvxOS0TaNadJz1vAlPiEVxEvT1q
 qIKV6WzcIj95tdXUlvAXt9AhQ5lwh0n7Go0nlkGeeODG6ZIbK3oyiJHLjKuplEpoj6ZF
 Mr0LVxDccusKGZRIYrAk+HrHdsQKbPhfpSMP77FfexUjiLadB1uKVCDuV/76xG3ihEXK
 /+/2i+ItNp3GRpyqqPc6bqjFIbrHvRWRGmwj80Uee2HxSBnWiXVvXCxSusVfLXfzm9sf
 FI3peyj/LQYjlB5zmv59IA8Gllz7fLX6+FPKjRaTAxung/+GQQE2bMf+Q3QkB1spKczQ
 bGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=J3QRfePnkbaU/eND3pagKGbin8yvdbzMxXJkv2nz9qM=;
 fh=hAm7vkgwQVxZhIeC8ymQ9qB2u4lXwhOnR+2fciLGaqY=;
 b=SHTG61HhwxTUj5+3sOZ0LXRXxHBPOTuV8Y3AXQsumKsI9LIQwUi2MW93bx0tEuzI3f
 C80KP/08+ezTpkGwUFp3YyvTier1hOLsDR4Ep8O1srwrLhFkYAEGC1Ykad+swiakRZKN
 capMFMCFw0lKSGVui/1Pf+VQC3xOAANeGJouzEsgH08QqZxh9exCJAaXi515H2cjw8uM
 0Efo7geTBjHwD7Rapa3wIcZHdh4g+WgIz2lrsuxLCDYJnov2XnmMmLFKYYFuaZkg4uED
 C0If6eDybPFhANg+M+uJrWR/vNgKh5nyh6z6+6Jn3UGS+ix2zj+SM+j/GZqKQE0VVFV5
 Xuvg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777293120; x=1777897920; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J3QRfePnkbaU/eND3pagKGbin8yvdbzMxXJkv2nz9qM=;
 b=Agr/AeBTZqC2hgzFNYnh8O3l1Og6YvMOhKTctrajRcKtaYgNuj4dxCnBC5yAL12CKS
 t2pDRmhpHC1lmL+UY+gNqbKUCsGiv1QHXPAc8i1E1TerMWmMAO/TOU1FSmQfHrwwBfbV
 hlpuGxADGZDUZ5tI62R00YAqfCiX5GGC9dCePFE/5IXBApRWcud3vzpsWQspypjz8rnP
 cS/4HOD0atEt6eFWURsYPEVOZdm8b0S/ZKvMRiWvfxs0nOAQs2TEwxjkShO7u8pGyY6R
 /ntokta73Y6hnRgde6Qz1kUG5stSvjDSksEW0Zd2x05MSfilGRzQSixQD2ZOeBbg3tc0
 0izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777293120; x=1777897920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J3QRfePnkbaU/eND3pagKGbin8yvdbzMxXJkv2nz9qM=;
 b=m5vvXhoGMbFXWwTqVg6sqKBmOQMWILgwQm5mY0CoelwKDVe85RfU6xQvuljT8LTcYe
 pAe8yxKGCm64INL2gH2JLJVZulgKPGPM/Ueeb1pdaEePT4d788WdscgZyF6IVlD+paof
 uCaK2GnxOQlFuxR0upUd8+1X/lgn3D9bkShBZG5Jzj4rz2JMPIi9e1aMABV+OW6hklNX
 oNNuuQeFPxZRIWWe184flX2LWvhyHyJ/r4hufFhdoputEIJDW/tdBDW41QIGrpgAmp4M
 GTGZksVYXjBGFGm42u/OVY5XqCqmr5TvVSX/ppKzsmkyerym6Y5WN6027En31YXY3Sc6
 kZ9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1IChzS5TxZoU4rAQXVgUZ2LVduLJGijdxetqTVOzVbW/jQYb7BxNVXDGR/c+VYZPfB/B3DMquog==@nongnu.org
X-Gm-Message-State: AOJu0YwRkMjr+nWxABvO/nuMnwYyjiGjJAkeAITmeuLaezW4oaT+ZI6b
 ZX90M6YKU+N96QJ55zFwnbhWxy0xsYB7FlPbWnXapDG7CSAANcEatv3C9BCCS3kG8zZo9MpWyVR
 hoRvf99q0DVFxtQQ7a/Ix/1eYdW6VR1MtV77/mPhWDtxgLbFfAGtu
X-Gm-Gg: AeBDiesaOuSHi7yPGMidtSMQqYVLZdwKjPcq8NW4WKWESLJomVOIYFsHjwqdFyZ9IRT
 5kJSPY7s4EUkCyDZo6St4RqBHPfpraczHrDecUjnR/kYhIZu0zEkw40tHjYSwg7eyZf6wjqfVKc
 ZKDjhBGSrk2ACv1W7W9vjRr85gwYBH0t610qt5wl9ycx38X9WB2WEtmsjB3q0Q6wyRw7aIQ3RqX
 Iy/1F+AvlajhhgIuk/7BN0qCevSu66cRVWg6ZmMwKIqbv+3c12rweSMwrBPntm9mHDcf7AkrgQU
 hk7tkcXHRMyfIY04ZgxjDwlwzm4roVfpEbAzK27cg+tiQcHh6OSCWDbZ7febtZIyI1sRrZWS+il
 ZJA==
X-Received: by 2002:a05:690e:b81:b0:652:dd57:af1f with SMTP id
 956f58d0204a3-65310b87f31mr36640237d50.61.1777293120154; Mon, 27 Apr 2026
 05:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250929165230.797471-1-clg@redhat.com>
 <20250929165230.797471-3-clg@redhat.com>
 <CAFEAcA8Dja4yqnaHsXc9pg6EzEAVZFR3=E0sGa9Bz4bvuf+_bA@mail.gmail.com>
 <CAFEAcA8nyngyeWi4Vb=ZWJfxNsyFfSqFJMnWnYG2ce95xaCfPA@mail.gmail.com>
 <SI6PR06MB76313BC0842AFB0A8C204E42F7362@SI6PR06MB7631.apcprd06.prod.outlook.com>
 <94332917-c953-4ccf-9e9e-ccb0f2c784b8@redhat.com>
 <c6b6f903-2afe-4753-a522-64ffdbe427c8@redhat.com>
 <SI6PR06MB763139AAA2BDD4AB53767B56F7362@SI6PR06MB7631.apcprd06.prod.outlook.com>
 <9137d6f9-42e0-4855-bf9e-f345bf6ed2c0@redhat.com>
In-Reply-To: <9137d6f9-42e0-4855-bf9e-f345bf6ed2c0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 13:31:47 +0100
X-Gm-Features: AQROBzCFHHxiec420iorzbM89vkwP45XAuSzyhidlf6C6maxrLDx0O1hzx-ROzY
Message-ID: <CAFEAcA_uid3LJwUZbbgpx6v1wjTbTwAxr8Je285XK8SwHHr0_w@mail.gmail.com>
Subject: Re: [PULL 02/32] hw/misc/aspeed_sbc: Connect ASPEED OTP memory device
 to SBC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: Kane Chen <kane_chen@aspeedtech.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 27 Apr 2026 at 11:53, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
> Thanks a lot. Peter's test is quite nice too.
>
> build :
>
>    $ ./configure --cc=3Dclang --disable-docs --enable-asan --target-list=
=3Darm-softmmu,aarch64-softmmu
>
> and run :
>
>    $ cat > aspeed-otp.txt
> # set SBC R_ADDR
> writel 0x1E6F2010 0x1000
> # set SBC R_CMD to CMD_READ
> writel 0x1E6F2004 0x23b1e364
>
>    $ ASAN_OPTIONS=3D"fast_unwind_on_malloc=3D0" ./build/qemu-system-arm -=
M ast2600-evb  -accel qtest -qtest chardev:repro -chardev file,id=3Drepro,p=
ath=3D/dev/null,input-path=3Daspeed-otp.txt -display none
>
> Something we should do more often.

I would quite like to get a sanitizer build/test run into our CI;
I worked through a lot of the existing failures in the runup to
the 11.0 release, but need to get the last few fixes in (and
sort out the actual "run in the CI" part, including figuring
out what split between CI jobs and what timeouts to use).

thanks
-- PMM

