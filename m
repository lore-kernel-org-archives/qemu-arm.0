Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp774736wre;
        Wed, 23 May 2018 07:08:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLSNz0WK6AZJ4j7uVqNZU+j4jAjYF8cPzWim2O1nUlYwrZtFG6KEtFuLMNpfr/zA78Qm6i1
X-Received: by 2002:aed:22b6:: with SMTP id p51-v6mr2865431qtc.222.1527084513018;
        Wed, 23 May 2018 07:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527084513; cv=none;
        d=google.com; s=arc-20160816;
        b=UyRbEdY5toh/XE3MGkITASJ79ogRn4wOjZEEkgaUqIfcV2HRFvs4v7dWDU+oXMpAvG
         gpPPnE+jGkii2Ys61JY7BWAWQvt6l/oF7TSp6okALL7Awk3Ibqp2k9rGxbCznek9BIXq
         hTLxundz40Fb2Tfq878P8wXSwvvWQ3PdMV6ZXtea3ozOeRUCc08Ycv3wOllCgHxLO6V8
         +Uf16/l0dqp8TH1+bHrosLSdEoxgRSVByTquvR0I+mRAjiliHtH1gRII/tU07xIx56i8
         oDgqXhwvsr1hqsnl5tkkMYswJ2qOXAanYJRq1jNlVajCDp76WmvVoeLXhc2W/a3ai5r1
         2G/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=8C2kIoXddiW373POWM2oC1LVAyCwwMQQ9nubWS0OPys=;
        b=OSK5Gf6eS6SbN+ZpJoSAvhcZKHhMwRWfmDGISJOd2eSOArVHMt3/tm0go0VUslndlh
         phF2LlfAYpxXRwW021Zr7obHtMOb/vlrDz0zblKXBLJoD6YNqVvHUzLhb0TMak5MjRgs
         J6+eQoMzsOd6gZGSio1BfVAlUd1Pfo9oCBnmiQto8vx1sc7aWSIO+7r/XRe+WJNMPKjr
         JP+4eLTjUMphacYIZIt2n/qtb4zZPxgfrtAlbZ6nP1yqEnAuDWZlHVSUTzC37Fs+0Nsk
         8u5znhrNigtUsdqWBBMw736O5L+OvDp9P00xDc71kZaEfICTa/qPkjSIFm4c412gEnXI
         nblA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TVaJACnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v47-v6si8653070qtg.82.2018.05.23.07.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 07:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TVaJACnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLURM-0006xb-G4
	for alex.bennee@linaro.org; Wed, 23 May 2018 10:08:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1fLUR5-0006q1-1z
	for qemu-arm@nongnu.org; Wed, 23 May 2018 10:08:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1fLUR0-0004Jt-8E
	for qemu-arm@nongnu.org; Wed, 23 May 2018 10:08:15 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:46382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mdavidsaver@gmail.com>)
	id 1fLUQz-0004JS-Uy; Wed, 23 May 2018 10:08:10 -0400
Received: by mail-pf0-x243.google.com with SMTP id p12-v6so10544469pff.13;
	Wed, 23 May 2018 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8C2kIoXddiW373POWM2oC1LVAyCwwMQQ9nubWS0OPys=;
	b=TVaJACnRMBFOUECi59y0OtlyvKTiDA4GiKR+SYAMP/0M6kJLNz30+Ax306ZkJgUkqa
	sCpWNdfU8hKm8vgoXjEtEk4kVrusJvZgN+FaEoB/FLLnfyB7VpkESDcqtfwMH98+GF5r
	+BFTzS4V5Nr00avIMsMFbBEBLd4wLIz6gLwUVtv7msmj98Kcbva/KZ/NbNaZVqgaUtGh
	2uqdMXs+fcB/ZDj2H31Ka3dmKGVZ7e2IqLjtjcgeGKhG8jpSbpzR0at+On4pVI6Wocda
	DQRg3eqxqJkl7BaWcEcoYj/jzAkHmKtFwmyQHT73ecoEtaUyOy2/r02AGblS01hk3Oio
	bjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8C2kIoXddiW373POWM2oC1LVAyCwwMQQ9nubWS0OPys=;
	b=J7GguNnCm6zaC3oc8+ZofLZQWlGDJHlWznGwdRQGb5F5tkytNgJY+b1/rJDRz9nl2Z
	xKfD21gEQJm969ieurQ4el3CcZ6cy47X+d2Ocu7aSNJZ1pb8bbz8s2VWF/6mALNZ2dDZ
	64Z+6I8ahfYK12LjhVYcQmpZKNvEThp6WhvI3lej1vpvL3Y380apERti2lIV0uJpRZpm
	q2RdASovqQOdNMSKgZcieeknqs4OG7cFR3GVXDE9+SaB6wufJL2hGFsoLNfmmZphuGJj
	WAfgal7HZtWArDhfcH0nqzUe0zk2/BovTsOEBXKqpBjhwgevP8DPHQ4+FU4v2FLa5QqO
	L5AQ==
X-Gm-Message-State: ALKqPweufqf5eLHODvTmsuCBEbF4/g6NedOxivIXM2FM/e161vts6BoG
	KKr8y3Wfp9HTPKBGzjLoL9sYag==
X-Received: by 2002:a63:6445:: with SMTP id
	y66-v6mr2376656pgb.283.1527084487947; 
	Wed, 23 May 2018 07:08:07 -0700 (PDT)
Received: from [10.166.151.145] (c-73-158-53-43.hsd1.ca.comcast.net.
	[73.158.53.43]) by smtp.gmail.com with ESMTPSA id
	k193-v6sm24126891pgc.39.2018.05.23.07.08.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 May 2018 07:08:06 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <20180522191743.12872-1-pbonzini@redhat.com>
	<336d4fa2-623c-1cb6-829d-71cf7039431e@redhat.com>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mdavidsaver@gmail.com; prefer-encrypt=mutual; keydata=
	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
	K+n7samiPH8tvucm6sW8SnE=
Message-ID: <f2d5a6ca-6342-0e59-0003-7a6ec3a7275d@gmail.com>
Date: Wed, 23 May 2018 07:08:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <336d4fa2-623c-1cb6-829d-71cf7039431e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH] ppc: move at24c to its own
 CONFIG_ symbol
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W5m5j/UeF0rl

On 05/22/2018 10:30 PM, Thomas Huth wrote:
> On 22.05.2018 21:17, Paolo Bonzini wrote:
>> AT24c EEPROM is currently gated by CONFIG_I2C, and as such it is
>> being included in all emulators that use I2C, even if they do not
>> really need it.  Separate it and, since it was added for the e500
>> machines, add it to qemu-system-ppc and qemu-system-ppc64.
>> ---
>>  default-configs/ppc-softmmu.mak | 1 +
>>  hw/nvram/Makefile.objs          | 2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
>> index 4d7be45ac5..c57e568121 100644
>> --- a/default-configs/ppc-softmmu.mak
>> +++ b/default-configs/ppc-softmmu.mak
>> @@ -26,6 +26,7 @@ CONFIG_USB_EHCI_SYSBUS=y
>>  CONFIG_SM501=y
>>  CONFIG_IDE_SII3112=y
>>  CONFIG_I2C=y
>> +CONFIG_AT24C=y
>>  
>>  # For Macs
>>  CONFIG_MAC=y
>> diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
>> index a912d25391..b318e53a43 100644
>> --- a/hw/nvram/Makefile.objs
>> +++ b/hw/nvram/Makefile.objs
>> @@ -1,6 +1,6 @@
>>  common-obj-$(CONFIG_DS1225Y) += ds1225y.o
>>  common-obj-y += eeprom93xx.o
>> -common-obj-$(CONFIG_I2C) += eeprom_at24c.o
>> +common-obj-$(CONFIG_AT24C) += eeprom_at24c.o
>>  common-obj-y += fw_cfg.o
>>  common-obj-y += chrp_nvram.o
>>  common-obj-$(CONFIG_MAC_NVRAM) += mac_nvram.o
> 
> Since this is a device that can only be added by the user (no board is
> using it automatically, as far as I can see),

The board which prompted me to add this device is still out there and
I'm still intent on pursuing getting it into QEMU.  It's clearly going
to be some time before this can happen as there are RTC and e500
patches that would need to get in first, and my time to spend on this
has been non-existent in recent months.

https://github.com/mdavidsaver/qemu/commits/vme

> it could be useful for
> other machines, too, I guess? Anyway, it's a good idea to have a
> separate config switch available for it, and we can add it to other
> machines again later if somebody feels that it is necessary, so (once
> you add your SoB):
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

