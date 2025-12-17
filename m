Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1A7D66BA6
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 21:22:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVyxN-00009Q-6F; Wed, 17 Dec 2025 16:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vVyxG-0008Ss-UN
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 16:21:07 -0500
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vVyxE-0004Z9-Es
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 16:21:06 -0500
Received: by mail-dl1-x1235.google.com with SMTP id
 a92af1059eb24-11b6bc976d6so1597878c88.0
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 13:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766006463; x=1766611263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6rMJ3udbgIpgAiy6d31R0Vx2kkWCqkcA13MTheL8sQ=;
 b=lnrjSTETKHTBsLS0MyHE5yt+7v0flwHb8IGz+AnCfNU6B+6QsTROZNyWjzxKErAQYF
 Zq/ZaKxyDGfxXfEGYIUWCoqfnhqt6rNFvF5cXChb4sfBUG+pfo5XvAll80xfXlLePBxs
 IaKuQdnpmQP6s+vn4k2QytsmQUsthDmJk8HcASVw2WmOheh+B+n1lqlyLopu1GOs9CYC
 FSVwZYBhEnpCP22mtHUNQybY9CB/5KGPS6vJGC37qfSibPV2u/8x+0dn5KRcnmvJGQx7
 s92xjRVEO1DtI7lGEAig+7bheqdXuSqs877tZDdETvWlpXaHHZHzARjFHcmDuUA8/qLJ
 fvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766006463; x=1766611263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P6rMJ3udbgIpgAiy6d31R0Vx2kkWCqkcA13MTheL8sQ=;
 b=goVBaoBvw/r8xE7FSy23hFo2cMzQC+1bxProF4wrrX2OtgjbEgDZ+8TCAXNLKlL1CL
 EvLDact8bIhuTIn3Q6ufeScs5yVnuYr8lV5y5nPKAe/ftKt28T+9tBgEgDi5dsqlm7Kp
 NOH4HZ6AIOgPmsTrIPHtn+p7fPjILZkJV23VwYemnQ2YZJR/wAII2atu8WrZQA05xPi+
 NSVG6SPQTqvCIxWOFbWqY7VhKBw7C9FOsNI7w3SlfV7pgZBzpasjwp/85TXLym40+pBE
 jpYIFzSbk8TjZGiei+hj++zqKGofm9SzpS7kOuDT5dPdrlAzoOFL4OWbPY0SRjgtEVxt
 nIdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVOMFn2vY+1INpFppTwC8bVLSDU0RF963A5eJKvgErbHSVMlrANaSMHViwZWw/3Iai374SzCWziQ==@nongnu.org
X-Gm-Message-State: AOJu0YzkN9m/e748rwfQap3DolRRUrG9K5n+Trm6zsltbk2cE7IW1GYQ
 4p2Kt6BZW6rfICgnPp1X2bGdKmBjOk8dhCanoAhnC7i9gdcDtlmTn1B5Z0LSoLA0LDM=
X-Gm-Gg: AY/fxX6AX+NxJiygc3VaixfiqOotHx0vyMASeN+YSq8vbUTYrIW5vtqqOvbwhONGbZW
 49JmibgCRiJvID1aMuWcw/qg0OkuY0eWT2CzALVgRLKbybUCRgeS7u5rO1i2lwJTDHk9et79/b1
 t6O8MWddkgF7vbOMIfPyIlFsAExjmKtloD8FL9SCbr+s6APY0iCLtKvRzw2JC8kTJSix0N/MluV
 QMllfitvmO7p9kVbBkblDj4NGBVHzyO293nfPH5LenFWvr3WvKZkBcbluUPsqA9WyAnTD2EOEaD
 gbHw5CapzShtn5cFEmdrO9HEn+DHVcAJy7EBwOyI/K03dfKViJtRD0DoOupK6Fo/vPfwG5QzBXH
 f5Rn9+Dg/ZBihH04z1yJYr2ROAoFfd1us6aCYsr8x0otHJYxR5fvpndG/N0dlrfOD5JzdGNnFBr
 5Hlz3FlEyQ9LT9yI8=
X-Google-Smtp-Source: AGHT+IFrBbbLfgFSt3ipKNQ1FyQche183dMsWRyOxuuFRtR7CcPIeqi++oKWDmhkqCsx96QI4AKtcQ==
X-Received: by 2002:a05:7022:ef13:b0:11f:3479:fb72 with SMTP id
 a92af1059eb24-12061938261mr763402c88.6.1766006462582; 
 Wed, 17 Dec 2025 13:21:02 -0800 (PST)
Received: from gromero0.. ([191.8.216.160]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061ef3383sm1852476c88.0.2025.12.17.13.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 13:21:02 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v2 3/6] target/i386: Add a _MAX sentinel to X86ASIdx enum
Date: Wed, 17 Dec 2025 18:20:15 -0300
Message-Id: <20251217212018.93320-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217212018.93320-1-gustavo.romero@linaro.org>
References: <20251217212018.93320-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1235;
 envelope-from=gustavo.romero@linaro.org; helo=mail-dl1-x1235.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add a sentinel to the X86ASIdx enum so it can be used when the total
number of address spaces is required.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/i386/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index cee1f692a1..783ad66d74 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2600,6 +2600,7 @@ void cpu_sync_avx_hflag(CPUX86State *env);
 typedef enum X86ASIdx {
     X86ASIdx_MEM = 0,
     X86ASIdx_SMM = 1,
+    X86ASIdx_MAX
 } X86ASIdx;
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


