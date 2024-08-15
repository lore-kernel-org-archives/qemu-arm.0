Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp756278njf;
        Thu, 15 Aug 2024 00:12:51 -0700 (PDT)
X-Received: by 2002:a62:e818:0:b0:710:9d5e:1154 with SMTP id d2e1a72fcca58-71276e871b1mr3029617b3a.2.1723705970808;
        Thu, 15 Aug 2024 00:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723705970; cv=none;
        d=google.com; s=arc-20160816;
        b=qKfZzYV6Oc4fOZB6xzyvk7X8oOXCuXxLtDZ5gKDJmCHfaeTBQVBvPCrH9mQzAoNFQl
         caPjthJwu17dqPk246OKF6PhOLef/lBXgunFpa3IBbxJ8DYbCTRNon2HKTTG8pQGLVfs
         uPyQPvmzfhbND1GOjSKpICqt8O/9EyQcP0din+rLr1y8PG0ym90IOLTGM61R21Bujnyc
         EEB5ckD3NpQhThnrvfImk58kLKJoFGbfH+521/jTY0BjBdLmWRwFBhDLoE1XTCQADe1t
         hG4BpDxbox6LsGzc/ijntIJ8nYq2YGs/uUEIMSMtekeafSZ/VHP9pDR/6J5ECJBA5EHC
         dEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=p44C8fERsSRYQkkQyzymFn1pVVaUH+QWqY2k98VCWpA=;
        fh=2p4y3HaoJ69K6ANt8dstZjC1VazwY0h+GrcHgma6j1o=;
        b=bmONeQQqjPhZf5oAoCyikm1nmnQlLIzRixlgUCjnkSk6jZdTBP+XK2jIxywQbIT1Hg
         demxX9nFPFHw1NKq7ekEihQvlyFWGYWMypUZzajlZrbpu3SE6RsYwYFD/M7EXdKIGsMx
         gh+jsX8EhpCns9AYC6wHJL5IquNFjvTZRAgGxXVYUYwIH4qF1g51/Vay9zuEhfjMvWei
         LMLqpp7QVE44NkRjmsiJjvoX9uyzuM6e+Kr2FhpBOZ/M4TlNsrgSXxDvsECt8FK+kXYD
         3EeEGUTPXY2e3m0pfvJvMV2GCooaMuEE7IJFHshl0RlXPFKFN/IunCTSRka9+TNNhUi5
         w45g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZrRym96O;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7127a14246esor909714b3a.2.2024.08.15.00.12.50
        (Google Transport Security);
        Thu, 15 Aug 2024 00:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZrRym96O;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723705969; x=1724310769; darn=linaro.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p44C8fERsSRYQkkQyzymFn1pVVaUH+QWqY2k98VCWpA=;
        b=ZrRym96OFVXWsddWcomxLPLwqTRbM5CxjV+ys8dKR1w9FjWswCQ5rIU4jaMB7M/UpO
         57LEgDBuIt6ojeit3VPD8moeo8FRjrJyC+HIQBFanwDOag0vez8IuaaEfZQ8Yajoq9dZ
         XGAtqGDNcUEQTjGMx1b5ENmz7J3DdfLp9FV+mYT53DUsnfxUITGYfXG4f3Ko6/WEsXv/
         xQ60AR8GRw4iLuZcEiyMApV2lbShN8smUZzE9OyJVZRJxJOCIAuD2u2rU20HdtFqT6l+
         tMcFG2AmydJSjvPO2SeSC0KmAjqsjuSmabA6EwqsmUSHqkIku1+PzpoG27zj2Djzs78a
         3Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723705969; x=1724310769;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p44C8fERsSRYQkkQyzymFn1pVVaUH+QWqY2k98VCWpA=;
        b=Z6mhxwF5D5mt6ZK+JnudA87vbDTmoh80EFVUze8IFSXMzPytyqHooYfF8FOxFs8tGo
         qCT8Mcn1S5ubQeJPoFlafIvv6v2JrFzCg1xK8BUyoB1j9Io5FCqiV1awjF2kTDLe8Hk/
         wFZx6Vz2Rr9EVIClVdWyamzqpbL+jt2gHwHWtVzXcA4QxUTR6uU31HR9QuuSbVHe1Ecl
         qT4KZwgzckQipWoD/s9YcMhy3E8c8N1NuNWQ/e/+Xy7evtd/3S7cxHo5CQa7R8Zaq4nO
         J/ktOk/NjU7Ea9Zdx2BDbrJZ75zqwUjHAC8d519UHZw8sq86/Ahu7gP3fI91fHTZ2wDI
         HCcg==
X-Forwarded-Encrypted: i=1; AJvYcCVxNPiG1QvuPOXahDRQvhi79It0yxlyYakMXfsYyk7MCZQauN9dJ3FgrUhmre8hyFI30wdd3oX+O68xoXLqCXJGkJOMFFRIjjhVBj9thySWfNolG+iPqW3nRG47vqNpcvK172z+7Aa2Rk4K/lte8YMXdiAo6cL2g+g1C8Z4X+l9LotDfSKXvOqji2RseCX9VBoHzJgAXM0=
X-Gm-Message-State: AOJu0YzpaMIuxQ1oEwr2w7BN+MdAcQ8me9TYg2F5YUfhd/xbppauEvs+
	OcFVmvPxkAz7fQBC7xmNRMSHD6aQdyRq0XjObwrv0zgihzVmxNb6O25dl3EM
X-Google-Smtp-Source: AGHT+IE7rhqF7AoUY4l8ZHu5L54QNuP56/MeZb/fUoS7zwo8PbyG03bMmxV/Akc8UpDL2PaAff/3lg==
X-Received: by 2002:a05:6a00:816:b0:70d:26cd:9741 with SMTP id d2e1a72fcca58-71276fbd507mr3022597b3a.12.1723705969120;
        Thu, 15 Aug 2024 00:12:49 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.145.66.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af3aeaasm535479b3a.191.2024.08.15.00.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 00:12:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Aug 2024 17:12:32 +1000
Message-Id: <D3GARIYVC16C.20SXVKSIMLED4@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>
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
X-Mailer: aerc 0.18.2
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-17-alex.bennee@linaro.org>
 <20240813164631-mutt-send-email-mst@kernel.org>
 <D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com>
 <20240814030308-mutt-send-email-mst@kernel.org>
 <87y14z81ak.fsf@draig.linaro.org>
In-Reply-To: <87y14z81ak.fsf@draig.linaro.org>
X-TUID: dYe7JLLoCVN3

On Thu Aug 15, 2024 at 3:25 AM AEST, Alex Benn=C3=A9e wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
>
> > On Wed, Aug 14, 2024 at 04:05:34PM +1000, Nicholas Piggin wrote:
> >> On Wed Aug 14, 2024 at 6:48 AM AEST, Michael S. Tsirkin wrote:
> >> > On Tue, Aug 13, 2024 at 09:23:24PM +0100, Alex Benn=C3=A9e wrote:
> >> > > From: Nicholas Piggin <npiggin@gmail.com>
> >> > >=20
> >> > > The regular qemu_bh_schedule() calls result in non-deterministic
> >> > > execution of the bh in record-replay mode, which causes replay fai=
lure.
> >> > >=20
> >> > > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> > > Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> >> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >> > > Message-Id: <20240813050638.446172-9-npiggin@gmail.com>
> >> > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> > > ---
> >> > >  hw/net/virtio-net.c | 11 ++++++-----
> >> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> >> > >=20
> >> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> > > index 08aa0b65e3..10ebaae5e2 100644
> >> > > --- a/hw/net/virtio-net.c
> >> > > +++ b/hw/net/virtio-net.c
> >> > > @@ -40,6 +40,7 @@
> >> > >  #include "migration/misc.h"
> >> > >  #include "standard-headers/linux/ethtool.h"
> >> > >  #include "sysemu/sysemu.h"
> >> > > +#include "sysemu/replay.h"
> >> > >  #include "trace.h"
> >> > >  #include "monitor/qdev.h"
> >> > >  #include "monitor/monitor.h"
> >> > > @@ -417,7 +418,7 @@ static void virtio_net_set_status(struct VirtI=
ODevice *vdev, uint8_t status)
> >> > >                  timer_mod(q->tx_timer,
> >> > >                                 qemu_clock_get_ns(QEMU_CLOCK_VIRTU=
AL) + n->tx_timeout);
> >> > >              } else {
> >> > > -                qemu_bh_schedule(q->tx_bh);
> >> > > +                replay_bh_schedule_event(q->tx_bh);
> >> > >              }
> >> > >          } else {
> >> > >              if (q->tx_timer) {
> >> > > @@ -2672,7 +2673,7 @@ static void virtio_net_tx_complete(NetClient=
State *nc, ssize_t len)
> >> > >           */
> >> > >          virtio_queue_set_notification(q->tx_vq, 0);
> >> > >          if (q->tx_bh) {
> >> > > -            qemu_bh_schedule(q->tx_bh);
> >> > > +            replay_bh_schedule_event(q->tx_bh);
> >> > >          } else {
> >> > >              timer_mod(q->tx_timer,
> >> > >                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->=
tx_timeout);
> >> > > @@ -2838,7 +2839,7 @@ static void virtio_net_handle_tx_bh(VirtIODe=
vice *vdev, VirtQueue *vq)
> >> > >          return;
> >> > >      }
> >> > >      virtio_queue_set_notification(vq, 0);
> >> > > -    qemu_bh_schedule(q->tx_bh);
> >> > > +    replay_bh_schedule_event(q->tx_bh);
> >> > >  }
> >> > > =20
> >> > >  static void virtio_net_tx_timer(void *opaque)
> >> > > @@ -2921,7 +2922,7 @@ static void virtio_net_tx_bh(void *opaque)
> >> > >      /* If we flush a full burst of packets, assume there are
> >> > >       * more coming and immediately reschedule */
> >> > >      if (ret >=3D n->tx_burst) {
> >> > > -        qemu_bh_schedule(q->tx_bh);
> >> > > +        replay_bh_schedule_event(q->tx_bh);
> >> > >          q->tx_waiting =3D 1;
> >> > >          return;
> >> > >      }
> >> > > @@ -2935,7 +2936,7 @@ static void virtio_net_tx_bh(void *opaque)
> >> > >          return;
> >> > >      } else if (ret > 0) {
> >> > >          virtio_queue_set_notification(q->tx_vq, 0);
> >> > > -        qemu_bh_schedule(q->tx_bh);
> >> > > +        replay_bh_schedule_event(q->tx_bh);
> >> > >          q->tx_waiting =3D 1;
> >> > >      }
> >> > >  }
> >> > > --=20
> >> > > 2.39.2
> >> >
> >> >
> >> > Is this really the only way to fix this? I do not think
> >> > virtio has any business knowing about replay.
> >> > What does this API do, even? BH but not broken with replay?
> >> > Do we ever want replay broken? Why not fix qemu_bh_schedule?
> >> > And when we add another feature which we do not want to break
> >> > will we do foo_bar_replay_bh_schedule_event or what?
> >>=20
> >> I agree with you. We need to do this (a couple of other hw
> >> subsystems already do and likely some are still broken vs
> >> replay and would need to be converted), but I think it's
> >> mostly a case of bad naming. You're right the caller should
> >> not know about replay at all, what it should be is whether
> >> the event is for the target machine or the host harness,
> >> same as timers are VIRTUAL / HOST.
> >> So I think we just need to make a qemu_bh_schedule_<type>,
> >> or qemu_bh_scheudle_event(... QEMU_EVENT_VIRTUAL/HOST/etc).
> >
> > Or just pass QEMUClockType?

Could be a good idea. Although I'm not sure what to do with
all types, maybe we can restrict what is supported.

> Is this wider re-factoring something that can wait for the next
> developer cycle?

I would say so. It's not quite trivial to do nicely since
things are a bit tangled between util/async and replay.

> >> I had started on a conversion once but not completed it.
> >> I could resurrect if there is agreement on the API?
>
> I would certainly welcome it being cleaned up. The supported replay
> devices are very piecemeal at the moment.

I'll tidy up and post an RFC for how the new API might look.

Thanks,
Nick
