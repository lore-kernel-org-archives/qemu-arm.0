Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp622509ejo;
        Fri, 5 Jan 2024 02:24:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF20YFJC1vXt4BGdnkk8dn6SnnYShn5qIA155AIt3GAFG/xxQg0RkDI/Wf5AHW6+UK/VHXq
X-Received: by 2002:ad4:5bcc:0:b0:680:b55c:4814 with SMTP id t12-20020ad45bcc000000b00680b55c4814mr1557151qvt.84.1704450297503;
        Fri, 05 Jan 2024 02:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704450297; cv=none;
        d=google.com; s=arc-20160816;
        b=MJLw/oA/47lj85WN5CgTDTVQoJ8tp8h/XU/Qn0feWQEQdHbXjJhgeUYEoRea0K0KhJ
         BB+6P/Oe77k1Ilm59NJ0liOK+IY3Bc26qGI5MhUwrVWaC6+Zipk2/vVQhN6S44OzuBAv
         F95/0fwcFqT4X2nNf/csQjeoozjdW4gSj81Fi7lSEpOO3O+uoYn8wSbU2e0JGsyiwiBp
         28eTFuEZG7SNMKVObDWMcIFi933XU8pqBz1JvJAYQY/JTSCTDiJs4G51VCwfuF9ZPQPW
         lXTQ5FAeVnyQvpbtKSCTB9cJtjjsql/7Auwtnux9tOs0xkxKDXO8tEC448IbGaiq+uhX
         4oDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=44Pwp+PjhFelFbehevxkbvLQtNBmswpxMCXTdBeXr8k=;
        fh=LW+Im8ADPh5iSVUaDuLpjEqbqU3kGe+Gb8BRnn+EFLU=;
        b=v/heW3ScL7a2xfItvkSvlbDLprhxGQ3mGCwgDW0wmrbHauXxMGB0D1JfxDBA6kvFeZ
         pt2yw9ogGg7VGj5PxLaFF55nnTPwG9XElfiJQKs0jIWlj8pShHT7OHcJsrB6o19hGkeN
         mzk5KbYxvkpZ+tfmWqobhctliiDCUk7kqEZ7m+8bpxf7t4Z/lO2JgSZ+WgZxHm9IP4nS
         6keXklvW5lhbdDc9eGr0GPwTJ5Dtq2ijSUy9B0Dvn/cxwRxBHHY1ePy1NGMUWdOyFGdC
         tsRTsv8sJtX2bHhaiGoxXDeu3Xn/TmxfMjK6A/9R1WHZnl65aM2APpPqGeCg9vWRs0im
         uYrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OtW7+ppF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020a0cf344000000b0067fb9da9822si1455436qvm.170.2024.01.05.02.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 02:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OtW7+ppF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLhNP-0007ir-7S; Fri, 05 Jan 2024 05:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1rLhNO-0007iT-8U
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 05:24:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1rLhNM-0004KO-My
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 05:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704450268;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44Pwp+PjhFelFbehevxkbvLQtNBmswpxMCXTdBeXr8k=;
 b=OtW7+ppF5q6R90JGEpuFYS7Dbn2w5GgV4P+QT/bj8QJ02ke2MY62JUqbOM6TsG+VCOovTH
 uf0TyUdwDLHcPqpGRMCAQGnzC1D9Z1NdFasB2MxsfG05Qb+8rbjPk8R2UU3pYy/dSGhKTj
 CF73txf+2cgUDY2fVwemnzHWZWwGURc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-6E-6JjouOIG8lyUotBQOQQ-1; Fri, 05 Jan 2024 05:24:20 -0500
X-MC-Unique: 6E-6JjouOIG8lyUotBQOQQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11AB1101A52A;
 Fri,  5 Jan 2024 10:24:20 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC42492BC6;
 Fri,  5 Jan 2024 10:24:17 +0000 (UTC)
Date: Fri, 5 Jan 2024 10:24:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: inesvarhol <inesvarhol@proton.me>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 2/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
Message-ID: <ZZfYvlmcxBCiaeWE@redhat.com>
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
 <61fd13b3-7cc9-4e27-bf91-bd2b4aedf97b@linaro.org>
 <ZjC6phtwjcDoQP-NDP6GF-dvCVK8Ctk9EeW_JezuNBqnQq4-V6NU6eAhECMqxJzMDRxwjbb-LPcHTvysc6YGuLD7ckWhbtpqD1g9lnklofI=@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjC6phtwjcDoQP-NDP6GF-dvCVK8Ctk9EeW_JezuNBqnQq4-V6NU6eAhECMqxJzMDRxwjbb-LPcHTvysc6YGuLD7ckWhbtpqD1g9lnklofI=@proton.me>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.691,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zQQtrDz03eWV

On Thu, Jan 04, 2024 at 01:37:22PM +0000, inesvarhol wrote:
> 
> Le jeudi 4 janvier 2024 à 14:05, Philippe Mathieu-Daudé <philmd@linaro.org> a écrit :
> 
> Hello,
> 
> > > +static void test_edge_selector(void)
> > > +{
> > > + enable_nvic_irq(EXTI0_IRQ);
> > > +
> > > + / Configure EXTI line 0 irq on rising edge */
> > > + qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> > 
> > 
> > Markus, this qtest use seems to expect some stability in QOM path...
> > 
> > Inès, Arnaud, having the SoC unattached is dubious, it belongs to
> > the machine.
> 
> Noted, we will fix that. 
> Should we be concerned about the "stability in QOM path" ?

QTest is a functional test harness that intentionally has knowledge
about QEMU internals.

IOW, usage of particular QOM path in qtest does *not* imply that
QOM path needs to be stable.  If QEMU internals change for whatever
reason, it is expected that QTests may need some updates to match.

QOM path stability only matters if there's a mgmt app facing use
case, which requires the app to have hardcoded knowledge of the
path.

Even a mgmt app can use unstable QOM paths, provided it has a way
to dynamically detect the path to be used, instead of hardcoding
it.


None the less, you may still choose to move it out of /unattached
at your discretion.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

