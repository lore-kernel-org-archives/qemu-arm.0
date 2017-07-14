Received: by 10.25.44.15 with SMTP id s15csp485356lfs;
        Thu, 13 Jul 2017 22:52:32 -0700 (PDT)
X-Received: by 10.55.113.197 with SMTP id m188mr8862163qkc.227.1500011552306;
        Thu, 13 Jul 2017 22:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500011552; cv=none;
        d=google.com; s=arc-20160816;
        b=ymOJu8s0FlEqqXUnPz/z/fetHhqmXA+TfJlxUvIv5ANvojMrvOMvknXFM5EoLzmyti
         +9koCi2aq7VNaYlnPaKFOLLWdLVyAoRDetuTM+hw7eR1La+qGmZJHWqpk/YzlR5Pg40U
         8OpgsdLY9gRLsQGxLguUMDCsuNCgm8wGJF0bNX4iyZLtnq9rqgO8dTTad/Mjcy1TQSDz
         +QoGSy5J8PRqsILu8Rhey/VzDiBUMtsTD72NaEibySYwIekG8OQAmQOa5wGB4Mp2VXzR
         7lXTtihymf+jzKkP4vH+XehDblgd6WAZh0wu+hTQgPL1SMDJEmbzCptpRbnbhxEca7fI
         g4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=52TF0QfwefGUpA5ZZ4g/u/HP9V/uX4njgW9cj1oDMq8=;
        b=gKgpq4PO1NUo3mw1pKOgX6fRDX+loiGHkvBChHddh2myK8B3GTkMWEVed1a0oA/xYD
         0Ct7N3222/11gVEm/AWN0kWxiRThRldpjs2EKOkDwlvx8zbAmc6EJQ28OPi/aQQcFT6h
         LnYF+SWv3GsA1HnKXYCORmwXvPOI0RvAWOwnXFTsuUksQIywOTjlgBhjxRjeK0bSHmqb
         zYnR5/cJchCWzI0Lamn0ro7SuVV8V1pgIhdgUx/4zkUfI2cQBuziCiOZWBzsPabC1Dmp
         jks7R4i9oLRM/xOc2ly5yAzfQidRKYZMNuUSfk8ocQHC9LArRCaRd+utk4a5IlqzwNGO
         nc1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c77si6720297qkb.328.2017.07.13.22.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 22:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVtWf-0002ZE-NO
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 01:52:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dVtWc-0002Z7-E5
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 01:52:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dVtWZ-0007ue-D6
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 01:52:26 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dVtWY-0007su-O6; Fri, 14 Jul 2017 01:52:23 -0400
Received: from 172.30.72.54 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ASB62646; Fri, 14 Jul 2017 13:52:04 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML402-HUB.china.huawei.com
	(10.3.17.38) with Microsoft SMTP Server id 14.3.301.0; Fri, 14 Jul 2017
	13:51:54 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-2-git-send-email-gengdongjiu@huawei.com>
	<20170713195930-mutt-send-email-mst@kernel.org>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <af366144-7508-98dc-d603-153de8de2e8c@huawei.com>
Date: Fri, 14 Jul 2017 13:51:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170713195930-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.59685C05.007E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 15d87c96703b443fd63e8520368b93c7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: Re: [Qemu-arm] [PATCH v5 1/3] ACPI: Add new ACPI structures and
 macros
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
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	zhengqiang10@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, james.morse@arm.com, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dR7eexNQC+UM

Michael,
  Thanks for your review.


On 2017/7/14 1:01, Michael S. Tsirkin wrote:
>> +typedef struct GhesState {
>> +    uint64_t ghes_addr_le;
>> +} GhesState;
>> +
>> +void ghes_build_acpi(GArray *table_data, GArray *hardware_error,
>> +                            BIOSLinker *linker);
>> +void ghes_add_fw_cfg(FWCfgState *s, GArray *hardware_errors);
>> +bool ghes_update_guest(uint32_t notify, uint64_t error_physical_addr);
>> +#endif
> It's pretty unusual to add the function declaration but not the
> definition.
  you are right. I will move this declaration file to another patch.
  thanks. Laszlo also ever mentioned that.

> 
>> diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
>> index afe4840..99c4041 100644
>> --- a/include/qemu/uuid.h
>> +++ b/include/qemu/uuid.h
>> @@ -44,6 +44,17 @@ typedef struct {
>>  
>>  #define UUID_NONE "00000000-0000-0000-0000-000000000000"
>>  
>> +#define UUID_BE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)        \
>> +{{{ ((a) >> 24) & 0xff, ((a) >> 16) & 0xff, ((a) >> 8) & 0xff, (a) & 0xff, \
>> +   ((b) >> 8) & 0xff, (b) & 0xff,                   \
>> +    ((c) >> 8) & 0xff, (c) & 0xff,                    \
>> +    (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) } } }
>> +
>> +/* Platform Memory, this is from UEFI 2.6 N.2.2 Section Descriptor */
> Drop "this is" from the sentence.
  OK.

> 
>> +#define UEFI_CPER_SEC_PLATFORM_MEM                   \
>> +    UUID_BE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
>> +    0xED, 0x7C, 0x83, 0xB1)
>> +
>>  void qemu_uuid_generate(QemuUUID *out);
>>  
>>  int qemu_uuid_is_null(const QemuUUID *uu);

