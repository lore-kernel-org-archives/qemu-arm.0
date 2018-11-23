Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1603765wrt;
        Thu, 22 Nov 2018 22:33:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5eV7xzYFEmudw59+Csz1zc4CqblmiXrim7+yYuXoCrpSjJt6CbBRiEcxODSou3VT0lRGPsq
X-Received: by 2002:a0d:f845:: with SMTP id i66-v6mr14976887ywf.160.1542954832380;
        Thu, 22 Nov 2018 22:33:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542954832; cv=none;
        d=google.com; s=arc-20160816;
        b=eHIq7CM1hLY7hGd000hresuW7DBEbk9klTLLkE30t32NyJyXQR4sohA/GQAhYBn7u9
         +zZXpFNoSzomAs1G2Cdlv6rNBQRzCptFm1nxiAwPRaM54Xuoz/oO2pwMf45Kw9rgVNUD
         I2Lr/b+ET60VIThlMo4riXxMoIy1iy3q6IaUfM8zH1SK/4w6C1RuH2IQYJ/xe2eljw6K
         OCo7XrzawOm4/gNH56sEq5YWMYbpA2sNvGlXpvFdGqLYdUnOkFj/OLNiFgekDMTfUFPB
         TUItJM85pjD1jEMKeWE24JpEamT110mUN3TgR/u3/DRHPi/DCG0vxT6oUYLcPX2jNuU0
         NyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:to:references;
        bh=o5B89dwzMacT+rfdIRYhHZ2bWxULoBlW0HBpdJiQFrM=;
        b=w8M0rQ/pjtecCfavFJF1aU1/vRmbtPbzzV20u4+A20CdpV0d7KA7AbynD0bZfnM4gd
         zm91qvQABvfjU8ZxIAE0odYiQUrfcigymDjohWgr946KdFH9uF0Ip3f/bDCZpn/7uzNn
         dxakr3P1rkILJJdcU1q1ahg2BHCM8XNiGDUBeCkWeSzpTVROOHEBvxUMOkj+fOcgZbJT
         Njpf3YQkyyYuqLnZ1fJvd2aiV1TpD1iD+j2OrH+X206IXjF7BEHbhlLqrEDubEggOq0D
         4rIkYbYlfJpGKhV5XZTHPltxQn+vmHPEkT74Mqys4sBLDcC2KPZu7jD9yjAo8S6HksdV
         xozg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j188si6634166ywc.104.2018.11.22.22.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 22:33:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ52F-0004Zm-O0
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 01:33:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Muhammad_Bilal@mentor.com>) id 1gQ4K6-0001HD-6q
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 00:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Muhammad_Bilal@mentor.com>) id 1gQ4K5-0000xU-9J
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 00:48:14 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:61947)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Muhammad_Bilal@mentor.com>)
	id 1gQ4K0-0000lL-Pt; Fri, 23 Nov 2018 00:48:08 -0500
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gQ4Jy-0000pz-OR from Muhammad_Bilal@mentor.com ;
	Thu, 22 Nov 2018 21:48:06 -0800
Received: from [137.202.156.252] (137.202.0.90) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 23 Nov 2018 05:48:02 +0000
References: <e8dae726-8853-4e44-1eb8-b9cfb0bc44f2@mentor.com>
To: <qemu-discuss@nongnu.org>, <qemu-arm@nongnu.org>
From: mbilal <muhammad_bilal@mentor.com>
X-Forwarded-Message-Id: <e8dae726-8853-4e44-1eb8-b9cfb0bc44f2@mentor.com>
Message-ID: <dbddab5b-650d-546a-8b79-9ae16f4d87c1@mentor.com>
Date: Fri, 23 Nov 2018 10:48:00 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e8dae726-8853-4e44-1eb8-b9cfb0bc44f2@mentor.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
X-Mailman-Approved-At: Fri, 23 Nov 2018 01:30:53 -0500
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
X-TUID: Yf3Ho2LrixFJ


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

