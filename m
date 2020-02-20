Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp725208lfg;
        Thu, 20 Feb 2020 08:01:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqzrtEfEetQzg8Re4Cl5y329GTPY4crmbPezQi7bqOhLPssEWqO+w1lAm248/hLI9KBksHvB
X-Received: by 2002:a05:620a:22e:: with SMTP id u14mr12593883qkm.278.1582214495319;
        Thu, 20 Feb 2020 08:01:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582214495; cv=none;
        d=google.com; s=arc-20160816;
        b=v7OlCty7nVlIHPBSxtiFZurN25YjMog5SuUbxZBaVRl1YKlptswn1M8DoBNd89uBtz
         Tc3Rl7CIKgwuhppbE0f6paXAFbobc+NXdR+6xmBHtlQv5cCM79q+9CpCYf45Ecg4oE7M
         dXxUcx3bFy+DUWwTHQN3OSs4prEr3B+rh2Jl4e+jD+YBdYjy1n25NH0m1lSvr4DZL0am
         dEHnwajl7w2qVbgXUb4gRm04sXHBXiKB+Sg9pbv8QipNHGKYNh3fX52szbmbYGWro/5/
         RyDSqsPbgjof86nPFUZBp7hAxsXGliyvpthE1TptW4UJXn9joh9a9b9iXqj+s1eEHmvt
         jzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=hA16nPl+49HiOdFBPnY9n1Whv8KJgMTlRcxocdVI9FI=;
        b=HM/QH/f14Ai5UTwMLSskmuG7YzyByyzo/M5umpj+hzEOQ9ILse5HTYSSaPKRdRHutj
         vt6RYmJ5gToKyW3RRJgkbnX/nt1jQFVUVRhFG7kNRJIZgJ10z4GPa21OAMvPdToeC7r3
         Xs/tDQTBzfLibZLtyFKo7V6n4U9o7DJyZOcLcAFX2nF/kfklUiSjUm6S4g01MMEKpkut
         9XqdmxCpHRrDaGrk0bkXLGpLd1Ek9t17nzELjUJE9hux/M39lBtTQ4a+dM/y8VNmEEo8
         W+de6AiSI1sUKKXlpxzWi5erwXEuDN+dT+8A6/WIhFBbc0hsBIGA/a3rvX1DYjv5Q8jM
         Sqhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AFwnhmHe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si1668173qtn.148.2020.02.20.08.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 08:01:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AFwnhmHe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4oGc-0000dn-Nx
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 11:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1j4oGQ-0000Wq-OP
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 11:01:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1j4oGN-00013i-Uq
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 11:01:21 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37618
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1j4oGN-00012w-R4
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 11:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582214479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hA16nPl+49HiOdFBPnY9n1Whv8KJgMTlRcxocdVI9FI=;
 b=AFwnhmHerN5BhIgsXvSBSGFskaCbQ6+z4+sx0iQkOjh0Nokz94+Spp5KyRpYVmGUwjZgBq
 u9N3d6uTzaP+ahp5jB32s2uMNDmOJdIkGJTyrSLdIvI4RpoQ2CiKom94YG+VCChANGdUZJ
 7oWNHZkh/S3Pf1S+FQG3xL9gZTC1Bb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-bMJMWJydN02WqKkr9H_uoQ-1; Thu, 20 Feb 2020 11:01:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26FF1005510;
 Thu, 20 Feb 2020 16:01:06 +0000 (UTC)
Received: from gondolin (ovpn-205-37.brq.redhat.com [10.40.205.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D79287B0A;
 Thu, 20 Feb 2020 16:01:02 +0000 (UTC)
Date: Thu, 20 Feb 2020 16:59:50 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: <pannengyuan@huawei.com>
Subject: Re: [PATCH v2 1/2] s390x: fix memleaks in cpu_finalize
Message-ID: <20200220165950.3a5ec74a.cohuck@redhat.com>
In-Reply-To: <20200217032127.46508-2-pannengyuan@huawei.com>
References: <20200217032127.46508-1-pannengyuan@huawei.com>
 <20200217032127.46508-2-pannengyuan@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: bMJMWJydN02WqKkr9H_uoQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 alistair@alistair23.me, qemu-devel@nongnu.org,
 mav2-rk.cave-ayland@ilande.co.uk, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 euler.robot@huawei.com, Richard Henderson <rth@twiddle.net>, balrogg@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lzyL2H5ITw9F

On Mon, 17 Feb 2020 11:21:26 +0800
<pannengyuan@huawei.com> wrote:

> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> This patch fix memleaks when we call tests/qtest/cpu-plug-test on s390x. The leak stack is as follow:
> 
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0x7fb43c7cd970 in __interceptor_calloc (/lib64/libasan.so.5+0xef970)
>     #1 0x7fb43be2149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>     #2 0x558ba96da716 in timer_new_full /mnt/sdb/qemu-new/qemu/include/qemu/timer.h:530
>     #3 0x558ba96da716 in timer_new /mnt/sdb/qemu-new/qemu/include/qemu/timer.h:551
>     #4 0x558ba96da716 in timer_new_ns /mnt/sdb/qemu-new/qemu/include/qemu/timer.h:569
>     #5 0x558ba96da716 in s390_cpu_initfn /mnt/sdb/qemu-new/qemu/target/s390x/cpu.c:285
>     #6 0x558ba9c969ab in object_init_with_type /mnt/sdb/qemu-new/qemu/qom/object.c:372
>     #7 0x558ba9c9eb5f in object_initialize_with_type /mnt/sdb/qemu-new/qemu/qom/object.c:516
>     #8 0x558ba9c9f053 in object_new_with_type /mnt/sdb/qemu-new/qemu/qom/object.c:684
>     #9 0x558ba967ede6 in s390x_new_cpu /mnt/sdb/qemu-new/qemu/hw/s390x/s390-virtio-ccw.c:64
>     #10 0x558ba99764b3 in hmp_cpu_add /mnt/sdb/qemu-new/qemu/hw/core/machine-hmp-cmds.c:57
>     #11 0x558ba9b1c27f in handle_hmp_command /mnt/sdb/qemu-new/qemu/monitor/hmp.c:1082
>     #12 0x558ba96c1b02 in qmp_human_monitor_command /mnt/sdb/qemu-new/qemu/monitor/misc.c:142
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Cornelia Huck <cohuck@redhat.com>
> ---
> Changes v2 to v1:
> - Similarly to other cleanups, move timer_new into realize, then do
> timer_del in unrealize.
> ---
>  target/s390x/cpu.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index cf84d307c6..f18dbc6fe4 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -170,7 +170,12 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
>      S390CPUClass *scc = S390_CPU_GET_CLASS(dev);
>  #if !defined(CONFIG_USER_ONLY)
>      S390CPU *cpu = S390_CPU(dev);
> +    cpu->env.tod_timer =
> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
> +    cpu->env.cpu_timer =
> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);

I may be missing something, but what cleans up the timers if we fail
further down in this function? I don't think the unrealize callback is
invoked by the core in case of error?

Also, as a matter of personal preference, I think it would be better to
initialize the timers in the !CONFIG_USER_ONLY section further below,
rather than in the variable declaration section.

>  #endif
> +
>      Error *err = NULL;
>  
>      /* the model has to be realized before qemu_init_vcpu() due to kvm */

