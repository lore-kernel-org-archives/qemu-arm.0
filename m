Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp447855nji;
        Wed, 28 Aug 2024 04:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOtUttZHYs+Yb+tT3FNyEeawlpb+OCl+o0cEOca2cTDgqCKprxpEn3paHr0eOrYpu5yr30wyHOd5BF8w==@linaro.org
X-Google-Smtp-Source: AGHT+IH71a6eObo2IpsanwfeRI1iwSZbCcxcSb5o09uw6PB28agVAI7W+KqaxVtMWhya4CWQYT7x
X-Received: by 2002:a05:6902:188f:b0:e03:6085:33e9 with SMTP id 3f1490d57ef6-e17a83b2984mr22461044276.2.1724843811743;
        Wed, 28 Aug 2024 04:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724843811; cv=none;
        d=google.com; s=arc-20160816;
        b=In3OzbNzecKif6yNbJsudJfjpV+WM1Y4B6AqiKfN7AF+6d6sTa5YgWTq2ixQ7pY2S3
         aJhhjYg32loEYl7CEAz2teBRC4Q1nSOfx1im6HmQaji7q2oMrl1hymaNcl1ll2igIcSL
         yerOT3JP66r/uFKwg+lj9+BdSD7dryfVyzOzpJRRKa+9/dsF10uzCOSSMr3uOO6Eutje
         9nj0Z8kgKS0C2raNZmm9c4oFdbsyK1mL9Y14pfHGxmgB03n8I+1kZhXDNZLeNXAAT3CK
         Q7JHN2gBmeItjfm7xOP4UMQZUlXDkV2T3b1t32YN5tlFTCLncGzzCLVZpYzJHRq1Yaep
         Nfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NuxdHQvEWMO186/Pq64WVK2Wqxs7tuae4uiyuSIdisA=;
        fh=EBJJH4R4P+cYctxzT3H8oPG+VG5hu6LE/XNTDk1zDIw=;
        b=fo+XF2tFTbUUl+3JzDb5P9Sct0+xGVG+xZJubt7xpfyLUuGIJbLHBKoX9sphis4hWV
         CvCoHhmnoTZeiCWNt1j4wF/M/gsthur/IhCWUJfaIl70JDKkbgutBWzK8qjXEz9ozfT3
         RFJyO02kK/B8BihkM96d6aExFV17Hm7W0DS4EDCflKDMQCo00tBcX63oOMfVBlpm50Nu
         K/iB4yVXkd0vp6NHlHHOrg4KqfeZIydqb4UJ+lnUjrfFs+5NCXeQRvLke9TL92AInZV1
         vZyKMftpX7rc5fH6cHUJLtqHbKB7NDMdIphf9w+kgrLTsus09WK3K/MYu6BCxoocjYXU
         1ilQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@apple.com header.s=20180706 header.b=UpKNSyyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=REJECT dis=NONE) header.from=apple.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a7ff112b60si14680385a.242.2024.08.28.04.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2024 04:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@apple.com header.s=20180706 header.b=UpKNSyyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=REJECT dis=NONE) header.from=apple.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjGet-0008Jz-9O; Wed, 28 Aug 2024 07:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danny_canter@apple.com>)
 id 1sjGeq-0008GS-QO
 for qemu-arm@nongnu.org; Wed, 28 Aug 2024 07:16:13 -0400
Received: from ma-mailsvcp-mx-lapp01.apple.com ([17.32.222.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danny_canter@apple.com>)
 id 1sjGep-0001xt-8F
 for qemu-arm@nongnu.org; Wed, 28 Aug 2024 07:16:12 -0400
Received: from rn-mailsvcp-mta-lapp02.rno.apple.com
 (rn-mailsvcp-mta-lapp02.rno.apple.com [10.225.203.150])
 by ma-mailsvcp-mx-lapp01.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPS id <0SIX00VTCDYV8C20@ma-mailsvcp-mx-lapp01.apple.com> for
 qemu-arm@nongnu.org; Wed, 28 Aug 2024 04:16:10 -0700 (PDT)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=20180706;
 bh=NuxdHQvEWMO186/Pq64WVK2Wqxs7tuae4uiyuSIdisA=;
 b=UpKNSyyrtrk23ca6JRQuMRPoB+CLZyo9X1Wz0KNgChX5UiCYLqYrkOiIN0W2LTV/rATp
 bhVHtBi2G3XsXD0aGYVv7aickUbaA4p3H3DQLktnPTngTAh8T3xG3uKD0Vz1kqwqhCte
 4XewRB2N6x/EfhLF8K+fGuNWvufoU7l3DApgta0THcCGVHvs36QBTIB9F2ag7629o6Ri
 HpFDpP1i+NqyY+mCFlk6RdX/8AqtuBu7jP5ZWCelydUKbdFgRX8V0qoSRYBHkg0SGINS
 RhZdLSh+ApPQTinfomzj2FwsPHSbeIhMGbNqwKksBdxYFIVEcn+3A511FfK08MfmmFNz 4g==
Received: from mr55p01nt-mmpp02.apple.com
 (mr55p01nt-mmpp02.apple.com [10.170.185.213])
 by rn-mailsvcp-mta-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPS id <0SIX00711DYWJJ10@rn-mailsvcp-mta-lapp02.rno.apple.com>; 
 Wed, 28 Aug 2024 04:16:08 -0700 (PDT)
Received: from process_milters-daemon.mr55p01nt-mmpp02.apple.com by
 mr55p01nt-mmpp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) id <0SIX2GG00DAAEB00@mr55p01nt-mmpp02.apple.com>; Wed,
 28 Aug 2024 11:16:08 +0000 (GMT)
X-Va-A: 
X-Va-T-CD: 18a8a04ab20a1763aa377ff80017b310
X-Va-E-CD: 3b56e0df51ee4f416ea534a48614cf9f
X-Va-R-CD: b21774bb28acbe54f0c689c454c37b14
X-Va-ID: a9801331-97fb-493e-9c95-381a51a0bafe
X-Va-CD: 0
X-V-A: 
X-V-T-CD: 18a8a04ab20a1763aa377ff80017b310
X-V-E-CD: 3b56e0df51ee4f416ea534a48614cf9f
X-V-R-CD: b21774bb28acbe54f0c689c454c37b14
X-V-ID: 7fa2e5de-6c92-4f7a-ab3b-490ee94ce2dc
X-V-CD: 0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
Received: from Mac.apple.com ([17.11.139.69]) by mr55p01nt-mmpp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPSA id <0SIX2GJ1IDYJB800@mr55p01nt-mmpp02.apple.com>; Wed,
 28 Aug 2024 11:16:08 +0000 (GMT)
From: Danny Canter <danny_canter@apple.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: dirty@apple.com, rbolshakov@ddn.com, agraf@csgraf.de,
 peter.maydell@linaro.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, mst@redhat.com, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, zhao1.liu@intel.com,
 danny_canter@apple.com
Subject: [PATCH v2 2/3] hvf: Split up hv_vm_create logic per arch
Date: Wed, 28 Aug 2024 04:15:51 -0700
Message-id: <20240828111552.93482-3-danny_canter@apple.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-reply-to: <20240828111552.93482-1-danny_canter@apple.com>
References: <20240828111552.93482-1-danny_canter@apple.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Received-SPF: pass client-ip=17.32.222.22; envelope-from=danny_canter@apple.com;
 helo=ma-mailsvcp-mx-lapp01.apple.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qdelaPHQ5iI7

This is preliminary work to split up hv_vm_create
logic per platform so we can support creating VMs
with > 64GB of RAM on Apple Silicon machines. This
is done via ARM HVF's hv_vm_config_create() (and
other APIs that modify this config that will be
coming in future patches). This should have no
behavioral difference at all as hv_vm_config_create()
just assigns the same default values as if you just
passed NULL to the function.

Signed-off-by: Danny Canter <danny_canter@apple.com>
---
 accel/hvf/hvf-accel-ops.c | 6 +-----
 include/sysemu/hvf_int.h  | 1 +
 target/arm/hvf/hvf.c      | 9 +++++++++
 target/i386/hvf/hvf.c     | 5 +++++
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index ac08cfb9f3..dbebf209f4 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -61,10 +61,6 @@
 
 HVFState *hvf_state;
 
-#ifdef __aarch64__
-#define HV_VM_DEFAULT NULL
-#endif
-
 /* Memory slots */
 
 hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
@@ -324,7 +320,7 @@ static int hvf_accel_init(MachineState *ms)
     hv_return_t ret;
     HVFState *s;
 
-    ret = hv_vm_create(HV_VM_DEFAULT);
+    ret = hvf_arch_vm_create(ms, 0);
     assert_hvf_ok(ret);
 
     s = g_new0(HVFState, 1);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 5b28d17ba1..42ae18433f 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -65,6 +65,7 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
 #define assert_hvf_ok(EX) assert_hvf_ok_impl((EX), __FILE__, __LINE__, #EX)
 const char *hvf_return_string(hv_return_t ret);
 int hvf_arch_init(void);
+hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ace83671b5..19964d241e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -929,6 +929,15 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
 }
 
+hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
+{
+    hv_vm_config_t config = hv_vm_config_create();
+    hv_return_t ret = hv_vm_create(config);
+    os_release(config);
+
+    return ret;
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index c9c64e2978..68dc5d9cf7 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -223,6 +223,11 @@ int hvf_arch_init(void)
     return 0;
 }
 
+hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
+{
+    return hv_vm_create(HV_VM_DEFAULT);
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     X86CPU *x86cpu = X86_CPU(cpu);
-- 
2.39.5 (Apple Git-154)

