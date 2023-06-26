Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp757707ejx;
        Sun, 25 Jun 2023 23:51:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Gayg9PtTPIyBD7GeRhdY4bxH8mUfblPCyoW7R0SzZUzfqeaSrH0q0N0ibl1QGFDEZOsoI
X-Received: by 2002:a05:622a:190e:b0:400:8fe3:9c40 with SMTP id w14-20020a05622a190e00b004008fe39c40mr9644232qtc.11.1687762297242;
        Sun, 25 Jun 2023 23:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687762297; cv=none;
        d=google.com; s=arc-20160816;
        b=Uq0bzyQVT3aG+/6amFNlmQeYLVz63I8axvQRh8hOtsp41C+rAnv9UNEYf8KeJoD77c
         A4apw53jyz0r1dZhXL3Jlodn/uk5xBF20Djy6mIL1afow6TRrwW/479BpyD/bqDM+Y5D
         AYgik0z/Cv0nt+rDPyeIjm61fM8L9XoFVVWcWOJpcXmyE5zrxn8da/QEHxEaqnB4eOJn
         ue9SyYbtkUVWLBIQURYdg34F8vFQVrBZwwhE78L/ndyJ92R4/Q4XNY+/aNKzt0FRq03e
         OWLkwdvTp0nVhoiOlcbZK3y13aTccGprXyENiy43MWWiYIvDGtuDdEb93c9WHM74KJ+h
         LhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8Ltet2rZykILGRABaVJtvsAKFyyK8WBzxZAFNXdaFdQ=;
        fh=DWJcSPkfMQ1TZNlLoQ1lDdnD2Ur6b4liGIOM+Hifm6I=;
        b=pqs97lq4ptmhDk/WaVYno3K/PEdpkZ2/M5ICN+UfeBQDEwXdTC3Ji+G8JuDBmX3RV7
         UZF+hKldElrk87ogLL7dgD998VApYOYbSukrbguFEAaC8xXQKw7QPFMBRJEqUa+GAL+0
         /SEFagNGyQE99Imnmz5uOewxAJJ7pmB5ESpvByAgazuZFhYqZsE8xpT2r/61Ecl+tLSz
         AD6wvg13k1RVCj+QxMse/o/L7u2Q1sw0j8U3aYvBFHvnS9zJzeJaazEpm/+1iO6SCQ2R
         269RD9HRpknpnT6q+mvqR5m8cjHxVCwFjLPGLssvtnHtzMsc1+uEsvFy/bQwbedNsco9
         2KpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bPIcQyY9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t27-20020a05622a181b00b003f697aa276dsi1643847qtc.482.2023.06.25.23.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Jun 2023 23:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bPIcQyY9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qDg2x-0006Af-Hr; Mon, 26 Jun 2023 02:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1qDg2s-00069C-Gg
 for qemu-devel@nongnu.org; Mon, 26 Jun 2023 02:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1qDg2n-0004Qh-A0
 for qemu-devel@nongnu.org; Mon, 26 Jun 2023 02:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687762188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Ltet2rZykILGRABaVJtvsAKFyyK8WBzxZAFNXdaFdQ=;
 b=bPIcQyY9FCTx3JshrteM1o+2ylXEilDdEE9cWsdguj/xGpgGGmUPVAciS7ap19MJ3TF0gl
 bdnjZM8gSsqViHMAZusxxDEubeeHXEFehz6DQScDk+VcArFj5/lgg82sltU6PFgb1orEcM
 J1jkbdbmaSfmO1D6iJ3ET71/oooqpdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-AN71jvxLO92Vvc_ngPc2mg-1; Mon, 26 Jun 2023 02:49:43 -0400
X-MC-Unique: AN71jvxLO92Vvc_ngPc2mg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B58D1C07249;
 Mon, 26 Jun 2023 06:49:43 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 526C1200C0CD;
 Mon, 26 Jun 2023 06:49:43 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: oliver.upton@linux.dev, salil.mehta@huawei.com, james.morse@arm.com,
 gshan@redhat.com, Shaoqin Huang <shahuang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v1 3/5] target/arm: make psci call can be used by kvm
Date: Mon, 26 Jun 2023 02:49:07 -0400
Message-Id: <20230626064910.1787255-4-shahuang@redhat.com>
In-Reply-To: <20230626064910.1787255-1-shahuang@redhat.com>
References: <20230626064910.1787255-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LgwhZPY+6/I0

Now the psci call can only be used when tcg_enabled, we want to reuse it
when kvm_enabled, which will be used in subsequent patch which enable
the psci handling in userspace.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4bee43bd0..58063a92a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11020,7 +11020,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
+    if ((tcg_enabled() || kvm_enabled()) &&
+         arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
-- 
2.39.1

