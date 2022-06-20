Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp608184lft;
        Mon, 20 Jun 2022 11:13:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUcaJUkWDklcEeQREz0xycwO+0zn0tdkKTzuVI4gTkOvOBTtHp3GdneO/XyAkKwneSMu5S
X-Received: by 2002:ac8:5846:0:b0:305:ad0:d159 with SMTP id h6-20020ac85846000000b003050ad0d159mr20784428qth.660.1655748806053;
        Mon, 20 Jun 2022 11:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748806; cv=none;
        d=google.com; s=arc-20160816;
        b=HAnBwdLyHSwhxSJVCHfTLae1VquhP8HS1ZhiKV1CWo0qk+yeYqt1CmaV5Iov6lgukG
         yCmygEEmsqMlnMQ4fzVtBqbI8VShbw7wGcesJ3N75KbFI3K2xcvEd4yhukcdxC+Rqv/Q
         f1gFethTAnHiitUpHG4WjKoXSiXFouO8Oj2wUy2mYKgRc8qV3YzRgFxFyYxY4SwU42eX
         PXPd3QSU/6XAUGWw5hAf1DGhb5qkFyYzQiEGOCf1pwKyQe0r5KTuFSucla/L71OweBEn
         jCfC5LeHEPt3g2abUU//Od+Cf7K/j8Qfxc6M7fkR+4YY3wHagvNV71gQlfMlhG8ryu8Z
         W5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3jV4eMvZ5tR9zR5zBQl58k9EeOLzO/sf7T9FU5G3WSw=;
        b=hZTJLZaoLS9bbmPGbnAaf3/HBklLR8JtQ97f/V+3dMSOSvdjuEVBHUfCwgdaaFD7LQ
         9jWkh/ho3EJUC+wXWrG+LasqMtiYazg3N2/ikEU3T8z79BJGpYoxRBJX/baIZKskDBfK
         L4dyFzbekR/Smnv+s+FtUhUR9drk62Y/+MnH2qLCAYQki3FUF0kwE0AtwxPbIXc0kmpp
         aY3svZyM/8qxiPkIFZNRkWB7liAssd5haMBN5TEzKO8mjv0QC5LCBo3PLy8vU7kiM4Rg
         4/vCb+eW1l4rjigJGQCxYNTB+8jGwPPzGu/VaRbjKF3m7mOhlh+NddHk7pqQOQqANABB
         HEPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CgCSz0hn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d194-20020ae9efcb000000b006a719e2630esi7578288qkg.255.2022.06.20.11.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CgCSz0hn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Ltt-0002WF-Gq
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaD-0006Ll-GV
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:06 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La9-0001W2-7l
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:05 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso10973937pjh.4
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jV4eMvZ5tR9zR5zBQl58k9EeOLzO/sf7T9FU5G3WSw=;
 b=CgCSz0hn4+o18xiDvmoOe0Jxj4rdn641H6MJLCZBL2HrJuqWCDh8tysuCwTChMx2q4
 8xwopDwaXWC+9yfqbpdiy8AF1XZglG9aOc+jJLA9GO0N4b4nZl0QEvULFwtDrln3RLjP
 ovrb+duZTDu/JNaFOkKar1m1lMO6PHr6WCC3hYj3YATcFNkciIEcyCUymCq4JCVmtMn9
 +sTB/8odKvN5PflFJYlBm9ZVY7tMrjVjC56/m4kUR+7soeGUNOxeYjZXq5rblw2WssXZ
 FG8PxaaiQnqXIw5Egik6jaGRRD9EgESPZHwmVSLrRdfsuW0lJM8iYDjKIbxkWBtvsTZA
 0j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jV4eMvZ5tR9zR5zBQl58k9EeOLzO/sf7T9FU5G3WSw=;
 b=vLJyPxmkn6gD5SWjCsZg+3JRkuUv32HEaxqVaxOtaNW5GeplARJ2OUZHUvZvGylw4r
 4Ekn502E4b+HH6/1fHSwopT3vw3Wsc9GazylOZb9+Lf5bRYIg3rY5IWz1vEFlGZ5i5H5
 Vh4cgW0/QHfMjUGNzH8d6mlvH25JQscSVXpH1nKeVYoAqtJxkncHwsSdVXvPLAgRFL4n
 YqdKcIUiqICPnDZJZln2Tl6bmjDL3ThyrhgYoZ1PLfPatQ5uR7gbhQPmTZj+T3nKzwy6
 ZBDusPOv1lEBHoHUFy6zT27xFOZX9Li9yMJgmStoKDhp/KjAYCEjgoFUbwQ2z51MTekN
 AUJg==
X-Gm-Message-State: AJIora8+ifX/NDwwcLgnric4JwsXhF2/RtzXDVPd3mKw6XoINV3Qv6RM
 26epRokl4FNE+n65LlfFDtjOk+kcL0htdw==
X-Received: by 2002:a17:90a:fd13:b0:1ec:7a40:3b5 with SMTP id
 cv19-20020a17090afd1300b001ec7a4003b5mr19675853pjb.8.1655747579287; 
 Mon, 20 Jun 2022 10:52:59 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 26/51] target/arm: Implement SME LD1, ST1
Date: Mon, 20 Jun 2022 10:52:10 -0700
Message-Id: <20220620175235.60881-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vdwmQhsJHUZ0

We cannot reuse the SVE functions for LD[1-4] and ST[1-4],
because those functions accept only a Zreg register number.
For SME, we want to pass a pointer into ZA storage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  82 +++++
 target/arm/sme.decode      |   9 +
 target/arm/sme_helper.c    | 615 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  69 +++++
 4 files changed, 775 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 600346e08c..5cca01f372 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -32,3 +32,85 @@ DEF_HELPER_FLAGS_4(sme_mova_avz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_mova_zav_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_mova_avz_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_mova_zav_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1b_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1b_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1b_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1b_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1h_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1s_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1d_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1q_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1b_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1b_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1b_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1b_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1h_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1s_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1d_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1q_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 241b4895b7..900e3f2a07 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -37,3 +37,12 @@ MOVA            11000000 esz:2 00001 0 v:1 .. pg:3 0 za_imm:4 zr:5  \
                 &mova to_vec=1 rs=%mova_rs
 MOVA            11000000 11    00001 1 v:1 .. pg:3 0 za_imm:4 zr:5  \
                 &mova to_vec=1 rs=%mova_rs esz=4
+
+### SME Memory
+
+&ldst           esz rs pg rn rm za_imm v:bool st:bool
+
+LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
+                &ldst rs=%mova_rs
+LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
+                &ldst esz=4 rs=%mova_rs
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 99524ead4d..0c51fbbd49 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -19,10 +19,14 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internals.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#include "exec/exec-all.h"
 #include "qemu/int128.h"
 #include "vec_internal.h"
+#include "sve_ldst_internal.h"
 
 /* ResetSVEState */
 void arm_reset_sve_state(CPUARMState *env)
@@ -192,3 +196,614 @@ void HELPER(sme_mova_zav_q)(void *za, void *vn, void *vg, uint32_t desc)
         }
     }
 }
+
+/*
+ * Clear elements in a tile slice comprising len bytes.
+ */
+
+typedef void ClearFn(void *ptr, size_t off, size_t len);
+
+static void clear_horizontal(void *ptr, size_t off, size_t len)
+{
+    memset(ptr + off, 0, len);
+}
+
+static void clear_vertical_b(void *vptr, size_t off, size_t len)
+{
+    uint8_t *ptr = vptr;
+    size_t i;
+
+    for (i = 0; i < len; ++i) {
+        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
+    }
+}
+
+static void clear_vertical_h(void *vptr, size_t off, size_t len)
+{
+    uint16_t *ptr = vptr;
+    size_t i;
+
+    for (i = 0; i < len / 2; ++i) {
+        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
+    }
+}
+
+static void clear_vertical_s(void *vptr, size_t off, size_t len)
+{
+    uint32_t *ptr = vptr;
+    size_t i;
+
+    for (i = 0; i < len / 4; ++i) {
+        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
+    }
+}
+
+static void clear_vertical_d(void *vptr, size_t off, size_t len)
+{
+    uint64_t *ptr = vptr;
+    size_t i;
+
+    for (i = 0; i < len / 8; ++i) {
+        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
+    }
+}
+
+static void clear_vertical_q(void *vptr, size_t off, size_t len)
+{
+    Int128 *ptr = vptr, zero = int128_zero();
+    size_t i;
+
+    for (i = 0; i < len / 16; ++i) {
+        ptr[(i + off) * sizeof(ARMVectorReg)] = zero;
+    }
+}
+
+/*
+ * Copy elements from an array into a tile slice comprising len bytes.
+ */
+
+typedef void CopyFn(void *dst, const void *src, size_t len);
+
+static void copy_horizontal(void *dst, const void *src, size_t len)
+{
+    memcpy(dst, src, len);
+}
+
+static void copy_vertical_b(void *vdst, const void *vsrc, size_t len)
+{
+    const uint8_t *src = vsrc;
+    uint8_t *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len; ++i) {
+        dst[i * sizeof(ARMVectorReg)] = src[i];
+    }
+}
+
+static void copy_vertical_h(void *vdst, const void *vsrc, size_t len)
+{
+    const uint16_t *src = vsrc;
+    uint16_t *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len / 2; ++i) {
+        dst[i * sizeof(ARMVectorReg)] = src[i];
+    }
+}
+
+static void copy_vertical_s(void *vdst, const void *vsrc, size_t len)
+{
+    const uint32_t *src = vsrc;
+    uint32_t *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len / 4; ++i) {
+        dst[i * sizeof(ARMVectorReg)] = src[i];
+    }
+}
+
+static void copy_vertical_d(void *vdst, const void *vsrc, size_t len)
+{
+    const uint64_t *src = vsrc;
+    uint64_t *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len / 8; ++i) {
+        dst[i * sizeof(ARMVectorReg)] = src[i];
+    }
+}
+
+static void copy_vertical_q(void *vdst, const void *vsrc, size_t len)
+{
+    const Int128 *src = vsrc;
+    Int128 *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len / 16; ++i) {
+        dst[i * sizeof(ARMVectorReg)] = src[i];
+    }
+}
+
+/*
+ * Host and TLB primitives for vertical tile slice addressing.
+ */
+
+#define DO_LD(NAME, TYPE, HOST, TLB)                                        \
+static inline void sme_##NAME##_v_host(void *za, intptr_t off, void *host)  \
+{                                                                           \
+    TYPE val = HOST(host);                                                  \
+    *(TYPE *)(za + off * sizeof(ARMVectorReg)) = val;                       \
+}                                                                           \
+static inline void sme_##NAME##_v_tlb(CPUARMState *env, void *za,           \
+                        intptr_t off, target_ulong addr, uintptr_t ra)      \
+{                                                                           \
+    TYPE val = TLB(env, useronly_clean_ptr(addr), ra);                      \
+    *(TYPE *)(za + off * sizeof(ARMVectorReg)) = val;                       \
+}
+
+#define DO_ST(NAME, TYPE, HOST, TLB)                                        \
+static inline void sme_##NAME##_v_host(void *za, intptr_t off, void *host)  \
+{                                                                           \
+    TYPE val = *(TYPE *)(za + off * sizeof(ARMVectorReg));                  \
+    HOST(host, val);                                                        \
+}                                                                           \
+static inline void sme_##NAME##_v_tlb(CPUARMState *env, void *za,           \
+                        intptr_t off, target_ulong addr, uintptr_t ra)      \
+{                                                                           \
+    TYPE val = *(TYPE *)(za + off * sizeof(ARMVectorReg));                  \
+    TLB(env, useronly_clean_ptr(addr), val, ra);                            \
+}
+
+/*
+ * FIXME: The ARMVectorReg elements are stored in host-endian 64-bit units.
+ * We do not have a defined ordering of the 64-bit units for host-endian
+ * 128-bit quantities.  For now, just leave the host words in little-endian
+ * order and hope for the best.
+ */
+#define DO_LDQ(HNAME, VNAME, BE, HOST, TLB)                                 \
+static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
+{                                                                           \
+    uint64_t val0 = HOST(host), val1 = HOST(host + 8);                      \
+    uint64_t *ptr = za + off;                                               \
+    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
+}                                                                           \
+static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
+{                                                                           \
+    HNAME##_host(za, off * sizeof(ARMVectorReg), host);                     \
+}                                                                           \
+static inline void HNAME##_tlb(CPUARMState *env, void *za, intptr_t off,    \
+                               target_ulong addr, uintptr_t ra)             \
+{                                                                           \
+    uint64_t val0 = TLB(env, useronly_clean_ptr(addr), ra);                 \
+    uint64_t val1 = TLB(env, useronly_clean_ptr(addr + 8), ra);             \
+    uint64_t *ptr = za + off;                                               \
+    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
+}                                                                           \
+static inline void VNAME##_v_tlb(CPUARMState *env, void *za, intptr_t off,  \
+                               target_ulong addr, uintptr_t ra)             \
+{                                                                           \
+    HNAME##_tlb(env, za, off * sizeof(ARMVectorReg), addr, ra);             \
+}
+
+#define DO_STQ(HNAME, VNAME, BE, HOST, TLB)                                 \
+static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
+{                                                                           \
+    uint64_t *ptr = za + off;                                               \
+    HOST(host, ptr[BE]);                                                    \
+    HOST(host + 1, ptr[!BE]);                                               \
+}                                                                           \
+static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
+{                                                                           \
+    HNAME##_host(za, off * sizeof(ARMVectorReg), host);                     \
+}                                                                           \
+static inline void HNAME##_tlb(CPUARMState *env, void *za, intptr_t off,    \
+                               target_ulong addr, uintptr_t ra)             \
+{                                                                           \
+    uint64_t *ptr = za + off;                                               \
+    TLB(env, useronly_clean_ptr(addr), ptr[BE], ra);                        \
+    TLB(env, useronly_clean_ptr(addr + 8), ptr[!BE], ra);                   \
+}                                                                           \
+static inline void VNAME##_v_tlb(CPUARMState *env, void *za, intptr_t off,  \
+                               target_ulong addr, uintptr_t ra)             \
+{                                                                           \
+    HNAME##_tlb(env, za, off * sizeof(ARMVectorReg), addr, ra);             \
+}
+
+DO_LD(ld1b, uint8_t, ldub_p, cpu_ldub_data_ra)
+DO_LD(ld1h_be, uint16_t, lduw_be_p, cpu_lduw_be_data_ra)
+DO_LD(ld1h_le, uint16_t, lduw_le_p, cpu_lduw_le_data_ra)
+DO_LD(ld1s_be, uint32_t, ldl_be_p, cpu_ldl_be_data_ra)
+DO_LD(ld1s_le, uint32_t, ldl_le_p, cpu_ldl_le_data_ra)
+DO_LD(ld1d_be, uint64_t, ldq_be_p, cpu_ldq_be_data_ra)
+DO_LD(ld1d_le, uint64_t, ldq_le_p, cpu_ldq_le_data_ra)
+
+DO_LDQ(sve_ld1qq_be, sme_ld1q_be, 1, ldq_be_p, cpu_ldq_be_data_ra)
+DO_LDQ(sve_ld1qq_le, sme_ld1q_le, 0, ldq_le_p, cpu_ldq_le_data_ra)
+
+DO_ST(st1b, uint8_t, stb_p, cpu_stb_data_ra)
+DO_ST(st1h_be, uint16_t, stw_be_p, cpu_stw_be_data_ra)
+DO_ST(st1h_le, uint16_t, stw_le_p, cpu_stw_le_data_ra)
+DO_ST(st1s_be, uint32_t, stl_be_p, cpu_stl_be_data_ra)
+DO_ST(st1s_le, uint32_t, stl_le_p, cpu_stl_le_data_ra)
+DO_ST(st1d_be, uint64_t, stq_be_p, cpu_stq_be_data_ra)
+DO_ST(st1d_le, uint64_t, stq_le_p, cpu_stq_le_data_ra)
+
+DO_STQ(sve_st1qq_be, sme_st1q_be, 1, stq_be_p, cpu_stq_be_data_ra)
+DO_STQ(sve_st1qq_le, sme_st1q_le, 0, stq_le_p, cpu_stq_le_data_ra)
+
+#undef DO_LD
+#undef DO_ST
+#undef DO_LDQ
+#undef DO_STQ
+
+/*
+ * Common helper for all contiguous predicated loads.
+ */
+
+static inline QEMU_ALWAYS_INLINE
+void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
+             const target_ulong addr, uint32_t desc, const uintptr_t ra,
+             const int esz, uint32_t mtedesc, bool vertical,
+             sve_ldst1_host_fn *host_fn,
+             sve_ldst1_tlb_fn *tlb_fn,
+             ClearFn *clr_fn,
+             CopyFn *cpy_fn)
+{
+    const intptr_t reg_max = simd_oprsz(desc);
+    const intptr_t esize = 1 << esz;
+    intptr_t reg_off, reg_last;
+    SVEContLdSt info;
+    void *host;
+    int flags;
+
+    /* Find the active elements.  */
+    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, esize)) {
+        /* The entire predicate was false; no load occurs.  */
+        clr_fn(za, 0, reg_max);
+        return;
+    }
+
+    /* Probe the page(s).  Exit with exception for any invalid page. */
+    sve_cont_ldst_pages(&info, FAULT_ALL, env, addr, MMU_DATA_LOAD, ra);
+
+    /* Handle watchpoints for all active elements. */
+    sve_cont_ldst_watchpoints(&info, env, vg, addr, esize, esize,
+                              BP_MEM_READ, ra);
+
+    /*
+     * Handle mte checks for all active elements.
+     * Since TBI must be set for MTE, !mtedesc => !mte_active.
+     */
+    if (mtedesc) {
+        sve_cont_ldst_mte_check(&info, env, vg, addr, esize, esize,
+                                mtedesc, ra);
+    }
+
+    flags = info.page[0].flags | info.page[1].flags;
+    if (unlikely(flags != 0)) {
+#ifdef CONFIG_USER_ONLY
+        g_assert_not_reached();
+#else
+        /*
+         * At least one page includes MMIO.
+         * Any bus operation can fail with cpu_transaction_failed,
+         * which for ARM will raise SyncExternal.  Perform the load
+         * into scratch memory to preserve register state until the end.
+         */
+        ARMVectorReg scratch = { };
+
+        reg_off = info.reg_off_first[0];
+        reg_last = info.reg_off_last[1];
+        if (reg_last < 0) {
+            reg_last = info.reg_off_split;
+            if (reg_last < 0) {
+                reg_last = info.reg_off_last[0];
+            }
+        }
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    tlb_fn(env, &scratch, reg_off, addr + reg_off, ra);
+                }
+                reg_off += esize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+
+        cpy_fn(za, &scratch, reg_max);
+        return;
+#endif
+    }
+
+    /* The entire operation is in RAM, on valid pages. */
+
+    reg_off = info.reg_off_first[0];
+    reg_last = info.reg_off_last[0];
+    host = info.page[0].host;
+
+    if (!vertical) {
+        memset(za, 0, reg_max);
+    } else if (reg_off) {
+        clr_fn(za, 0, reg_off);
+    }
+
+    while (reg_off <= reg_last) {
+        uint64_t pg = vg[reg_off >> 6];
+        do {
+            if ((pg >> (reg_off & 63)) & 1) {
+                host_fn(za, reg_off, host + reg_off);
+            } else if (vertical) {
+                clr_fn(za, reg_off, esize);
+            }
+            reg_off += esize;
+        } while (reg_off <= reg_last && (reg_off & 63));
+    }
+
+    /*
+     * Use the slow path to manage the cross-page misalignment.
+     * But we know this is RAM and cannot trap.
+     */
+    reg_off = info.reg_off_split;
+    if (unlikely(reg_off >= 0)) {
+        tlb_fn(env, za, reg_off, addr + reg_off, ra);
+    }
+
+    reg_off = info.reg_off_first[1];
+    if (unlikely(reg_off >= 0)) {
+        reg_last = info.reg_off_last[1];
+        host = info.page[1].host;
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    host_fn(za, reg_off, host + reg_off);
+                } else if (vertical) {
+                    clr_fn(za, reg_off, esize);
+                }
+                reg_off += esize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+    }
+}
+
+static inline QEMU_ALWAYS_INLINE
+void sme_ld1_mte(CPUARMState *env, void *za, uint64_t *vg,
+                 target_ulong addr, uint32_t desc, uintptr_t ra,
+                 const int esz, bool vertical,
+                 sve_ldst1_host_fn *host_fn,
+                 sve_ldst1_tlb_fn *tlb_fn,
+                 ClearFn *clr_fn,
+                 CopyFn *cpy_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    int bit55 = extract64(addr, 55, 1);
+
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /* Perform gross MTE suppression early. */
+    if (!tbi_check(desc, bit55) ||
+        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+        mtedesc = 0;
+    }
+
+    sme_ld1(env, za, vg, addr, desc, ra, esz, mtedesc, vertical,
+            host_fn, tlb_fn, clr_fn, cpy_fn);
+}
+
+#define DO_LD(L, END, ESZ)                                                 \
+void HELPER(sme_ld1##L##END##_h)(CPUARMState *env, void *za, void *vg,     \
+                                 target_ulong addr, uint32_t desc)         \
+{                                                                          \
+    sme_ld1(env, za, vg, addr, desc, GETPC(), ESZ, 0, false,               \
+            sve_ld1##L##L##END##_host, sve_ld1##L##L##END##_tlb,           \
+            clear_horizontal, copy_horizontal);                            \
+}                                                                          \
+void HELPER(sme_ld1##L##END##_v)(CPUARMState *env, void *za, void *vg,     \
+                                 target_ulong addr, uint32_t desc)         \
+{                                                                          \
+    sme_ld1(env, za, vg, addr, desc, GETPC(), ESZ, 0, true,                \
+            sme_ld1##L##END##_v_host, sme_ld1##L##END##_v_tlb,             \
+            clear_vertical_##L, copy_vertical_##L);                        \
+}                                                                          \
+void HELPER(sme_ld1##L##END##_h_mte)(CPUARMState *env, void *za, void *vg, \
+                                     target_ulong addr, uint32_t desc)     \
+{                                                                          \
+    sme_ld1_mte(env, za, vg, addr, desc, GETPC(), ESZ, false,              \
+                sve_ld1##L##L##END##_host, sve_ld1##L##L##END##_tlb,       \
+                clear_horizontal, copy_horizontal);                        \
+}                                                                          \
+void HELPER(sme_ld1##L##END##_v_mte)(CPUARMState *env, void *za, void *vg, \
+                                     target_ulong addr, uint32_t desc)     \
+{                                                                          \
+    sme_ld1_mte(env, za, vg, addr, desc, GETPC(), ESZ, true,               \
+                sme_ld1##L##END##_v_host, sme_ld1##L##END##_v_tlb,         \
+                clear_vertical_##L, copy_vertical_##L);                    \
+}
+
+DO_LD(b, , MO_8)
+DO_LD(h, _be, MO_16)
+DO_LD(h, _le, MO_16)
+DO_LD(s, _be, MO_32)
+DO_LD(s, _le, MO_32)
+DO_LD(d, _be, MO_64)
+DO_LD(d, _le, MO_64)
+DO_LD(q, _be, MO_128)
+DO_LD(q, _le, MO_128)
+
+#undef DO_LD
+
+/*
+ * Common helper for all contiguous predicated stores.
+ */
+
+static inline QEMU_ALWAYS_INLINE
+void sme_st1(CPUARMState *env, void *za, uint64_t *vg,
+             const target_ulong addr, uint32_t desc, const uintptr_t ra,
+             const int esz, uint32_t mtedesc, bool vertical,
+             sve_ldst1_host_fn *host_fn,
+             sve_ldst1_tlb_fn *tlb_fn)
+{
+    const intptr_t reg_max = simd_oprsz(desc);
+    const intptr_t esize = 1 << esz;
+    intptr_t reg_off, reg_last;
+    SVEContLdSt info;
+    void *host;
+    int flags;
+
+    /* Find the active elements.  */
+    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, esize)) {
+        /* The entire predicate was false; no store occurs.  */
+        return;
+    }
+
+    /* Probe the page(s).  Exit with exception for any invalid page. */
+    sve_cont_ldst_pages(&info, FAULT_ALL, env, addr, MMU_DATA_STORE, ra);
+
+    /* Handle watchpoints for all active elements. */
+    sve_cont_ldst_watchpoints(&info, env, vg, addr, esize, esize,
+                              BP_MEM_WRITE, ra);
+
+    /*
+     * Handle mte checks for all active elements.
+     * Since TBI must be set for MTE, !mtedesc => !mte_active.
+     */
+    if (mtedesc) {
+        sve_cont_ldst_mte_check(&info, env, vg, addr, esize, esize,
+                                mtedesc, ra);
+    }
+
+    flags = info.page[0].flags | info.page[1].flags;
+    if (unlikely(flags != 0)) {
+#ifdef CONFIG_USER_ONLY
+        g_assert_not_reached();
+#else
+        /*
+         * At least one page includes MMIO.
+         * Any bus operation can fail with cpu_transaction_failed,
+         * which for ARM will raise SyncExternal.  We cannot avoid
+         * this fault and will leave with the store incomplete.
+         */
+        reg_off = info.reg_off_first[0];
+        reg_last = info.reg_off_last[1];
+        if (reg_last < 0) {
+            reg_last = info.reg_off_split;
+            if (reg_last < 0) {
+                reg_last = info.reg_off_last[0];
+            }
+        }
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    tlb_fn(env, za, reg_off, addr + reg_off, ra);
+                }
+                reg_off += esize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+        return;
+#endif
+    }
+
+    reg_off = info.reg_off_first[0];
+    reg_last = info.reg_off_last[0];
+    host = info.page[0].host;
+
+    while (reg_off <= reg_last) {
+        uint64_t pg = vg[reg_off >> 6];
+        do {
+            if ((pg >> (reg_off & 63)) & 1) {
+                host_fn(za, reg_off, host + reg_off);
+            }
+            reg_off += 1 << esz;
+        } while (reg_off <= reg_last && (reg_off & 63));
+    }
+
+    /*
+     * Use the slow path to manage the cross-page misalignment.
+     * But we know this is RAM and cannot trap.
+     */
+    reg_off = info.reg_off_split;
+    if (unlikely(reg_off >= 0)) {
+        tlb_fn(env, za, reg_off, addr + reg_off, ra);
+    }
+
+    reg_off = info.reg_off_first[1];
+    if (unlikely(reg_off >= 0)) {
+        reg_last = info.reg_off_last[1];
+        host = info.page[1].host;
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    host_fn(za, reg_off, host + reg_off);
+                }
+                reg_off += 1 << esz;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+    }
+}
+
+static inline QEMU_ALWAYS_INLINE
+void sme_st1_mte(CPUARMState *env, void *za, uint64_t *vg, target_ulong addr,
+                 uint32_t desc, uintptr_t ra, int esz, bool vertical,
+                 sve_ldst1_host_fn *host_fn,
+                 sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    int bit55 = extract64(addr, 55, 1);
+
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /* Perform gross MTE suppression early. */
+    if (!tbi_check(desc, bit55) ||
+        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+        mtedesc = 0;
+    }
+
+    sme_st1(env, za, vg, addr, desc, ra, esz, mtedesc,
+            vertical, host_fn, tlb_fn);
+}
+
+#define DO_ST(L, END, ESZ)                                                 \
+void HELPER(sme_st1##L##END##_h)(CPUARMState *env, void *za, void *vg,     \
+                                 target_ulong addr, uint32_t desc)         \
+{                                                                          \
+    sme_st1(env, za, vg, addr, desc, GETPC(), ESZ, 0, false,               \
+            sve_st1##L##L##END##_host, sve_st1##L##L##END##_tlb);          \
+}                                                                          \
+void HELPER(sme_st1##L##END##_v)(CPUARMState *env, void *za, void *vg,     \
+                                 target_ulong addr, uint32_t desc)         \
+{                                                                          \
+    sme_st1(env, za, vg, addr, desc, GETPC(), ESZ, 0, true,                \
+            sme_st1##L##END##_v_host, sme_st1##L##END##_v_tlb);            \
+}                                                                          \
+void HELPER(sme_st1##L##END##_h_mte)(CPUARMState *env, void *za, void *vg, \
+                                     target_ulong addr, uint32_t desc)     \
+{                                                                          \
+    sme_st1_mte(env, za, vg, addr, desc, GETPC(), ESZ, false,              \
+                sve_st1##L##L##END##_host, sve_st1##L##L##END##_tlb);      \
+}                                                                          \
+void HELPER(sme_st1##L##END##_v_mte)(CPUARMState *env, void *za, void *vg, \
+                                     target_ulong addr, uint32_t desc)     \
+{                                                                          \
+    sme_st1_mte(env, za, vg, addr, desc, GETPC(), ESZ, true,               \
+                sme_st1##L##END##_v_host, sme_st1##L##END##_v_tlb);        \
+}
+
+DO_ST(b, , MO_8)
+DO_ST(h, _be, MO_16)
+DO_ST(h, _le, MO_16)
+DO_ST(s, _be, MO_32)
+DO_ST(s, _le, MO_32)
+DO_ST(d, _be, MO_64)
+DO_ST(d, _le, MO_64)
+DO_ST(q, _be, MO_128)
+DO_ST(q, _le, MO_128)
+
+#undef DO_ST
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index d2a7232491..978af74d1d 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -151,3 +151,72 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
 
     return true;
 }
+
+static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
+{
+    typedef void GenLdSt1(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv, TCGv_i32);
+
+    /*
+     * Indexed by [esz][be][v][mte][st], which is (except for load/store)
+     * also the order in which the elements appear in the function names,
+     * and so how we must concatenate the pieces.
+     */
+
+#define FN_LS(F)     { gen_helper_sme_ld1##F, gen_helper_sme_st1##F }
+#define FN_MTE(F)    { FN_LS(F), FN_LS(F##_mte) }
+#define FN_HV(F)     { FN_MTE(F##_h), FN_MTE(F##_v) }
+#define FN_END(L, B) { FN_HV(L), FN_HV(B) }
+
+    static GenLdSt1 * const fns[5][2][2][2][2] = {
+        FN_END(b, b),
+        FN_END(h_le, h_be),
+        FN_END(s_le, s_be),
+        FN_END(d_le, d_be),
+        FN_END(q_le, q_be),
+    };
+
+#undef FN_LS
+#undef FN_MTE
+#undef FN_HV
+#undef FN_END
+
+    TCGv_ptr t_za, t_pg;
+    TCGv_i64 addr;
+    int desc = 0;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
+
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
+    t_pg = pred_full_reg_ptr(s, a->pg);
+    addr = tcg_temp_new_i64();
+
+    tcg_gen_shli_i64(addr, cpu_reg(s, a->rn), a->esz);
+    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rm));
+
+    if (mte) {
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, a->st);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << a->esz) - 1);
+        desc <<= SVE_MTEDESC_SHIFT;
+    } else {
+        addr = clean_data_tbi(s, addr);
+    }
+    desc = simd_desc(s->svl, s->svl, desc);
+
+    fns[a->esz][be][a->v][mte][a->st](cpu_env, t_za, t_pg, addr,
+                                      tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(t_za);
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_i64(addr);
+    return true;
+}
-- 
2.34.1

