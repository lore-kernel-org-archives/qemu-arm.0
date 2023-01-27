Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1339015ejc;
        Fri, 27 Jan 2023 09:58:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtk+NQqqqgnlFjAwxH9UwOVo6tJGHO4tS8kg/+LT3kRmriIZZMq4hLt6L+J+a5nCfjP7iF6
X-Received: by 2002:a05:622a:22a6:b0:3b6:2b4b:5688 with SMTP id ay38-20020a05622a22a600b003b62b4b5688mr60894239qtb.11.1674842336647;
        Fri, 27 Jan 2023 09:58:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842336; cv=none;
        d=google.com; s=arc-20160816;
        b=Smgs/zpVNeZw0jXuew+mGcbngfKSSFEWBguYPnKKo1RADch1TjDk0qHJelq86ii2hS
         KUJWI1HIBaYV/y6SNRwpvlqNa0O6qGR93ZZLwXNYAupnWEpswlbjbEJlQoM55DOBoFPM
         lU6SEr7e9ssxBSnkAlpgzkU4IDE2CnW4x6QLgcL9+pJLZFf05fEAc8v4+DyJwUAN1EZo
         1wQupG6lGyauW6/8x9mMYOkoKQgLQr0dB9Jl35zyrAD69aX6gZ1/AoBb+5tEzBEGF8/9
         xDXWQKs7r2QDA30u2ReSWi05/8qYHa+ueE62OWKZ+pSrkQNN9ltSPajbNnpfROfemnRA
         M0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zdjx41xGEJWHuXAOMwfC1PKZLRxR5ZaPbQIwstZaQaA=;
        b=uvw/KdCKxUXOvmPrbKv4EoBs5SnHEdDVrajm3tUBOQjPcCwvL2XzYr3bBrizBHMG6+
         fVtlA/d5C0pQLuAktpYjyzOzi7StLMa3U7Re8RR+i1RTm06hzZV6En4/RxgMuAMz0h4k
         Doh1IduenInG6nVqbSz6cUXegQivDaS6oJQFjiZrZOUN7Wsn8si4Jop+3tSHxeXOy3Qe
         Dtps1RZr9u1bJHktEPmgpQwXmdMJbcXJpAKMVQF1Qa5/RMTA/CRfFOXZNz8mJb1tXsTq
         1g+pOGQNPSD5fJeSYWEK3WAawS8M69YV++AvTGwj18O72z8iimnrlJsj+mmU0uFrKyDH
         kkjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sK5xPSca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18-20020a05620a299200b0070fd3a476e8si3604604qkp.33.2023.01.27.09.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:58:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sK5xPSca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLSx7-00013q-TM; Fri, 27 Jan 2023 12:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSx1-0000xb-Tg
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwo-00066c-Qz
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m14so5215552wrg.13
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 09:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zdjx41xGEJWHuXAOMwfC1PKZLRxR5ZaPbQIwstZaQaA=;
 b=sK5xPSca5wFXODqoHTHNvMNPmQi7vO29knbgLsugNHWpgkwkG0KLdAr8LNSnnftd1T
 xt9zbRi8eP61dfFf3icjRVw9EBuWtrn/L2UXLXvj7IEhLF5NAwrzkAu0oLddc46RGH1b
 NjyQFxRI5ii/ymtzEsQYW6m6ZpyBVI5gBr/hWYWilKOKsqMNYoewYsghzebLwswcsA/D
 sscBFnYmsWvUGL33cv3O5JX/wQZxykEtDcM3DSiJ8Cjje3vTuJuc13BK3WqJlcSMWW/s
 BD/9zTYWe0D15NAr7EJrQSUGYtUXHVAhcwpaRFWQbW7Kd/PuCULqaPyDk5QioLJdXxzX
 CumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdjx41xGEJWHuXAOMwfC1PKZLRxR5ZaPbQIwstZaQaA=;
 b=a2oQtmpjqfZgu1BZbrx5eSCvQFQqQ43QM/QyOpyX7tKKk4bJajERgERq93PJ5dw44i
 inhOuOpKnnhOruadtNCqvuKhMx912VvPDmAEgUGODmB3gbsPr4kWSSfR/GASYsJMqWsS
 CM1jqmnjZMS6KNKuI7l/YXO+RDwDibrUbfdJQP/TemVVbPoeSNNRhR41Yi2YuCQBEjLq
 2IfQ1TcZzcp6CJ5bgqBLss/nNOvWDiPwDNFCJXNF5+J4x8yoGVwotqCP0VQkG4eftRCW
 2AKVsttN7aJ3PgUqvq+5s20Flcg6PbKmkquxW4xBXPImFXL64v3JIEtGzac1Hz56ANzi
 WpjQ==
X-Gm-Message-State: AO0yUKUwQwUT6Cjoy7eQckN+bdo6xzEMPTd0El1CJBiZDozGkJXB2Mxs
 bJrJOoXah3i5lQIaPgWqlDULzQ5yv2G2KHyX
X-Received: by 2002:adf:b101:0:b0:2bf:bf27:2dd2 with SMTP id
 l1-20020adfb101000000b002bfbf272dd2mr7649087wra.45.1674842133664; 
 Fri, 27 Jan 2023 09:55:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/23] target/arm: Enable FEAT_FGT on '-cpu max'
Date: Fri, 27 Jan 2023 17:55:07 +0000
Message-Id: <20230127175507.2895013-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 35JjRIX5wWeT

Update the ID registers for TCG's '-cpu max' to report the
presence of FEAT_FGT Fine-Grained Traps support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b33d7c28dc1..c76555f51a7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -28,6 +28,7 @@ the following architecture extensions:
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_FCMA (Floating-point complex number instructions)
+- FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FRINTTS (Floating-point to integer instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb5..4066950da15 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1224,6 +1224,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.34.1

