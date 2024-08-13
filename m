Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp265407njf;
        Tue, 13 Aug 2024 13:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+PFL+esMCQF23/A1fuNXXnqz/wbFbA1Ak9KTe1mLGDgniPd6hR+lgrwHWvgd6IpYmkfkb
X-Received: by 2002:a05:6830:7313:b0:709:2721:ad44 with SMTP id 46e09a7af769-70c9d98ecd1mr1137174a34.12.1723582129233;
        Tue, 13 Aug 2024 13:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723582129; cv=none;
        d=google.com; s=arc-20160816;
        b=ps6o/5fucgcXAcWFBZ348eMTYXg8nQ8O86CsUUDRwHINwTo60RjTxIQ3d3leDa5dgO
         7hgx5JJh2NaY4oudhEk3bk8JyEtW4TMbfKmY867lb3J9/sKJo5Hx/mBfKaiZMRU2Dlbv
         +5z5UvBLgcxEWcRNX5uy3z28aJjw9qAeXIVkGJOQ+pSyCOR1YhWDDSzy+g87Opl0LlD2
         u2mCwLPis1sOUpr+bmbx3zFxogNg8JhmyjZVCk3UuSQXS8VxTij/h1GmQqf4bQ7GGznT
         A2YfL90A48oZSwBqgq9HqtYQLQSMzuWVxbl8aLiEWPYlXN9X09qYRHgkbjv14qBO5BvN
         0UoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=+5q8JPWzVME9LxHSD0qURbS4KgtgRwjLQPX3M91v2oQ=;
        fh=m91jYh2roUvwjwlhJDsuxPM3hBV4qg9i4QPAFGgR2G0=;
        b=lH8gxPkHMoMJkU9VHCUAxFJfMnQRIJkjytH7A6J0G4nub4bqnEKt3/dNlvySa1a5Lv
         JDlKbIoNqo6CB6Y2EkEHNjH2fYfWXos6CkIA04p7s7l1PdYnjxv0CSq3PA0hG6pFqKMz
         RaAFuF31GPuS+Ynf63daNWUNk2jAoUY/LTbL3dt9Zg+D+8mNWNJ+3EAiMISo1af3KQ54
         ZrkAvipbz5c7T0NpM8NGLZtD6O7G7iIB4UkC/2zNsZ4+PsIrU3kWcTOU1jrsSjLdgMil
         KVRZdcPb6f5n1Ch6AqeJzULlKNiXReMv3VsdEhc40v34fp0iPNb9l9fgbUVqo+cXSI6b
         SAAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TAR4ODXT;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45357e1cb42si12316081cf.173.2024.08.13.13.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TAR4ODXT;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723582128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5q8JPWzVME9LxHSD0qURbS4KgtgRwjLQPX3M91v2oQ=;
	b=TAR4ODXTz6Ir3hssujXGTGU8sXAA9bfXaPTrM84+FUOaOoDQadpR0BcbS/X4TD01w9ZLUg
	Hto/j0v2qwu/mQToePM0c+md2OILPYvQDIG5WHlNsKzaEoXTKg5dp3AxdGg2OVe3SfMeN+
	LgAvs0uhh2X+2TG7BEsrso7S4KuBmVw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-rVIj6g8HPluaQSjBCLVozw-1; Tue, 13 Aug 2024 16:48:47 -0400
X-MC-Unique: rVIj6g8HPluaQSjBCLVozw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7aa26f342cso453637966b.1
        for <alex.bennee@linaro.org>; Tue, 13 Aug 2024 13:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723582126; x=1724186926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5q8JPWzVME9LxHSD0qURbS4KgtgRwjLQPX3M91v2oQ=;
        b=rsyQEXU0CocXv9KFlA3GSX1tfPtQrvg0Hc8DjpcFuVNO+8VD/RXsrH+UKDWTujvFtO
         9dMQnXAk51AXfYskCDmM2h86Boiwa8tUSmxNufeEspCD/zoOEHZG8RosPMKYyw2Al5O7
         9mKGXE6LLEjTki3p2iBgWinmC7ueTnhrOnx3pTc2JpdxtTsJwwCYSi/WMUFfzlQt+IwS
         O4Dn3d8grlOQrIDkcU2G9sIuTvLmUZYYTDAmBt4slzEKLBYOIet8QFEKb4XHALsI739o
         hMOrSyEZhrRFalaMMxJYUv9hNTGHaTgPVExfryQPN9v7+Mm2J9vZU0B1Am3zcKc0W6dn
         atJw==
X-Gm-Message-State: AOJu0YxLUO0G9qXYnq5651doYxP3+D3+BqjgkxquBa3gLzyhgBU0ETCZ
	pSjmiXZvojw8eAi+21L20FHAVyXbFljcONxpcrLDesrnOLc/Pjv8JNamQmTQQUZ7XZUKrrFZU2o
	AdyJGZON0wmUCOiZ9EdcIzsMwB8G3+FO0jZVLA93HGlmcqKiiUdjzLFaLFQy9rZTgp/lV5VjXLc
	pabzIJWxEEKn02UqdyahEozxuntzT2Gko=
X-Received: by 2002:a17:906:cadd:b0:a7a:b620:aa3a with SMTP id a640c23a62f3a-a8367034961mr37160966b.52.1723582126059;
        Tue, 13 Aug 2024 13:48:46 -0700 (PDT)
X-Received: by 2002:a17:906:cadd:b0:a7a:b620:aa3a with SMTP id a640c23a62f3a-a8367034961mr37153966b.52.1723582125038;
        Tue, 13 Aug 2024 13:48:45 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc7:346:dcde:9c09:aa95:551d:d374])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f415615dsm97515166b.187.2024.08.13.13.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:48:44 -0700 (PDT)
Date: Tue, 13 Aug 2024 16:48:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
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
	Nicholas Piggin <npiggin@gmail.com>,
	Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for
 bhs that affect machine state
Message-ID: <20240813164631-mutt-send-email-mst@kernel.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-17-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240813202329.1237572-17-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: fmrl1VBbuNDI

On Tue, Aug 13, 2024 at 09:23:24PM +0100, Alex Bennée wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> The regular qemu_bh_schedule() calls result in non-deterministic
> execution of the bh in record-replay mode, which causes replay failure.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Message-Id: <20240813050638.446172-9-npiggin@gmail.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/net/virtio-net.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 08aa0b65e3..10ebaae5e2 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -40,6 +40,7 @@
>  #include "migration/misc.h"
>  #include "standard-headers/linux/ethtool.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/replay.h"
>  #include "trace.h"
>  #include "monitor/qdev.h"
>  #include "monitor/monitor.h"
> @@ -417,7 +418,7 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
>                  timer_mod(q->tx_timer,
>                                 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
>              } else {
> -                qemu_bh_schedule(q->tx_bh);
> +                replay_bh_schedule_event(q->tx_bh);
>              }
>          } else {
>              if (q->tx_timer) {
> @@ -2672,7 +2673,7 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
>           */
>          virtio_queue_set_notification(q->tx_vq, 0);
>          if (q->tx_bh) {
> -            qemu_bh_schedule(q->tx_bh);
> +            replay_bh_schedule_event(q->tx_bh);
>          } else {
>              timer_mod(q->tx_timer,
>                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> @@ -2838,7 +2839,7 @@ static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
>          return;
>      }
>      virtio_queue_set_notification(vq, 0);
> -    qemu_bh_schedule(q->tx_bh);
> +    replay_bh_schedule_event(q->tx_bh);
>  }
>  
>  static void virtio_net_tx_timer(void *opaque)
> @@ -2921,7 +2922,7 @@ static void virtio_net_tx_bh(void *opaque)
>      /* If we flush a full burst of packets, assume there are
>       * more coming and immediately reschedule */
>      if (ret >= n->tx_burst) {
> -        qemu_bh_schedule(q->tx_bh);
> +        replay_bh_schedule_event(q->tx_bh);
>          q->tx_waiting = 1;
>          return;
>      }
> @@ -2935,7 +2936,7 @@ static void virtio_net_tx_bh(void *opaque)
>          return;
>      } else if (ret > 0) {
>          virtio_queue_set_notification(q->tx_vq, 0);
> -        qemu_bh_schedule(q->tx_bh);
> +        replay_bh_schedule_event(q->tx_bh);
>          q->tx_waiting = 1;
>      }
>  }
> -- 
> 2.39.2


Is this really the only way to fix this? I do not think
virtio has any business knowing about replay.
What does this API do, even? BH but not broken with replay?
Do we ever want replay broken? Why not fix qemu_bh_schedule?
And when we add another feature which we do not want to break
will we do foo_bar_replay_bh_schedule_event or what?

-- 
MST
