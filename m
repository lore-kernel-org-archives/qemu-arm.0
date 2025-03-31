Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp1842559njd;
        Sun, 30 Mar 2025 18:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWo9My5i8JUaVNTkQmSCtMjDA0YUVMKoIYfJ2P5HXveNZui+JV+I+JFJGoOv+Apso8EMA+QDwTX4OZf/w==@linaro.org
X-Google-Smtp-Source: AGHT+IGFXE+4oSzfkXbuLhvjKZPFctfABeEn82YKLrnG8B1u908bVPn7Tu8SR1vJFU8k6S8xDSzb
X-Received: by 2002:ac8:7f56:0:b0:477:5d31:9c3f with SMTP id d75a77b69052e-477f79d5301mr99820971cf.42.1743384951771;
        Sun, 30 Mar 2025 18:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743384951; cv=none;
        d=google.com; s=arc-20240605;
        b=RawJLm3eY8rWYU7np81FGvQb5FAIS/xwuik48hY9LeGqkMNgg5OPIpUBuw128j5mvl
         AEbjibMcEFAElZPw+zeAthxLqQiGUATu8DF3smv7tbhEGQM+tTZAVC2U4UIZUBUbseTg
         c4aDtBql3EJs1g2rwUEHGrmdCrlL9dk7uDgLbnE8IzCV+op/5axRZcdYGYKxKp3JqbBC
         rAEQlHqC/UkWdmC1w5JC7ulh6BmZJAfuN8aU7sZUUoeibIJcQtzcDiYP5ZNQX99lmLM2
         SfS26B6YX+KNiV5ED5vsekg1/dnIgjBAKfSg7gQLL0VuFoGOTx2S88qISVNxUq043L67
         2rxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uKlqOdhnxF9XZFanemfUUs541QDubDS3SJU+AHnhLXQ=;
        fh=DY5/iPQTkaegFowhDos3pccVqX4NyD5RR8nxFVZ/2MQ=;
        b=XZ5KUquDwHvkMJuCqY13L8q84N6dHGtldxSs1pijBbrLuTEajUa7cROtOhmnfxZIGh
         HVnxAaN/xRsBQcm+aBbmPIFKi4wCHOQrqKcWop70YB+1+c+oQDGGCDsq+Uobv8cVf70P
         5V6lTs7nux42lFj7UA2717APA0BgVtIl3l2LtZzazPTWbSCuH4ytvcP+z7f7nu1ay8AF
         OrS57H3KTdHxK0+V+dUnaoHAoz+KudTE1/9sUUrt1DlwTY3eRNoB/rx9mRTy2okw8B6A
         huJfLg/hptEpG6qmOx+PiRk1R7T8U8Eb1twmkpp8gN1zIbe/pdaIrIKSJPIdgaU2Dx7i
         eUbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=Y9T8wdN7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-477831ae13bsi59548901cf.619.2025.03.30.18.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Mar 2025 18:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=Y9T8wdN7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tz441-0005w4-Cl; Sun, 30 Mar 2025 21:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1tz43r-0005l7-W2; Sun, 30 Mar 2025 21:35:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1tz43q-0005CG-3B; Sun, 30 Mar 2025 21:35:35 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UNrlYe027570;
 Mon, 31 Mar 2025 01:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=corp-2023-11-20; bh=uKlqO
 dhnxF9XZFanemfUUs541QDubDS3SJU+AHnhLXQ=; b=Y9T8wdN7+S4CTFfg8JhrJ
 NtyZcs+XQWv2b8xGt0CI+sFN9s6ns5Zt1NfO7Ju+LNpWsRtyfTIQp88Y7sa0h2xo
 qWipMzKjZ1eeEPFuiKgVRDfn7M6H2XXNQF6guMX+ZS89WKwlRxVrHZj+YGGI/988
 yCeNy0K2vlceuFlu7KvWU2ar5J6fQnOHBDIRAHEErs3kkuOsIJ2UsPFkEMJUf3ud
 9JPtMEeg2mK5qJaVyqiyXDO6XpEBXAR/yIOUecavzrm0dEQ/+2026jtdFzuV+mPQ
 hVc+8Q5knGOm9DGd8VL8Yoz3ILMebaofzabJe1OYsi71wuz6YHAip/beoKZuq6r5
 w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p79c2ery-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Mar 2025 01:34:59 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 52UNQAtp032594; Mon, 31 Mar 2025 01:34:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 45p7a7ddtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Mar 2025 01:34:58 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52V1YfxT015214;
 Mon, 31 Mar 2025 01:34:57 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 45p7a7ddms-8; Mon, 31 Mar 2025 01:34:56 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Cc: pbonzini@redhat.com, zhao1.liu@intel.com, mtosatti@redhat.com,
 sandipan.das@amd.com, babu.moger@amd.com, likexu@tencent.com,
 like.xu.linux@gmail.com, groug@kaod.org, khorenko@virtuozzo.com,
 alexander.ivanov@virtuozzo.com, den@virtuozzo.com,
 davydov-max@yandex-team.ru, xiaoyao.li@intel.com,
 dapeng1.mi@linux.intel.com, joe.jin@oracle.com,
 peter.maydell@linaro.org, gaosong@loongson.cn, chenhuacai@kernel.org,
 philmd@linaro.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 arikalo@gmail.com, npiggin@gmail.com, danielhb413@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, iii@linux.ibm.com, thuth@redhat.com,
 flavra@baylibre.com, ewanhai-oc@zhaoxin.com, ewanhai@zhaoxin.com,
 cobechen@zhaoxin.com, louisqi@zhaoxin.com, liamni@zhaoxin.com,
 frankzhu@zhaoxin.com, silviazhao@zhaoxin.com
Subject: [PATCH v3 07/10] target/i386/kvm: query kvm.enable_pmu parameter
Date: Sun, 30 Mar 2025 18:32:26 -0700
Message-ID: <20250331013307.11937-8-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250331013307.11937-1-dongli.zhang@oracle.com>
References: <20250331013307.11937-1-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503310009
X-Proofpoint-GUID: RJcy_F8DOBA9Y14oXQWwQkwHzR6F2YWj
X-Proofpoint-ORIG-GUID: RJcy_F8DOBA9Y14oXQWwQkwHzR6F2YWj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.368,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yb7PjB95Y67s

There is no way to distinguish between the following scenarios:

(1) KVM_CAP_PMU_CAPABILITY is not supported.
(2) KVM_CAP_PMU_CAPABILITY is supported but disabled via the module
parameter kvm.enable_pmu=N.

In scenario (1), there is no way to fully disable AMD PMU virtualization.

In scenario (2), PMU virtualization is completely disabled by the KVM
module.

To help determine the scenario, read the kvm.enable_pmu value from the
sysfs module parameter.

There isn't any requirement to initialize 'pmu_version',
'num_pmu_gp_counters' or 'num_pmu_fixed_counters', if kvm.enable_pmu=N.

In addition, return error when kvm.enable_pmu=N but the user wants to enable
vPMU.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
Changed since v2:
  - Rework the code flow following Zhao's suggestion.
  - Return error when:
    (*kvm_enable_pmu == 'N' && X86_CPU(cpu)->enable_pmu)

 target/i386/kvm/kvm.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6b49549f1b..f68d5a0578 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2051,13 +2051,35 @@ int kvm_arch_pre_create_vcpu(CPUState *cpu, Error **errp)
          * behavior on Intel platform because current "pmu" property works
          * as expected.
          */
-        if ((pmu_cap & KVM_PMU_CAP_DISABLE) && !X86_CPU(cpu)->enable_pmu) {
-            ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_PMU_CAPABILITY, 0,
-                                    KVM_PMU_CAP_DISABLE);
-            if (ret < 0) {
-                error_setg_errno(errp, -ret,
-                                 "Failed to set KVM_PMU_CAP_DISABLE");
-                return ret;
+        if (pmu_cap) {
+            if ((pmu_cap & KVM_PMU_CAP_DISABLE) &&
+                !X86_CPU(cpu)->enable_pmu) {
+                ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_PMU_CAPABILITY, 0,
+                                        KVM_PMU_CAP_DISABLE);
+                if (ret < 0) {
+                    error_setg_errno(errp, -ret,
+                                     "Failed to set KVM_PMU_CAP_DISABLE");
+                    return ret;
+                }
+            }
+        } else {
+            /*
+             * KVM_CAP_PMU_CAPABILITY is introduced in Linux v5.18. For old
+             * linux, we have to check enable_pmu parameter for vPMU support.
+             */
+            g_autofree char *kvm_enable_pmu;
+
+            /*
+             * The kvm.enable_pmu's permission is 0444. It does not change until
+             * a reload of the KVM module.
+             */
+            if (g_file_get_contents("/sys/module/kvm/parameters/enable_pmu",
+                                    &kvm_enable_pmu, NULL, NULL)) {
+                if (*kvm_enable_pmu == 'N' && X86_CPU(cpu)->enable_pmu) {
+                    error_setg(errp, "Failed to enable PMU since "
+                               "KVM's enable_pmu parameter is disabled");
+                    return -EPERM;
+                }
             }
         }
     }
-- 
2.39.3

