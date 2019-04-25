Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1853760wrx;
        Thu, 25 Apr 2019 07:22:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGmEjLvCOoP0LCckDuEkkZCipr08W82nC6Vhf3/PB4RxBUCIImvJ/EdGdlPYXP6XRlhCdm
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr11228525wrw.199.1556202154932;
        Thu, 25 Apr 2019 07:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556202154; cv=none;
        d=google.com; s=arc-20160816;
        b=vxvWqe2BC+B4KIkaOzVCEfwQwcaesvfSXzuXYjluW8muy0L/lEdsSRVEwM9obKJMel
         VxgVlCA9gd7xFIzetNQfan6gtRzwZ5LM+3vbOPcPHfma/51GbUxsPvKmO+Sgs7SpH9hx
         7ySX+72u56wXeKjQuZAk09S4TdrBwVQIJkfWEdlY6YlYeg116CCxf3JR7J5eeck+9TD/
         M4g502kmJe1EgrT3mb5hbybjxCFb8gLoh55nFSuMzkma94OaJlITG/AY/dMPD4+Jvwkp
         h/UCVC1L0vNHXVPd/TQTzLmVtlEK/h3c3V8DxMpOnZ9XtSzE+ZB/yO2Rnf7L+uNXHZso
         AYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from;
        bh=oN1gTjcDDn35eS9dJ/AKEVa5Nwz7Po5+FmnnWoiCwqA=;
        b=kH+zsDrgYvfGe7mOQ8D/cjE9MO6hlNUS8nFZu2/NhDJgWyimi9oJ39Ol7fTjAHQ14t
         q/8zcTBSVwELqm/yI2vIPG88HMbu6Az4fAWbq651tFG8cbgPPwOBtK3gEkogG9Ke3h/O
         Y74hTcuzGEy+Ol1RqoWyGXhdit8/3cgS+CGDGQhyr14+6HmL8wwh9ecDGSaHpTxlcq2q
         niPZ5F2ot8rua0lwjZUKkH1z366NiyfEzEqGS/NSQkzD5f2fdTpO8oNF29pjo+J0KM6U
         Enp/76+Puo4Zlh3kj7LanWwNQLRAl44o+sQT/Gx7bpDhBdtmG21qe3tb8NBx0tX+ZgcV
         LnOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1si16139517wrm.383.2019.04.25.07.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 07:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJfGk-0008IE-2d
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 10:22:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJfGL-00089j-KS
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:22:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJfGK-0002q1-Fr
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:22:09 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJfGK-0002pQ-9g
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:22:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id b1so19265046wru.3
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 07:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oN1gTjcDDn35eS9dJ/AKEVa5Nwz7Po5+FmnnWoiCwqA=;
	b=RmLzzUE1C56UTTl8wsay76BCF8V8UAS+NuKrNJop/4CeYSD0iVxlrFIp3CGZNRaZTl
	mQjlC6fJmkvLr72XtMeD2WdDhM4lENoZ7raIyScoVZo7mxoN93R0PqIr+QCWL9P2yv6M
	D4ikcefuC0EAPOYQ+YR6QHHh68I0LkINjcpFOmhWMcqruV0hE8GJFGeVihuf/dN2jQYu
	YbBaK5kb8MCxe2vSFXmi+upbvfLTrw+/UMhWjsOidoX3zZEWAw1soSfFbgUXx43ZVAwJ
	NhgGlOxSsVn0MndiNknXsndmlxYQHy9HVhWLKDsCDLeBfCtH9ad+LUuCcb4tTdy3X3+Q
	tibw==
X-Gm-Message-State: APjAAAWK4kUjmaLzhAPLOPiCtpXe2KyipDqSJgWryN+COwfoA3JD+2C7
	mByu0k7Ohw74rmL1HMFgYxNVPw==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr12258776wrw.68.1556202127195; 
	Thu, 25 Apr 2019 07:22:07 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	n18sm18853950wrt.16.2019.04.25.07.22.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 07:22:06 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-7-thuth@redhat.com>
	<cf39902b-267a-ea7e-c513-fa0c9abf639c@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f362864d-b8f7-687d-1397-03769202cd4f@redhat.com>
Date: Thu, 25 Apr 2019 16:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cf39902b-267a-ea7e-c513-fa0c9abf639c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 06/29] hw/arm:
 Express dependencies of integratorcp with Kconfig
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
X-TUID: GZtmq0rbbz18

On 4/25/19 4:14 PM, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 4/18/19 8:00 PM, Thomas Huth wrote:
>> This patch is slightly based on earlier work by Ákos Kovács (i.e.
>> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  default-configs/arm-softmmu.mak | 8 +-------
>>  hw/arm/Kconfig                  | 8 ++++++++
>>  hw/display/Kconfig              | 1 +
>>  3 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>> index 50a4be3cad..6195b75f48 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -9,6 +9,7 @@ CONFIG_PCI_TESTDEV=y
>>  
>>  CONFIG_EXYNOS4=y
>>  CONFIG_HIGHBANK=y
>> +CONFIG_INTEGRATOR=y
>>  
>>  CONFIG_VGA=y
>>  CONFIG_NAND=y
>> @@ -33,7 +34,6 @@ CONFIG_ADS7846=y
>>  CONFIG_MAX111X=y
>>  CONFIG_SSI_SD=y
>>  CONFIG_SSI_M25P80=y
>> -CONFIG_SMC91C111=y
>>  CONFIG_ALLWINNER_EMAC=y
>>  CONFIG_IMX_FEC=y
>>  CONFIG_FTGMAC100=y
>> @@ -50,10 +50,7 @@ CONFIG_ARM11MPCORE=y
>>  CONFIG_NETDUINO2=y
>>  
>>  CONFIG_PL041=y
>> -CONFIG_PL050=y
> 
> You remove this device but it is used by the realview/versatile/vexpress
> (you add it to these machines later in patch 11).

My worry is the unlikely event of someone checking out a new branch
after this patch and before patch 11, and disable CONFIG_INTEGRATOR,
then these 3 machines would fail to build.

Since it is very unlikely:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
>>  CONFIG_PL080=y
>> -CONFIG_PL110=y
> 
> Ditto,
> 
>> -CONFIG_PL181=y
> 
> Ditto.
> 
>>  CONFIG_PL190=y
>>  CONFIG_PL330=y
>>  CONFIG_CADENCE=y
>> @@ -113,9 +110,6 @@ CONFIG_VERSATILE_I2C=y
>>  CONFIG_PCI_EXPRESS=y
>>  CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
>>  
>> -CONFIG_INTEGRATOR=y
>> -CONFIG_INTEGRATOR_DEBUG=y
>> -
>>  CONFIG_ALLWINNER_A10_PIT=y
>>  CONFIG_ALLWINNER_A10_PIC=y
>>  CONFIG_ALLWINNER_A10=y
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 0ba377ac18..ad3b1f9b40 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -32,6 +32,14 @@ config HIGHBANK
>>  
>>  config INTEGRATOR
>>      bool
>> +    select ARM_TIMER
>> +    select INTEGRATOR_DEBUG
>> +    select PL011 # UART
>> +    select PL031 # RTC
>> +    select PL050 # keyboard/mouse
>> +    select PL110 # pl111 LCD controller
>> +    select PL181 # display
>> +    select SMC91C111
>>  
>>  config MAINSTONE
>>      bool
>> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
>> index 72be57a403..a11815c9af 100644
>> --- a/hw/display/Kconfig
>> +++ b/hw/display/Kconfig
>> @@ -21,6 +21,7 @@ config JAZZ_LED
>>  
>>  config PL110
>>      bool
>> +    select FRAMEBUFFER
>>  
>>  config SII9022
>>      bool
>>
