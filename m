Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1694073lfi;
        Thu, 2 Apr 2020 01:47:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypIiQgRzp3Gotv+sPj0VpsySNi4TrrOzrtZv2ZazqJRhMfO260f/1pYVl8F+w4uWfejLIVUj
X-Received: by 2002:a05:620a:69b:: with SMTP id f27mr2415072qkh.285.1585817242800;
        Thu, 02 Apr 2020 01:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585817242; cv=none;
        d=google.com; s=arc-20160816;
        b=h4wkgafNMYOylFD5GvQOq6eHHIpOZ00RI74irJd0cFaeafxei0aohcjJbSuV9WzJcW
         HAY3aBobm2KNWlIXxdGdodgjwk4laXcch+DdTKaUeSfTcLF1nQw/BpDsDko6Vd29jWy7
         bFYfGROrZwRuM33/2xjDsTU53UIgl5HB5qv/8hGZajIRl42YJdLGef37PtdVnz7YLVmS
         IZgFe67boEpsAsV+KhEnak77IrwUKRrq3l6HWOrvBr+FIM6pJm1ZbHIKxe9LvdAQg1KV
         O9OgR9ghFtjrkbiqY0Ess+o3301iabxOVy+pi9xre0YgXuAZHwv9/DIrS6aaLQCrCRTv
         zeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lj30UAt8X7wWPT0eCo7ZWeFtSAuq0vDSwO2ZWdmBTpk=;
        b=IofCFqV/3qesdVxT8CYSGyLYVFjWwxmFYE+6VOFtuJXscFJWU85LCxmTaiuPM/1LtI
         23AEupubKmfSN+pFQ6Zb4FklCYkU6klNuV7Mdr7cchzMHZMFSEJmDjVg33kW0eZNWZSm
         w8aV5ulEcLsowUXhviJ8/hikC6jDr4xEZ5Gn0HUdLam8feMgJ1PSwU60zOgIcrYmVtSF
         4DARfPQWXP54YZOso33q8jCiUNsNrYV6WolABTpNLxGkDCqwHQzSyOd6bQfZ3CsT8dR5
         dDNMfEGWcqWgKl883oI5JYNtoGe4JvgytDlNtzTEbA+istZRp/5UCbe2TLDPZxw6Ms2A
         Bmdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eXNkAYMT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si3099110qtn.120.2020.04.02.01.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 01:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eXNkAYMT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJvVS-000111-8B
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 04:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jJvVK-0000zJ-80
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 04:47:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jJvVJ-0005Q9-8H
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 04:47:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48046
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jJvVJ-0005PY-44
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 04:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585817232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lj30UAt8X7wWPT0eCo7ZWeFtSAuq0vDSwO2ZWdmBTpk=;
 b=eXNkAYMTg1d14p4p8XmqOM+4Kk3EtG18avTGwyWzWwPPKo1UdWCLDXFYBkbQYr3Jnp5Kzh
 zbNwv7k4+CT7TKbNflHuee4Tp9ZRtdxGF/HpbxI56C6OjH5saOVDm44tn0Bek++41SXK4V
 8EtsSM0upmwyi4Nt9y3rpFMt/VNnOQM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-eGXPWPdtNdKD34Hriq-Pvw-1; Thu, 02 Apr 2020 04:47:11 -0400
X-MC-Unique: eGXPWPdtNdKD34Hriq-Pvw-1
Received: by mail-wm1-f70.google.com with SMTP id w8so1097676wmk.5
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2020 01:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lj30UAt8X7wWPT0eCo7ZWeFtSAuq0vDSwO2ZWdmBTpk=;
 b=tUru0E2bAyvzP4v/4MQLUYcVO+KDyG1T9brsrohwrNntqgtih9nw3ZcT6OU5nj6hAw
 WVvaAoC1/YR3rupGsBAgmrMIeGkBHBHouphkcke9mBHlHxdxtDPw7iuMWBi9KOE/kNxH
 yOdq+T7D9MKSH3cLmA18o1e7stAn7esLbUyfXsO7BUA9l/sfur0Nu8oFZgpWMbQnMhQc
 SZqCHO26G2CHdNwU9ASJOScNFkPdyg62hYwa77Kux3xOX3/AG2p8zTq0IrJ7HJryxSff
 LpXVbH7xv4igwaO9VSJSneBhk0GzoegVacvgZ1TG5maAhRsukdJoYSbFXDfdBXqP2neC
 BX9w==
X-Gm-Message-State: AGi0PuYQQKdWc0eaY+xcXNzPZuZs/CQmMpGZ3TEdfOfS1br/MYCZ68vf
 xwPYVkNKdlza84loYckb7ndAABAmLglkQncxv9ZC6LB18MFbe5kV3Dh78gZ/++txNzgA/1OBy+Q
 KoJMiyCaP160J
X-Received: by 2002:adf:800e:: with SMTP id 14mr2251245wrk.369.1585817230138; 
 Thu, 02 Apr 2020 01:47:10 -0700 (PDT)
X-Received: by 2002:adf:800e:: with SMTP id 14mr2251222wrk.369.1585817229828; 
 Thu, 02 Apr 2020 01:47:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1868:42dd:216c:2c09?
 ([2001:b07:6468:f312:1868:42dd:216c:2c09])
 by smtp.gmail.com with ESMTPSA id z12sm6722573wrt.27.2020.04.02.01.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 01:47:09 -0700 (PDT)
Subject: Re: [PATCH v2] util/async: Add memory barrier to aio_ctx_prepare
To: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200402024431.1629-1-fangying1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2f8406fa-ae18-856b-938f-a804ff1b11c7@redhat.com>
Date: Thu, 2 Apr 2020 10:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200402024431.1629-1-fangying1@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: fam@euphon.net, wu.wubin@huawei.com, qemu-stable@nongnu.org,
 stefanha@redhat.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pVHcnuXZ5Itm

On 02/04/20 04:44, Ying Fang wrote:
> Normal VM runtime is not affected by this hang since there is always some
> timer timeout or subsequent io worker come and notify the main thead.
> To fix this problem, a memory barrier is added to aio_ctx_prepare and
> it is proved to have the hang fixed in our test.

Hi Ying Fang,

this part of the patch is correct, but I am not sure if a memory barrier
is needed in aio_poll too.

In addition, the memory barrier is quite slow on x86 and not needed there.

I am sorry for dropping the ball on this bug; I had a patch using
relaxed atomics (atomic_set/atomic_read) but I never submitted it
because I had placed it in a larger series.  Let me post it now.

Thanks,

Paolo

> 
> diff --git a/util/async.c b/util/async.c
> index b94518b..89a4f3e 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -250,7 +250,8 @@ aio_ctx_prepare(GSource *source, gint    *timeout)
>      AioContext *ctx = (AioContext *) source;
>  
>      atomic_or(&ctx->notify_me, 1);
> -
> +    /* Make sure notify_me is set before aio_compute_timeout */
> +    smp_mb();
>      /* We assume there is no timeout already supplied */
>      *timeout = qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));
>  
> 

