Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E68C624DA
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEb-0001MA-1u; Thu, 03 Sep 2026 15:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEY-0001Ib-Cx
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:26 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEV-00047k-7l
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:26 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-cc1bcdb3c4cso251188a12.2
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464182; x=1789068982; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=CTa8ol54WmkLiwpxVbLa9gLi/D951jAni9gUZTC/0Gw=;
 b=lLn+vQtdQEDrA58vTYhEt+13DhrevKjaDPqcApsqQegNmUsYgRTphyw3z4BxgT7dKB
 /ou3M8bvGTq1ZcnWe6LmMVxe7nEgQs2R5LVuwTcvKv73xyIwPTfnqqiZyyeuifOvk0kX
 8nJi1zcuvSB0ru6DVCOq1OsgO3BSeJYJ4EMEk9HFomGe32BMoxzyWQigry/nmuXKTLU2
 fsruDaYfqjUTaRY9tsinBWMyjDtHiT/2E4Toz+aYtTwmFx8etj5bPsLdKxTXRIad1crS
 YU2ljEafl7Zlf9N+KEYJ5jvWUKKRGUcuRQlxgf58EkwHp++GgyDCy8fTcZYrnwFhNMmF
 +DJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464182; x=1789068982;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CTa8ol54WmkLiwpxVbLa9gLi/D951jAni9gUZTC/0Gw=;
 b=M1zA8kqsyldNAxurxlIo4p1u7tR/1BHvL1JDcJuEc2BoTEzOGWY86g47Ig6qgZUEU5
 xh7etHD+/JxD+3cMZG3eziat/kgHdI6G/BxmXjbmECwI4PbsilhnDvC3+qKn8T+Pmzli
 4BIEAImLugnoIk/iPAIjJ7ic5lvbzAWqnF+OXLGnmH5zLlfk0PMuPBi6FjQrSC4xMSsf
 xs7smpb4KgMuPOc31oB1dVzWUS70U+ziMtmwC/0SvQO9IJ3bveGKP4OQuSh8Pg84lMxb
 B55zLiQIiMESVSluJg3SXo/Dm7t3EtrP9EOVv62rkv3smTXPjjx+szD1UFGCvWqgu5yY
 CjDw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbJhCPbHi6LN/JptH1tOL+2J1lsjO/bGY3AEjzc3dB3NS8pDGZgtI6qdIf5WqEtlhswFeqyeqB5Q==@nongnu.org
X-Gm-Message-State: AFuF++kGfm+7wF2dnIQucrc0lclMR8oo8U0qKCe05EG4s4zWT2x/hakO
 mkn368V0A4XQobqhx5jlX2GOB/XmQZYS3S/kl611Ma+ZaViGqkV1890yMfjF6g5KxrQ=
X-Gm-Gg: AYBFou0NRIeveT8SSsmJMuHe+nCQe0rQRpNAEsND05JalHxNHgPCyXgZUAon3yn2+52
 hZKhXrEVQVeve18B7AogPWKVJsIOTqyaVO3tik1VICIo9+DkJ92SJST41DKdUAHaUqCgLMVjnwf
 5ByDlJorm6xTfMwwhBmvGplRTF8M22lDlJOsnN9D3wYvC/lUXWWm96UjxNpzkRaroFQedtWrzF/
 lHfEBfnxgGjmr0OKRPqeVZyAWEAXtxDxjS0fnx8g3xB6YOEGToTon0/qg2QG0zzMBiPL/lXlCsp
 lOrKvi94k8Z1b5SjbshRYuEVTgMw4H21jKwf88VoFJnft4ctsiMn6u0T/MG9JgHBAEpggXjObmn
 voTCUGzPz/Wq+RM37OC7Nxe+EdS4s5W4wCerKeXeQ5CthZeLikEfuRKO/IK6CVtVElzGm1Y6+a0
 IH0rpWfcaSkQ0jKFvCsbTaTJ4CS7/p8eBZgpLncpkOh4WB7nj1mRJiQXTlQJogPHe7QCQd5IjF4
 1thUneSGPmL1kw=
X-Received: by 2002:a17:90b:57cb:b0:398:9be6:f998 with SMTP id
 98e67ed59e1d1-39b262e2139mr1100782a91.23.1788464176850; 
 Thu, 03 Sep 2026 12:36:16 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:16 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 02/24] target/arm/kvm: Return immediately on error in
 kvm_arch_init()
Date: Thu,  3 Sep 2026 13:35:49 -0600
Message-ID: <20260903193611.1058589-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Returning an error to kvm_init() is fatal anyway, no need to continue
the initialization.

Leave the `ret` variable in the function scope because it will be reused
when adding RME support.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d40a6a985914..ed99be7fd80c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -596,7 +596,7 @@ int kvm_arch_get_default_type(MachineState *ms)
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
-    int ret = 0;
+    int ret;
     /* For ARM interrupt delivery is always asynchronous,
      * whether we are using an in-kernel VGIC or not.
      */
@@ -618,7 +618,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
         error_report("Using more than 256 vcpus requires a host kernel "
                      "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
-        ret = -EINVAL;
+        return -EINVAL;
     }
 
     if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
@@ -640,13 +640,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
             warn_report("Eager Page Split support not available");
         } else if (!(s->kvm_eager_split_size & sizes)) {
             error_report("Eager Page Split requested chunk size not valid");
-            ret = -EINVAL;
+            return -EINVAL;
         } else {
             ret = kvm_vm_enable_cap(s, KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE, 0,
                                     s->kvm_eager_split_size);
             if (ret < 0) {
                 error_report("Enabling of Eager Page Split failed: %s",
                              strerror(-ret));
+                return ret;
             }
         }
     }
@@ -659,7 +660,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
-    return ret;
+    return 0;
 }
 
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
-- 
2.43.0


