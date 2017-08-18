Received: by 10.223.188.70 with SMTP id a6csp627604wrh;
        Fri, 18 Aug 2017 10:20:18 -0700 (PDT)
X-Received: by 10.200.0.9 with SMTP id a9mr12996420qtg.107.1503076818034;
        Fri, 18 Aug 2017 10:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503076818; cv=none;
        d=google.com; s=arc-20160816;
        b=rnHir3sYAg78KVUbUcHMP3tAg357q5zrrAFu6Ibq5c9778KGw9JKALibtCXCu0NZxj
         tmBvXPKqc3cVXqAAutzJsOicfRBipv8qzMTVDnTOxj9UK3gODnGf4i9hAUSvgGXljYxa
         MP8/0KKfjWotpZSCeciCASfqXCcEGutW+QutIaLrIqJD+WRBLtd8W9dVYaPgo1uJEnQd
         QrRLtyujnIyJMksziOBUOm91Ke9l6D+0/nircx7fNRC605dhFuM2PGsSYXusU+iGYZIl
         vHjffdUiE097XzDvfoxyKdg8FvKBOqSuANnqiEN6yLv2gyx81gj4gTmGvuUC6vu4rewc
         JIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gUxuPjrMrUPvjVT0VQgSMlJi092oU46Ayg4B9wq89V8=;
        b=p8gKdTS+rLlK9remiaexjsZPpDG1ZPtokeNwqAeN+QMVq6bN2xG8z1NHJQIwPWU/NR
         eEuK/Agt9U0k3mvnqdJlMLtK0leHGY6I8uNOVHNT42z3rZuN8TaHCDZPs4YmpyojH3UI
         35LiYp98AIrlZoS2kw5C7XTgjcyuA61XQHdfkVX+4O52VryPTLthm/UKgtYqnESz4uzs
         s2Kr9jZ+A1fb1u1HUaY9S5UrGcWLr0vglzp3c11WcT3yN3JPiR+mwoTkR2dc1o+4yFHg
         /g+GvoRCRT6pZwlktz5zGardI47uDRnB4hr7F8joi7SLekqGiOBQscZ8bEKrvkea23MH
         aXhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ig8Rj4S9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si5814510qkc.26.2017.08.18.10.20.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Aug 2017 10:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ig8Rj4S9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dikwR-0005no-LE
	for alex.bennee@linaro.org; Fri, 18 Aug 2017 13:20:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dikqu-0001KD-Tk
	for qemu-devel@nongnu.org; Fri, 18 Aug 2017 13:14:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dikqu-0006Jm-0w
	for qemu-devel@nongnu.org; Fri, 18 Aug 2017 13:14:32 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:37697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dikqt-0006Ii-QJ
	for qemu-devel@nongnu.org; Fri, 18 Aug 2017 13:14:31 -0400
Received: by mail-wm0-x235.google.com with SMTP id i66so4682860wmg.0
	for <qemu-devel@nongnu.org>; Fri, 18 Aug 2017 10:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gUxuPjrMrUPvjVT0VQgSMlJi092oU46Ayg4B9wq89V8=;
	b=Ig8Rj4S9lHXrHzAYLZbESDw/iQeKdacSXas6yOrJDw9k9KsHtG15Qui0SACD76SU/f
	32zWf4m9aZI9KG0MGVy7TRFStt2K5XPMumi0Wat0VGUl/iDAJ7Qpi0moJ6h9Nb5NMcW6
	R/1b0V5VRMBWep/QiTy5Yw490IgEG0Vp65tWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gUxuPjrMrUPvjVT0VQgSMlJi092oU46Ayg4B9wq89V8=;
	b=NT6csJN4fL53Rzrdt709UoeeKnZm+cegScqJNV/f+R8kkIuyjSGTqkNUEG2LYWtlWP
	hXEs02+CmFcM7sDlDXAJhxMatGtcPGerf+mLcjrWmzO4hQW3JswYwBZ34XN6p+4h4Mt9
	XnaBopoYDKErjolI2X8kfrlWQKVGM9hNic7BW0DRvBEK4yce+RT4IpFMRhkOHA4jUALW
	gwhWA0AhfKjG7zDINbEAP9rZ6NpCHeOPZKCZzsyEZ/Rzc6Gf58DQDIzr71oK4Mqaoo3c
	LTW8GbgGsuuQDcZy+4AVhfCWYZOagRszzD/9qJ+0W9/ozpZoXpSQZcw3pO5pSJ1eMw33
	OfWQ==
X-Gm-Message-State: AHYfb5j4pmmeO9JoG6JOQ2qPjWN9B6UNuE+N0Kz2Slxby7iM/2Uox9vH
	FiYSD9skSNzvdzZwhMV1g9VsEurUJ1VD
X-Received: by 10.28.22.205 with SMTP id 196mr1763701wmw.39.1503076469359;
	Fri, 18 Aug 2017 10:14:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Fri, 18 Aug 2017 10:14:08 -0700 (PDT)
In-Reply-To: <1503076096-14220-1-git-send-email-thuth@redhat.com>
References: <1503076096-14220-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Aug 2017 18:14:08 +0100
Message-ID: <CAFEAcA_F1iFu8cbKCyxnjZP+hVY9DkrJZXHqZ65G10BqzcapQw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-devel] [PATCH] hw/arm/allwinner: Fix crash with
 -nodefaults -M cubieboard
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Li Guang <lig.fnst@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uke2V264mpya

On 18 August 2017 at 18:08, Thomas Huth <thuth@redhat.com> wrote:
> The allwinner-a10 device uses serial_hds[0] without checking whether
> it is available or not. So using the cubieboard with -nodefaults
> currently results in a segmentation fault. Fix it by adding a
> proper check here.
> And while we're at it, mark the device as "user_creatable = false"
> since this apparently can not directly be used by the users but has
> to be wired up in code instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/allwinner-a10.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index f62a9a3..e152566 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -109,8 +109,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, s->irq[56]);
>
>      /* FIXME use a qdev chardev prop instead of serial_hds[] */
> -    serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq[1],
> -                   115200, serial_hds[0], DEVICE_NATIVE_ENDIAN);
> +    if (serial_hds[0]) {
> +        serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq[1],
> +                       115200, serial_hds[0], DEVICE_NATIVE_ENDIAN);
> +    }

This doesn't look like the right fix, because it means that
there won't be a UART device at that point in system memory
at all. What you want is for there to be a UART device there
but not connected to anything, ie serial_mm_init() should cope
with being passed a NULL Chardev*.

thanks
-- PMM
