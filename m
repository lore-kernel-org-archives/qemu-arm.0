Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C130AC98302
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:30:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9My4-0002Dn-BR; Wed, 23 Sep 2026 09:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mua-0002Xs-Jq
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:21:27 -0400
Received: from mail-dy2-x23.google.com ([2607:f8b0:4864:36::23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MuZ-0007Wj-5n
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:21:24 -0400
Received: by mail-dy2-x23.google.com with SMTP id
 5a478bee46e88-33c11ef641aso1113060eec.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169682; x=1790774482; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xe2eD+AiZP/2qt9dfiB6B/fVlOtPvZaEy5H5CusisPI=;
 b=ISDxkOYTPDaASlcP4zOcoY8de5QeJmxKf5mMO5xam3lfBn1l6QnVf3iCD6zpj1xyS0
 yrGM/jRk3xhG4WijwB9og7rluwDNea8y1P2YHaeHIaKXQhdQoCHEWUdKdJlAURP1U0aq
 MDg7unAAPYKEB4dyoFZxO5D1/jKIKPsqfZKQgQn8DQWsm78PnTkuadNkcFM+VoJXtyIs
 sIVlLhx46jKpA5YvD7rAs+AsD9WSqd8xuIP4UVTzueVQZHEOkw0MpzJIyfKL6yM3Cl3M
 v2NtDt+nFeo4VzqpZBFGzqy2tANC8cFYmAbI96fzYPwZup7pPcddpC3sNxWztwrmnYsH
 B3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169682; x=1790774482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xe2eD+AiZP/2qt9dfiB6B/fVlOtPvZaEy5H5CusisPI=;
 b=CQGpzIguUt2MpDaOy6rRfis0tChSzBTBTS9eoIPaw6EOPTdNbW2C5zt6L0iDZWeXbQ
 YrkiLu6BRMQYr3IgjqRrtdGUelCCC/ndlIHM1zlNoTeye1gJf+366ZrC4tRC6YVZizF2
 2t9wv1PuhiEUx9MyTAuFDa+7U7VJED38m4Mbt1aPUVkqF20HTktB5wAU0e2ajGnLklUj
 YtEdHPCnU1rLW9a5Q82Pvdd5tUjcd1aB76qhW0vCxcn1C2xAutO3vdQftSocaRycId6l
 GYNdTvPx/X6VrmvIEYM9BzikyEaOPIotY9ZvUcYMqcOE9bSvs60s+6hkCe/XsucOLG45
 Fc9w==
X-Forwarded-Encrypted: i=1;
 AKwUvBztT8ocarAen2LGJ2BUqDlpsslCFPDMyu0qVrT4sPAguE+P8eM2l09+578HyexGfxusJgAspfVxbA==@nongnu.org
X-Gm-Message-State: AFuF++nMySoh/S6dFJw9Fs9GMT2lMhMOJrothIKUpAOd1n7xxn1zl3Bj
 CpeEMARkGjgFqMpuJf3AmEelnH48rtJVGyVsmngra0fh1Rvc04pC9u3Y
X-Gm-Gg: AYBFou0XA/Fvds6h68kAp3RZ+iMwzPKOUxFNY/Ze/AKGeJu0rLzt/8zZ6RWuyz8fGbm
 2nxgAhNTsr58VuQmqUSsr2sm52FQdyDHcrPKXzJIUsd9Y56jPlLUUtruwo4QwgiPJt4WlfzTyuI
 ssTvbq+4TylQAQLx5U5PwO6E9zzAlGFEEVIh3LZnwr2awyv5mfLvQA21yrqKh6EIo45l2J1zJ0m
 N9BFGRZjEJjq+hBxqdr9NLmNy+nSZJ6Sr49BCuunruAx6G/OsaVMX05O4RYi706Sgb2m6g7Efga
 Rp16OPnz+l7lpWjU1WEI95gqBBv+c05qXPWmYOe7ixwQuJYZAH61B19gNHMVnC7uULT7CFGQsxq
 KpDZ7LlxwMAwOGGAIHGl8N7vQ7VKmdZLfdZrXvCF8NxcoGvoDoE1BWR6i49V7pSGYJERVCMBIq1
 afEWQ7VjXBp9LdAn2rWnyxTcRlNUQ5eHhEm/hRhmF8x4p2nncfHHVMpADLeGMnofl45RSNTTd3i
 fBB46Ct5YstkD0qexQEFPXMJoNNilA7/QSPQCy5jA==
X-Received: by 2002:a05:7300:8242:b0:339:7909:9782 with SMTP id
 5a478bee46e88-33e8d9ce7f9mr2561360eec.21.1790169681656; 
 Wed, 23 Sep 2026 06:21:21 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:19 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 026/114] hw/intc: use target_long_bits in IMSIC geilen
Date: Wed, 23 Sep 2026 21:15:00 +0800
Message-ID: <20260923131635.1894-27-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::23;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x23.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

- Compare geilen to target_long_bits() instead of TARGET_LONG_BITS so
  the check works when TARGET_* is poisoned.
---
 hw/intc/riscv_imsic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index bf0434e96fd..30fb60cc312 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -52,7 +52,7 @@ static void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
         return;
     }
 
-    if (geilen > (TARGET_LONG_BITS - 1)) {
+    if (geilen > (target_long_bits() - 1)) {
         return;
     }
 
-- 
2.52.0.windows.1


