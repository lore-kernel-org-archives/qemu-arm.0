Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3707994qtb;
        Wed, 2 Jul 2025 05:41:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUq9Q4X5i+UvSkEvkv7qeNP73NosJ4pQMfJyB0Td6IR3xX8Gx87TyohZpJJg+Dt3DFMhNE2JQjGcZbt1g==@linaro.org
X-Google-Smtp-Source: AGHT+IEqgbwFyHJLdYa7oUCMjxRNaKLfCI0Wdx7Iam6dHg/rrd6y/Ac0xppwrFtGHPsF67RNXe94
X-Received: by 2002:a05:6214:20cf:b0:6fd:1b17:fb7 with SMTP id 6a1803df08f44-702b1bef0b1mr38588126d6.31.1751460091023;
        Wed, 02 Jul 2025 05:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460091; cv=none;
        d=google.com; s=arc-20240605;
        b=QTwEi2ZGh5d+1ADtq+7bMFGUQWqdxtexz7QpZWFStGRvy45/BL7rllAJ+6+97ClUAi
         h36B3Dx5ydBCbwjwYFhwE9SdGp2HKtl820SyaEek1dXkZSnNF5ViMH0552ugU0be3Uya
         bJ61ufyxbNuxkYqczjyArjJQk9Z4OH5+/q5s+Q+hAKDZBUXrhn4pT+730nWhl9SUtH/a
         nMJjgi7QxDMvFoXoUTUv6hLkv9/AvbM6g9mgTB5P2614hfzN73luxHrNf9dfHjTExgAn
         b2UlI8/FnS2hTwMuzoEeSFZMEBuFVm54z4Kh+FMezpv9LbWarFMqI8EdPmzZnicTwytU
         REyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ob8WLFTF4cO6kk67VpmnTkWMaiDWY0sDvi0v1KaZQwQ=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=PvN5rtNUJMOv+jcF0ApaB9VwOUw+u0A/mvCTpmnCypA6KxHsaFfv/zVwk061eJvdBF
         Im5/n029Ufbi0D2Sz1AoIok50OArL6tlADO171LgALJ9UlRSdGpezVTuONT24bd5j/RH
         LP5lslfVD8CdZYXX3+q7UE3hj9TavdWH9RwvGlMSVssTVfxfnB0GctY3ebp3M1IHXPtS
         AswIiNh3zDsTlUmqDmM6Rv1AbZl1b3inaD6ktU9G5U98ukUQqtpAO3kRIgdBfAhwbaUd
         WvUx923JnvUvWm8s/LSl6tv0WPFgB/DdqCDgqoHuwyyCg7dMLcr2sVDXnxjaXYVGty+v
         MtpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PcEqZoBl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773ae2a0si137907406d6.462.2025.07.02.05.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PcEqZoBl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWwgJ-0008Hg-Kg; Wed, 02 Jul 2025 08:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfq-0007eR-VP
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:34:52 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfa-0000zl-0H
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:34:50 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2d09d495c6cso1490575fac.3
 for <qemu-devel@nongnu.org>; Wed, 02 Jul 2025 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459671; x=1752064471; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ob8WLFTF4cO6kk67VpmnTkWMaiDWY0sDvi0v1KaZQwQ=;
 b=PcEqZoBl67ZHxDYTmiczBp8AhYOufAgIz2rToPmCNPwqFpRqAuvYgtUiIelJMI3pP8
 5RwPnwN+h8Cw94V4qGMb3UrHgsMwyxL64VzQAVG4mXr5mOd4IFx/hqyz4a87okpuFql9
 Xf03N2FW03VdgmEwUxXBiO3HQ0MP8Kxr0hy8gJJIXo3U1GQkVWHWZKGKW2CxQ+Y/+MVT
 viQPJPxG8rp3RNbByujeBMLxKt6QTMKPa2gN2smVfI/pUpc/yZ7AcTIEwsn7l7+mi8Ru
 CuOhw30ivBWxdd45nqZQXQd8uPj7uhUFviMxa1H3xFY2UryxIBot0SOSlaHLslke2mFr
 wYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459671; x=1752064471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ob8WLFTF4cO6kk67VpmnTkWMaiDWY0sDvi0v1KaZQwQ=;
 b=CxmZ2amvLLCGVlKlCOLl3ZP9tvedyDyZpckK6JJxLGPx+FnWQ71AKuwYNvEmFa0Qcg
 /WLh08EZGx1+HzfTzOC8ZIcC3YgpmRv9mhEYdde6rWdVB8qNCpzAzU/wcgGdv55Fco1+
 Bcu/4sj1zVe9P8l9ExrlS7+MSbnMDKJK8mLt7Jp+qy7RVn10JPHoVA4FwdaO1yYKUyff
 ppgIjN25qTLlXPHd9yvO/1/UUswtgES4MPOIpctXrffPQFfixUlpkYwSLZuCBjCjOxfI
 eOEV8q20fXYi63Msa/8bH0VmIc/lEW4JWax9xu71BYf4sXDJxLci3GOt5eHvS5bOmCYg
 h+6Q==
X-Gm-Message-State: AOJu0Yx0Q5tCzCSs6h+dbdy4LCQF2qzEbzbLQe4NnJ1UG+2OZzdoaSyr
 XAdEg8wAuu2ipSvCrdIn3wx5Ia285ow+Fsbwot0a+l+MPARK6z7tJmkKLxeqDqGqK2u+nGCc+QJ
 7OjU/io8=
X-Gm-Gg: ASbGnctvLXwpTOrJV/Jr399O5lcuaZXU6srpHrGCA9sKPQtmetjjHPj+Ie2KXqtbyVB
 UW1NRqN6ppJCeNlLPP8bMN3ZESLxNuFZxz0Pl/9Z0cHaLlmsYHd2yjABRa2Y3aeUUANQ86V+RJ2
 T4dommbVITTzWKj7tcbE9XF4QeODjecfnLyHO288EYQiX31HYT2igdwHEmIRk0M5spG4g71gsYK
 264hCsEpaSZwc9Iki3M6lG9JMSdWxPOabfqY6HwdRVVtyZK61XicAQDNr+/ogQIgU3bykPUgTQ4
 hbAdUfAjjsVxo0hh3n0PhBwFvS/YQR3l5eAbhM7Lo0nuKmL0OM1Co2I8YDmRd8lPmMoCGfevEkl
 Gdas8
X-Received: by 2002:a05:6870:328a:b0:2e9:9b1d:d11e with SMTP id
 586e51a60fabf-2f5e86ab791mr1987870fac.38.1751459670928; 
 Wed, 02 Jul 2025 05:34:30 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 14/97] target/arm: Introduce ARMCPU.sme_max_vq
Date: Wed,  2 Jul 2025 06:32:47 -0600
Message-ID: <20250702123410.761208-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 101O4ySRp33N

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   | 1 +
 target/arm/cpu64.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2f2c131613..b5c4fa1e80 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1118,6 +1118,7 @@ struct ArchCPU {
 
     /* Used to set the maximum vector length the cpu will support.  */
     uint32_t sve_max_vq;
+    uint32_t sme_max_vq;
 
 #ifdef CONFIG_USER_ONLY
     /* Used to set the default vector length at process start. */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c5c289eadf..8400c7b567 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -343,6 +343,7 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
     }
 
     cpu->sme_vq.map = vq_map;
+    cpu->sme_max_vq = 32 - clz32(vq_map);
 }
 
 static bool cpu_arm_get_sme(Object *obj, Error **errp)
-- 
2.43.0

