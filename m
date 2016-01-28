Received: by 10.25.159.19 with SMTP id i19csp267415lfe;
        Thu, 28 Jan 2016 01:39:28 -0800 (PST)
X-Received: by 10.140.22.210 with SMTP id 76mr2235863qgn.70.1453973968473;
        Thu, 28 Jan 2016 01:39:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si8847603qka.3.2016.01.28.01.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 01:39:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOj32-00085v-0W
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 04:39:28 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOj2z-00083F-9T
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 04:39:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOj2v-0008JW-1Q
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 04:39:25 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:38052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOj2u-0008IO-QU
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 04:39:20 -0500
Received: by mail-wm0-x229.google.com with SMTP id p63so15984962wmp.1
	for <qemu-arm@nongnu.org>; Thu, 28 Jan 2016 01:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=OnMa8JnHnw3punhsFOQWa7DN3pXwYo9rqYxNf9mjEHY=;
	b=XQ4fG0hm/gdSvflAFSD3YiQ3x2dMnrXWNlTQS6X5A/kpiCgiDQIg4V1BEKI5yAzEjm
	2L8A7tzZv52wLYWuVhoK8vMpoYwAYu4AZxVZGi6tcuF6UUGbTPOWloLQ4fPkikU4pa/S
	WQZrDB3e61qyCkyuJtXSYOp6t/1lyF85Sv/VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=OnMa8JnHnw3punhsFOQWa7DN3pXwYo9rqYxNf9mjEHY=;
	b=MU69BQNHjXyPWKByn2ddYSqD3KsgkMVrl5u/tmwaxih1suxaEdRdmlGhFiwP/6fr1K
	hSDu9FmTQPjJi2Kr6SHyx5fh3Kur9ttoqQjh+DljPqS1QuxRRtYbiTgNQ4MJTbltp2Ak
	myXhghnOcaIHXnvj6zpuEDrUAzVGVPlYmB5ihQkXZvEYlvF56NxCP95KoxmEM9GHKpkq
	WyswksBBcJlbIOlPSiUW0Py/2q5met/ST+//0peAssRRwt27AKlDcvWAXZVn7Ql+0MjG
	6+KOkplcXwohP5cXpJVsJxKz3CMxGJYh7jAlMFEoy2H8/jXzbcq7heMt9vFFMku1ZSRq
	NaSA==
X-Gm-Message-State: AG10YOQcn4fZ/ykKrvcjkxuomqlSdScyZObdb29WbxDW7JQpm35q7A5CjB3CPaFGunvOgEj6
X-Received: by 10.28.73.135 with SMTP id w129mr2145265wma.55.1453973958932;
	Thu, 28 Jan 2016 01:39:18 -0800 (PST)
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90]) by smtp.googlemail.com with ESMTPSA id
	l67sm1969885wmf.11.2016.01.28.01.39.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jan 2016 01:39:17 -0800 (PST)
To: Pavel Fedin <p.fedin@samsung.com>, eric.auger@st.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	alex.williamson@redhat.com, pranav.sawargaonkar@gmail.com,
	pbonzini@redhat.com, agraf@suse.de
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
	<1453902715-25304-7-git-send-email-eric.auger@linaro.org>
	<00a901d1599a$eba575a0$c2f060e0$@samsung.com>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56A9E1B4.2000608@linaro.org>
Date: Thu, 28 Jan 2016 10:39:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <00a901d1599a$eba575a0$c2f060e0$@samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: Re: [Qemu-arm] [RFC 6/7] hw: arm: virt: register reserved IOVA
	region
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fGf9qsThpCYc

Hi Pavel,
On 01/28/2016 08:10 AM, Pavel Fedin wrote:
>  Hello!
> 
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 3839c68..7eaf8be 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -125,6 +125,7 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>> +    [VIRT_RESERVED] =           { 0x0be00000, 0x00100000 },
> 
>  Looks like with this approach we would need to add this to all machine models which make use of PCI. But is it a good idea?
Yes that's correct. On the other hand not all platforms do need that
feature.
 As far
> as i understand, the only requirement for this region is not to clash with guest RAM addresses. So, can we instead have some code,
> which automatically finds some place, based on the size?
Maybe we could use the IOVA region already reserved for platform bus
which is currently sparsely used (by vfio platform devices).
 For now we hardcode the size to 0x00100000, but in future we could query
> the host for the size, because it's still host's MSI controller.
Yes I agree, this is something we currently miss. I need to study how we
can go through all domains/groups and get the max number of MSI frames
used by any.

Thanks for the follow-up!

Regards

Eric
> 
> Kind regards,
> Pavel Fedin
> Senior Engineer
> Samsung Electronics Research center Russia
> 
> 

