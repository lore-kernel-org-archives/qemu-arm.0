Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp265597njf;
        Tue, 13 Aug 2024 13:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEeV3Q9hT9XnLTPWog6UVJGsQuLNWn5x6zwWSLpmBpciV4ggWSVGobmOX/KzjBde8omFaE
X-Received: by 2002:a05:6214:3f8b:b0:6b0:6dba:c947 with SMTP id 6a1803df08f44-6bf5d17e166mr10162536d6.18.1723582178877;
        Tue, 13 Aug 2024 13:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723582178; cv=none;
        d=google.com; s=arc-20160816;
        b=EonHSlrbmbnLwCdq6fBQsPcQL1zSFHN6jwMxbD4adhfcs2DXHZbQr2lZAAZjGCw+dJ
         JFYcDUoiJiMdYmCk+gVmKk6tTZ5usEcjS4GRlWO9tBM1kuhl3iIqhZnjGyVZ3EUkXSyq
         SLp8eLuTK8FMNVrYUKOFctNpJ776P0oST+iVrxzN1wFsjqc57LIwbY9o3ZI1TK3UrlYG
         MvFlFQiG6VRN7wsrPVCsNNlrrwa4qBXBLNBgFYdYrIklu+/ovcIMvzeRkRKoPKCEFrHo
         L35YdOhBd0dT3sEsCaukKqw0wbHUBtsmMaEVlwZvySpSMWQbIKRawsu8KeDNwdHy0Oef
         fo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2jyXx+wKOQOxU2ecyqA2iwoYFri7dVNuVaZYwSPMvZE=;
        fh=lrmisavycwKzQCL9pYHn5IStxFftwce1riQS8JPCiSw=;
        b=Ap0d5orBPyAHt0w4vQEst+2UbBGDhePt65WUeMs4W2aI3075HPeoDO8Bn14vfOJWwZ
         pzFgQ8xdqQOu0c+URfMNvzbUhO2EiwVgUlBkWJY4VAHNGE5pav8WmcGfXHGIKjxyObAD
         dwjfljwblqL6aV2sH4A00ioBUsHTcl3aiOkLqCEjFxj9+gk1WMPUD01Lnk5Tu+mYSeyd
         PqiUrLDMKEjWtLxRu9LqpqChBcMnD3XdJxUk3fYQc5JMbSXsYUSGjBv63XslsgIfzsAO
         CwFzqPir3N/coar2vStcnx3Nn+WJMFh8TwmMtHdIOuaTjIOAbAPNUhR5VASRJVlsw4Y8
         Z/5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HtE+sUdz;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82c8a12bsi90853976d6.158.2024.08.13.13.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:49:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HtE+sUdz;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723582178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2jyXx+wKOQOxU2ecyqA2iwoYFri7dVNuVaZYwSPMvZE=;
	b=HtE+sUdzlq+GAErZhfM0hi8LWBKHR+s1Bh1KafdewgCYAs6/+M/qAxIAVbdCZkPznSnUUK
	p9dRYnPVPVyTkHWvyFwLU68ttIijtVZ5sXK2hqhZubC81Xn7A27Sbap/YuvUnYhM+72iY7
	7Jo3AybT17NMgmRp7mr8vFk+JCT3skk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-4ppPE_qoN5qHiP3Zz6K80g-1; Tue, 13 Aug 2024 16:49:37 -0400
X-MC-Unique: 4ppPE_qoN5qHiP3Zz6K80g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5b122f40f64so4594988a12.3
        for <alex.bennee@linaro.org>; Tue, 13 Aug 2024 13:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723582176; x=1724186976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jyXx+wKOQOxU2ecyqA2iwoYFri7dVNuVaZYwSPMvZE=;
        b=hjor0jRealy3x0+M7AYXoPsEII+eg6i77IIXISmahYjPNnzfUFQY7Jm+kFcksrDKdl
         tucm130U+uj6CvrwhSnPQxaleU0s2mlfqglA+TTIgdKf7AqI+BeNGRl0k6f2UvOn087X
         VsnG296zETmr0dc/pPlzVT1LI9jLq23dCLuyRS091tM1Dz17IyPib2VdYuRgonbBXHYQ
         OX3DntHj6bSn1VNFeIv1KC/hL7yG1BwMUfV49KBhZyKNYWtfAoF0vqBnyKyqokyj97x3
         zq1WdXuEyPcQtKP5DDyFDPI5rb/vWy5o859GzYc2QsllWhyK7Wrxk/v/zevMvG1CriaB
         IYmQ==
X-Gm-Message-State: AOJu0YwpXmnH+/Ue9dmWoggm90tBUUULNRIK7CGPWUGUeDWw+y7f5/WL
	A0G6wU45aMwX+dkbJUYLjOg694vUJv7iFDCm+LRPR499VCYFUA+3uNpWGFj5WUKJSBxbFL6d9gu
	QBi2vdrtGYpNNg6aVm4H26BN8LXoZ7qzRJG2QIM2tTR5I+H3kK4jq9gfJBEtGFZvMaMuyrB+B2x
	AaXtyAvuTH/BV2WcisTGfu/Lj3tAWZly8=
X-Received: by 2002:a05:6402:354d:b0:5a2:eeeb:9470 with SMTP id 4fb4d7f45d1cf-5bea1c7d55cmr495906a12.18.1723582175675;
        Tue, 13 Aug 2024 13:49:35 -0700 (PDT)
X-Received: by 2002:a05:6402:354d:b0:5a2:eeeb:9470 with SMTP id 4fb4d7f45d1cf-5bea1c7d55cmr495846a12.18.1723582174803;
        Tue, 13 Aug 2024 13:49:34 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc7:346:dcde:9c09:aa95:551d:d374])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a602115sm3148299a12.96.2024.08.13.13.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:49:34 -0700 (PDT)
Date: Tue, 13 Aug 2024 16:49:24 -0400
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
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 17/21] virtio-net: Use virtual time for RSC timers
Message-ID: <20240813164916-mutt-send-email-mst@kernel.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-18-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240813202329.1237572-18-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: eoHF0vQ8ov0T

On Tue, Aug 13, 2024 at 09:23:25PM +0100, Alex Bennée wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> Receive coalescing is visible to the target machine, so its timers
> should use virtual time like other timers in virtio-net, to be
> compatible with record-replay.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Message-Id: <20240813050638.446172-10-npiggin@gmail.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/net/virtio-net.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 10ebaae5e2..ed33a32877 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2124,7 +2124,7 @@ static void virtio_net_rsc_purge(void *opq)
>      chain->stat.timer++;
>      if (!QTAILQ_EMPTY(&chain->buffers)) {
>          timer_mod(chain->drain_timer,
> -              qemu_clock_get_ns(QEMU_CLOCK_HOST) + chain->n->rsc_timeout);
> +              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + chain->n->rsc_timeout);
>      }
>  }
>  
> @@ -2360,7 +2360,7 @@ static size_t virtio_net_rsc_do_coalesce(VirtioNetRscChain *chain,
>          chain->stat.empty_cache++;
>          virtio_net_rsc_cache_buf(chain, nc, buf, size);
>          timer_mod(chain->drain_timer,
> -              qemu_clock_get_ns(QEMU_CLOCK_HOST) + chain->n->rsc_timeout);
> +              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + chain->n->rsc_timeout);
>          return size;
>      }
>  
> @@ -2598,7 +2598,7 @@ static VirtioNetRscChain *virtio_net_rsc_lookup_chain(VirtIONet *n,
>          chain->max_payload = VIRTIO_NET_MAX_IP6_PAYLOAD;
>          chain->gso_type = VIRTIO_NET_HDR_GSO_TCPV6;
>      }
> -    chain->drain_timer = timer_new_ns(QEMU_CLOCK_HOST,
> +    chain->drain_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                        virtio_net_rsc_purge, chain);
>      memset(&chain->stat, 0, sizeof(chain->stat));
>  
> -- 
> 2.39.2
