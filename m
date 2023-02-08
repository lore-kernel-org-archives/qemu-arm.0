Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp56281ejb;
        Wed, 8 Feb 2023 14:12:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9Z9+Kg2ledo+OEv2k9dBfmNLKpHrXFAwonWCz+dallEOtcJ1gSiYuJ6ss3VSOxmHHHpX97
X-Received: by 2002:ac8:5902:0:b0:3b8:6d67:c178 with SMTP id 2-20020ac85902000000b003b86d67c178mr16697911qty.3.1675894356035;
        Wed, 08 Feb 2023 14:12:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675894356; cv=none;
        d=google.com; s=arc-20160816;
        b=RCM945yDEv8hrUPzg9nbiWacpk6AVfatEYaYNA5aRzlSmNBd8xNcHTjPl3fOyUZWJS
         2FZu++ZXfRB1uXPyJLjdVSxwjQtOW7OkRK6zuDUW5Y03hwZQH8jAfJS8dvptm+oMYSEP
         juKD/OuF/xEhvAZPGBYmlt48yHMV5dchffYvLcz655ajNCa8hjZ4e8AVAs4/dsMGvpaq
         VJruzSVDrVqU0TcihT86wODeVfzP3arTQbtlsNDbu3WGjcBrS9GsvVoZMwhf+/f6BfTd
         GDwFtk6fly9SdTN3qXlkt9/mFBKY82T4NgkjO8fiEn0wdHfprTav8t27v9bDYWMLJCYS
         zWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=VtncLkVhV3SIC8Nz+x9ocZVQvWlPQiZzKxUZvG1SMgY=;
        b=0YgNOWM2hsCY3jGO1H+alLMUBQ4Q+WyvSTlcGOYUrpdjqhRdDDG2bjzdFekBGRDPQ8
         IBxtUjblvy9oS2tXZBht3DZK/jleMHVJOBfWtpQvVzPSzCtbzSqEdz+ybYOx9uwIsGnf
         c9s3Y2/juJEgEALZg6K6ykgpd6M2f/B82M+mDfF175TDNq1yOJlC3MzBgsFUYoTCZeWd
         xNzgAQ0i7dTfZ5PSunRozNRV1rcD7wX1DAJIkzsZ14P4S9dz7SVzxDEC78ehAWN9eQWO
         dSlT1gaQexyNAcC2hKz55u6a8UlZYMP9u6HfJ/fgdU8u7KO602NQfo/fB8zodrc5/i3y
         JdiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AjUYCylE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac86153000000b003b84b3471besi70678qtm.1.2023.02.08.14.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:12:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AjUYCylE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPsfa-000642-2H; Wed, 08 Feb 2023 17:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsfY-00063j-Il
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsfW-0002Oq-O2
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675894318;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VtncLkVhV3SIC8Nz+x9ocZVQvWlPQiZzKxUZvG1SMgY=;
 b=AjUYCylEdiD4q5ZCw+pkkcR+hJyNanAm9BEIbhO1do98qA0Ium1fqWFvYuQ4VpC2iC9XRU
 QpArTSR2u2hbVXDjWWrUC7zeb6BCmtrWmN1VQ+DROIexFxNV8bg/h7798RILkYj6Lw2tWc
 oL8LtfpAhqmaIMtwSB+vCI9GdP4NKxk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-323-koOtBNCRO9-xSdliS-OT1g-1; Wed, 08 Feb 2023 17:11:57 -0500
X-MC-Unique: koOtBNCRO9-xSdliS-OT1g-1
Received: by mail-wr1-f71.google.com with SMTP id
 t20-20020adfba54000000b002be0eb97f4fso3253466wrg.8
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VtncLkVhV3SIC8Nz+x9ocZVQvWlPQiZzKxUZvG1SMgY=;
 b=A/4YimT4PkhoDu3QzraloO7OYgB3hkh/sUsj4duHfMPyIMgTiNtPAnXUb89Jzjt/Al
 DZYb+7KnU0YuIonZyxJtoIxdQ9NEjBOiZVxFHPbqE1lRK9iaEoBBJeICunbsjKmZZCGC
 R/RpksPTCaaxE7FoVP00sfzjKNWUwyVMBEgu/6BI43TG3R0tbTRuSkCMmmQC6RzzW5HC
 8FdbqeaWPQGeQczHoFaGLtTNrppSsyD2I86PChScaab6TpJx48GGcD55aLM/nW51p2MI
 x08bB42OIuOjh/j3kFgESY3MeqKp861LrkV9o/zh/VDIQG9bKmFuwl0tg8mZCHm2gOhh
 IfEw==
X-Gm-Message-State: AO0yUKV7Pqcg6UwpRq7xE+5CQ2FT8pq0eBZxZiwW/0RPgJn4ZoBDSVi7
 HBXHHXUO1AxYK6tmmN0sq/+nVVzXy0ZZqxHos3/6qRslb56E3yazZ+JAQJCUwH8zsTlVl8XB5bO
 Lfu4FD9BhmMkF
X-Received: by 2002:a05:600c:511e:b0:3df:9858:c038 with SMTP id
 o30-20020a05600c511e00b003df9858c038mr3550024wms.13.1675894315595; 
 Wed, 08 Feb 2023 14:11:55 -0800 (PST)
X-Received: by 2002:a05:600c:511e:b0:3df:9858:c038 with SMTP id
 o30-20020a05600c511e00b003df9858c038mr3549994wms.13.1675894315173; 
 Wed, 08 Feb 2023 14:11:55 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 b9-20020adfe649000000b002c408c96f3fsm124619wrn.84.2023.02.08.14.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 14:11:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  pbonzini@redhat.com,
 peter.maydell@linaro.org,  peterx@redhat.com,  david@redhat.com,
 philmd@linaro.org,  mst@redhat.com,  cohuck@redhat.com,
 dgilbert@redhat.com,  maz@kernel.org,  zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 6/8] kvm: Add helper kvm_dirty_ring_init()
In-Reply-To: <20230206112010.99871-7-gshan@redhat.com> (Gavin Shan's message
 of "Mon, 6 Feb 2023 19:20:08 +0800")
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-7-gshan@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 23:11:53 +0100
Message-ID: <87bkm39592.fsf@secure.mitica>
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
X-TUID: rpP+PlcMFimE

Gavin Shan <gshan@redhat.com> wrote:
> Due to multiple capabilities associated with the dirty ring for different
> architectures: KVM_CAP_DIRTY_{LOG_RING, LOG_RING_ACQ_REL} for x86 and
> arm64 separately. There will be more to be done in order to support the
> dirty ring for arm64.
>
> Lets add helper kvm_dirty_ring_init() to enable the dirty ring. With this,
> the code looks a bit clean.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 73 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 46 insertions(+), 27 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 9ec117c441..399ef0f7e6 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1476,6 +1476,49 @@ static int kvm_dirty_ring_reaper_init(KVMState *s)
>      return 0;
>  }
>  
> +static int kvm_dirty_ring_init(KVMState *s)
> +{
> +    uint64_t ring_bytes;
> +    int ret;
> +
> +    /*
> +     * Read the max supported pages. Fall back to dirty logging mode
> +     * if the dirty ring isn't supported.
> +     */
> +    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
> +    if (ret <= 0) {
> +        warn_report("KVM dirty ring not available, using bitmap method");
> +        s->kvm_dirty_ring_size = 0;
> +        return 0;
> +    }
> +
> +    ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
> +    if (ring_bytes > ret) {
> +        error_report("KVM dirty ring size %" PRIu32 " too big "
> +                     "(maximum is %ld).  Please use a smaller value.",
> +                     s->kvm_dirty_ring_size,
> +                     (long)ret / sizeof(struct kvm_dirty_gfn));
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +
> +    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
> +    if (ret) {
> +        error_report("Enabling of KVM dirty ring failed: %s. "
> +                     "Suggested minimum value is 1024.", strerror(-ret));
> +        ret = -EIO;
> +    }
> +
> +out:
> +    if (ret) {
> +        s->kvm_dirty_ring_size = 0;
> +    } else {
> +        s->kvm_dirty_ring_bytes = ring_bytes;
> +    }
> +
> +    return ret;
> +}

If you split it, you don't need the goto.

static int kvm_dirty_ring_init(KVMState *s)
{
    s->kvm_dirty_ring_size = 0;
    /*
     * Read the max supported pages. Fall back to dirty logging mode
     * if the dirty ring isn't supported.
     */
    int ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
    if (ret <= 0) {
        warn_report("KVM dirty ring not available, using bitmap method");
        return 0;
    }

    uint64_t ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
    if (ring_bytes > ret) {
        error_report("KVM dirty ring size %" PRIu32 " too big "
                     "(maximum is %ld).  Please use a smaller value.",
                     s->kvm_dirty_ring_size,
                     (long)ret / sizeof(struct kvm_dirty_gfn));
        return -EINVAL;
    }

    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
    if (ret) {
        error_report("Enabling of KVM dirty ring failed: %s. "
                     "Suggested minimum value is 1024.", strerror(-ret));
        return -EIO;
    }

    s->kvm_dirty_ring_bytes = ring_bytes;
    return ret;
}



> +
>  static void kvm_region_add(MemoryListener *listener,
>                             MemoryRegionSection *section)
>  {
> @@ -2545,33 +2588,9 @@ static int kvm_init(MachineState *ms)
>       * dirty logging mode
>       */
>      if (s->kvm_dirty_ring_size > 0) {
> -        uint64_t ring_bytes;
> -
> -        ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
> -
> -        /* Read the max supported pages */
> -        ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
> -        if (ret > 0) {
> -            if (ring_bytes > ret) {
> -                error_report("KVM dirty ring size %" PRIu32 " too big "
> -                             "(maximum is %ld).  Please use a smaller value.",
> -                             s->kvm_dirty_ring_size,
> -                             (long)ret / sizeof(struct kvm_dirty_gfn));
> -                ret = -EINVAL;
> -                goto err;
> -            }
> -
> -            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
> -            if (ret) {
> -                error_report("Enabling of KVM dirty ring failed: %s. "
> -                             "Suggested minimum value is 1024.", strerror(-ret));
> -                goto err;
> -            }
> -
> -            s->kvm_dirty_ring_bytes = ring_bytes;
> -         } else {
> -             warn_report("KVM dirty ring not available, using bitmap method");
> -             s->kvm_dirty_ring_size = 0;
> +        ret = kvm_dirty_ring_init(s);
> +        if (ret < 0) {
> +            goto err;
>          }
>      }

