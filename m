Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1890175wrw;
        Wed, 7 Nov 2018 00:42:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5fCcqxSrmmBGvB3LUMBV3q5oJN8B/l/peDwe32+IHgODMqVrZhl10ffcfiLmLeWklPs9EHj
X-Received: by 2002:a37:630a:: with SMTP id x10mr808490qkb.146.1541580172503;
        Wed, 07 Nov 2018 00:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541580172; cv=none;
        d=google.com; s=arc-20160816;
        b=lnxPWs/nHtqhr1tM3VIXRcHeYupme83KL+4IxvFE5merfoZEj0FXKYydeUmzm76NxG
         1+qo07uOWJnHUXIXowGFUmx+Cym4FxTL1uciv42MKBQPdjWz1NhXFgFzKaH1HhXPys4v
         KXv1pW8D9VVvNBsQPzrVb2AwlisnQHT3/alb4d8eG/wTVyo4nbx7CeMc3M7gbs/Ka5mX
         XMicIB16JhVdpj5X0+9b8UDnTjoAxX92SOLUwEqGImf+hPw+ctn2/OVwXcZjQA3cqpW5
         wL/YMxfer6LkTS+oQu99OMNuiY9Hdkr/GVwVWfKwnISoDo5nxEDs+Hu+eaapWgZUlC5q
         twlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=484hc95Y/7KPTgGB9BpVs3nb/qQrm/91rDnSt9GqevA=;
        b=R4k3IyKOAOpm9BXJnewfplwi7ubtxEWcNbSTJvMZqvWJ/IkZvrf8uiBOWGuWcnD54K
         g23H2r0SabOw9hneb4Bh06yfkXtU1WX7+ekOihAAivRRV/Ca4QvV85OruI/ROhJKiKLp
         JyjqSwfpnFWOk/4SqDQ0nBiNPW1u9AwcmR67P9U4d5A/rS4tGWIxiWZK3yvfXYDQpgqW
         s/6E7AsZtuSX+MuUpVCEM36Hzynj0GlEsVXxuW7SxkNawBL4mE4f0P//LGkNnPpGi+0B
         VXhJih5xSqvv1b+d36bmkfaNe23MEcl71gT51wpIPHN2FdDfgcZ5r6JlVWUOS9KT6uiT
         mQ9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r41si5611858qtj.56.2018.11.07.00.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 00:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKJQK-0000fm-4D
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 03:42:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1gKJPI-0000OF-EH
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 03:41:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1gKJPF-0006U4-5K
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 03:41:48 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:42507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
	id 1gKJPE-0006O9-Qd; Wed, 07 Nov 2018 03:41:44 -0500
Received: by mail-ua1-f66.google.com with SMTP id d21so5563492uap.9;
	Wed, 07 Nov 2018 00:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=484hc95Y/7KPTgGB9BpVs3nb/qQrm/91rDnSt9GqevA=;
	b=ulyrlCHmJj9bv7xKNb0/7RlheP14VU+hVrS9War1ZOEWToG1fLI9Fxhuds7q554YJX
	nvl4P46I03OPY83WjJwJ5zNVlsSHJEB/sKsQxzBBvJQWt3IGsLOpvgRdsy0ptMxD1CCG
	8belccmr9cLw4SbPplhGm8ZDqV1OsGgzV63YYm3KQHZTVdZqsnq5EB//MsOlN8sdGA1a
	7m0CpCx9LmocjKA9VmCYj7Y9IXvfW6DuGhEMD5lYl4F9Fh40DThoVPpRl4brb6A5qAyF
	gVJG1blfgwJxlyrIl84dOguGwMhtPALpMJ/CcvDfaVMNtHPuJvOGEdGGjxN4nfRiY7Nd
	JTzg==
X-Gm-Message-State: AGRZ1gJ9dfemekivha5BA0Y0vdOhp11lF6304ZIp6DSHn+hhPVmygQMs
	UXqjq3XTh+qj3OuBzQF1rNTCmeguMGWSLHw4g4I=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr432209ual.20.1541580100953;
	Wed, 07 Nov 2018 00:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20181106184212.29377-1-eric.auger@redhat.com>
In-Reply-To: <20181106184212.29377-1-eric.auger@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Nov 2018 09:41:29 +0100
Message-ID: <CAMuHMdWdOFJHoMh2UfLmELwWhRV7g24rVpzLM-kA+p2cY6qujw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.66
Subject: Re: [Qemu-devel] [PATCH v2 for-3.1] hw/arm/sysbus-fdt: Only call
 match_fn callback if the type matches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hiPg7K1FOIKX

Hi Eric,

On Tue, Nov 6, 2018 at 7:42 PM Eric Auger <eric.auger@redhat.com> wrote:
> Commit af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with DT
> compatible value) introduced a match_fn callback which gets called
> for each registered combo to check whether a sysbus device can be
> dynamically instantiated. However the callback gets called even if
> the device type does not match the binding combo typename field.
> This causes an assert when passing "-device ramfb" to the qemu
> command line as vfio_platform_match() gets called on a non
> vfio-platform device.
>
> To fix this regression, let's change the add_fdt_node() logic so
> that we first check the type and if the match_fn callback is defined,
> then we also call it.
>
> Binding combos only requesting a type check do not define the
> match_fn callback.
>
> Fixes: af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with
> DT compatible value)
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Thomas Huth <thuth@redhat.com>
>
> ---
>
> v1 -> v2:
> - use "if (!iter->match_fn || iter->match_fn(sbdev, iter)) {"
>   as suggested by Peter to avoid code duplication
> - mention the ramfb regression fixed by this patch in the
>   commit message.

Thanks for looking into this!

After applying "hw/arm/sysbus-fdt: Add support for instantiating generic
devices", "-device vfio-platform,host=ee300000.sata" still works fine.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
