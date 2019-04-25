Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2287768wrx;
        Thu, 25 Apr 2019 14:52:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqMBiwnuNSvkg+nB2/yFRqD1VSlrw0Y+mKkBoFfdf8VhL/dMlXQc0iDQ5Fb37ykOpIS4zt
X-Received: by 2002:adf:eb0c:: with SMTP id s12mr26026468wrn.229.1556229136712;
        Thu, 25 Apr 2019 14:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556229136; cv=none;
        d=google.com; s=arc-20160816;
        b=qsJ/+jZNLjI0Gi/DnyRoxFMg6Y1utYG49J91Q4JMWHG8hInmyLScD5TjZ4DAu8Vzk4
         PE/ILaDoH1Hxcdd9TRFUOiaBTbvQoFfvvVn4Q4iJCku0NJviHWg+K2l94QetPNoA9s1j
         G7dAesPum5lqSMEvneUiDZ7nU0hJbU1+A7UpR0VzfcqmNkx1YKZG53xZvtEdCrfYd5WR
         JDv6G7eExPFjByrAgPWbhhNzbttMkG9zgQ4zOjYelmLWl08dv4hEQXDAYTJcg0NuNeHo
         dcxgTdFItmhVKg5ICKO9E0EaPorLdhlwgWf/vbXadMwMIA3nLVTCdJvR4AMEmWLO8ami
         vBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=SRar4Kq1hkJ+EW2L7kQITpYzNLgV/Vp9T0bSy7oHqlQ=;
        b=o9JRUeXAlvIu0+02WQyt61Uxag7iSyFAD/lRH/qP6SUoAT6iFaiqK2sgvVRTMX0jK6
         gnOlN29KA/pJnvT0WOhD0jksoAt0+tEUzoP75/XDDbHlYnV3Pp2Ob8GW7a70OY/nrKZx
         Kl1rChI/QFJyVxg6NAJN4eMOy/wZ9l4Lj4rxyCIPF6Lr5avyQilETAACHENFE05ljshP
         o/eH7dRDwRFRu6j2i9iw4fwV1K3RJDh8oBIpDtk1yHut+sdWvPlMKdXRin5jXsqJfAcd
         Ysn3sY/8JW2lpoNLK3uC7yfEspjbwB0ewBb3wgTh2/yKEdvUyvVmwwVuX6QONCZY5Zvf
         18yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si16896499wrm.250.2019.04.25.14.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 14:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJmHv-0006K3-Rl
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 17:52:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJmHj-0006Jo-9c
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:52:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJmHi-0004iy-BW
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:52:03 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJmHi-0004hn-4F
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:52:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id h4so1437862wre.7
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 14:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SRar4Kq1hkJ+EW2L7kQITpYzNLgV/Vp9T0bSy7oHqlQ=;
	b=QI1covc+OH09xJQWbhPRiO8bTFozJz778lX6ic8IojutgOPGfWVjxzwBREFvc9JKVS
	a9xWwd8ko+WFWkltE4tgsfxEJngKnLVz4IObOtJoPeC8rXgkKZVWvNrC2JncLNQcu4UJ
	HV6jJp25DVLC1veFbAT58jJnTwclDgUNFezYUIs741Da2DKCOTXxWH7tkWUOW9Qr1lqL
	2OqrUuluMyGN0aoPcBIIeVOchlevWcGjYVqLU5sliXd/IHzfxWdD6XkfCr4zlzJWMJFQ
	mmgbQy68PNu4XTSJ8teiWU8625CbBQcIu6Kyj47uCdvhrozF8riUpWGohmpCWyOqPkTQ
	Hw8A==
X-Gm-Message-State: APjAAAUgraHd2osrY+MouDYocqgv+9J+v+Sn1pYtjSxjXlmpP80XL7Jw
	fSc3bbto31v9u6ZJPlrwzhopCg==
X-Received: by 2002:a05:6000:cc:: with SMTP id
	q12mr16783826wrx.251.1556229121037; 
	Thu, 25 Apr 2019 14:52:01 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	o6sm46182699wre.60.2019.04.25.14.51.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 14:52:00 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-29-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c7f48b17-1a52-5c0e-bfd8-04eec2893fbc@redhat.com>
Date: Thu, 25 Apr 2019 23:51:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-29-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 28/29] hw/arm:
 Express dependencies of the musca machines with Kconfig
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
Cc: Rob Herring <robh@kernel.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Beniamino Galvani <b.galvani@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
	Cedric Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NR+cu6cBBRob

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Dependencies have been determined with trial-and-error and by
> looking at the musca.c source file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/Kconfig | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 22be1e1231..eca8387050 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -75,6 +75,12 @@ config MAINSTONE
>      select PFLASH_CFI01
>      select SMC91C111
>  
> +config MUSCA
> +    bool
> +    select ARMSSE
> +    select PL011
> +    select PL031
> +
>  config MUSICPAL
>      bool
>      select BITBANG_I2C
> @@ -423,6 +429,3 @@ config ARMSSE_CPUID
>  
>  config ARMSSE_MHU
>      bool
> -
> -config MUSCA
> -    bool
> 
