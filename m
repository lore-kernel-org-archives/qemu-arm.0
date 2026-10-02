Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E816CCA5FE5
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:22:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjke-0007UB-Qn; Fri, 02 Oct 2026 16:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkV-0007Lb-ME
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:55 -0400
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkT-0005nc-Tv
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:55 -0400
Received: by mail-pj2-x2a.google.com with SMTP id
 d9443c01a7336-2e2db9f927cso22117845ad.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972451; x=1791577251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wM7DDMRNXZ6kOtLnUpES13DSbro3EyKRePerUlcAXQ4=;
 b=RVLeIhhwxZB+o/ksYI0StVrbTFXJHW4ARwOrKKMWPozJ8CoE031KEx0tAEx/xw9dWx
 T1u6HNUqvSi2nL1QIE1IDqXAXKRwdJW0ZGTOf6Zf+vuuUOpuBB5PpNDuhYcksCumS6P8
 3tLJ2/2vR3t295+yXBXnw10ydZ1UaVAPWOkILl4LDRLF8vtuklpubljiW1hkU+u6nF/7
 Ed/+vt6LR91l8xacPOPm4HpSY4ajbvobmTH7tVTOoypls2GeFLoaMv8dmzRWMEHAaD0v
 u+X1CKg7PKeLcXVCm1zYnn7k1nqSRmtFMh5e1FQcCDNzCXMYDRIeBeV9FndEOss3cIUe
 qOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972451; x=1791577251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wM7DDMRNXZ6kOtLnUpES13DSbro3EyKRePerUlcAXQ4=;
 b=DYDKfFG4YoBRpvqrbI4rkvU+hRGGQOnVb2/drYhTm3ayhIBO8NdvkVig62dzUFbpWA
 ePNt5wALLZaJNXOto2j3eKIQivITG4M6ctZRMQ+wAyKx9zr+j/d+4/+dmKErmn3EQP/8
 PFJ9ScjrfPVaKZjiBOPHvcMh4EmYd2N2kCyG5P5Ntd86aiZDY2Z+AbizQK7tmDrrWmRK
 A90zPctfiaGsSA2aTp1qvfb78dLClNQTRlNv84MUIQ+1sCKFqTtMN2dD30QsfcguchPL
 kTsxVAAp0zQcnklEIkHRu/f6HMuGUZGta4UF6OLkR3Mx+uqB7eUwFdccb6YulBx+gMAY
 vDlg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxc19uDVYLgzdueU4p447Aqo+/4xaNSTXcb1J4mE4QsztsRspt6pPORcj2OqW4ocG1ns2A4rn5e2w==@nongnu.org
X-Gm-Message-State: AFq9FYLCFV4kulTnaUfnrnoIg38LA/uEbCyHErwRdSBw3wkWCiixjZTq
 vVmIuiLpKa1trSJKZEfF5Sw8z+/ms64VC02wSmfNvtQ2a4OV5YzXa4ew+YnfzS2UMXA=
X-Gm-Gg: AYBFou1nskqXmTIxXc/5hiHxaz4Jg3D6XYhQA28BP2milizAKKx+M0tO6hufjInR1Z0
 YFC0eML8QHdS8eiYn97HSmFP1rb+fs25AuPn4FJPeereCDhAk0FiFdE2EDTAvRhFQtkLCMDcgMN
 mVq51/rylwY4KAgDWzuUnQa/y+/BrAZRbALNR+eOxIdlppoKN7rtm5H5S9fDGbfe2MaZGLR9/Ii
 8ljLKQJwxhO1fBMipN4tMBUXdpEFZxu4gzah1OkZK1kItxzfir78FFNbFxyt/TvjMJIoU7Megbh
 n7lkf068wcBFhzn8AQ8P3KiuEld40H++LzMC5HYeuuEs/GtzAuOJd1C40PP7nXhtmKRYTNgtn5f
 mgCsUB5aOkC2l8RSCYQfKTAynIbWoQPwNsDmNj3B+3PL4RCWWLctk0yloMPD4nwFK1v/q+JDbXZ
 Bp6BliiYMJm0MGD7HJRgq1rPcwcLNItyVtULL3zPXR2aAeYOtQnJ8eubkv2lr7X3+4xtklDzkfl
 zzXNr/66yH0vtr7QW894ATd
X-Received: by 2002:a17:902:d2ce:b0:2dd:c100:4b77 with SMTP id
 d9443c01a7336-2e49b6adb4cmr32416315ad.46.1790972450919; 
 Fri, 02 Oct 2026 13:20:50 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:50 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 12/22] target/arm/cpu: Don't read Realm registers
Date: Fri,  2 Oct 2026 14:20:16 -0600
Message-ID: <20261002202026.1204110-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::2a;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The host cannot access registers of a Realm. Instead of showing all
registers as zero in "info registers", display a message about this
restriction.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 10ac6c983189..73bbebddcdb0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -967,6 +967,11 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     const char *ns_status;
     bool sve;
 
+    if (cpu->kvm_rme) {
+        qemu_fprintf(f, "the CPU registers are confidential to the realm\n");
+        return;
+    }
+
     qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
     for (i = 0; i < 32; i++) {
         if (i == 31) {
-- 
2.43.0


