Received: by 2002:a17:906:7e1a:b0:9d0:bf65:29fa with SMTP id e26csp73785ejr;
        Mon, 30 Oct 2023 12:04:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHykUFsAxpQO8lx2outV4Du9UfJEPiwGY4zOUbwLfSpiWlcb9+CUwyAy+iZlmb/Ewr2LGwv
X-Received: by 2002:a05:620a:3188:b0:778:1c6e:a6f1 with SMTP id bi8-20020a05620a318800b007781c6ea6f1mr13607329qkb.57.1698692662357;
        Mon, 30 Oct 2023 12:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698692662; cv=none;
        d=google.com; s=arc-20160816;
        b=A6gYgzTm3pKJ4BQ4+YHHqcSC89pApO+slmRpUhRiLDzt8n0qtymqC3DpaibLmVD8No
         D4TaMaHgoohsEHEbcgDdXbQJ51fr2ULK16K5xUcTQidurX0aGBfpSjGP5UhSruGO/hbY
         3h2nNbP1TSTULOiSUlV+P1WH/8YKOSul3BgAxoE1KycYoLP8qJ14vZ99KpVjNhwlbaVC
         Wu0vEIv/iFtQL6cXHX6EUxNlb183FZwFUjwMXwt2GHzjtm6Jxn7VaDkri//5hY0DA9hQ
         NmBHWEVAiZrGqIapeiKfYgzouLj5q+cqLfdc9LiOpVagpB/ITScocnBtCeR59MZxJZoS
         K5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zYXGyY3c6l0fZmqh6nppMUC0FBeMhdGwui5xW/qk4O8=;
        fh=quVKJN+JogokNzsp4kwoA7mheGRSBID5PxcC4hooSO8=;
        b=OZIIRo2hjXK6l/8uCsB/4UHzWvvJG3TDkl5Ey1y+AR3plkefiJxyfnEAjrA3QO43jH
         PwXHHgKAu2N4m4JdOjX92P9HibstGtL+KdZx2rUSz0d6NrpBMKGcUqYhLkvFQXH3Ub0D
         fwlbhGmB6YaLau11Tpq8+0QKsWH+0N2N924d/YxLmvAkhDyVjL01itcud48b0cEQneoX
         hUB0WfKRdmHT/D97oCdGk4ETVghLB1SlRRh5gctXfZJ3H+lYHMkb/1zNqJfoubdVSgRI
         yDTAowg2zyfndqfPkpgMcUQgpayCzpz8IBItuzuVCxSXdRIw4twVN5Vme+OmJLumAG9d
         LSlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UPdAQ+m2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020a05620a40d100b0076db04411e7si6566281qko.419.2023.10.30.12.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 12:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UPdAQ+m2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxXYT-0004M1-NZ; Mon, 30 Oct 2023 15:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxXYQ-0004L8-H7
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 15:04:02 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxXYL-0007b2-Jl
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 15:04:02 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6bd32d1a040so4852339b3a.3
 for <qemu-devel@nongnu.org>; Mon, 30 Oct 2023 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698692636; x=1699297436; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zYXGyY3c6l0fZmqh6nppMUC0FBeMhdGwui5xW/qk4O8=;
 b=UPdAQ+m2wfjVoEeZYAwx9K0GZNmKIJeKK83NfYg6D4QP+4g/Ane+uvkFEwMGRSw6Lr
 ebzQuHyv5+LUbA0Lq2nJA4VGCxd3spFovJHfaEblcxFNUrsoN8qJZB2CDwuQLgXRWoAg
 8kztnFNdXQNwm6Fh2Uu01ihATvxmPFEiqr2FofdvqXwJtOWAd5qvhKH+xiWGMTQEowKE
 Q6vPc0JDHPYBksMtAocMilqvr1mWYeiQeLa+3CrIEW7dqlH/sGRD1OyUmWxJjbzKNd4K
 Xy2KYrIyDahOBO7y1Wj51V0ql62UN7UaEnOY39335s+wziXBEyJCV9m86HzCg+LOQkWF
 ILNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698692636; x=1699297436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zYXGyY3c6l0fZmqh6nppMUC0FBeMhdGwui5xW/qk4O8=;
 b=hJrrbv29b0njYTEaTilZXPIizHEClbUNcqwLaiOHYK0rDScc/yWCv1QmUvlforoSoo
 CobRXKiWsTeyEImTsDzr6hwo8q/DVAh1wUHN/EsOAIxWu7R3rmHYnPPEJ4gRJgrrJQga
 xX2x3knl+qO0JcKSGUpgFhhK2HInxtqVkrj41LkG4r9u4qGvaJeLJ3zf8ElPJR0amAPz
 gLlfu+ijfR6eILMRWQyz99hqfY2NyNuIGBy3K+lzIOP4aKhpJrkszE/ch4AGJafb2IG/
 2A/D8ZTmCsftC0ya8Wo5u9lKWL6oVWzFbUvhg1DlcBccgiOJ6/ADnzkF1vQAS8RXi7vv
 ZOGg==
X-Gm-Message-State: AOJu0YyRKuZ99qt1T1KbH1pMkg4tH0+GzQTLF2PoUmpxaLP2RlvTKi2G
 XUXJu1YboOO8T7clQRITt+yC1F9kD8S527F3iHk=
X-Received: by 2002:a05:6a21:998a:b0:15e:ab6:6e24 with SMTP id
 ve10-20020a056a21998a00b0015e0ab66e24mr14728980pzb.27.1698692635896; 
 Mon, 30 Oct 2023 12:03:55 -0700 (PDT)
Received: from stoup.. ([71.212.149.95]) by smtp.gmail.com with ESMTPSA id
 du15-20020a056a002b4f00b00690c7552098sm6211477pfb.44.2023.10.30.12.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 12:03:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix SVE STR increment
Date: Mon, 30 Oct 2023 12:03:54 -0700
Message-Id: <20231030190354.94671-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MICg9+0U0nDj

The previous change missed updating one of the increments.

Cc: qemu-stable@nongnu.org
Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sve_{ld, st}r")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 7b39962f20..fc4220114d 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4294,7 +4294,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         t0 = tcg_temp_new_i64();
         t1 = tcg_temp_new_i64();
         t16 = tcg_temp_new_i128();
-        for (i = 0; i < len_align; i += 8) {
+        for (i = 0; i < len_align; i += 16) {
             tcg_gen_ld_i64(t0, base, vofs + i);
             tcg_gen_ld_i64(t1, base, vofs + i + 8);
             tcg_gen_concat_i64_i128(t16, t0, t1);
-- 
2.34.1

