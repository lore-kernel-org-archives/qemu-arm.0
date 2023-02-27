Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4388804ejc;
        Sun, 26 Feb 2023 23:59:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8+6cJIT7YR5zX/sbhwbw7uQPZFur8zuUAgnctZY3rMXmopXGPvdg/DGCyTJN+587bg566E
X-Received: by 2002:a05:622a:38a:b0:3bf:c221:5871 with SMTP id j10-20020a05622a038a00b003bfc2215871mr16278145qtx.54.1677484777167;
        Sun, 26 Feb 2023 23:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677484777; cv=none;
        d=google.com; s=arc-20160816;
        b=wojGKYWxIi+sDiBjEV0f1kYf1T3WpTrBcxhhzrRKU+6oANLXf/M93oRD5pNjFCdd//
         gumfTiSHef3ALOslmfeMOtlKbFdF7f7VeIBLYjR4OQViTTAQbMpAEktGrcEUMdZjdz41
         TPYdc6drHwpLKygbbh7mUWNhtqGzLAMH1gBV4H2a4v5Lmjk6ElChZ/gLjIyUcr84bV+x
         YJ78ZIwFHPpBRH+wHuiferbOStWC/hLAmspG2G5NNvSyr/Crg4V7cqxGHl0FFPK/RJTj
         N/sU+hmYx2WKukL1Zdi0xclv2M86ertecypkh1KxNt1IyOF/CZQrVoABP1ztOUoDU2JC
         D1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YPI3gM35f9kqtK6SwX2bfmUKEAAhOjVzMIqtanR4H+c=;
        b=ivLoPlcFJ1nbsT/PfAkQdEhpDgObZCtneXkrl6aDDKeiQMuD38oz9yZt5VvBGH7x44
         djH2yFCDGJRKHCx+5fFcPi5JSXFm6VFS93h5KYQpr0SAvbSZnMIJH0yK0hD+2Si7yeNs
         GfSjRS2/ExldOpCwTagQRmiL5040wN3fOFBOiSMZ+Z5CHjM4hPrwTUE5raHVDa7fbfnN
         5rBsndHrSu/1vzJGEJXrkT/K40LrlndHB3km0XuIm5othLWv0gdR91H/ejnMgD62Da+V
         WvMv81tnakjY16nOSIIfZbHyERQ2Q2QsAY+J2qyt4mGaWGzMfGNibF/ztgF52+UpqZth
         xZFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqCQ2XqR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a05620a244a00b0073b412c98f0si5997842qkn.756.2023.02.26.23.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 23:59:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqCQ2XqR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWMi-000136-AB; Mon, 27 Feb 2023 00:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMV-0007zW-O0
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:47:49 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMP-00074k-OP
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:47:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l1so4914351pjt.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPI3gM35f9kqtK6SwX2bfmUKEAAhOjVzMIqtanR4H+c=;
 b=wqCQ2XqRqzMwN4CQ1dMPlJbwaxJMem8BYVNyRiptWNHYpZxnGZeVHhk43Xi4vzKBrI
 CUpIExMkypOscQNrlsDv090uQq0bnoJjvnBXcJ1KF43910HLsXYnN+vvdaRHOxlK58Vc
 rlRyFHxYDH7UXsLf0t3TqLyfX1HnowEAljpUYrqY5NRJudz3SrBK5YAzo6L8ZraZFzTd
 YioOkzvnQotfLB7lh4GOfujgB9BanYK5Dgve/G7GIJU+PpEmsrIRU3IsoNzZ4sw1j7Tl
 Nx1kQDJiaSCKUDlbQ2xossFWsnn8RnXdY7qFOMUO1qWedArYZes1DZjV6IcqJT6XIFJy
 U0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPI3gM35f9kqtK6SwX2bfmUKEAAhOjVzMIqtanR4H+c=;
 b=shEZPGkeyOo5Hj2Dxu0dA2+SZFYwSo+v/qTkzXPFhKCenqSVrS88Rn8NgYrj1HJK3g
 YHO180X4RIP5ev+fGnKxhYzgGWaoWn/bwrO2VmWnNVN9srd/HlXN84CDJZUl8CLmYGDc
 ybhmptIEAOFPBy03WnlCXOguM0utgTMYrq7lksGeF1RDTkgeFP2DHYSgX/ysv7xadk4d
 /R6Kny/bbuNKT4iyzN2qHm6nbz0BSXLts4H2e+1MNngpMpCoKey98qMHwGB0Iai7fzJk
 T/2a+GOhkw0J1QQkWfM8QY2bgklC4OrHihiddp/XpQ6kIhR9PmKMCh3wEBKvXuxiDZVI
 X8AA==
X-Gm-Message-State: AO0yUKXx2ahzbVV2xGAXV/SpVuVDN8raXypkZdcPFtswVb8wiB3g1gMd
 NX7i38NfC+Lsbjw+hulaHTh16Q==
X-Received: by 2002:a17:903:2903:b0:19d:2542:96b7 with SMTP id
 lh3-20020a170903290300b0019d254296b7mr339748plb.39.1677476858650; 
 Sun, 26 Feb 2023 21:47:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 43/70] target/ppc: Fix gen_tlbsx_booke206
Date: Sun, 26 Feb 2023 19:42:06 -1000
Message-Id: <20230227054233.390271-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9cOr4B9QVUEb

Fix incorrect read from rD.
Avoid adding 0 when rA == 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f74f3b8f0d..52b812a01f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5867,12 +5867,10 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
     CHK_SV(ctx);
     if (rA(ctx->opcode)) {
         t0 = tcg_temp_new();
-        tcg_gen_mov_tl(t0, cpu_gpr[rD(ctx->opcode)]);
+        tcg_gen_add_tl(t0, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
     } else {
-        t0 = tcg_const_tl(0);
+        t0 = cpu_gpr[rB(ctx->opcode)];
     }
-
-    tcg_gen_add_tl(t0, t0, cpu_gpr[rB(ctx->opcode)]);
     gen_helper_booke206_tlbsx(cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
-- 
2.34.1

