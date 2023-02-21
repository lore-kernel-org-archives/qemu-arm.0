Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3469856ejb;
        Tue, 21 Feb 2023 09:37:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/f02uS1LxmYgxt6P4xpjlzRobbnLWypssfqLFh/vJtZFV8GEhQTc6YUm0ly9nU1ObgG4SM
X-Received: by 2002:a05:622a:204:b0:3b9:b2c3:9d2e with SMTP id b4-20020a05622a020400b003b9b2c39d2emr23087070qtx.10.1677001042421;
        Tue, 21 Feb 2023 09:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677001042; cv=none;
        d=google.com; s=arc-20160816;
        b=hZ0IDpw3mlsj68+/awjgxxmy/aelVnuWPeVoho0pQ8Glb1E23YVrEyNKyGrEvYaU+a
         L5TkdVPeTCtFA3j8A39T+CG8rzl/TlXVmwJYX3moogWrZI0uIPyv9PddyKbpUmIChKpt
         9EQbi+fci7iznd/QJgi2nak3p8xB8hh173Gux5IZlP4M8csdHELCE0+fu7CbdAbnd55W
         b+EACd9vpJjZmJy5wmyKa8hFyoBS2UDwkh2Fm1zSOn0ViQJlVRB9sK+rBoTCVlMENRh4
         QGGULVaZKIH+6586P+WrRL1kzNdTl6vPxUjoA9oKRc3udPVz4tXLvdTt/gWNDsrn9KSu
         8XFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=oWgEA+NVopUn3YJ2t7V3m9n4NyH9jT8jIPspVdDe4Z4=;
        b=qayStDA8UQjIx83U8ZDm707lW//KI6+1oJ1DEGpP8LmWcynVo8EDAeu7pdeAapYTzH
         WOKYmtYAZVCFaq3yyiGRyE+ar7nNPlykeGoHsvovKqyEJCphP/PeC0Y60CDHDluPCtVv
         xCidKb6POL7DIpAEkKd0TUKAxkkz5NlmkxthdnANEj0onn0q0bjjou+XMmX+EJxI4blb
         0ZYpVxNU6gs67yUCR6y8zt46xHFXYjZGHkts263GdytldsdbLTx/e5VZ8Q4M8rIB7/vd
         6Auao5zmMBQzyDJiTwblfPTiOyT2sG33H4wKsymYjp7gZxsSOqhHTsgO4oPRhyaXPckH
         YmqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EckEW63U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t38-20020a05622a182600b003bcdf868947si12798025qtc.743.2023.02.21.09.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 09:37:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EckEW63U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWZl-0004KD-Vl; Tue, 21 Feb 2023 12:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUWZe-0004Is-84
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:37:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUWZa-0002gR-Tr
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677001022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oWgEA+NVopUn3YJ2t7V3m9n4NyH9jT8jIPspVdDe4Z4=;
 b=EckEW63UyXUxtHEhvTjtljUVUi0y2O57AqYEe5TFbnqrAeO+o0CQd7Hid0sSMzys90Zt8F
 cJrAAFJ2s2FSorbiAvs1gpUtS01IVGSj3HhznPQ6Hz/v1JmmOWB1jzKXpb8ZbCThcXDNMt
 G58MdQKKPjHg92Himuzhr8uuPcK76io=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-GW_8HdKfO9KNrhykgqsbeg-1; Tue, 21 Feb 2023 12:37:00 -0500
X-MC-Unique: GW_8HdKfO9KNrhykgqsbeg-1
Received: by mail-ua1-f71.google.com with SMTP id
 n1-20020ab06021000000b0068ba7b4e6edso2654749ual.23
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWgEA+NVopUn3YJ2t7V3m9n4NyH9jT8jIPspVdDe4Z4=;
 b=jXLEBiFpS1KakYMFfGs7qO5hHjXJ6ebYK11arvN3HxY3EoNEPa5X+yaruLcyC2UGTV
 csahWba+GSTyy8bU8drV1aCogGsH8RnKGTiN/M8VomZ9he46/GZQdUNaNlxpVKT/H5G3
 lKcfX2X4gIKSSOtQgUEi1UuWpMAW9XTWoEuDvwmGm9uLiNHRE/JbLZae+mk+5/7S1Ame
 JS8SbBIKKEhAu0RTYxnibHyDphQ2ssgqcDbBHuqTt3ze+rbnxpF2pJK/GAeF8cgV8t+W
 IkAZXpcpayeeTBacb0KPXsIpKKAYrVAcFrcgilXvxxQtvhqQtndadg0dKCsZis0L0xMN
 OmAw==
X-Gm-Message-State: AO0yUKVsXVLhNZuGZJIFWdIuPysMYoeOzUZDZiUGvronrhqWYNwI3tYH
 +dWbBm9ZYzEsl3/5sH3iW7IIRYuwzXNWCculufGHKLfBrFGb6BLrtB+QI02Kwq2/cB63TkoftxQ
 uUznk/p5JYXh4P94=
X-Received: by 2002:a1f:4588:0:b0:410:1410:ac75 with SMTP id
 s130-20020a1f4588000000b004101410ac75mr782786vka.0.1677001020068; 
 Tue, 21 Feb 2023 09:37:00 -0800 (PST)
X-Received: by 2002:a1f:4588:0:b0:410:1410:ac75 with SMTP id
 s130-20020a1f4588000000b004101410ac75mr782549vka.0.1677001014872; 
 Tue, 21 Feb 2023 09:36:54 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 v185-20020a3793c2000000b0073b9ccb171asm677167qkd.130.2023.02.21.09.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 09:36:54 -0800 (PST)
Date: Tue, 21 Feb 2023 12:36:53 -0500
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v1 2/6] migration: Add last stage indicator to global
 dirty log synchronization
Message-ID: <Y/UBNX7ljyTYLa6H@x1n>
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-3-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213003925.40158-3-gshan@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AfJ8KkhhVgo9

On Mon, Feb 13, 2023 at 08:39:21AM +0800, Gavin Shan wrote:
> The global dirty log synchronization is used when KVM and dirty ring
> are enabled. There is a particularity for ARM64 where the backup
> bitmap is used to track dirty pages in non-running-vcpu situations.
> It means the dirty ring works with the combination of ring buffer
> and backup bitmap. The dirty bits in the backup bitmap needs to
> collected in the last stage of live migration.
> 
> In order to identify the last stage of live migration and pass it
> down, an extra parameter is added to the relevant functions and
> callbacks. This last stage indicator isn't used until the dirty
> ring is enabled in the subsequent patches.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

One trivial thing to mention below.

> ---
>  accel/kvm/kvm-all.c   |  2 +-
>  include/exec/memory.h |  5 +++--
>  migration/dirtyrate.c |  4 ++--
>  migration/ram.c       | 20 ++++++++++----------
>  softmmu/memory.c      | 10 +++++-----
>  5 files changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 9b26582655..01a6a026af 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1554,7 +1554,7 @@ static void kvm_log_sync(MemoryListener *listener,
>      kvm_slots_unlock();
>  }
>  
> -static void kvm_log_sync_global(MemoryListener *l)
> +static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
>  {
>      KVMMemoryListener *kml = container_of(l, KVMMemoryListener, listener);
>      KVMState *s = kvm_state;
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 2e602a2fad..75b2fd9f48 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -929,8 +929,9 @@ struct MemoryListener {
>       * its @log_sync must be NULL.  Vice versa.
>       *
>       * @listener: The #MemoryListener.
> +     * @last_stage: The last stage to synchronize the log during migration

IMHO it may be important to mention the vcpu status here that the caller
guarantees to call the last_stage==true only once, only after all vcpus are
stopped (and vcpus will not be started again if migration succeeded).

>       */
> -    void (*log_sync_global)(MemoryListener *listener);
> +    void (*log_sync_global)(MemoryListener *listener, bool last_stage);

Thanks,

-- 
Peter Xu

