Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1509084lfp;
        Thu, 6 Feb 2020 06:26:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyrOM5YPbzHBCNdp3rdKj+h7ONW4hJ2M6DEyvaex7K3+nBsu2sX65+iny4BrtiaqHlXMVUG
X-Received: by 2002:ad4:56a7:: with SMTP id bd7mr2605528qvb.238.1580999199055;
        Thu, 06 Feb 2020 06:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580999199; cv=none;
        d=google.com; s=arc-20160816;
        b=SLcrwRfqOc8md+WOTNDieNVHiSwbura2IAL3nnoETHcx1gjax3Ptg0Hja6IDlux6EL
         Fipt4r+SeQxYDRkWkp0A03+3Ac0xV4j2Bvjb2ykiVq6NuH+qVGSp+5Hz3uFjYF/vFP7G
         az3UrQsKK2TKMhZ4RR/uHs5E3T4tgMmsNhE/6c7IqXMPGpxTvvK4BPT10f21MXmApERI
         tErpklFdp4WaQ+HgTcuywOOztqsOEiQ1BC/fopQZAT5hz5oTcYv+7hioLr1tYN+BGybi
         +tuo4f3Mb1ZsJQxwvIcwgAZIFbt1nw591+6eyHxfi0TjoBZC9LYb+KnlcqeS5aP56Oge
         x2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dgvelOjxXepWDkCo+aQxeDvybFNaShgsH498mYyRW24=;
        b=gNElvKO5rLDtwVHg89IBnNTJD4Um/FNwDj91oDkV78pZKDfKXLyl1NtVw0u/vipr3G
         pec136N0ICwbBo7vi1UJ2uNd2MFPxlptaacHHcTDBpV3Sl4f4M0BP//KYGt1x9hOQn1S
         qqTkv8dF2xheAjriZemaDCHPamssunCPMUDCqzP4MXDX3LAGcf+bRoho81ZM/kOWqjY2
         Eb4i0xLf8kwrje1SIvJcOUmXINQVG4muT2ykSE5JA3kTPjnDfiR5uET5VsUMhrYtu0Nz
         SPphqcbnQXZ8TdD3Lt/bpTZC08df4mhQsovGuNA53J1mHTlEfkyjovHlxaR2zsaZ09iT
         0Mwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YGkPR/1H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26si1677630qkl.381.2020.02.06.06.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 06:26:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YGkPR/1H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izi74-0004aE-Gs
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 09:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1izi6v-0004Xb-OA
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 09:26:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1izi6u-0005IX-NC
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 09:26:29 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1izi6u-0004yM-F6; Thu, 06 Feb 2020 09:26:28 -0500
Received: by mail-pl1-x642.google.com with SMTP id t6so2418747plj.5;
 Thu, 06 Feb 2020 06:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dgvelOjxXepWDkCo+aQxeDvybFNaShgsH498mYyRW24=;
 b=YGkPR/1HaAW5MnJvS47pmUITdfddFk8EqCzyjCkUqLeES5Q5u4MWiIvXVsIKZe6cJO
 gdKaznoFskLynbg/XCtE31NqDhqvHA5xnpWxmuqpn+/DZHuZ9KnVX5xPjrh7NSFgRy6R
 dUD0TzutqBXEVfa8yfhHKGaLBMxPW5h5msiHp9+VJStZrDzwOqwnElosaqIaLsg4kh34
 Zknab0wO6aLKRq0Fv7m0O6Z1ejI3aF3liEFx/p7z5UW+b0x5roT2ltvU+KojPE0Dg4TX
 EtPomucQRzrf3C8OgXbS0oEe7tyJwrDNeOXkXwSgS0qpxPrllnNPph3tL2MSTNMaWsF2
 q6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dgvelOjxXepWDkCo+aQxeDvybFNaShgsH498mYyRW24=;
 b=rtdGw7HRcw55qIcVLAHlt5A96meN6frDw07mXUh9ijtDxEmuvinYbpQQq+ZUxIxesR
 hd4d4ixKPT7clhQyi9rWyhfWfY9/k4QU0GtDWoY0M85ZVcML2Ikc8RNfNM1IxEmjdhl0
 5CTaZ4Ntp6t10UQJK206PTkIKeNP8jEuEvW27n9AZc24kLs0KVKRKNph3E/UjObJ4iwq
 i67lkJvDL5rg0Lip+tenE8ue0nBp+3+KAdV1pPUOQiT1XYNNK+Dijtzg+3GmWp3kKtje
 kRMx+IsLrastCHJtwCGGokFOpWqA4VevLyOzgwx9D2W4RLhs4ylUybSNJdDDUwMIlviU
 Mr6Q==
X-Gm-Message-State: APjAAAWa77tozXiRYn64JwxiuwJutPCvLs6af6wv/3c/DXz10ixgxkRJ
 6FUoXK53gqaPPHwzo+gx+sY=
X-Received: by 2002:a17:902:b690:: with SMTP id
 c16mr4077065pls.320.1580999186314; 
 Thu, 06 Feb 2020 06:26:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m12sm3722748pjf.25.2020.02.06.06.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 06:26:25 -0800 (PST)
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
To: Joel Stanley <joel@jms.id.au>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
 <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
 <7fe70871-c0e3-4ff6-bfda-17b45aa50c5e@roeck-us.net>
 <22a96987-9548-1335-8b04-00167ed9491d@kaod.org>
 <20200205174345.GA7754@roeck-us.net>
 <CACPK8XesxroZii2-r-HTigW4-7Ahw4TQNG1r-YO2K09S7Ap9=Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7318860e-4d6c-b7f8-182f-d0efa332973f@roeck-us.net>
Date: Thu, 6 Feb 2020 06:26:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XesxroZii2-r-HTigW4-7Ahw4TQNG1r-YO2K09S7Ap9=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: izFFrdNUYlg/

On 2/5/20 11:04 PM, Joel Stanley wrote:
> On Wed, 5 Feb 2020 at 17:43, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Wed, Feb 05, 2020 at 11:08:07AM +0100, Cédric Le Goater wrote:
>>>
>>> ok. we will need to model SFDP one day.
>>>
>>> Are you using the OpenBMC images or do you have your own ?
>>>
>>
>> I am running images built from upstream/stable kernel branches.
> 
> I think Cédric was wondering which flash images and therefore
> filesystems you were using in your testing.
> 
Ah, ok. Sorry, misunderstood.

> I had a poke around here but I couldn't work out where 'mtd32' came from:
> 
> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/run-qemu-arm.sh
> 

mtd32 tells the infrastructure that the boot device is mtd (flash) with
32MB capacity. The infrastructure uses that to create the actual flash
image and to generate the qemu command line. The root file system is
is rootfs-armv5.ext2 (located in the same directory as the run script).
It was generated using buildroot.

Guenter
