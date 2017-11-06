Received: by 10.223.150.237 with SMTP id u100csp3163982wrb;
        Mon, 6 Nov 2017 15:22:05 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Q+/ukfvx9ZYrhS9pNBJbSYs30BDeT7RhbyyOkZCxE8pa9rhp+dMMFrri4pVEpxikAsFl1X
X-Received: by 10.37.199.134 with SMTP id w128mr10747428ybe.21.1510010525207;
        Mon, 06 Nov 2017 15:22:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510010525; cv=none;
        d=google.com; s=arc-20160816;
        b=LN4vO2mKPXTGDdywPU79A5NjL7BMPNG8arKymC2lbagjPToi0DWykQ6JVj5uK88Q9Z
         SGpyUHmGbINVaHqv6chIMAAdgPBWNX+v2V9U6PzPaZsaSQD2wga2BeVnTeWZI75Wj0Fg
         mxRmiSNJKlxak4MFWmuKRi57bg5iDQxq8zJWT+noD3NYkruZCkrcIQFSRrFp7U//eUm4
         xXZhnlHHb4S1amwQvL0UrDs/RC5tWv0OXhEZzBSS+Cs0D9ru2Dls2D9f2F+Zch6vggiq
         f/HfrZ5YrTbngQCxK1eMw3HMZ8kVM2EUtmgA4zCLaNXPKVzD8mo4B/tha5SNBixAWFDB
         eiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=C0oKx2+PFyqCv5eCKhHdwQoVRnMVdOjoWPC6X2RqZzc=;
        b=mbqW9z/iFYdJOtNv20h0JfBL91BMz5pmBnI7FJl2ASljmgGnUryvNuEYRhh1bYI22j
         9JvCU2DeDa+QhMorZKnsgHoBAhH5WrP0jwCyt2O1/HEPdtPQYxuOl/MqIFqupXHHAV8d
         RXIgrShO+JSTj1xT/sqhmaakg2AJ3uZP6Pi1YCBRzHwHlsS3pnZAs8iZJlQ7TyfjwL2N
         TBn+WeWUMy1131+iOompoGdVBpTfYFaBV0jfda+cBQA+3k2yXZskd+pFTdUoTVJ5dF/E
         AeXmo6p7K1e84Ceqc+/mkweQRNXyUVjypXcxuGwXyeYdFwqT8CeEzH/TAyXIV5QL3Nxm
         kLiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=1iAj5IOt;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=jk6Fa7CH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p205si2917886ywc.291.2017.11.06.15.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 15:22:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=1iAj5IOt;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=jk6Fa7CH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBqiS-0005ne-LA
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 18:22:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eBqiG-0005ip-5X
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 18:21:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eBqiC-0006UO-LS
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 18:21:52 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:59501)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eBqiC-0006U1-Dq; Mon, 06 Nov 2017 18:21:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D757F20CDD;
	Mon,  6 Nov 2017 18:21:45 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Mon, 06 Nov 2017 18:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=C0oKx2+PFyqCv5eCKhHdwQoVRnMVdOjoWPC6X2RqZzc=; b=1iAj5
	IOtyfdyM3UkpUI5ydWVJCgYDkoI07axmYcflXPw0xbJTdSsWwfNLvZzbYOfDY1In
	FptuD5XtUYM1yJDmHGp7bswAZ/CtfObcBvkd9t36ryYsBEgr2Fc80rOwI7YDJ2pr
	AtYKnrEEOjf45/bN7h8k6KliyYg93QQJnKZ07Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=C0oKx2+PFyqCv5eCKhHdwQoVRnMVd
	OjoWPC6X2RqZzc=; b=jk6Fa7CH2dksvufhx5SbZHxSKUR9QG/LwFV9HigHUmmSC
	bEjgcEAaGsG29FXSLCdelNtmTj6ahoFyamGdIaqnhBcbTJTgU/cDJjTSbL39cDIu
	bqVyRD4hEffmO3Li9hqa2OHoN9yOhvv/44ptqVbGycWmxdBsN5X8j7PzUxsGO0ht
	BbyzCBaiY+XfSKmHxEDxzgNUD+bW0dgO3/X9LBoHtOrG06IZXTlo/BQ8sHMoxtE6
	Jwj86MiWPH/HAZiP8ZNYaBWgTYpsZ1KBnN8d3UETlJzF0k2dKTBTdpxNWxKJ4OiB
	c3UculqxjDxoz/RxR2sSaqVkO+iQAV1L1kMxfqYCA==
X-ME-Sender: <xms:ie4AWshgr8SIdqNzufQAX02JSZ0zyyO0ExfwWPjMl4iMuoXkTKtpsQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 99D6F7FAA7;
	Mon,  6 Nov 2017 18:21:45 -0500 (EST)
Date: Mon, 6 Nov 2017 18:21:45 -0500
From: "Emilio G. Cota" <cota@braap.org>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171106232145.GA25246@flamenco>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106215454.GB2152@flamenco>
	<CAKmqyKOSOHdpzfu_WMPWo6Mh_kfmYhem0nR=BD3_hUws0tGEww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKOSOHdpzfu_WMPWo6Mh_kfmYhem0nR=BD3_hUws0tGEww@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L/UqQTdtNUwR

On Mon, Nov 06, 2017 at 14:32:35 -0800, Alistair Francis wrote:
> Sorry for the silence here, I noticed these were broken just before I
> went on holidays but didn't get a chance to fix anything.
> 
> For the Xilinx case I was thinking of patching the machine code to
> sanely follow the -smp option.
> 
> -smp 1 -> Only create 1 A53
> -smp 4 -> Create 4 A53s
> -smp 6 -> Create all the CPUs
> 
> I see a lot of advantages in not forcing the smallest number of CPUs
> to be 4 unless we really have to.
> 
> I do see a nice advantage in being able to set the default smp option
> to something not 1 so the default closely matches hardware, but users
> can override that if they want to.
> 
> So for the patch below I like the default_cpus option, but for Xilinx
> at least I would like to patch the logic to follow the -smp option
> instead of force a minimum.

Agreed, honouring -smp would be the right fix.
Just note that since this is a regression we need the fix to
be in for 2.11.

I just took a look at the non-Xilinx boards. It seems simple enough to
substitute the hard-coded value for smp_cpus, but yet again
I see "Property" structs that I'm not sure what to do with.
For instance, bcm2836.c:152:

static Property bcm2836_props[] = {
    DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus, BCM2836_NCPUS),
    DEFINE_PROP_END_OF_LIST()
};

What is the purpose here? To enable/disable CPUs with -global args,
just like it's done for the Xilinx boards? Shouldn't we just use
-smp for that?

Also, note that I don't have a way to test these boards, which
explains why I'm reluctant to change board code. But of
course if board maintainers step in, I'm all for it :-)

Thanks,

		Emilio
