Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3872658wrh;
        Mon, 29 Apr 2019 12:26:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwLBKp++zNtGSZvOMo/uC9MVRHswo2QUINE2q+VQQYNF62FOfHT7+eVNoWJAcZlwF5dPQ4
X-Received: by 2002:a7b:c115:: with SMTP id w21mr422414wmi.55.1556565974130;
        Mon, 29 Apr 2019 12:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556565974; cv=none;
        d=google.com; s=arc-20160816;
        b=IWZrBKaJniELvAsL+7ipW/atE9Ma7WnWRNaICvAk6+69bSNXGTz2G2QD6pDrdEIMtA
         rdAyzUzbhgZ/yTWnIqcAX2MHMi/Lidn25iNbl+R6sOmQCPosAbJ58awcBRTwqK0v6NhD
         dNjCH0zuaOX6XNZGWowsfNywaSDTBFW9iZazoXf9IBmdyD2ecX654dBsYyN/n0t/ewvb
         cPEhucxu0FGYQGrXXI3gEZO4PtHJroUJlVcKkPABTuPxLaeinUp8ZesJaAuekfpDxUy3
         QLoIRLxoAmIKHQUR0Y1nVp9H1n78f6XWDPO/jAV7DYtUGMV6/WeCnnpcWslpDVSuyJ3c
         2Xbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=H0Fhs4+AXRtIAVbOsw8maRvFIsHRly/9+G4K1ioZIWQ=;
        b=vzg/Wzv6GZ65hU2E1WsHgB+dqD60IRstMRRCY+J3R+LAOYmtBtAVqr2XACylM8ck+c
         wgT+rb0Y8S1FnCpWVbnru0F9TIzqKtTjFPO0ZqwZqiHPMBNxOAed7RQt6mBSDSanA/am
         GF2YE8nQKK7hr+SO7871TzZQSWMP/9IImPlTu4IFoQ2hVCpLowvvfBBKXNH0aFjwSQiz
         j2T53ybpnS1mb1kWTJuR3fcn+uGgndmRdm5Wrdbue9Mv97ayQ4z+ged0RrDfWC+rQ3Jd
         YhYrHqNUBxvJTriekyC96+CqBpEX+5orvwMXTJWQvKa+yssmyZ5PDommDFVzhc+O7r9R
         JNyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d67si239730wmf.19.2019.04.29.12.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 12:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLBun-0008Vo-45
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 15:26:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLBuW-0008Uv-3e
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 15:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLBuV-0005sl-4G
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 15:25:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLBuU-0005sW-St; Mon, 29 Apr 2019 15:25:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84D103DE04;
	Mon, 29 Apr 2019 19:25:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-111.ams2.redhat.com [10.36.116.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04C0F17C3F;
	Mon, 29 Apr 2019 19:25:33 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-11-thuth@redhat.com>
	<377a2033-504b-a84d-0eb0-765de81af730@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <fe977ebc-3ec7-fbf5-7a72-c9418286f0f1@redhat.com>
Date: Mon, 29 Apr 2019 21:25:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <377a2033-504b-a84d-0eb0-765de81af730@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 29 Apr 2019 19:25:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 10/29] hw/arm:
 Express dependencies of stellaris with Kconfig
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
X-TUID: W74ShP71KgOP

On 25/04/2019 23.41, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Thomas,
>=20
> On 4/18/19 8:00 PM, Thomas Huth wrote:
>> This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs =
(i.e.
>> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  default-configs/arm-softmmu.mak |  7 +------
>>  hw/arm/Kconfig                  | 10 ++++++++++
>>  2 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-sof=
tmmu.mak
>> index b7ed3c530b..3f82d635e4 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -16,6 +16,7 @@ CONFIG_MUSCA=3Dy
>>  CONFIG_CHEETAH=3Dy
>>  CONFIG_SX1=3Dy
>>  CONFIG_NSERIES=3Dy
>> +CONFIG_STELLARIS=3Dy
>> =20
>>  CONFIG_VGA=3Dy
>>  CONFIG_NAND=3Dy
>> @@ -24,16 +25,10 @@ CONFIG_SERIAL=3Dy
>>  CONFIG_MAX7310=3Dy
>>  CONFIG_TMP421=3Dy
>>  CONFIG_PCA9552=3Dy
>> -CONFIG_STELLARIS=3Dy
>> -CONFIG_STELLARIS_INPUT=3Dy
>> -CONFIG_STELLARIS_ENET=3Dy
>> -CONFIG_SSD0303=3Dy
>> -CONFIG_SSD0323=3Dy
>>  CONFIG_DDC=3Dy
>>  CONFIG_SII9022=3Dy
>>  CONFIG_ADS7846=3Dy
>>  CONFIG_MAX111X=3Dy
>> -CONFIG_SSI_SD=3Dy
>>  CONFIG_SSI_M25P80=3Dy
>>  CONFIG_ALLWINNER_EMAC=3Dy
>>  CONFIG_IMX_FEC=3Dy
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 71126254ff..b91503f5a6 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -91,6 +91,16 @@ config REALVIEW
>> =20
>>  config STELLARIS
>>      bool
>> +    select ARM_V7M
>> +    select I2C
>> +    select PL011 # UART
>> +    select PL022 # Serial port
>> +    select PL061 # GPIO
>> +    select SSD0303 # OLED display
>> +    select SSD0323 # OLED display
>> +    select SSI_SD
>> +    select STELLARIS_INPUT
>> +    select STELLARIS_ENET # ethernet
>=20
> This one misses CMSDK_APB_WATCHDOG:
>=20
> $ qemu-system-aarch64 -M lm3s811evb
> qemu-system-aarch64: Unknown device 'luminary-watchdog' for default sys=
bus
> Aborted (core dumped)

Oh, well, looks like this has just been added recently in commit
566528f823d1a2e9e, likely after I assembled and tested the initial
version of this patch...
Thanks for catching it, I'll apply your fix in v6!

 Thomas
