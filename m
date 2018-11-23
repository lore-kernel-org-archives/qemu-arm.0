Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1607114wrt;
        Thu, 22 Nov 2018 22:38:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XCs/9x3eZNdBR9VOJC/KdXbZUhidwjk7j/mHyKgc0W0EqFPiOJ6ViRw2YOy4ra3FTVCazf
X-Received: by 2002:a25:8507:: with SMTP id w7-v6mr14579884ybk.390.1542955087683;
        Thu, 22 Nov 2018 22:38:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542955087; cv=none;
        d=google.com; s=arc-20160816;
        b=r4U1Q6+q6sknOJTR1Z3WNliROj3GUiBv9S1+DcTtlbP47HCei4dwp17M4C2M/E8XKv
         Zq7qtAD01v3Z/xSuZTmc2jb4QAFYM2vPzH5H+XHa4G1P7YrAwyEnf7zwMquzqBrPuWFJ
         HZzKAcvQgL8nX5jSE2Ubkr4J1bQBdmoJOfiIbJSvtiueZmhduX1ZDyJxBo+V3hthaJ2x
         tCnqqHVzbd4GKS+pwp+DIIq5oMeH0bBzZQf5uFaPKHJVu99tly3httGAQumMkHQPOaAl
         p7xPRyCoYxGNMoEU4TRdoWqn6ze5+PdR90d8ooCCifG30BOnAag8Y6KNwFENWIB+DG2n
         VI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:from;
        bh=FhQpNfNwMXQRdSbcT8pJivh6QNcw8ejhiBndJwzMTHc=;
        b=N3mFo6uuaGxwRHtbEl9fdVJhnko+q2NqLnVwTtaw6BLl7DBvgrsrQd//s5DxINvaQN
         85SjaI8MLmn247AdIV/dXx+vmQKQqIkrX4+GNZOIe+EvjFLwAwYw3sOXsSsp3pjvArUQ
         5PAV0nIa183Li2DjiR4UxwlnAyHAWXEsXfYgi+BWoRx5SeWL9fDK60FD7i6e76sxCCIm
         fnQBVPQ+V297ValRyWztXuz6l9rNjwCMakmVvhrqivaJHXcytNbe6SL4SW99ox7XUOtw
         HOrjMvRn8JFOqM64mNm3JFkMPJc30AAvvHbSg7l6cgyD7Qtj45odwmtnBPiXDGNJXSP3
         XR1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m67-v6si11387402ybb.98.2018.11.22.22.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 22:38:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ56N-0007eF-5V
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 01:38:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Muhammad_Bilal@mentor.com>) id 1gQ2qb-0000vv-BG
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 23:13:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Muhammad_Bilal@mentor.com>) id 1gQ2qa-0003s1-It
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 23:13:41 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:60891)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Muhammad_Bilal@mentor.com>)
	id 1gQ2qU-0003ow-LK; Thu, 22 Nov 2018 23:13:34 -0500
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gQ2qQ-000137-JD from Muhammad_Bilal@mentor.com ;
	Thu, 22 Nov 2018 20:13:30 -0800
Received: from [137.202.156.252] (137.202.0.90) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 23 Nov 2018 04:13:26 +0000
From: mbilal <muhammad_bilal@mentor.com>
To: <qemu-discuss@nongnu.org>, <qemu-arm@nongnu.org>
Message-ID: <e8dae726-8853-4e44-1eb8-b9cfb0bc44f2@mentor.com>
Date: Fri, 23 Nov 2018 09:13:08 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
X-Mailman-Approved-At: Fri, 23 Nov 2018 01:30:52 -0500
Subject: [Qemu-arm] How to select specific qemu net 'nic' device
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jrK7676GY1nf

Hi,

I'm using qemu emulation for xilinx zcu102 platform, this board have 
four networking GEM0, GEM1, GEM2 and GEM3 devices.

To run network demo on this board *only* require GEM3 device to be 
configure while other GEM devices don't need to be configure, that's why 
u-boot and other RTOS only configure GEM3 device.


QEMU is enabling these GEM devices  with networking '-net nic' option 
and QEMU consider first '-net nic' option for GEM0 and second '-net nic' 
option for GEM1 and so on. that's why if need to enable GEM3 network 
device we must need to give following full command line options

-net nic -net nic -net nic -net nic -net user, ...

In this way all four GEM devices would be enable but first three 
GEM0-GEM2 devices are un-configured and useless. In our case QEMU is 
being *crashed* due to trying to use these un-configured GEM devices to 
o send/receive GDB breakoint/interrupt cause. IIUC QEMU uses first 
device in the -nic loop
i.e

qemu-system-aarch64: hw/net/cadence_gem.c:921: gem_receive: Assertion 
`!first_desc' failed.



My question is that, is there a way in QEMU to only select/enable GEM3 
device while other don't use in emulation ?


If there is no such option to select specific device then what do you 
thing, this shouldn't be in qemu?



Thanks,
-Bilal

