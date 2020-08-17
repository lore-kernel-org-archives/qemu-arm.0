Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2904641lfy;
        Mon, 17 Aug 2020 07:02:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG18CL/+64/ogK/yBwOp+qA36vsAD+/La4XQk4ADUyticTV8sBx9/cAgbxdq1jaKXu8pHr
X-Received: by 2002:a25:bc50:: with SMTP id d16mr19005971ybk.230.1597672927879;
        Mon, 17 Aug 2020 07:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597672927; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0X9xFpNVj8iAuPbJ4qyP6cU8AMXwrcfiZZW7isPx5fKgZef4Sy7zvtjK3AcvXwH4X
         ntFiwPPRydKtnILnGjLpG9IW/kH3YW4Igp+qmvDeXEZs/btAcMnOjyAIImbzhgAhZHQ7
         eB+DyBEwtIu1wKfNPJHHnn8P0lj7HtdAWsIls3jjaTHlF58Gs76jvD6HiKyv1NV4Xc3S
         1COnmKYFDkHyHcDKhZ65/nbgt3JsginwZcEsLYN/geV4tzbVtnUsxe+mYMwn9ZUyWNAu
         I/fG/ssPTIRQKMaoib5qDfhtC+ZHS5rclPtfz/mvYJE+iEi6FZqXqgeL0xLfTmQFQ5tZ
         oOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hCmudOOZ9aY/+riJSRrIyYnafB9XQ90ekRagFJVmQlU=;
        b=KCrDKkxF5jXtJEe7agzUnmRvXFly9kqaWXplSDmlUtix3kO+TEyJIuF3l9kOg3JFDw
         TjkHSdBFT3h9pecIR2/epY+mrpjvJKaVI/cSydZttPKz8KCbxj5TeQ9gGNCuyvWu4kAl
         gjkTopIROsUK3yJpzE8VIgo0kM7TgEjxnQX8QgzrVIu0AjdM+ml9WEE7HC9VLnLWo+Eh
         BUxO760Ki1od+ZmlAzxIf+MkmGYKUuhTDdQviipvZLYTue2HPni7AZUig5VntZIKKMpZ
         xbKY8rI3qGa8knHEviScOnxWfsADyawIsPIxU9sxjsHTzB44Ffx15gafqWSM9476Blc+
         KzBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hf2yhCXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si23196922ybt.216.2020.08.17.07.02.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 07:02:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hf2yhCXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7fiB-0003LL-17
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 10:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fhy-0003JC-TZ; Mon, 17 Aug 2020 10:01:55 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:44239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fht-0001W7-Lj; Mon, 17 Aug 2020 10:01:54 -0400
Received: by mail-lf1-x141.google.com with SMTP id x24so8402227lfe.11;
 Mon, 17 Aug 2020 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hCmudOOZ9aY/+riJSRrIyYnafB9XQ90ekRagFJVmQlU=;
 b=hf2yhCXzMnvAgLqxwWgyoQdxFSr7Py3jsCEWqkKTqVnoXZnMjJXne5E4r103GtTsuY
 +DFSQiAm5KbvivHnpYgVRwh58vNkggpc3GGjqZrqOdCzkZke8uOz/5Cx8msai8rN0moS
 V6jZo+9hYZOW/uIoa1ekWTnD/qj7DEKwR03q6DMijewOAu4/k7TWBx2Sa6XoLTP8Mrez
 EjlCAzMCetxkJXQcNX3HJiXIE+JL/yk1wl1tq8gLhXYVgnvniPKA6rQvSn1+3+2+D1S9
 iNqX1VkNzJht2kHPJXCd6WgELer4VVzRoIYSZpMty3BtMFP01igNX1grsSK8lxFsfkSv
 qdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hCmudOOZ9aY/+riJSRrIyYnafB9XQ90ekRagFJVmQlU=;
 b=kWK7Ie7AxOLaorw219i0mtrjAyy4eBWWkjo/xxQ+g/kn5dYTPQGHIiyBzpNAcdUbs/
 rfH3Nj8ISmk+vc8wEw1TFXrQ1zNOtclmdpBb+NYVFLOWBc1W9CJ44yl4P+xRZ0DHsbLf
 5tIJ+eubk0Vf7cnvjLkd7EaHVgyMBnneXYGcmXJkwBoXNdATTeMcEqJabVzvpf4nH3l5
 UpN7avfLtVG2fuat0jeCgKTpF03JK+CrwqkfZY0LDtvDcQnlYXUzFfbyJ8OtE9J+xnkg
 NCiB4jhH4qOfIkzl/7J7zvjFDdVS6vldBYhFJOC26vO8H1ppgGlbwVUAG9gl/qkQhUu6
 rHRg==
X-Gm-Message-State: AOAM532SKRtBR41mHOaVjJG99EkEIniuThI3YDWDDX8kKrBIksFowlTJ
 kr8NqQtE0d2buq25qu3RDbshJaEjkfr6IG58
X-Received: by 2002:a19:414b:: with SMTP id o72mr7588320lfa.86.1597672907372; 
 Mon, 17 Aug 2020 07:01:47 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q189sm5013030ljq.68.2020.08.17.07.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:01:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/5] target/microblaze: mbar: Transfer dc->rd to mbar_imm
Date: Mon, 17 Aug 2020 16:01:40 +0200
Message-Id: <20200817140144.373403-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200817140144.373403-1-edgar.iglesias@gmail.com>
References: <20200817140144.373403-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BlqxyactAxRf

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Transfer dc->rd to mbar_imm to improve the readability when
comparing to the specs.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index f6ff2591c3..47637f152b 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1229,8 +1229,10 @@ static void dec_br(DisasContext *dc)
     /* Memory barrier.  */
     mbar = (dc->ir >> 16) & 31;
     if (mbar == 2 && dc->imm == 4) {
+        uint16_t mbar_imm = dc->rd;
+
         /* mbar IMM & 16 decodes to sleep.  */
-        if (dc->rd & 16) {
+        if (mbar_imm & 16) {
             TCGv_i32 tmp_hlt = tcg_const_i32(EXCP_HLT);
             TCGv_i32 tmp_1 = tcg_const_i32(1);
 
@@ -1246,7 +1248,7 @@ static void dec_br(DisasContext *dc)
             tcg_temp_free_i32(tmp_1);
             return;
         }
-        LOG_DIS("mbar %d\n", dc->rd);
+        LOG_DIS("mbar %d\n", mbar_imm);
         /* Break the TB.  */
         dc->cpustate_changed = 1;
         return;
-- 
2.25.1

