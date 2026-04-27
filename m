Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE7AFF8864
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 23:23:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHVIz-0000yi-NR; Mon, 27 Apr 2026 19:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wHVIt-0000xM-RX
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 19:23:52 -0400
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wHVIr-0004sO-JT
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 19:23:51 -0400
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-2d96243c91fso17568650eec.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 16:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777332228; x=1777937028; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGl0BbXkGtFoRsQ7y9Jn4eXyp2q/oJa3u0gZmZMsmiA=;
 b=kT34BOMfChisBDkBfJ1F954yfrSEVXggkCz2IZqAEhaREbNsjJ0aqnoIFm59ijKp/G
 TD1dCncLrl+6TUcZWyCUldgm2qIJ0FusfFrL86M7p2jme/PgKykh7c4/ubTEiakoOZ24
 dkZYhZY56ngQ/yWu5EJ+ONzfx6+b/QxBy9psDuOBbBKUS/oPbP9pyhzl9p3PjJu7vnds
 ifhpVwWA1Fdl1n2ij6eG9/14wr2E/wjusUBTM/s0b/1hiXZs0nFzvzuDlStutaTzD2KI
 V8FoiWT3HHOxVpZ7CSCK2o2nrOOzYL9Ai7GRVI9BgqmSBzPgENqiZBjhapKBgSJgvR98
 I1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777332228; x=1777937028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TGl0BbXkGtFoRsQ7y9Jn4eXyp2q/oJa3u0gZmZMsmiA=;
 b=SiroMkEC9lvoJFIab/bRRRESASAa0zjAPAXk8De9Q7f9C4bLdFqWZZUKlfcudduhrS
 8cRjyKw9fQkIEu/jeYI7PD2ZgsY+zjBjfRYwQMQ2+CnqyzZOs+16qBREkrgxNFh6WQ5+
 T1+gOhaG7RqMNK4BHzLGJl618REG3LxR2PQ0aIu+CQ+6fz/LkhArslRgVinSYtABkAS5
 NwYxySqcvdR0n1YrGjLB0S03MVuXTK0VVW8ReWYmSOZfanuekXNFF8mNL1AuxHqj5IJM
 ePj3BHk2CtSPd6ZiK+hPGLELFegXe5hzLM8TqJwRcmHB3qxFqEDFt4RW3RGcaqWfDIy6
 GBOA==
X-Gm-Message-State: AOJu0Yzfrz6SWB/tbLqHyR+vf5I32W0eoiqezANLLfCzqaX6sde9n71s
 LvVclB6EI4DJLecyINhJaiD2x5vR2rowS0YTCA3KtYwxD6q/e+Lswg3S
X-Gm-Gg: AeBDievrsxtRwNf7wMT3S35gpq2lBy+528xrSLkWd21VW5R4UtM0IZ4Aygwb3zzB9FD
 y8KPEcWJVmIqWIYjOSGtIYyPwd8VENPiSCPgi47gLBJr6VmRTsTfZpYq9QsPNZkcPG2/NCjeqXs
 4Y+fb7NZUCGv4k4Q1WHdWM5WESXPB1h6QECMJT/xCG7L1c+jGlPYETKBvXnMbq2ceVLZSLxDAVA
 eUy9R4jIXJ4BrIibBt46D3YcbByEBaOQbDrIHWzU43KorRxhXQ4GjKggIlQ1ziMBSdXS7osBecL
 p4WYQtHxtvmk2Tb/UMaDtdxN+qW+/56tWhRcS1N0WOBcZVSNTdQBQ9408u6GTeCOCdnAivYxcxu
 WHhjybCFxTLOKHn84UJuQ1MN1GtpT9iw94ANaHCcnUdh4E40LniLb2Irxe75KIVW1KbRhAKMqc4
 jGobpPWrK+Q0uMEEvSich/WrDrCKVFFG1F3tbCYoQ5AGOe757eg3bim8/AqMnBgMnEVS5I7dP3k
 9atEVupygX8avWG5bgmyQSr3wHrrSxnXe/9Ng==
X-Received: by 2002:a05:7301:30b:b0:2ed:e17:d510 with SMTP id
 5a478bee46e88-2ed0e17d6fbmr18710eec.35.1777332227823; 
 Mon, 27 Apr 2026 16:23:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:645:8200:47:f4a5:bd04:3ca7:5727])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ed0a0ce710sm849973eec.19.2026.04.27.16.23.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Apr 2026 16:23:47 -0700 (PDT)
From: "Scott J. Goldman" <scottjgo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, "Scott J. Goldman" <scottjgo@gmail.com>
Subject: [PATCH 2/2] target/arm/hvf: Stop pre-allocating cpreg_vmstate arrays
Date: Mon, 27 Apr 2026 16:21:16 -0700
Message-ID: <20260427232116.50586-3-scottjgo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260427232116.50586-1-scottjgo@gmail.com>
References: <20260427232116.50586-1-scottjgo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=scottjgo@gmail.com; helo=mail-dy1-x132d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Commit ab2ddc7b66 ("target/arm/machine: Use VMSTATE_VARRAY_INT32_ALLOC
for cpreg arrays") moved cpreg_vmstate_indexes / cpreg_vmstate_values
to be allocated by VMSTATE_VARRAY_INT32_ALLOC and added an assertion
in cpu_pre_load() that they are NULL on entry. The same commit dropped
the redundant g_renew()/array_len assignments from the kvm, whpx and
helper.c cpu init paths, but the hvf cpu init path still pre-allocates
them.

The result is that loading a snapshot or migration stream into an HVF
guest immediately aborts:

    ERROR:target/arm/machine.c:1043:cpu_pre_load:
        assertion failed: (!cpu->cpreg_vmstate_indexes)

Drop the leftover cpreg_vmstate_indexes / cpreg_vmstate_values
allocations and the cpreg_vmstate_array_len assignment from
hvf_arch_init_vcpu(), matching what was already done for the other
arm accelerators.

Signed-off-by: Scott J. Goldman <scottjgo@gmail.com>
---
 target/arm/hvf/hvf.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index a36c634423..fe7dc9448d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1284,12 +1284,6 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                                      sregs_match_len);
     arm_cpu->cpreg_values = g_renew(uint64_t, arm_cpu->cpreg_values,
                                     sregs_match_len);
-    arm_cpu->cpreg_vmstate_indexes = g_renew(uint64_t,
-                                             arm_cpu->cpreg_vmstate_indexes,
-                                             sregs_match_len);
-    arm_cpu->cpreg_vmstate_values = g_renew(uint64_t,
-                                            arm_cpu->cpreg_vmstate_values,
-                                            sregs_match_len);
 
     memset(arm_cpu->cpreg_values, 0, sregs_match_len * sizeof(uint64_t));
 
@@ -1326,7 +1320,6 @@ int hvf_arch_init_vcpu(CPUState *cpu)
         }
     }
     arm_cpu->cpreg_array_len = sregs_cnt;
-    arm_cpu->cpreg_vmstate_array_len = sregs_cnt;
 
     /* cpreg tuples must be in strictly ascending order */
     qsort(arm_cpu->cpreg_indexes, sregs_cnt, sizeof(uint64_t), compare_u64);
-- 
2.50.1 (Apple Git-155)


