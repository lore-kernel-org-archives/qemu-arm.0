Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp264988njb;
        Thu, 5 Dec 2024 08:45:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMHLFLuF0MFzTQ32FTkZvSPz9gUQLPMevxGV5Ge2+sqVIYovZx/ZJJIPl83+Ss+1hiz9iUheHVZBQItQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGPT1uAEKKnmhRkpbthx0oKDckLtzy42tPgHh6rlR+aWX05CDfGRoJgZf31F1JR/h0mGv4x
X-Received: by 2002:a05:6102:1612:b0:4af:b05c:516a with SMTP id ada2fe7eead31-4afb05c53bemr7341002137.13.1733417152803;
        Thu, 05 Dec 2024 08:45:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733417152; cv=none;
        d=google.com; s=arc-20240605;
        b=jjvLx/7dPrp6aRuJKdrr1CJr8zQM2LbcE99INXVNFA0t/ZJcb/C0Y77Zq5GSlB9Luk
         f3tUHoNMJTU1BiXcVITK0BadONOTIf3o2bFkvyJGh5TJjpuwt6j8UtzTH/UzYGEnhEJw
         pm+amoC3IAH1hnPOaMSQg0u0Pqb/SO0ycD4KXoKoEZjm6bH8QtpoRfw+OoAywgWadaAe
         vRZW1v+4vOUkg3WOzcfC5BTy+OpF2i+OT73gXBsYobtusV0JS2xL8+nvedey3cYOBzSz
         OjmSUDoEjRvp4Z4kzmn8OakyHBn+JQNRhCI0mngp6pD4o1r7gMbyinOtBKlluYWDBvgr
         ilHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=m1sb14BRxQacuKFTQeJyr0bsm5xU3QUxAOI52PoVBMY=;
        fh=lG27awU95JyJNjtPXfP2l9ennSL0kjdlRUDz077iVXc=;
        b=OdHXyBWzKYeaBgUY6FHeuWkkq1lZEwY7B3i56AgOqwKSU+NOavewI37QFNAGuMblY3
         vygAE+lo9v80SgKoNJHktD2NT721H7ffMy3Y+PEySTG2CQdPNeRld1QfL9F4RhHgCiSv
         O2RPf8Gxg5e+bz5ATFBKDQIVtk1byWsppcxspwrsA/zjOF/WrqJfCsagY5rKHBWkjAA+
         loHdrVUeC5J3dx8NptS480WPsd5LmMfxY4CWQW9d960ZtWRBp7cro/Ju5VJ/umnqFL/0
         fa2MyaaHmMJQ1xkSLH0ORu/b71Z6XWd/H+RpDv+A191j73TJ77lfJrBdZbAt75HHs4eK
         ZzlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ebLBgnU5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afbc50af7esi586185137.71.2024.12.05.08.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 08:45:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ebLBgnU5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJEye-0004NB-AJ; Thu, 05 Dec 2024 11:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJEyP-0004Hl-5d
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 11:45:06 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJEyN-0000h5-1K
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 11:45:04 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e224bbaccso1227876e87.3
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2024 08:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733417100; x=1734021900; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1sb14BRxQacuKFTQeJyr0bsm5xU3QUxAOI52PoVBMY=;
 b=ebLBgnU549YvEO+UVUZ2vvTJP9F+aL3vRI1RoxZubbDX3hvUbLwl1B9J/M8EsO2Rsn
 ZXCyxM/AauZ/Y5QV29i99ZKAwEvuPRHhIXhdX8DxpwNUxG5MErm5rE/Y7As+BF9czMVY
 tR8hsIHsqJknUKBisutPU9UsUEEyl62sdxkNY98nQNmJZ1ucbdHz26JdyLwVhqGVvSla
 hRXo+7r9dSZI0y+XV9ZlRfiv4X0nmmiHTqHI+HESDRdeMGB0DiqVuKvN2RtImSCKdYu2
 7Y5It/hC/ES40sfRDnjYbcx+znQX4tZnfqFKTKNJ78zkusKVqGdr4CNnQrEQxLxB94L+
 YpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733417100; x=1734021900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m1sb14BRxQacuKFTQeJyr0bsm5xU3QUxAOI52PoVBMY=;
 b=M1iNeKpM0MzyJQX6KNNOGeFUr0x/nA5Qdm0nrwWeg6kasRfc0ICvS+ea4O+1WnsVEV
 52B/RjBdAuap6619sMEZGQlTZDh9sHw6BGwnzlUgW9nMM/vcBgWCyxlpfRr0ifV7uh6K
 Xo9IdM8qMmZjWHJ8ST5cs0blQRgU79pB1KeRDugpWf473H0AWst3kb1H15joB9X4lFgG
 JIyjw/ZGfuxByRB60Gb6Hq+hrt5zPUDY31fQQvv9I8mUlSUtbRSxPGhjbP0nL5qA3As0
 3X36Tl9LfEAlAJo6p+on174iaWGYu/x10n2ttZGueanyuXkShgwH285bRQVDjID/al0I
 npDQ==
X-Gm-Message-State: AOJu0YwqOxdxw4cJjm0h/keVG3A+OueWJGHkWuOsvgeidOabF7v++VcD
 QYHeKcOnx3Jt49JcSMATz24XYxrNrFPQ3A8ZkVJ6T4/MeKKVd4ysB0NdzTlrHf/I018ndPC1o8o
 HTQyN1cTd6747BA1w6QqBO7tmNBFYC7AXUHDcSg==
X-Gm-Gg: ASbGncvOnJYcp7AGZAsGcrxXWJ2aP87WztAndbCfvpJLAjFwYNbEo4/zUUInoi/3u7O
 x7PSMncGcEOgShybcsFGgHnMdBi9jn9qj
X-Received: by 2002:a05:6512:3f2a:b0:53d:a58c:c5a4 with SMTP id
 2adb3069b0e04-53e12a22f0bmr6202589e87.40.1733417099945; Thu, 05 Dec 2024
 08:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20241126112212.64524-1-philmd@linaro.org>
 <20241126112212.64524-6-philmd@linaro.org>
In-Reply-To: <20241126112212.64524-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 16:44:49 +0000
Message-ID: <CAFEAcA_K_DqRfipvQf0LcrXAMANVrwtCPD3cd2gMah=p2JH2DQ@mail.gmail.com>
Subject: Re: [PATCH-for-10.0 v2 05/13] hw/pci: Propagate bar_at_addr_0_refused
 to pci_root_bus_internal_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-riscv@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dTuu1107BlbY

On Tue, 26 Nov 2024 at 11:22, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Have pci_root_bus_internal_init() callers set the
> 'bar_at_addr_0_refused' argument. No logical change.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/pci/pci.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 27b66583e54..8eacb8f82fc 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -529,7 +529,8 @@ static bool machine_refuses_bar_at_addr_0(void)
>
>  static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
>                                         MemoryRegion *mem, MemoryRegion *=
io,
> -                                       uint8_t devfn_min)
> +                                       uint8_t devfn_min,
> +                                       bool bar_at_addr_0_refused)
>  {
>      assert(PCI_FUNC(devfn_min) =3D=3D 0);
>      bus->devfn_min =3D devfn_min;
> @@ -537,7 +538,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, D=
eviceState *parent,
>      bus->address_space_mem =3D mem;
>      bus->address_space_io =3D io;
>      bus->flags |=3D PCI_BUS_IS_ROOT;
> -    if (machine_refuses_bar_at_addr_0()) {
> +    if (bar_at_addr_0_refused && machine_refuses_bar_at_addr_0()) {

Should this be || rather than &&  ? If I understand the
intent correctly, we want to prevent a BAR at address 0
if either:
 * the MachineClass field says we don't want one
   (legacy handling, eventually goes away)
 * the new command line argument says we don't want one

rather than only if *both* say "no address 0" ?

thanks
-- PMM
