Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2061737nji;
        Sun, 14 Jul 2024 22:59:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXutxo/klAbM65t8mPsa6s/1aaqfj+ateO/aRfHxoqhPFRNEjWrcncsEt6cD4RsvWJgihpzSu39bxDLemxZgnugCX8VNeK3
X-Google-Smtp-Source: AGHT+IHYLWJ1zxk99pWrBzVMSK0umrjuX+2BcD0Knw7NH9jAC84lpILz2iluhuh5/GpH3z+6tehD
X-Received: by 2002:a05:6102:54a4:b0:48f:14e6:4bc3 with SMTP id ada2fe7eead31-490321585f4mr23042697137.4.1721023167625;
        Sun, 14 Jul 2024 22:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721023167; cv=none;
        d=google.com; s=arc-20160816;
        b=ihM8bw9cygcAJ0YSMZAvsUObV87QG5TEhlWFx1Sg1TDYA27YRr0h0UyQq0g+AuEzVh
         A42DGMSv/PEgv6Cwul2W+3OTZs4LAz1iNFbhKF9IKSUMx4hRhWmZAOh9hTA6J2aaiCMO
         vN9Zc6oAvpIHd29y/3hY/JuAwYBIc4L82DaMu/jPK5Xn2ZndyhKfEDvEiNVP9kfJWwYy
         nbiwtpgHdYDwVOOZj4ewPD+CZG8lmQJZ90htuwp99cLE/AVKa5iohXaWweb32fUt8aKO
         /smQPi00Bi1WK1R4LEERsvNPfMD9aXrbxOGavM/QuaNJJiOw9MKKmROCt11UvYrisC1p
         QDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=69RYijPlse3JbUzx+du3ou9M98Z9jhFYXn2Bml2d90w=;
        fh=KK8zc0HD8TLB5rwBMLjEUcsTx4xcA/ykt/spDw31gEY=;
        b=aeemp6ndTVaeR3HvR5QeLATtNqHBG9De4CmbwAxv9lUiwk/lX1faTXOLN4cft8SVKV
         QznJ1YisJURbH96iJcrpx/L6VQ87uG0woeioOd7jWXImc1Zbin9rqQhZx97xnzkh+/s1
         P1625ROtBLnwmscuwyNeOG808y3iawtZyy+KbH6bcBIvx4bjXQXauVmvAq2inA/SKjza
         gY8bWykwd+LfZY13EbvPuM1gWHNMShgdl/XpZdW99mnUoqtEQHdmKSnhBwaQY/iAgwt9
         PLFTQh/aAEM2mRFxBFAGRe/UCd94ttRG/PRjyXay8sVAfO2dZQrdfI61Z+ZBStaX+TcJ
         DzgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o123e5h+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a6302dsi44982686d6.553.2024.07.14.22.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2024 22:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o123e5h+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTEjM-0004ke-BR; Mon, 15 Jul 2024 01:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTEjK-0004cD-Rk
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 01:58:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTEjI-0008Sb-L1
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 01:58:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2c9baecc80fso2495748a91.1
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2024 22:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721023111; x=1721627911; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69RYijPlse3JbUzx+du3ou9M98Z9jhFYXn2Bml2d90w=;
 b=o123e5h+nYYMG/q0WlAenQ3hD8fGclL/ME00ECx1OAKwvGdNlY4PHEnfM64wab7gnL
 +509QAQLHiVh629/zl/pw4QMuB89QV0w3RDnojUXtHCqp6Nve+/1//2ykppOILBshpGT
 Ya3rLi6aPe5j9VwRCFg5EJ3GyGDdQ9UeBKT0fzkxGD2BTCWrzc2bEsX9WoWX5U3G3TGk
 PuAJI47+8oS91yh+acYBKTYUb4tNn5tmjMnDvWImShBqCfWZ2DRM0hVijSLKNlFwjx0r
 tYoIb01Z4gf9WWFCp1m9sc0l/aXhDETh3nbaHKTlinX92zANP/t27BnRKECElHD2PfPs
 c9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721023111; x=1721627911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69RYijPlse3JbUzx+du3ou9M98Z9jhFYXn2Bml2d90w=;
 b=VtjZW39fZss2V/5lOIuzyp3U1Dy2HsM7JQIcUIRXia5vlhrwjNFiW6vhXYenpFtxSc
 jbD/fG/koMUeZNVcHQAnBqjolBal484ImSA7Eqm7ERyYY702xxioDMEcD+JWw3ouHLsq
 HXAFiMF6oN3iDLRf5U6jm5+WGFa5lT/2/C+a+xSRlSHF2o68cVtr6dutZGmQYNr3W95O
 xK/ySA5eLuIr++Lxml2GcXyGHry6UkSv19HfZJ3MKjrqKHAiMFpi1H+qCB0oBkSiAj4/
 5PQ90qI39Y8KevHoNqsQOL2VeALK6sEMNotW56mi0kbCUwU88z+rdCiSb4CM8EjczLBX
 Majw==
X-Gm-Message-State: AOJu0YwioTVjisXYrwYprnOYqI9xddxunTWMxbHDq6/ygn4D+XSw8kiQ
 t9Qc1sx0g49AoZjHuOo/bRZcrlvram1ojCBs8vzEd+oRslMoAnNQh4MwMFraYqchJ2cHNpJbdRl
 kaG19kg==
X-Received: by 2002:a17:90a:db4c:b0:2ca:7e7c:83ec with SMTP id
 98e67ed59e1d1-2ca7e7c8890mr9278627a91.20.1721023110671; 
 Sun, 14 Jul 2024 22:58:30 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cacd419af7sm5463589a91.25.2024.07.14.22.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 22:58:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: danikhan632@git.sr.ht, qemu-arm@nongnu.org,
 Daniyal Khan <danikhan632@gmail.com>, qemu-stable@nongnu.org
Subject: [PATCH 1/3] target/arm: Use float_status copy in sme_fmopa_s
Date: Mon, 15 Jul 2024 15:58:18 +1000
Message-ID: <20240715055820.319035-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715055820.319035-1-richard.henderson@linaro.org>
References: <20240715055820.319035-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: rP+Pk8N9aW5n

From: Daniyal Khan <danikhan632@gmail.com>

We made a copy above because the fp exception flags
are not propagated back to the FPST register, but
then failed to use the copy.

Cc: qemu-stable@nongnu.org
Fixes: 558e956c719 ("target/arm: Implement FMOPA, FMOPS (non-widening)")
Signed-off-by: Daniyal Khan <danikhan632@gmail.com>
[rth: Split from a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index e2e0575039..5a6dd76489 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -916,7 +916,7 @@ void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
                         if (pb & 1) {
                             uint32_t *a = vza_row + H1_4(col);
                             uint32_t *m = vzm + H1_4(col);
-                            *a = float32_muladd(n, *m, *a, 0, vst);
+                            *a = float32_muladd(n, *m, *a, 0, &fpst);
                         }
                         col += 4;
                         pb >>= 4;
-- 
2.43.0

