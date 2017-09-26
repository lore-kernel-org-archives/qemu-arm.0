Received: by 10.223.172.38 with SMTP id v35csp3791589wrc;
        Tue, 26 Sep 2017 09:52:26 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCFklbar0uWIuqrHpZF8/rBAYBXvuGqbcITao42dsDZOq/vw2QJ1/zGvLSa+8HAkHLt0ryO
X-Received: by 10.55.97.208 with SMTP id v199mr15319619qkb.165.1506444746703;
        Tue, 26 Sep 2017 09:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506444746; cv=none;
        d=google.com; s=arc-20160816;
        b=faINM6zf6LC/Mp7FzPClS8U5VZ6SQqIB3rLIQ8VGGfvMWSd8qveJNWCx+CrhWL/KYp
         4Cu7hTcn8uje2oJM0mWAIxhfjTpkfVbORiIaFAmh4AvRJcGhrnHrhhHUBsThOe+pCzyQ
         D+jPv97/5mu/SVUqm3c1nHNDVPCWImlkTVtBSs3PAeOYu6VebTBN9n9jO1VMruaFs1MG
         dDVW9R1H6Vz5Usta7xDN/bKqLmF7o4cyL4znYrw0Ekm2Gg5du4ogyJl2ChqwOiy36Jfm
         TA5RKkbhI8sFvMmqY5rxDgz2DIWplAYm+Smyvu3xhnJmdeFCFmpv5NreMEbO1rEBtjuG
         g7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=vaNbrEwZvs4TQ1/NVOD/0j/qoxmOkB5uITawNUQYSoo=;
        b=rLQa+1vbM4YKluTLHUecB7vDJlwJm1uJEYU+/UKdWRCem/8SH1aQpFIvGhVaYHu4zi
         oQH0ZFa75mjE76TxxmoTQ6tVwMR3TODSqz2p011VvlpL35v+ZZZKHYSUrQhEtNklDgx1
         wHey+kL3YNPgoJH7kEWj05xBJMHbJs6awwZEHAl7E/YqfZK5pjBiI7UrQi+/lVRQz5hY
         S2QTLgQlID2OUdBjkU7wcaDdhnvFOfwb51fwcey661H45FuafwII+ot+EoYLAHq8YrjN
         G+HS2PNtyMmXT5QZmDlHEWlIlja8BEVdUC+0HRjgqm82rAKKXkOY7KqICC/hWfgWxOwr
         prfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u25si5434836qtu.376.2017.09.26.09.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 09:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwt5s-0005BH-ER
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 12:52:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1dwt5h-0005Aq-SE
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 12:52:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1dwt5e-0001gm-RJ
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 12:52:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1dwt5e-0001eJ-KS; Tue, 26 Sep 2017 12:52:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C32724E028;
	Tue, 26 Sep 2017 16:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C32724E028
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=wei@redhat.com
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A949B6046E;
	Tue, 26 Sep 2017 16:52:05 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1506088275-31734-1-git-send-email-wei@redhat.com>
	<20170926105422.vfaalzzmhufvrk34@kamzik.brq.redhat.com>
	<CAFEAcA_Wk5U89QAUHx0tsJR57LLASgnKwtMQk9-PY7sBZAm+hg@mail.gmail.com>
	<20170926153705.365mvhaf6rj65rvl@kamzik.brq.redhat.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <b860e3fd-64c3-f37d-4ae2-424936663697@redhat.com>
Date: Tue, 26 Sep 2017 11:52:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170926153705.365mvhaf6rj65rvl@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 26 Sep 2017 16:52:08 +0000 (UTC)
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
Cc: eric.auger@redhat.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ZTOW4vg/XVX



On 09/26/2017 10:37 AM, Andrew Jones wrote:
> On Tue, Sep 26, 2017 at 04:28:03PM +0100, Peter Maydell wrote:
>> On 26 September 2017 at 11:54, Andrew Jones <drjones@redhat.com> wrote:
>>> On Fri, Sep 22, 2017 at 08:51:15AM -0500, Wei Huang wrote:
>>>> Instead of using "1.0" as the system version of SMBIOS, we should use
>>>> mc->name for mach-virt machine type. This matches with x86 code and
>>>> prevents the smbios_table.machine_type test of Avocado from failing.
>>>>
>>>> Signed-off-by: Wei Huang <wei@redhat.com>
>>>> ---
>>>>  hw/arm/virt.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 9e18b41..8d0c6a9 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1189,6 +1189,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>>>>
>>>>  static void virt_build_smbios(VirtMachineState *vms)
>>>>  {
>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>>      uint8_t *smbios_tables, *smbios_anchor;
>>>>      size_t smbios_tables_len, smbios_anchor_len;
>>>>      const char *product = "QEMU Virtual Machine";
>>>> @@ -1202,7 +1203,7 @@ static void virt_build_smbios(VirtMachineState *vms)
>>>>      }
>>>>
>>>>      smbios_set_defaults("QEMU", product,
>>>> -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
>>>> +                        mc->name, false, true, SMBIOS_ENTRY_POINT_30);
>>>>
>>>>      smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
>>>>                        &smbios_anchor, &smbios_anchor_len);
>>>> --
>>>> 2.7.5
>>>>
>>>>
>>>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>
>> Are we OK to change this without having to tie it to the machine
>> version number?
> 
> Let's tie it to be safe. Eric has a 2.11 machine version patch in his
> virtio-iommu series, but, like for 2.10, he or Wei should probably just
> post that independently to make sure it gets in.
> 
> Wei, will you post the 2.11 version patch?

Will do

> 
> Thanks,
> drew
> 
