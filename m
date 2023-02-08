Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp52822ejb;
        Wed, 8 Feb 2023 14:08:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+Mp6ObUAban/o/rppOAiHpVFf49/RSyoPYc4b+tKpMff3YFpVwB8Tlz8zHlYg5gw7aKE1G
X-Received: by 2002:a05:622a:1995:b0:3ba:13e4:527f with SMTP id u21-20020a05622a199500b003ba13e4527fmr16590981qtc.13.1675894086377;
        Wed, 08 Feb 2023 14:08:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675894086; cv=none;
        d=google.com; s=arc-20160816;
        b=m2S6HwlHTGRzbCOoPzJRd/+Izjsik32bxKk3rdV4Bue2ZkGkz4m+EvhaQLEgMOGiI1
         uJ2pvKFlxbLw/1II+NeJJDMxQdctjR7fQH9c+Zkec4FDrSmhwlA7p6t/n/xu/l65Xbue
         2G827JX9hh/Ua/io0w7TZJJQN8muqFbpxLU153GFIiWp0DERZzoHdqUxufDWdjoNI27O
         Uszyq/Kz5N8SvNQ63YxId89X6STXNQobRl2B8atDBk3ZYSQSZ3UEXjGvDr814dSw9qHV
         ns/Cc0Q2bPvNDEqlNDN1nu0htD8lTS7jg6XrYvG/ebNvNGe7HZQoYVd5/iVQcimShumD
         IB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=bMVLDa7WL4wVCBGtc5eUGVnT7CMRQqtQ/0eqVzvAIkY=;
        b=ATZw7qyBYiQtJfrhrsYf8ENgEn7wIteoYk9krjWbj2nrmjDGkPTXZ1Yw+Htol8nUFE
         Mq7qHkPeW6VN0Lw1X88egHhLMjSfg2gz7LpeYe9SfPZXGnsuihwQDEaz+neIIkEPWqvD
         2ddJSVRKDB6FH1V1qPcm9ib61xALQskF7GWPylPVMC+/T55+dDIPF9BJkmAscrrth53e
         H+8ImtNJrYfzqivqhWpU68iw6+Cjzxn6chRoPLAYK5mHvNNeKQ1trgyzzq4kCSgi4y73
         Al5rWr0uzUveO2g1kYkfY05+Ny/WXI1sNFmtDYdk3c2wtDEb1Sdm0bimuMSIA85cCm8x
         4xow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iReqvodm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020a05620a24cc00b006ea237e4418si37155qkn.182.2023.02.08.14.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:08:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iReqvodm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPsbY-0004Lb-A7; Wed, 08 Feb 2023 17:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsbW-0004LI-KN
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsbU-0001SF-Qh
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675894067;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bMVLDa7WL4wVCBGtc5eUGVnT7CMRQqtQ/0eqVzvAIkY=;
 b=iReqvodmuMTe4ENFMe02x+XhMBGTYORRCtI8W9sOCSQBELeTMpJGP7W9ypsYKJULfcPRz6
 BC2kHd8IHLS+L8yVro7KVEQeFuW5dz3BfoD8Rh9z9JuO8n+eugcYNUxWsST8KgLKMlLCg5
 n5i/+6js5dJmoyuRCjQTMP1PbcFnP2A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-cn6JhFkXNnmbYH2uII_9FA-1; Wed, 08 Feb 2023 17:07:46 -0500
X-MC-Unique: cn6JhFkXNnmbYH2uII_9FA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso56497wms.8
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMVLDa7WL4wVCBGtc5eUGVnT7CMRQqtQ/0eqVzvAIkY=;
 b=tjXdB3fV6TyTli5dwPzgbF+kElAkfE6mzIf20RcL0dDN9EDHr5Zhq43VcbOGZSsJMi
 UcHF8DCH98y+V4rmm6YEQKQTDbc5wDaQiqj16aELazaoFLbXz8fs5dUN3CimlDffIwXG
 9f/DGr4gZhKDJce2XTt0p9quIQyYHV0ckwaiaFhN05hI4xp0nAd4ABZkseU5n3HtXhwu
 sXxoj8ZdI+TFwJ8sZ/GhURcFt3+AZ2ohVpDmTEUB5eSTGF6jfjUcryHZaKl+tJgNVmlP
 iTEnx9JBPqpbna5fatCN0kIaZbvgZuJGSU0+s30ahJsLttPUOi5O8TCOrwOi6FsI8TDA
 KBWg==
X-Gm-Message-State: AO0yUKXo+/lxhvjuit8S+AyMYVKuDISAyvyWYODhXLW1IXKhR9WSKiYW
 cNpp/hrfOWtahrL+7DqCz95hnSkYKcF8JqYXAnP0OVLuC0MuVMzqAAPfCsq6MFOIHkRwBFd3V0+
 jJRR0HkduiPbI
X-Received: by 2002:adf:f60f:0:b0:2c3:dc62:e680 with SMTP id
 t15-20020adff60f000000b002c3dc62e680mr8081504wrp.30.1675894064813; 
 Wed, 08 Feb 2023 14:07:44 -0800 (PST)
X-Received: by 2002:adf:f60f:0:b0:2c3:dc62:e680 with SMTP id
 t15-20020adff60f000000b002c3dc62e680mr8081498wrp.30.1675894064571; 
 Wed, 08 Feb 2023 14:07:44 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d17-20020adff851000000b002c3dd82a0e9sm11699673wrq.91.2023.02.08.14.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 14:07:43 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  pbonzini@redhat.com,
 peter.maydell@linaro.org,  peterx@redhat.com,  david@redhat.com,
 philmd@linaro.org,  mst@redhat.com,  cohuck@redhat.com,
 dgilbert@redhat.com,  maz@kernel.org,  zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 4/8] kvm: Introduce secondary dirty bitmap
In-Reply-To: <20230206112010.99871-5-gshan@redhat.com> (Gavin Shan's message
 of "Mon, 6 Feb 2023 19:20:06 +0800")
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-5-gshan@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 23:07:42 +0100
Message-ID: <87k00r95g1.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J64QqYn8Qs1M

Gavin Shan <gshan@redhat.com> wrote:
> When dirty ring is enabled on ARM64, the backup bitmap may be used
> to track the dirty pages in no-running-vcpu situations. The original
> bitmap is the primary one, used for the dirty ring buffer. We need
> the secondary bitmap to collect the backup bitmap for ARM64.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  accel/kvm/kvm-all.c      | 50 ++++++++++++++++++++++++++++++----------
>  include/sysemu/kvm_int.h |  1 +
>  2 files changed, 39 insertions(+), 12 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 01a6a026af..1a93985574 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -553,13 +553,29 @@ static void kvm_log_stop(MemoryListener *listener,
>      }
>  }
>  
> +static unsigned long *kvm_slot_dirty_bitmap(KVMSlot *slot, bool primary)
> +{
> +    if (primary) {
> +        return slot->dirty_bmap;
> +    }
> +
> +    return slot->dirty_bmap +
> +           slot->dirty_bmap_size / sizeof(slot->dirty_bmap[0]);
> +}


Why?
Just use two bitmaps and call it a day.

Later, Juan.

