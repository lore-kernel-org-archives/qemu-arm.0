Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp983881njb;
        Mon, 9 Sep 2024 09:23:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRzh59AZIZE8JtH/eHcTRBwoI/mw7rxFxmtU5EGXVlUQMsHpwgBwfszU+cwhjiTIYxxjaRkEJW0OK52w==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ7JLyusvsBVLt754mZORf5/38ZRUmnzVlKt/TIpNAgN1oEAv4jq5SXdhy+ELQX5X9PP0s
X-Received: by 2002:ac8:5f92:0:b0:447:f514:f2b3 with SMTP id d75a77b69052e-4580c7a5a47mr141074351cf.58.1725898980711;
        Mon, 09 Sep 2024 09:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725898980; cv=none;
        d=google.com; s=arc-20240605;
        b=WZjTRXt/a+wEPA7HcnDkbWDidVoUS1l1UoMeh2b9PDY9oitMDNRXLFkdygMlGh8RVH
         LTJIN9VaMkEqZd4ZfgPNrO2ZDCZMgQ3zWpGNMYc8dn90nnW+1ROC0zRlDv7fjC/B4JNa
         8WOsN2rpOn7LDWQ+t6TStDpugQpeznYoTH1usTNrJZ9u/R5Pd4XBWT7jJ+jOoXwL9nvo
         5ckTMe+yBdirASc2Pt+GlYHaZfYD4y5tffD0Zp6JxW2lhjM+kHDY8XgXUPCu6nve7r+b
         WSDt7VNmnCVFUrMa6yN6DGHSxH2f67C9H+3qNzqbLy/c36DCTecCOdGoL1VNkfZ+BYLn
         /vGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=lOQChnUkVXUAx+y325Z3070TgSIayRy3/U0PP6+k2eQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Qv9E1uIO41/ci4t58mUUCDKWmJCYlZFVo0mgzTi5gxOn/vcPhNc9mRj/gjf3TrimeW
         Tb97LxhtzryXtN5icO0WRhbmMmkHieOZKaWSgULnyq+CZaCD6RA9WxvtQU/FkEKB8WUW
         iDwOBmpw3wG1kFQz5dEnxPmTXTUqkGb6eoX5xnMwlCWJE0CdeYXiAsZPgtoyFYPmWfih
         xtaqOEsw9g6vGX5A7o7dno2vHqGoLhaMkFwHb/5YH7EO4usVFkljg/ylpZzJwTdJxCvz
         LZDXKcLmf+78bHR8yvlzzoMI4R8F1GDgx+f3BY1bBLLe5MSK2hIBWmVQef5yp1UA741k
         ewJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVYeO3FI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e7f6c6si57572271cf.169.2024.09.09.09.23.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:23:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVYeO3FI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snhA7-00024r-Az; Mon, 09 Sep 2024 12:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA5-00022k-FM
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:22:45 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA3-0007fj-4f
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:22:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7179802b8fcso3190196b3a.1
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898961; x=1726503761; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lOQChnUkVXUAx+y325Z3070TgSIayRy3/U0PP6+k2eQ=;
 b=QVYeO3FIIRQoxu3ylzAJF1i6s5asbRJRZTTY5UBRiS34gZct3XhOWowwlb+wsZ46Or
 88h7++ZCVKTEHYY7nc8Do564A8g8n79u7NCegQLu4ojPuaXMK9K/W7CY7vOB0QHiwBTM
 E6YJ/pSs6HS3ZqbP6NXt3xmBWfFWy2muhirWclzVnwweHTH/RUdhYtJYIcAfMIzu7IJC
 Zb8r9FITO6uNlhne1umCfX0MvKun1mmqrMsv8rFJiLx4jYURgDuTGTkBJ4dGqCqOsLvT
 UcJctbk6MXpbklQU6lHRoecsn81REFJbPrK88UH5MQ8ptBwJqlY6ihrf0dL5BhUhRCvq
 e3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898961; x=1726503761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOQChnUkVXUAx+y325Z3070TgSIayRy3/U0PP6+k2eQ=;
 b=r27Y9aSDhG3y9Gz8PmLE5mQLJoseziVVjG2ydupPXGvg4Qd/CpAAcJuhUbKeUELfZ0
 cLYbwNtNsczKDfHiNlkqhWYD53XGKbSEinz+4no8aGf/0qIl8/mysJO2NzGj5z6pXDbf
 E3SsuJy3CSEVQxt0ks1GtRMmyjPfIlT9Cl7cNKYAW2LVSyjRnI0FMho26Cw36gC91swp
 1QQmEJ9NLmIoA7e6vQWwiMyzpDFRrdV3VVU7dQuvQ66DXTMf2+L6uFlgLYE96nAHqBo6
 /eS8aiEZVXGQU+MZ9d0FG7qIXomt+76lZMn0miG9CNOxJJJc5BdeiE8RovanlMi7kqHx
 Du1w==
X-Gm-Message-State: AOJu0Yz4U9d1j4SRHBgnWKzIfQt0FRHPeX0IIq7A13IbGjQHPS58xYbG
 w3Jiv138FodVLbf9g8R8eLg9UqzwQL8wGjF1QsE+NT+InGhWjzSFf2fHm5altlA=
X-Received: by 2002:a05:6a20:43a0:b0:1cf:36dd:32e5 with SMTP id
 adf61e73a8af0-1cf36dd3526mr4864704637.15.1725898961310; 
 Mon, 09 Sep 2024 09:22:41 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/29] target/arm: AdvSIMD decodetree conversion, part 4
Date: Mon,  9 Sep 2024 09:22:10 -0700
Message-ID: <20240909162240.647173-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: A5mgESZgGAg5

First post-9.1 queue flush.

r~

Richard Henderson (29):
  target/arm: Replace tcg_gen_dupi_vec with constants in gengvec.c
  target/arm: Replace tcg_gen_dupi_vec with constants in translate-sve.c
  target/arm: Use cmpsel in gen_ushl_vec
  target/arm: Use cmpsel in gen_sshl_vec
  target/arm: Use tcg_gen_extract2_i64 for EXT
  target/arm: Convert EXT to decodetree
  target/arm: Convert TBL, TBX to decodetree
  target/arm: Convert UZP, TRN, ZIP to decodetree
  target/arm: Simplify do_reduction_op
  target/arm: Convert ADDV, *ADDLV, *MAXV, *MINV to decodetree
  target/arm: Convert FMAXNMV, FMINNMV, FMAXV, FMINV to decodetree
  target/arm: Convert FMOVI (scalar, immediate) to decodetree
  target/arm: Convert MOVI, FMOV, ORR, BIC (vector immediate) to
    decodetree
  target/arm: Introduce gen_gvec_sshr, gen_gvec_ushr
  target/arm: Fix whitespace near gen_srshr64_i64
  target/arm: Convert handle_vec_simd_shri to decodetree
  target/arm: Convert handle_vec_simd_shli to decodetree
  target/arm: Use {,s}extract in handle_vec_simd_wshli
  target/arm: Convert SSHLL, USHLL to decodetree
  target/arm: Push tcg_rnd into handle_shri_with_rndacc
  target/arm: Split out subroutines of handle_shri_with_rndacc
  target/arm: Convert SHRN, RSHRN to decodetree
  target/arm: Convert handle_scalar_simd_shri to decodetree
  target/arm: Convert handle_scalar_simd_shli to decodetree
  target/arm: Convert VQSHL, VQSHLU to gvec
  target/arm: Widen NeonGenNarrowEnvFn return to 64 bits
  target/arm: Convert SQSHL, UQSHL, SQSHLU (immediate) to decodetree
  target/arm: Convert vector [US]QSHRN, [US]QRSHRN, SQSHRUN to
    decodetree
  target/arm: Convert scalar [US]QSHRN, [US]QRSHRN, SQSHRUN to
    decodetree

 target/arm/helper.h             |   34 +-
 target/arm/tcg/translate.h      |   14 +-
 target/arm/tcg/gengvec.c        |  121 +-
 target/arm/tcg/neon_helper.c    |   55 +-
 target/arm/tcg/translate-a64.c  | 2081 +++++++++++++------------------
 target/arm/tcg/translate-neon.c |  179 +--
 target/arm/tcg/translate-sve.c  |  128 +-
 target/arm/tcg/a64.decode       |  257 ++++
 target/arm/tcg/neon-dp.decode   |    6 +-
 9 files changed, 1377 insertions(+), 1498 deletions(-)

-- 
2.43.0

