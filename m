Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp632409ejx;
        Tue, 22 Aug 2023 04:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM9MZAJhzy9kvJIXT1T9o8F9ik+IIyGzuOHpFZGAsE1Dfi/O1osl7e7eueUqCNeRUh5DhG
X-Received: by 2002:a67:fb46:0:b0:44d:55e6:ef28 with SMTP id e6-20020a67fb46000000b0044d55e6ef28mr2955746vsr.1.1692702135384;
        Tue, 22 Aug 2023 04:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692702135; cv=none;
        d=google.com; s=arc-20160816;
        b=ruUigbQ5F24aRJXLMmjMGKJLI+KlDyb0lHgyHgYIRMrVkGQ7/agPJKep7590HXKHUX
         niXwW+aQ4r4p+loJQA3q/J7cBWop1gqCknbAG7QiplmV9yhKdgVT71pHCBrrU1JT5Tc4
         hHaBh30ccqhHqvkvftx5Q93GWX3TfShcO4/hWEjoWJf1Z3d84NxKdSRPWxa7L8O6X/Vl
         U+S+XzJ9IpRe9qNeXd/x98JTvJUhVdTpQg9ZmfHuWbXLmOcDucTG9A2PpL3rJX/xp676
         ubseDyUS+TiKo2ZudGArXRfpumcfsdmYPjk0FEqaEgm0XTC0IN7zFGWrQusPSU3zK1QJ
         LJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1sMs3qGzSrhdLqdng/d5ESwTL5bPH7/wEcHeNoDe2OA=;
        fh=nNMMnsLJfx+wwcL6Hpjyue2kO7c5wJkFUZ+p5f7qT8I=;
        b=al7P2pqz475uOxFc8MEJkhrDo8w8VYRiuWQcsSj2p74jUMD+HnfzxXlGG3s+2reefZ
         nDfLpDRpFNYdBt/uVE+er9Itr4dT+OJ9WoT6NwOAqdfEE11katvWWVwBTCoCKCGA96NK
         HWga6h3kJ1HTn10OhR7+fxICU/04PaiHCyM1PVipln9bwJXXcebBARDRgNC0PBpvsVKw
         HcUpcD37wpix3AisaURbIpJp/+Lxgt9uCgfhj38/CSY7jROktAXMhMgHZHN0+glYQYw3
         HIUFtvmPBSmKgDy2Hv+gTqyVrk3AsjKMUWM73RHAPL9G42IEGWfAkKLpujmlUifAvRjE
         lSnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qmxAjfWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020ab07c8f000000b0079d86b3ec28si707191uaw.199.2023.08.22.04.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:02:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qmxAjfWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYP8v-0006Ao-6S; Tue, 22 Aug 2023 07:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP8o-00069G-DE
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:01:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP8h-0003G6-Ss
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:01:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31ae6bf91a9so3354584f8f.2
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692702094; x=1693306894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1sMs3qGzSrhdLqdng/d5ESwTL5bPH7/wEcHeNoDe2OA=;
 b=qmxAjfWv3Kw0l6jX0VfZuPUp+KQbu2g6oiYeeE7oAhjbVVS0vkyrs2W6pYcZ+GvoAS
 BKjexJ8x0QZ2Vu27PMadNMcUYBykkqaOeR2VZjBVdlz9ZJH2XNtlJ5hOmBRd1dRJwCrK
 WieXuZSvrqZQ3kSHp3ZdUuPvC4udCB9Q/kYmJhfDpIveaPpdMtj+gUzoBH1j+BtzQRLz
 xczhlgF+Vn349aUOKghQy7GZnvWrep//0kwY0LyhxG+G1otX8f+19+57Is9BzLrn4sfn
 LOVZvaIFoiy77XJZHU2byv4YxYk86UzLy5L7j4/29z7PXPIzklKCrs/4w+baAkP0P0q+
 D+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692702094; x=1693306894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1sMs3qGzSrhdLqdng/d5ESwTL5bPH7/wEcHeNoDe2OA=;
 b=ef75iCqBiLmacaTNbrFqKvltNyuRfJrhPNZ3fjQLoKmMGj2t2MX17lmweeiO0A7nNN
 bCO6rPl3eYnCX2I5QPX1piXuqSDIf7mt989CEshlsg3ZYaNtb9M4++SG1RMAEoIYAVu4
 hB2olI3YiVFnrpfD9Rg4Z38vlS+wmNmeULuZFzqk9XiiKrTb7jLeYQ8F5/c0arnP3hft
 DUowURlBFCiXkJZrqXjXFLLaADnR/IXGnHrPMSsNAx548dZllMYSK3BCBrHNQG90RjzW
 bIsCPMArfKpgIo9kdXOwS8nqg2doFIfkC4f4WkxCXZsridO9/G5iKWoj7u6xtiRbTjwh
 9eAg==
X-Gm-Message-State: AOJu0YwKj6MMxxsHqMM49ezbLiuR2EmHrUDZwXTghzcmc2XsP13B0A1F
 dCUeaKug07yg4YKtwue4gbBLsA==
X-Received: by 2002:a5d:530a:0:b0:314:15a8:7879 with SMTP id
 e10-20020a5d530a000000b0031415a87879mr7595177wrv.34.1692702094175; 
 Tue, 22 Aug 2023 04:01:34 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 h1-20020adffa81000000b0031980294e9fsm15405183wrr.116.2023.08.22.04.01.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 04:01:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH 0/6] target: Use TCG generic gen_hswap_i32/i64()
Date: Tue, 22 Aug 2023 13:01:23 +0200
Message-ID: <20230822110129.41022-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: Zgb1obXrtBC8

Some targets open-code gen_hswap();
replace by the generic helper.

Philippe Mathieu-Daudé (6):
  target/arm: Use hswap_i32() in VREV/SMLAD opcodes
  target/cris: Use hswap_i32() in SWAPW opcode
  target/microblaze: Use hswap_i32() in SWAPH opcode
  target/sh4: Use hswap_i32() in SWAP.W opcode
  target/mips: Use hswap_i64() in DSHD opcode
  target/loongarch: Use hswap_i64() in REVH.D opcode

 target/arm/tcg/translate-a32.h              |  6 ------
 target/arm/tcg/translate-neon.c             |  4 ++--
 target/arm/tcg/translate.c                  |  4 ++--
 target/cris/translate.c                     | 14 +-------------
 target/microblaze/translate.c               |  7 +------
 target/mips/tcg/translate.c                 | 14 +-------------
 target/sh4/translate.c                      |  2 +-
 target/cris/translate_v10.c.inc             |  2 +-
 target/loongarch/insn_trans/trans_bit.c.inc | 16 +---------------
 9 files changed, 10 insertions(+), 59 deletions(-)

-- 
2.41.0

