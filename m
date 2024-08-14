Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp369573njf;
        Tue, 13 Aug 2024 23:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4EhqCWjDpWjW80mxag5loVzh582DozXZGgkzd3jNZHY4SYEgaQKg8ly79RyLAldpkAqZcM7W3hv0C1m40je/czEAO3BXN
X-Received: by 2002:a05:6808:1706:b0:3db:2139:1852 with SMTP id 5614622812f47-3dd298f1334mr1887733b6e.15.1723615554962;
        Tue, 13 Aug 2024 23:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723615554; cv=none;
        d=google.com; s=arc-20160816;
        b=XKi00AHEZV52uRFOsx+SLFhSPYu4xr/vTSZem3EYJgIVjXeN39nRw4xucxYdCutoIl
         8FUXwYVGiNy7sfC/i9EOtLEDdlsZyRHUGYd9Ip23gNmtHQ58ZN5sjrKpP6mS0PJA3vKL
         aT1NbZ9kiF3BzpT4ql7IDYAl6B5V0/gcSU4OiOc2sHLXlVLfFBEcUtCgso+xdNAeDlnz
         UhFnSvzMpKRQUrZ0ICCRKv3kiyqa0bTGbfwPRcrr9fXjl51eXrmEhxenkIfJJAbGfN4/
         tHLK8Ii92ISJYr/nMuEc+/jhoL0pIFDoxFUGP5MeAhKTNYc5RtXPUKxq37u7nG0uxOJ1
         SMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=nQkMJkL9vL2igVIu7c4khKnTRZrEXKbAcPuAdwKii3Y=;
        fh=YSwpL2ILiPrI9DIruWwvOFAerPystS+O/Pdd1T7p7d0=;
        b=Uyc2A6eg7Z5Kmfe3WwwUM+wHxP5+eCdb4IIF7OmXzw0OVk6WX15x49TtuL2Stq0L2L
         BNAAkLpu/y3YWITnTgIqmBS3IlYYXyeTmUKa1H1gpGS6TVYzMy73ktfYckJ4srpCGG6N
         X2IHjWIsxcoKXpLYAtHBF+PK8iwtrWy2tOUadfGeeDXFLU9fMuoeAWRP+yheq7Tprget
         2LUHYfRhKXJJXD9zrZkR6kL9Yzx4AwMNuKhC8QkQQTcYlQCYHEzG9XAS+xAt0YN7g4+6
         i5xcW7EYz8epVXnrK8dn9pQjkiLXx8zuY+5I47uT13zz+VF1Y3ilwcacLIBVCR6n4Z+0
         sqxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=I49WLT5h;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3dd0607544fsor5453671b6e.7.2024.08.13.23.05.54
        (Google Transport Security);
        Tue, 13 Aug 2024 23:05:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=I49WLT5h;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723615554; x=1724220354; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQkMJkL9vL2igVIu7c4khKnTRZrEXKbAcPuAdwKii3Y=;
        b=I49WLT5hhEVjfU+YdOZ5/6MiLzR/TCGv+pEs8zN8tciXqrrbvUm3WQxak/UXmvJVeH
         fMd2+7b59xFAZk92IRTSERjXA8ShffQj6gbFkT2DI8Nmpo6zn0rRbZ53OpEGpdi9NSSR
         unRMZVio098o++RhCWMeUyJhGtZuGho9K+JcWjZqlzvQmyJg6R1Jfn7VfiGrZv4wrTJw
         TqSCp7QGYUsM0nENxb/SNXOqa64qh/hRwa2lDPg3c5DfzORn+B/KZ2AeLsVlCCURc/+G
         POQqcHVsW1ilXWMkM+5FZ8hEyNSBlnfxmxFvQQIos6va9SPshZ2XBP71fWGHDknQXfoI
         aXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723615554; x=1724220354;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQkMJkL9vL2igVIu7c4khKnTRZrEXKbAcPuAdwKii3Y=;
        b=ppDzz61Fzv536xHuKaThcTWgJnh++mBDH4K1y99/Z+ZMFSdihIwDqp1pUvmDQ4mFd1
         iEab62MuggDkj1ia5y9o2v2HFeU8HOFEczkDupmJbkQPsioJvJFO9EI2wzure8tvhj+M
         pqnV1AIUApmq5CWRO+bPWDPEeQhLsXpU/+WgMZj2LQCOwr1ef2wXJvTY1SUPaWHUjOnT
         oQ/QL3Dkqa22Fv4ovwGeaKFctRNMtPrcslCENW8WRrrfkW389b8qT52he/yFD0vpysuE
         +q4NVCFME5N1svEeK44FwV+i0uL1a8FLL5unUstKfHNiKFlNCaHbEMEdN5YlVE5pDbad
         KjOw==
X-Forwarded-Encrypted: i=1; AJvYcCVXj/eutRX3KYo5wNmAVupL/BGRRkXjIe9BeU1Ok/5wFYml+TSH5CHJwk1gcKKWSQp+DVJ/Ez96WpipNi21EKEun+51hKCJHqZOVZZBotlNgmp8mpRaODFIzJMIGghaKmOf86EMNkvw1gq+/2u/lByw8ohhkC3Qh5c67Bn9t26KfqMoETlJ7KHOTiykjY80K+mt6qYvi3Bk1worWGWlmXHqeA6iV0vbUSdCmP2P1iE=
X-Gm-Message-State: AOJu0YxYRgynwNpdTgcm8ESijUFJArdEZZOuA/R8bJaN+d/6t15XTeOS
	jPYXBPIwPMq2fiyGLab8ZL5nwMAsTbZKKcN7nM0nK1AXeptoMzgs
X-Google-Smtp-Source: AGHT+IHZYl6JElZIGXPo8z9Y26JBm80QMKtE42nqYrE66+zStj03nZGHXrXLbO7RM17UAL7xmLDnBw==
X-Received: by 2002:a05:6358:5292:b0:1b1:a899:95fe with SMTP id e5c5f4694b2df-1b1aab56d19mr182206955d.8.1723615554128;
        Tue, 13 Aug 2024 23:05:54 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.145.94.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e58aa1d2sm6630840b3a.73.2024.08.13.23.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 23:05:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Aug 2024 16:05:34 +1000
Message-Id: <D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com>
Cc: <qemu-devel@nongnu.org>, "Alistair Francis" <alistair.francis@wdc.com>,
 "Michael Roth" <michael.roth@amd.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Mahmoud Mandour" <ma.mandourr@gmail.com>, "Pavel
 Dovgalyuk" <pavel.dovgaluk@ispras.ru>, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Weiwei Li" <liwei1518@gmail.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, =?utf-8?q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, "Markus Armbruster" <armbru@redhat.com>,
 "David Hildenbrand" <david@redhat.com>, "Beraldo Leal" <bleal@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Eric Auger"
 <eric.auger@redhat.com>, "Song Gao" <gaosong@loongson.cn>,
 <qemu-arm@nongnu.org>, "Peter Xu" <peterx@redhat.com>, "Jiri Pirko"
 <jiri@resnulli.us>, "Eric Blake" <eblake@redhat.com>, "Fabiano Rosas"
 <farosas@suse.de>, <qemu-s390x@nongnu.org>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Daniel Henrique Barboza"
 <dbarboza@ventanamicro.com>, "John Snow" <jsnow@redhat.com>, "Alexandre
 Iooss" <erdnaxe@crans.org>, "Konstantin Kostiuk" <kkostiuk@redhat.com>,
 "Pierrick Bouvier" <pierrick.bouvier@linaro.org>, "Cleber Rosa"
 <crosa@redhat.com>, "Ilya Leoshkevich" <iii@linux.ibm.com>,
 <qemu-riscv@nongnu.org>, "Thomas Huth" <thuth@redhat.com>, "Paolo Bonzini"
 <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>,
 "Jason Wang" <jasowang@redhat.com>, "Bin Meng" <bmeng.cn@gmail.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, "Pavel Dovgalyuk"
 <Pavel.Dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for
 bhs that affect machine state
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, =?utf-8?q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
X-Mailer: aerc 0.18.2
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-17-alex.bennee@linaro.org>
 <20240813164631-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240813164631-mutt-send-email-mst@kernel.org>
X-TUID: u1mo+svQdgqS

On Wed Aug 14, 2024 at 6:48 AM AEST, Michael S. Tsirkin wrote:
> On Tue, Aug 13, 2024 at 09:23:24PM +0100, Alex Benn=C3=A9e wrote:
> > From: Nicholas Piggin <npiggin@gmail.com>
> >=20
> > The regular qemu_bh_schedule() calls result in non-deterministic
> > execution of the bh in record-replay mode, which causes replay failure.
> >=20
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > Message-Id: <20240813050638.446172-9-npiggin@gmail.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >  hw/net/virtio-net.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 08aa0b65e3..10ebaae5e2 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -40,6 +40,7 @@
> >  #include "migration/misc.h"
> >  #include "standard-headers/linux/ethtool.h"
> >  #include "sysemu/sysemu.h"
> > +#include "sysemu/replay.h"
> >  #include "trace.h"
> >  #include "monitor/qdev.h"
> >  #include "monitor/monitor.h"
> > @@ -417,7 +418,7 @@ static void virtio_net_set_status(struct VirtIODevi=
ce *vdev, uint8_t status)
> >                  timer_mod(q->tx_timer,
> >                                 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +=
 n->tx_timeout);
> >              } else {
> > -                qemu_bh_schedule(q->tx_bh);
> > +                replay_bh_schedule_event(q->tx_bh);
> >              }
> >          } else {
> >              if (q->tx_timer) {
> > @@ -2672,7 +2673,7 @@ static void virtio_net_tx_complete(NetClientState=
 *nc, ssize_t len)
> >           */
> >          virtio_queue_set_notification(q->tx_vq, 0);
> >          if (q->tx_bh) {
> > -            qemu_bh_schedule(q->tx_bh);
> > +            replay_bh_schedule_event(q->tx_bh);
> >          } else {
> >              timer_mod(q->tx_timer,
> >                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_ti=
meout);
> > @@ -2838,7 +2839,7 @@ static void virtio_net_handle_tx_bh(VirtIODevice =
*vdev, VirtQueue *vq)
> >          return;
> >      }
> >      virtio_queue_set_notification(vq, 0);
> > -    qemu_bh_schedule(q->tx_bh);
> > +    replay_bh_schedule_event(q->tx_bh);
> >  }
> > =20
> >  static void virtio_net_tx_timer(void *opaque)
> > @@ -2921,7 +2922,7 @@ static void virtio_net_tx_bh(void *opaque)
> >      /* If we flush a full burst of packets, assume there are
> >       * more coming and immediately reschedule */
> >      if (ret >=3D n->tx_burst) {
> > -        qemu_bh_schedule(q->tx_bh);
> > +        replay_bh_schedule_event(q->tx_bh);
> >          q->tx_waiting =3D 1;
> >          return;
> >      }
> > @@ -2935,7 +2936,7 @@ static void virtio_net_tx_bh(void *opaque)
> >          return;
> >      } else if (ret > 0) {
> >          virtio_queue_set_notification(q->tx_vq, 0);
> > -        qemu_bh_schedule(q->tx_bh);
> > +        replay_bh_schedule_event(q->tx_bh);
> >          q->tx_waiting =3D 1;
> >      }
> >  }
> > --=20
> > 2.39.2
>
>
> Is this really the only way to fix this? I do not think
> virtio has any business knowing about replay.
> What does this API do, even? BH but not broken with replay?
> Do we ever want replay broken? Why not fix qemu_bh_schedule?
> And when we add another feature which we do not want to break
> will we do foo_bar_replay_bh_schedule_event or what?

I agree with you. We need to do this (a couple of other hw
subsystems already do and likely some are still broken vs
replay and would need to be converted), but I think it's
mostly a case of bad naming. You're right the caller should
not know about replay at all, what it should be is whether
the event is for the target machine or the host harness,
same as timers are VIRTUAL / HOST.

So I think we just need to make a qemu_bh_schedule_<type>,
or qemu_bh_scheudle_event(... QEMU_EVENT_VIRTUAL/HOST/etc).
I had started on a conversion once but not completed it.
I could resurrect if there is agreement on the API?

Thanks,
Nick
