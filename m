Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1350ACCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:27:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDd93-0001kt-NC; Tue, 28 Oct 2025 02:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vDd8R-0000sS-1P
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:24:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vDd8O-0000fY-BL
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761632683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Guh1Uekl3vuapz7CFiOfAcyy+/bldv09DzV0CSIPBog=;
 b=MHqDbPnFlv10dIknqsa+3XBlBfOj1VxBIFOPPfNIKeOam2XAjlvXmQxSAJ4jAKOa0dfq2O
 Gl4IZnu2R69LRmNVsEVx/rkhEHTzv7WPDb9/MK03hjB/vJqWFwO5YcmULoDf9N/yBec6Ap
 XN7cuul0mSblfLq7sxcajN23KoBeD10=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-y6o69uRvOXiGBMhBZMF_DA-1; Tue, 28 Oct 2025 02:24:41 -0400
X-MC-Unique: y6o69uRvOXiGBMhBZMF_DA-1
X-Mimecast-MFC-AGG-ID: y6o69uRvOXiGBMhBZMF_DA_1761632681
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b62da7602a0so3958532a12.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632680; x=1762237480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Guh1Uekl3vuapz7CFiOfAcyy+/bldv09DzV0CSIPBog=;
 b=gsqIspLBS1XQkV5ivVJXDcpP8jrQRm7B8vuEaXIc4lZm4OZ7K6m0arHRe/xPZSzh2S
 byxyF1PFSwo1VSgUO8JYZlJVrs4LJNFb/NY5PhUTipdnCLDXQh7KZl+5bgkht34wyMVo
 TvSxCGapdAROph+zgtZVbC3Ti8IUC2fpISnWmkfzgoJV/jliGGdpx6cyKHQheDxML7Lw
 OwiMSNcnmVF+sy3ZaruQXy5Qcc6BtgC/cDgqvAXAyuRpuHSib0A9rM7Z3st2gYXWEM2+
 81VwnKumiiHBJinfD6oF/8KTQqSyfiUeF8OX5+AsByLCfCJfOajV10fIGxT7aA0XOib/
 bNPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg9qn1xALJNfQjfFUPhNQM+Ylj56wOVemUzLbgdqaCy1XSCWg1oQsxqaQ/0xPstmU4QYDBdlhZZQ==@nongnu.org
X-Gm-Message-State: AOJu0YxzfheJsubZZqyKoC8FkCtgMqsUM4sMya6Rwo8tB6wmWBn8DEq6
 +rA0FO1l7we7TazyvWlSIgOf8fF7L09ZHPBVs10ilyW8Q2tIhH52bYc/gtJoB8++vstW+fSQLPW
 IrNAZGyv9T1OhKauDkNUWE7Q8Jd7ile8oG0apuxBQG6b1VRedEHjo1g==
X-Gm-Gg: ASbGnctg2DBeFOyKyldQ63nZpjITOBrkliGFNqCPBiABbrVCWISBikww4YToV5r8RUt
 QZrb28IxBZzquKS2TA2fFz7dZSfmV0y7UTK77/+3cf267MmyDMYzUF1pM0N+ONoqMOUTBTARCaT
 f3V02M4sNsApcJBC3tdAsiD10XKexg+bCye1uRcVAvWOAubTJbOgk88S5e9y8K5ScJE9LgF0Hii
 aBx/p9dYa4ME5Lpf0ZoB0w3w8IrNTR8nGfQT8NDYlRKEc73yqIYT2Y2KBrOvBxlNZdHeZDYtrTr
 9Tve9HqXraKgakxJJijH8rcDb/5L0WMPhQVvsJdi9rnyNEysFkxtQtOJJJPJg9CGWTPM9mi0e8B
 butXfudz6Z23KtP+buj3SjIlk4qyGWoXCdXZT4ik=
X-Received: by 2002:a05:6a20:3ca2:b0:2e3:a914:aab7 with SMTP id
 adf61e73a8af0-344d4229f5cmr2626928637.47.1761632680551; 
 Mon, 27 Oct 2025 23:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE64lbqq/bITrZSJdZrfRZj9HTMnsl7PioJub74Cpui5L3PdBPHi9JLQtMPbah5hRm49bSS5Q==
X-Received: by 2002:a05:6a20:3ca2:b0:2e3:a914:aab7 with SMTP id
 adf61e73a8af0-344d4229f5cmr2626893637.47.1761632680130; 
 Mon, 27 Oct 2025 23:24:40 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a4387cbf00sm4463926b3a.2.2025.10.27.23.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 23:24:39 -0700 (PDT)
Message-ID: <666f00c4-da3e-40ed-8ad2-57bfee5b2f40@redhat.com>
Date: Tue, 28 Oct 2025 16:24:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V6 04/24] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
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
 <20251001010127.3092631-5-salil.mehta@opnsrc.net>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251001010127.3092631-5-salil.mehta@opnsrc.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L73HOP0nZm8saKbcoAbLg7m8XqKHzZMGsnfSIc3Xrig_1761632681
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
> Store the user-specified topology (socket/cluster/core/thread) and derive a
> unique 'vcpu-id'. The 'vcpu-id' is used as the slot index in the possible vCPUs
> list when administratively enabling or disabling a vCPU.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>   hw/arm/virt.c         | 10 ++++++++++
>   include/hw/arm/virt.h | 36 ++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.c      |  4 ++++
>   target/arm/cpu.h      |  4 ++++
>   4 files changed, 54 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 76f21bd56a..4ded19dc69 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2334,6 +2334,14 @@ static void machvirt_init(MachineState *machine)
>                             &error_fatal);
>   
>           aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
> +        object_property_set_int(cpuobj, "socket-id", virt_get_socket_id(n),
> +                                NULL);
> +        object_property_set_int(cpuobj, "cluster-id", virt_get_cluster_id(n),
> +                                NULL);
> +        object_property_set_int(cpuobj, "core-id", virt_get_core_id(n),
> +                                NULL);
> +        object_property_set_int(cpuobj, "thread-id", virt_get_thread_id(n),
> +                                NULL);
>   
>           if (!vms->secure) {
>               object_property_set_bool(cpuobj, "has_el3", false, NULL);
> @@ -2902,6 +2910,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>   {
>       int n;
>       unsigned int max_cpus = ms->smp.max_cpus;
> +    unsigned int smp_threads = ms->smp.threads;
>       VirtMachineState *vms = VIRT_MACHINE(ms);
>       MachineClass *mc = MACHINE_GET_CLASS(vms);
>   
> @@ -2915,6 +2924,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>       ms->possible_cpus->len = max_cpus;
>       for (n = 0; n < ms->possible_cpus->len; n++) {
>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> +        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
>           ms->possible_cpus->cpus[n].arch_id =
>               virt_cpu_mp_affinity(vms, n);
>   
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 365a28b082..683e4b965a 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -213,4 +213,40 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>               vms->highmem_redists) ? 2 : 1;
>   }
>   
> +static inline int virt_get_socket_id(int cpu_index)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.socket_id;
> +}
> +
> +static inline int virt_get_cluster_id(int cpu_index)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.cluster_id;
> +}
> +
> +static inline int virt_get_core_id(int cpu_index)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.core_id;
> +}
> +
> +static inline int virt_get_thread_id(int cpu_index)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.thread_id;
> +}
> +
>   #endif /* QEMU_ARM_VIRT_H */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 0c9a2e7ea4..7e0d5b2ed8 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2607,6 +2607,10 @@ static const Property arm_cpu_properties[] = {
>       DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
>                           mp_affinity, ARM64_AFFINITY_INVALID),
>       DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
> +    DEFINE_PROP_INT32("socket-id", ARMCPU, socket_id, 0),
> +    DEFINE_PROP_INT32("cluster-id", ARMCPU, cluster_id, 0),
> +    DEFINE_PROP_INT32("core-id", ARMCPU, core_id, 0),
> +    DEFINE_PROP_INT32("thread-id", ARMCPU, thread_id, 0),
>       DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
>       /* True to default to the backward-compat old CNTFRQ rather than 1Ghz */
>       DEFINE_PROP_BOOL("backcompat-cntfrq", ARMCPU, backcompat_cntfrq, false),

SMPCompatProps::clusters_supported isn't always true on ARM platforms. Is it safe
to add "cluster-id" property to ARM CPU, which is available to all ARM platforms?

Thanks,
Gavin

> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index dc9b6dce4c..cd5982d362 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1126,6 +1126,10 @@ struct ArchCPU {
>       QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
>   
>       int32_t node_id; /* NUMA node this CPU belongs to */
> +    int32_t socket_id;
> +    int32_t cluster_id;
> +    int32_t core_id;
> +    int32_t thread_id;
>   
>       /* Used to synchronize KVM and QEMU in-kernel device levels */
>       uint8_t device_irq_level;


