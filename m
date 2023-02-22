Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3826796ejb;
        Tue, 21 Feb 2023 18:34:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8yWQR0cn4VyWcwelslpVFQSHtG34K71FDbN8/NI0arZihU1tD3tjPTWZzi5pj8RNuYSqqp
X-Received: by 2002:a05:622a:282:b0:3bd:1647:1602 with SMTP id z2-20020a05622a028200b003bd16471602mr12367408qtw.8.1677033262203;
        Tue, 21 Feb 2023 18:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033262; cv=none;
        d=google.com; s=arc-20160816;
        b=fGt7BAguXCIpWE52aEZkTnf9WV7x8nOQlVGBUz04I3J2atO5/obmKBt+V3H4EV0Ki3
         MWCaQdQ0tS2W8hH9uVUzEz4I/w4BQ1ZaR4G/9LFNWULAOxLeIng6L8fR+Qn/CpY0pB+q
         NO8bsP0t5IhuLD1113ERcs3CHRMkYStSTqCNrCiqKeCjcDPlTaShL9FhMBYe1hod6PqO
         iu465GFpaAbAE6wE0HvkvDGcsKAUX5y0Cn2BzzontusNoMxnJLllUZ9p0oEYhq3fejdE
         2F7Gj/cDn293dqBOy8yjk1Luyh4t/7VKGDEE3H0k+EDMkjfgNrQlhXPoaf32l7HYvASp
         y4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gIb9lNHS+CMTRMz3x9CJbUe7BEB0EF5QrLaX3CcdAas=;
        b=PebSqsDUXVL1E789IFJpDpZ8pOwc2UxcKYrMarxphQKbDD4UHKz26050NJNu0JhuEC
         VpZjRwzPwNvdu7KFWY7iUgLvMNtNEOuap6NcUSrrDvDY4UbRVtx717a8+jZAbzkAZl2p
         aiCsba9dKv23z6aTtUT3N+5MMNCTCyY5+iFBRceXoXo45WvXGR3eW4vjVOEzF2QRcIXd
         8bGxCSkXY6HV6hHrdbfvj0QU6VoP0Ouns0QJqm9mo1Nb+QF/AV3IR89+ppHup8CkNOvS
         Balntt3fBKFbSeOH1U4m8tLvuEphccdCvo7DgeqSIXdAp5aB3nnkzG4qqDJ/IsPxW1ji
         7vqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nW/SRaXV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020a05622a111600b003b63a6cc22dsi2913171qty.701.2023.02.21.18.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:34:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nW/SRaXV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUexB-0007Jk-GT; Tue, 21 Feb 2023 21:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewz-0007DK-Br
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:33:45 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewx-0001XR-RO
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:33:45 -0500
Received: by mail-pl1-x634.google.com with SMTP id c1so7463399plg.4
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 18:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIb9lNHS+CMTRMz3x9CJbUe7BEB0EF5QrLaX3CcdAas=;
 b=nW/SRaXVdGDcoZthPrOF7bk6TL6nF4VHsHXd4wZ7l3v4Ko+k2xSZx77FtEGSaQac5r
 GvJ+NLvQ7NWo95gz1sjtkLIUQue1YD+wNU0rQx4kkPxh76csAyxfxbRynZ3qDcrA/7VL
 L6/ZGAek1WFH7cnQkVWA2bfb9WV9q9qIylDtr6mZ7wYBc/Rg0U8yprcw2ZroAToNzd3r
 CEuCs0U2M0F/5pVPpzAvVXdCqbAolesIS9IwZ4sI/jqFhaeJ9CgeQBaoHx98GZGKZ7FQ
 fSgeNglcAkjh7WTDjvRyv+T9Hp+S33ENMTAOPoxGpRVpEAqbe+luuKyp5OrVAh5d8itz
 e/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIb9lNHS+CMTRMz3x9CJbUe7BEB0EF5QrLaX3CcdAas=;
 b=VTMKfqTWQCpmMbYNPE9dUokLLM1E9ly5nGpOkRPnll+JHhKAITmFbc8Hxjkduy61Uj
 9X5RHACE9/Ixs6eGW2dvlLDRLhmcogYBasDJnQvHSf3GQQplHliTW2D8gbxD/THoCCL2
 9QNGBuDpDDhYrGcylJbdZPEKiSuJbzRI2tS65IJaO7DLYHjBA74LM6KkhfcIzesQ9Atd
 9jTbb58XdPJlrpocFicP7xE2AF7Zfh0V/WGdTXzBJCqMAhscEfOTB4tNtakah7WD1hT3
 lJkSbvxsQX0JwuvaBnqmVbWBTImAW9UZ62ouMB/fL5csEJWZoidgv2++973u8/dZEoI0
 OMKA==
X-Gm-Message-State: AO0yUKUuTMRxB/VmnPY+7h9db6q8FgAVjHMRorQ3jVqExClf4FrjC18Q
 9j8MgX0GwqGWBIMT97AUt1pEBhr0cK3GCVG40mY=
X-Received: by 2002:a17:903:24e:b0:19c:32b1:185d with SMTP id
 j14-20020a170903024e00b0019c32b1185dmr8567590plh.39.1677033220678; 
 Tue, 21 Feb 2023 18:33:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/25] target/arm: Handle m-profile in arm_is_secure
Date: Tue, 21 Feb 2023 16:33:12 -1000
Message-Id: <20230222023336.915045-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: 7BWjb7oVtGmT

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 12b1082537..7a2f804aeb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2426,6 +2426,9 @@ static inline bool arm_is_el3_or_mon(CPUARMState *env)
 /* Return true if the processor is in secure state */
 static inline bool arm_is_secure(CPUARMState *env)
 {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return env->v7m.secure;
+    }
     if (arm_is_el3_or_mon(env)) {
         return true;
     }
-- 
2.34.1

