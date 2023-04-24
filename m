Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2596126ejm;
        Sun, 23 Apr 2023 22:43:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350bL5jk6thgzunY6abm3q/JK/fKipSzEyhHFJ0kWyMv5bNCIhQeat13bXUJhLFTdEWK59lwx
X-Received: by 2002:ac8:5fd2:0:b0:3ec:4705:d20e with SMTP id k18-20020ac85fd2000000b003ec4705d20emr23584170qta.30.1682314980700;
        Sun, 23 Apr 2023 22:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682314980; cv=none;
        d=google.com; s=arc-20160816;
        b=093Por0hA8F85YD1iPmHfa84yDw3r/qfLNCQ9KShwfQQNfQrlfNdzLwSlFYSN412gq
         iUzQh7VoqTH83KFj5QHTC4RvVE9yL4kfoZKG81+4//xQkiEx1sqrKNKm6zlST+8sXm8j
         +kFJsuFNkkPual6oTJHGMvtrJsMqElv9dMfHexHAFESV5THcAAOZeZT6sVLw9W4vl+GY
         dbTm0JKAG3S0kRYZXWGxfWZQtu5z0X5s6ueEjwH51NKzMgCgj+qtlseuCwbvezcoaGVA
         AEh/KusvUWz/5WkMiTiDGj5XnBU/QTilo08aqSyhwieOXOJ9nJxQB8ZLEXcT/n71gMUy
         rhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kUxjn8m10fBk8f3TxtdoxukkDWbqJjziW6krAeWvMi0=;
        b=1LENfbkEzydZLpMjTAgcuVK7TLtPKtiPxTqz/qrZXqDRcL1etsJF+G3ETbS1GLEizr
         BHOeAZ/js86j7vJEgOHuEH75gvU8E8b9TfsCISAqrgNA/+TJtClVL4riBvqZj7g8Oo0s
         u3HBQaljlKw+0OVrY8ExKnmZ9Fhl5/GxO9B8jWQePg4P4U4XZQJItFoTMSPaWCDrZVD4
         nRh8fsbCvAUGQ5946jFgaai0ydAyuB3sWPW9+ntfBgE+S4/E95eSDGC0TtDTR87cse4+
         Qh3EMCD92anPSLkypS5BCuBn0X4uyYktCMhf+hHt0Kxu2ClfOQkbaIMgVuDXRruvQlx8
         PLoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbNGFaxW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020ac84e53000000b003e4dafcc275si6819945qtw.592.2023.04.23.22.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbNGFaxW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqoxL-0005X8-S1; Mon, 24 Apr 2023 01:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox0-0005Et-6Y
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowp-0004Eg-KT
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f55ffdbaedso2405373f8f.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314868; x=1684906868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kUxjn8m10fBk8f3TxtdoxukkDWbqJjziW6krAeWvMi0=;
 b=GbNGFaxW0qBKRrcFsI99gICoCIObEvTA/N6Z0GhHXiLFdq5EhV6QOLgapVD+8gWKYX
 vd+7BPcKsD2L3sak9T2wB3MWoMNjqNCsCdWrH8tnnXbyZalawADaxvIcz/6GMQur9Krw
 7sNB6GJCatjyN54U55VK344k24nO80u6NscLRvL7VmlftVotrk33utNtqRoFDwuM0caI
 2YIxlpWZzfI1M705+/SzJm+y3LgiV5qCBKv5K9tT9DTamMdg81gIeK2XUgYxykqL53LQ
 24Df6j+1ley5sfSfp57+QlSetzKnz8QXWMd8mdH+snxvVn/Lwc1T7ymTeThokTHJWTzD
 oPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314868; x=1684906868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kUxjn8m10fBk8f3TxtdoxukkDWbqJjziW6krAeWvMi0=;
 b=EXgB3+nJ5bq+raDXl++MrIMDlQb2yvE8EJJ8OUaAk+hyGtkung0e2RtV4QeKKlZKQf
 OEdpb3Vtw6aUh1hJcDrcz23lxvtzLsIpH/3SfYH91OfeFHt+pvQgwY0/sh+0PEuH5H5c
 89v5zTQseKkKwoIkTmbdiX3VXuoSMZu0+d+N//pLx+uJL0XKSprBfaePIOcNZYjhMEEp
 GvJzj0aQmjhQ6NdLd+E86HRrtm8j2SrP3J1fRP3eVg/KInzoYE7/WBuJYQFTi3Rmy8sb
 7BBeJnUI6k+WNJz2qrj7d04LjnHLE3ctUHbkg06IiAPW49MJ27BNuimglVtnWZBvyAhT
 TTaw==
X-Gm-Message-State: AAQBX9dCgDetWywhIGp69mDbJ9jx3imQyWuqXYqCmjzXWfrRvsV913fT
 5NEB2VT6tALicGSF4JYMuksl8w==
X-Received: by 2002:a05:6000:8e:b0:304:6d32:d589 with SMTP id
 m14-20020a056000008e00b003046d32d589mr3425375wrx.18.1682314868201; 
 Sun, 23 Apr 2023 22:41:08 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 03/57] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Mon, 24 Apr 2023 06:40:11 +0100
Message-Id: <20230424054105.1579315-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: X0viwUk1ofqz

Since TCG_TYPE_I32 values are kept zero-extended in registers, via
omission of the REXW bit, we need not extend if the register matches.
This is already relied upon by qemu_{ld,st}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index c8e2bf537f..ce87f8fbc9 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1314,7 +1314,9 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 {
-    tcg_out_ext32u(s, dest, src);
+    if (dest != src) {
+        tcg_out_ext32u(s, dest, src);
+    }
 }
 
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg dest, TCGReg src)
-- 
2.34.1

