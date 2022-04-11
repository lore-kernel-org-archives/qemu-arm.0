Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1429467lfq;
        Mon, 11 Apr 2022 00:08:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZAYfRbOLTBn8Bie08zhbiXe9/rHqsx1UVk3bLQ132OKO9B9TZ+3XKTQT9Bo/mRLHiIBGG
X-Received: by 2002:a05:6214:2388:b0:443:865c:5623 with SMTP id fw8-20020a056214238800b00443865c5623mr25450012qvb.72.1649660908650;
        Mon, 11 Apr 2022 00:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649660908; cv=none;
        d=google.com; s=arc-20160816;
        b=vtBTgWGGhPVrJoxwQruJbQSacfLPW3zlGMA8E6P+fqHEjgNaD8t+ENoA0bOm06nskX
         BGc2ptAmWncwBkgfQSRy0MZA11APKeFy+1QARqbrKIAGjUM+XvUEOVY/p0VFqnI9M63a
         4mZVW/xstlK7vAuwTgvkij6YLKJtA+RwHlV7lSUVX8ElQrrB9gV6sdS3tNEBwHf1CSnF
         gRP/rUjFMQ+j0ZMuZMjbdCP9/zr9k01CC5bfX8PNIgo/Dar3CTMCsBf1On4SMTHdU+B0
         VKJGW3Q5yRZep1FwA9J2Df0+ozwKr7yde1Fzm9Fd4LXG00Z6LMl4uM8VJ+s+YnXCGsNB
         /R5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AvDhijDYqHS0XYn4GNOx/lJXFpjH0PMuUN97yxxGGRY=;
        b=iaNIuL2ILBoDGGLz5vZZePR5Bvq4UWP/qzP4JWkrx8zZmrhi7Uwr6z/8pW7NxxSN/w
         +fRtc5rZgpzGTciMgGkptJv0uC63m2H2HHDW6B5v3V4mAUPQA8lP0u5sKXgItIb9oG0g
         9XnSlOK8voNN0bzeytX6rvwpOof1WSC1a4XvYV8wRLTjBQi3trJRhIC9K5y5uWmVbNio
         31A505VvtbO24WJxOoLqIoE3kZbbHFS7TQek8YvxGY1kV7DhtpNmJ3YeuVWwv3tbBVjY
         wlRKLjRtV9LngqqII1k9nkmoEfbNzenWxq5Lac48pFdjGV4In46U9Fe+ByQte6eCEfUn
         08Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ze3EJvVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im13-20020a056214246d00b0044413215d6dsi4143952qvb.301.2022.04.11.00.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 00:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ze3EJvVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndoA0-0006Fu-5n
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 03:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo13-0008TA-1k
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 02:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo11-00076w-B4
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 02:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvDhijDYqHS0XYn4GNOx/lJXFpjH0PMuUN97yxxGGRY=;
 b=Ze3EJvVqDUwnR4e0JSkIyTiBTr0vJ22ps0liAp3GkbPZNjoHnFQ+d9RQ+dsmoSgZnBh+vW
 +mDjUh6Lovr+LbVin+PCfXMUjq07D03wmrWAH3FJf3fhMOQNeeWH51ZOYiqlP6v1+xuoKV
 5Xw+d7qCNBcZIzb/1P98z2F8SYD3Tbg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-wsi95zUcNcqt7nTWpmNhhw-1; Mon, 11 Apr 2022 02:59:05 -0400
X-MC-Unique: wsi95zUcNcqt7nTWpmNhhw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CA703C14101;
 Mon, 11 Apr 2022 06:59:05 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED4824029AD;
 Mon, 11 Apr 2022 06:59:00 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/5] target/arm/hvf: Indirect addressing for coprocessor
 register storage
Date: Mon, 11 Apr 2022 14:58:39 +0800
Message-Id: <20220411065842.63880-3-gshan@redhat.com>
In-Reply-To: <20220411065842.63880-1-gshan@redhat.com>
References: <20220411065842.63880-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, agraf@csgraf.de,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HBk5tk6f5Sot

Similar to what we did for TCG, this uses @cpreg_value_indexes[] to
track the storage space for the corresponding coprocessor register.
As all coprocessor register have fixed 8 bytes storage space, so
the indirect and direct addressing mechanisms can co-exist and
interchangeable, even in migration circumstance.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/hvf/hvf.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8c34f86792..8cca26a59c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -334,6 +334,7 @@ int hvf_get_registers(CPUState *cpu)
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
     hv_return_t ret;
+    uint32_t value_index;
     uint64_t val;
     hv_simd_fp_uchar16_t fpval;
     int i;
@@ -373,7 +374,8 @@ int hvf_get_registers(CPUState *cpu)
         ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
         assert_hvf_ok(ret);
 
-        arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
+        value_index = arm_cpu->cpreg_value_indexes[hvf_sreg_match[i].cp_idx];
+        arm_cpu->cpreg_values[value_index] = val;
     }
     assert(write_list_to_cpustate(arm_cpu));
 
@@ -387,6 +389,7 @@ int hvf_put_registers(CPUState *cpu)
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
     hv_return_t ret;
+    uint32_t value_index;
     uint64_t val;
     hv_simd_fp_uchar16_t fpval;
     int i;
@@ -421,7 +424,8 @@ int hvf_put_registers(CPUState *cpu)
             continue;
         }
 
-        val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
+        value_index = arm_cpu->cpreg_value_indexes[hvf_sreg_match[i].cp_idx];
+        val = arm_cpu->cpreg_values[value_index];
         ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, val);
         assert_hvf_ok(ret);
     }
@@ -573,12 +577,18 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                                      sregs_match_len);
     arm_cpu->cpreg_values = g_renew(uint64_t, arm_cpu->cpreg_values,
                                     sregs_match_len);
+    arm_cpu->cpreg_value_indexes =
+        g_renew(uint32_t, arm_cpu->cpreg_value_indexes,
+                sregs_match_len);
     arm_cpu->cpreg_vmstate_indexes = g_renew(uint64_t,
                                              arm_cpu->cpreg_vmstate_indexes,
                                              sregs_match_len);
     arm_cpu->cpreg_vmstate_values = g_renew(uint64_t,
                                             arm_cpu->cpreg_vmstate_values,
                                             sregs_match_len);
+    arm_cpu->cpreg_vmstate_value_indexes =
+        g_renew(uint32_t, arm_cpu->cpreg_vmstate_value_indexes,
+                sregs_match_len);
 
     memset(arm_cpu->cpreg_values, 0, sregs_match_len * sizeof(uint64_t));
 
@@ -591,13 +601,17 @@ int hvf_arch_init_vcpu(CPUState *cpu)
         if (ri) {
             assert(!(ri->type & ARM_CP_NO_RAW));
             hvf_sreg_match[i].cp_idx = sregs_cnt;
-            arm_cpu->cpreg_indexes[sregs_cnt++] = cpreg_to_kvm_id(key);
+            arm_cpu->cpreg_indexes[sregs_cnt] = cpreg_to_kvm_id(key);
+            arm_cpu->cpreg_value_indexes[sregs_cnt] = sregs_cnt;
+            sregs_cnt++;
         } else {
             hvf_sreg_match[i].cp_idx = -1;
         }
     }
     arm_cpu->cpreg_array_len = sregs_cnt;
+    arm_cpu->cpreg_value_array_len = sregs_cnt;
     arm_cpu->cpreg_vmstate_array_len = sregs_cnt;
+    arm_cpu->cpreg_vmstate_value_array_len = sregs_cnt;
 
     assert(write_cpustate_to_list(arm_cpu, false));
 
-- 
2.23.0

