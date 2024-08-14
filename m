Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fb155asm194746566b.81.2024.08.14.10.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 10:25:08 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 186F95F713;
	Wed, 14 Aug 2024 18:25:07 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,  qemu-devel@nongnu.org,  Alistair
 Francis <alistair.francis@wdc.com>,  Michael Roth <michael.roth@amd.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
  Yoshinori Sato <ysato@users.sourceforge.jp>,  Weiwei Li
 <liwei1518@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  David Hildenbrand <david@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Eric
 Auger <eric.auger@redhat.com>,  Song Gao <gaosong@loongson.cn>,
  qemu-arm@nongnu.org,  Peter Xu <peterx@redhat.com>,  Jiri Pirko
 <jiri@resnulli.us>,  Eric Blake <eblake@redhat.com>,  Fabiano Rosas
 <farosas@suse.de>,  qemu-s390x@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  John Snow <jsnow@redhat.com>,  Alexandre
 Iooss <erdnaxe@crans.org>,  Konstantin Kostiuk <kkostiuk@redhat.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Cleber Rosa
 <crosa@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  qemu-riscv@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
  Jason Wang <jasowang@redhat.com>,  Bin Meng <bmeng.cn@gmail.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Wainer dos
 Santos Moschetta
 <wainersm@redhat.com>,  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for
 bhs that affect machine state
In-Reply-To: <20240814030308-mutt-send-email-mst@kernel.org> (Michael S.
	Tsirkin's message of "Wed, 14 Aug 2024 03:06:54 -0400")
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
	<20240813202329.1237572-17-alex.bennee@linaro.org>
	<20240813164631-mutt-send-email-mst@kernel.org>
	<D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com>
	<20240814030308-mutt-send-email-mst@kernel.org>
Date: Wed, 14 Aug 2024 18:25:07 +0100
Message-ID: <87y14z81ak.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AIKQ0ejtfLq9

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Aug 14, 2024 at 04:05:34PM +1000, Nicholas Piggin wrote:
>> On Wed Aug 14, 2024 at 6:48 AM AEST, Michael S. Tsirkin wrote:
>> > On Tue, Aug 13, 2024 at 09:23:24PM +0100, Alex Benn=C3=A9e wrote:
>> > > From: Nicholas Piggin <npiggin@gmail.com>
>> > >=20
>> > > The regular qemu_bh_schedule() calls result in non-deterministic
>> > > execution of the bh in record-replay mode, which causes replay failu=
re.
>> > >=20
>> > > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > > Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> > > Message-Id: <20240813050638.446172-9-npiggin@gmail.com>
>> > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > > ---
>> > >  hw/net/virtio-net.c | 11 ++++++-----
>> > >  1 file changed, 6 insertions(+), 5 deletions(-)
>> > >=20
>> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> > > index 08aa0b65e3..10ebaae5e2 100644
>> > > --- a/hw/net/virtio-net.c
>> > > +++ b/hw/net/virtio-net.c
>> > > @@ -40,6 +40,7 @@
>> > >  #include "migration/misc.h"
>> > >  #include "standard-headers/linux/ethtool.h"
>> > >  #include "sysemu/sysemu.h"
>> > > +#include "sysemu/replay.h"
>> > >  #include "trace.h"
>> > >  #include "monitor/qdev.h"
>> > >  #include "monitor/monitor.h"
>> > > @@ -417,7 +418,7 @@ static void virtio_net_set_status(struct VirtIOD=
evice *vdev, uint8_t status)
>> > >                  timer_mod(q->tx_timer,
>> > >                                 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL=
) + n->tx_timeout);
>> > >              } else {
>> > > -                qemu_bh_schedule(q->tx_bh);
>> > > +                replay_bh_schedule_event(q->tx_bh);
>> > >              }
>> > >          } else {
>> > >              if (q->tx_timer) {
>> > > @@ -2672,7 +2673,7 @@ static void virtio_net_tx_complete(NetClientSt=
ate *nc, ssize_t len)
>> > >           */
>> > >          virtio_queue_set_notification(q->tx_vq, 0);
>> > >          if (q->tx_bh) {
>> > > -            qemu_bh_schedule(q->tx_bh);
>> > > +            replay_bh_schedule_event(q->tx_bh);
>> > >          } else {
>> > >              timer_mod(q->tx_timer,
>> > >                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx=
_timeout);
>> > > @@ -2838,7 +2839,7 @@ static void virtio_net_handle_tx_bh(VirtIODevi=
ce *vdev, VirtQueue *vq)
>> > >          return;
>> > >      }
>> > >      virtio_queue_set_notification(vq, 0);
>> > > -    qemu_bh_schedule(q->tx_bh);
>> > > +    replay_bh_schedule_event(q->tx_bh);
>> > >  }
>> > >=20=20
>> > >  static void virtio_net_tx_timer(void *opaque)
>> > > @@ -2921,7 +2922,7 @@ static void virtio_net_tx_bh(void *opaque)
>> > >      /* If we flush a full burst of packets, assume there are
>> > >       * more coming and immediately reschedule */
>> > >      if (ret >=3D n->tx_burst) {
>> > > -        qemu_bh_schedule(q->tx_bh);
>> > > +        replay_bh_schedule_event(q->tx_bh);
>> > >          q->tx_waiting =3D 1;
>> > >          return;
>> > >      }
>> > > @@ -2935,7 +2936,7 @@ static void virtio_net_tx_bh(void *opaque)
>> > >          return;
>> > >      } else if (ret > 0) {
>> > >          virtio_queue_set_notification(q->tx_vq, 0);
>> > > -        qemu_bh_schedule(q->tx_bh);
>> > > +        replay_bh_schedule_event(q->tx_bh);
>> > >          q->tx_waiting =3D 1;
>> > >      }
>> > >  }
>> > > --=20
>> > > 2.39.2
>> >
>> >
>> > Is this really the only way to fix this? I do not think
>> > virtio has any business knowing about replay.
>> > What does this API do, even? BH but not broken with replay?
>> > Do we ever want replay broken? Why not fix qemu_bh_schedule?
>> > And when we add another feature which we do not want to break
>> > will we do foo_bar_replay_bh_schedule_event or what?
>>=20
>> I agree with you. We need to do this (a couple of other hw
>> subsystems already do and likely some are still broken vs
>> replay and would need to be converted), but I think it's
>> mostly a case of bad naming. You're right the caller should
>> not know about replay at all, what it should be is whether
>> the event is for the target machine or the host harness,
>> same as timers are VIRTUAL / HOST.
>> So I think we just need to make a qemu_bh_schedule_<type>,
>> or qemu_bh_scheudle_event(... QEMU_EVENT_VIRTUAL/HOST/etc).
>
> Or just pass QEMUClockType?

Is this wider re-factoring something that can wait for the next
developer cycle?

>> I had started on a conversion once but not completed it.
>> I could resurrect if there is agreement on the API?

I would certainly welcome it being cleaned up. The supported replay
devices are very piecemeal at the moment.

>>=20
>> Thanks,
>> Nick

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
