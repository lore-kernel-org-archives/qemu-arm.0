Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp533390wrt;
        Thu, 22 Nov 2018 03:04:30 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XjcP38TJyUWJEgF6Drd4YFUa9WNebyxvCzVzBGeF/csb3ynhBU68AZK4QgVfvZ3+u0D2Dv
X-Received: by 2002:a25:3b13:: with SMTP id i19-v6mr8329230yba.170.1542884670024;
        Thu, 22 Nov 2018 03:04:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542884670; cv=none;
        d=google.com; s=arc-20160816;
        b=ARxCiOPb4Qzx88A72BtHfJKjpIBa2B7NgcVNYZc3JQccLaj9QG2qEmi00grpmaV3wP
         CoFtTklFwJpFoyaCv/kAJV72onUz7pU5Rh0jkJ4TPEKiH9uhAo82k6rAjsH8fkwTdpDf
         qfTIeFYufFw5zBO3cg2asUvDcUNG0Oyki5gWANb6Tm1/Qsmob/+3zfNUm9MXcj9jBTAA
         ywkswZfDgJP81XJsGgqWZm7rzTs6YwJeK6UvMWAC+HW3YnfoYPsQexJIizr61Q4hP2r6
         F3svXCbSEzfjzk5hL5GiAV8e8tARB/XI5bXx5GSGFznrGuHhgKISK2KWES6ffFjoh2vA
         9LOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=+7oKny75i5ulwHTEqEClYK6m7YpKnPlnmEr2kRGLp1o=;
        b=LC1Xyl71NDXopt7laE0E9SDtgdtNr/dqUVRcYFeDl2DF817lKXKtDi7nR/Am4DMrE7
         hs25uKbCIZSPrgjCeGzY+RjjjhEHLMsypgYMBGdIdyVFhbL6IFLSP4rZfGvE+8F9lW0Q
         gefYxi4cMu45WIafrxk/iLTOTi7M1xwT00FrEBY6uEM4kS7lN5E7NSg3BfJPiGYYejQY
         tlCwblp0ypeB95+ZxhXvxA0V2qHjdQSJUfQriE0lv+lJ5SotO5c1UK/ylJcOVxwolD7Q
         lFPVBaxq03T9ArPqHEUSa5byFsllRih6pDmpa1A44XZJgsOS5VagM6/y/e0fssSCcDGa
         NZhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e78-v6si31302713ybh.261.2018.11.22.03.04.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 03:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPmmb-000059-AV
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 06:04:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPmmI-0008Sn-0X
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 06:04:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPmmB-0000U3-BM
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 06:04:09 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPmmB-0000Sx-3P
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 06:04:03 -0500
Received: by mail-wm1-f68.google.com with SMTP id j207so1403301wmj.1
	for <qemu-arm@nongnu.org>; Thu, 22 Nov 2018 03:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+7oKny75i5ulwHTEqEClYK6m7YpKnPlnmEr2kRGLp1o=;
	b=rlp4yLldz7MFM3pQVbT/zleH0peM3aHz9m5Br33j6RrVDURnpq4YL8HLrR7EEgtNuF
	jIUjHdax+KTZhm+/0dQSJtPU0o4Wpx2elUSOdzpdNPFBau12wtkTC3+6Li0K+ut/BHER
	6sK4ORBneSkmYea0k+JGETBvKot6NFCRWIm6gougFB+NHvL0uXDQvq/K89bAqIxL+MEz
	jb7rkdMy03FcpiGp4Gsc9meLX3POntcMIegMfFR72WQEs6tWDvWNASH2XBbrPMGomsIr
	MzDNlLKsOJzFSI0B7DMMahignzV6sd87QIUle2k+GeuCslzdX4xdFp3FWlHMQ/I5jsx5
	YpsQ==
X-Gm-Message-State: AA+aEWZaiaCFGKdWNFbsyirBslSueabNonLP5yO0LpswWJJ3/D71FPf5
	8Xw74K/7g+D8Dm81HnYM6vK5LQ==
X-Received: by 2002:a1c:2e08:: with SMTP id u8mr9462386wmu.152.1542884641614; 
	Thu, 22 Nov 2018 03:04:01 -0800 (PST)
Received: from [192.168.1.33] (75.red-83-57-172.dynamicip.rima-tde.net.
	[83.57.172.75]) by smtp.gmail.com with ESMTPSA id
	j33sm17396922wre.91.2018.11.22.03.04.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 03:04:01 -0800 (PST)
To: Li Qiang <liq3ea@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1542880825-2604-1-git-send-email-liq3ea@gmail.com>
	<e61b7517-a736-8cb5-ce35-815225f18c52@redhat.com>
	<CAFEAcA8XgZRXyHkjWnOZ4d_yrqzWdxCDJjo6DtR+PTzx4t1cxg@mail.gmail.com>
	<CAKXe6SJer_4EVPSc9gY0TMVmihMvX8=rmPRcP+4nvdyd+Sr8AA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c712c5d2-25da-3b04-f11c-fbcf972be2de@redhat.com>
Date: Thu, 22 Nov 2018 12:03:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SJer_4EVPSc9gY0TMVmihMvX8=rmPRcP+4nvdyd+Sr8AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH] hw: arm: musicpal: drop TYPE_WM8750 in
 object_property_set_link()
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
Cc: qemu-arm@nongnu.org, jan.kiszka@web.de,
	Qemu Developers <qemu-devel@nongnu.org>, maozhongyi@cmss.chinamobile.com,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BRTZbDNDDIwF

On 22/11/18 11:40, Li Qiang wrote:
> Peter Maydell <peter.maydell@linaro.org
> <mailto:peter.maydell@linaro.org>> 于2018年11月22日周四 下午6:38写道：
> 
>     On 22 November 2018 at 10:35, Philippe Mathieu-Daudé
>     <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>     > Hi Li,
>     >
>     > On 22/11/18 11:00, Li Qiang wrote:
>     >> The third argument of object_property_set_link() is the name of
>     >> property, not related with the QOM type name, using the constant
>     >> string instead.
>     >
>     > You are correct.
>     >
>     >>
>     >> Signed-off-by: Li Qiang <liq3ea@gmail.com <mailto:liq3ea@gmail.com>>
>     >> ---
>     >>  hw/arm/musicpal.c | 2 +-
>     >>  1 file changed, 1 insertion(+), 1 deletion(-)
>     >>
>     >> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
>     >> index 9648b3af44..726ae29394 100644
>     >> --- a/hw/arm/musicpal.c
>     >> +++ b/hw/arm/musicpal.c
>     >> @@ -1696,7 +1696,7 @@ static void musicpal_init(MachineState
>     *machine)
>     >>      dev = qdev_create(NULL, TYPE_MV88W8618_AUDIO);
>     >>      s = SYS_BUS_DEVICE(dev);
>     >>      object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
>     >> -                             TYPE_WM8750, NULL);
>     >> +                             "wm8750", NULL);
>     >
>     > Since this property is not related to migration, 
> 
> 
> This property is not related with migration.
>  
> 
>     maybe we can resolve
>     > this the other way, using TYPE_WM8750 in mv88w8618_audio_init():
>     >
>     > -- >8 --
>     > @@ -255,3 +255,3 @@ static void mv88w8618_audio_init(Object *obj)
>     >
>     > -    object_property_add_link(OBJECT(dev), "wm8750", TYPE_WM8750,
>     > +    object_property_add_link(OBJECT(dev), TYPE_WM8750, TYPE_WM8750,
>     >                               (Object **) &s->wm,
> 
> 
> No, just as Peter point out, the property can be arbitrary name, here
> use 'TYPE_WM8750'
> makes confusion.
> 
>  
> 
>     > ---
>     >
>     > So using the same definition would protect someone to accidentaly
>     rename
>     > the property name.
> 
>     I think I prefer Li's patch -- the property name is just
>     an arbitrary name not related to the type name necessarily.

OK, fine then!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Regards,

Phil.

> 
> 
> Agree.
> 
> Thanks,
> Li Qiang
>  
> 
>     thanks
>     -- PMM
> 
