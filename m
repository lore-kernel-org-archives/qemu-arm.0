Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B474FCD6E4C
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:15:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrP-0000Es-J4; Sat, 30 May 2026 19:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrO-0000CQ-3E
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:54 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrM-0007Xr-H5
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:53 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-36b95eb4bb4so1281710a91.3
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182771; x=1780787571; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwM2p9I/SON4IwZR4K/Mk/coaIyxRCDMbGetn6Pf8BM=;
 b=tQZRNLjMr3ZrEL+lXq0pimLEGUpUfCLQX+XPsfUR6+qwS99PM3U03K1I5KjXPNtI1h
 bdjW6Zn87Znu+/U8QkarCk0gRf2l7y8CoXBK0ST4ipCP6o0qQ1lQnl8NtY9Rky1PLo0m
 zFNzZwnbqaEf+8uCn5qlqYc5B1//WRQr1wn9sS4OwjWPamKV/Ew0Sgtz0GDwmnQ7ihGw
 kZZArnBXPpVnNW0MCyV37NybN7vwCWEI/69ZofMHTmTkITK5K+0EIRqqn+UJ7QldmCwm
 kskPdC1xrHK2uIsC4eKMNi7YSjrL2mysu/iVd73ZNrsHWPFzBmdJIvBWpqxAThOFruvc
 Wq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182771; x=1780787571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LwM2p9I/SON4IwZR4K/Mk/coaIyxRCDMbGetn6Pf8BM=;
 b=aivV2JeEnqJT5x/NuVi8u6MV+VJyeMxxgIYiCMdMSe9XTn2hvUe7q/65bAYMdPkWcl
 fMS77v+cAzq6DXz9q/6E546fKn3H020oWLCwJgCM0NUr7Tmrih8sCuD4iI35njRl4hnO
 iaaYrWRBdlVETlsnqxxzEmfWGDknx7w09d27bGjnWrOkRk+DWkyK1MKk3ZmTdTOgnLHc
 F3WxRHlkGJNhE4ThqFhePqXSav+LMPxuJefkck6LOpyBBd0/E+wRwMGLktNzLQjRrjEU
 hCT1fWJ6U1dQ2PRVAa9/jPvzGoPZ27BcRoAHIwRPkPrgzK3j4J2wo1bqy9knDHPA+bS9
 WL8Q==
X-Gm-Message-State: AOJu0Ywc68giEa2u9UGu9vz26suLm+D2nyKLu7WsIM2imGrnPD6Mi4nf
 OKammIUKh+R8J+KldWi34yn1Ei25/Lrb9N6NSiCmG2sz7EXSoQbi1HTi/k56bg+PlQ0=
X-Gm-Gg: Acq92OEOBHqLVsa0+hz29ImMoHjNzkuWGjnCk/Ns1eDDfbztxnpCE3QxycPZvfU6BMm
 OOt8C2jyK9X5Whroy73aBYDhYFrSDrBDtYKbbV8zlR3jU75qxW0YEAnSUEYvRhNWVMF3xZsQZM/
 5ugsrc6u08tjeJzuaoKAeHJwrZ85JCafJkPKzlEAFsPRH9nhJOErTne4E0ubhsGuGrjHhhGXfRj
 ceo0HngzS0pIEr0RRcoHFDWN9VOL0iOb2AfLlX/6v+gpHXgn3anzmHUMWIdokZBwYhu+v3c+A6G
 ZrLGc4W0i0qV1Y+BOP2XaBhy1/uuogHOKpJ937XTbHG0IOuiK/ddK2DsSiK3keL/0rZEg2VSNz1
 bNkqkrXOqDKoFWcOp18Md8v8Qxr/guFmQVFQ/ND76XFU5LiPueirVU8BCykxiFrv9mOPm6lFNDd
 o/RVEN856ucDywH5/eGD1H/SUIhSQ7W3TuI0sdjyQ=
X-Received: by 2002:a05:6a20:ce44:b0:39b:fbb2:5e46 with SMTP id
 adf61e73a8af0-3b427fbf046mr4966398637.40.1780182771142; 
 Sat, 30 May 2026 16:12:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 19/41] target/arm: Enable FEAT_LUT for -cpu max
Date: Sat, 30 May 2026 16:12:07 -0700
Message-ID: <20260530231229.400441-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 228b593316..5ed7a7badb 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -221,6 +221,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_lse128, ARM_HWCAP2_A64_LSE128);
     GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
     GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
+    GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 1a4f50486d..39dc769a04 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1263,6 +1263,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 2);     /* FEAT_CSSC, FEAT_CMPBR */
+    t = FIELD_DP64(t, ID_AA64ISAR2, LUT, 1);      /* FEAT_LUT */
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 18c6355967..dc20632097 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -102,6 +102,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
+- FEAT_LUT (Lookup table instructions with 2-bit and 4-bit indices)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MEC (Memory Encryption Contexts)
 
-- 
2.43.0


