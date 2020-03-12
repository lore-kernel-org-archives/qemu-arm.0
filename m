Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087220lfc;
        Thu, 12 Mar 2020 12:42:29 -0700 (PDT)
X-Received: by 2002:a62:e414:: with SMTP id r20mr10062172pfh.154.1584042149415;
        Thu, 12 Mar 2020 12:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042149; cv=none;
        d=google.com; s=arc-20160816;
        b=fkrdd2nw9XUkW+7qX+GowmvF4ZJ1C/KVECVfmgCb3FZEZYxrN5qv0Ics2P/ugxTo7Z
         R+5wKumjaGzzfkP+DopVd42wQsqbEV4ynG3UEnDZ9oGLPm/9R6OAxpPnwN8MfBMehzTK
         6VQOS3iSfCl08Cz55QGFxR379Ct3x5SCDE7u0wIwHXZZ+IVzSTf/SiDtlsZ+YpESRzf4
         ZBtboAHQhjbv7jIb0hJGYacrudm1wXbWbzh20wFB+/NnRPQ/mhwYwr0l1jt7zC6PC51X
         3aHjK4OYQUf1yfAML//7FqMg8dOfRx0bgqJ+PhHzYTQQIh0Vk1bNKGRe/dNwOCE9Pl/t
         a9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=h7AXraeqjBa9vhULwB29oPSWKU7V90nxWGB/AHNXvVI=;
        b=buhNntVd2LrpSQ1xz79/BsTqtACzXoen5NYlOB5u3PbujfDRk/tpiMhoHkPt6Po8ej
         aji8R9pEC4XYk6IpxnDaPYw5zVweiybQS7iXeQqiGk/OCNR4PrqI64vo+lyeBtUUMBi2
         /FhRIy4J41UMfVh1XN9e8JrjThKtHhspu3JEsAG89KyTsdZL1XYthpUSruAZqhzCDzt9
         rIhPDltUQJoKQBeFnldvG2pVXhmSMsVshPRZu94Me8fKW2tc5wnN3C1ucPCF+dipxgbM
         LBAVxJoCCOb18cL/bra1FtERode6svLDAtFsUnWJOPyIlmiDHQC3qX5XO9mC0MPwDAj7
         f/nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rb1015ft;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id gc8sor6811877pjb.3.2020.03.12.12.42.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rb1015ft;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h7AXraeqjBa9vhULwB29oPSWKU7V90nxWGB/AHNXvVI=;
        b=Rb1015ftymYuwi5nTcC4KlYDcTKVvlM5tuCW27x3uGhpkLiwc7K/EOQ5RAGy9ZN4tP
         E8qAkqyCaUFpLTRz31eS9m6OlLWP4jYsk75gz7xKdjnWDFj1k7B6G0T2Yp6IzyGg4uTm
         DHGShFuAeQwfQftD5Ui7k7fknncwhQX1LUQwTo3zUbcOIhtzAdLsEpXvJk7GS7aUI9KP
         P/cHam5CKveouVSU8dDb6hpAPkoUTzige9TSusj5sE2At8ZG1zK2lLnRFqzkt++LbRoP
         UW23tJCEZSnRdJxP6wBzI69zeikNO07+vHa8rjol1ptCBsLDrwBvB23W93uC9F5iDxfj
         PAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h7AXraeqjBa9vhULwB29oPSWKU7V90nxWGB/AHNXvVI=;
        b=RFSKRBbMzpPVuku94PhGc6vA/PwayVv60EvcMuejgcjl5wgIo9y67QWoYmFgdWUWyZ
         V3k8Eruw55awqRdvvwxAkM4SxWleYhuS3T/XVvjkQSh9Hhy9OWSNmQFWCFU/GxfkpsBN
         WCJKRE3GshiAlrBKu/AQWwVOX0Tg7lQIKkmRmBXiInh3/zYsNnEkcEIidlrA3CV0at19
         mZVmr4o3zAFj/LAyzUm5WdGvDSofEENo8b6PpPO0lFg8tdO7/GLFCEXtSWj0qJLR/G3b
         tbtEPaa9a0rrjMWjhLWGCMm0wl65bYzD0dEkajfl8Ptru5HA/g0pijR81IPjw1Gc1B+A
         CTZQ==
X-Gm-Message-State: ANhLgQ3Dl2j2Q9DlrLz6UAYBbxpWA3MhGRxM0OPjtzdDEOZCdhGDGGWW
	8dh+9J0/7WGBAWABop+gmL/rp+/c
X-Google-Smtp-Source: ADFU+vuzHu1KWjyX0KR1P38uIdtDAbaOIe2mN51c1jg56JDfUH3qgkBI8TIiriAV0ntkArUA+zkmLg==
X-Received: by 2002:a17:90a:8d81:: with SMTP id d1mr5772884pjo.63.1584042148865;
        Thu, 12 Mar 2020 12:42:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 06/42] target/arm: Add DISAS_UPDATE_NOCHAIN
Date: Thu, 12 Mar 2020 12:41:43 -0700
Message-Id: <20200312194219.24406-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ox7nyHZxNGXD

Add an option that writes back the PC, like DISAS_UPDATE_EXIT,
but does not exit back to the main loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 2 ++
 target/arm/translate-a64.c | 3 +++
 target/arm/translate.c     | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 41d6cc8db5..dbbb167174 100644
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
index a793ec9ee1..943d6034de 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14462,6 +14462,9 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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
index 5a21766cce..33a26287f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11420,6 +11420,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
         case DISAS_UPDATE_EXIT:
+        case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -11443,6 +11444,9 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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
2.20.1
