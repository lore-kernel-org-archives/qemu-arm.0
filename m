Received: by 10.28.173.206 with SMTP id w197csp4652506wme;
        Wed, 10 Jan 2018 00:45:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBos/y7BFgv7yd5ZbueGcdRbjVPiDUWGwCrxZR1huYyQCM+dk+6lsTsXZ7bOlFH6QhaZwh3Mj
X-Received: by 10.37.58.3 with SMTP id h3mr16416526yba.118.1515573902134;
        Wed, 10 Jan 2018 00:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515573902; cv=none;
        d=google.com; s=arc-20160816;
        b=nJvWNIQE85CdwRm3xmP2k2RMjmPk6mxppqIpZSr0qlJWBY1fAapj2R1inFIl8d3ZB2
         EJzThtFTPh2v6d4GvqcqTbDT8RZ3kZcj6n/bCezgnIX+M8aH5DrV9UTRJ03fy68HayiI
         w/dv0mQ0GNzEnYNaX1PhUqTxFUdhCAFpASbr+37v2IRm1SrORB1mMU9GI49IJ3Ud3IMV
         cpmGMZzMPen/zpRyVuiQRLcBUUO6C6mrUX6ir+A1EExz/4lV2CXRVnVCPlE/a1BJFosP
         B6vMtQYY1FOESLak4DyTADMg9QiveKGjN8wJe+/7nJObHufZGoseSgO4yKZw6pb9OP7D
         b7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=ogBRbyUBBVsUVX6T5k+5Ds8u2Rj56dtGgU2o2MKlhBE=;
        b=q8mOYuEHy11Oo+feOUWo29XCi5lzmT/9zSUBjh+GWlwlsyMW+uLVrHYSyDW8AggxKc
         TcTmlWlGru95Ie8qXdrP2KF0+xH+MI8kR+FtZ2gj6GCdQp8/W4c2y95SGeMXu7IqOAec
         epKhZONb7uX8xh305iDNry0Q9c4z7C4KAJLgo7iUqxKgv9+UPu1SNc0OrdDUe0eD3ILQ
         MRipWjNsO8x0LxGnuWBKcC1PSnvoXWt+ruQKhNC1LCnfPQW8UrMV+sSyKW3BWxwzerrX
         1T4+M9uHSs5YaLOTBjMB0Cv979Ht7s90NmSejLtfc5vsEkE6bZ2rNAC3vrZ4UqLJjUmd
         NVRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h6si3362308ywe.294.2018.01.10.00.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Jan 2018 00:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZC0L-0006YP-Jh
	for alex.bennee@linaro.org; Wed, 10 Jan 2018 03:45:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1eZBz0-0005on-KZ
	for qemu-devel@nongnu.org; Wed, 10 Jan 2018 03:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1eZByz-0006h1-Pr
	for qemu-devel@nongnu.org; Wed, 10 Jan 2018 03:43:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1eZByu-0006aX-GK; Wed, 10 Jan 2018 03:43:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E4B67CB89;
	Wed, 10 Jan 2018 08:43:30 +0000 (UTC)
Received: from [10.36.117.128] (ovpn-117-128.ams2.redhat.com [10.36.117.128])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44CC87B8CF;
	Wed, 10 Jan 2018 08:43:23 +0000 (UTC)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20180108231048.23966-1-laurent@vivier.eu>
	<20180108231048.23966-2-laurent@vivier.eu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <66de9088-f8ed-2be4-c71a-5d149c63587b@redhat.com>
Date: Wed, 10 Jan 2018 09:43:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180108231048.23966-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 10 Jan 2018 08:43:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH 1/6] accel/tcg: add size
 paremeter in tlb_fill()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Michael Walle <michael@walle.cc>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jkk/ghaXlG5d

On 09.01.2018 00:10, Laurent Vivier wrote:
> The MC68040 MMU provides the size of the access that
> triggers the page fault.
> 
> This size is set in the Special Status Word which
> is written in the stack frame of the access fault
> exception.
> 
> So we need the size in m68k_cpu_unassigned_access() and
> m68k_cpu_handle_mmu_fault().
> 
> To be able to do that, this patch modifies the prototype of
> handle_mmu_fault handler, tlb_fill() and probe_write().
> do_unassigned_access() already includes a size parameter.
> 
> This patch also updates handle_mmu_fault handlers and
> tlb_fill() of all targets (only parameter, no code change).
> 

There are a couple of places where you use "1" (when no other size is
available). e.g. in get_page_addr_code().

Wonder if that's the right thing to do - are there any architectures
that e.g. always fetch at least 2 bytes in these conditions?

Apart from that, looks sane to me (for other architectures :) )

-- 

Thanks,

David / dhildenb
