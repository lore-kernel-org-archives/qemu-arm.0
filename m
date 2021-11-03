Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4293866lfv;
        Tue, 2 Nov 2021 21:04:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZFWDOO086FPSzwW70NhY5yw+0CetxjAqKttZ+hdpR7fYnkT2JyqPPM1qn37iaGZlXVhTw
X-Received: by 2002:aca:6256:: with SMTP id w83mr8595283oib.19.1635912299559;
        Tue, 02 Nov 2021 21:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635912299; cv=none;
        d=google.com; s=arc-20160816;
        b=pMecgPxQ9pUMwyJ3zYrzvreSIsvhrG269DWlpYlE95q4NG8qAuHKiIH/K4C0uZT4Ch
         FYtm2jCWWda8MFKO1f4euCcpM3ye04JfrKWCuwvxiCOC05WHEvpN3N0MzDuRhB47wca7
         9BVWaF3YguZebP6SZrMiCAN4Db7//HKCCOJQ3uW9hYf70sAaXwruvuyui1BuXtYN4Qw7
         v1fuN49uO0BAZsLvjDGoONBu5fWQbH9UEpeYw5SSw+CxJ2BQy9FQIZD2lTqR9XRzEZdf
         O1Mrb956fIdPmU2JYKFh7I6CYhD4OPrC3sFoP2vd1MlQXplIImD2yL7utEl4kywVCrF+
         K0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cp6F7ZXBQgbCbYqEZRE/UiFfLmca7aMu3by8nxJeJnI=;
        b=iQ7BjdnE8yXAskePqJujtGhRYh1nZhUO844o08fCjlTONjyFvocGkvrBB/u/QZnJyM
         D/LUgw7dMJXhH1mAoYaFxbZyIDR59EWNlnyEuG6w548qJTGHQVNtSIzUVfXRHhmP5ybw
         ykL1KRKwJalnw9E71gByeXy3Fygf7X0A2NO5bDWcUqBSHGsD764UyssCM1GcNY/cf5cR
         t+Nd9UkKy58VgJSYgxXiQLV8TYMZbUSxQ14PiBiRjX0O01rFpzwurZnu5++YfidZMf91
         bvPEiqFAHIxWvbRhSQ8l2+mnuzYTp7ccicFpmioS/Vfd6kbgXs8OhbrCYVtLmlcNR2Jx
         6wJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPuc0k4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc8si1389909oib.204.2021.11.02.21.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 21:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPuc0k4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi7WE-0005yE-PB
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 00:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VG-00054s-GP
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:03:58 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:35356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VD-0000td-Ri
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:03:58 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id u25so1500068qve.2
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 21:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cp6F7ZXBQgbCbYqEZRE/UiFfLmca7aMu3by8nxJeJnI=;
 b=sPuc0k4lxxJi1HtBFzuhzWVEiHcvGIUiqSm52W24nPR61HagVB/DAf71bR6qgidCFl
 W8OnH8kwD1fgkVs+v2IH9ULvFhiVX5vIufjuy9YsjH2fBKK4YeHXD6G6WeZEQU81H84U
 lUmeUmemcvFh9JpAtWH6JoEqbg5iW3nIFvrfuM9PIG+0gwzjTaN6GXKcXB/ZBcZPKxeD
 ewigaZI+9zSGgFyP4VAXaA81TUupb6/tGa9zv8rFF6wXX+lupTFI8V8w8+MWizE1hNpx
 eiVfmy/dr7ETV65gMbY4rzhqiU+4GiM4IhrH4pdiRDrwr5P2jxNi2P612F4logEO0Em1
 v4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cp6F7ZXBQgbCbYqEZRE/UiFfLmca7aMu3by8nxJeJnI=;
 b=1kzxvQLfeUfoZYKW++qrrJLLmBD1AOoPrjmJN6Tp4Gu//saDCZZOuRhAHdZ4OS7myj
 72hcCuH3MA/G/0wXhwldxEcKriqf6RLVbHWBHFm363cyja/r5t04wTQIrWbqMNeBJDPn
 upG9ubeePdRVFIpb7BhgTfhoa0Y/FLV11mvWY8S1X9fe3O+OPiYokgr3J2R8NK3y3Zpq
 Jd6UzK8jSDPgzZ9QqyoTxkJFHpp/BicmJDBtIO4O766QD74w1dseiYw8KdFBI+mgY19L
 rucY6Dg2f1ruO1Ac/ySuV9MzzAmazW7kXlSO3YygzydZKgD4pKxvl6++kft5pibYHToe
 St7w==
X-Gm-Message-State: AOAM5314T+Hnp6QyeIW7erCuHDm/PR7YqHT9Oxr4josHwcUQkMg6s7HG
 QIaFPNZnv3u8Ox1UDaCV1AoC/A==
X-Received: by 2002:a05:622a:148d:: with SMTP id
 t13mr41936079qtx.393.1635912234911; 
 Tue, 02 Nov 2021 21:03:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/10] target/arm: Hoist pc_next to a local variable in
 aarch64_tr_translate_insn
Date: Wed,  3 Nov 2021 00:03:43 -0400
Message-Id: <20211103040352.373688-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VlHjLJxmvEB4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cec672f229..9c4258ccac 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14750,6 +14750,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *s = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint64_t pc = s->base.pc_next;
     uint32_t insn;
 
     if (s->ss_active && !s->pstate_ss) {
@@ -14769,10 +14770,10 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         return;
     }
 
-    s->pc_curr = s->base.pc_next;
-    insn = arm_ldl_code(env, &s->base, s->base.pc_next, s->sctlr_b);
+    s->pc_curr = pc;
+    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
     s->insn = insn;
-    s->base.pc_next += 4;
+    s->base.pc_next = pc + 4;
 
     s->fp_access_checked = false;
     s->sve_access_checked = false;
-- 
2.25.1

