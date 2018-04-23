Received: by 10.28.4.212 with SMTP id 203csp3766474wme;
        Mon, 23 Apr 2018 04:36:23 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48aj7t7PY4Mdst3Auo+nCsIvr3204+QNbtL9hukMql/yzWibhTDImFPPpTb+TtxzJnj0jEM
X-Received: by 2002:aed:2565:: with SMTP id w34-v6mr23597249qtc.180.1524483383601;
        Mon, 23 Apr 2018 04:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524483383; cv=none;
        d=google.com; s=arc-20160816;
        b=B5kGzWWcajDqq48bBL/Z1NsHl16H14+ZJR6K+YnuabydhwjpErLPYpzsTgdmyPHwMY
         lMPujpAHex363/2pNdmUuT9s2D3Xx0rp9YSJb3U8G2m4iemEJaXH7hzIA3ylkBPgQ+hK
         K+sINlmFZ0/wtm0CQeR7ZL5djEkXRsBCiVnGl3mYsKeoesw5/AnKSTtRiftrZ/6+4c1x
         FqEyJVtlNnb87EbL72VpUjXP38Y3IQZFXxneEYjWv7SiZFD0lI26lrY3GivLDTdAPoS2
         Hzzu2h/KSAUbcerVPufLpDABUrN37ByWVJpeVgYJhsi3eDX+W9OqoHTYy/dKEA18gmHc
         9uCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=tNdcw9NiKA/iIGHzNBCPZJmlzdRmCfEH7m1HwxO3R5Q=;
        b=wbDD2YhDD+VYf9XHDP9yvtdqm19h+YQ3JfyMAxgxUcq7joucSIb+N+jABO4e/6/w0Q
         s1ZBHToCN9w0iTJGNfs+EwicH+LnVi2fnwLJvsHCoWg6lElad7eI32ajGScuB8pU08li
         reedCer23Tnfd2o0bZRLN1O2Q7j3C841dRoAlcFoyupkNjIRMnyKStw7fyLcRahBaLbP
         bOW13+cgwGodRkhKz2dSeTye7VXaejU2UW9a9wSVYDWaypmlOCcv5a09WVAGLhRoDu1E
         wi9mnJBushPFctf7oL43d/P2PdSDMYZBvcwlSFtOuV9kkne29NtlSJvMzA5c2FxZ80OG
         Ijhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s78si6466838qkl.240.2018.04.23.04.36.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 04:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAZlf-00064r-3o
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 07:36:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAZlP-000648-Ob
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 07:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAZlL-0005LM-OR
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 07:36:07 -0400
Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]:59368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fAZlL-0005IV-J0
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 07:36:03 -0400
Received: from player737.ha.ovh.net (unknown [10.109.120.53])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 1F7711A11BB
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 13:36:02 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player737.ha.ovh.net (Postfix) with ESMTPSA id EEB0EE00CE;
	Mon, 23 Apr 2018 13:35:56 +0200 (CEST)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20180423064020.25434-1-clg@kaod.org>
	<CAFEAcA-LtNpGTV08jvK4i5C5i64WjM5gMB4zGr8P4fkVSkNH7g@mail.gmail.com>
	<53691cbf-08bf-e3f7-22d3-601a279aa08a@kaod.org>
	<CAFEAcA9XBHE5YxN27M1ugprmSf=o5iiNakO2omrY+HBgCszV5Q@mail.gmail.com>
	<a5ca89ac-7c8f-c565-30d0-357bacb1f61e@kaod.org>
	<20180423104622.GG2518@work-vm>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0fe02e1a-576b-cd6e-a79c-ede821cab983@kaod.org>
Date: Mon, 23 Apr 2018 13:35:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180423104622.GG2518@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14204634703821245355
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrkeeggdegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.182.191
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix vmstate version id
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cXAiv9matm0F

>>> I think it's nice to at least do the "bump version" thing, so you
>>> get a (hopefully comprehensible) error rather than just wrong
>>> data if you do try a cross version migration, 
>>
>> On that topic, the error message was :
>>
>> 	Missing section footer for aspeed.timerctrl
>>
>> which is not very comprehensible for a version mismatch issue.
> 
> Was that before your patch?

yes.

> The VMSTATE fields in the structure have no metadata stored
> for them to be parsed with; if you send a different number
> of array entries to the number the destination receives you end
> up with a corrupt stream. Section footers are just a canary
> that tells you something went wrong in that devices data.
> It has no more information to give you a more detailed error.

OK. Thanks for the explanation.

C.
