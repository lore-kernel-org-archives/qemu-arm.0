Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2599194ejm;
        Sun, 23 Apr 2023 22:50:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350aR4rhYxxOcIivQufJWJCT13D0ZFnPqCfpo/8NXVzD7n7kIY5luv2GwGaYChAHLuwEyJdxe
X-Received: by 2002:ac8:570e:0:b0:3ef:7975:99d0 with SMTP id 14-20020ac8570e000000b003ef797599d0mr7244230qtw.31.1682315433852;
        Sun, 23 Apr 2023 22:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315433; cv=none;
        d=google.com; s=arc-20160816;
        b=zw+bVICq5nkwjmNNu4WIVEV+MQx+VzaDzjZarwAOIlAudbeMohwuOt5r6hRTrR9bdU
         IqQLlo8JOl5jdy1Kb4WChXNt2QSmxjCHcYtDqGvG2MPpFxPC/8ahpc0tPV4/AND8lxnM
         m570miDKu+ag4INNbcJsyompELncJ3yeA5hjsqrKfsFH2lwaUHVPvseEw7G1UUrva/Ua
         3Hj7wD/p14VD/+vqaKSi1g2rr5zTOk9aM9P7kb9Aie2452YK+SakMlJs42LJbAmnqudG
         ffH+hOE6KeMbUYZLZjr6q6SeFJOjylFcqdTmkdVI/0XAMZgHfwxWeE3TKyl7OcO7UR9o
         k5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
        b=hJEBfwt6aAUjwljVY4ftBtHr4dDW9xiSZuNNnZYC0uH8Vlqqfbqqe7Ij9a94r3SyFr
         gxEzM0zqJ3CWiUPg4FMogENWM0rGPwyIG7igv6WchLzmWoG5Z1r9sXPKtXxEk5t+FhZt
         d+Zl59BtwmuNJuxOB6qYBd0xTb2dYAgVz1AM5vCmClCr2sDzMt1DDrrNz4jg+8G3RfQh
         aZeCvG6IHs7ftSf81MEL6w7auhWMLiIRn6oNK0sBtddRQofae5YAaLoHWXkcyB1peehY
         PnwYLxf9Fu17+x3brQqhZUNVaQAgX5yKiVWs7X+fLZNAsIsz6eYoAP+kU5WVWJnxCSdX
         POQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MmzPiVw9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15-20020a05622a030f00b003ef313a76efsi6619111qtw.561.2023.04.23.22.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MmzPiVw9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqozo-0004Cv-6v; Mon, 24 Apr 2023 01:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxs-000614-2L
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox5-0004Sj-9Q
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f199696149so9912785e9.0
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314885; x=1684906885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
 b=MmzPiVw94/N8GP4MBrx0ngHM6fB5+bNR233hk9HXByztg2TeGlyGyzGvN9k5d1Fz23
 gREr4amY5/u9J/J79xv9RJhqRGC+v+of4sNJc0ZFCMggq6xBY/Z+dTA9MLeOZKhhhN2j
 OTrnuIfPx/x+szg7bGgoiGA36QogtHUxzEd0C68TCLwpKsKweAGF3PwAZl+cO47HrzZh
 HT7cQtboY1PittCOfcHXzdbzUZ/ZnwxGzFtJpEUDmgME0TDkaba/gwCw75MvFsmHQn59
 heX39jqf9vF05Lpv7r0xBs6YlNqUYBbgq7KCzpZ9/y4UvaHrQo60GE/b42MHgZTAI9Px
 S+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314885; x=1684906885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
 b=YroUy1smXxWY2M+NJxUQlS1TFQzm3BqNMFaPaynqfRKBuoQI8/VxFrQcJYhewsp5JH
 uquyi6tt1yTXrsvmefnXfHzNTps6a+DJp7EJxhpQnHu4R0KiuNEhfDLGvvAZ/BYGJqNw
 lROB4rN4FqVvN/SracUuGGwI7A7EgupasjPr8tAOoabnh1KTfvIgVSpGITgVNZEQjech
 BEMk5U+wmx9VzcsCyARQznzc09X+A0K8gZEA+iounlSWb6PcbyG1k/82FxZIPhMJGyhU
 X+zAT1uJGZV11L+35YPgBguc2mSVJ2wwT6oI6aJ+npIdnMufvljS68wvb+tLjTYd/FdU
 pSdQ==
X-Gm-Message-State: AAQBX9fJzFylieSjDg+wat5PVGw9dqfgcfnfacwuzzp933kbIzU6lOBp
 vy0Q7/qWR1+H7f5gfDOIoR+rZw==
X-Received: by 2002:adf:f5cc:0:b0:2ff:89d6:3561 with SMTP id
 k12-20020adff5cc000000b002ff89d63561mr8193563wrp.64.1682314885538; 
 Sun, 23 Apr 2023 22:41:25 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 33/57] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Mon, 24 Apr 2023 06:40:41 +0100
Message-Id: <20230424054105.1579315-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ysXO7TcuCPP7

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index dbe4bf96b9..7e6466d3b6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1178,7 +1178,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is_64)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1636,10 +1636,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, a0, a1, a2, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, a0, a1, a2, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
-- 
2.34.1

