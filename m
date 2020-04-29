Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp476952lfm;
        Wed, 29 Apr 2020 04:54:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypKKHFgOJThU0EhzVu/6QXZrsIcJeKo7KPyuBfJZPkiSPbLIqe52fMhYe5PV3B5WEr1bvaoz
X-Received: by 2002:ac8:1ad1:: with SMTP id h17mr34322381qtk.9.1588161281152;
        Wed, 29 Apr 2020 04:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588161281; cv=none;
        d=google.com; s=arc-20160816;
        b=zHrDQcR+HRBi50L9uVlcLpWhaz/U0qN2BkG7tujmw0kC5nnd/Snh/wrm5cb1WNtNzg
         8vEoE4NMOpOP707EVbsOYxhOZlqNUv1Eyyw2Ig1/lh4X5ApuYeWLDfg+xtmmaz/ILLsx
         imf//BcJbSV176oG2vGFuBkITkLlzHJqhOEplOZ26pDNrZeR+/zjY5HDD5GKbnxR6c0u
         twkgxxCXmsO/akUIUNhnL2k3fruTy53JdLYlVKq2ndGoUnlAEDCVZbW0/zUduQ+harXU
         GuGrwq325OOPXDmugEwBBGgJuNG/3fUtEERp6JZc08cNxn0gW/z2tww3Cuh3nDPlVflo
         eQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=wgGdw87WsEetk5OcDdcjSZYjmWLEGzVXMGhGpTkWO4s=;
        b=SCI67KnLRYPseXdiPQUjy65oc9i+l0H7N81thXDymXH38BK7UcqNS2ZVQijw9WlTuF
         xLdBZHkqi/mCnUnDqYxv59SAwH/I8KKvxSwXuzmEdm28/j5eKw4Sa52BDtWF/EAUmw+t
         fpEG2GZxAV/IYhI53dPXbtxD8Jzh0aF39QVzxosHJBMh7ype3xEUtClccpHVLNnSitfS
         FquXWz/ArUBD4TL0ElLDnyVqmctVZDE58GfxoFBWjRupu2PPGplqLnOaXTRQP8EZzsjo
         Jw2FLiMHBoD33x7aACyA8vOrhpA0K9LPV/VrIP6LCi1ra2lp+dPKhrtFqP4HkBGm4tGN
         Ke5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 126si12313003qkn.3.2020.04.29.04.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 04:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTlIW-0000xO-Iq
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 07:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1jTlHQ-0007SH-4q
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 07:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1jTlHO-00025z-Ue
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 07:53:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16816
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jTlHO-00024e-FP; Wed, 29 Apr 2020 07:53:30 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TBVGKg168157; Wed, 29 Apr 2020 07:53:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30q80pj2g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 07:53:26 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03TBdMDu189276;
 Wed, 29 Apr 2020 07:53:26 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30q80pj2fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 07:53:25 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03TBj2qW011051;
 Wed, 29 Apr 2020 11:53:25 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 30mcu6wjh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 11:53:25 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03TBrOKj19071432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 11:53:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 842FEAE05F;
 Wed, 29 Apr 2020 11:53:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AA08AE05C;
 Wed, 29 Apr 2020 11:53:24 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 11:53:24 +0000 (GMT)
Subject: Re: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by
 default
To: Cornelia Huck <cohuck@redhat.com>
References: <20200427143145.16251-1-eric.auger@redhat.com>
 <20200428123826.1ec68e6c.cohuck@redhat.com>
 <0257ca1e-2323-e437-4e19-d8a4dfa6d792@linux.ibm.com>
 <20200429081129.18e9760a.cohuck@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <b109541b-36cf-03b3-eac7-910f1caafa55@linux.ibm.com>
Date: Wed, 29 Apr 2020 07:53:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200429081129.18e9760a.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_04:2020-04-29,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 07:53:27
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ipkmadXtgJE4

On 4/29/20 2:11 AM, Cornelia Huck wrote:
> On Tue, 28 Apr 2020 16:13:05 -0400
> Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>> On 4/28/20 6:38 AM, Cornelia Huck wrote:
>>> On Mon, 27 Apr 2020 16:31:43 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>   
>>>> Instead of using a compat in the mach-virt machine to force
>>>> PPI off for all virt machines (PPI not supported by the
>>>> tpm-tis-device device), let's simply change the default value
>>>> in the sysbus device.
>>>>
>>>> Best Regards
>>>>
>>>> Eric
>>>>
>>>> Eric Auger (2):
>>>>     tpm: tpm-tis-device: set PPI to false by default
>>>>     hw/arm/virt: Remove the compat forcing tpm-tis-device PPI to off
>>>>
>>>>    hw/arm/virt.c           | 5 -----
>>>>    hw/tpm/tpm_tis_sysbus.c | 2 +-
>>>>    2 files changed, 1 insertion(+), 6 deletions(-)
>>>>   
>>> I think we can apply the compat machines patch on top of these two
>>> patches.
>>>
>>> Q: Who will queue this and the machine types patch? It feels a bit
>>> weird taking arm patches through the s390 tree :)
>>>   
>> I can queue them and would send the PR soon. I am also fine with someone
>> else doing it.
> Would be great if you could queue these together with
> https://patchew.org/QEMU/20200424090314.544-1-cohuck@redhat.com/
> (hopefully should still apply cleanly, let me know if a respin is
> needed).
>
It's probably better to respin:

 > patches apply id:20200424090314.544-1-cohuck@redhat.com
Applying: hw: add compat machines for 5.1
Using index info to reconstruct a base tree...
M    hw/arm/virt.c
Falling back to patching base and 3-way merge...
Auto-merging hw/arm/virt.c
CONFLICT (content): Merge conflict in hw/arm/virt.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch' to see the failed patch
Patch failed at 0001 hw: add compat machines for 5.1
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


