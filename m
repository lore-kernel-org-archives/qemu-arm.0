Received: by 10.223.172.38 with SMTP id v35csp4939697wrc;
        Tue, 19 Sep 2017 06:29:39 -0700 (PDT)
X-Received: by 10.200.35.21 with SMTP id a21mr2041694qta.215.1505827779734;
        Tue, 19 Sep 2017 06:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505827779; cv=none;
        d=google.com; s=arc-20160816;
        b=utFCooDGRQGsduDAtlmiFDZiVtIWiS6v2g+/sBwi1/VGmDYBzjeWDOoxUOqDHH7ALH
         Xk0C3Io/Ba4WFmCAwCOX+zqtyhkBvDfWzM+o1VKIBSflkIgBPaVzcnM54VARWgOqK6lJ
         UbUz66KyNFbtT05Z2vBakIn9cyD30a9DTxY2ejMXevEeeFMdEKROhPW1zFKhL0vxzID6
         R8hXV+i1O/naLMLJ6qutRRnAqALxPJzyFclwgkCVWPnU/zTqhBvq7Zket8GJYwStVUac
         9EyYN2yCWOQF6ACF6SSW1VeQMEthSl/sSFXfeMJiz1RI2mvrTN6RdnARmlwsGLGtn4jK
         Fr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=jqw73LWBoxXSPQ6ARPv8EPiBzjvHpYD59rFxitSjDyA=;
        b=AF6r9Rayxa9kmKcRin9AyDQyylmA4cAtAAjy2gkNBS9VCQ+8gEWd+zylTafYSbvm7M
         tST5PnV7vq4YVE5g0RScOntlII/S0BsEqEgPTbyfEYyQGSigUDMJ5K6T1rTK+9RwCCbk
         iTPW3F9h6JAJbjuooGbRG2wvDf9mK7SSbnI7smeKUhmFteMy10UPw1xFtgrRQ+F6s1uo
         LHNs6Dgs/SwhlenpnA5HczsNfNI2pf/uJq5WiYJOJWv7Mh2Yo8BVFcFDgi2l+1Uop45q
         ZgKTl3VD/uWQx9V3aFfzPOpukuwjdA6e8Pi3evYKx6Oz9FNka7COBjmvQg/641Jj02NT
         IF9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iBxu9PJB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e12si9498079qkh.265.2017.09.19.06.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 06:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iBxu9PJB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duIan-0003A8-Eg
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 09:29:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duIZ2-0001zR-Hu
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 09:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duIZ1-0006me-I4
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 09:27:48 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38282)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duIZ1-0006lv-D3; Tue, 19 Sep 2017 09:27:47 -0400
Received: by mail-qt0-x244.google.com with SMTP id f24so2300933qte.5;
	Tue, 19 Sep 2017 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jqw73LWBoxXSPQ6ARPv8EPiBzjvHpYD59rFxitSjDyA=;
	b=iBxu9PJBnwv9f+GuWazvgj+10Yln8+BSm5xrsSr2rs7FjHYbDqUYbIiyY6S8SKZnc4
	VPc8V3uikiUsrTMzWEAyiFH4ny+Q+APjd0BiICgRWbguKiVVqJ5qUGx4ZGGVZ8SFPN6E
	P0c4d2PR7gy51T71nIA3LSCG3yH7J3KMghKcfI3fCwePZxGOXo+at5ARPPMpNpEWbGWZ
	vKO7hvHS542UXScbHVqhPdZ9d6cWzd/VAMFutcGhmThbM46NdWZFzn9bSu3vK0mgvchS
	ixXgfApHwV4anm71XqhKX3XOEiEwk0RQapwzw73hrJtkhxdG2TXsGuupHPUrH+gRtP3q
	xWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jqw73LWBoxXSPQ6ARPv8EPiBzjvHpYD59rFxitSjDyA=;
	b=oNt5L1twu6iybbn1eULOfEESTkaMFRi/Xaua8WM0nMJtqARekHgLtAFKoIYxOnAXLl
	yQqlO+syGx3IyeRZEzavaMv98HkCKrttOl549vtC5PE0fQVc8PDQ4ihjeuFVcOohyh+b
	Bl3sk4b/beSG5reVgbAHEoWBKxuGVUX9YJFSmLLguHm9MtlaH9cMj1k0NErZyDGDBvz3
	MC5QSATIxNBKvg+JVLEywZDjufdyjQzBjuwf3sZSTSxW73BB4kX/Bpt1wp3IJcRVIkru
	HM14n37NMpr7S5lCOR2EzErVHIXxVxmh3E4XOttklRU/erNXA+UsKZK5xz/dCo0kngoZ
	fQKw==
X-Gm-Message-State: AHPjjUihblSNcA3UkmDirfckuiaF17w61cOGgtEExZ8Put4F8zPETHHR
	gCRe+chyaFNAeEcuLLRf2+0=
X-Google-Smtp-Source: AOwi7QDVJxZNAUAAgjXulcC485LmH9VcudeaiCHNzRylsq7x7MHog50/KrH5afdN9mhrTMDwYFZq9w==
X-Received: by 10.200.40.104 with SMTP id 37mr1980209qtr.284.1505827666654;
	Tue, 19 Sep 2017 06:27:46 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	n34sm6958109qtf.10.2017.09.19.06.27.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 06:27:45 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170919112645.8574-1-clg@kaod.org>
	<20170919112645.8574-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3bb3924d-a7c9-26b3-50a2-8a10ef2585e5@amsat.org>
Date: Tue, 19 Sep 2017 10:27:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170919112645.8574-5-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 4/5] misc: add pca9552 LED
 blinker model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DKBLYl9JYUm6

On 09/19/2017 08:26 AM, Cédric Le Goater wrote:
> Specs are available here :
> 
>    https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf
> 
> This is a simple model supporting the basic registers for led and GPIO
> mode. The device also supports two blinking rates but not the model
> yet.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   default-configs/arm-softmmu.mak |   1 +
>   hw/misc/Makefile.objs           |   1 +
>   hw/misc/pca9552.c               | 212 ++++++++++++++++++++++++++++++++++++++++
>   include/hw/misc/pca9552.h       |  32 ++++++

I'd rather move it to hw/display/

>   4 files changed, 246 insertions(+)
>   create mode 100644 hw/misc/pca9552.c
>   create mode 100644 include/hw/misc/pca9552.h
