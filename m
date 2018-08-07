Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4302040wru;
        Tue, 7 Aug 2018 08:01:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdAyrF5qP+QOvwBh8Xy/75yvaYxOTueMnfkFfCAkNXq/mP0lJanr8h1veOS+/D/mOLnZScP
X-Received: by 2002:a0c:9547:: with SMTP id m7-v6mr16966678qvm.138.1533654087346;
        Tue, 07 Aug 2018 08:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533654087; cv=none;
        d=google.com; s=arc-20160816;
        b=POlyWr97PjbPQxJ83gRJ7jEK3KuL4GEQ7t10L9yIUZ7Nuxuv0ZT9n9xuUbLcwKj5mj
         bDNJ3hmhlagZsYrQ8W5PUuirhBJ9Z5hnez06o73w2o/ducx/7BGzhFyS/Q9md3QxQk0i
         Ujjs3uPByj5wCm1cM1zmARzs3oz7xf0/JLyL5Pekmz3fa06OULPo/mx/YCSCXGwGjL9W
         9I7pdV47ohxvC/399npIF3JWTeCIlHRFBD6LwNa0ay6oYv8yXzZ2FjWRH9v86YhWjgHm
         yzzoPgc7d/X9KjStZj4+VgsC5QugyHyzLuZDAlpGGZ/Pa5uJiOI9lT48ifC+yQOFNorj
         G4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:arc-authentication-results;
        bh=ylw7vVZ3cLwvWD3Un17riPj8zv50PYbChH0VFiMPo+k=;
        b=mAowJIrqKJ1b26auMpd0VS7srPf5JYIj35ufUC34zSfpvqMfpKL3GkxPTSx1BC6t/q
         MvuPeAGrseKr70UahWwH5epg2dXpOQuJ5MJ5Sq4QuLmjaLXGxqewB3fy43Zm2rLrCPeC
         MxAIdSZk/mzm2PAgnW8gnMFUHPtQ+2ljm/uovmv4BmplyjzG5+Yo+GpJoQ6dzBAxeB+i
         8/H00CmaQRUKLNM8uFZwPU/yk3tSXq4KQNnaXKD8ls6VyaGeHRnckDc4at0Dzf307gVk
         ssHrUL4J4PHlx4s5IZG39Jm6rpNx1AQ+JoD1ER2Aq4gmVgyacegLsS5sd5J40niOLynz
         hoyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w38-v6si272123qtk.68.2018.08.07.08.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 08:01:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn3UE-0003g7-TC
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 11:01:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1fn3Tx-0003bb-Fd
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 11:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1fn3Tt-0007Fz-5J
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 11:01:09 -0400
Received: from mail-ua0-f193.google.com ([209.85.217.193]:37467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
	id 1fn3Ts-0007Fr-WA; Tue, 07 Aug 2018 11:01:05 -0400
Received: by mail-ua0-f193.google.com with SMTP id y10-v6so16457078uao.4;
	Tue, 07 Aug 2018 08:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ylw7vVZ3cLwvWD3Un17riPj8zv50PYbChH0VFiMPo+k=;
	b=cTCMae9aHNmhpfmOzeY5XRftgFWkfQ36DlZQI8M9i7LZQwuCaMMhO4yWc3Nw5vwMpj
	qUCdkJ1vF02hEeW+yB8/ch0Nw+n0/EOdM8U2NwOtTRyRJOb4W2VIPaS+lHGY+mLHGvl1
	YGOs6sJCL0DHx0URhE0Hm5TlOuGLoMoEa3dXhihIu4q6IsHGjNllisaKxEcjsnV4kuTG
	/2Pb/7H+iMBNYWXJ4VK75aAwZMKDlLYkT46boKqkNn+/uB/gT5XOJ/KqhFiYUxAmUZk2
	yLO62ATrhW6v9lH9iyg4uS1l9i8Nxq5qKr4aFE5pr9cX9DLxbNKaG2YzmbwTemFqWR0r
	EYXA==
X-Gm-Message-State: AOUpUlESpnuAcb3F1l2TsHKJ5rhsENQ2tJBlI3BvBWKQnitW+4MwCdsB
	KSeLvrdeAvIEucguiFLdadC0hbZl5/xhAYEfbwI=
X-Received: by 2002:a1f:6b11:: with SMTP id
	g17-v6mr12302599vkc.82.1533654057528; 
	Tue, 07 Aug 2018 08:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-2-geert+renesas@glider.be>
	<276c2cab-659f-ad1a-d3a3-0e0df9a439c9@redhat.com>
In-Reply-To: <276c2cab-659f-ad1a-d3a3-0e0df9a439c9@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 17:00:45 +0200
Message-ID: <CAMuHMdUuWT+-7wGg2SYTvtQV0Cy64N5GYTB0b-3gXPS3KLoO2w@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.193
Subject: Re: [Qemu-arm] [PATCH v3 1/4] vfio/platform: Make the vfio-platform
 device non-abstract
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <damm+renesas@opensource.se>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g08iR03mOGq3

Hi Eric,

On Tue, Aug 7, 2018 at 4:18 PM Auger Eric <eric.auger@redhat.com> wrote:
> On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
> > From: Auger Eric <eric.auger@redhat.com>
> >
> > Up to now the vfio-platform device has been abstract and could not be
> > instantiated.  The integration of a new vfio platform device required
> > creating a dummy derived device which only set the compatible string.
> >
> > Following the few vfio-platform device integrations we have seen the
> > actual requested adaptation happens on device tree node creation
> > (sysbus-fdt).
> >
> > Hence remove the abstract setting, and read the list of compatible
> > values from sysfs if not set by a derived device.
> >
> > Update the amd-xgbe and calxeda-xgmac drivers to fill in the number of
> > compatible values, as there can now be more than one.
> >
> > Note that sysbus-fdt does not support the instantiation of the
> > vfio-platform device yet.
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > [geert: Rebase, set user_creatable=true, use compatible values in sysfs
> >       instead of user-supplied manufacturer/model options, reword]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - Read all compatible values from sysfs instead of using user-supplied
> >     manufacturer and model options,
> >   - Reword patch description,
> >   - Drop RFC state,
> >
> > v2:
> >   - No changes,
> >
> > v1:
> >   - Rebase, Set user_creatable=true,
> >
> > v0:
> >   - Original version from Eric.

> > --- a/hw/vfio/platform.c
> > +++ b/hw/vfio/platform.c
> > @@ -655,6 +655,25 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
> >          goto out;
> >      }
> >
> > +    if (!vdev->compat) {
> > +        gchar *contents;
> > +        gsize length;
> > +        char *tmp;
> > +
> > +        tmp = g_strdup_printf("%s/of_node/compatible", vbasedev->sysfsdev);
> > +        if (!g_file_get_contents(tmp, &contents, &length, NULL)) {
> > +            error_report("failed to load \"%s\"", tmp);
> > +            exit(1);
> You should set errp instead so that the error gets properly propagated.

Thanks, will do.

> > --- a/include/hw/vfio/vfio-platform.h
> > +++ b/include/hw/vfio/vfio-platform.h
> > @@ -54,7 +54,8 @@ typedef struct VFIOPlatformDevice {
> >      QLIST_HEAD(, VFIOINTp) intp_list; /* list of IRQs */
> >      /* queue of pending IRQs */
> >      QSIMPLEQ_HEAD(pending_intp_queue, VFIOINTp) pending_intp_queue;
> > -    char *compat; /* compatibility string */
> > +    char *compat; /* DT compatible values, separated by NUL */
> by NULL characters?

"NUL" is the character ('\0'), "NULL" is the pointer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
