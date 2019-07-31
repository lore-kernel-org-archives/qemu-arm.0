Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5461084wrv;
        Wed, 31 Jul 2019 03:09:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXzD+SnRRmP00BwBITD48UmF/umOV4WEJ9tIQFjr/dCR8CZE4yFZjeM4jnidUVvhOPfapT
X-Received: by 2002:a50:f98a:: with SMTP id q10mr106229652edn.267.1564567751655;
        Wed, 31 Jul 2019 03:09:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k28si23119637ede.131.2019.07.31.03.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 03:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=SZeg6uWb;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hslXi-0007Pn-Oh
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 06:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hslXb-0007PJ-OO
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 06:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hslXa-0004st-Tw
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 06:09:03 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:59836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hslXa-0004sR-MX; Wed, 31 Jul 2019 06:09:02 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7D63D96F50;
 Wed, 31 Jul 2019 10:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564567741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtZBQB8DT4en71goxDVZvd77dEX7543VUXeHbpv0V/I=;
 b=SZeg6uWbHGINr/U/tP++VJcjrXJZZzsgMmIS5g5MzN4uhr+OgKHT4/eUo/qsSONZlxOyqB
 EG1k7Mlj0K/DwjleThrGHcPyAmRcawbsca93oDqfm+AzwIlnH3erEBXJvvosPs5War2y5j
 K0im6MJoGMZTQfhEEQlWt2jbBi3V0mE=
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-9-damien.hedde@greensocs.com>
 <20190731061108.GF2032@umbus.fritz.box>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <4e30472f-1800-af8f-4bd2-18ce7147162b@greensocs.com>
Date: Wed, 31 Jul 2019 12:09:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190731061108.GF2032@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564567741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtZBQB8DT4en71goxDVZvd77dEX7543VUXeHbpv0V/I=;
 b=wkiTmo9f4VQKQWBWc5xVqrYNPscN6jVMDEg3FisFbPby7vg29IMpmd7xmWpQkNJwV+yXpC
 kh9C/Mln4Glwr8KhS0rd7JkZlH6mKfcLWbL8MjiedxaGM84i/fFI51fZgCAoQBcx0Ka6K6
 qie70sdBoyO/sbO8Y2NoFKz1D+JqAp4=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564567741; a=rsa-sha256; cv=none;
 b=PkVK3f8pZTWsn9eP9uPzohQitzZl5p7OKPP8E/UxU655sNkNo7X87WWKHPyNxBDywrQUWF
 XuvkQw4t99GzKasyEHKlsdCYuuzE0Zts3WlQnIVBmWgrqFOHM1oYQauawM9q8mAOhuv+MU
 c1BsKxw6nzz5yQ0nNrcfQRm1k+0uPNY=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [PATCH v3 08/33] Add function to control reset with
 gpio inputs
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, jsnow@redhat.com, rth@twiddle.net, berrange@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Ho/pnXJHIwX



On 7/31/19 8:11 AM, David Gibson wrote:
> On Mon, Jul 29, 2019 at 04:56:29PM +0200, Damien Hedde wrote:
>> It adds the possibility to add 2 gpios to control the warm and cold reset.
>> With theses ios, the reset can be maintained during some time.
>> Each io is associated with a state to detect level changes.
>>
>> Vmstate subsections are also added to the existsing device_reset
>> subsection.
> 
> This doesn't seem like a thing that should be present on every single
> DeviceState.

I can revert to previous version where the io state has to be explicitly
added in devices using it.

Damien
