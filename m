Received: by 10.223.172.38 with SMTP id v35csp4469526wrc;
        Wed, 27 Sep 2017 02:01:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDyY4SSCdFMNr6Y2/GHBs0UEtv4KN7ialrA+NVbcFDsHsBmBy5y6LYSW+Rju1zru4yjEaGL
X-Received: by 10.55.177.198 with SMTP id a189mr1269149qkf.77.1506502874184;
        Wed, 27 Sep 2017 02:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506502874; cv=none;
        d=google.com; s=arc-20160816;
        b=OLqiKu1of9Z625zevKca2mCcmXsUryi4RgB6WIiHwPxhJ9PmhMV8/3SRp8xwZ10Igj
         NQGEPpZzekjXDtcMGLLNfFd+cgAWnqAkoFai8+J8WA7rUcB6emi5VJ7PnSwfn9aIIC3W
         xST19JIa6HVGhB6O8nO20paetmXQrRY7A/oq/mjbZNgQdxs2LOD7f9x99xItdZbC6m0c
         vjmN52lnNREQ9PJzQhouZ8cQrFVweRc57sq9ajIojEPT+OvukTMbhov/byIi3RqZwyOw
         Tv8/M4BrjtEsupS4Q/y1pCt7R7D1t82TuSkovbceaJsma+ynmBZrGoRchp8bocgbSbrw
         aBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=jzZAer3cjXgS/2jRWfBBcrXmCT7Rq6SzpDfYuAIZUyw=;
        b=lW28IMrQ7Tg7i73onNp6KoXd1qpb25+n9NsNKO0YD15c5ofDVw0o3hG5yW1MZ1hHyD
         mep3uGyPWoxAve62aCFLyvNtRODga+58QUmIGoog3kdsQRL4KuonWYDfjOd3X9lHS6Dh
         DeJyndD6mXEf8+jdvsZbMbYCRhrxTUJU7I3Wxpl5ysHXYkRg1si9laZdKNmV6Q2zfEy5
         Q5v6SgST+pyywu9/qANvvV+1bBgiO3stpMyIkXHvPwPiz6fCx5Ef/5WC9LlFvbmbg4l3
         uN4pYOvP+eK2ZZ+Sx2PF8p6aU5fcRGUx9Y0IKsf74Ot1Z9Evl/V5mo/8i/Q+K/8iBGMX
         xFtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8si2116350qtb.345.2017.09.27.02.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 02:01:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx8DP-0004yu-Sc
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 05:01:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dx8C9-0003tP-7a
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dx8C4-0003kE-Di
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:59:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dx8C4-0003jy-5T; Wed, 27 Sep 2017 04:59:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A561C0587C1;
	Wed, 27 Sep 2017 08:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2A561C0587C1
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6156BF64;
	Wed, 27 Sep 2017 08:59:45 +0000 (UTC)
To: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1506088275-31734-1-git-send-email-wei@redhat.com>
	<20170926105422.vfaalzzmhufvrk34@kamzik.brq.redhat.com>
	<CAFEAcA_Wk5U89QAUHx0tsJR57LLASgnKwtMQk9-PY7sBZAm+hg@mail.gmail.com>
	<20170926153705.365mvhaf6rj65rvl@kamzik.brq.redhat.com>
	<b860e3fd-64c3-f37d-4ae2-424936663697@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b9bb5d96-14af-fde5-95a4-6d56a718f548@redhat.com>
Date: Wed, 27 Sep 2017 10:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b860e3fd-64c3-f37d-4ae2-424936663697@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 27 Sep 2017 08:59:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS
 system version to mc->name
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I0Yn+BMF2kBU

Hi Wei,

On 26/09/2017 18:52, Wei Huang wrote:
> 
> 
> On 09/26/2017 10:37 AM, Andrew Jones wrote:
>> On Tue, Sep 26, 2017 at 04:28:03PM +0100, Peter Maydell wrote:
>>> On 26 September 2017 at 11:54, Andrew Jones <drjones@redhat.com> wrote:
>>>> On Fri, Sep 22, 2017 at 08:51:15AM -0500, Wei Huang wrote:
>>>>> Instead of using "1.0" as the system version of SMBIOS, we should use
>>>>> mc->name for mach-virt machine type. This matches with x86 code and
>>>>> prevents the smbios_table.machine_type test of Avocado from failing.
>>>>>
>>>>> Signed-off-by: Wei Huang <wei@redhat.com>
>>>>> ---
>>>>>  hw/arm/virt.c | 3 ++-
>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> index 9e18b41..8d0c6a9 100644
>>>>> --- a/hw/arm/virt.c
>>>>> +++ b/hw/arm/virt.c
>>>>> @@ -1189,6 +1189,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>>>>>
>>>>>  static void virt_build_smbios(VirtMachineState *vms)
>>>>>  {
>>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>>>      uint8_t *smbios_tables, *smbios_anchor;
>>>>>      size_t smbios_tables_len, smbios_anchor_len;
>>>>>      const char *product = "QEMU Virtual Machine";
>>>>> @@ -1202,7 +1203,7 @@ static void virt_build_smbios(VirtMachineState *vms)
>>>>>      }
>>>>>
>>>>>      smbios_set_defaults("QEMU", product,
>>>>> -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
>>>>> +                        mc->name, false, true, SMBIOS_ENTRY_POINT_30);
>>>>>
>>>>>      smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
>>>>>                        &smbios_anchor, &smbios_anchor_len);
>>>>> --
>>>>> 2.7.5
>>>>>
>>>>>
>>>>
>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>
>>> Are we OK to change this without having to tie it to the machine
>>> version number?
>>
>> Let's tie it to be safe. Eric has a 2.11 machine version patch in his
>> virtio-iommu series, but, like for 2.10, he or Wei should probably just
>> post that independently to make sure it gets in.
>>
>> Wei, will you post the 2.11 version patch?
> 
> Will do

yep, feel free to reuse my patch and remove the noiommu field.

Thanks

Eric
> 
>>
>> Thanks,
>> drew
>>
> 
