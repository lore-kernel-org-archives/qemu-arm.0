Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp244532ejt;
        Tue, 20 Jun 2023 05:46:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4X8TgRgy25Fg5HfaxlX50uwaT3BPsnT4yxZurizKljZS60c3zo2jMdnktsalXzrz/3882a
X-Received: by 2002:a05:622a:8b:b0:3fd:ed14:6eb9 with SMTP id o11-20020a05622a008b00b003fded146eb9mr7016947qtw.11.1687265192530;
        Tue, 20 Jun 2023 05:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265192; cv=none;
        d=google.com; s=arc-20160816;
        b=Xb6Ljnf1SmnyKgqFDWBHaCwbIgk7J5TODPM0jYG97hplj9F0nKJKBIJjlVj2Ts7SXO
         nU0ETA4qNvb2qv3bVFkv17XuB+nit5wuAKI/C5802N9Q8VC4rQKXyMHYT47ev6/EP5pG
         faz9qaQzqFSnn1tTCYyRWMHbbpNKZtWi69m+fwYcANK08+4aV/QY0KbRVBSildWNx4sW
         m+jEnL3MDY0U1bIDoDQ0jZIMbTMbPSX3T4CoQX2nqhYIyQAO/PxEiTVVeYuVwwUMsckV
         6FZzMhsUpgYP9Xhz8Ib2/A9VEmFMnj7IVT2zWs+qylbs1i/o7mED2V4NWsx3QCpKv9E/
         zQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3Qb+YfsmMaXVy5lDjjPTSWHTsaQ7mtmCSzuA5ibkhpA=;
        b=Im93P92WTHfKvK/d7nRWiPE6tSMentLXfTJ0fjpmBWkiTiZPTfNB+IjSMz7N0jW2Xx
         FusswZuE+tVu7G0TEKulL6+kmsQGflh9YFUbWK9esUidjt8LPaWSp6K5kEF8wg0BS9eV
         964rvUW017mX40NlYyfgUDIPJAUpqcdyQVjwek1FhDhQiakfY/vb7PGNdnMkgcKX9tXF
         cyu4ChVFsGDI2v3TAsLMq6BmLNex73gZEAIFVB3AZMuFnFAbXPCBtuPIjEdkI2VodySX
         df91WxezmWAdQ4QIqstYgU/iqQudYOwHdEvJ01+fiu+Tyl9j40xMcwXi8qXAgeat70Cm
         fQ3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQEMplP2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020ac85987000000b003f9c8134ec4si739108qte.217.2023.06.20.05.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQEMplP2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBail-0001Si-Jj; Tue, 20 Jun 2023 08:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaij-0001Qz-Q5
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:29 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaig-0001rg-Tk
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:29 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f87592eccfso2330195e87.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265063; x=1689857063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Qb+YfsmMaXVy5lDjjPTSWHTsaQ7mtmCSzuA5ibkhpA=;
 b=UQEMplP2p5KYirkiyM45ntIhCFg9BYgsG7M/9fnEjfvPbmm/0Ae2Gh/r51ZGHcfjRE
 1fQ/1MPHGNjvBFYKf3JzTMp9injt+XB4xpIY7iHHhckPg5owRpmWSkRDKSQ80jty58SP
 Ja/ElIXB5naHmQxYBT8tYwW4EjZLTvLkAkv67PGj4w6rvKkL/GSIESt99cSKtKkqwiWQ
 sw4+GEITGGu8n6XVxMOEcT3cglrYnr0smZpYdogkXOKW6kZ4ni4oZmMPAjg5jFOrSt/y
 HMcvfDNLb7dwao+nmvg7KVSadotj32wl6Z2tda7zUWWozsyTKepEcNJZEd+uYsMeWFs1
 moHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265063; x=1689857063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Qb+YfsmMaXVy5lDjjPTSWHTsaQ7mtmCSzuA5ibkhpA=;
 b=ZZmvYh8ayHMYd19ynzUG1NngHLVTFgXRM8pl5PVIDygLBkWPD/mDgBV2V7+ghgQ0L7
 rLYBcvS+05kfWktI5c2dn1g2SmwnTpWN0dWWQFvMBRFT/rNU3MxaJAOIswgFeXHh4Wfq
 ALrLNPXWHLvvhs+hJTxIRdIzptKv1LdY0R7bK3nJnovgAvjP1BpkJ/IV5WaioBfQSH15
 KKNQ2kUL1mSQ5+5myaFaR9eqq7Xb8a5bWOp0QpWfpiWCBFzwiqz5h1jibXean5XvACKy
 4enh5pIepxUSQFxGreGy77cLZWbMagC8EttmoF2NYtQIVY99GNJz2v3GMN6nhECmqzpG
 OKyA==
X-Gm-Message-State: AC+VfDx3eNxOeYjZPw4FdSh/uU8Bbard3NqjEbrwGucAwTMlhXt0lnwv
 AfbMUGFdbBnqfFngzFsSX0nG3w==
X-Received: by 2002:a19:ab1a:0:b0:4f7:d2af:3ed1 with SMTP id
 u26-20020a19ab1a000000b004f7d2af3ed1mr8113975lfe.42.1687265063522; 
 Tue, 20 Jun 2023 05:44:23 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 03/20] target/arm: SCR_EL3.NS may be RES1
Date: Tue, 20 Jun 2023 14:44:01 +0200
Message-Id: <20230620124418.805717-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: 57Wp06bcZx53

With RME, SEL2 must also be present to support secure state.
The NS bit is RES1 if SEL2 is not present.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2f0d9226e..9132d4de6a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1855,6 +1855,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         if (cpu_isar_feature(aa64_sel2, cpu)) {
             valid_mask |= SCR_EEL2;
+        } else if (cpu_isar_feature(aa64_rme, cpu)) {
+            /* With RME and without SEL2, NS is RES1 (R_GSWWH, I_DJJQJ). */
+            value |= SCR_NS;
         }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
-- 
2.34.1

