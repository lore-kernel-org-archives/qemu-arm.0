Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1194136wrs;
        Wed, 28 Aug 2019 12:48:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqh9t3K9NOeZuaSnU11bqsmNv2IeoB17ZrUGwNEjzKtM86RN6L0bZl05L+lmC6tlx6dBip
X-Received: by 2002:a17:907:423d:: with SMTP id oi21mr4728854ejb.184.1567021725534;
        Wed, 28 Aug 2019 12:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021725; cv=none;
        d=google.com; s=arc-20160816;
        b=cJKRVQKc0kWVWiQhY3L6tgY3iPDNIGItsqGQxeVi8FxMBnOmfWQ12dfbf9Y8M2kxr8
         Kf3TOqugzEGuM42V/MGBeTgSYi4DTrK9oR27o4e3fpjiPk8b1CIFedMZpdJz/d6zfPSg
         2TOGQJ8AJ0ISPK+Q6a3ZlXINuOxPreghxRQjtVJsFOtufNmTmNpS5m67x7Ra8PLBCjUm
         CAH9MtkADMaBmdz9LfPL4w+FjIZw5q17nnXpP1WJpZI5yCSKzM7kp1Wp2WObvSK5oiGh
         DxuAo95y7lhP/XHXLrLnQCOxxbCk8gd06lydzwVUaNTPSdOZrl07O1AzZjYoNHseTxwr
         GjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=89SQlaAeVhVp09ygtNMAn6vIdVWhYBgQFHPazRmvu08=;
        b=PkQOTCa5Z0CFSaRgyV/meIjqVpLlcLZwpVBjHv1yrCb8cAg2sFFrIao1Fez7LWeYHe
         IGDsN2Hu1KKanrx48YJf9tOnOXOe3Hy44J4OpXqviUGLxyTvJEn4PzgafsyvIB3PgpTX
         E0MEhAJOw2ryv7CnYrP9SqWpic6ZrP3CrUJkYnmeGtmrJtQBg9jMMnTIjMK+yOnx5t1s
         3EpJHs+O7bgXQI4QMlLUjibrKBb/Xx80wUkS4YJNsYxE8D6uiZxkeCrcBn+wkeJoEPJi
         tvoVgw3ZuNbQyABI5ddr8NcuuQjYzibqqFP5FTr/lRoIwsiS7CMcAeGlU9ZaA8cuBRVt
         dykQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ztx41+Nt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si1725181ejv.328.2019.08.28.12.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ztx41+Nt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33vv-00032X-W0
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GX-0003q0-Oh
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GT-0000PY-BJ
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:56 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GS-0000NF-P6
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:53 -0400
Received: by mail-pg1-x541.google.com with SMTP id x15so213445pgg.8
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89SQlaAeVhVp09ygtNMAn6vIdVWhYBgQFHPazRmvu08=;
 b=Ztx41+NtgB/AA9TuDP3LN7RA8e2+gh26+eXpSClG7BNawIO9uw+FhuCbhLmC75IYgZ
 REr5YxsDg3NfI4lsVsIyCUmnqX8EIdze91VE54I4FzmPr77o1YPoXFF8o3oAystB546/
 YhRzY2/XpJerWj8/r4fcIblHoyguh5Fy7azkhr4MBWvuLZOejj3SlavHvu794mQMehJE
 ZzigOoMYrntfc7W8W/VWDpmFcbWX9X3tSbX3riSL+dKKhp4IPyojPrd4KdkEoOHMvXXT
 gO0P/xPJtdlmYdYSg19chVjRe8D6eHkZjzCR9UVQiQDh7q7RsuyBggwKMMXtf3oarQqR
 GqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89SQlaAeVhVp09ygtNMAn6vIdVWhYBgQFHPazRmvu08=;
 b=IxNMKd05IwMg+QB74tgiIVEMfCTpUZKg+aYDtAXROZe3mW5SNT2LJ/4lBQsUj4QSb+
 sAqCO2zLVdwcVDJSh9JKYLa6oGOAIkEcFRuFFD5yoa5PHWvYMRPaK03bz53FPCh9IbL0
 f40q9axokCv6JyYBbAQuPwfLeW+mmcLE44D5/SJbF9sNfrVo9nHqLWoCVnYs2Ln+Aha7
 PW2kmfuAASDDB0rB022ay0jfJP4/0W/vKs6nId1TrYt5H43WzVDXquDwbqagKzGs/mxm
 dWeXHW6Q8mu4Ch73g3/9bjhCvDVaRqiw0LMoLxXC6IdFFM9iYdPUmjx8Djd2tL+xZLLe
 wing==
X-Gm-Message-State: APjAAAVl628wuu8NxhmszlxIohAa5+GAMjxSzbgVnCCMLdnVURjXG0BA
 RKPu1/fF7SJpahSZsUCjFJMeog==
X-Received: by 2002:a62:1808:: with SMTP id 8mr6522592pfy.177.1567019149913;
 Wed, 28 Aug 2019 12:05:49 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:26 -0700
Message-Id: <20190828190456.30315-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v3 39/69] target/arm: Convert Unallocated memory
 hint
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QWkZj3PPb2sz

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 8 --------
 target/arm/a32-uncond.decode | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c55bd1e563..07547f7b6c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10309,14 +10309,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if (((insn & 0x0f700000) == 0x04100000) ||
-            ((insn & 0x0f700010) == 0x06100000)) {
-            if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
-                goto illegal_op;
-            }
-            return; /* v7MP: Unallocated memory hint: must NOP */
-        }
-
         if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index ddc5edfa5e..60ccfc598d 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -64,3 +64,11 @@ PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
 PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
 PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
 PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
+
+# Unallocated memory hints
+#
+# Since these are v7MP nops, and PLDW is v7MP and implemented as nop,
+# (ab)use the PLDW helper.
+
+PLDW             1111 0100 -001 ---- ---- ---- ---- ----
+PLDW             1111 0110 -001 ---- ---- ---- ---0 ----
-- 
2.17.1

