Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp554878njb;
        Wed, 10 Jul 2024 12:14:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+x6IyrDUz21paOm5t2bIwYNAx7GdjvzkOGpID+4Jzi0htheoAsNDfHX5qnZHAdYZT3SNi/9SqL223c92WhL3GRS1O7pqx
X-Google-Smtp-Source: AGHT+IG71e1Tyg9Cf+4gkKjFIccIjq9UP845XCAiJ+hmz9TS9bQOhnwpme1CxpwSWh6V9mB6pC50
X-Received: by 2002:a37:db01:0:b0:79d:7179:f906 with SMTP id af79cd13be357-79f19bfbcafmr667105285a.73.1720638874949;
        Wed, 10 Jul 2024 12:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720638874; cv=none;
        d=google.com; s=arc-20160816;
        b=MzkuaL6uuILg/3nb3eZHyWswpowNoWXd9e52lj5B6pJwJH2Iy0kpccl097FZXRpf8I
         WKBck+WvBlwoAB47Hrju5GM1yHdwzX+6CuzQJCAHfUj8zcuChSlsjiqgjzVOdpC8caMa
         L9LaHR+3l3GBGO1QqoruPdZ3nYD8WDCJzkZDgFw9fUE67Kfnt8PU4tybCFBsmyGlRySw
         Q9OBwryJhbla+qUbz2WW24HMUCPGBbZN5IQeGkxrycN2pMJp79E0K87ORDi6/j+xz4lu
         YO24rRn9a/N+Ta2fFvzKqyJq2slfekbAFJAfX600rbZ7cwExKMJAmlJhIhol8LPPdUgc
         qngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=REcJa6YCgxGB/y/bHQjtJSX7ZuGRFZubRUwpEegRYqA=;
        fh=fRZecxbHv1JxUPb/OHXVvzkxA5hojQJag+BRPqMR8is=;
        b=dpqywKrUl/qUzPwYFpudVkTpJbBO6IU9mlMWF6NotCTIiNJJRnug5T8QCu5AMpyb7E
         SuoVuvyJkS/abBLKnWfAgrQvfIU76Nz7pjaPo0ID99nd3ZX4zHbRO+bFJH96H/tbZCpo
         sgN//VxSYnHCxFt29MrnpxqvohXXsxOjzFykz0YVoHjbA2gE5uYvBeV+wuSnj+4ESj8g
         57oxYs399wLTc0ap08phT2CkADTi9V0ISC/rf/SJq1R3x0CdCUf4bO/P26xWqRQSpI2b
         yHWpyLKrlO7f66jH0FVm5LUKJS2Dcs5TsNoe38MVSQ0vd2vYI/nbTW4kuKSeOjjQDUNG
         8JWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lvwaxdkf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190a15bdsi528068285a.326.2024.07.10.12.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 12:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lvwaxdkf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRclO-0002YG-Nc; Wed, 10 Jul 2024 15:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRclM-0002VS-EO
 for qemu-devel@nongnu.org; Wed, 10 Jul 2024 15:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRclL-0007ly-1r
 for qemu-devel@nongnu.org; Wed, 10 Jul 2024 15:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720638837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=REcJa6YCgxGB/y/bHQjtJSX7ZuGRFZubRUwpEegRYqA=;
 b=Lvwaxdkf8MUp9b+IPNHFubXp9gx1xEORHeLZBDxfd374OI5z/OdAUDLnAlNa83azVcnBwH
 Ckz757lfD69Fz4kIJ3vw92w1cY0p30oqHVMj8ZR0zT97SLYF2pmJVpzy3qO2e+zDLYmqO9
 FbEDKVaSsn7sTczlxE85uS0yNzwnn/A=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-IwvxDQXJOyulJHnKRM5hXw-1; Wed, 10 Jul 2024 15:13:56 -0400
X-MC-Unique: IwvxDQXJOyulJHnKRM5hXw-1
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-4f3074208easo5910e0c.0
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2024 12:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720638835; x=1721243635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=REcJa6YCgxGB/y/bHQjtJSX7ZuGRFZubRUwpEegRYqA=;
 b=VVQU94Ocn6hV3+VAkHP0nx4hqY9xFuEOSMUv59ZHoAij2lb2RDWHdracHFP/uGlm3L
 E/lpMqfa8l8Q1pplfT9+jHuD6tEuT7WMQqQ6+pVnHawaX0jN3JJB/tyVKpKkWtc90Km7
 Vzj7Vw4fqipAShUZfZUSrUw7Xewcfj2HQPb2+lFCDwwcHs5bNRwFwn9LHz/mg0vjYyvM
 mETmv+H/PN653Y16w8709GOOTLgVAsdu09bPLTkLDVVQsuYfeG+yJ/XBxIK/fbuSN5rK
 v+bzf6hNt2PYRw4CyuF/winY3oHosatlVH1bEezlW0o7Zvy0ABIEdoTQJsjLXt3g3aqu
 adwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY7gjA0yVGz3pscjmWGIcad4icfCgeUZQPrGdAM1D9fLYiBzKqmwmyPuaQ4X0ZAvu12gW/bz+0Utv5NJXRxzIbxEGIj6U=
X-Gm-Message-State: AOJu0YyWsUmUDL93uV+Tqo+z+G6tYzCl/Rf6941bCbUnjz9O7iY4LlNc
 e/ug3GcpG2dck4bQobqCMvUzK5RSJUVVNmjGl8w3JrcY1iQZrmamJJ3A0Zil3vau+paeiBCxHZ2
 9Hs9eZ7j3SrnyvPr/RPW0/aCjkmAq26SRkqbP5BFEWmnqsMZj/EsD
X-Received: by 2002:a05:6122:14d:b0:4eb:152e:cf92 with SMTP id
 71dfb90a1353d-4f485113bc9mr447187e0c.0.1720638835455; 
 Wed, 10 Jul 2024 12:13:55 -0700 (PDT)
X-Received: by 2002:a05:6122:14d:b0:4eb:152e:cf92 with SMTP id
 71dfb90a1353d-4f485113bc9mr447158e0c.0.1720638835176; 
 Wed, 10 Jul 2024 12:13:55 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-447f9b26c9dsm22781421cf.14.2024.07.10.12.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 12:13:54 -0700 (PDT)
Date: Wed, 10 Jul 2024 15:13:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Bin Meng <bmeng.cn@gmail.com>,
 Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, devel@lists.libvirt.org,
 Luc Michel <luc.michel@amd.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on block
 drive (CMD56)
Message-ID: <Zo7dcF8OKfH92RlR@x1n>
References: <20240627162232.80428-1-philmd@linaro.org>
 <20240627162232.80428-7-philmd@linaro.org> <87cynmfggx.fsf@suse.de>
 <Zo2lLLAwcZ8bBvO2@x1n> <87a5ipfigb.fsf@suse.de>
 <Zo6iZjc8YpI1_9dW@x1n> <874j8xfc9s.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874j8xfc9s.fsf@suse.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /9pU1P8SBPeD

On Wed, Jul 10, 2024 at 01:21:51PM -0300, Fabiano Rosas wrote:
> It's not about trust, we simply don't support migrations other than
> n->n+1 and (maybe) n->n-1. So QEMU from 2016 is certainly not included.

Where does it come from?  I thought we suppport that..

The same question would be: are we requesting an OpenStack cluster to
always upgrade QEMU with +1 versions, otherwise migration will fail?

-- 
Peter Xu

