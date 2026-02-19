Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE13E9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:38:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt577-0008Tg-Ms; Thu, 19 Feb 2026 09:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt576-0008SI-2p
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:44 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt574-0002v6-IM
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4359a316d89so962552f8f.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771511681; x=1772116481; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXP99FUoDu1z98GAyOTe9kejbBFJAL0eQ2bvmghE1tE=;
 b=b8vOlckaAx2scQQ+5J/PIWqdFQBimc6IUPjpw+Yzn8ewJK719EzCZTpwPAbWBnV2WK
 A/vATmNX9gl2ifqtJrKGPOi3SGxbNsJK6NFZDaZ6rNhwi1VShz+OZfvUJHeRxE7+oCSf
 YIrgj9SFyRES6+Tegd8phuZjM7XD+RFZ/c6qpxdi21iuFJDxKZHX/EOWWiFKubkAWh3e
 qRL9c9i6Pg6F5YPJ6iaHYUeH52N71+J+ZhfUuQUWA2WDNiXXrgos1zOB93Dk2/6usnLX
 JzX4AU5oEtCPxZY1F5I78LMFkghnHd9C9+/jnPRELzFOa2WfYSTe33qwMaWH4byTPHN/
 mr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771511681; x=1772116481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sXP99FUoDu1z98GAyOTe9kejbBFJAL0eQ2bvmghE1tE=;
 b=KP1PUEMuOR2ESoYoc4uupcCsAzr4coTXZLdmleofI/p6T3ys7nnDR5jlU+KtyfQpVv
 gxS4dp/rYp7/I6bopzdM5w0RkkJF3Vp/fJ8q5dBSvUkmAroF7yyiMqi7vbCJDp35ujgh
 CeaDIne8JxOCuXKRXcmDgSr23T/bUTtgkUzNEOG0rObgqu512sluJn6IVkgowmlK11+p
 KSbZ6DUgfUepLU5AtZVl21t7d9uN3X5QYE1owW+9HTvOHwKciIAe+TlZRiiKCPxb9+Ua
 RomudSSdt3G42tUOjCiogvr64uWKqkIwI4ogbWF+ik88humGeZkeUDSE23c2Kp5BW8F/
 /IFw==
X-Gm-Message-State: AOJu0Yyhsu5ZNvySiMBKjMwPd2rNMDGhe/FW09qRMqSSllsA+Qk9g4b/
 KClsK46+4PicAB0d3Asw3cTpGvpWjzrmOxunxCydiqJnztsWmjxzILT/CjZQ31z1
X-Gm-Gg: AZuq6aKoIhTGZrby7xn/GchP0EaEfGQECnrAxEo93YNWOpc1uwxYs08gErGkwD4HlRK
 /5Tac/OHHXumiuRmcbPoIbKEN1GGIP2esqt3YcGj4d4RUoM0pmUPNhegL/0sS/sfSgpgVJqpmom
 1FeAuUSyayurKuKLEjE6K6b59a/SJZeJkTprgcww15CCI3+/qRHK26Dm6LkgO52IshKxixUuzGB
 LhXOH9y1xdWG+jmcb6rgViu0xx7yk0uWimANHTMidQCekCgmI0K8q0BMn1hn3wXm5qclM7ZwGrg
 T0+LeHUNmafqymobjIZ1p2CeD01Oc9Q1UllSNgsfli+QzQLl0bpCl5qmmwMS5pACPBgdJJbEByy
 /HjdJwxtBbeGuvZ9FSNFLvlgryUxei3QG5Q7Z0lO5t0JBqkZqYERjP2HdtCWgrDxoZucZnAK9PE
 4uQk8u1vGvkiGh+2MKY/FtkGkuGLpRInJRn58tCtBYIQrfQpX2Q+QB1lW+r6UXG74+cCcy
X-Received: by 2002:a05:6000:220c:b0:435:9f41:d43 with SMTP id
 ffacd0b85a97d-43958e00820mr10403338f8f.15.1771511680830; 
 Thu, 19 Feb 2026 06:34:40 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52022770f8f.24.2026.02.19.06.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:34:40 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 03/33] util/log: add log entry for fdt generic utils
Date: Thu, 19 Feb 2026 15:33:02 +0100
Message-ID: <20260219143332.3316679-4-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Introduce dedicated log mask for hardware device
tree processing, to selectively enable diagnostic
for FDT-based machine creation.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/qemu/log.h | 1 +
 util/log.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 7effba4da4..984879fbd3 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -38,6 +38,7 @@ bool qemu_log_separate(void);
 #define CPU_LOG_TB_VPU     (1u << 21)
 #define LOG_TB_OP_PLUGIN   (1u << 22)
 #define LOG_INVALID_MEM    (1u << 23)
+#define LOG_FDT            (1u << 24)
 
 /* Lock/unlock output. */
 
diff --git a/util/log.c b/util/log.c
index c44d66b5ce..c8310ddc58 100644
--- a/util/log.c
+++ b/util/log.c
@@ -523,6 +523,7 @@ const QEMULogItem qemu_log_items[] = {
       "include VPU registers in the 'cpu' logging" },
     { LOG_INVALID_MEM, "invalid_mem",
       "log invalid memory accesses" },
+    { LOG_FDT, "fdt", "log Device Tree info." },
     { 0, NULL, NULL },
 };
 
-- 
2.43.0


