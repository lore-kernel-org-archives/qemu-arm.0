Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FD1CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:36:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jQI-0005Gp-FN; Fri, 03 Oct 2025 13:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jMJ-0000C4-4h
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:14:22 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKK-0007vD-5n
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:14:18 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-78a9793aa09so3053475b3a.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511525; x=1760116325; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IYbDL7ZzrPeJgVCiHhUdegByQ1ip3ofl4M+Y1UUBtM=;
 b=anz9/6ILHXfabr84ntb4KNC/zf8lBl3Dpat02rPQEIG9AJjht+HQHx8Hhm/cow9rEE
 1Njn4sZNj45EHrSPjjUY7i6qhGSpetdJuQQGKxnttRsjW6S/jiQQG3J6vs3JL6pLiPuy
 xXZnBLsVvU64/jEr8/PamwxNj4cGQl4hGmzBihEogYoTbHRbgW3JArFzHdL3uMkJ3r/m
 ax5x1ltyaWocirtdHgCo1PZgH5coQ0ttjkgISgoyszKIht/+8OSXpnZufOSygXo0W8mf
 Kd77xVznPar9s1QcS+HLh5kllnh7rCJDG5hdT6KFT9lpJpBzLbiS3feTsRL9TNPP8nPt
 Nbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511525; x=1760116325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IYbDL7ZzrPeJgVCiHhUdegByQ1ip3ofl4M+Y1UUBtM=;
 b=I0J7UyCS6UdWGZBAUMu9TUP3/jhCyP1dScFyb3zgSiMK0OtSmr2cAN7BKN7HCACWt8
 +W/bGA7vHoF6aGF0VWCvObu3tIadJ7G1glWOnTAdnDh0ISHss6UNzntoxg65MVKXQjd+
 oK2/2FEVsyr2MGTcNE4bsrsLem5lEqNREoo2Ov7OUS7jJ9ARcanDj1VeIWU8EQg3AI2o
 rtY1kdFDo4phTXqSfKddXhW3UESV8/FZ3rn5FUJGxHNelQ0z1+gShMFq857XaAn06fNb
 l8pCg/XxCIQFRh7iuiaIQ7yE76CJaQimpVE10K3tkeyDhILk9dCS3oiZ48yDAvtLD8Wd
 3W9Q==
X-Gm-Message-State: AOJu0Yz6pNt5abdQIWgqUcslnQTlEpjpBi82srq31suaqKxv291f7jn9
 8Vw/9fJtUEspUNylygYROr5Ya6DHOfappunnbF8/b8hlbomV6D1pm4favsWBRQbVTBo=
X-Gm-Gg: ASbGncs/xltDkUZ7TEB2cNJtwpwzQxzvEM7KConnAObd+UUqWTIhdt8bOwXbDBFheuB
 DZ1S6p5/utGluKdCkCKVr0/+a4prQgy8hSv6y2suEhZAjqoT/EkPKdy8SOnjXnsZvziq9A6h6fs
 u4a914Vk2a3u45Du/oulddlWWwEJZFjMTpQgsQY+3UmDyDGlxclYn06ROELinu5DgrmQgJIb+nN
 erzL4xPu9FbAtXzW5pnapKOFopQDY7lWCNxZ8OeXhxEQ2Tpfg5dU8cvuEMsIdqCmG75Z5T6vILS
 I8Fr8YXUoxK6H2TUzj8asXSWIMmhw72e49aUxVpIoiFWgiLYO4+9+zT7d+hhZuYAm2wfinilID9
 q65t74a0zdgoulD1xGCBD1tpUkYD8q3YzoaeFlvyPFBC85PangOwPq+JO
X-Google-Smtp-Source: AGHT+IGWEtCAsyoZ5nrIN5hNzYstdyGEDwY/gYwGMFXRn1G8akRZSZjl/BN9qRqo0XJAWF8RwfCrsg==
X-Received: by 2002:a05:6a20:7493:b0:262:8422:5774 with SMTP id
 adf61e73a8af0-32b62093e50mr5517815637.39.1759511524864; 
 Fri, 03 Oct 2025 10:12:04 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:12:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 70/73] linux-user/aarch64: Enable GCS in HWCAP
Date: Fri,  3 Oct 2025 10:07:57 -0700
Message-ID: <20251003170800.997167-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 77d03b50e1..3af5a37776 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -169,6 +169,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
     GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
     GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
+    GET_FEATURE_ID(aa64_gcs, ARM_HWCAP_A64_GCS);
 
     return hwcaps;
 }
-- 
2.43.0


