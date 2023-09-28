Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2391377ejc;
        Thu, 28 Sep 2023 01:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwNqxa3wwRpuGRodulnovYHD56DOwqHnspbvZHtjHnHJeVlWQsxBRZobLthlIIHTrTuD0x
X-Received: by 2002:a05:622a:190c:b0:419:5775:7d6a with SMTP id w12-20020a05622a190c00b0041957757d6amr600357qtc.16.1695888786254;
        Thu, 28 Sep 2023 01:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695888786; cv=none;
        d=google.com; s=arc-20160816;
        b=vOEUlyz10ke5G7+mGqTygGCazv8hFgJBPvlzfPSMrMaRnpYy9dR9GrApegxKmAgiHw
         ScuGA56DfkBDG3kO4vPrVFOx4Pq5DCTVZi5w/D6/KxvFllJiDePWQ3d6hbW5H8v5SbPN
         kVJb8tzzoVtvYHrp1hYXyl3ZdOeuDDcvDZoHmiU5IH50VzhNs3JMaFd/7z5mm676ehj+
         dT500SpIsxyTEZUD3BdozzFC+zH0AIrSyvj80ZU9+rWpi1B/neQWyzyH2G7mmEwt49rq
         exlijNBcAX2lCq3yqTPTFOJfS6+1J/77vHTsRGFHW8zJUVN4mXRDQ5sgp0e7Dq6zyOcG
         by7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=5sRIT6ZkOBMatFiLU5DeSl70YS56xdp2SI1ypObMXUM=;
        fh=K02axmRdaQYNmkDwB2VWWLhM6tIDc/mufbs6bnM7bto=;
        b=OxfIlJv7ix4mICmazpb57yhzWk2BQIg+X6oDv4BYn49rfx8rB9YkIe1ovrtbM/uBzl
         Kx/cINwhr9MirQ6FPrGM7qfsCXncfFOyCaDKZuj+z+QmT3eF+uamsf9HdRTfRZwH24PG
         0iYQVOPzP/WHnL6kzfL3qlR8D8V4yQou8VHATUNi4dX1HZ2cZ1CNNp6242Ap4P5IFe5r
         41mRpfhDVc3nGwRNsSwV5ONXo6P5WD2ay5fASYlXQ+evSi+zdHJDJyJQ2a/Wxz2/0FeW
         Zh4ztPH/NS03hDY3sdLm8vrTTkXIFlMd+u5Lq56Rzu2HVY3ZZgoJfI846RDAA40HpSUd
         W/5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IPJ8UbUG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020ac85bc8000000b0041972bc1dd8si79664qtb.93.2023.09.28.01.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 01:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IPJ8UbUG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlm8g-0005JH-Lz; Thu, 28 Sep 2023 04:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qlm8U-0005G9-Iv
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 04:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qlm8L-0008J3-HM
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 04:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695888747;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5sRIT6ZkOBMatFiLU5DeSl70YS56xdp2SI1ypObMXUM=;
 b=IPJ8UbUGLR2eCjH9mpTWzAuEdZIfPnnXTDPZI6pxnuIelZWHsqG/8D9d90bEmMFrVrcj/D
 qXvTj6I1n7th+JwHA9x5tmPwxbIyuqNnODHIBs4ZBmG4cDS+SPfPqXFcRF+57jAmK9Y78u
 DpediLjE2/2VWe0dofbV0f/0asz7zQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-RHe4dsu0OPabLVC2ghQxRA-1; Thu, 28 Sep 2023 04:12:23 -0400
X-MC-Unique: RHe4dsu0OPabLVC2ghQxRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 059888039CB;
 Thu, 28 Sep 2023 08:12:23 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58839492C37;
 Thu, 28 Sep 2023 08:12:20 +0000 (UTC)
Date: Thu, 28 Sep 2023 09:12:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 0/6] python/machine: use socketpair() for console socket
Message-ID: <ZRU1YoV0ndInO5Wb@redhat.com>
References: <20230928044943.849073-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230928044943.849073-1-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vW12LOfVxBzv

On Thu, Sep 28, 2023 at 12:49:37AM -0400, John Snow wrote:
> Like we did for the QMP socket, use socketpair() for the console socket
> so that hopefully there isn't a race condition during early boot where
> data might get dropped on the floor.
> 
> May or may not help with various race conditions where early console
> output is not showing up in the logs and/or potentially being missed by
> wait_for_console_pattern.
> 
> V3:
>   - Rebased.

V3 has R-B on every single patch already. Should this
just have been a PULL instead ?

> 
> V2:
>   - Fixed some Socket ownership/garbage collection problems
>   - Fixed callers of now-dropped VM arguments/properties
>   - added a dedicated sock_fd arg to ConsoleSocket()
>   - now using socketpair() for qtest console, too.
>   - dropped sock_dir arg from *all* machine.py classes
>   - Tested quite a bit more thoroughly ...
> 
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/1019123030
> 
> John Snow (6):
>   python/machine: move socket setup out of _base_args property
>   python/machine: close sock_pair in cleanup path
>   python/console_socket: accept existing FD in initializer
>   python/machine: use socketpair() for console connections
>   python/machine: use socketpair() for qtest connection
>   python/machine: remove unused sock_dir argument
> 
>  python/qemu/machine/console_socket.py      | 29 ++++++++---
>  python/qemu/machine/machine.py             | 58 +++++++++++++---------
>  python/qemu/machine/qtest.py               | 54 +++++++++++++++-----
>  tests/avocado/acpi-bits.py                 |  5 +-
>  tests/avocado/avocado_qemu/__init__.py     |  2 +-
>  tests/avocado/machine_aspeed.py            |  5 +-
>  tests/qemu-iotests/iotests.py              |  2 +-
>  tests/qemu-iotests/tests/copy-before-write |  3 +-
>  8 files changed, 104 insertions(+), 54 deletions(-)
> 
> -- 
> 2.41.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

