Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2395027lfm;
        Tue, 16 Jun 2020 00:58:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9c6oDkGjNG52e+8QT2iXQJXFavtcz7beLJmM1BTtl/b67ib/cfOUoSOO3lIx2SzjZhYIA
X-Received: by 2002:a25:d652:: with SMTP id n79mr2379414ybg.406.1592294297253;
        Tue, 16 Jun 2020 00:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592294297; cv=none;
        d=google.com; s=arc-20160816;
        b=0DISy5WvweKQxMHdf2MWugNwDfdjnb8MMymsuYD2dGSQ9REIo92Mm3qxhBs6vFAL3F
         2VRGB7Iy/C9R9wZu45Hw2fWc1bhJpV6HDVOk/YQXTmCl8RKIv58NXXRxYWnQNf5lke8j
         xf0tEM+2iyUse4Du1QpveYM2lkbrxLOYTFC+MVs6IC3X8v3qDOC8s5dgmAG5NAiCJR4k
         QUwqiz0GD0SJyHHJbJTFXd6GBg6EfTlZsq264s//080IliznLLFGF+RqFJlZXgnfc884
         PJ3qSjaNmG3PrBnPnLQG9vpo0MrSNVeaNUjCvH73TGP1wg8l4WrAYCVTwUxuov3XjPev
         9HSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=aFWA1D51nYvlpTavTZNs9Ivd0er23WeRjh1oww7kTtI=;
        b=Mmo0oM3SnDPZ6JaLEkNitDaJ8XoYS414mEr4Ser7wWW1yzaC6aawmMqauPi7QAPFjq
         apzY1qQljS99FeUzZ8U8m0vmBguNXbokyUV6+9kBiw/hCIxpdn1MOtXXg2mbN3WGIVIo
         kx0ZOBznbgqh3jLAwRwEZ/iNrBdAf5AQg7Aod4rIhUTuWQlWYxRQZ/blqX/XcabqQZkW
         30HXKPKJixy/hBBY/Bs9cV39E0e2vqYONO9PGsqZBl6jYA3znPe0OBk6Pfs27drAdjTZ
         5q/212AQXkrdogXW89Wbmo3z8FXv5EnEoTuFRtwbIj/r++6p2tBE8Pkk8STqyOnfq+Rl
         PpWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YwRds33K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p196si14076337ybg.113.2020.06.16.00.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 00:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YwRds33K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl6U4-0005WS-KH
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 03:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jl6Tf-0005Dy-7G
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 03:57:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29380
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jl6Td-0000ef-JU
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 03:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592294268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aFWA1D51nYvlpTavTZNs9Ivd0er23WeRjh1oww7kTtI=;
 b=YwRds33KSNHd8yfoCCJFeORa91ZVWwQFmOu5xVJspTLHVZjXKicfg0GtL+WEmK6a2AogTn
 7oBFkXNu/b7aZcY/2+sesnVUwrkGAyd5bRG/4fgdODrl8ZGamcW1YOtJABYbzoroAnTkxA
 HvgPKjpPf23EJVT/iWo26LJ7mEnd2nA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-ch6fJ6iQNMO5sISfRo2xOw-1; Tue, 16 Jun 2020 03:57:47 -0400
X-MC-Unique: ch6fJ6iQNMO5sISfRo2xOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C25DE914;
 Tue, 16 Jun 2020 07:57:45 +0000 (UTC)
Received: from [10.36.114.106] (ovpn-114-106.ams2.redhat.com [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48C36100164C;
 Tue, 16 Jun 2020 07:57:39 +0000 (UTC)
Subject: Re: [PATCH 4/7] hw/virtio/virtio-balloon: Rename timer field
 including 'ms' unit
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200616075121.12837-1-f4bug@amsat.org>
 <20200616075121.12837-5-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <85580878-deff-8c0b-be61-e4147399cd91@redhat.com>
Date: Tue, 16 Jun 2020 09:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616075121.12837-5-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goate?= =?UTF-8?Q?r?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GF7NkW9uX9X6

On 16.06.20 09:51, Philippe Mathieu-Daudé wrote:
> To make code review easier, append the timer unit (milli-seconds)
> to its variable name.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/virtio/virtio-balloon.h |  2 +-
>  hw/virtio/virtio-balloon.c         | 14 ++++++++------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
> index d49fef00ce..8a85fb1b88 100644
> --- a/include/hw/virtio/virtio-balloon.h
> +++ b/include/hw/virtio/virtio-balloon.h
> @@ -50,7 +50,7 @@ typedef struct VirtIOBalloon {
>      uint64_t stats[VIRTIO_BALLOON_S_NR];
>      VirtQueueElement *stats_vq_elem;
>      size_t stats_vq_offset;
> -    QEMUTimer *stats_timer;
> +    QEMUTimer *stats_timer_ms;
>      IOThread *iothread;
>      QEMUBH *free_page_bh;
>      /*
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 10507b2a43..ad67cd53e4 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -197,16 +197,17 @@ static bool balloon_stats_enabled(const VirtIOBalloon *s)
>  static void balloon_stats_destroy_timer(VirtIOBalloon *s)
>  {
>      if (balloon_stats_enabled(s)) {
> -        timer_del(s->stats_timer);
> -        timer_free(s->stats_timer);
> -        s->stats_timer = NULL;
> +        timer_del(s->stats_timer_ms);
> +        timer_free(s->stats_timer_ms);
> +        s->stats_timer_ms = NULL;
>          s->stats_poll_interval = 0;
>      }
>  }
>  
>  static void balloon_stats_change_timer(VirtIOBalloon *s, int64_t secs)
>  {
> -    timer_mod(s->stats_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + secs * 1000);
> +    timer_mod(s->stats_timer_ms,
> +              qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + secs * 1000);
>  }
>  
>  static void balloon_stats_poll_cb(void *opaque)
> @@ -315,8 +316,9 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
>      }
>  
>      /* create a new timer */
> -    g_assert(s->stats_timer == NULL);
> -    s->stats_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, balloon_stats_poll_cb, s);
> +    g_assert(s->stats_timer_ms == NULL);
> +    s->stats_timer_ms = timer_new_ms(QEMU_CLOCK_VIRTUAL,
> +                                     balloon_stats_poll_cb, s);
>      s->stats_poll_interval = value;
>      balloon_stats_change_timer(s, 0);
>  }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

