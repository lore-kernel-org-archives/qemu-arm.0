Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1658884wrs;
        Wed, 13 Mar 2019 06:33:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzK5EhIh9jb7qkeVxXeV2ArEeaoQOZalxv0YUruEzYtpLqXCRSyV3Lf9T24sYTr6bGQHhW1
X-Received: by 2002:a5b:5ca:: with SMTP id w10mr9855013ybp.133.1552484014269;
        Wed, 13 Mar 2019 06:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552484014; cv=none;
        d=google.com; s=arc-20160816;
        b=sz5fn0ArJJDc+VJv2V4HuicM21yVWG+P7Kdk5vdb7KwGCd5p6YuVm7w8WNBt9KzQxb
         mEgwYLrnDZFxaoeFNlDQwLMPE8xAG1YWN3nVRPiRtDWAFA18Lz2BsNshkVhaDGK/4VD1
         vJqX7m+ZBiKpDfF2sd+asbG+Ng0PZB59O26+Ml4FylRRvV3XScvInKkd4iYb0rd9O8wV
         M/BGlh28B7OH0bYNeQzgaQ2jOLfLuY95T2xLQ51X1kDqdv9xza8+98FW5pYzo5knm2Q9
         QiQDzqekx083PQknVc4k9SFoKXebLQuQet50EP+gSKihH+JORku9wz4kWSYEW2srAEt0
         nUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=+QIEF75uO0GLOFqYRwqSPaVuA4mG7wzFnBp9nRMxxBA=;
        b=FlCL6QAXtVD0nnC26kgP/aWCAzJHlJyM5ma15Ui+Q/gRXBSbCL103Nvdg2n2klWmar
         ZOcPoMWqy4lMZL6mys/A0QZtPWId/nJ4HmWqjjQeTdALWYb3HsRc7u8rTLYSbpqJga/v
         zUoaU8ONEb+AIozC+HbID453BraxXoleT/H7XYZJ5NFzy6AfLP9oqVZjh4GGIEyydyhY
         WFAW3S1t/L3j30Q/jx2ZyhW/l4jccDaRR6id6hVI1aNzLzMG2XoaAgP8SmvnP4rUyiJE
         3qx1tRDx2fLjJJ62mYWha9J5X4wW40onV0rwXupQxI35ffJy7B+mY/0TAWjCTawWvMUE
         8A0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vDGLZsMG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z186si7362608ywd.307.2019.03.13.06.33.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 06:33:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vDGLZsMG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:44686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h440j-0007ju-LV
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 09:33:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h43wY-00054P-F3
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 09:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h43sK-0001Ji-Uq
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 09:24:53 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:36971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h43sK-0001Hh-1r; Wed, 13 Mar 2019 09:24:52 -0400
Received: by mail-ed1-x543.google.com with SMTP id m12so1508454edv.4;
	Wed, 13 Mar 2019 06:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+QIEF75uO0GLOFqYRwqSPaVuA4mG7wzFnBp9nRMxxBA=;
	b=vDGLZsMGZxQaSbpnnu67gweU8bUxBl4R1qA6chGnQd5lJz9nLJ9FR0vVZHaPW6kky1
	V6LmKEwUoQYQNHg7jmNOHf8Xx24ci3yrR6Q20coDZf5FTY0ojpDrm5q8jhb88Dk667Fj
	96s8SK8Fsoylqfe5VNB+bAQOyb+5emFxHl0eXdogy8df6R/awUpM4nWHnzxnuUola9QP
	3GU/OaImHM0m4o6EPQofsfyTxxpJY9F5canENx3AqToin+mYK8lxeUMJFzQ9QQ8QyzjS
	2QDqd9FtT9LbPJZ9AF1j5hMJtMrHkL31HsgzGLjSYRZRJ4EkyYrhzxmy3AbtvY4X6z73
	uA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+QIEF75uO0GLOFqYRwqSPaVuA4mG7wzFnBp9nRMxxBA=;
	b=Um2ikfYh2UWsjw6ajdxCFe7EfgbyWkqP2DZrUJmIMAn98a8GRy4jXa2nRDPWHf0qEO
	EIszZBMHR/Z73+VYL7N9M2HpN3ZdFPJ4DOKwDLYwneRCGe73LTVxab4uPRVaxRTeALCs
	LD7w3gBed/Lx8uQLUZvqG3FKD7HS45OD4oLDvbGK4Kg/QPrC9jEIKYL+T87+k8J0ljJO
	k1M4h84cwVsOHOkFOuZEXYECkv5LP11DoeKtpIr1uiwg/cJRDIoVAgUWKaDBFyVCZmH1
	TSibdHlR1GsVwt8BtmqigF8Lad93ZsoEvI6F5xiu25kc9CKr3ktoxLwhFgdyhBqYOhYz
	MzzA==
X-Gm-Message-State: APjAAAXX41p9BmCpXqTFUvJdwb3YHHecZEasoGgEjoNqS/2DVrWx0f5c
	42ARGgDVhJ4dr/3STgp35R8=
X-Received: by 2002:a17:906:1e51:: with SMTP id
	i17mr7528818ejj.195.1552483489945; 
	Wed, 13 Mar 2019 06:24:49 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id z9sm438385ejg.36.2019.03.13.06.24.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Mar 2019 06:24:49 -0700 (PDT)
Date: Wed, 13 Mar 2019 13:24:48 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190313132448.4ui2hpxovh76wtgk@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313133039.516f3a60@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313133039.516f3a60@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-devel] [RFC PATCH 0/3] Extract build_mcfg
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /hBn1ACH6etW

On Wed, Mar 13, 2019 at 01:30:39PM +0100, Igor Mammedov wrote:
>On Wed, 13 Mar 2019 12:42:50 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> This patch set tries to generalize MCFG table build process.
>> 
>> [1]: use acpi_get_mcfg() to get necessary information to build MCFG
>> [2]: remove an unnecessary variable mcfg_start
>> [3]: Extract build_mcfg to aml-build.c
>> 
>> Wei Yang (3):
>>   hw/arm/virt-acpi-build: use acpi_get_mcfg() to calculate bus number
>>   hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
>>   hw/acpi: Extract build_mcfg
>
>I'd add ano more patch on top
>which converts from packed structure to build_append_int_noprefix() API
>

You mean get rid of type AcpiTableMcfg, and write raw data to blob with
build_append_int_noprefix()?

I don't get the benefits of doing so.

>> 
>>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
>>  hw/arm/virt-acpi-build.c    | 27 ++++++++++-----------------
>>  hw/i386/acpi-build.c        | 36 +-----------------------------------
>>  include/hw/acpi/aml-build.h |  6 ++++++
>>  4 files changed, 47 insertions(+), 52 deletions(-)
>> 
>

-- 
Wei Yang
Help you, Help me
