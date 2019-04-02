Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1137121wrx;
        Mon, 1 Apr 2019 20:55:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXlFqQXr5GUdeBqI/n60COhxVwbRz5UT/X1f/1zkP3kN0lUMttZnfk/alVIrWjGR2GqTFP
X-Received: by 2002:a81:9bd8:: with SMTP id s207mr55839444ywg.215.1554177327882;
        Mon, 01 Apr 2019 20:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554177327; cv=none;
        d=google.com; s=arc-20160816;
        b=g7OJvVfnIPtqurLwv1rfeHzYQyCA88YJ864+PU7Ijn/A7pcxX6O+WAJx9hKV6EVftD
         42neXXimo6OgBwmD3UX+bolK9LxckpQ8xY6Se8p60MghtK1KaozpEe61UmLvnhIaXLDJ
         rU8XfpquRJFPwIPK/sy/kDYSHhgNrHXFQfj2zP3Vte8qiTgzqV/k26OYiIcVvAZqKxZY
         +WlwiMk1C4M6M2vXB1QVtgqfimvaoyo8MmvrE/huwxLmJbNmPNafNxKOb94lmjUb94KO
         sSdkzvmc9rZmJescdhmgWEFfyCoVbdkV73yG2v8MjIMGQy7NxfhDsPEJgI2tslz4Mh4h
         KV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=hTx90gzo0CQYBEq59J0hPHnwQBsc2ct9UN5ICWvDFx8=;
        b=rKUKsrZwJ8KZGR/yiivOT4Y6/Zw4btv88czU+AePPS+MD0e3Ecd7UKZjATS2rc2jdg
         ugWIH8BvxLBzaNNDhhqYyb+E3EOxFisGF3LKUsmzKz9nXBrKxPqAze3sRIugTR7AoCGZ
         AYk3vn0FEP/qOU8/djCwrp43fl0BSJPIY6G7PdbNAErsxHCgfrRWIw/j4loQOwKjFI0E
         Y/6RLEonyUH6TQk+rXJYf+LHlp0gxH+gmZ362FNTlQ4Lj1/mEJOa9ZdFA4ja7j05A34e
         fTXsDygmnlsaosSzKw9Yl/HGHzJsHUQie2o/wQx/CITRAtIVaSKFcgNDpAtpukGayjHY
         QiOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23si3814944yba.485.2019.04.01.20.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 20:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:44029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBAWF-0000kz-Bw
	for alex.bennee@linaro.org; Mon, 01 Apr 2019 23:55:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hBAW3-0000iw-TN
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 23:55:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hBAW2-0000tI-2W
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 23:55:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:40200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hBAVd-0008RC-Sm; Mon, 01 Apr 2019 23:54:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Apr 2019 20:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,298,1549958400"; d="scan'208";a="145786722"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Apr 2019 20:54:00 -0700
Date: Tue, 2 Apr 2019 11:53:43 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190402035343.GA6527@richard>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313170943.5384f5cf@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/3] hw/acpi: Extract
 build_mcfg
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4mk5ZPwWf+Ja

On Wed, Mar 13, 2019 at 05:09:43PM +0100, Igor Mammedov wrote:
>On Wed, 13 Mar 2019 13:33:59 +0000
>Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> 
>> I am lost at this place.
>> 
>> sig is a part of ACPI table header, you mean the sig is not necessary to
>> be set in ACPI table header?
>> 
>> "skip table generation" means remove build_header() in build_mcfg()?
>I mean do not call build_mcfg() at all when you don't have to.
>
>And when you need to keep table_blob the same size (for old machines)
>using acpi_data_push() to reserve space instead of build_mcfg(sig="QEMU")
>might just work as well. it's still hack but it can live in x86 specific
>acpi_build() keeping build_mcfg() generic.
>
>As for defining what to use as criteria to decide when we need to keep
>table_blob size the same, I don't remember history of it, so I'd suggest
>to look at commit a1666142, study history of acpi_ram_update() and
>legacy_acpi_table_size to figure out since which machine type one doesn't
>have to keep table_blob size the same.
>

Hi, Igor

It took me sometime to go through the migration infrastructure.

Before continuing, I'd like to talk about what I understand to make sure my
direction is correct.

ACPI has a structure named AcpiBuildState, which contains all related
information. During migration, those data in AcpiBuildState should be
transferred to destination, e.g. table_mr, rsdp_mr and link_mr.

In the case related to mcfg, the problem lies in table_mr. And the reason
breaking migration is the size of table_mr is different between source and
destination.(This reason is a guess from those change logs and mails.)

The migration infrastructure has several SaveStateEntry to help migrate
different elements. The one with name "ram" take charge of RAMBlock. So this
SaveStateEntry and its ops is the next step for me to investigate. And from
this to see the effect of different size MemoryRegion during migration.

Is this sounds correct?

-- 
Wei Yang
Help you, Help me
