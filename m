Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1249820dyc;
        Fri, 4 Jul 2025 07:22:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2M1I4cOBb6bCPp2ejPfUEOyRnRdS0oGV61yQ9w/6oaxxlr2fzFH02qe+387znSEJvrK3pUMqmjuc6gQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHcWthZEVIJodaNFdFGJhQZ/1cfxyEzSihp6BRzhuXfMt48PPUZC4KIEPF3L4XALxAJ2mVv
X-Received: by 2002:a05:620a:2682:b0:7d3:e88d:a1d4 with SMTP id af79cd13be357-7d5ddc485ccmr230890785a.33.1751638955503;
        Fri, 04 Jul 2025 07:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751638955; cv=none;
        d=google.com; s=arc-20240605;
        b=YdVWnLSatKml3zbk+rqdk7IszzmJkgvuFH2GjO+VC/LrAFBP+WcNNfXHBbD+VlplS5
         DHnNOEwePDV4L2b7dtiSx7Li+aCL0Zm3g1jUUivQKdwObovkqgcBXSccnNaue9XHy56O
         MBO5x8WUwpzi8RyWNTgrW92D8c6d6jcZa5DyT/WH/3iMQMheEcY7S7LQmGtvXKSWfNyd
         spbGlBxd+0ZdcCDPl9Bri7qRf6wPKDczXcM+ZXWflQx8h0TOK7JPwUjKsK3hR2QTf9ht
         qCcMIuG4y6JRRxlqvFSWHdVyC2bjH9E7I3ObUhQ0WXMZDP1yG4pGJUtQsDcvkkuDGR5A
         z1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EJkg5Eikh8pDdMpxJ6bol3squO0VoPxIikfVrqRqSHM=;
        fh=s400U+Tx6cQDhtn+2Oey97pyo8KpW6wmR0wxZgTa8vk=;
        b=TbRlFJVkbQwzyX7I0mPO2INDVTXtcLsiyla/I0bKZVioglkF+6TD+7qKjTc32whNiv
         TFn4U5n1wEMvezNXy4bgM2FhbvBgyVnUnEkCaIZa+C0IpcZPNIGwg1++vsFdVY3Xj8cG
         OEAXV7LD0Y3Kqe4CZGL8baxwm/nViZsEUiLL4lHVFuV07m8HWgqL8l8GuGCKZd1qtmD2
         7VjRQcUt4rU8mDPiKvKY7tCsIkovYFQCb0HBo3xiRKXzAnncixadFanXjHUlglt+V1dw
         knyGdnJmE//76DA7X+WmIGzp8LW+/18sPJHseo+1TaFiZTmbdJWiEHHgn7KHAIOIaUwf
         1MzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jq9iyNWO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbe96b30si208763085a.265.2025.07.04.07.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jq9iyNWO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhIW-0005Sm-Nn; Fri, 04 Jul 2025 10:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI0-0004jo-6L
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:20 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhHx-00057T-5P
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:19 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2f78ef10832so690822fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638875; x=1752243675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJkg5Eikh8pDdMpxJ6bol3squO0VoPxIikfVrqRqSHM=;
 b=Jq9iyNWOxkqTKZnnaZYl2lhQOE5VfbW61M0eKBbHJMI6CV4tFHWli4Bfk0RYPn47Dq
 RPzqkddXdBnkCw8VIbVLK1ZF7d2XjjMt9a9T9fQ/dduQgAX3hGGNb2C1wGX6PhZPYZGx
 yN7DELoruHfYwCb1qYCKUEiFck3R8GZJkQGAi6Nb+/fbkBJ0NSUIieJipybSyjNWK/xU
 ixsEckEheEDZJznxSqr1HvoZN7jeJYHCkYv7jcOpibUsDZpnx9Z76XxzovaeNHn31hQw
 Jk+gKxoIeOmgc/wbduSelQ0ISGkCx2+nwDFqsr90k5sI33uhW3Hb3BW6hNMaMInipH7k
 ZB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638875; x=1752243675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJkg5Eikh8pDdMpxJ6bol3squO0VoPxIikfVrqRqSHM=;
 b=ghAZbN60fSfS8KlyRu5j87MGe95G+EXvvjuy9MbJLgVg3xF2LID68XJSlucYnXUKGf
 /41L8Y3aHv4LUXHvo/M8DibHPCao3QEUTGis7e7VPVQrobUqsAmgegC13Bl7jevnXKW0
 qKRk95C9tTYPEnaOAYTRrquIkdIH11zySMEQivbNTW7WWvh7eGjrAQNXahbTqPVnwgt0
 8siLjIJOcZ9MaAFXG/6yr+XuHXgAokNbthVV02yYy0GP8QAQPrvc/94Nch0ZP/OfOLPT
 LdD2dujo101Q4JmCZtiBNHnvcq3lCntZ6feoAPwdBJ4XOPkeyQe2wYVxIksfMkKOwjMG
 F+ug==
X-Gm-Message-State: AOJu0YxBEXm8oN+/cBE9GAGcml7AhdD5LWByr9MfS9ygL5o6922rsycJ
 /HBSSxNLZfX/qdjn4LtH4QAvE61ENRJXhmCLSYXqOsoR6IslOKP/GRn4jiDXAylm1cU=
X-Gm-Gg: ASbGncuc8wr/yIPmtbZNu7DkZ1pMeGm5hIuOnKrHgqFDo975OBSNIBJYsF2VOcduiq0
 J0pJbClfIrpP4I5AKX0vL5gY0i75hkAwA125qiqw0giJmRR737dphdZ4pZ/0XifAFSpAv5qxSuR
 D5GiHSfjxpvEnBTsdTiM+8hwqRg6eq3Nf0JRZUVtCFBXYmSRFdcaRzNA/V/4rVJjKIlZRuoZ38p
 HrichLhVZxOSsRc8CwCOHnMmawPvpXqeTT26syIk3aFfPZrV5Fez7xtjerJxBIkT9IKTISqruGO
 7BQbSixGewtDHyzxgZsksSLqBQ4tOCJAKS7SdvyUbfssclqKNWpMdHVutyckjgtf+SP7+SjapY9
 eXirhD6c2vGk+usfu9MSNAHQEyyQ7BbS6M5T4n0jN2EfJ+NSM
X-Received: by 2002:a05:6870:3c07:b0:2c8:5831:8d4 with SMTP id
 586e51a60fabf-2f796e1b536mr1609909fac.39.1751638875231; 
 Fri, 04 Jul 2025 07:21:15 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v4 001/108] target/arm: Fix SME vs AdvSIMD exception priority
Date: Fri,  4 Jul 2025 08:19:24 -0600
Message-ID: <20250704142112.1018902-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
X-TUID: Xov+3ph0NbV8

We failed to raise an exception when
sme_excp_el == 0 and fp_excp_el == 1.

Cc: qemu-stable@nongnu.org
Fixes: 3d74825f4d6 ("target/arm: Add SME enablement checks")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 815225b130..5c44a5dece 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1488,7 +1488,8 @@ bool sme_enabled_check(DisasContext *s)
      * to be zero when fp_excp_el has priority.  This is because we need
      * sme_excp_el by itself for cpregs access checks.
      */
-    if (!s->fp_excp_el || s->sme_excp_el < s->fp_excp_el) {
+    if (s->sme_excp_el
+        && (!s->fp_excp_el || s->sme_excp_el <= s->fp_excp_el)) {
         bool ret = sme_access_check(s);
         s->fp_access_checked = (ret ? 1 : -1);
         return ret;
-- 
2.43.0

