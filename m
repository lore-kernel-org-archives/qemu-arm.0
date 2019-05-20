Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp542707wrg;
        Mon, 20 May 2019 12:21:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIkDH6Ie4TCCEbZGRg7e5uQ4gSshEeSixZgULdlMQezTBcsGgmhzYovGTok2SDnkLHXror
X-Received: by 2002:a17:906:2481:: with SMTP id e1mr60425124ejb.22.1558380112331;
        Mon, 20 May 2019 12:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558380112; cv=none;
        d=google.com; s=arc-20160816;
        b=HL237Yev6Ol/eeZWMsPXwa77ma6fRcSO1B5oskBB3ilKjjgJx/PoiJXq8v9UdPnXfc
         jFlnIhDxf1y2jzIth0DpnnmfeRIo00oHO2b4cmLSkTaBpUioBtLRldTEDz30gup2MvQO
         D+TUwJaoQJcA9+3vWB4kIZGZD4gPQowpT77TlT+WmGiQ6f6CaVT3yiVWtWvfP/9NeCIk
         oUfZmDiUpT4xJeTn0LCvo9NMQl0hl4nOYhTuLRTfkSC2suXxcMLBdpDs7URQ1RNlx9je
         Bj0Odf8s4A2kP0FALzsli1KoeFS9eyTeTCfhk2fMpgTIniewscaXrQfx0rtwgjTzGVfU
         9RLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=QklsUZET3tO3jWncW/+Rk2BzNKJAxpf0J57VArZhQkU=;
        b=dwfWJKc5AFAKvC13AbQGsLqQOLDUW7B3gFTNzWMA6enZA40syyXPG+e59GZYP7lTPG
         SvtXn8yQDEssoLL6Efbq8fcnM9rTvBRlkOVZdk5iAoE/MkeeaRUiXorvkyNTD3vs8IaW
         PxV5InF8qawpoceBt6FIXRpWuR8bQOwkM+r8u/4K02J5631RigNcOfgI/8ME+Q6e0gD3
         UqygLo9sMpPZ2ViYQ+pDDmSm5GFluY0lwEiDeDSGDwVOJTR6ts1a5BAZ0mylBa5eZNEq
         p+bmLK8dYPHPlqWX3C6tVTKB97vqp/EQQNkV5oisCN6vKEMSWB+5lMgDBkd33COja9Xv
         ivpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si1828627eji.362.2019.05.20.12.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 12:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSnr5-0006Co-77
	for alex.bennee@linaro.org; Mon, 20 May 2019 15:21:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hSnqw-0006Cc-Qq
	for qemu-arm@nongnu.org; Mon, 20 May 2019 15:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hSnqn-0006wV-5Z
	for qemu-arm@nongnu.org; Mon, 20 May 2019 15:21:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hSnqm-0006vS-BT
	for qemu-arm@nongnu.org; Mon, 20 May 2019 15:21:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98917307D855;
	Mon, 20 May 2019 19:21:25 +0000 (UTC)
Received: from [10.36.116.113] (ovpn-116-113.ams2.redhat.com [10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27EB460BE2;
	Mon, 20 May 2019 19:21:22 +0000 (UTC)
To: Cleber Rosa <crosa@redhat.com>
References: <20190520174758.GA31098@dhcp-17-231.bos.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d22df06d-7fdc-0eca-286a-d411f87c4707@redhat.com>
Date: Mon, 20 May 2019 21:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190520174758.GA31098@dhcp-17-231.bos.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 20 May 2019 19:21:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [BUG] qemu-system-arm/aarch64 QMP hangs after kernel
 boots
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SvTCoPfVSFrL

Hi Cleber,

On 5/20/19 7:47 PM, Cleber Rosa wrote:
> Hi,
> 
> This is just a FIY about the following bug report:
> 
>  - https://bugs.launchpad.net/qemu/+bug/1829779
> 
> And add some extra clarifications that I've tested extensively the
> behavior of other targets (all that have a similar test under
> tests/acceptance/boot_linux_console.py) and none exhibited the same
> behavior.
> 
> Also, because qemu-system-arm and aarch64 sometimes fails on the very
> first QMP command, the regular boot test sometimes will hang on a
> "quit" command that happens when the test run its "tear down" and
> attempts to cleanly shut down the "vm".
> 
> Let me know if I can be of any further help.

Thanks for reporting the problem. I hit the problem recently with
device_del commands which did not seem to get any response on guest
side. On my side, this happened erratically.

I will try to reproduce it again.

Thanks

Eric
> 
> Thanks,
> - Cleber.
> 
