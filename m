Received: by 10.25.44.15 with SMTP id s15csp133998lfs;
        Thu, 13 Jul 2017 15:31:49 -0700 (PDT)
X-Received: by 10.200.10.10 with SMTP id b10mr7538783qti.226.1499985108972;
        Thu, 13 Jul 2017 15:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499985108; cv=none;
        d=google.com; s=arc-20160816;
        b=KX0PHhaehSOghcivEYNyVlgJRJRxNTtF525kuIKabAyvdyphyUoj/y7qlpXoGPM574
         TkYp3R6CTPMC1PZM89r7Q9P0S8Yo8ZPmYzWmBDHQE03ncxTmU5pmGlKTv/Ij0PhFQx7a
         aCF9GAqsZECJpM44brbuoTNoFkcAY2S4f6pVs3nW8lwrEBV8r6KSBbYzWqBnm7Qde8GG
         atlBErqzClUA8OOxCbRbwDiknwDAOd3jsH4sxdtcoYM/nM2ZOcoXfKrxENAFZzR/Rwo5
         8dcpavAc7UiR0KEMaO2SmL/sCdgHWOonxKNHhgrb5MpTiTrwq7GSVy+hjfYJyvG3ikoR
         WOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=2vsOtEJW3woxDJGK8fLzs6yEzraNsAsHWmwZUQy/RRY=;
        b=deaUH4iuBB+QdAooN6+14uJrUgCYS0q2BhpSZgZ/uWzfjJGocR3hUeXAUCrd9L+VJR
         6VmspCT9ApOzZe8YJab2J5bKf3EOpTn3kYP9/0WOqM2II3WV/jVwkXytf9ly0g0e6pl2
         zVqcdzmVooocnklH9whdXP4EPGqBqyPiQRSKtw/SbJjkwDKteW8L0Bvwl1GjQUYWjZJP
         DpMuVfpnDU09pYV4uiBJJUK8RqGtSUfRsEzFwsOjCKNP4ZzEm/+xC0f/ypzenMlOZmc/
         100PlaMrICDBQqPTevSn7CFxo6snoVrIaky+siqsGv3u/ufRm3Z/POkZrkO2wY9fEwRQ
         bZCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si6085602qkc.372.2017.07.13.15.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 15:31:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVmeA-0001Mo-8w
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 18:31:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVme7-0001Mj-9N
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 18:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVme3-0002QE-A7
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 18:31:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dVme3-0002Oq-3p; Thu, 13 Jul 2017 18:31:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0808580F63;
	Thu, 13 Jul 2017 22:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0808580F63
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0808580F63
Received: from redhat.com (ovpn-121-70.rdu2.redhat.com [10.10.121.70])
	by smtp.corp.redhat.com (Postfix) with SMTP id 4D9605DC1A;
	Thu, 13 Jul 2017 22:31:32 +0000 (UTC)
Date: Fri, 14 Jul 2017 01:31:31 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20170714012613-mutt-send-email-mst@kernel.org>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-3-git-send-email-gengdongjiu@huawei.com>
	<20170713201407-mutt-send-email-mst@kernel.org>
	<660d600a-107c-e44a-7322-ae4a74bc5565@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <660d600a-107c-e44a-7322-ae4a74bc5565@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 13 Jul 2017 22:31:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 2/3] ACPI: Add APEI GHES Table Generation
 support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	qemu-devel@nongnu.org, Dongjiu Geng <gengdongjiu@huawei.com>,
	qemu-arm@nongnu.org, james.morse@arm.com, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, zhengqiang10@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ptsl2IW30Arg

On Thu, Jul 13, 2017 at 09:41:03PM +0200, Laszlo Ersek wrote:
> >> +
> >> +        error_source++;
> >> +    }
> >> +
> >> +    for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
> >> +        bios_linker_loader_add_pointer(linker,
> >> +            GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i, sizeof(uint64_t),
> >> +            GHES_ERRORS_FW_CFG_FILE, GHES_ACPI_HEST_NOTIFY_RESERVED *
> >> +            sizeof(uint64_t) + i * GHES_MAX_RAW_DATA_LENGTH);
> >> +    }
> 
> So basically all this math exists to set up the pointers that are shown
> in the diagram in the commit message. It is a bit tricky because most of
> those pointer fields (all 8-bytes wide) are individually embedded into
> their own containing structures. In the previous version of this patch
> set, I painstakingly verified the math, and pointed out wherever I
> thought updates were necessary.
> 
> I agree the math is hard to read, the code is very "dense". My
> suggestion (supporting yours) would be to calculate the fw_cfg blob
> offsets that should be patched in more fine-grained steps, possibly with
> multiple separate increments, using:
> - structure type names,
> - sizeof operators,
> - offsetof macros,
> - and possibly a separate comment for each offset increment.
> 
> Thanks,
> Laszlo

Right. That's not what rest of ACPI does though. What we do there
is one of:

1. Use GArray to gradually build up the structure.

Struct *s = acpi_data_push(table, sizeof (*s));
s->foo = bar;

2. Even simpler: use build_append_int_noprefix:

build_append_int_noprefix(table, 2, bar); /* Foo field */

this removes the need to declare Struct in a header,
just add comments to match the spec exactly.

We might gradually move more code to (2) but (1) is an
OK style too, it makes it obvious the sizes are fine.


-- 
MST
