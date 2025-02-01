Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1144000njb;
        Sat, 1 Feb 2025 08:45:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXo5uaS8hEHJZ7kmuwN4A+AGMpLVSUdDWUvxsWffpHHwb1oExy+1RLuh4TR0prL8MjOHkrKEdDNYeklw==@linaro.org
X-Google-Smtp-Source: AGHT+IEiXhijRcD+9dZ0e/ztN6PVW8GP+NZvKX5OfE+lru04hLGyJiPRP7oT8pyFF2UY/1K7PT6r
X-Received: by 2002:a05:620a:258e:b0:7b6:661a:c719 with SMTP id af79cd13be357-7bffcd0c178mr2643145285a.25.1738428318965;
        Sat, 01 Feb 2025 08:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428318; cv=none;
        d=google.com; s=arc-20240605;
        b=aewhD8XDPY3cWl8Y6/sVu2W9SgMXr00lzbmsQKp5OebdUD8Le3huSH/w8Ci3Fp0jIL
         rCCdwxoR6FbtovScrQF2OFyHR7J5xJFeDO7UADoCJwoFUts8yj/8HzQy6pWJwyxqm8aa
         UQRfikGA91UtjkjYF0kBOIimAY3WQcBwlZ9eN8tqxCmLtrZh25BHWRMHyY76xBldkgJN
         qnkrYvhifL7nQSCiwgox68lOlnDvferR6JXdpLCEYroFjYWVcEXVova1zIlBsxeOQSVQ
         u0mWojMQdJZ+lakKgvmzNjbhm0Zh06GhaRUcBw2dVzhk/cx6iRaBpJGiFa4dCs0KTqXy
         UciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BOcEJ4SdhzQ4YNSZVKN1C6haq4Tby0lVfAz7G5bWyzg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Tx57JGJCmF5KnrAbqu5Q8rL8DdD4hQ5FTYVPF154Z2iRN7cC0l9Dg5k0A4X2gb+Nc+
         B8HER2pP7R8UOGsLPCDGkpeAgQrotvbvwFnJtJQsw5Gdiy67li+VLFJKC8e3uEOfcU9u
         v4aaNFkjYYx0kYCVZZ0gkEnRgmf+t9Bo9XC54tG4QH4qvdMv24SKDY0gU/0+hVDzAol8
         SmTpDnCnOJsW/jkyknn4h6yM8G8TlTXBwYJBJXDSPkrr2jwZy4h99UK7+5tKRPOfrh4L
         UwNS+upZ3OTEwZmgnoeBPT4lU0U8xyH4M9eoUw8YyI8W1xtNbL99QzvDIA63VRozoYoi
         vkHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jqQ8Pht0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a903a09si607535285a.320.2025.02.01.08.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:45:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jqQ8Pht0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYC-0006Jo-2a; Sat, 01 Feb 2025 11:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY2-0006Ao-Iw
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:46 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY1-00018S-3O
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:46 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso1711178f8f.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428043; x=1739032843; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BOcEJ4SdhzQ4YNSZVKN1C6haq4Tby0lVfAz7G5bWyzg=;
 b=jqQ8Pht0k4qxV+kXCoyOor0/AQL1y8rUonc33cJFfSyIfb+eKpC9+zmcBL2gbtzPY2
 V2AgHz6Vx7W/pJNZD7KYQsTB2YGsofndv9uZylo/RkJ+Hip+/fTb13x6StCwgZ/94f23
 09z7AAtGcRTvep7drujWIk/NJoxvI0Wh6O6Dz6hGH/NT3fFjacXMfTlnOdSOYemxXxaP
 9Om4iK8Ng4T94higIMqczASInG0fkYd/2Ueh7F5u8HoGvxVacHz7bNG30s8ojwkvlLHS
 hsWzLqDzZu9Iu0o70L+ssd+W/Aufy8I4C6Q0cMHvAJVv082IikhgHFwL5hW83OU1Y5ll
 ddBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428043; x=1739032843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOcEJ4SdhzQ4YNSZVKN1C6haq4Tby0lVfAz7G5bWyzg=;
 b=U6WeWU7GbhoyKDcgdU4bA5noy71ahWSjlQpKuPO/X+8CqbdJ9n/dwmrVvGtGDh5jno
 0xCIxr27M+QoPH9syjxUZala3rRZzIiIiBGeOdsAluRquVgkmpOtCNST5tPfGSBZLYcb
 fHAuWPOqOBqKBFA4/7FX5w21N6E+RnBpvMvLC+Rxqgb6j16oxe2Athbtv7ewhtmkiby3
 odadv9lytZDyvzq7cb3aOfOHN8DofnWASS569HftRy+CXqbR4HxZdVmIxNZWG3Ncz7ep
 7wwLF8oNBRNKEIus4WLh+BMVFGFvuWeR0G6jxhSUT5Of3v8M/BU8QxjvRaBl2wl0wtWS
 Yx9Q==
X-Gm-Message-State: AOJu0YwkTEHHdDCU1dbPCxp7PRH8nSPfqpjj8fcYqWBeIWYw6EdVHtJu
 VWn3bZH9gVw2LaOyg5cQA+oWjv0M6xY0EBYmkN1XGjmZtHpe4sENCam5PdAVntd35tyyJVosiAU
 M
X-Gm-Gg: ASbGnctEiDbc1tfmJ+VMRJ7lpRsNK1zgRigtgF0c93+//xZE2WLcfu/YTLppb7XzjxY
 dYGROfUJSWjJiT8vdR6yFkE7xfmxhEXRb3FoHuMmCr9oJ+jUHVSGBlZFL/OKqIDjp3EvAjlMsG4
 rFMbvbJDuHkb9RaaUeAd/sB5CkXhOGIneeQxRntwJSAIaMl3PXbiuyEAlAViGemblsprgucvjtt
 671L5cKRHJ1W7Ue38h91hh/ttpsGO1DlgglZt0NdqPF6RvjqLOByEG8QuOtdaaeRU0tkrdQSu2U
 yaBSv762wvI2TJgukNd9
X-Received: by 2002:a5d:4d47:0:b0:38b:f44b:8663 with SMTP id
 ffacd0b85a97d-38c520bb322mr10226318f8f.55.1738428043226; 
 Sat, 01 Feb 2025 08:40:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/69] target/arm: Handle FPCR.NEP in do_cvtf_scalar()
Date: Sat,  1 Feb 2025 16:39:23 +0000
Message-Id: <20250201164012.1660228-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: aJxiF7dtVOTI

Handle FPCR.NEP in the operations handled by do_cvtf_scalar().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 21e68878c48..f31ac3b9549 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8744,7 +8744,7 @@ static bool do_cvtf_scalar(DisasContext *s, MemOp esz, int rd, int shift,
         } else {
             gen_helper_vfp_uqtod(tcg_double, tcg_int, tcg_shift, tcg_fpstatus);
         }
-        write_fp_dreg(s, rd, tcg_double);
+        write_fp_dreg_merging(s, rd, rd, tcg_double);
         break;
 
     case MO_32:
@@ -8754,7 +8754,7 @@ static bool do_cvtf_scalar(DisasContext *s, MemOp esz, int rd, int shift,
         } else {
             gen_helper_vfp_uqtos(tcg_single, tcg_int, tcg_shift, tcg_fpstatus);
         }
-        write_fp_sreg(s, rd, tcg_single);
+        write_fp_sreg_merging(s, rd, rd, tcg_single);
         break;
 
     case MO_16:
@@ -8764,7 +8764,7 @@ static bool do_cvtf_scalar(DisasContext *s, MemOp esz, int rd, int shift,
         } else {
             gen_helper_vfp_uqtoh(tcg_single, tcg_int, tcg_shift, tcg_fpstatus);
         }
-        write_fp_sreg(s, rd, tcg_single);
+        write_fp_hreg_merging(s, rd, rd, tcg_single);
         break;
 
     default:
-- 
2.34.1

