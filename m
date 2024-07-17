Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp615532njk;
        Tue, 16 Jul 2024 23:11:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdi1eLRBLGfH/uBWdwZLwvhJWgI6/To9A9UCk1bNKReX2RE/vmqvszv/j64YSZVzivqPenrFOmRIJpGQV6LN9PO+qJ3fN4
X-Google-Smtp-Source: AGHT+IFEblwfHqJ2DuJ7cNy7Vfs9mw+LPW9blDCS96KF/mia9CcIPZrMveyb+4mtGH+d+0V9FhRM
X-Received: by 2002:ac8:7f4c:0:b0:447:f11d:3a59 with SMTP id d75a77b69052e-44f86b34bd4mr7567891cf.63.1721196697321;
        Tue, 16 Jul 2024 23:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196697; cv=none;
        d=google.com; s=arc-20160816;
        b=ysjBjnv0UBEygo4hd4OF4ep7jyT7y9tB77hYcGfYYmrQDByf0y0z5amcfV/iEJ4r9m
         SIXu8SM+ygop9iEdba5uAnm+7j6a4yCi/YQ46nwvlp3wi8yES27hHBH7MDqeTBqz/ruT
         1MOT3vTKHpzlanQagIsnj4ccs7RVnk7UXKWO1EEG9n3cyv8HT5fZcdgNqU6IinJD5TP5
         E72I/M0akbvFVwao1Z32b0gak7wH/lUfOSdKXJh1qTHhU8IsqTda8t3F53N2i+iEc6WB
         ++XONpv/1L2OJkQdz1zt/3Xo+k274nUUO4PiCPDFLialvsbUiF9FE6xl/X+s1B+nHAsx
         QA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R2XV0a88eGLbu1U/vWq9ttzcAxIlbjkNY5QMrMqYulc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=CCzcy1WVcXRQHVd66sW587EvqZqroaPsqt9kUoVkVYHJMp6ehlB0uZEMshqpfDRQpr
         Fb3Cns4jrWU14ZTohbZfaqyDyGRNdZBkqDMyDaqc7hbgESzEMT1iQBOhp1GCVCjYyJx7
         X6iZYaIT8SVGLG2f+AyxebShg6NUqidrJzd+j05EtEE0+cgigLSj2irFrSnb1Se6sKxP
         R2jZPY93Nf7gok3JbO+dJnn6Y99WLBP8kUxDzFsGR+83EbECOnIX42s5JiQgL3lAqdCl
         QFQhKR/19X0WUZIZ1N4SPC061jLKJpXtQS7voxmJxDgUAF/RUgwo2Ry5LI3FfEBn+eAq
         2Spg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3yKvF8A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b835f2asi93139341cf.808.2024.07.16.23.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:11:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3yKvF8A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTxrj-00079w-Vn; Wed, 17 Jul 2024 02:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrJ-0005M0-TI
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:09:49 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrD-00034t-PW
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:09:46 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3d96365dc34so4851417b6e.2
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2024 23:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196578; x=1721801378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2XV0a88eGLbu1U/vWq9ttzcAxIlbjkNY5QMrMqYulc=;
 b=i3yKvF8A5GRiSialPOKJEdvsbkG8FxW8uPQrzhQA5eFVX6+L8V8lpNwSEfWImBUcWF
 nOT6koPsSTZfyEPu+R/2R3quDI5OK3+cUdLEK32i5WrYD4Og2jK/4isNjrXZbbgQBtOq
 JoTiJ3dGOeoxl/Tt1HEUPsF4pSLiXqQRWf2F99plhqLMIMbmnHDbC+Y34S4jZh46YPH3
 pK4VbFsYvMJZrWCTjbzJ63dtWRYQPZiUQ/vYYexswyIONv7gakvi0+1bdbiXrBMONA18
 SRUoS2fylTHKFD/jTZh7hQVB+oUk6N0XCxHDMk1KJaV1JP1AWrKJeWUt0hDJd48XfRub
 qxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196578; x=1721801378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2XV0a88eGLbu1U/vWq9ttzcAxIlbjkNY5QMrMqYulc=;
 b=qChNBMmYfEd6pTn3SaUbEE3paQejZVLK9XPmOIf38g/mA3sk3jBDsthG69oKn9gcYt
 plEcVlkVCtSlGpRdhoPDe/G3h8KMBFVenCvSKy0o3zKjSF58MERIRvdTjW/jlTBOFJpg
 yzxrzvOhh9t2dQeeRP9gRyx/OBmM33beh/Nu58vlvj8kxsABIstPgVbESK2uNQzoTc1Z
 AA6OpUPnOIeM/cuage985BGtPpJBAMq6ZK/r4f4qAWHmxym2j9IWkm6sarP5PcWc0seM
 kwTxqlOok3mVpxnFp3oECxdJo2vbUewILcL6A+C02hFXmZLFzqvekxrVRGrVxikCB6AL
 DF+w==
X-Gm-Message-State: AOJu0YyH7KBbkPaFfRMbjH6FPjU44+YP2JPKyclSS7zpf8DigcKP2uTk
 PtOk5elhUKgxDborQNpeJ7x9eiXbZYs1UlixbK8muu7fbiaRDTH6VAyxm4Lru/Z7eVlP74Va/DS
 ucdY=
X-Received: by 2002:a05:6808:1483:b0:3da:b3b3:191 with SMTP id
 5614622812f47-3dad1f7c512mr988315b6e.48.1721196578203; 
 Tue, 16 Jul 2024 23:09:38 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/17] target/arm: Fix whitespace near gen_srshr64_i64
Date: Wed, 17 Jul 2024 16:08:57 +1000
Message-ID: <20240717060903.205098-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
X-TUID: iVhCLuTCtPTf

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 47ac2634ce..b6c0d86bad 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -304,7 +304,7 @@ void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
     tcg_gen_add_i32(d, d, t);
 }
 
- void gen_srshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+void gen_srshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 {
     TCGv_i64 t = tcg_temp_new_i64();
 
-- 
2.43.0

