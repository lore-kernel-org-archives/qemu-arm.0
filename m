Received: by 10.223.183.22 with SMTP id l22csp80843wre;
        Thu, 17 Aug 2017 16:01:22 -0700 (PDT)
X-Received: by 10.84.232.198 with SMTP id x6mr7650969plm.364.1503010882630;
        Thu, 17 Aug 2017 16:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503010882; cv=none;
        d=google.com; s=arc-20160816;
        b=EiXqDnNMfd5j54xoHYC4XoObBuHyVdU+G9KQoIQEAiH1/D4Lldd185Dv/Xr4FxYrKz
         X5MKzs3gb5hMrwPPIeCn0NJEnAQ5Gn0uLjCxOEVY8FEsc2UrK1vf5vy876eDef0o6Ty0
         26k2LPQ6J8LruQF9oB5UeRTrJbcNhotXpaYqdRR9VmoOgkwepzXdBIrN3xgpUZ1tX5Er
         m/fsDh3Bd8pDbsKAGIZIFqP2SsvSoF118aSqETx8hi+Rop2/1xiYDZZbNwpSLJRfzy2G
         OWfmyLThK7yImDDlgzHcHLKSRI7lw4gy3VZNygAPCdMyXLiovoJugJE/YRKvcJhHxlfA
         +4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=Ve0DM43w5YrFDYvyz9+DQQvsPDp9TqP3iha+QC7CvrE=;
        b=b0Ru984M8xmM/RpZI0z4tHcpD+71sLHBnOvPf2W0gR6XZUhSdNoe8jKv6u7ef9oOZC
         +ZZYRarsum3NtfQZ0f1Uuou47zMdR8S9fxV++uOL3wM7paLuWF0nSMnHdHf5Yj7b40Za
         TuuZNFB2bnUYJtA66xgbEgCMyTiENmYxCCus3Qrm8jpYrSLiaB6gjTGKP8J4BC8REKeE
         949GFDvl565ADwY2zcl8fjnKCs9QXG1Q/TOQ8/1Nrc+5vgNLRZozxFiyBxJRy89Ig7qC
         jTPEeuZD+ChpZSdC+XcXbqV82KVrM2hLyUA2wxcYhs2tKhUulO4w5kv0bbi/4RGwgpWo
         ETaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fL+HCOIa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22e as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22e.google.com (mail-pg0-x22e.google.com. [2607:f8b0:400e:c05::22e])
        by mx.google.com with ESMTPS id j3si2840010pld.53.2017.08.17.16.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22e as permitted sender) client-ip=2607:f8b0:400e:c05::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fL+HCOIa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22e as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22e.google.com with SMTP id t3so23903520pgt.0
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 16:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ve0DM43w5YrFDYvyz9+DQQvsPDp9TqP3iha+QC7CvrE=;
        b=fL+HCOIasLc1hBhR5VTNOSXl/yfHcdm8oT4BJkflQeu5Y3+ExC64p5Jsjtn6fwe+V/
         FdugLl11X4yiNj16xp7SsDElgXfxuHSFSipnr0S+WXsXthNFuRxUWGBfu/QvLZJWBUJg
         D6PKMj1NaPH+p7t7FPuauKAoQf4fVjD3+6laU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ve0DM43w5YrFDYvyz9+DQQvsPDp9TqP3iha+QC7CvrE=;
        b=c39+38VfE8e7bRAjKGATtGVPLZQLBHbuco4MPuNZtlLwKordEwyxQzsbY3Vb33t9eM
         1OSypKsFe5h3syxcKJ4y+OxVAF9d4E48iqmxW52VR7Ka8Y4L8Z7EtwCUYDsBSU3OBM4o
         KcU6kJviWhROOzwyoJ+Pcb887SBC55GjE1t8SkDOnC9qD05eShmSWOIFzUZeS8+PhzKN
         Ya71ZyxYDLWDLUceJWN0xVuYFkCRYaCdVzIt/44bqxL6TPUX8uhO6Za109lqxgtHz3SV
         7pbzVYuyMjhzQEC/bhYVXvD4zjt7T5CEUzWzQM//2o99vt08+cUA+NeZ/46o+7ld7r4O
         JXgw==
X-Gm-Message-State: AHYfb5ghg722uRxf85VqWtZTlOKc7Q0zdYFGvnUCR9lQqoifktEw0zWS
	VNMBewUPdy+edR4Vyio=
X-Received: by 10.98.193.68 with SMTP id i65mr6957117pfg.142.1503010882201;
        Thu, 17 Aug 2017 16:01:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id c23sm5190043pfc.136.2017.08.17.16.01.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Aug 2017 16:01:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 4/8] tcg: Add operations for host vectors
Date: Thu, 17 Aug 2017 16:01:10 -0700
Message-Id: <20170817230114.3655-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170817230114.3655-1-richard.henderson@linaro.org>
References: <20170817230114.3655-1-richard.henderson@linaro.org>
X-TUID: f0MvePuINYJK

Nothing uses or implements them yet.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-opc.h | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 tcg/tcg.h     | 24 ++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
index 956fb1e9f3..9162125fac 100644
--- a/tcg/tcg-opc.h
+++ b/tcg/tcg-opc.h
@@ -206,6 +206,95 @@ DEF(qemu_st_i64, 0, TLADDR_ARGS + DATA64_ARGS, 1,
 
 #undef TLADDR_ARGS
 #undef DATA64_ARGS
+
+/* Host integer vector operations.  */
+/* These opcodes are required whenever the base vector size is enabled.  */
+
+DEF(mov_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_v64))
+DEF(mov_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(mov_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_v256))
+
+DEF(movi_v64, 1, 0, 1, IMPL(TCG_TARGET_HAS_v64))
+DEF(movi_v128, 1, 0, 1, IMPL(TCG_TARGET_HAS_v128))
+DEF(movi_v256, 1, 0, 1, IMPL(TCG_TARGET_HAS_v256))
+
+DEF(ld_v64, 1, 1, 1, IMPL(TCG_TARGET_HAS_v64))
+DEF(ld_v128, 1, 1, 1, IMPL(TCG_TARGET_HAS_v128))
+DEF(ld_v256, 1, 1, 1, IMPL(TCG_TARGET_HAS_v256))
+
+DEF(st_v64, 0, 2, 1, IMPL(TCG_TARGET_HAS_v64))
+DEF(st_v128, 0, 2, 1, IMPL(TCG_TARGET_HAS_v128))
+DEF(st_v256, 0, 2, 1, IMPL(TCG_TARGET_HAS_v256))
+
+DEF(and_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+DEF(and_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(and_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+
+DEF(or_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+DEF(or_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(or_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+
+DEF(xor_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+DEF(xor_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(xor_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+
+DEF(add8_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+DEF(add16_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+DEF(add32_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+
+DEF(add8_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(add16_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(add32_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(add64_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+
+DEF(add8_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+DEF(add16_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+DEF(add32_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+DEF(add64_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+
+DEF(sub8_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+DEF(sub16_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+DEF(sub32_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
+
+DEF(sub8_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(sub16_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(sub32_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+DEF(sub64_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
+
+DEF(sub8_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+DEF(sub16_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+DEF(sub32_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+DEF(sub64_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
+
+/* These opcodes are optional.
+   All element counts must be supported if any are.  */
+
+DEF(not_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v64))
+DEF(not_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v128))
+DEF(not_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v256))
+
+DEF(andc_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v64))
+DEF(andc_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v128))
+DEF(andc_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v256))
+
+DEF(orc_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v64))
+DEF(orc_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v128))
+DEF(orc_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v256))
+
+DEF(neg8_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
+DEF(neg16_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
+DEF(neg32_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
+
+DEF(neg8_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
+DEF(neg16_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
+DEF(neg32_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
+DEF(neg64_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
+
+DEF(neg8_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
+DEF(neg16_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
+DEF(neg32_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
+DEF(neg64_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
+
 #undef IMPL
 #undef IMPL64
 #undef DEF
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 1277caed3d..b9e15da13b 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -166,6 +166,30 @@ typedef uint64_t TCGRegSet;
 #define TCG_TARGET_HAS_rem_i64          0
 #endif
 
+#ifndef TCG_TARGET_HAS_v64
+#define TCG_TARGET_HAS_v64              0
+#define TCG_TARGET_HAS_andc_v64         0
+#define TCG_TARGET_HAS_orc_v64          0
+#define TCG_TARGET_HAS_not_v64          0
+#define TCG_TARGET_HAS_neg_v64          0
+#endif
+
+#ifndef TCG_TARGET_HAS_v128
+#define TCG_TARGET_HAS_v128             0
+#define TCG_TARGET_HAS_andc_v128        0
+#define TCG_TARGET_HAS_orc_v128         0
+#define TCG_TARGET_HAS_not_v128         0
+#define TCG_TARGET_HAS_neg_v128         0
+#endif
+
+#ifndef TCG_TARGET_HAS_v256
+#define TCG_TARGET_HAS_v256             0
+#define TCG_TARGET_HAS_andc_v256        0
+#define TCG_TARGET_HAS_orc_v256         0
+#define TCG_TARGET_HAS_not_v256         0
+#define TCG_TARGET_HAS_neg_v256         0
+#endif
+
 /* For 32-bit targets, some sort of unsigned widening multiply is required.  */
 #if TCG_TARGET_REG_BITS == 32 \
     && !(defined(TCG_TARGET_HAS_mulu2_i32) \
-- 
2.13.5
