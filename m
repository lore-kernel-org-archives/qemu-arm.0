Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp651319ejb;
        Fri, 17 Nov 2023 11:32:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqmUNdO+PJJbJuXkN+GevcAC1UI1PGa32V/6wTy9jjzJjqrpel+XILuxIUKCeJTHZBv9Uv
X-Received: by 2002:a67:e2c7:0:b0:45e:f983:7072 with SMTP id i7-20020a67e2c7000000b0045ef9837072mr335325vsm.31.1700249529388;
        Fri, 17 Nov 2023 11:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700249529; cv=none;
        d=google.com; s=arc-20160816;
        b=IJwY3w72ZkAustiU+EvJIKNqYRdn0f2yU499RpCDE6S79Etz8PSbQjgJNpE2wBB7C7
         Vt45u7SaBUMvRqx2s1gb4IJtYv53eyEkeum1gsUJ2ssTac38pUFIC4oB4naSDPaZ2CBE
         8xcsKeLti4899VGPtYsGzMSpb3AP5kWbt86A3NGFKfN10XZQG0GAzVnCLZYNZLpV4yJk
         2su/V4yXNZhhFKJIarhnl7fcnw/n0BuaSKU3w5z7PrO00gkXuNONGLCjOt3No7nYi8jM
         LtCqEyEiRIdEH+GiFWNtimYkRfb39VZdXANqgFebudNjzZ343NfcMTfkdSqs87f/0frL
         WW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RLNNd4SWSgpRfjedhc5CjQOr3QqelXpuW4mfn1Gp0TE=;
        fh=quVKJN+JogokNzsp4kwoA7mheGRSBID5PxcC4hooSO8=;
        b=gPbG4eDGLeNFDdk0UXxtwDPaVKEcCBWQbk/XO4/Aka5fSkULM2S0yAxakwS5KGD98g
         2IQ9gsqkkd4KdVqPdOUJAuPkXSUKPkYk4M/crZwuWlg1EGstt6AL9oiv2VdBDbLL/Jhk
         p3DVLEyoDJ1bd64V2vwzefjSdvk7Rxwab9bgJs3s/aANcGIUw4PHliwB3UGksLwuPWsm
         Q/wDxdAqCd98g924gQgUagw2Qx0v8QcmNXMB5OfXLx3qwLXD2JPIAfp2vEAr7MJB8VAD
         cs7X898na1nkQBGSgrFe5adWQ9HpYclwKvAx4O6kTPhSzlgXS8cg4XFR0UaAxAvf72Vq
         RHlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wG/eda6F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a67b006000000b0045fc59dce48si696771vse.326.2023.11.17.11.32.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Nov 2023 11:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wG/eda6F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r44Z7-0000RG-SG; Fri, 17 Nov 2023 14:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r44Z4-0000Qd-CF
 for qemu-arm@nongnu.org; Fri, 17 Nov 2023 14:31:42 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r44Z2-0001rW-L1
 for qemu-arm@nongnu.org; Fri, 17 Nov 2023 14:31:42 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6bb4abb8100so2195322b3a.2
 for <qemu-arm@nongnu.org>; Fri, 17 Nov 2023 11:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700249497; x=1700854297; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RLNNd4SWSgpRfjedhc5CjQOr3QqelXpuW4mfn1Gp0TE=;
 b=wG/eda6FYOT2HoJmSEL1DEBQb581KgEO2wJIn2A2M6NVj2qgCVAFW7axM2LU93ap10
 CCpN1Rd9mFkFaIM5MzS1ltbm9uJ++USn5vNMP4cowmh1LJnE4IGWRgxNLL6A4y2oYxtX
 NAq8mOukN/gS+GVN75kC7EUc3T5prRbdiJkhobWmMNnIgEjWctQ5fMBZ7EMbtqIr0faB
 9njnq6dwaWe2RdqA/z5L6cUU+L5y9gpzzqCG/QLWowupgSFQs9JPOievAync5lY9SawH
 A8GR+V9s+Os6TbYYX8f8HOxfB8bQ6OyhXk5d9NKuCtsRjwhRs3U1lyS8mnnnJGUGanhT
 pKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700249497; x=1700854297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RLNNd4SWSgpRfjedhc5CjQOr3QqelXpuW4mfn1Gp0TE=;
 b=dfPUybz4tHxxzZkBpdnkQj3P+IVgwYdhdzRK9Ck0wl58HdiAZZu1mDKpBp7kO5d7H7
 276o4Uq6WBsJkAErqG6VxRqm3hpsf3XUxRBm+FFvwMzgqMIfnTs83ja1u/z7rPtY4SEe
 HIxzDS11Qc5xj35zyTAkDeUM0au0TjBKF/ycOlK+mPIT+depK3HS0+2int/5jdPtfgI6
 J8lIlpGRfHcEosG8sQH1ydPb+t3H7oNCGjucoslKPsiOZR74ydk0/XXxd/poSWpAkVnz
 LwMZnM2e1p1u3fO45mWZmkGtHMGMItg+ZjL6cVjPM09nvI4HqyWlHe8xopAq4AgfgXw+
 0OTw==
X-Gm-Message-State: AOJu0YxUUQQI37h81wUw+TmlIfsw+vOn29R3MJJ5EuQl2+iML0cI2A6G
 PI6ksWbF8w5DhU0tFQcKj+jEaZXAhc2HRuu7uCk=
X-Received: by 2002:a05:6a00:438b:b0:6bc:ce7a:6f39 with SMTP id
 bt11-20020a056a00438b00b006bcce7a6f39mr540402pfb.32.1700249497577; 
 Fri, 17 Nov 2023 11:31:37 -0800 (PST)
Received: from stoup.. ([71.212.149.95]) by smtp.gmail.com with ESMTPSA id
 v26-20020aa7851a000000b006be0bd6a4d8sm1757086pfn.36.2023.11.17.11.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 11:31:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH for-8.2] target/arm: Fix SME FMOPA (16-bit), BFMOPA
Date: Fri, 17 Nov 2023 11:31:35 -0800
Message-Id: <20231117193135.1180657-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: JC7lJcmbvGL+

Perform the loop increment unconditionally, not nested
within the predication.

Cc: qemu-stable@nongnu.org
Fixes: 3916841ac75 ("target/arm: Implement FMOPA, FMOPS (widening)")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1985
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 296826ffe6..1ee2690ceb 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1037,10 +1037,9 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
 
                         m = f16mop_adj_pair(m, pcol, 0);
                         *a = f16_dotadd(*a, n, m, &fpst_std, &fpst_odd);
-
-                        col += 4;
-                        pcol >>= 4;
                     }
+                    col += 4;
+                    pcol >>= 4;
                 } while (col & 15);
             }
             row += 4;
@@ -1073,10 +1072,9 @@ void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
 
                         m = f16mop_adj_pair(m, pcol, 0);
                         *a = bfdotadd(*a, n, m);
-
-                        col += 4;
-                        pcol >>= 4;
                     }
+                    col += 4;
+                    pcol >>= 4;
                 } while (col & 15);
             }
             row += 4;
-- 
2.34.1

