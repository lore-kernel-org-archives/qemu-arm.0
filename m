Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1382626ejb;
        Tue, 19 Mar 2024 08:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVej7bXn9im/m0a/4Nlyqqh4ien6h+xm2TwUzEwy+q2gfj51BN/dMykrMRyTynF+Lt2u1poTfRkKd9oqTWpKmD5z4wcMgO5
X-Google-Smtp-Source: AGHT+IHgRWyyqW6xJmrVXztKcXJsxWJWxnRxAvQUTqdpdw96hnYjTs48lQ4Xcs6RgFdF+etulnT1
X-Received: by 2002:a05:6808:1381:b0:3c3:75a7:b5d7 with SMTP id c1-20020a056808138100b003c375a7b5d7mr3241351oiw.11.1710863078663;
        Tue, 19 Mar 2024 08:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863078; cv=none;
        d=google.com; s=arc-20160816;
        b=Aw/0ttktEdhDWBWOb0zyjOaxR8E0QYzHrtX86qBXz/4wmJCdSo/IzLod86BGIoU5zi
         beD0YE8p78WLbOTn14qyxXlNsdv5abvuP3V8z0TvzmdbSvNcBPFZTOQ04++rv3rpQLMp
         J6x/p/zAOyT6/7scGLbBYG4tYagg9vCsUJtz3vZzDi/kXteIz51QHrr8+3JQTc269guV
         3rWzyYHUcnXh5IYZGChLwZOVyTCTfsEDbqgmp1nKSlLDT+f54/Nv8o1teU/PFSnQC3zY
         MiLOzkjHi+s7QQ/T1VNr5P5BiZ/OcUaQ4ctF305lSvxj0VKG/B3oL3qJEic7hzpHhjJ1
         2snA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UuEAK7pSccwrCzu7hxaK2/2f3QdH4s+KeUETWrTDkmI=;
        fh=5otLBgcXbaLl3s6KB+oO0lwV6WRL8VOsLRWlJoqSt+U=;
        b=qgYyEAJFcKZvJIeHUH55ClZqmJPpi4sMyS11UWEWpVh+ykE2D/jVDdM3IrRGm2QpFe
         3WsHhumr6WwUfWImUgR8+ikdbDqmL9pc3h5mvP9MwXmlA7n8rgGwuOND+591O8pqbNCB
         NRyDvaSx/aPUXn5FFu3koeFJuoOvYe6gQiqMKGPSBj1pgSpjvoJpNeJfk4yHE/m4/FLl
         oSX6RbXhWmdqIvLrRHylUyfhpLlLlx4BC6eS+EVBa5rzj2VicP5yfOAwlrK3EnpPcV3C
         VM+J+1Q1KMsJql3OzCYZN6iN+PMJj56rqGzPc4AEq7L56CZFKn+npT4AsndTphWCROnX
         zz/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwRJUTyv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ev6-20020a05622a510600b00430d300af0bsi4605088qtb.91.2024.03.19.08.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwRJUTyv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbcS-0005EK-Ey; Tue, 19 Mar 2024 11:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcQ-0005CZ-Ac
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcK-0004lM-02
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-413f4cb646dso37781235e9.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710862986; x=1711467786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuEAK7pSccwrCzu7hxaK2/2f3QdH4s+KeUETWrTDkmI=;
 b=HwRJUTyvxHIoyfcsI9rTdFZUKEObmCEulrwneWFcy8lKikqBS3H2bgpP9xEAijpsjo
 G/3sLRDVKMFhVzSCChyfLxIJFiLnIosR/gJQai42DfiArhp+3pe9dcNpMXsGP2y753bH
 2484zeTOLVLqnXQ3fwBZ1cH1ZmbgqbO8FqRW2+D99i2nzPN5CuqdrqiWOVEsdy20b7m9
 yrsXwSe7VKQH1hMobtNXc4FZIDItsXgS//Oq3P2o4n1KKFG939e4/tE/rEl/dnmy2VFz
 ejV5pBW0tleLZl7WgHPAkieyQthuZL1W5jKE3dLbJSmfvjK3mCNDU4fxYfkE2bi5GVCD
 aDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710862986; x=1711467786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UuEAK7pSccwrCzu7hxaK2/2f3QdH4s+KeUETWrTDkmI=;
 b=g4ijJp13ehuV7zgN+tu6fQr/mwEATiBA7pycwM/aO1+SPuF5ogwyS3auUjbP663CD6
 8+oz3xuRRFLbh/4ygGbSwHNUoGYMOEFNfJW8r1dv16PP98yJYOhH9qX5N0OsuVuo3k0w
 TIwbzMHdpAas95xaRewrd9tx2W+JaRf9YtIThsAu4kGxeThDbKmiogIbP6o6Jq4mGKkX
 ZRFKotwGtXf0Fqoty9C/pQOPHW687XmEs1X+qGiYN3dTvcNeW91hXFRB61zTyBc2GHra
 kmH+Pq6gTwUApLaeZ7XUGjBrIArOmCBeQ42Xhwx/Wxynf4o8H7dfm7p/p15OQQ/Ty20v
 Oyhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeDRRJB52QMI1JNWxtfBeyqfEl/J32QqmS0zBL2wJQTbs3vzakj+Pl6iNjgsY7/Ni2S1VVptcYU3dS+pyRjlb7EC30
X-Gm-Message-State: AOJu0Yxy4fYLvVLGyT9mRLjgEUu9xqdm6kBA+A7EpkY7c3g/+5d0NO/D
 y44Ex9Y0RoX1qBfb+P4hpwAzcSY1kmVdZq3Fz56XLqVfLt3wKm9uwQenJVjFZsA=
X-Received: by 2002:a05:600c:a47:b0:414:860:bdc9 with SMTP id
 c7-20020a05600c0a4700b004140860bdc9mr6982443wmq.33.1710862986594; 
 Tue, 19 Mar 2024 08:43:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c4f0c00b0041409d4841dsm10415982wmq.33.2024.03.19.08.43.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH-for-9.1 01/27] accel/tcg: Ensure frontends define
 restore_state_to_opc handler
Date: Tue, 19 Mar 2024 16:42:30 +0100
Message-ID: <20240319154258.71206-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: wTZzR3iYgLUR

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5c70748060..987e6164f7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1069,7 +1069,10 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
     static bool tcg_target_initialized;
 
     if (!tcg_target_initialized) {
-        cpu->cc->tcg_ops->initialize();
+        const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
+
+        assert(tcg_ops->restore_state_to_opc);
+        tcg_ops->initialize();
         tcg_target_initialized = true;
     }
 
-- 
2.41.0

