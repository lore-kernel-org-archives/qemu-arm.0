Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2898486lfy;
        Thu, 30 Jul 2020 13:34:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNr0Ed3HYgS2ujdC4iTlWw1dy7zDqJyBtqjHMipazFAGLVwFs+5LCkUzT0HSpMkfXin7Ft
X-Received: by 2002:a5b:c52:: with SMTP id d18mr1066822ybr.88.1596141254067;
        Thu, 30 Jul 2020 13:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596141254; cv=none;
        d=google.com; s=arc-20160816;
        b=tBpDKrRuRJ4LLyjIZUFo5QZLpl3CPslYgJkCJWdSG0ZQLV5x+mlpBt4QmhWQ7prr5b
         iD24a/BKwiO7IiAT27lPgvWYY4tiZPdHJwbovnUt4nNkcwfwr0BvEsItSRUWoZDHpd/r
         NBiOjH+CW+ZQW0h6bQem9QgCHqSCMCttkhC271hKRU2tPjtpCX7DyIqw9/B+9OgbMYpq
         Y2FScSKho6/9kiZ9fK5X7DzgsTk0bq+p0cziwL5DyHati+amoKcbn2e1Bqhe45RVMoTY
         sfVe3zzN2sBUCbQx1/d13XL3HrleN3Jo1p5GY9VIajxHXs1SHfpt9c59GkLhWcSMqv0Z
         S3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TopSsp2fUc0f/Ix/J3pFrqrf9rKYT2QkqIOI3QpaBww=;
        b=aYcwR+QuRC/A5dPfCivpT1B1Agt5SDR4uWZXeHJzUHcZ+LLcsrfys/QX6PfSkE+Wlc
         9VTbIjw8qoi/iS7m+ZmMkGFaeRU56uwY3NDiyL5AyiBI5qhPOEkZ+GVBNeG+vzc6ZSX3
         UvzP7A6Rlf1tiJGYxPoY5VHjtb3+jexZANdruAnlTKdrJm88LzrUI8ZazCRDHEo8YCQ5
         cSDoRvDl3k+N2os5JPH7sqtRyFrQV85EbVd8bu+P5shTkiBznJcNBryY5+cw3iaM7W99
         42hXAr7Ob3suYbkoV6Zfz2CHCAXgS5x6/XpgLZFBORwVVG6+GWRNI8SBv+m+VGlBy1Yi
         WHYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CztX77zy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r186si6010322ybc.113.2020.07.30.13.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 13:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CztX77zy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1FFl-0006FS-HD
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 16:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1FFe-0006FI-8d
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 16:34:06 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1FFc-0004jD-10
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 16:34:05 -0400
Received: by mail-oi1-x244.google.com with SMTP id h3so1279449oie.11
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TopSsp2fUc0f/Ix/J3pFrqrf9rKYT2QkqIOI3QpaBww=;
 b=CztX77zyoVY0ugdGySFHiuPuOP8pznYUfyBbkLLs/GmF+bljRgH96xnq28JSsMIAPq
 BI6TXNRCwnnT1ugNsAahnGf5GCzldHlI/qaotBI8VRIJCwKcoV8eGSGxjbnnj0dYAuep
 BXBOda3Eg5aGpXfLoSR16HWLSmS9QwqavM8WxqPjKrgyyoz2/1ztLjIqXHoVz02ZX1BT
 s4qgz0S2SpKWy3mRrMyG89UL1x2d3c6uEMriqCJP2XxgDgGHwftdvn5J9mgKNK0lepD4
 D6nur4c+RtALovcBE77YU/WtLzI1Abf16m8hK99CvtKlVvAXpPLD9Cbuen1S9w5MGRqJ
 eO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TopSsp2fUc0f/Ix/J3pFrqrf9rKYT2QkqIOI3QpaBww=;
 b=TmOVAu7lQ1OfNBDSVMMWmaB3RfEM4uEsocoGWq4vCcTEC3TEEfkG/VnxgAXEFU5QDA
 yxLhTCh4K6459PlphHTd7n5ggpBKt2DAnDgpUUhBH7aQKEfRryeirVyHx3ek1XaYYhL6
 LzzqiNVv92Ng+R3Xj88wXdzr/PF4yxGuygx2Ga96WUrC+bG6UerpjxUPD/wCETiivLgF
 85+SNINxgKZLC21swJ7KNugom4l78LXAThnxvzE0CwaVIra9+we26LG7W3Ihk5EA39D9
 7vqg00B+K7BsBmFV7KjOcvj7u2l6ZoNZ8nebCqH8v80Jdn2VhrT29fZznR7s+qtsTBU3
 z+1A==
X-Gm-Message-State: AOAM530TmBUbI/vr/sFp0swWZ8AMdhPMDL6E73AIzi29p5IK84xtUdy2
 SZBkH21QJro0a9HDRKB6fJWNUgVe8V0uukSamtHeug==
X-Received: by 2002:aca:50c4:: with SMTP id e187mr577956oib.146.1596141242626; 
 Thu, 30 Jul 2020 13:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200730155755.188845-1-mst@redhat.com>
 <20200730155755.188845-2-mst@redhat.com>
In-Reply-To: <20200730155755.188845-2-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 21:33:50 +0100
Message-ID: <CAFEAcA_Kq3wDbKL_NWTN+DiKQkBGN4yaZ8eZg3J1QYfqU2OKPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm/acpi: fix an out of spec _UID for PCI root
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: vit9696 <vit9696@protonmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /uyrD37VM7n7

On Thu, 30 Jul 2020 at 16:58, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On ARM/virt machine type QEMU currently reports an incorrect _UID in
> ACPI.
>
> The particular node in question is the primary PciRoot (PCI0 in ACPI),
> which gets assigned PCI0 in ACPI UID and 0 in the
> DevicePath. This is due to the _UID assigned to it by build_dsdt in
> hw/arm/virt-acpi-build.c Which does not correspond to the primary PCI
> identifier given by pcibus_num in hw/pci/pci.c
>
> In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
> the paragraph,
>
>     Root PCI bridges will use the plug and play ID of PNP0A03, This will
>     be stored in the ACPI Device Path _HID field, or in the Expanded
>     ACPI Device Path _CID field to match the ACPI name space. The _UID
>     in the ACPI Device Path structure must match the _UID in the ACPI
>     name space.
>
> (See especially the last sentence.)
>
> A similar bug has been reported on i386, on that architecture it has
> been reported to confuse at least macOS which uses ACPI UIDs to build
> the DevicePath for NVRAM boot options, while OVMF firmware gets them via
> an internal channel through QEMU.  When UEFI firmware and ACPI have
> different values, this makes the underlying operating system unable to
> report its boot option.
>
> Reported-by: vit9696 <vit9696@protonmail.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>
> Peter can you either ack or merge this one pls?

Since you have the x86 one to do anyway, I'll let you take
this one.
Acked-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
