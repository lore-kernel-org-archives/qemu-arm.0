Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B09CA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:54:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBXLz-00086O-6D; Tue, 29 Sep 2026 08:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBXLf-0007wf-0G
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:54:21 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBXLd-00085i-6u
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:54:18 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4ab201ebso3961659d50.3
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790686456; cv=none;
 d=google.com; s=arc-20260327;
 b=GefIumlTfc9r84fLaiG1YNKOoAkPS/IdNzjUR3FZ9fcac87P0gcpn/wGuBjyJvIP1n
 fVz5FeNiv5FumwQZ3GoOrlBIIIuPP4KG0KbOS971k29TgS+eTHvTSl7dD6+b10tryCee
 jY197EkH8fGf9UpJzw+9wo5t6Gv7dZ/4VWdqHCka+XnLTMOMHBJfcPe8hnZfraorl7DI
 k5EILqCqynaz46LWkLwNG6zTov4d7h3BtIEOrHnbCCS4kkbT84ZkUzsOd9lo1PV6jAwB
 qRwl1IuVEXWfjnna1+3KhxdceaROa4PkFdjo57k84Cj2OvP80pWkR0roqeC7IWiEj6YT
 hPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cpQxu/aM75DHDLxJAc0BYQfIufBAMqCiK2hiXV4fqh4=;
 fh=a+xhzpGyesvDReiYuKnP4p5LJo8i7GhJK+fBhkhzFlU=;
 b=GPAprXe+yBo0LIpJbykWGBSUyKrMujV33B0xPEczZiTXsBFpCqKw2jKP+1ZH60Zr/a
 XjvhG/kVz4EALi04inDb7g5NHFRVKTZDHDB+HN5oZVcV0sUQe+HCSpLoGp1vVX561suG
 8mnNu8wcb+76kK94rxgGReVkH5TXe/118f7h6wmrV6nyxkBEqoOl3rFPqMsvA1f5TTuo
 YcB4y/Vvtj+cg1EOdu6yA+yan976tXNFEP3DoYz8krLQN6rxWrcwOMgUVlQQDg4iU5KQ
 e11e41eKm6UBj5JP+rbc4tox+0Duuyw2lWGBV/Ipyd+Dq412KoF3zsT+ZU/3oaRw17Bb
 Woiw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790686456; x=1791291256; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cpQxu/aM75DHDLxJAc0BYQfIufBAMqCiK2hiXV4fqh4=;
 b=eU9YZsuBYlBjrnmYSdFMl8e0ZYweaDvrH9TrF2aCo+oObb8fZasdCcZl6Z3iEWhcYu
 R8j39ekKHplfyxPf+6OsnXW9ufyXjd457TkyROD8AwCg40XDyX/QfYK7LIA7OITLd0WO
 EfElVjdLZsvFEr6qZBPV2TpLQ3MtWXNZAvbFU+vb0ACS+FAnKKD2+TNbMff9SCRs/xQf
 6HnPiPom1AJKxuqzco5WDW4zuT6VNnmsKVyS5OkH5SoWAtYehID12NnPBotyBzNmuag8
 PTUZwCWMb0ZutUQT4uXmrLiBED1bs2cd4/x8ss7iwnsSQh14q9/b7Q4qydTK3XSvIlKy
 SypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790686456; x=1791291256;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cpQxu/aM75DHDLxJAc0BYQfIufBAMqCiK2hiXV4fqh4=;
 b=sUsgDP6yozfHKZ5TixSLbzCcNyrsWWJz24clRds3pL/ubBonOstc4uuzvnZarA4eBl
 Yybi84y+0HjpTyJN4OJlL4qHbSg8PgupzLJfEtbgFz9u5szE5cMvQam612kCW4kGTUbM
 Oy8qOWJNWLqP2TSlz0afCu5MGuzN9bLtLbLQtObNZbmQ5sIqhRStE6b1aT6iecfe8KuM
 +IHZt7c5m5RyoBa+Q+awJajtHxKAtFpr5Ifs9Qs8CbC2JM3VZvHXskZRx5QmIu5se8Fl
 uyq/lQDB7D4Rf4/r6puwRmFNdJjZQvwN8IomvErdNGIiTEL9/ZFDxwzfH3Amdyv4hD+t
 71Zg==
X-Forwarded-Encrypted: i=1;
 AKwUvBywxUEmzxgAgqSV/Qk1nSm7eQVsH3ieGHzbv2s3tTlvw0xGHA18qGV4i2iyw1wKEHALcSi60rSHJQ==@nongnu.org
X-Gm-Message-State: AFq9FYLpFqaWJfJ06R6x+l5gS1ADCUaTemhqZDCicFAda2P6wNWShqiz
 IyRiNFmjFl7/6B+0jUEBZpqYoo+3/9fje7NG2Vn+4cQfuJzFF6QTXDpTNYt0xEhPrvMlqQKRrdU
 pPBqo4p753rVBM+SK9fPxflds53QKwNZnj2/wLxHdHw==
X-Gm-Gg: AYBFou28HaBe1MlNSja8pKLloVjupOLQ1tAVONua+NwoMm3AUjQ8mHQJtcupXTeYUKB
 E9Wj1Nl1VFNWOmK9lZ3Zfr9aKx2s6sp/k2Z1FMwqpr0Xaly78w8lui87FEuED5h6dPDf80Wlq0X
 fz+5E8c0bVyKTGlvVOmfXJD9HBTTUOvo63JYF/TPs+zVB5BWExeLnEqwaRvgK3gHGy30MTNvcMm
 QCdsfSVqBMp5oXYY4LFZCW7qPITuIh6RHt4ZvptzjemXGb3rLBDVy50Q53RH9kDyk4s7dlnUWFO
 AiJI8NcP0NDil1ReBdXPZBF9+DwQGtp/XKcDY3+ylOY8TrYd3+nQML0XTFOOZb5rO2z26Qqa53n
 gjH0x8h+UNfHTZh8wL7POpEI/IEoazbBrxpLOHyM=
X-Received: by 2002:a05:690e:c44:b0:674:a22:7e8e with SMTP id
 956f58d0204a3-6740a22821cmr5361253d50.124.1790686455621; Tue, 29 Sep 2026
 05:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260921214710.29422-1-shentey@gmail.com>
 <d50928dc-f932-403e-ba86-b0708555f9d4@oss.qualcomm.com>
In-Reply-To: <d50928dc-f932-403e-ba86-b0708555f9d4@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Sep 2026 13:54:04 +0100
X-Gm-Features: AclHuK9B0Lp7XDqlak0hyxHSeZLwzL0A-k15Umvmj45fpWaQgKWwIupnvQYdQyk
Message-ID: <CAFEAcA_-+NQROn2apKAuxB0US0vL7Q0882fgY4zDGcRODaea4g@mail.gmail.com>
Subject: Re: [PATCH 00/42] i.MX fixes and cleanup
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>, 
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Tue, 29 Sept 2026 at 13:39, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 21/9/26 23:46, Bernhard Beschow wrote:
>
> > Bernhard Beschow (42):
> >    hw/watchdog/wdt_imx2: Fix handling of write-once WCR bits
> >    hw/watchdog/wdt_imx2: Remove unused attributes
> >    hw/arm/imx8mm-evk: Fix reference count of SoC object
> >    hw/arm/mcimx7d-sabre: Ignore memory transaction failures
> >    docs, tests/functional: Drop redundant CLI arguments in imx8m*-evk
> >      invocations
> >    hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM by default
> >    tests/functional/arm: Add console test for `sabrelite` machine
> >    hw/arm/mcimx6ul-evk: Have 512 MiB of RAM by default
> >    hw/arm/mcimx7d-sabre: Have 2 CPUs and 2 GiB of RAM by default
> >    tests/functional/arm: Add console test for `mcimx7d-sabre` machine
> >    hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/arm/fsl-imx31: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/timer/imx_gpt: Wire clock control module via link property
> >    hw/timer/imx_epit: Wire clock control module via link property
> >    hw/arm/Kconfig: Select missing UNIMP in config FSL_IMX8MM
> >    hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS from config IMX
> >    Kconfig: Extract config IMX_AVIC from config IMX
> >    Kconfig: Extract config IMX_GPCV2 from config IMX
> >    Kconfig: Extract config IMX_RNG from config IMX
> >    Kconfig: Extract config FSL_IMX7_GPR from config IMX
> >    Kconfig: Extract config FSL_IMX{6,7}_SRC from config IMX
> >    Kconfig: Extract config FSL_IMX7_SNVS from config IMX
> >    Kconfig: Extract dedicated config FSL_IMXx_CCM from config IMX
> >    Kconfig: Extract config IMX_GPT from config IMX
> >    Kconfig: Extract config IMX_EPIT from config IMX
> >    Kconfig: Extract config GPIO_IMX from config IMX
> >    Kconfig: Extract config IMX_SPI from config IMX
> >    Kconfig: Extract config IMX_SERIAL from config IMX
> >    Kconfig: Remove config IMX
> >    hw/vmapple/Kconfig: Remove unused GPIO_PWR dependency
> >    hw/arm/fsl-imx8m: Fix typo
> >    hw/misc/imx6_src: Avoid casting from void *
> >    hw/char/imx_serial: Avoid casting from void *
> >    hw/intc/imx_avic: Avoid casting from void *
> >    hw/misc/imx*_ccm: Avoid casting from void *
> >    hw/usb/imx-usb-phy: Avoid casting from void *
> >    hw/net/imx_fec: Trace with QOM path where easily possible
> >    hw/net/lan9118_phy: Trace with QOM path
> >    hw/watchdog/wdt_imx2: Trace with QOM path
>
> If no objection I'm queuing the following trivial reviewed fixes
> in my hw-misc tree to reduce the size of respin:
>
> hw/watchdog/wdt_imx2: Trace with QOM path
> hw/net/lan9118_phy: Trace with QOM path
> hw/net/imx_fec: Trace with QOM path where easily possible
> hw/usb/imx-usb-phy: Avoid casting from void *
> hw/misc/imx*_ccm: Avoid casting from void *
> hw/intc/imx_avic: Avoid casting from void *
> hw/char/imx_serial: Avoid casting from void *
> hw/misc/imx6_src: Avoid casting from void *
> hw/vmapple/Kconfig: Remove unused GPIO_PWR dependency
> hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS from config IMX
> hw/arm/Kconfig: Select missing UNIMP in config FSL_IMX8MM
> hw/timer/imx_epit: Wire clock control module via link property
> hw/timer/imx_gpt: Wire clock control module via link property

Fine with me -- I only reviewed the first few patches in
this series, but I think all the rest are good cleanups.

-- PMM

