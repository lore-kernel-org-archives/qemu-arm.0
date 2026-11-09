Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DCA606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YCN+nYdG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXu6-0005L9-8b; Mon, 09 Nov 2026 17:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtl-0005Ds-Q2
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:35 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtk-0003tV-7Y
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:33 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-8b29b83fdf1so586261b3a.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263491; x=1794868291; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dpKkV3dUzsFB7q79rXzQWVH/sr/9fyjU2C+7DXlAe6I=;
 b=YCN+nYdGJt/rxXpJoHswZuuAhul2LIYjPZ1VyqmB3Bc/Vbjd+SrzmLa/FK49y2RXnl
 mcipth9WB643RAyFvuhRQTjIAl4Co9eo6ZvCuNXz/afrp3GcNxrW2uKI2+qQOxI0U0x7
 g8WZxkn/mT0ppH//gLgsbecooPGGXxmfGwq/AgN2nomdbTHS5vj0OspVdNjcAarJ2B+Z
 h/YAIY0819uW8mihuOo8/MVUvJpYkbAIiSanWwh3rrj/6f8lKwynrYbIZF6+ydLIQ3/F
 yJm3AA8w+JCLxVqtYnQ2eb5vjcxLg5ifrdE51OCCLvXz7zVwwQnqYSeHcvDlUR3TXAtS
 /xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263491; x=1794868291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dpKkV3dUzsFB7q79rXzQWVH/sr/9fyjU2C+7DXlAe6I=;
 b=ABNNS1NmxRyD6RTsxY/nybIqqKQIW2nMO3LB46mYXFpXWq/qoMBU4NCjHitg0RhyrS
 jzTD6YI27Z2TL+UAhO+Q5MBc3jyE38Q3VluMQUS40g3ZUY5Iu3brhDOLIA2CnB2oiTlx
 NKq6S7YLpYn5bs/drns53s7lvGoJ3XmyptPqOY7dI/iCCbYu5lEjoXbpyfU/39Wg/8U4
 TglBTPFzXwvWaZPdTa18IGtN/CaoucWBCrLOETzuI14Zk2v7fbpOxSjRl3YiMaSkWhPP
 xQOMxvpokSzOYRQI5VQVJbdNFnt/dpjgFqrXcm/lzO7QJ8lvQwg8V/UK5hDyIDjgyyLH
 eqtQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEuYUj47N9l1LT7H2fCSFV92mLKE4y0aGTE6yV0aN3VmTts7M7dJM4j6vq1aXKLH1UecVcjT5O7XQ==@nongnu.org
X-Gm-Message-State: APuU4Z88PQpehkBhIwyDsfoCclFgu4XmnPgewjIj0WkR6i8IdGsMRp88
 tCGIZt8F40aKEo6iJCJQWzK/BNhpSJaa2Py3ML2sZL2YfxZIBlUeR5O+Q6q4ieG9Z9g=
X-Gm-Gg: AYBFou3ojcVb0Nzftb7z+p4jDypAPNAJNE0z75rr9mnOu5LNqy0Q77KbV7FaRK8AqDf
 aVsNJvjAD2o7X6/jjcaBnTv8p5UEKO173MBTZ10oejV0VNLDC0gBpPxblbAdFVEHre8xslgWUc3
 dv4SLzCzTYFdo1WHbtzxZgokd1sQT1oYFai52DuVG7Zd+RfHIlDUf0QK1jqBsgrtUyrkaZdCGf1
 Yg687lqwjfSb+Sc6IJahPdkVgKaQkdnGDlzfc/I4T2wZcHAD3eB3N74lLUnlGV2AlWcCwkUiYfp
 D7mJOlA+DZiYpNQwmVAe7nQz+SGD134dCVGZlq4IHUYCTJarsYMric5AEb7LpLq6Svq0iwoy8EL
 WToQMV/2htzs83X/DLZraWCNbr6EYmqw8BF5Sgc+vTgzVYguVUOluM9ZeIDg9U/eXWsQscBjtmk
 BuFUEAq14JEZja/2+2xKvxhFM2wzQPNkIsiGUWoKTXI8vKjBXANJOQukjsMK2OCFK5smWg5u4+k
 A5HV1W/GqcUy2dFSu0gq9Qzav6XSWpRs5RRvQb8Oj/52QMNecMg+CpCeN69dGA5QQwjpXzYwosj
 2zz1ZjQBNJtauzR+P4kb3+G7lrShAJP+19df4z2QcQMStRVBt6hhm7wK8BMXqcLT1ZHZ7m8zKU0
 =
X-Received: by 2002:a05:6a00:3c87:b0:87c:f67f:f7d3 with SMTP id
 d2e1a72fcca58-8ba82773107mr899316b3a.0.1794263490880; 
 Mon, 09 Nov 2026 14:31:30 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:30 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 08/23] target/arm/kvm: Add support for PSCI 0.2 to
 'features' flag
Date: Mon,  9 Nov 2026 16:30:55 -0600
Message-ID: <20261109223110.1619504-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>

Starting with kernel 7.4, hosts initialing a confidential VM are
required to support the KVM_CAP_ARM_PSCI_0_2 extension.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index dc1004785cb0..80296e0a867c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -390,6 +390,14 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf, Error **errp
         features |= 1ULL << ARM_FEATURE_PMU;
     }
 
+    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
+        /*
+         * Versions >= v0.2 are backward compatible with v0.2
+         * omit the feature flag for v0.1 .
+         */
+        init.features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
+    }
+
     if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init, errp)) {
         return;
     }
-- 
2.53.0


