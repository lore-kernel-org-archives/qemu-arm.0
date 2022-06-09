Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp680874lfb;
        Thu, 9 Jun 2022 13:29:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGM8UNSVBefhkFeD6aMXVl6TXvFN9Ej992tyZ7Q8LW1RgzByiFgybPZqql92+DZIYCOZ9r
X-Received: by 2002:a05:6214:e64:b0:46b:9c03:4fda with SMTP id jz4-20020a0562140e6400b0046b9c034fdamr17955089qvb.46.1654806565792;
        Thu, 09 Jun 2022 13:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654806565; cv=none;
        d=google.com; s=arc-20160816;
        b=DEvWrVNR0/VQ7j3G5kvGwdNrNfGk7Geo0hqwjWqWnNezKK6VFV0J8v+W/tQNqtsn6g
         Dakcw4EGDt1VxO+XCtD7KIkeuwNFCB+NfiSOZUyw1jH5hDLyoK7y05TpQfMBPMGBa9dO
         odSK2qTncbLSvvL+ERagySx9GPdRG/UV/PFOAHvMRnPPOkudRhVgHxMbzAxCT0JjQafT
         cNDP7WMqDU0dlDGk9qbJmqKiqN/ZFT5Yf8ni98359vqIv7vw29zabrTWiGLfi1zphfm5
         B7pvUWyiAon8sDUO/gsYPD2OgjbGt2zsSLodJn6fkp6QzX2H2mJPblgXV++VpY/YAiNr
         2CBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WdNppBEdbei6b2OSfenKY9YTOl+LPHyij0Nj78kSrVk=;
        b=FBVvHYHwtM9S84+FeAKI+M4ZRk2UhQESwWVH6lXxyfytKA/LLs6dfeNWqF5K8HsrEl
         jGbgppQCxOwQX3/zI/KMxbSF9+JtdVmVx46E01ktRmWzUbnXjSCi4EJezvFjh0xV6cAL
         TE9DnXN4XIazI3FQ/M1ExnW3zXKdl520Mgdi/JIHI3zGi0jju1jzmR36ykBmfMJ4E7us
         bzsyIGeZOrl8ytxeMks3kjY+uHpzi+obb0Q2HogA1QnbJihcUKDveQd/SWerOL2hnL1R
         9i2k98tT6qbJX9s4Zzfii3LR1xfoZipefTW3QxK108p0Z0vNnTDyEvc/MQAW6hzUvNmz
         m5cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHE3v9iR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac85715000000b00304d7296f49si12512556qtw.11.2022.06.09.13.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:29:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHE3v9iR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzOmT-0003On-4r
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmA-0003OJ-4e
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:06 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOm8-0008Pt-D3
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:05 -0400
Received: by mail-pf1-x432.google.com with SMTP id p8so22038910pfh.8
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WdNppBEdbei6b2OSfenKY9YTOl+LPHyij0Nj78kSrVk=;
 b=MHE3v9iRYf+IdpS992xroHLdQDwd7J56/Petr+KNDwKj9ARy5sc5Lq7aETvjvC8INB
 oOobSQb46eW7IPAZs8DjxR4Neg7Xv/Z8qauxXqOxbIf1IfVP5+5lXKLp/7E21pRxbfXZ
 v6J0LKgz4rXy/65MlXtPE65y1i//nQiB7LNAv9spLzHQRVsoGI6SH+1QjvWV/M0plRCC
 kc6Zxu0TJHuVQnAWr+WhcUhW69jFzwZHe4AGxRVLGx46u8V4Ob38DAksMfASX3WShMOR
 bdn43gOnc1TI5buJnbXr2Qy6V/O9ez1OJJnC5H3tWm3v9WPasUFwsiJe9QUWPTrdB4Ze
 F26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WdNppBEdbei6b2OSfenKY9YTOl+LPHyij0Nj78kSrVk=;
 b=lb1Sp+W66XmJ7KfYapbpLkv2CFNYW6DrVUyYORgXnx7mS587DnSIeZsnw2QxKBwEU5
 yQ+GLqWECxKn84iZJoq69C69MZy2/HA85rNINvsTmUCDxhQjV6yBVzCZfc4yan8ZhkmE
 cSrpEwJEvnpAmx6YEUPRfG9lTY5FNOeAcc5Rx2f1FdRJ/9mFbPwvOHqZI60SmuS/7ybB
 EMyZ25L8Lwi4vz9z5ldP1MUOlYR89cUGhxUt1pfDN1jthSIqtYJGGNvFUVvm3nx7izwT
 Aw+rjJlBU+9KUWwcYKWgAZj9M1Aie/T9+AB8Ncdft5JcAxmwvk/cs2ysjECCbpHGxzAT
 ROVw==
X-Gm-Message-State: AOAM530fYxpoI815sSOM7saHR4kQ3v0Cg95d2n6r3Wei3wPyS062ueuS
 mFceYHuk0QhoR7x/6vjVzToHGaSkZIMDLw==
X-Received: by 2002:a05:6a00:2148:b0:4fa:92f2:bae3 with SMTP id
 o8-20020a056a00214800b004fa92f2bae3mr42053364pfk.69.1654806542696; 
 Thu, 09 Jun 2022 13:29:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/23] target/arm: tidy exception routing
Date: Thu,  9 Jun 2022 13:28:38 -0700
Message-Id: <20220609202901.1177572-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ude1Qdkg/BWR

This is mostly code movement at this point, out of headers
and into op_helper.c and debug_helper.c.

Changes for v3:
  * Drop helper_exception_advsimdfp_access.
  * Drop Rearrange Secure PL1 test in arm_debug_target_el.
  * Improve patch comment for helper_exception_swstep.

All patches are reviewed.


r~


Richard Henderson (23):
  target/arm: Mark exception helpers as noreturn
  target/arm: Add coproc parameter to syn_fp_access_trap
  target/arm: Move exception_target_el out of line
  target/arm: Move arm_singlestep_active out of line
  target/arm: Move arm_generate_debug_exceptions out of line
  target/arm: Use is_a64 in arm_generate_debug_exceptions
  target/arm: Move exception_bkpt_insn to debug_helper.c
  target/arm: Move arm_debug_exception_fsr to debug_helper.c
  target/arm: Rename helper_exception_with_syndrome
  target/arm: Introduce gen_exception_insn_el_v
  target/arm: Rename gen_exception_insn to gen_exception_insn_el
  target/arm: Introduce gen_exception_insn
  target/arm: Create helper_exception_swstep
  target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
  target/arm: Move gen_exception to translate.c
  target/arm: Rename gen_exception to gen_exception_el
  target/arm: Introduce gen_exception
  target/arm: Introduce gen_exception_el_v
  target/arm: Introduce helper_exception_with_syndrome
  target/arm: Remove default_exception_el
  target/arm: Create raise_exception_debug
  target/arm: Move arm_debug_target_el to debug_helper.c
  target/arm: Fix Secure PL1 tests in fp_exception_el

 target/arm/cpu.h              | 128 +-------------------
 target/arm/helper.h           |   8 +-
 target/arm/internals.h        |  43 +------
 target/arm/syndrome.h         |   7 +-
 target/arm/translate.h        |  43 +------
 target/arm/debug_helper.c     | 220 ++++++++++++++++++++++++++++++++--
 target/arm/helper.c           |  35 ++----
 target/arm/op_helper.c        |  52 ++++----
 target/arm/translate-a64.c    |  34 ++----
 target/arm/translate-m-nocp.c |  15 ++-
 target/arm/translate-mve.c    |   3 +-
 target/arm/translate-vfp.c    |  18 ++-
 target/arm/translate.c        | 106 ++++++++--------
 13 files changed, 360 insertions(+), 352 deletions(-)

-- 
2.34.1

