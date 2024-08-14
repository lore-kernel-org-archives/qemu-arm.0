Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp380846njf;
        Wed, 14 Aug 2024 00:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTUHQ67NY+z27OoP33LsbedqbAtA6lVBNG2NH1MDrQe8eccTyb/98Y3WLKtuFs9TcUeF0M
X-Received: by 2002:a05:620a:40cd:b0:7a2:34c:621a with SMTP id af79cd13be357-7a4ee323f96mr197550385a.1.1723619230645;
        Wed, 14 Aug 2024 00:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723619230; cv=none;
        d=google.com; s=arc-20160816;
        b=fxxPZiaYRP/pQvUMmMcp8SsC7jBxLIyC5KsxYDdyWqxyIBZpJiADdnJtkrvwWVGpAM
         H8bZMrQV8XVhKwFtqbprxa2Q9jVzywil+5xeJ6VZqA8MJk3TbffGR71TtbeVAmwINf3c
         4tkwg9TG6I77eRboVQAROrExXY7zuDJtRyk8MHptHVm9PICbwHq2IgKsc25r9D6L5+1M
         fabyokI+v6n5SX4/FaiD3+OaNoC8W1G5i7tgX+M8XcX0e5hxnUYL0dDi4KZo0V8SSFBq
         P/d89OkaWcB4tdzyR/4KdfQHNrLIQxwaTKhyjTG76uqZ0niIFBDrOo8SbQYkY+Ll7RZf
         X2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=aixfq3msU3vKLm2ITSkUT14V/Ja+F+Io6bU04msq8Z8=;
        fh=7PYBkNaQxyBUW8FT7Cv5hEQwAeXvtqaGUCDeGRr+SFA=;
        b=z8bvcmbtaOoYUYo+UPru6Gr54zecXNCumUOtBbG+hLnEHoudIN3j89tz+XjmETn4K3
         /+e/PEOUBd8R2kBm60KhULh8brZ7bom9t2QV8JcImH8KIyaChSXNK5uNX8Zz6njcumLQ
         GL+RkyB5MFrOdHMyiEdfzIj5Sr03jRW8WLh9M0Tr6nGVmkuHGG0P+oFsaEB41mlupU7a
         a9kMS48SY+XpV8nABIpuBOz7S2khm70SmmH9c6dFjpp2XVLRXPkLHpcjjNvkkU55CNSh
         Yajk5xU2Y49eAsOoIK0D6uhSsOhL7s+bYNsSSql1p10XfhuLdJRr8rpHWfhNwSvJcR4K
         kq1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LTn71ts0;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a4c7e19205si1080380185a.654.2024.08.14.00.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 00:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LTn71ts0;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723619230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aixfq3msU3vKLm2ITSkUT14V/Ja+F+Io6bU04msq8Z8=;
	b=LTn71ts0XWAD0tMycNlVipQt3ex0yL06s1SZ8gXE66vX4nFMoe8BY1NE7bp8P+TFvVhAcn
	VPZ2XR5+zJOKiB0mTkK1+EXO3359wGGSmhgsVYhnN9y5Z9S+RCCUufQqwouPkDdJzJzQTQ
	7WmaTjAQxdeetWWIQFjEihqrnXBQmT8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-udfVtzYQMkOGfDWjvJAiQQ-1; Wed, 14 Aug 2024 03:07:07 -0400
X-MC-Unique: udfVtzYQMkOGfDWjvJAiQQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77e044ff17so404573966b.3
        for <alex.bennee@linaro.org>; Wed, 14 Aug 2024 00:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723619226; x=1724224026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aixfq3msU3vKLm2ITSkUT14V/Ja+F+Io6bU04msq8Z8=;
        b=Fb09XOMmD8Q/NxH/IKxOflQri7K+m3nwnwf7W2jb3j9Bn8d1Yf1zHy+Jrsi3fZKkFh
         MfZfN9arWxepXz8xVYxRIBNiQthSxXyFeTWyuh6JzaS97+B8du/LRCQbvH9OPbLIEasb
         i16ULRlZkRcoje2s5Ds4fzU7s6zeRcENHfWzvSvGyr+6dMnVS/Eun+uh2efvx0lv2u4C
         IUSVv5Y++1x/DgEMEeJ7dvpXBOcHgbejXepu0sB4PEs7FOrJoY47F/TkK8oEqrjfwPN1
         z4/f4c94Qhx4XOl0kXx46W0jwxYhKY8fO0HcEayrtdhzoIuXoNKji9B8Fex8E5p9xGNJ
         QXiQ==
X-Gm-Message-State: AOJu0YxPPYIOTvoG1lXDOWfzF++B8WHnVAAoANUcgkLlVTDQXdtMK+pM
	SXp8LkUS7ZspDBRoFXAGurfez4l2P1wOL5OYQEeIKlWtQ5LANSpsNQnMK1tNyui7AjpC/+p4AoD
	mAP1Y0BO0IbeaMF64ZjptcUEvMuHp7HbzWrskd/DgR5uH5VD2CNNn8w==
X-Received: by 2002:a17:907:f707:b0:a7a:cc10:667c with SMTP id a640c23a62f3a-a8366c30da9mr117170366b.16.1723619226614;
        Wed, 14 Aug 2024 00:07:06 -0700 (PDT)
X-Received: by 2002:a17:907:f707:b0:a7a:cc10:667c with SMTP id a640c23a62f3a-a8366c30da9mr117165466b.16.1723619225708;
        Wed, 14 Aug 2024 00:07:05 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc7:346:dcde:9c09:aa95:551d:d374])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bbfcsm136904866b.135.2024.08.14.00.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 00:07:04 -0700 (PDT)
Date: Wed, 14 Aug 2024 03:06:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Michael Roth <michael.roth@amd.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Weiwei Li <liwei1518@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Eric Auger <eric.auger@redhat.com>, Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Jason Wang <jasowang@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for
 bhs that affect machine state
Message-ID: <20240814030308-mutt-send-email-mst@kernel.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-17-alex.bennee@linaro.org>
 <20240813164631-mutt-send-email-mst@kernel.org>
 <D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com>
MIME-Version: 1.0
In-Reply-To: <D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: HmL0/QCp3DgA

On Wed, Aug 14, 2024 at 04:05:34PM +1000, Nicholas Piggin wrote:
> On Wed Aug 14, 2024 at 6:48 AM AEST, Michael S. Tsirkin wrote:
> > On Tue, Aug 13, 2024 at 09:23:24PM +0100, Alex Bennée wrote:
> > > From: Nicholas Piggin <npiggin@gmail.com>
> > > 
> > > The regular qemu_bh_schedule() calls result in non-deterministic
> > > execution of the bh in record-replay mode, which causes replay failure.
> > > 
> > > Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> > > Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > > Message-Id: <20240813050638.446172-9-npiggin@gmail.com>
> > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > ---
> > >  hw/net/virtio-net.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 08aa0b65e3..10ebaae5e2 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -40,6 +40,7 @@
> > >  #include "migration/misc.h"
> > >  #include "standard-headers/linux/ethtool.h"
> > >  #include "sysemu/sysemu.h"
> > > +#include "sysemu/replay.h"
> > >  #include "trace.h"
> > >  #include "monitor/qdev.h"
> > >  #include "monitor/monitor.h"
> > > @@ -417,7 +418,7 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
> > >                  timer_mod(q->tx_timer,
> > >                                 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> > >              } else {
> > > -                qemu_bh_schedule(q->tx_bh);
> > > +                replay_bh_schedule_event(q->tx_bh);
> > >              }
> > >          } else {
> > >              if (q->tx_timer) {
> > > @@ -2672,7 +2673,7 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
> > >           */
> > >          virtio_queue_set_notification(q->tx_vq, 0);
> > >          if (q->tx_bh) {
> > > -            qemu_bh_schedule(q->tx_bh);
> > > +            replay_bh_schedule_event(q->tx_bh);
> > >          } else {
> > >              timer_mod(q->tx_timer,
> > >                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> > > @@ -2838,7 +2839,7 @@ static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
> > >          return;
> > >      }
> > >      virtio_queue_set_notification(vq, 0);
> > > -    qemu_bh_schedule(q->tx_bh);
> > > +    replay_bh_schedule_event(q->tx_bh);
> > >  }
> > >  
> > >  static void virtio_net_tx_timer(void *opaque)
> > > @@ -2921,7 +2922,7 @@ static void virtio_net_tx_bh(void *opaque)
> > >      /* If we flush a full burst of packets, assume there are
> > >       * more coming and immediately reschedule */
> > >      if (ret >= n->tx_burst) {
> > > -        qemu_bh_schedule(q->tx_bh);
> > > +        replay_bh_schedule_event(q->tx_bh);
> > >          q->tx_waiting = 1;
> > >          return;
> > >      }
> > > @@ -2935,7 +2936,7 @@ static void virtio_net_tx_bh(void *opaque)
> > >          return;
> > >      } else if (ret > 0) {
> > >          virtio_queue_set_notification(q->tx_vq, 0);
> > > -        qemu_bh_schedule(q->tx_bh);
> > > +        replay_bh_schedule_event(q->tx_bh);
> > >          q->tx_waiting = 1;
> > >      }
> > >  }
> > > -- 
> > > 2.39.2
> >
> >
> > Is this really the only way to fix this? I do not think
> > virtio has any business knowing about replay.
> > What does this API do, even? BH but not broken with replay?
> > Do we ever want replay broken? Why not fix qemu_bh_schedule?
> > And when we add another feature which we do not want to break
> > will we do foo_bar_replay_bh_schedule_event or what?
> 
> I agree with you. We need to do this (a couple of other hw
> subsystems already do and likely some are still broken vs
> replay and would need to be converted), but I think it's
> mostly a case of bad naming. You're right the caller should
> not know about replay at all, what it should be is whether
> the event is for the target machine or the host harness,
> same as timers are VIRTUAL / HOST.
> So I think we just need to make a qemu_bh_schedule_<type>,
> or qemu_bh_scheudle_event(... QEMU_EVENT_VIRTUAL/HOST/etc).

Or just pass QEMUClockType?

> I had started on a conversion once but not completed it.
> I could resurrect if there is agreement on the API?
> 
> Thanks,
> Nick
