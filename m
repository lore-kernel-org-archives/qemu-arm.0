Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp425855wrt;
        Fri, 5 Oct 2018 06:50:21 -0700 (PDT)
X-Google-Smtp-Source: ACcGV621fo9jElz9U8sCcr8a9xbWqBvsl0bo1SEfJl9w9OD+DQuN+6CxyDST+T1Wgf41ceq5aCSh
X-Received: by 2002:a05:6214:8e:: with SMTP id n14mr9434593qvr.90.1538747421260;
        Fri, 05 Oct 2018 06:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538747421; cv=none;
        d=google.com; s=arc-20160816;
        b=i3+andk1GURnyUHpBK25y7fQf21ff4TPkZU9ztMzzo8khSefVLZhb9BavfhRI4+yxj
         nb4wPbYeJ2aBbYCO4xeK8f+aqg/A8hpL/uw7xb2J/KnBb3qRFzqdlv7HLOz2oZ/LNyn5
         96FDl8gBWysHBVQOseN8Utwm2nvRMqZKHUEZI1TgkIBil+mwO6/FLkTfmDFxGEdh8Zvl
         96MN9H5FQK35IbZr8BonwQ8QoIb6et4V/RVeosHm2ua/tNlBtAjZEQ090JPmQOSyb7kF
         Hcl6HgJRNLXcnOAf/SNW7sW0Z6ANUQzmJknIJsI0VE9TjZ1S32SDwl3ANRhD5TgF5nB9
         d0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=GgHCoJPfYf8aWw4iOkwbrGxNlxZ3+vEZPgdKX6TLMmQ=;
        b=ufJQKfAU3KVJrZGgynlUkKlSqLexoMB4X8XN31KYCBRoyzJuyLjcwkc7JANlSay8cr
         XER/XD+JBV+ih4AVoZYcjQ16lCXY+CzGPQ4/yYeZaTFsOTKmh43iEYic2YUUkguCrf1W
         j/r145tM09UZDkrskRa9J9yZNkVS66s0VQFbhUzI2kRksxlfkdngnfPtJo9Q77w2Kk2h
         vEUMexd77A/c9CFqux2yJFVoMfnliAALFzRdoycLmLWLduqbCX3B1xPjLlV9mcogHxMP
         qweNIefNStxBAwRfnk19qOwHkO0aCIJlMGG8y3Nca/C9DUlq3FHVXlDNaoXROdgIUils
         ZGkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r72-v6si1025941qka.138.2018.10.05.06.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 06:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8QUm-0005pG-Px
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 09:50:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QUc-0005pA-4O
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 09:50:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QUX-00033x-6b
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 09:50:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40239)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8QUW-00033M-VZ
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 09:50:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id d2-v6so9204645wro.7
	for <qemu-arm@nongnu.org>; Fri, 05 Oct 2018 06:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GgHCoJPfYf8aWw4iOkwbrGxNlxZ3+vEZPgdKX6TLMmQ=;
	b=e5Dt+ZAbevE9hJ28pmkptbMXqeUGvoa5TCDNPODuTRvaoFgib1QUxAnpa+F9KR12Uz
	AUsRHKEnJgqkQtQOeBCb9yxbC5GXKzalhHufUnXF4LjivoP9NKKc5ZecH20LqBBXfwXU
	ZVtDGyvMqYO8QRjmop32lAiW21UKqtFBak4cp1jHniMfQYP91A36zITs/nAetxNiWwis
	6MktXncH2pwj2vp5x8BT2H30qX8v0inprjr/Un5pSNZGZ1k44RKD6/hz15Mj3/Xw3A5L
	TUx5YuDdNZRWCT62QgV1igDKfeAdkMhVgmqpmlS9BgZ0vNs8eFnGKzRc7TFy9Je3SOTP
	tooA==
X-Gm-Message-State: ABuFfoggrKBqXsYZjARm4ZnwMOQs+xVzTfhZvXxfrAjRMIoKVtUd5/zY
	e1/TL2Qxncsre4lUDvQYiwOPyDohe2k=
X-Received: by 2002:adf:edc2:: with SMTP id
	v2-v6mr7813224wro.208.1538747403552; 
	Fri, 05 Oct 2018 06:50:03 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	n11-v6sm9756149wra.26.2018.10.05.06.50.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 06:50:02 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
	<CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
	<33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
	<3d459f14-b701-02b6-d231-fc48c509640f@redhat.com>
	<20181004195225.GV5738@habkost.net>
	<CAFEAcA9tT5iFAo5DG=3dyBYNjBVN9u2qEK6Bo9Rf2MAPMBC6bg@mail.gmail.com>
	<20181004215352.GW5738@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e4724ba3-4dbc-7b79-b520-96b69be1a73c@redhat.com>
Date: Fri, 5 Oct 2018 15:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004215352.GW5738@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put
 APUs and RPUs in separate GDB groups
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
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sv1x96jJqj9E

On 04/10/2018 23:53, Eduardo Habkost wrote:
> On Thu, Oct 04, 2018 at 09:01:09PM +0100, Peter Maydell wrote:
>> On 4 October 2018 at 20:52, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>> Changing the object hierarchy based on GDB groups doesn't seem
>>> right, but I don't think it would be a big deal if we have the
>>> board code explicitly telling the GDB code how to group the CPUs.
>>>
>>> If you really want to do it implicitly, would it work if you
>>> simply group the CPUs based on object_get_canonical_path()?
>>>
>>> If a more explicit GDB grouping API is acceptable, what about
>>> just adding a INTERFACE_GDB_GROUP interface name to (existing)
>>> container objects that we expect to become GDB groups?
>>>
>>> I'm not sure which way is better. I'm a bit worried that making
>>> things too implicit could easily break (e.g. if somebody changes
>>> the CPU QOM hierarchy in the future for unrelated reasons).
>>
>> I don't want things implicit. I just don't want the explicitness
>> to be "this is all about GDB", because it isn't. I want us
>> to explicitly say "these 4 CPUs are in one cluster" (or
>> whatever term we use), because that affects more than merely GDB.
> 
> We already have a way to say "these 4 CPUs are in one cluster",
> don't we?  That's the QOM hierarchy.
> 
> My question is if "the CPUs are in one cluster" should implicitly
> mean "the CPUs are in one GDB group".
> 

What about having the container implement INTERFACE_CPU_CLUSTER?

Or even cleaner, add a TYPE_CPU_CLUSTER which is just a container for
TYPE_CPU[*]?
