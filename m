Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp184964ocb;
        Wed, 5 Oct 2022 20:39:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5L6fvYWOK4pr5Hl2EfHLEW3cil7AHM/NCFxYT7xNe1UyXakfVFin4h1hMQEJg5780i8XZZ
X-Received: by 2002:a05:622a:493:b0:35d:52a6:2689 with SMTP id p19-20020a05622a049300b0035d52a62689mr2000085qtx.595.1665027575844;
        Wed, 05 Oct 2022 20:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665027575; cv=none;
        d=google.com; s=arc-20160816;
        b=mpZ6ba7h2A+9NegG6Bdqjy5Hc3Vn2x512hlInaNgxX9reF2G7uJRn1oWF4fNc7z0oS
         sx1cMldQcD9tzo1w1vq4Mj9ETzXV4R6OwENfJdAQmL+sLoP9LuOWohlvtNfGCe6RlGlI
         8vfwJNIT37h6SdUr+vtdxJdF98LoTKiujFj3TAHD2cujszDwpPzdEUJ4DOqCfX5B/adc
         jbyV0Z+Gcq3A7Xnrgb1NCk/Q4l+2GZo5cjWJ7WZiW7Fzhxa0T1WpQtxsF/3ASs76ed5K
         Hev9lUYd7DgPCOiEeviYEGD77AYZaDrCAqx8S4QkJ9rSOtMMurbtMm/PaoKxvtxpJKlH
         X+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DGf8LRX7S3EksZchO2LnoxpqxoM5tSgIISmIB+gyccs=;
        b=Ma7sdTp+6A3pxKswQ2fFOaAoXN2WTulyBi1rSy5k2w6M1qO9CBbq0Y6Rdwrf0GK5v6
         +CT2Xx7LFXU0rHyuQVRTi7vKeU0TMjguW31EQyDGJvklIiCKJZA7CZlibZZYAgAmryZ6
         RGEwYXeaOfq70DnxvZ3maJDyVzECupychHpjpPiDQHJkz0OefuDz9J4hRcGHtlY111y5
         puk7xyIkqPdsKwVOl2XThIsRuMwYKUCIcB11m/yce7z6M65KFw61dcVWrUtmGsDPJee5
         Z4y62O+8sgpS2ZlUM9DrnxB7olp/4HqU8Rk58wXdbvT3AX+qwzHx9dbaKv1UVaDWmBPB
         TH8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TogT6ucr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do49-20020a05620a2b3100b006bac23443b0si2332164qkb.443.2022.10.05.20.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Oct 2022 20:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TogT6ucr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogHjP-00033t-0x
	for alex.bennee@linaro.org; Wed, 05 Oct 2022 23:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiq-000306-F1
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 23:38:56 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHij-0002tu-4Y
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 23:38:50 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 x32-20020a17090a38a300b00209dced49cfso634161pjb.0
 for <qemu-arm@nongnu.org>; Wed, 05 Oct 2022 20:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=DGf8LRX7S3EksZchO2LnoxpqxoM5tSgIISmIB+gyccs=;
 b=TogT6ucr/uB9bxVFKuy6eg5Q57YZ2m+iviAVspi3k2mOxHtLMJVelCBO1nygB1wbAm
 CKFhbMWqjeeFiecT2LiwwvvnEZsL2bid6DVPtUO/6lQPvSTzTWe/V8CN82aftkYCSVKB
 Q7f4aiXpwta6f8N3tileTVyQa1Z5k61mPDrM3KLfMKa8tueU1phJLFmYeMAr3/n5Zo2s
 G7v9vqUbDYRx7pYQ37g5w2SP5rmMrZClKSv9IUWgX+D5dUZIqP6Xyo4ARf8FX/K7VBq/
 AFY7ea5jYHZjvRrSyw1w+zj06b+jHkP3dLDLTaum+LFFIGgEsezWepsDR+5FPCfAt7ZB
 r7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=DGf8LRX7S3EksZchO2LnoxpqxoM5tSgIISmIB+gyccs=;
 b=Gp+umz2TEYKr0UWUoe74cTu/hb+q4Med+FLislcKYB4Yx+MMkb3Z9/OnQAbfCWN2Og
 hi8xVnKhXwInHZDlYzjLtusOhd4A9zW9hJ3EluHukBO530B4IKFYvdTTvhihHqBuQva4
 D9JV3uMEsmPTFdNwgPmYT/ewYOtVnWaCBy9MW0bcToK/lJI5IM3gz+lcWfNQFcnOvdx6
 YJGVuo5/zs/qnidwyvQ6ou8f68FJi1wSHPBmnvAf7c4UgPUppTZar57AYCqBzXXSS7tA
 DQJ086TjRJJynX8eX1vbxE5Xaoj0Lf7uo8hBUtvPIv0uz3u12VSFMdfPFCPd606NuXdz
 McVA==
X-Gm-Message-State: ACrzQf0Icj15p0pYgQ4tkDTSjhFt11A8kp6LxNmnF2HNNOvPEA7SbOk4
 gdDBkM711WCmUlsM4vjiH2ctsuSxcLtdyg==
X-Received: by 2002:a17:90a:d181:b0:205:e100:3000 with SMTP id
 fu1-20020a17090ad18100b00205e1003000mr2984067pjb.184.1665027527496; 
 Wed, 05 Oct 2022 20:38:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 0/9] target/arm: pc-relative translation blocks
Date: Wed,  5 Oct 2022 20:38:37 -0700
Message-Id: <20221006033846.1178422-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N3Nm4PppsZc9

This is the Arm specific changes required to reduce the
amount of translation for address space randomization.

Changes for v6:
  * Minor updates for patch review, r-b.


r~


Richard Henderson (9):
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Remove gen_exception_internal_insn pc argument
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 target/arm/cpu-param.h        |   1 +
 target/arm/translate-a32.h    |   2 +-
 target/arm/translate.h        |  35 ++++-
 target/arm/cpu.c              |  23 ++--
 target/arm/translate-a64.c    | 174 +++++++++++++++----------
 target/arm/translate-m-nocp.c |   6 +-
 target/arm/translate-mve.c    |   2 +-
 target/arm/translate-vfp.c    |  10 +-
 target/arm/translate.c        | 235 +++++++++++++++++++++-------------
 9 files changed, 303 insertions(+), 185 deletions(-)

-- 
2.34.1

