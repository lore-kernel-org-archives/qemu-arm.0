Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169C9CCD184
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 00:35:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v86Ww-0000F1-MZ; Sun, 12 Oct 2025 20:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1v86Wv-0000Ek-KU
 for qemu-arm@nongnu.org; Sun, 12 Oct 2025 20:35:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1v86Wt-00050S-59
 for qemu-arm@nongnu.org; Sun, 12 Oct 2025 20:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760315709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLkzTmc0J/Vnz1+BM6/9AELfBTuhpivdjlMN5vXkdKg=;
 b=M34dheFhv8wW7pd9U/Ys/jmKveBsmYnk/bf6EuJqW1rBGcAxgckit6gbI4UjcLhhBBlotc
 UxbF0OfqxX+uLS/rdKMCH7nyVENcmpEHA8R6J3xe5YdtPMdpfLWh+T+/uyEauKp4uZsW9U
 J6Hx4E0bhGvElrIoIbvcea49RtWslrs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-32cLm01IOQiwbyT46e0gQw-1; Sun, 12 Oct 2025 20:35:07 -0400
X-MC-Unique: 32cLm01IOQiwbyT46e0gQw-1
X-Mimecast-MFC-AGG-ID: 32cLm01IOQiwbyT46e0gQw_1760315707
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b630b4d8d52so7201427a12.3
 for <qemu-arm@nongnu.org>; Sun, 12 Oct 2025 17:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760315706; x=1760920506;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WLkzTmc0J/Vnz1+BM6/9AELfBTuhpivdjlMN5vXkdKg=;
 b=l6244r9QmCP51JI88OBT8SRK2GQxb1i+vmni/KVAMWAb94lftAfsS7nI3zZ7iwCTr8
 JPBXb2Vo1GHKCYYNyMP0gOxKHWF2Hm1E/I4WfKfwRh6UOcSAvt/GUAYSpNC/Ahjg9t1C
 TsrQ+mWZzER9B4h6yEjKFaku6jGiQst8fXqjgau+q9vrvQrhbxoixfSTZ39YTIUo2YEJ
 7Ha4pbVHDJpYF4QFDclwdJTdHGetNH5OZIGMMgkDjOOtt7QHuZvGl2YxaUf+hvTNimMj
 AyJRkHD3p1DZcqVh+KLwxr5cJrYa9c0VAXjXzK4Jr69pAyM7PKMZmu5dpbqxpPt5LRqG
 /0Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ8M2vs0ElyQhEJTPSvX9yA7LmPFR3RhL5fLQS/wOIDG9KSQMTlvZS4H+2LRui40dYlcSiceKdqw==@nongnu.org
X-Gm-Message-State: AOJu0Yz3Y2udp8K08SE8Xqgh5xuN7XdNfQKa+YR8z/sViHG+85ZUguZp
 uLDYtBlLuxa0cGbXu8T/E2SP4aFCFyR5Yewr6Kbe9MPRLlPLUGMXrDnDYCk1r+5b9GafHIrmtMt
 tCCI9P45HHgjEktFH4ia8RFXVepCWbG036/XnG7hXY8jMcUC5qRJoAw==
X-Gm-Gg: ASbGncuOpOIwh/fi+oD2yVZARFAnQyZae4OXp2tTIT57gJJNIqpfyYGCYyifWa6IYkx
 ZD71BWOjTFfRC3x58AaeGrb2vwD8f+2WCwfUpcnr2FS8/uywb6GzEEeKQR3jzaY8pQMDSeGXQLx
 BhiANfKt1cstbuuvNLF4w4v3W3KAvg3+nH0ZcPLnBM9bOv1bFKjMlMBBER5bJVaUfpF8FyxYxnl
 HQ9L14X2bF7En/zz5wC3eT65tC42La7osMGQTJPEkDfXqplerBxTO1FGkkJCocEsge9KIZ2OgK4
 D3tAR/09PNsogqfN6zAqUVm0uLRnrbA2Flw6QW/MoxE0LXLwWrDkvEk5NGFupvpmFeKWlrnhy7S
 5ax3l
X-Received: by 2002:a17:902:cf11:b0:28e:c75e:61d9 with SMTP id
 d9443c01a7336-290272c200amr249728535ad.38.1760315706426; 
 Sun, 12 Oct 2025 17:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6mGZnAmHpocPbmA3MCbuRFpYvNYlCfR0+b4MUUl16dGvwCSgVxpIdSZevKUSfFo1wuSBgvg==
X-Received: by 2002:a17:902:cf11:b0:28e:c75e:61d9 with SMTP id
 d9443c01a7336-290272c200amr249728285ad.38.1760315705954; 
 Sun, 12 Oct 2025 17:35:05 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f08912sm115232995ad.78.2025.10.12.17.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Oct 2025 17:35:04 -0700 (PDT)
Message-ID: <9fd84d8a-62b8-46c2-b91f-4c5c8d909896@redhat.com>
Date: Mon, 13 Oct 2025 10:34:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V6 00/24] Support of Virtual CPU Hotplug-like Feature
 for ARMv8+ Arch
To: salil.mehta@opnsrc.net, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com
Cc: salil.mehta@huawei.com, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, imammedo@redhat.com,
 armbru@redhat.com, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hnRRv3vQHA0b2lnhAR_qG4m5NhgafWY1qjLG53wGzCw_1760315707
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Salil,

On 10/1/25 11:01 AM, salil.mehta@opnsrc.net wrote:
> From: Salil Mehta <salil.mehta@huawei.com>
> 
> [!] Sending again: It looks like mails sent from my official ID are being held
> somewhere. Hence, I am using my other email address. Sorry for any inconvenience
> this may have caused.
> 

[...]

> 
> ============================
> (X) ORGANIZATION OF PATCHES
> ============================
> 
>   [Patch 1-2, 22-23] New HMP/QMP interface ('device_set') related changes
>      (*) New ('DeviceState::admin_power_state') property; Enabled/Disabled States and handling
>      (*) New Qemu CLI parameter ('-smp CPUS, disabled=N') handling
>      (*) Logic to find the existing object not part of the QOM
>   [Patch 3-5, 10] logic required during machine init.
>      (*) Some validation checks.
>      (*) Introduces core-id,socket-id,cluster-id property and some util functions required later.
>      (*) Logic to setup lazy realization of the QOM vCPUs
>      (*) Logic to pre-create vCPUs in the KVM host kernel.
>   [Patch 6-7, 8-9] logic required to size the GICv3 State
>      (*) GIC initialization pre-sized with possible vCPUs.
>      (*) Introduction of the GICv3 CPU Interface `accessibility` property & accessors
>      (*) Refactoring to make KVM & TCG 'GICv3CPUState' initialization common.
>      (*) Changes in GICv3 post/pre-load function for migration
>   [Patch 11,14-16,19] logic related to ACPI at machine init time.
>      (*) ACPI CPU OSPM interface for ACPI _STA.Enable/Disable handling
>      (*) ACPI GED framework to cater to CPU DeviceCheck/Eject Events.
>      (*) ACPI DSDT, MADT changes.
>   [Patch 12-13, 17] Qdev, Virt Machine, PowerState Handler Changes
>      (*) Changes to introduce 'PowerStateHandler' and its abstract interface.
>      (*) Qdev changes to handle the administrative enabling/disabling of device
>      (*) Virt Machine implementation of 'PowerStateHandler' Hooks
>      (*) vCPU thread user-space parking and unparking logic.
>   [Patch 18,20-21,24] Misc.
>      (*) Handling of SMCC Hypercall Exits by KVM to Qemu for PSCI.
>      (*) Mitigation to avoid using 'pause_all_vcpus' during ICC_CTLR_EL1 reset.
>      (*) Mitigation when TCG 'TB Code Cache' is found saturated
> 

[...]

> 
> ================
> (XII) Change Log
> ================
> 

Here seems missed the changelog from RFCv5 -> RFCv6?

> RFC V4 -> RFC V5:
> -----------------
> 1. Dropped "[PATCH RFC V4 19/33] target/arm: Force ARM vCPU *present* status ACPI *persistent*"
>     - Seperated the architecture agnostic ACPI changes required to support vCPU Hotplug
>       Link: https://lore.kernel.org/qemu-devel/20241014192205.253479-1-salil.mehta@huawei.com/#t
> 2. Dropped "[PATCH RFC V4 02/33] cpu-common: Add common CPU utility for possible vCPUs"
>     - Dropped qemu{present,enabled}_cpu() APIs. Commented by Gavin (Redhat), Miguel(Oracle), Igor(Redhat)
> 3. Added "Reviewed-by: Miguel Luis <miguel.luis@oracle.com>" to [PATCH RFC V4 01/33]
> 3. Dropped the `CPUState::disabled` flag and introduced `GICv3State::num_smp_cpus` flag
>     - All `GICv3CPUState' between [num_smp_cpus,num_cpus) are marked as 'inaccessible` during gicv3_common_realize()
>     - qemu_enabled_cpu() not required - removed!
>     - removed usage of `CPUState::disabled` from virt.c and hw/cpu64.c
> 4. Removed virt_cpu_properties() and introduced property `mp-affinity` get accessor
> 5. Dropped "[PATCH RFC V4 12/33] arm/virt: Create GED device before *disabled* vCPU Objects are destroyed"
> 

[...]

It maybe known issue, but there are a bunch of failing qtests, listed as below.

# make -j 60 check-qtest
   :
Summary of Failures:

10/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/xlnx-versal-trng-test     ERROR            0.48s   killed by signal 6 SIGABRT
11/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/xlnx-canfd-test           ERROR            0.49s   killed by signal 6 SIGABRT
12/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/ast2700-gpio-test         ERROR            0.47s   killed by signal 6 SIGABRT
13/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/ast2700-hace-test         ERROR            0.48s   killed by signal 6 SIGABRT
14/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/ast2700-smc-test          ERROR            0.48s   killed by signal 6 SIGABRT
23/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp                  ERROR            3.14s   killed by signal 6 SIGABRT
26/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test          ERROR            8.83s   killed by signal 6 SIGABRT
27/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test                  ERROR           12.75s   killed by signal 6 SIGABRT
28/29 qemu:qtest+qtest-aarch64 / qtest-aarch64/qos-test                  ERROR           16.32s   killed by signal 6 SIGABRT

Ok:                20
Fail:              9

Thanks,
Gavin


