Received: by 10.182.158.201 with SMTP id ww9csp20057obb;
        Thu, 3 Dec 2015 07:20:08 -0800 (PST)
X-Received: by 10.55.71.143 with SMTP id u137mr10658863qka.1.1449156008220;
        Thu, 03 Dec 2015 07:20:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v86si8979978qkv.59.2015.12.03.07.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 07:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:35970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Vfz-0006yi-VP
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 10:20:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1a4Vfw-0006rD-U3
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:20:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1a4Vfs-00054O-7X
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:20:04 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:38407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1a4Vfr-000547-Tv
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:20:00 -0500
Received: by wmec201 with SMTP id c201so26708874wme.1
	for <qemu-arm@nongnu.org>; Thu, 03 Dec 2015 07:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=jTSU7/ZNiAY8RTtQhePQoJGbnVNBswNJ5gyVRHEKQ7I=;
	b=AhaK76NzhxHYRcqGyVAKwtSOy9cqIj8Xa4sfOjWOHG6+5569b6RajGngzKRLUDkoa/
	nsxxMuSpad7y6G0u+EwEwG+GIi9q290/OhENEFwFMIDpzlpo2quJO1k04DNwLa2lHslI
	/tXXkY9ETOySZeLMHxgRw+YUxrNP+te4CO0FzsRh6xiAwmiLHC+HVv0+dE6uOe1mS6hW
	QXXDKtnKNDsHTdZSj/2QY0Bdxsxg/QU2pg5xFkkoPUauCC4PkkE2Ldl4/EuoNUuLSoe5
	mrDf/95is1AR2Ylz5EWIZX44pH2AAro3z0aUyr0p1o2g0MuE0j5rs2AiegHTI1d9viBR
	r96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=jTSU7/ZNiAY8RTtQhePQoJGbnVNBswNJ5gyVRHEKQ7I=;
	b=lGlLKlT3qRz1KJdQF+hE+nnqmd0+itrZDWjdcbm68jJU7JUUY0UCC3JO2Pc7EKes+f
	MJcaYmcDYiar6m9LfE5W2Q/GFmnL1CyMmtvOdpWvon2bzDqoW8uJ3oR8claSL558arny
	DryIgr2IBYUqERd9DdoMonoZUIEdHS/uyzfpTaXNDHOGqDCtSob9GDek3ufKQ1HZicB7
	0kaGxG4O3CBrvckziSTG/KsBIstoR6sMmBjDy8y2QJiZTqcZ17loD+CLH7zFMwDA5sW0
	LpsbVl3/on9KUCGtMsBRVJdMrXlTKrQy/FfR6O6I3LQCTG9B3hulT6NGNa8ps4jYyqsX
	SyCA==
X-Gm-Message-State: ALoCoQkNgq+72RxZjEBTXUVzv4YZ7irT7e0TOFfIXGXBTDS3QqustYh1NXExzAIAev9c1mzbOgfJ
X-Received: by 10.28.175.135 with SMTP id y129mr13613416wme.24.1449155998855; 
	Thu, 03 Dec 2015 07:19:58 -0800 (PST)
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90]) by smtp.googlemail.com with ESMTPSA id
	h67sm35873779wmf.17.2015.12.03.07.19.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Dec 2015 07:19:57 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, eric.auger@st.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
	<1447946528-1533-3-git-send-email-eric.auger@linaro.org>
	<5656E590.3040001@redhat.com>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56605D80.70402@linaro.org>
Date: Thu, 3 Dec 2015 16:19:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5656E590.3040001@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-arm] [Qemu-devel] [RESEND RFC 2/6] device_tree: introduce
 load_device_tree_from_sysfs
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
X-TUID: dYzpOvLY/U6W

Hi Thomas, Alex,
On 11/26/2015 11:57 AM, Thomas Huth wrote:
> On 19/11/15 16:22, Eric Auger wrote:
>> This function returns the host device tree blob from sysfs
>> (/sys/firmware/devicetree/base).
>>
>> This has a runtime dependency on the dtc binary. This functionality
>> is useful for platform device passthrough where the host device tree
>> needs to be parsed to feed information into the guest device tree.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>> ---
>>  device_tree.c                | 40 ++++++++++++++++++++++++++++++++++++++++
>>  include/sysemu/device_tree.h |  1 +
>>  2 files changed, 41 insertions(+)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index a9f5f8e..58a5329 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -117,6 +117,46 @@ fail:
>>      return NULL;
>>  }
>>  
>> +/**
>> + * load_device_tree_from_sysfs
>> + *
>> + * extract the dt blob from host sysfs
>> + * this has a runtime dependency on the dtc binary
>> + */
>> +void *load_device_tree_from_sysfs(void)
>> +{
>> +    char cmd[] = "dtc -I fs -O dtb /sys/firmware/devicetree/base";
>> +    FILE *pipe;
>> +    void *fdt;
>> +    int ret, actual_dt_size;
>> +
>> +    pipe = popen(cmd, "r");
>> +    if (!pipe) {
>> +        error_report("%s: Error when executing dtc", __func__);
>> +        return NULL;
>> +    }
> 
> The Device Tree Compiler binary is normally only installed on
> developer's machines, so I somewhat doubt that it is a good idea to rely
> on the availability of that binary in QEMU? Maybe you should rather
> extend libfdt to support such a feature?

Sorry for the delay and thank you for your review/comments. According to
your feedbacks I give up my plan about using dtc binary.

Thanks

Eric
> 
>  Thomas
> 

