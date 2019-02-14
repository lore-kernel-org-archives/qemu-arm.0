Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1264433wrp;
        Thu, 14 Feb 2019 09:52:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibr2P/cgUq4xWRk6Oi3gixvKjPq1NYYoRbTrQzNLcSAnSS6fQ3LWxnmVmema6pJ8BHMm1vj
X-Received: by 2002:a25:5e03:: with SMTP id s3mr4338323ybb.8.1550166744737;
        Thu, 14 Feb 2019 09:52:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550166744; cv=none;
        d=google.com; s=arc-20160816;
        b=sl/hOyJ4NVkWd14P8cf2PBg0erluVDBiUGEinTpT+0GIKCi05SNyiEpcCiszD1QeFT
         bm+ekGXunzaIZizhGV1k7w0BbpALp9kYyz4QUF8ZHSwIwIUBXjkFFfepLkEcR98lhrVf
         k5l+MGCGoyQAyRe7GnPh5xPfMo2zmOK1B5KG28sZEmXkoHZp62sOBZRLdp/8V2qI0vxu
         vbeBhAcJF6b9UHShMki4x84lpC1yHy1nOyMRZ8uKukXGiaiTXwq0V/fbAlZU56SnjMaI
         z0Mcp+qcIllmHFOz3JnDVwMMSjCEkTUR3ncRkc1tyNADMC3FCLz40Oaly5Q9BBTMK9XD
         bSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j86o3gnqCpbrEuZWMLxbQ+vjMcX8WN8+0JQemZSCQT4=;
        b=UAxC4BMw2TDyypuVnE+lADgpBytI6JBkRl1JhVqTqJI7s4phu9RsEzNYWSm1ZEWpJL
         giruhLg9v+8doLkvivvsN7tB25+gDWOlmccW4KwVmVj3SqtmfvELwhqll8ZdGZHcpu6e
         b8/WWRThKOUgcwmRJ2d9bkQaEXykK8ydYIp7qT5G0J0gVuJ9yXyyXqp9YFUp9N0YnnPX
         Am8gE7LbajeoPL8gKrQp4Q/TGkTs4Zr61YNfAY5UutBIq/taWvRIuMpm51rFNREwFaO0
         Nl0hPEbnox/R9eaURGXjtSLEUj9IQF3jHY27opci1sTOlF/h5lh+gcoZuv6C5TSLDBhX
         IzzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="M08P/EI4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si629514ybk.319.2019.02.14.09.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 09:52:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="M08P/EI4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guLBQ-0006yC-5H
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 12:52:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guL4O-0002i1-7E
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:45:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKv9-0002n9-Ms
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:35:36 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guKv9-0002m9-Gj
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:35:35 -0500
Received: by mail-ot1-x342.google.com with SMTP id z19so11921889otm.2
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 09:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j86o3gnqCpbrEuZWMLxbQ+vjMcX8WN8+0JQemZSCQT4=;
	b=M08P/EI4Q59JLRt+W4/dw2GlHC+ccLf3NcA/6OJ1G+B7SFvRCoapmC1lqwpKS2Efdj
	ym5/djls1wklKIDkhEKse16EFnoM8vKdbVkVTi/+DmikpoDo89TDM6L+SraOkEztpPwd
	XJTx8X0j6cciJBSIxgkIECNIROn1rZJkl1Nrd6VQ16ep5InCTW3SJRZdSZt7DDODzb++
	p1W/oLQKGlyebYqj7USX0TTNdRLapBXJaK2iPy/GyDOTdITQF+gvhfGRo8c1NpVHAwQd
	mkvRzKJdeYlyo2GEwMJHQxAEVFq+B7CMYy6fmmYOnQccrKK2i3/V9I3N0kW/4/TBar7y
	tEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j86o3gnqCpbrEuZWMLxbQ+vjMcX8WN8+0JQemZSCQT4=;
	b=udWLW7Hsomxz1VX3QAcKysy8p2xwN4a4IOCnGP+fm7iWBSDshSopderFCQ6EYTBvcP
	l8yMX8e8C5N+2ALH91VRl6VSpQaxkkGaiPERoAqj5Gc2NMoAWcNHk6IpL0voi8U/FDEh
	hqH0ssAwZo58oe6bybnG8zy6BKkzg0AsrHWxPTEa5syjTikqcxam3P/+SbEdr4jQz3ls
	kPmJaZoa0dveo/9Q8PDB/I3R+m9dkKypo3jZLYAVN42LdOvyLJ9FbH+HFaBSJ8zEBdMM
	dn9AHKTm8tC/PGtdqNo43/LEdxveNd7yrErj8GhvkFVnAmLirtCCouQmgH6AxBjs9w7N
	K6vg==
X-Gm-Message-State: AHQUAuYjJgTP7qfb/wTNJca71hqYepwLakvC9ChlutstQTygRQ881jw2
	LhC26rrScvTqVcQMl6G7WVipU6OfbPG4V5o6r8yKKw==
X-Received: by 2002:a9d:7d18:: with SMTP id v24mr2995154otn.352.1550165734450; 
	Thu, 14 Feb 2019 09:35:34 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 17:35:23 +0000
Message-ID: <CAFEAcA9QHxm7ACYBnKibfderjfgg+9p+xHZZB4QmMHk26BqTuw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v6 00/18] ARM virt: Initial RAM expansion
 and PCDIMM/NVDIMM support
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 60oPQ+iTsX9e

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
> This series aims to bump the 255GB RAM limit in machvirt and to
> support device memory in general, and especially PCDIMM/NVDIMM.

> Functionally, the series is split into 3 parts:
> 1) bump of the initial RAM limit [1 - 10] and change in
>    the memory map
> 2) Support of PC-DIMM [11 - 14]
> 3) Support of NV-DIMM [15 - 18]
>
> 1) can be upstreamed before 2 and 2 can be upstreamed before 3.

Hi Eric; sorry I haven't reviewed this series earlier. I think
that 1-10 are pretty near to ready to go in; maybe the easiest
path is to do a respin of just those with the review issues fixed?

I'm a long way from being expert in the PC-DIMM/NV-DIMM stuff, so
I'm going to be reliant on other people to review those parts.

I don't know if your series needs anything from linux-headers
which isn't already in QEMU master after the update to match
5.0rc1 -- if not you could drop the header-sync patch.

thanks
-- PMM
