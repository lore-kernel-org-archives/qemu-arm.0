Received: by 10.25.150.194 with SMTP id y185csp2487962lfd;
        Wed, 23 Nov 2016 02:34:51 -0800 (PST)
X-Received: by 10.55.114.70 with SMTP id n67mr2135262qkc.185.1479897291238;
        Wed, 23 Nov 2016 02:34:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r186si19006292qkc.41.2016.11.23.02.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 02:34:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9Ut7-0006Pk-V8
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 05:34:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1c9Ut4-0006P9-LC
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 05:34:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1c9Usz-0008WK-OG
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 05:34:46 -0500
Received: from mail-wj0-x244.google.com ([2a00:1450:400c:c01::244]:34848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1c9Usz-0008Ve-H2; Wed, 23 Nov 2016 05:34:41 -0500
Received: by mail-wj0-x244.google.com with SMTP id f8so713039wje.2;
	Wed, 23 Nov 2016 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=7tV0SL7BxTaySbP9veKTAlbCu/nOlzaJUMIRw/+0eDw=;
	b=p1fVQXprNohz1Wk9wwftxS9Hg0017w2/DqAUsU0sP+uoZGTZzYm4EW3muzp+522k3+
	3G5sxiNJ/FZ4+en5yOZYlzDre6Mi0XfbB40G4O5n84HfscWJZBHjtkab1cliKlCQOldU
	ohyOtkYsY7ph5QxGEHIKnScVUT2ezcvCBOhUHHHIyuNdZwfeEh4eSG4l5PLm0fQQ1qDH
	N265xQnvsxNaQJCGs86EsJJvZASrsRkA0vt5KdFj1diDJOwdtrPprRquFRu/2lKo/PCh
	mBWnSIaSc6QgJHI7PZZCtEclORavrhyypq5cxBn83Ho3Xf+U0oYoGx6BsdslpY/ckz9Z
	A/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7tV0SL7BxTaySbP9veKTAlbCu/nOlzaJUMIRw/+0eDw=;
	b=AhCe6/emX18GwlrbNdpp60k9oA0Xg88xvmneV/wIqQQam8UHv2qnZUYG85YMrV1Kll
	fv34i5zxHl5fvrEDpnF7yHigBdY+pjkXxm9ndaGJjSaES1I8q/z0QopRi8QZFcTNHDar
	Pa3BMUpxTsw/zPIGHKNDAaRLL/k+4t1fR7IW7C1Qsq2JBchmBeK1awMTJ7bAlzZ8LRnd
	DIjlcO43mqRdpWsSbReq7wlnSOqyfLZ4czqXUg+xcbphvPqh25you5Y86IDFDogGb//h
	j3KpR9JP6u73+TfUH4SjmS25PHUAa7odwn/hm4YsK7WBoC8ShJ2D/0dhA+NP1ItfvOXy
	0YIg==
X-Gm-Message-State: AKaTC02RcKDiZACifzVzcRjoKFJ1pM5S7aIULxwuFJrexAI6FfC/xom+7+p/fuXzXe70Yg==
X-Received: by 10.194.165.136 with SMTP id yy8mr2947841wjb.14.1479897280319;
	Wed, 23 Nov 2016 02:34:40 -0800 (PST)
Received: from [192.168.10.165] (94-39-142-71.adsl-ull.clienti.tiscali.it.
	[94.39.142.71]) by smtp.googlemail.com with ESMTPSA id
	gk6sm17778925wjc.46.2016.11.23.02.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 02:34:39 -0800 (PST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
	<debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
	<3888651b-fd60-e827-a9f8-575a8f01be72@redhat.com>
	<1479853887.11116.95.camel@au1.ibm.com>
	<6d4e34f8-4b0b-85f2-93d6-6f0b3e2e7fb3@redhat.com>
	<1479856790.11116.111.camel@au1.ibm.com>
	<1761115996.1384447.1479894181425.JavaMail.zimbra@redhat.com>
	<20161123100558.GW9606@toto>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f392c106-0d26-e083-14bb-449fe973a03f@redhat.com>
Date: Wed, 23 Nov 2016 11:34:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161123100558.GW9606@toto>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c01::244
Subject: Re: [Qemu-arm] [PATCH 2/4] qtest: Support named interrupts
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@au1.ibm.com>,
	Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZiJpIDxrC/xQ



On 23/11/2016 11:05, Edgar E. Iglesias wrote:
>> > 
>> > But in general, the idea is that the qtest acts as the CPU.  The test
>> > cases can control the passing of time precisely, and they can _observe_
>> > additional events (such as interrupts or GPIO lines) but they don't inject
>> > anything that the CPU cannot inject.  The reason is to make the tests
>> > more like small programs.  It does mean that you are limited by the
>> > connections of the board.
> Hi Paolo,
> 
> At some point we added support for using Qtest together with emulated
> CPUs. In those cases, Qtest acts more like a test access port that can
> access stuff within the VM. It can be used to test devices in combination
> with guest SW.
> 
> IMO, raising and lowering signals is useful and extending it to support
> named interrupts seems like a useful feature to me...

Fair enough!

Paolo
