Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp586306njb;
        Thu, 5 Dec 2024 19:13:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKjfLFBb9yUkXSjoklH6mT/Li3JBV/7CmCeerLsOQaKkm1C9t5DPFFqx1PbXVyxvqAKZjliuizQs1LiA==@linaro.org
X-Google-Smtp-Source: AGHT+IGuyeeeyO2+33OqgPkvzXKaRJapgMCh1qWy1n1IDV+HAvV/kpMYGsnqE0G3hizvL09r70xv
X-Received: by 2002:ac8:5e11:0:b0:466:afb6:660a with SMTP id d75a77b69052e-46734f99862mr18928061cf.49.1733454831523;
        Thu, 05 Dec 2024 19:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733454831; cv=none;
        d=google.com; s=arc-20240605;
        b=HCf8z6db+GpVtXW4wAiPAtQIBdCW/gjn9P1H6a3nmlB3xSKFXyWGkEYHSpffrt+b42
         GL8VjtnQRSZp4vZgC3UbCo/dYAFxWAjfDHa4S27TErMTnXIdNApU438vaSoOuUCUKFDP
         VbyiTT/D1trFMs5iJpFIJQf1u2vdeUoE300daFt28C+zJ+4KrNWtJf+1PAG6j+y1DXZx
         QbTMiSwki5ZZeeWNUBrxmU2aIe7oh3HHrkrlx1On+B/9Q2RDrNAOs2w8JWt8Ia//hHfP
         gMI4ACemzKnzsVX9oX9NONZeMZT1TIU0KvvwOurmZ/fFu45Gz2ryB2nuSM0IIdnvI9HN
         70oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=69pr0g6Y3okyXfOdDRckkWb2oJA9va5ZC3/aP8PTogM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=k/4izH2BjsRrIEOg90JrQlqb0uZAxfyQulP+mAlRtL1Y5Z5aIWOSGZboY6mI4NFVdG
         tJdoMwyYK+izZFa785ZTMJRA3BczJSAotacgLCGbqjNZ+lj5hWM1b5/KCxRk7qTwlVMu
         WwOP5LgAvEYHn+ElOL6DOPGZD278lBEatHVkxXYcrK7NONMex2UCE3PeKojqNOHxRLrf
         G85GdL0+5JCseNIO1/jy04cs2xLb67l0yZxesw1qvs+yXnvkdSWCAewrEKu5gQlwO3uY
         CeT4UxWoMBv1KnPkT0LKEimuXn0J6mruSGocbWqwOLWuwj/2nnuPchgYfehpX6xz1tL2
         QpsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LwLDDQcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4672983f131si33140681cf.549.2024.12.05.19.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 19:13:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LwLDDQcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJOle-0006m3-9O; Thu, 05 Dec 2024 22:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOlc-0006lW-Jx
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:12:32 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOla-0004QH-Rw
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:12:32 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5f1ecd0d9ecso829901eaf.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 19:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733454749; x=1734059549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69pr0g6Y3okyXfOdDRckkWb2oJA9va5ZC3/aP8PTogM=;
 b=LwLDDQcI2hX0f42kGchenenVx3HLt3A9RG4/hQmtxCOhBhUmNQu+EpEQ/AVPdYPnnR
 DVlmqh/pvKe35NDk1W/VLqu2leMUqygn0IsRi6JFXrpXQSu5MoHQOhFMZBL7BcT7RI3K
 KBTvK1muhIPj9DvIH1TVHrOobK2zJsolWr6HN5F0Q0lPyMeXQTu91vUKvTiG36uplL5f
 moS8yfdeFS06oOGtOUj4CDjOH7gtHUVmocNtJDL25mlmjeZZ7unw68UhMduLi+W+ak5I
 ZXWvZPpWwil75PCKgZSmFvUGYLCdvvJbnWJ1QLJTeBxwk4b6nGiFoyPOmyuhtbhBeNyX
 ZD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733454749; x=1734059549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69pr0g6Y3okyXfOdDRckkWb2oJA9va5ZC3/aP8PTogM=;
 b=IB4HyipfX/ea+CeLpiqYmdkSRAG3OVT+q36r07yN5SPIAqqm1l/FUuTeWMxPq/qO/1
 Q8oy6tZmyrYT2WTWzfg9yf6EQ4N4BSFWeoJ8gTsOb/upNQODMl9jHs96ZjbLN4OCA4iu
 cOcyrM9LJPtniR3XQdKB6NlbnlFVuyjJrEKaNZv9wP+Nzm7BDua9ZPClMHxP+zrLti07
 +n47V5HJgyNFys923es6A7sJCIq/bC9OD/9DSr+RTaiZkGG5l5rxzTgIghiW4qlcaElZ
 DpOmKu6QrvenUxNA9CNTLeW93nSdPpPxCjzbDr9H9DOYgVFhReVC7idOQJQAQj5i97dU
 f19w==
X-Gm-Message-State: AOJu0YzVBbKuBt7byqe+Hk2oyPea+nWs3Bb+afcpZNMHlC+lEiDqtoUO
 jV0OCvqMHwu7ZUVbeaSfApWi+opWiWKYE9k41zL+vz9qubfthgjOiJofKTkZLpQEOH3k3sX6aTv
 6DjydUEBO
X-Gm-Gg: ASbGnctqtuGNK+CQd+SO5D8Fu8MAk/t44Sjmk89n5U+NshN2XjHyrNE4AyMNqx1jvmG
 DiKO/Fk5A9+6wRBGVM0JU80etvJz/b0khs2tL7iG3pLuZfWMBFWmjxnYQAtRvKfaa3wjSRdfyYJ
 cI2v+/VAIlNDu6N1Oh/6gAqNf2Zkz5gUGNbBk2nAYTPCAMhoGEB0HIyE4Uy/1dvNn+rbjN7JrBd
 tdZC1EQZ2XxxPz0gzEeLeOdgkqBiBQeB0nRQVRODGFTkLER0YXVd2qaPbmSEhPoXSCUfZEiOEZ9
 5XpUXQTyKq6oGyAwR4F0NQXajZcR3NjNq8oi
X-Received: by 2002:a05:6830:378c:b0:71d:528b:b5b5 with SMTP id
 46e09a7af769-71dcf55656dmr1451994a34.19.1733454749714; 
 Thu, 05 Dec 2024 19:12:29 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71dc493b2dfsm596442a34.9.2024.12.05.19.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:12:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/9] target/arm: Introduce fpst alias for helper.h
Date: Thu,  5 Dec 2024 21:12:16 -0600
Message-ID: <20241206031224.78525-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206031224.78525-1-richard.henderson@linaro.org>
References: <20241206031224.78525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
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
X-TUID: SUknEZCYa0Kw

This allows us to declare that the helper requires
a float_status pointer and not a generic void pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 9919b1367b..cb722c491b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1,3 +1,7 @@
+#define dh_alias_fpst ptr
+#define dh_ctype_fpst float_status *
+#define dh_typecode_fpst dh_typecode_ptr
+
 DEF_HELPER_FLAGS_1(sxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_1(uxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
 
-- 
2.43.0

