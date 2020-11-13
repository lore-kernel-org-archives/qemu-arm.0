Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp2407373qvk;
        Fri, 13 Nov 2020 05:16:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4Kj23zPGnjiRM9mmFgi9pPvBhdp1jgdOABaC2wiJ8xmaEuXPgdQv5rqTSBY7ITCjCkQL5
X-Received: by 2002:a25:5d4:: with SMTP id 203mr2343130ybf.182.1605273293765;
        Fri, 13 Nov 2020 05:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605273293; cv=none;
        d=google.com; s=arc-20160816;
        b=riw0AWk3F4EjerRPLX7LQYSm21xMcG+TR9rHIpPgwIp3if79FP7xH/yx7M1gwuxc3T
         8hA0Vwa4/XAkId4iOuyS4aT1/iUgWFehk2mXzQTrlli4H3Y7ci+Kve91UzbaQb8xZg25
         X0VYBIXTDObYII16ob3dAvwIGVnpZf4HwPFdoYUr7Z5l1aHd3ZhIa4EQ5gbLfK3bJcLY
         YacGv1Hz5jr03gbd9hVzhDrTl3pyvFrb0fwf3/imfBTYBz01FVvEsMVfF7GOOVOLQ8IF
         61L3deDdAakpiGjaldTEQLHaN6TxU8RIljCenZQiRPmXjJ0/twBooULjzazqN3S29RnA
         iwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=dCPbkutU9Ja1iuqnJSgqmj9RWlua/OfJiesUN8QQ3Bg=;
        b=GTMW4zCzoOS2cUGuDbQ7FFumPoaTTI8Xg46z1p0kcAqFPXGb6sROB5rYVUj76KqlA3
         zb29QmVlIXsrbCOjE2b6nuGtnngfD2jWU8zkY6oObn8DxwS3oJ2cp/7A17P7//9aFdxn
         TtLq0nNubbirgtXJDjcPtwYm2ehs/10XQFl/ov4qtktB/oWOqys6oH1LmxqbSc37xzta
         u4HhwDVBdnxMTiwlbNWfus7dZU8xTO2a0moPLZohiRbkADqo2ogsK4xjZqnz3NFBXI3H
         rJ4njta57eUWc+0XG1Q/SnRnoEJDJGNHA7vaf3wiAqBq+Lhah6S8HlUNV4QuXPIclCfd
         cRkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZF26sMS2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h97si10294851ybi.405.2020.11.13.05.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 05:14:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZF26sMS2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdYuj-0001it-8J
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 08:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdYtr-0001iX-HQ
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 08:13:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdYtk-0000e3-7l
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 08:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605273231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dCPbkutU9Ja1iuqnJSgqmj9RWlua/OfJiesUN8QQ3Bg=;
 b=ZF26sMS2Xjzpe8ieCl0L6s2/v/7nEK8QVtFxBc4fFtld4Y5twaRroXIw8ZawVhvgq00vHi
 4bTAMLHRFrUjjjf6wUFWeIH3FST32MjXfjPP2/kxXQpAR35vhLHH7t5TZstpz2IWI663tN
 cV9pvNDb11SCGsTaSCPac8NU4SR82oE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-ExW5MND4NIulmUofgTPcvg-1; Fri, 13 Nov 2020 08:13:47 -0500
X-MC-Unique: ExW5MND4NIulmUofgTPcvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B01B107465F;
 Fri, 13 Nov 2020 13:13:46 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 065576EF5D;
 Fri, 13 Nov 2020 13:13:44 +0000 (UTC)
Date: Fri, 13 Nov 2020 13:13:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm/monitor: Add support for 'info tlb' command
Message-ID: <20201113131342.GM3251@work-vm>
References: <20201113095854.67668-1-changbin.du@gmail.com>
 <CAFEAcA-3A2s3b5+kVPmDfPxG=gypOhD8agrqx0mUYt3gZKbMNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3A2s3b5+kVPmDfPxG=gypOhD8agrqx0mUYt3gZKbMNg@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Changbin Du <changbin.du@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: toH/Xgw17kAN

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Fri, 13 Nov 2020 at 09:59, Changbin Du <changbin.du@gmail.com> wrote:
> >
> > This adds hmp 'info tlb' command support for the arm platform.
> > The limitation is that this only implements a page walker for
> > ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
> > not supported yet.
> 
> "info tlb" needs its own entirely independent implementation
> of a page-table walk? I see this is how x86 has done it ,but
> it seems like a recipe for the info command being perpetually
> behind what we actually implement...

I think the challenge is you want 'info tlb' to be quite easy
to read from a debuggers point of view and robust at pointing out
things that are odd; I'd hope at least you can use most of the macros
to extract fields etc

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

