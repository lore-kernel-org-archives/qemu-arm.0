Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4342584lfm;
        Tue, 23 Jun 2020 12:40:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzojvMXWfywtxNG0tIl7yHuXCmv/11LU69qigmmAfCXbuZNUQXnrnNAyAC/R9uDTrBXmpZv
X-Received: by 2002:a25:bf8f:: with SMTP id l15mr37609229ybk.453.1592941203068;
        Tue, 23 Jun 2020 12:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941203; cv=none;
        d=google.com; s=arc-20160816;
        b=okpfBOwSqyeSRwxNTehswvuwtUglNg0Xxw8vPPqerbqMBa/gq/8pxbCS9tYYm+UcuY
         DW7tbjyUYA2OE3NpEOK1544M55UTDrdbZkEaQC1rNZ0gIjbsh8bkGsaiToNrHS4qcE8w
         lxuIQdDuyYRSV+o9jIkqLUzxJE/buWILuGIy7Nd1viayN1HnjpkJ+t1/NatKbSstzImc
         X+npAohoLuSPnPDy0zS3/ZolfnhbUPaJF+uu3HTxVB+XepY8bMlQtfyjGEjLm/OSRYCX
         uHh7q85MsuCZqA6e7lfBiSA7pXVt9eXb81YhFqtzc1mAWX8tLmWsxw+q4EBhcvIaBOZx
         rHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ztdDJx0ExFHe8U9Rsp15LQewSOcXI1YJBCF+u1ybiMg=;
        b=ZDhatXOCSgYymVrxL1wbfV2YX0cNTXStS8lkL58Z8SPGiN5qzVUlXxyXAEFULaVHvp
         rQkT7WM13a0aUrehP2mke8ERymjbVQhGQdRxpgdW4jZaG+s9QwcNnaUDGt5PSM55kyXz
         vvZTd8Mvg8XnL/b3ll2avvcYfx/EsongfbzDrCg26Y2PNIDt9TxUQO6OGEo+xCuSYwWt
         h8/nU916DJ14cv5V5AEHcKtYYHAO0i8YWbsmuazxGMdAl/G5PeUF+5zwXFpsF3N+jBqy
         zToS3GsRtCgUFUuG1yEk66OMEfLoRIiqJttLuvauUL76DDJlJO4fVmDNr01V+o+J271H
         tOHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dD+6/qZH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i127si20694202ybb.475.2020.06.23.12.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dD+6/qZH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnom2-0000bE-CD
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojK-0003RN-Rw
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:14 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojF-0005XI-Vs
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:14 -0400
Received: by mail-pf1-x444.google.com with SMTP id q17so3363166pfu.8
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ztdDJx0ExFHe8U9Rsp15LQewSOcXI1YJBCF+u1ybiMg=;
 b=dD+6/qZHp/Je6fa++veUSdrBukySRuCBizJAX1jUzbZ7UUw/VehNs2LIniG+Mjk1fO
 fBZonBaCjTI0osePmb1DbhP1LFsGgestwr1uGZBwy/kB2EOh+otUsDcGqYgPQFI4/N7y
 r6HihAUI/GHcxqHGpkw7qJcUSrTHui1jw45nZJEGrnroH4nN5Ja71ZNmQvMGhLIDCl+e
 qmUoUCTuHMhgv6/CK38rmV3s/Vapfw8UX2LiceJgsPqzzpEwysiP8gKZYEKWVCgdzTOo
 v9FXMavXdn7gFUL8Iwo9DA4otJx622kTCpNB4k+CaOQhjN4ySujiowILgRFC9zfGjm+E
 xMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ztdDJx0ExFHe8U9Rsp15LQewSOcXI1YJBCF+u1ybiMg=;
 b=ayd2dYGNqcYd67LvejENuF78JEqmq+07BvHiLkLT5XT4ZtOqZUim+P/fkVGDuotuJf
 uo2x4hCKmeNiB5opEQ/UWbmXpy22p6MA+xGhUyUu/tFj0TRrz193Rm48pBZHODraCaF3
 I7M2nSL4QkyJUdG7vRpJ6KRsEkXLs0HJcDFxrb/5vIbKHhNhHlafY981hMM8hyKfnoUY
 B6X0R//QmVTFBEsqTgEhNC5XIzL0mItQY5iU+a2wvpyYXSAgiF102KUKDwe53xR7i1gy
 3BUvW/BYEhuquUGIBWgeDeDaEGcPT7Kh6l4vunx0m1vsGiNkqxnQENAeYxRKLfWyn00v
 dD0g==
X-Gm-Message-State: AOAM532jILiNbWqXVJKITVt6uuwAbBI+NGRmXZcAPjBzL6Z3POuTSwUo
 epKhtBonessGIlKNllufZ0Kawg==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr18789452pgb.15.1592941028697; 
 Tue, 23 Jun 2020 12:37:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/45] target/arm: Add DISAS_UPDATE_NOCHAIN
Date: Tue, 23 Jun 2020 12:36:19 -0700
Message-Id: <20200623193658.623279-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SFjOo4IW7thy

Add an option that writes back the PC, like DISAS_UPDATE_EXIT,
but does not exit back to the main loop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 2 ++
 target/arm/translate-a64.c | 3 +++
 target/arm/translate.c     | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6c01f47983..c6f9376000 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -173,6 +173,8 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * return from cpu_tb_exec.
  */
 #define DISAS_EXIT      DISAS_TARGET_9
+/* CPU state was modified dynamically; no need to exit, but do not chain. */
+#define DISAS_UPDATE_NOCHAIN  DISAS_TARGET_10
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 63029bbc59..b4bf4cce18 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14310,6 +14310,9 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_EXIT:
             tcg_gen_exit_tb(NULL, 0);
             break;
+        case DISAS_UPDATE_NOCHAIN:
+            gen_a64_set_pc_im(dc->base.pc_next);
+            /* fall through */
         case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr();
             break;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 45ea788370..00f94371a4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9926,6 +9926,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
         case DISAS_UPDATE_EXIT:
+        case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -9949,6 +9950,9 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->base.pc_next);
             break;
+        case DISAS_UPDATE_NOCHAIN:
+            gen_set_pc_im(dc, dc->base.pc_next);
+            /* fall through */
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
-- 
2.25.1

