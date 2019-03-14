Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp780080wro;
        Thu, 14 Mar 2019 05:24:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxS83wZBTWuKGW/k0nOu9YtDRoB0d1pqAyhvV6jFB7NI9yJvPh8nXumqZY8NgD2oUs3Feee
X-Received: by 2002:a81:4d89:: with SMTP id a131mr786713ywb.454.1552566260528;
        Thu, 14 Mar 2019 05:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552566260; cv=none;
        d=google.com; s=arc-20160816;
        b=K3hojJ9SffNF80qRzUwsaTPesTsC8DSDZd1NNJaXyoJoxWZpkdlKEo2dXbCAUML9Pe
         Oh+jaWmbPjBVCe/+dHYs1faK1kObBzUzmS/CIxBYCxuOZ2mvznAXC+7K2reCSsdsTGQW
         vTJrorGovonaZ/P9fcGG7PHD8+cNYvauPKd1I+n0hGItRF2oU9ap8XKvdUGuzbnEVIOR
         p7urKPEflvXAB61VGgAJ6k55Xb7iu6pYvBBO6JSSRYiTXVsMitJaJ8c+nOMqYVZC05mZ
         Bv9fmiJudb7o0cZNYfjFEKcF01eneSaYBOlvMFbonJANj802la+R1hIwfFiYXSMmXlLC
         18Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=caIz21H91KUIW0k662GwuB1Kr8x0F5LJhByKK9Ze3iI=;
        b=wjdSKmniBhtuN2XCFvFW2ISvPcnqkm2w8hfyOavydMYB+oaWlXM4hS+m00Yl0r8rmp
         aqVOCyzy3xDfOdE07I6Y0OYL+kgj9FKE6Oe7tJKkQnsflUrCSvAO3iXCatMA4y2Vxosw
         FK9HDB5WwHLoiuNnOwccrCjgeDd/dQWgC39tAmTT1tEtkfgqfWyg7039bskmMRDX8BFe
         boaH2nAaBk7U/ulZo+0JnM/ibdxj4RP28PLnFCqSUfNUz4gzAt/Gs95AHPqxKRS+t3xF
         GUbmWSkd66H+h9WA9ewLjm+nPLywTa3eDzh1LAAW84sorDVw9uFwYMjsJj/do/Nvqnco
         SnvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si5917918ybk.304.2019.03.14.05.24.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 05:24:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4PPH-0000AC-Vo
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 08:24:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h4PP2-000088-VG
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 08:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h4PP2-0000Pl-7u
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 08:24:04 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2194 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h4PP1-0000O2-N4; Thu, 14 Mar 2019 08:24:04 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D9DAA7F5141995C31077;
	Thu, 14 Mar 2019 20:23:57 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.408.0; Thu, 14 Mar 2019
	20:23:56 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Eric Auger
	<eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm
	<qemu-arm@nongnu.org>
References: <93dc7574-cfef-e556-6349-f6976c4bd914@huawei.com>
Message-ID: <6d9dee31-6072-8d90-0fce-b4966d5f76c9@huawei.com>
Date: Thu, 14 Mar 2019 20:23:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <93dc7574-cfef-e556-6349-f6976c4bd914@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] About Revert this patch: arm: Allow system registers
 for KVM guests to be changed by QEMU code
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3RuMYE2AyN0/

If you think this patch will introduce some issue, we can add one function write_part_cpustate_to_list()[2] to change the specified
register instead of all the registers[1].

Below function that you added will modified all the register if new value is different with old value.
[1]:
bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
{

}

[2]:
+bool write_part_cpustate_to_list(ARMCPU *cpu, ptrdiff_t fieldoffset)
+{
+    const ARMCPRegInfo *ri;
+    uint32_t regidx, i;
+
+    for (i = 0; i < cpu->cpreg_array_len; i++) {
+        regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+        if (!ri) {
+            continue;
+        }
+
+        if (ri->type & ARM_CP_NO_RAW) {
+            continue;
+        }
+        if (ri->fieldoffset == fieldoffset) {
+            cpu->cpreg_values[i] = read_raw_cp_reg(&cpu->env, ri);
+            return true;
+        }
+    }
+    return false;
+}
+



On 2019/3/14 19:31, gengdongjiu wrote:
>  Hi   Peter/Eric,
>    I think we should fix the regression issue instead of revert this patch,  I think the reason of
>    this issue is that QEMU modified some unexpected resisters, we should find out.
> 
> 
>     Revert "arm: Allow system registers for KVM guests to be changed by QEMU code"
> 
>     This reverts commit 823e1b3818f9b10b824ddcd756983b6e2fa68730,
>     which introduces a regression running EDK2 guest firmware
>     under KVM:
> 
>     error: kvm run failed Function not implemented
>      PC=000000013f5a6208 X00=00000000404003c4 X01=000000000000003a
>     X02=0000000000000000 X03=00000000404003c4 X04=0000000000000000
>     X05=0000000096000046 X06=000000013d2ef270 X07=000000013e3d1710
>     X08=09010755ffaf8ba8 X09=ffaf8b9cfeeb5468 X10=feeb546409010756
>     X11=09010757ffaf8b90 X12=feeb50680903068b X13=090306a1ffaf8bc0
>     X14=0000000000000000 X15=0000000000000000 X16=000000013f872da0
>     X17=00000000ffffa6ab X18=0000000000000000 X19=000000013f5a92d0
>     X20=000000013f5a7a78 X21=000000000000003a X22=000000013f5a7ab2
>     X23=000000013f5a92e8 X24=000000013f631090 X25=0000000000000010
>     X26=0000000000000100 X27=000000013f89501b X28=000000013e3d14e0
>     X29=000000013e3d12a0 X30=000000013f5a2518  SP=000000013b7be0b0
>     PSTATE=404003c4 -Z-- EL1t
> 
>     with
>     [ 3507.926571] kvm [35042]: load/store instruction decoding not implemented
>     in the host dmesg.
> 
>     Revert the change for the moment until we can investigate the
>     cause of the regression.
> 
>     Reported-by: Eric Auger <eric.auger@redhat.com>
>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 

