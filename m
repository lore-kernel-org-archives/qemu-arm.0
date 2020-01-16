Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7642819lff;
        Wed, 15 Jan 2020 16:20:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYr3DSuNCl2bIdSsoTJpkl+BZrF8KbwajbESl4DfDxwHJauSKKVOO57i3vCmjkPWSkg19H
X-Received: by 2002:a17:906:5c11:: with SMTP id e17mr91270ejq.338.1579134004472;
        Wed, 15 Jan 2020 16:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579134004; cv=none;
        d=google.com; s=arc-20160816;
        b=QN4ybEOAYp+KVrqFUBsQl8MZa5/gale5Ymf3J8a/mqyp70T7C+Rm7jWhpzcV61fOjO
         5n+9F3QLfDYbiG5FXQ/uoPWvLrUCchnaxrSiwLi9ws0rAuchtRGngCT8leV0Hib7DyJD
         ZssF6AzFJNzND1yEo9AVQy1eYi+XCMwEQWaM5tYEfoHqGvQhfykIPjRiTQDNNVuHfvVS
         kQuHzzM6V2MgYye2pKCtLH0/rj9fuUidDbrXb39WVc/NPkfrvgCm/aYX/yNE6ApaTNii
         PPjEp28nXHlVx2AKvC6JFeavNL5WRyKlTCox8P+VoZwEcr5WwUl9Yxlk0c753I8p7fPn
         gI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UerpdH8qP3g09zrjSHt1MAgeDc1zRn7uxgSjjIeF8zc=;
        b=P8SUVihsuCWd+aWBtEe4jWGXPhP/0W7V5Dc31Om20ezmHwZk47QICtFl5r5wku+idw
         dHZjAfZktIFot31WJRCCTiW873Q85wbEijpnEN+VVtZTFr5j6wE76V8Lggbxj6E2qQl1
         5A/DHtjx2U22e9u1ZzNPVrm1ohYl3KFhoGnNyCfmJgSS39ql8IOp34/9QcylJ8LzF6/1
         yWp86ACfm/QUv3WGVoakKtxmGtO0PHysQVbqxL2IqbslMWgHG4ZABf72fH74diN6CWWX
         VYVFm0+etaA87gBPF0FWeUuE535f1ZC2E2VtPlC+ksMNMbYCfXYIjJ25tckALCyDUmXp
         iqAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="UVb7As/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k24si12538649eji.310.2020.01.15.16.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 16:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="UVb7As/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irstH-0002Fx-E0
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 19:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1irst9-0002E7-Js
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 19:19:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1irst8-0005FF-IX
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 19:19:55 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:45012)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1irst6-0005Dm-9j; Wed, 15 Jan 2020 19:19:52 -0500
Received: by mail-lj1-x243.google.com with SMTP id u71so20546362lje.11;
 Wed, 15 Jan 2020 16:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UerpdH8qP3g09zrjSHt1MAgeDc1zRn7uxgSjjIeF8zc=;
 b=UVb7As/Y0GKsccaEGgHpdupb1keeOOH/LiOjZh/HlFIl0keilCavi4DkdaGKIQBj7T
 eWkqxFujoW06O0YD0oKoFrszjATouRtW6mKgRSByED/gvR0CflI5JBB/+n8hHmgW1fQ7
 DXkB0LUvM3lFoCnPyVoT36UN8bW/MNLpoXGok0VCAY9oASLIQ+xrqhsaSbdJrb2Q9i+N
 nvnYweQeXfjJtn1aPEyd+6XfCSa3pnYTPxXklVAP0udxUIGp0cdibRx6stE2LEGBVBVH
 M8paLHrkFmmuifhECsunIep5KFCF/00bm5tjUDfsB+4kq3iMqv+9lSXkwvJJ3qKhmQOM
 wGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UerpdH8qP3g09zrjSHt1MAgeDc1zRn7uxgSjjIeF8zc=;
 b=UC+aaHZUy2oOLgOw/1A0cwxfWSFxgiQvChwYqzyHJefHedd2cBQTMTFiLyCLf65RjS
 uLSwjCRM9svhiH0NC1bc/bjRQawzoyQZc20sEHcT6MAJCVIdM1tYSvihpaV1+bilJdhO
 5PD2NdyId3K5ESBxNEGgrKqG9q8Okw62y0NtyF2aeNIrM5XfXwLbH4s9wyvT8d7RkKpr
 csGWO0mwXuMofpGk+qusqghMTO9rVJv4UVuKkGvG9G6w1c9M8XwCn/G/vojBE1gdiZ5k
 QqwXIDerSvUaGP0oq2FB5RIxFXrg1P0rImX6GTnYCERTfk4HrRs3H5OGJKCPHdSY+7Iw
 9/IQ==
X-Gm-Message-State: APjAAAXobalHEhEgt3QDAsRAZdA1EA9CL0FtgyPu5J3fwhTSiZG9meaJ
 vWJW1zT6slRc4FNw7MLAsD79SPLqDAsFDURbxFQ=
X-Received: by 2002:a2e:9157:: with SMTP id q23mr591405ljg.196.1579133990898; 
 Wed, 15 Jan 2020 16:19:50 -0800 (PST)
MIME-Version: 1.0
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-38-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-38-git-send-email-imammedo@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jan 2020 10:19:24 +1000
Message-ID: <CAKmqyKMOTaGG8tU_eQ2CpC1ZA6OpoykKJS2KCeWgRZYUFsab+A@mail.gmail.com>
Subject: Re: [PATCH v2 37/86] arm:xlnx-zcu102: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r40v2DkrHTgs

On Thu, Jan 16, 2020 at 1:39 AM Igor Mammedov <imammedo@redhat.com> wrote:
>
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> CC: alistair@alistair23.me
> CC: edgar.iglesias@gmail.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/xlnx-zcu102.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 53cfe7c..bd645ad 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -28,7 +28,6 @@ typedef struct XlnxZCU102 {
>      MachineState parent_obj;
>
>      XlnxZynqMPState soc;
> -    MemoryRegion ddr_ram;
>
>      bool secure;
>      bool virt;
> @@ -87,13 +86,10 @@ static void xlnx_zcu102_init(MachineState *machine)
>                   ram_size);
>      }
>
> -    memory_region_allocate_system_memory(&s->ddr_ram, NULL, "ddr-ram",
> -                                         ram_size);
> -
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
>                              TYPE_XLNX_ZYNQMP, &error_abort, NULL);
>
> -    object_property_set_link(OBJECT(&s->soc), OBJECT(&s->ddr_ram),
> +    object_property_set_link(OBJECT(&s->soc), OBJECT(machine->ram),
>                           "ddr-ram", &error_abort);
>      object_property_set_bool(OBJECT(&s->soc), s->secure, "secure",
>                               &error_fatal);
> @@ -211,6 +207,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>      mc->ignore_memory_transaction_failures = true;
>      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
>      mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->default_ram_id = "ddr-ram";
>  }
>
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
> --
> 2.7.4
>
>
