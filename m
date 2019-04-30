Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4457631wrh;
        Tue, 30 Apr 2019 01:35:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVA6GbvCWWS8mTa/n2BLWfmWDXLGnPeXiY7sCc+14jGanhFSrzQbwDbmEf6Ped0BYbuDVN
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr2421420wmk.18.1556613309859;
        Tue, 30 Apr 2019 01:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556613309; cv=none;
        d=google.com; s=arc-20160816;
        b=nZ6bGOP1P5drbTpJU5b1dIvWaVQyLQx+akHyt1A4KS14pTnIDoC912xEJvkjWcIWe/
         prjXjKidW5AxccCvwpKBBxpcvlX6vr6xTjU45IWFjQSVVJYluvTFAyYr6C8AVp+kb8x2
         EPIvSvFY5hq0YjywCtMqJAjvS5snaTrDC5cSpfFBKgMfVMJ2JcXLE/gD3yTMY+ToBdfZ
         z8lsbQ0ROORh2ElhdY0XuaNUkFeMHh+1z+LGVwb2yMEQ8RMv/Y+4DloZK+kAk1WvQubh
         dHt1A4XY+4Gmzgui0ZuGWPs4Na1Hz7cepNj8PvpseUo/dQYclN1cqRoN7SOJzar8hzPC
         58BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=QwgUtUJ3XYWzienweeDVQJWjW7OyoxRiZprCa9xXUFg=;
        b=JviaRwZucqX7wCcAvCAvN1tSvIsz854coW5O7REdd3XRNtAWx6owIHDSevpa2W221n
         7Lq9cCdtcycFJSXPWFB9Zu1vz9sMBqFM/mfxpeJtHQZ349Nlq4fLnWL4gRrEdvdsHEEH
         SgBuSUUc1QZNpwKaIeGJ1dCkYgeVIr1jb04MQbSbRyfvvxQ8ZLoyXNpyUqAMWTFc4hbr
         v9XGwOujRT66t+5eS1IWJy0PFz7YqJwQsvqlkGcd2ZuEMbVqRF2ba+dbhr1kdrdm/yDB
         GTXOofbvs7tkjpQwd/WXutkE9wgROQvpHW7qMQTYqPqORpAy6EglQcV0HEjS6hMOlHW6
         wzEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r143si74631wme.0.2019.04.30.01.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 01:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLOEG-0002SB-WD
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 04:35:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLOE0-0002Rw-HK
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 04:34:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLODz-0007xv-Fp
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 04:34:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLODz-0007xQ-9A
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 04:34:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id k16so19978943wrn.5
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 01:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QwgUtUJ3XYWzienweeDVQJWjW7OyoxRiZprCa9xXUFg=;
	b=I/vs5eMZgxd/K5kkTLzil32ysiXk3MrygK+69e20t3RqbxrSzaxAmo0RaEJjiYIEx7
	27Uiq7VbBZ3UeJyIMY/mh4gjXij5KmfFnbMtJJh9YHQE15UILsLxRYtCc+mDWfSvBNGY
	Fy+GyjQzqcx4QNOq+9G2n/41qoUzPhnn1s2ZT5mMUJ4tjKByo8dNx6Zub8esPTH47AYX
	oOSpfYMfvFQTx4lpyjSn+OcWwqqzWj3/UG508xolsHz3/QzYk7LJyInw/2KIZVjjQxF9
	O/+sd3Faxe06bmxekNUhuAd8p+6OtT8xuccck7I5bokrxoiSG9IcHP91QJ1TNDsAnapW
	eJXw==
X-Gm-Message-State: APjAAAUbZ2ZFKIvXiPw8CtLY47N1Vpmd5e169V7eN4v7mWfox5rd+iFD
	vnuIrfxcJ8XLg4L27mfjQKJq+g==
X-Received: by 2002:a5d:698b:: with SMTP id g11mr42588747wru.65.1556613290118; 
	Tue, 30 Apr 2019 01:34:50 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	r8sm11646671wrg.22.2019.04.30.01.34.47
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 01:34:49 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Paul Burton
	<pburton@wavecomp.com>, David Gibson <david@gibson.dropbear.id.au>
References: <20190430071405.16714-1-thuth@redhat.com>
	<20190430071405.16714-31-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <53e321c9-5ce9-14ef-9f55-b5ee1fa3f0e9@redhat.com>
Date: Tue, 30 Apr 2019 10:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430071405.16714-31-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 30/30] hw/arm: Remove
 hard-enablement of the remaining PCI devices
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
Cc: Rob Herring <robh@kernel.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Cedric Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: illnQYvlz4uC

On 4/30/19 9:14 AM, Thomas Huth wrote:
> The PCI devices should be pulled in by default if PCI_DEVICES
> is set, so there is no need anymore to enforce them in the configs
> file.
> 
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 233937f394..f23ecfd5c5 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -36,14 +36,6 @@ CONFIG_DIGIC=y
>  CONFIG_SABRELITE=y
>  CONFIG_EMCRAFT_SF2=y
>  CONFIG_MICROBIT=y
> -
> -CONFIG_VGA=y

OK for this one.

> -
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
> -
> -CONFIG_PCIE_PORT=y
> -CONFIG_XIO3130=y
> -CONFIG_IOH3420=y
> -CONFIG_I82801B11=y

Since I don't understand the extent of commit 4681867544f0, I'll let
David/Edgar/Alistair review it.

Regards,

Phil.
