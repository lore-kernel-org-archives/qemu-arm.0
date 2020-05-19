Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3951602lfb;
        Tue, 19 May 2020 04:43:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhX0qD77/GiWON1F3hlfS+XUHk/3+cljQmKR4BoNd2C+TpMsaElrfWYrAOPADKH9EpG18y
X-Received: by 2002:ac8:714c:: with SMTP id h12mr21598078qtp.372.1589888585100;
        Tue, 19 May 2020 04:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589888585; cv=none;
        d=google.com; s=arc-20160816;
        b=UU8EXLww4g4DppU5PZDrgNC5lY1cScmmbwFWiK5FF9WgrEXy4YfKJh8Udy6aFiVxIZ
         4BCkPqq/a/Rlksss99A2AlmfK2LixmzTxKcupVNoM4im/5Hazg6rsdeIHs6Nn6HT25+j
         xRfbOg0NUwIzgNQnspGTcqs2xpO9g7Ntpy9h9dyQQ/KaCMD01MDvlRZvgHwv/nntImoz
         GDhAwEUaBeIqPKU4063fZ4mbEdMQvtSQX2D3kvo15ZAdMRk+6FxgD4dgVwa/n/7EAq60
         bRvR1fCu8EfRPuKLFOaCYSicD4ABW37zz0gFcUJ3dtbJCerjvV45B9pBCYz/dgAobGgi
         vsTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Yaysbhkhicn1Ru1ZEMMVMvi0BgSX4QtdKWZN/r/+Ous=;
        b=q8ZRfbV9dM1CEtPZ9zOOOHXcFCYmnz/mcGBNCofE1Bnv9vkMKpfa0x6thcjgkMjtqS
         Nvb4XytF4g5/I7E/p7XgiEE4QScSrd9+S7z7L1NCMi0bVbYI8dH8UOQQaQbqGvmCS0oG
         MdfPWi+sSx8gsXF47O7L0Ix350cjmCPnJsbxyXQ1T/fHY8IuRK58c5J48UpruzE9l5i5
         alv/tT18I/VQ8T/QHd9B5YfqiVrLNusTZQYgzxez7uC2Z1rR3lFBT7I4RndxXv9t1wmy
         7GltkJZRutolJznyeJhgfHNdjbb2mZNaCXfKwm0czBWxi4jxC2Kuc7vu8pgvjBCTm43o
         RwAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GUc0zPwr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si7474931qtn.9.2020.05.19.04.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 04:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GUc0zPwr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jb0eG-0002Qy-Hz
	for alex.bennee@linaro.org; Tue, 19 May 2020 07:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jb0dS-0001h7-VA
 for qemu-arm@nongnu.org; Tue, 19 May 2020 07:42:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59972
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jb0dR-0001LZ-P2
 for qemu-arm@nongnu.org; Tue, 19 May 2020 07:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589888532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yaysbhkhicn1Ru1ZEMMVMvi0BgSX4QtdKWZN/r/+Ous=;
 b=GUc0zPwrgTZ/aX13EwOP6a1+iHJ/J0fCM/4Zdld1CRRAhU84YP9Uv+wb/33PKJcykhVpZa
 1sg+R7LxnymaNvTjm2c9ZuVzUCbnpnbDR36eqW0ghRleOT27a4SDGjiF5GKfZ3loHTIXo3
 dM4qK0G/1QSxNr0V0kXTHWaGyvCmT9Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-WGGC-9TaNbesK7RVI8KwFw-1; Tue, 19 May 2020 07:42:11 -0400
X-MC-Unique: WGGC-9TaNbesK7RVI8KwFw-1
Received: by mail-wm1-f70.google.com with SMTP id o8so963024wmd.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2020 04:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yaysbhkhicn1Ru1ZEMMVMvi0BgSX4QtdKWZN/r/+Ous=;
 b=K1utcyePjeEaFem42sjoXJjCR2Nmq7AMP+KhvF+PuZQ5pgq0x107asqReREJI9Q0D/
 P4ZlXkop15sEevKtk+AgBw6XXp2pEDSjdIENLP30KUmwZyVd4yd/ljgc+Rq/d6Mvs3Ot
 0hUpEduqJ9ZpbLJHSVT75ULXNeQ4xFgOxo7XqNrJUIYCQX2Yz7/xzrHO0aoDFJRUAJZY
 gsq5fwIIIBSV3bfduE3AGE4k7CMu0kng31ZvjWSUsk8u5ZRaqKhHfN5O43d6R381gyyT
 QZl60QISucutVwKoJz6H9RTzqnXFFU+pNkwqm9fDJ7rzF0XMYf8uyZNOVOxDWpWooP+x
 cJeA==
X-Gm-Message-State: AOAM533X/4fEoPgV9k+nAdWugy32LDzP0p5+M5po/99FPk8kSYe0t4DY
 koHFPb8eFxKPTXgV4vro9YC1RCWVPsYcRHhD1sYHKLglTsThByAefAmWuTAm99t9OZc0uepH2Zx
 1wuJCpOsskV6L
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr26742862wrw.16.1589888530171; 
 Tue, 19 May 2020 04:42:10 -0700 (PDT)
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr26742825wrw.16.1589888529830; 
 Tue, 19 May 2020 04:42:09 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id r11sm21625621wro.15.2020.05.19.04.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 04:42:09 -0700 (PDT)
Subject: Re: [PATCH 04/24] aspeed: Don't create unwanted "ftgmac100",
 "aspeed-mmi" devices
To: Markus Armbruster <armbru@redhat.com>, Andrew Jeffery <andrew@aj.id.au>
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-5-armbru@redhat.com>
 <9fc4a6e2-fa90-ba62-91cf-e22eb3ef4cdc@kaod.org>
 <eb1b203d-44ba-4b89-b96b-4e7bf993ac67@www.fastmail.com>
 <87v9ks5vg7.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9cfcba4e-1237-8eb9-7c83-490729f082fe@redhat.com>
Date: Tue, 19 May 2020 13:42:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87v9ks5vg7.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:56:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D8ehvBGG4OCL

On 5/19/20 7:45 AM, Markus Armbruster wrote:
> "Andrew Jeffery" <andrew@aj.id.au> writes:
> 
>> On Mon, 18 May 2020, at 21:49, Cédric Le Goater wrote:
>>> On 5/18/20 7:03 AM, Markus Armbruster wrote:
>>>> These devices are optional, and controlled by @nb_nics.
>>>> aspeed_soc_ast2600_init() and aspeed_soc_init() create the maximum
>>>> supported number.  aspeed_soc_ast2600_realize() and
>>>> aspeed_soc_realize() realize only the wanted number.  Works, although
>>>> it can leave unrealized devices hanging around in the QOM composition
>>>> tree.  Affects machines ast2500-evb, ast2600-evb, palmetto-bmc,
>>>> romulus-bmc, swift-bmc, tacoma-bmc, and witherspoon-bmc.
>>>>
>>>> Make the init functions create only the wanted ones.  Visible in "info
>>>> qom-tree"; here's the change for ast2600-evb:
>>>>
>>>>       /machine (ast2600-evb-machine)
>>>>         [...]
>>>>         /soc (ast2600-a1)
>>>>           [...]
>>>>           /ftgmac100[0] (ftgmac100)
>>>>             /ftgmac100[0] (qemu:memory-region)
>>>>      -    /ftgmac100[1] (ftgmac100)
>>>>      -    /ftgmac100[2] (ftgmac100)
>>>>      -    /ftgmac100[3] (ftgmac100)
>>>>           /gpio (aspeed.gpio-ast2600)
>>>>           [...]
>>>>           /mii[0] (aspeed-mmi)
>>>>             /aspeed-mmi[0] (qemu:memory-region)
>>>>      -    /mii[1] (aspeed-mmi)
>>>>      -    /mii[2] (aspeed-mmi)
>>>>      -    /mii[3] (aspeed-mmi)
>>>>           /rtc (aspeed.rtc)
>>>>
>>>> I'm not sure creating @nb_nics devices makes sense.  How many does the
>>>> physical chip provide?
>>>
>>> The AST2400, AST2500 SoC have 2 macs and the AST2600 has 4. Each machine
>>> define the one it uses, generally MAC0 but the tacoma board uses MAC3.
>>>
>>> Shouldn't the model reflect the real address space independently from
>>> the NIC backends defined on the command line ?

If the SoC has N ftgmac100 peripherals, you need to mmio-map the N 
instances, else your guest will get MEMTX_DECODE_ERROR trying to access 
it, regardless command line NIC plugged.

>>
>> That's my feeling too, though I'm not sure what to make of the unrealised devices
>> in the QOM tree. Does it matter? It hasn't bothered me.
> 
> Depending on what the initialization code does, unrealized devices can
> be anything from a little wasted memory to open bear trap.  I don't
> really expect the latter extreme in the code, as I expect bear traps to
> quickly catch the developer that set them.
> 
> I guess the unrealized devices cleaned up in this patch did no actual
> harm.
> 
> Still, it's an unhealthy state, and that's why I clean it up.  "[PATCH
> 24/24] qdev: Assert onboard devices all get realized properly" should
> ensure we stay clean.
> 
> 

