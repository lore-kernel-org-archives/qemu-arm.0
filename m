Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276186ejb;
        Sat, 20 May 2023 09:27:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kn4ofHLq7oKkksZohRkNoG2+iyJGAvzTEDQDu38HJWyZoALDG9iPwlpFZihZLXwWqkjOQ
X-Received: by 2002:a05:622a:14:b0:3e3:9185:cb15 with SMTP id x20-20020a05622a001400b003e39185cb15mr11484560qtw.7.1684600075786;
        Sat, 20 May 2023 09:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600075; cv=none;
        d=google.com; s=arc-20160816;
        b=Mbkic94DsvHQokUiIHUj6PPS8P/7HmWPE0WehRtMArJ65aI+ypSd8CTjvI1ftDmXdX
         nQUQ8VmqRkqkfOThoSriZAff4BTJxVTaWn6JcS3bC+9+9EBH+elWx2MLCwAiyeLAT7OR
         cRdTnELJWQcJmpUFPLdBLa7OqKZ3HRmjSUx/ElcV3r6evq8zD0Z3IWK9zm2p5Il7idWj
         Fvw9l60lDEX6xViEDyvuG39FTUNIKpPD7u0yEo1K4hIu711F+Zf/Dmhbb9zeVWE2Fka6
         EmldWX0DqlZNeRvb9nb3960v+H9x4kDjhaC80ePukzwVhU6G6R0p/Vkn9h82Gc48mGTh
         pv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AHAmgIp57eQq/xk6K8cmnraRLR5HX4TvEutgtaIW/48=;
        b=wrx3zYJVNWtdu8s4cy1XqWqgaVxgmUQxkVuGFDBwsFLDiczI4c0T40KghKjpDPKuoz
         ujFdby+rKSb06mj2cO/k9UkSN5AYAqzh3GvSmsCD8wMpcozDMe6y8iPOOKWnkszW4xXl
         owi+3RkKGpqezkTPJNnH+1sG7hvFdvjUY+CJtktg5v0v6W2iGVOsM3cS8lSglF0nLIwl
         2sbMRPOmKKopDiRFV+Hqg4ykq3MgLOvFytYvqrjwQwuByVZPfAt+D48n6U+TtKIaHBst
         b2OLIuKN3tsFJmrLp5GXD1q5qYuvlVdCyazHg1qlQMV0Fj+oaToSBeAKMP5a5FUWwUVH
         kjqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gVu4BAXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20-20020a05622a04d400b003f4ef75d22esi1299129qtx.325.2023.05.20.09.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gVu4BAXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PQI-0003m2-NA; Sat, 20 May 2023 12:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQ9-0003fL-4I
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQ3-00039A-1D
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:02 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1ae452c2777so14290465ad.0
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600016; x=1687192016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AHAmgIp57eQq/xk6K8cmnraRLR5HX4TvEutgtaIW/48=;
 b=gVu4BAXH5NbAJI0BPJ2q1YYcSDfuVbxJV8Jtpze6pFN5Ow8tbjCDYwsd2Hnre/CYWS
 x0Nq25pzGKhpqA9bacvZy6inhNLlfysgpqUDWKgBQpYn9IRIb8soCNynNGTkC+2uU/Cj
 uH6JFJg2SfTGpcFQDbcJukVweHHZDiU2/PunLTbIvp18RB+i+whcWyA2+W776LmSMDsE
 woqwHEGtaulH8/orhywc189NWc1dG5YwChzo9TL8Zy0ZIYI0UcIpQi3Z26KgVyaWKReZ
 yGCVdEKH/b3T49/aMM/NDkmsLfUzD7AHrEGNx39ue+/84KctH16mbh+qKG69oJM2sLvD
 DZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600016; x=1687192016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AHAmgIp57eQq/xk6K8cmnraRLR5HX4TvEutgtaIW/48=;
 b=KnoKsxEJlr4KE7yH+OIzXb5dTdua1+Ny40duMAk2P6j3Vf6yoJG5wf33NWsU65bvN9
 rlV/4bbjMT8MlX2PkkjQ63KQaDY2Xw/koEnsRc6BoptPSbXtKPTC+OvmspY8OLw97biY
 dLDw7Qp6pEpJ2OI2QDc0PDxYJvBZYrFzH+dV42b226WVnrme2C/CD7nZvP5oL8fFJaBk
 Zblyi6ewV0wIC98TNoJeFPN9fIY2B5IjD3lJnEqhKc7Vn9DmTdaZC6Z5DhpI22TM8dzU
 9XgV4/JRd/rtlGfbxFXkOZraKv5JYuMTyFsM3NeSUPirMEvcWfrEBQdmz1kMWhbY39Is
 c9IQ==
X-Gm-Message-State: AC+VfDx2ynAlgo3a10gTrQsbDVq6vAds8YafGSfPk831WytUtsQ1My8q
 iVVoH1rqiu4uBFqjt+yvXZ5HC/dzmcq5zuqr0JI=
X-Received: by 2002:a17:902:ce81:b0:1ac:61ad:d6f2 with SMTP id
 f1-20020a170902ce8100b001ac61add6f2mr6773788plg.5.1684600016500; 
 Sat, 20 May 2023 09:26:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/27] meson: Fix detect atomic128 support with optimization
Date: Sat, 20 May 2023 09:26:19 -0700
Message-Id: <20230520162634.3991009-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: UKk29kV36vTS

Silly typo: sizeof(16) != 16.

Fixes: e61f1efeb730 ("meson: Detect atomic128 support with optimization")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 4ffc0d3e59..5e7fc6345f 100644
--- a/meson.build
+++ b/meson.build
@@ -2555,7 +2555,7 @@ if has_int128
   # __alignof(unsigned __int128) for the host.
   atomic_test_128 = '''
     int main(int ac, char **av) {
-      unsigned __int128 *p = __builtin_assume_aligned(av[ac - 1], sizeof(16));
+      unsigned __int128 *p = __builtin_assume_aligned(av[ac - 1], 16);
       p[1] = __atomic_load_n(&p[0], __ATOMIC_RELAXED);
       __atomic_store_n(&p[2], p[3], __ATOMIC_RELAXED);
       __atomic_compare_exchange_n(&p[4], &p[5], p[6], 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
-- 
2.34.1

