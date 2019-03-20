Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp740783wrt;
        Wed, 20 Mar 2019 06:41:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyGbWetxz87+5JBzF1pd2ExSK+bIOnjKmMou+d8JZ/cKO7/dPE0OAM6L8w4m6QpEZnbEe9
X-Received: by 2002:a1c:7dcb:: with SMTP id y194mr8705535wmc.1.1553089269253;
        Wed, 20 Mar 2019 06:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553089269; cv=none;
        d=google.com; s=arc-20160816;
        b=dpxXa5uy0rzc6KKjBrZfxcxqJe28L4qTV+bXIf+tivhzGlcS4CHGUCVOESR/ZUJG+E
         WVJbRNj9Xk2yh0+64CR32zN39SmN7kQK3dHo73irtEZ9yD3TQaMhu9f3ZLicjh/vAd4T
         sPBebwQmRKn9HHnEsnwk3txEbX1nmPkOqJbNQflJ9JFK6O4tWN3+QKwzyproBxG5Ljcc
         8lFxenaXHgF/f/UvgJBGdgHb95MB6mL/wClltKUWCVLZTXqMneqGWtAyvrrGUjMf6GVs
         IcgOqfrrugppvq5J/673IC4Ov2lQjQhglfrShqy3v03Ydw/dmi9Gkm8XfYNokWOL+nkH
         17KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=OdH5fIX7SGOvjmwaO4LVRuQON5Q/V7Fown44QLo6s3A=;
        b=Qtrs81L95XefNPCKLuxMpgOlMp8GjlAZEIFe8SyEA0iIikvD/x52jx7pZcgd69W5/B
         ZI7/fbr6WXrM2rrI0yh8xDryZXNixQqwkPHysBEyegsKMDsSUfvqKlphhrUEuqcJqiXx
         sCkGxnBfpvWo8tyZXpLtp4M4GX9ymNhQd3YO7LeSu21XNslrjn7pBMBR7ZZT+5u0PllR
         ZydiQ/Rq+Cvc3lt2d1O/a8M04CABLv+plbVRv+I8ZQxq0VLxWTMximyl3ybNdh0i7NXO
         c5eI6ZiICxCof89MVJDbS6Y7qq2FByPRb2ueW/JLGLsszfSonD4HKq21ZWue2t7lpD/t
         qkMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si1324766wrv.233.2019.03.20.06.41.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Mar 2019 06:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:48172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6bSu-0003Ie-DD
	for alex.bennee@linaro.org; Wed, 20 Mar 2019 09:41:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h6bSS-0003I4-9U
	for qemu-devel@nongnu.org; Wed, 20 Mar 2019 09:40:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h6bSQ-0003J1-Tp
	for qemu-devel@nongnu.org; Wed, 20 Mar 2019 09:40:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:53091)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h6bSQ-00037B-C6; Wed, 20 Mar 2019 09:40:38 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2019 06:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,249,1549958400"; d="scan'208";a="127051203"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga008.jf.intel.com with ESMTP; 20 Mar 2019 06:40:30 -0700
Date: Wed, 20 Mar 2019 21:40:08 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190320134008.GA17594@richard>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
	<20190313213137.acncaz7duosjybnf@master>
	<20190314101830.6e10d4d5@redhat.com>
	<20190316103124.qeu4dz67adezijtn@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190316103124.qeu4dz67adezijtn@master>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-devel] [RFC PATCH 3/3] hw/acpi: Extract build_mcfg
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /PmZRthtkNIL

On Sat, Mar 16, 2019 at 10:31:24AM +0000, Wei Yang wrote:
>On Thu, Mar 14, 2019 at 10:18:30AM +0100, Igor Mammedov wrote:
>>On Wed, 13 Mar 2019 21:31:37 +0000
>>Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>>> On Wed, Mar 13, 2019 at 05:09:43PM +0100, Igor Mammedov wrote:
>>> >On Wed, 13 Mar 2019 13:33:59 +0000
>>> >Wei Yang <richard.weiyang@gmail.com> wrote:
>>> >  
>>> >> On Wed, Mar 13, 2019 at 01:23:00PM +0100, Igor Mammedov wrote:  
>>> >> >On Wed, 13 Mar 2019 12:42:53 +0800
>>> >> >Wei Yang <richardw.yang@linux.intel.com> wrote:
>>> >> >    
>>> >> >> Now we have two identical build_mcfg function.
>>> >> >> 
>>> >> >> Extract them to aml-build.c.
>>> >> >> 
>>> >> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>>> >> >> ---
>>> >> >>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
>>> >> >>  hw/arm/virt-acpi-build.c    | 16 ----------------
>>> >> >>  hw/i386/acpi-build.c        | 31 +------------------------------
>>> >> >>  include/hw/acpi/aml-build.h |  1 +
>>> >> >>  4 files changed, 32 insertions(+), 46 deletions(-)
>>> >> >> 
>>> >> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>> >> >> index 555c24f21d..58d3b8f31d 100644
>>> >> >> --- a/hw/acpi/aml-build.c
>>> >> >> +++ b/hw/acpi/aml-build.c    
>>> >> >
>
>[...]
>
>>> >I mean do not call build_mcfg() at all when you don't have to.
>>> >
>>> >And when you need to keep table_blob the same size (for old machines)
>>> >using acpi_data_push() to reserve space instead of build_mcfg(sig="QEMU")
>>> >might just work as well. it's still hack but it can live in x86 specific
>>> >acpi_build() keeping build_mcfg() generic.
>>> >  
>>> 
>>> Seems got your idea.
>>> 
>>> >As for defining what to use as criteria to decide when we need to keep
>>> >table_blob size the same, I don't remember history of it, so I'd suggest
>>> >to look at commit a1666142, study history of acpi_ram_update() and
>>> >legacy_acpi_table_size to figure out since which machine type one doesn't
>>> >have to keep table_blob size the same.
>>> >  
>>> 
>>> OK, let me study the history first.
>>> 
>>> BTW, the legacy here is hardware specification level or qemu software
>>> design level?
>>it's QEMU only, you need to find a version of QEMU (machine type)
>>which didn't have re-sizable MemoryRegion and the next version most likely
>>would have a knob somewhere in machine class definition saying that we don't
>>care about sizes anymore or care about sizes only for previous machine types.
>
>I have got something, but not sure this is correct. So I'd like to
>summarize them here first.
>
>The following commits are ordered in timeline.
>
>1. First we introduced resizable MR.
>
>    a1666142db 2015-01-08 acpi-build: make ROMs RAM blocks resizeable
>    60786ef339 2015-01-08 memory: API to allocate resizeable RAM MR
>
>2. Then acpi_ram_update in introduced
>
>    339240b5cd 2015-04-27 acpi-build: remove dependency from ram_addr.h
>    42d859001d 2015-02-26 acpi-build: fix ACPI RAM management
>
>3. After that we introduce 2.4 machine type
>
>    5cb50e0acc 2015-04-27 pc: add 2.4 machine types
>
>But I don't find a comment stating we don't care about sizes anymore.
>
>Below is my understanding of the dummy table history. 
>
>Before resizable MR was introduced, the dummy table is used to be a
>place holder so that we could add real table in acpi_build_update().
>Othersize the new ACPI table is bigger to be placed into
>build_state->table_mr.
>
>If this is correct, after commit a1666142db ACPI table has the
>capability to expand itself and not necessary to pre-allocate the dummy
>table. Can I say after commit a1666142db, we don't need to put a fake
>table in ACPI?
>
>Another confusion is in the comment of build_mcfg(). In which aspect, it
>relates to migration? Is this before resizable MR introduced?
>

Hi, Igor

I guess you may be busy with other stuff. I'd appreciate it a lot if you could
spare some time slot to take a look at this one. Thanks :-)

Have a great day~

>-- 
>Wei Yang
>Help you, Help me

-- 
Wei Yang
Help you, Help me
