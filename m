Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp179780ejf;
        Sat, 28 Jan 2023 02:30:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/7reFnShRVGA2ruUacoZJYk2Z0rMZJjsjAW8m4d/Xylyu2nJ/fw8/gd4LjaqyRZUoPwm1h
X-Received: by 2002:a05:6214:da2:b0:537:65bb:b273 with SMTP id h2-20020a0562140da200b0053765bbb273mr36491122qvh.44.1674901833111;
        Sat, 28 Jan 2023 02:30:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674901833; cv=none;
        d=google.com; s=arc-20160816;
        b=pP4NwrvFAWuqV6VS+6Py4tsFoOvw0sirOyhtmb7AXNuNXpjFvSDHKVeMUI6M0GvgIN
         ehPxlHd9bhzjCKa4Z4SipuwOlvXpfkH1qMSGHVr8scTeBqluhg3b9hxeyMawaYgG3ng3
         THrXI5ndLTanTmykUgBJ4O2ut4oOamZRqJ819rMlmsDK6MbI7vEvDo/JaF329BuqSKRr
         xFFY9t1lJ8HF/pdHFv1eiBQtaPViAUjcsVGZG0ZfqOezrK0PlvporPkIdODDG26AFoCa
         zIR+KB+qrVdQ5WLBTSMX/z9PYuMqeKT4DntiMTHbpAqriCM30iWYGAdXuJQr9gpA+gdB
         JWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=6FB+edsbb44QCZ358g73Bl78hzSRCKhojxU7VjQ1JnU=;
        b=OovYduUIBgCem7L3sb0YWOHcLDjSD5WU1aLaUsdIinPh3JtsLWpAvcWxMGoRK+KDxP
         4scXrdgmF9rCsc17cXrh1i35HxdBzAEgWnfN92YDYFxf5Lpxb5MQvintporDbcuZdTRW
         UKXSzfMENmz0p3yV3WR4M5XKKW2Dh3eXepesf5to/N5YFdCVrdkq/xxn8IBXJJWFtQMi
         aJ653jFkR5zoYLLXQiqfbfcCD4+aYr4vx6jCE7uI+uxnnwSvWVHAjYIGfUms9exdGCS4
         O0g9ERvtVq2VyH07n87ROAJ8EnkEigwIfYeggUZ10lxi24Kq+2bxjPAY10hisGzNCWBa
         S8VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMqWt89c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1-20020a0ce6c1000000b005377076c112si3698766qvn.222.2023.01.28.02.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 02:30:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMqWt89c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLiTD-0006KG-OH; Sat, 28 Jan 2023 05:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiTB-0006JQ-KI
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 05:30:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiT9-0004IX-PM
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 05:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674901798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FB+edsbb44QCZ358g73Bl78hzSRCKhojxU7VjQ1JnU=;
 b=FMqWt89cZxDuVBfJ7McwztOz0XY0U7Hm4ktM3GuIg7/7E6ENwvkq2a44kVVCu5rQetvDmq
 sxsIfRMwyozrCJH+mqbBWW8fvcMPD88YyIq4n50gb3DAr3rdYP8o7Hp/Lvc7VJjinzidkE
 rWnAcIET2WdYJKwVSp85EEQ509W8AsM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-_PaS9XSmPpOYO69d6mME3w-1; Sat, 28 Jan 2023 05:29:54 -0500
X-MC-Unique: _PaS9XSmPpOYO69d6mME3w-1
Received: by mail-wm1-f71.google.com with SMTP id
 o5-20020a05600c4fc500b003db0b3230efso6128672wmq.9
 for <qemu-arm@nongnu.org>; Sat, 28 Jan 2023 02:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FB+edsbb44QCZ358g73Bl78hzSRCKhojxU7VjQ1JnU=;
 b=n6J3tFooe7MGJbhDb+BpaRISulVyvJhl0ZE8Rwqdn6emf2j1yXFqqi2LiHE8oCBvdK
 garn28Wp3+qO6fmew0ooMv+Ue6ToYPlp/BkDw53Z9dCJ+wjQ6FI09k5WDuImpHUTIyMY
 mqVnzYr/OjkA7iAnxuASrzZrOBSkKPwEf66jyt6M9WmLNuHGcBjo6FI7kH796wINVCuI
 gDSXYIguy2o1nth2T3ge6SBisxCB64NiyOoQURIPDfD8eCoYqg0s26P2k/U4WTmvvHu5
 W5tXhoT8cK/3L0RTHsfyz/ci8zFn05UT/qCedFHcb+t1TG9nfUy0i9Ht0tsv5Nl0Wsv0
 mi8g==
X-Gm-Message-State: AFqh2kruvl2azrAZPJZ3KI7iPkjPBpQAzLitD2l5CW61bkfzH/8hcZpE
 AefTYyf8FrX4aXNJKBJ56U6pUqekaCml2Vh91uWxj07fQJvhRaTseiwq9JlpT3J7Enu8cpClQ7b
 gFAu+jQ+BIQz1
X-Received: by 2002:a05:600c:4f4a:b0:3db:5f1:53a5 with SMTP id
 m10-20020a05600c4f4a00b003db05f153a5mr44594804wmq.20.1674901793179; 
 Sat, 28 Jan 2023 02:29:53 -0800 (PST)
X-Received: by 2002:a05:600c:4f4a:b0:3db:5f1:53a5 with SMTP id
 m10-20020a05600c4f4a00b003db05f153a5mr44594772wmq.20.1674901792934; 
 Sat, 28 Jan 2023 02:29:52 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 i20-20020a05600c071400b003db0ad636d1sm9927098wmn.28.2023.01.28.02.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 02:29:52 -0800 (PST)
Date: Sat, 28 Jan 2023 05:29:47 -0500
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
Message-ID: <20230128052729-mutt-send-email-mst@kernel.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
 <20230127100052-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230127100052-mutt-send-email-mst@kernel.org>
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
X-TUID: b0ousQYdFnmz

On Fri, Jan 27, 2023 at 10:01:57AM -0500, Michael S. Tsirkin wrote:
> On Fri, Jan 27, 2023 at 02:54:30PM +0000, Peter Maydell wrote:
> > On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
> > >
> > > Also, why didn't you move sys/resource.h and other such files
> > > to os-dep.h? I'm struggling to understand the rules around what
> > > is or isn't included where?
> > 
> > The rough rule of thumb is that if some OS needs a compatibility
> > fixup or workaround for a system header (eg not every mmap.h
> > defines MAP_ANONYMOUS; on Windows unistd.h has to come before
> > time.h) then we put that header include and the compat workaround
> > into osdep.h. This avoids "only fails on obscure platform" issues
> > where somebody puts a header include into some specific .c file
> > but not the compat workaround, and it works on the Linux host
> > that most people develop and test on and we only find the
> > problem later.
> > 
> > There's also no doubt some includes there for historical
> > reasons, and some which really are "everybody needs these"
> > convenience ones. But we should probably not add new
> > includes to osdep.h unless they fall into the "working around
> > system header issues" bucket.
> > 
> > thanks
> > -- PMM
> 
> 
> BTW maybe we should teach checkpatch about that rule:
> if a header is in osdep do not include it directly.

To be more precise, make checkpatch run clean-includes somehow?
Or just make CI run clean-includes on the tree and verify result
is empty?

> -- 
> MST

