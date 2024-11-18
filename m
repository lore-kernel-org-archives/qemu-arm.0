Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp2079628dll;
        Mon, 18 Nov 2024 10:55:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWa5z5Rmta313yP1eNn9rvBhTO2z97pLGx/x54rNHb4P5eV6C4NMnhu+1XaQy8T0vZpaJUQmo9D+Fht8w==@linaro.org
X-Google-Smtp-Source: AGHT+IHa0p69sUKy0UxwvK12S5eFKIwujlt6kpb0rfByUOUZ+EvognocBATeDFAJbIb64Wckq1ye
X-Received: by 2002:ac8:5850:0:b0:461:1fa:fba with SMTP id d75a77b69052e-46363e2dbf1mr196191021cf.32.1731956106071;
        Mon, 18 Nov 2024 10:55:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731956106; cv=none;
        d=google.com; s=arc-20240605;
        b=VpPkf5G7iq8XjC+v5ShVRu+uTK2yVFKL8lLpOiKwjKf6pyuA5K2D2sdZXDXx+8gKan
         IDRBfxt3bOY662vaVKl1N2IT69nVKjmqbT2fuxseufRud7hJlTHR5UGO1+VzryRvQEYV
         Rmv0tFBQJQplErGR2GXu4WhS9pSO62zUCUXDiMKQtoOC14FP4ApKCNsXY289MmgHrufV
         me1kdZ45liV2URqafQkCsOgbRzz7Lh6x71YoEqf2PobB3+tNb+eSQqKfYXJCR6kC1FFP
         37Vr1xUIEqkTXTPgbPYkLc+/okUtJSCWUKYGm3lbP0y2C3SmPzNn8DcIpPFm18dvrjbg
         7u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=MjsKJSukVigop6pJP0dBWpuy66wgsNT50af8ecR8dCE=;
        fh=UVNu1hxfvGkQjtaaLesZA/oviOFmSFEPtJX7XMjBfYM=;
        b=VXlWiMLORRhYhtjiTT9g5NGY9g27IHzfEv8BUF+8MezRuWjZs7HMEoJPosXfD7YrAC
         xFKV96fvX04fHJX7YAfa4TeZ/AGjRcTo/BIEgZO8btqVE1p8/KXtoamWkV1G/nYt9Ne6
         Aw9HJV/bpAUyfTPy4ICmxQeT2u1CeLiM2IuavFwHg8wH8Nl087VNatBWPtT1dizoqfIP
         F0VOvIZjql5VL1DGA/DJxImi/9PKb2AgUEhXN1B/266WuaBMlthnxJRg3afcPfEDl7M0
         4RXubg7J7vrEI3TCkkFuyQnYCGuHx2Hmpkpk+E11rAr2mFenq91nadofcy+nrBb35Dg2
         Bf6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=k3wG0Th7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46392c621casi2650251cf.583.2024.11.18.10.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 10:55:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=k3wG0Th7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD6td-0001zk-9c; Mon, 18 Nov 2024 13:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tD6tX-0001xB-Aq; Mon, 18 Nov 2024 13:54:43 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tD6tV-00065U-BJ; Mon, 18 Nov 2024 13:54:42 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-723f37dd76cso2881347b3a.0; 
 Mon, 18 Nov 2024 10:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731956069; x=1732560869; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=MjsKJSukVigop6pJP0dBWpuy66wgsNT50af8ecR8dCE=;
 b=k3wG0Th7whiV4tEvxPTUPoAzLgWGlI5nqhEvvDNTyfnNpnQ5FvqVG6LNppMH7FGrSD
 IkJ9ihqeCjtXxx1EJq/YAUDER7N36DHXo51wgwhFar/yzwiv0iBQv+96GbIRaM5FajTZ
 npXaFZj7o4PFe/qgLIRbXddXSookxe3pdopqVXB6yyhg3GxByXrHbjp0S7TcV+nOyhon
 5boI51njfALj4wHXeRyqIYdaudfJfk5Ugdm2jYzgrMmumAuaE3XBa0Nk9xxaItvy5Ram
 DhDmv2G6SJEbfAvU608Cl8rvF1+B4Wi8X8GLSzA9l3aRB5WWdY0zkv4FycJLIoeoX571
 yVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731956069; x=1732560869;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MjsKJSukVigop6pJP0dBWpuy66wgsNT50af8ecR8dCE=;
 b=lfzaERbvK6FJLL0/Q9KhyELX1rAVBl/SbTCWICn7ryqTXHfT2NgN40okM8B36hyJdM
 jSbOq3ywZPIvOYx25fv/9Kv6hOZES8BjsmCh8dDSAj/p4xdvx329wr4WATTdIG0kgBZ5
 y3fmGMvrFQ6d6besqY04h9fpPXVxhMmmwx768z6kGf48Aqw311TuEa4dMqfJjpncanPo
 mto9i6Xs74rzoXROUyRYwaYFoq+OiCF/TCZH2i4rQ+fk6/pSPiFlDbqNtLFvecOMzHZD
 YzGsWI7JTeBOapdkoM3xe0at6w40gCh9P7gtRAJzBFOtFsvrA969NDvVxZ958KkcpxgH
 RsYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyCRmov1wYYAMAfXGRwKK44LbM4oS5wpEJO5jXKdEltlgxKQwn8V1GGQzzqwtZ7QYfu4D2xJQuZQ==@nongnu.org,
 AJvYcCWqo/ZTzzquqsAC3Lyfgwga0FgedDVEf2L3pgO2Vp9mgOMc7w2GsB3UNnJQidzYKluW5ASuZJu+gWkd6A==@nongnu.org
X-Gm-Message-State: AOJu0YzKTPbyZpqUy83D2vOl4MWyO8kKn2aplf3USHtitXNeRqlhWOsm
 p44pUfDf1RREeyVD6JVDhx9y8CHMUIXGPrViQkXC6Gsj4ATEXfD8
X-Received: by 2002:a05:6a00:181b:b0:724:6704:734e with SMTP id
 d2e1a72fcca58-72476bb0a0cmr20667977b3a.13.1731956069416; 
 Mon, 18 Nov 2024 10:54:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724771e1c93sm6744299b3a.144.2024.11.18.10.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 10:54:28 -0800 (PST)
Message-ID: <c5b0aa4c-770a-47ed-a179-d3b4b9aa16cb@roeck-us.net>
Date: Mon, 18 Nov 2024 10:54:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 10/10] usb-hub: Fix handling port power control
 messages
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 BALATON Zoltan <balaton@eik.bme.hu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
References: <20241112170152.217664-1-linux@roeck-us.net>
 <20241112170152.217664-11-linux@roeck-us.net>
 <08224ca3-5c31-41c5-8041-30e686fe33b1@tls.msk.ru>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <08224ca3-5c31-41c5-8041-30e686fe33b1@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J2s1e6i0o38u

On 11/18/24 08:37, Michael Tokarev wrote:
> 12.11.2024 20:01, Guenter Roeck wrote:
>> The ClearPortFeature control message fails for PORT_POWER because there
>> is no break; at the end of the case statement, causing it to fall through
>> to the failure handler. Add the missing break; to solve the problem.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> Change from RFC:
>>      New patch
>>
>>   hw/usb/dev-hub.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
>> index 4da91d151c..2872c6712a 100644
>> --- a/hw/usb/dev-hub.c
>> +++ b/hw/usb/dev-hub.c
>> @@ -532,6 +532,7 @@ static void usb_hub_handle_control(USBDevice *dev, USBPacket *p,
>>                       usb_hub_port_clear(port, PORT_STAT_SUSPEND);
>>                       port->wPortChange = 0;
>>                   }
>> +                break;
>>               default:
>>                   goto fail;
>>               }
> 
> This is wonderful :)
> 
> Picking this up for stable series, though it looks like this is
> a very minor issue in practice?
> 

I can't tell, really. It is just something I stumbled over while testing
the patch series I had submitted.

Guenter

