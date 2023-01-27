Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1221478ejc;
        Fri, 27 Jan 2023 07:02:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3sUHqjZjS48Jlosf7DLA3Ek36xDcvjI1A4SMVY2OAt1iLf18zLMW3b5tZwHeZJitaQnxG
X-Received: by 2002:ac8:110a:0:b0:3b6:3ab8:6396 with SMTP id c10-20020ac8110a000000b003b63ab86396mr53132259qtj.36.1674831757874;
        Fri, 27 Jan 2023 07:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674831757; cv=none;
        d=google.com; s=arc-20160816;
        b=NFfkVv58MJw4eEbRXlo/teeuqZ0aGN9L7LdOwD+AZ3nFy8UMTVLQ618NBJ0MWgTkuh
         +xN8ng8NPHWRgpIhbdKjk4NM5Kwa727hDTnz+jxFMLvvAzsZrN2DXIi5aT0zbrv2InBU
         umVfyeEoR9C0CKfc6foVRlkSRkaVGxL+uR2ixHDxiw8TURgZDM1r68nhF+gZ3xfyoqgv
         F7vTguOuJ5bj8PSd/fSYQUnN8un47U0hLHL91jT9nsz2UaDsM+GuNq1wYMq8oz29s/t4
         O/WQz//q++UUde2rHo0NyD60VtBCU+WjcZkl4zhCAG7++2aTNYPyYTU68+XoaoRRjiAC
         +g7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=BCAWQePqlmcUdEfpPWmFWDPQKTGxJINbp8IdMUJzeiY=;
        b=EP/hgFTREThS108eddeqf0nPSMtyD8zCn7va81Tv+83tVf+c0Vod/RzX4LIhERjz9r
         9YESUUJFpnHOaXzI7RKPlfangZdpsSxznScnYeWg4BvECtDWPmNhaHdn/8dlOvPoNFdf
         LfQwMtMIX/35HA8qdiKdMn370XAYAx6pHhG2NQPw10JwI+84q2Akmg54JwEnSAW/6OnL
         LoOfnENGyJdYSB0FLwsP8ucjIyLI5hHk5WVs5/G8PlfqZe+yTbr8cerbyMT+hijRhwL6
         ZkE5y0tnJqxnz4GYQd1qEMySAXugKiigRB3/4c5FmAWH1UHrVX6jE6423lm5DePGKn3e
         gsyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=deXJAZsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05622a190b00b003b6332010f7si2504688qtc.268.2023.01.27.07.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 07:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=deXJAZsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLQF4-0002RO-Vx; Fri, 27 Jan 2023 10:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLQF0-0002QZ-69
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 10:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLQEx-0004Id-Cl
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 10:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674831726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BCAWQePqlmcUdEfpPWmFWDPQKTGxJINbp8IdMUJzeiY=;
 b=deXJAZsI6OUDqVJywpy32GPOjvnu3KMW/AlVZl0609KVKVsWdwwqt7CMauSyjA637sQ60N
 GBywxRnH1KJUwZJbVVavQ4POIDr+bDqjGyn83nO344TSKgvmOJKcSxL49RbPuzox4gJLaB
 cHk0JLKlwesbw1xDFzu7AMh4illsRL8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-yYsH962XP4KMCzust1Yt0Q-1; Fri, 27 Jan 2023 10:02:00 -0500
X-MC-Unique: yYsH962XP4KMCzust1Yt0Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 bp18-20020a056512159200b004b59c4fb76bso2187336lfb.2
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 07:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCAWQePqlmcUdEfpPWmFWDPQKTGxJINbp8IdMUJzeiY=;
 b=qLKtRsxbnNfYQXQpzlgoDuMWjao+l3FtPGaNBUT7fZNlM0biCiXw8RtBsO/OLFDk1D
 llHPrI4iVuC8vGS3DmAFyZgYt89JErvorzNC2mtJ3/HOUGFUme5++obTV8I3xXYu8wq8
 cgM7k4/bjYyg1A70Nd2Ra1IfPx0/0Ym8UMsme/BA56VtiIT+pLTzeYBwPiDjgAy4LYm8
 7GCaE9xpjaAvK5nfcf9MgcIPqJSc10euZLm2j2LqCp6M06JoRWipvrJV1XAV8gdMjHkx
 uSfiGf+nIG+S+5BxKNd6VS8cx+JI1JGZ/2tNHdYMZ3LSpnR+4pleNvXrLakDtCz9asry
 ClBQ==
X-Gm-Message-State: AO0yUKUXW7YhGkHdjISHMUTsYV2lW8H6z4K6y/f0VD3OL1mkQaap9Yd7
 9uGRFpUYn2zzh/w96KFjdv8juaLhgmw8Fx52igiB+RSK0LFw3xpaZfUP5dsDxzPLbP4ZojCW8e+
 PzFOF6ibJWBb0
X-Received: by 2002:a2e:a4b6:0:b0:28f:8fa4:7c25 with SMTP id
 g22-20020a2ea4b6000000b0028f8fa47c25mr1203847ljm.25.1674831718788; 
 Fri, 27 Jan 2023 07:01:58 -0800 (PST)
X-Received: by 2002:a2e:a4b6:0:b0:28f:8fa4:7c25 with SMTP id
 g22-20020a2ea4b6000000b0028f8fa47c25mr1203715ljm.25.1674831717017; 
 Fri, 27 Jan 2023 07:01:57 -0800 (PST)
Received: from redhat.com ([2.52.137.69]) by smtp.gmail.com with ESMTPSA id
 cm20-20020a170907939400b00871cb1b8f63sm2370175ejc.26.2023.01.27.07.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:01:56 -0800 (PST)
Date: Fri, 27 Jan 2023 10:01:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 kevans@freebsd.org, berrange@redhat.com, groug@kaod.org,
 qemu_oss@crudebyte.com, philmd@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
Message-ID: <20230127100052-mutt-send-email-mst@kernel.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BzfhTGLu1U3c

On Fri, Jan 27, 2023 at 02:54:30PM +0000, Peter Maydell wrote:
> On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Also, why didn't you move sys/resource.h and other such files
> > to os-dep.h? I'm struggling to understand the rules around what
> > is or isn't included where?
> 
> The rough rule of thumb is that if some OS needs a compatibility
> fixup or workaround for a system header (eg not every mmap.h
> defines MAP_ANONYMOUS; on Windows unistd.h has to come before
> time.h) then we put that header include and the compat workaround
> into osdep.h. This avoids "only fails on obscure platform" issues
> where somebody puts a header include into some specific .c file
> but not the compat workaround, and it works on the Linux host
> that most people develop and test on and we only find the
> problem later.
> 
> There's also no doubt some includes there for historical
> reasons, and some which really are "everybody needs these"
> convenience ones. But we should probably not add new
> includes to osdep.h unless they fall into the "working around
> system header issues" bucket.
> 
> thanks
> -- PMM


BTW maybe we should teach checkpatch about that rule:
if a header is in osdep do not include it directly.

-- 
MST

