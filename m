Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1969192ejn;
        Sun, 16 Oct 2022 15:11:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6HLF7jH632UU7jBW8wlzXSYyvKMtb5fUgrk5YajdrA3TT5M9LqEKUuVGtVBXGxO/THe3+k
X-Received: by 2002:ae9:e002:0:b0:6eb:adfb:5e03 with SMTP id m2-20020ae9e002000000b006ebadfb5e03mr5628651qkk.243.1665958296185;
        Sun, 16 Oct 2022 15:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665958296; cv=none;
        d=google.com; s=arc-20160816;
        b=gVDqsXghxF1LOLFyI+6OOuAqJiwnv/XdHjwT6XU+xqe7qPssjWw3NHcjI20ZPcY/AH
         0pBFP2+A//sfhC5wjBEfjZgD5+g+kvFXWOTZV67I8PnmQBQfKDWp/S6Y23J1S/P7l/4j
         cxiGWRwzyLIIQN1vYu/hctAUZoLuGV4rpuf7BdeJGi3Vf0S1sGOooq1dbqDn2Twk+lnh
         SyucyYE0QNburts68wPRJWPuEGgUNVLXltvnG76kQY1ObfbSNZiScZmzinpwrMqIXpX0
         7sc5mEbs7DiQLv1yli8uoeWS8isTvIQuVFYlaf8h2EKUnFyDsIAe9TfDS1xn0ZzTZLM5
         EoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zNSasT6g5lPXdmGKCoc3ZqupAp2gRn+LqJW9jUoXEIo=;
        b=DBAweejfF4hwU3vJWtNujHTzX9zSp33jk8NFwvA1FhxEKXcRF2KZD8LERqpgiBcot2
         S4RByBCieSV98lwbmKlQobZqqEQE4QEt/+Q4Dr28Y6PmlfUa8eltEu4L4qcpi9i1gJ/f
         5FdS63eP5q05fQON3gkBszV0p5Tze5INzC15IMPNurK5yOR1HVr/abmhwEDMjTeXcX5g
         jswLbc+08qpZT8zIKWWExEvoe+2m6hHp58uKu7gPnJPQYALP/bJfY4xofeAgRSNkA2PM
         Uz/vfiVkFWlfFrqDzUtBkW7SfmXEbQRiY+u62WUflSBfnq4+tlThiHBRQ9a6hqJMg5dD
         8HEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQi4JHn5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj13-20020a056214528d00b004afb2ed4f26si4760239qvb.270.2022.10.16.15.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 15:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQi4JHn5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okBr5-00028L-9v
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 18:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpm-00025k-0S
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpk-0007fO-BX
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id fw14so9425264pjb.3
 for <qemu-arm@nongnu.org>; Sun, 16 Oct 2022 15:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zNSasT6g5lPXdmGKCoc3ZqupAp2gRn+LqJW9jUoXEIo=;
 b=QQi4JHn5/5RqthQ9NF+BboZ7C5kJH7t+bGYe2OKEBgtaAzjn4g3PvajZigdLZyeLmP
 vzg+RG7+OWt2T6jqQxGovF6nIL+NB7X99x6VDKFVdTDoD2IKVgIRl/eHLo6xcU5VhcJx
 CwvjvspQ3XqJ6VayMJGdCh0UnrhcIdfzv1oe98ZTxdAoUF2DUIV0wbJmMS6wxfc+WFw1
 PBkZKfpmklbrZF6nf3QmJEILwDF+UifI8GdHtmRmAgbrhfwaWc1MlhOmbdjROTtPg7gx
 ALrq0NVnml0VloNNNqchYbPRDpcD3Tp3ONb+ab/1B3utAHkWer5P3CbdH/HuV57jmqNo
 FfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNSasT6g5lPXdmGKCoc3ZqupAp2gRn+LqJW9jUoXEIo=;
 b=wtVQ4o8iS+J5oV7R18amRC2pCJG7MElfqg8CDB69GKUE/ESZP2V19Pu8lJkcjTqePr
 jz7EhtUvXALEwhoi0Sqxa6mE8Y7YuvwBaN33167zpmKxiJNhQcNG+PYDNXko4djyG3fz
 Dl86+1/CivAaJppdbP/7DdyJ5/zUdNfDzO9ICLEfWWwXoXoZOs/WyExQJv6JJYO++yHY
 fjySkgpkhNAduCfdD929pjk+9zlqLLb6NhFx6KLITJ9RkXDuex01VPEAPv8RR5OPcIVW
 S0Bsvl+wMGg66Yf4K6DFEasmtOgRfv/+E+gWLdfVfA9qW1wqWRKHsVnpJmOZYkPxHlTw
 VpSg==
X-Gm-Message-State: ACrzQf3EzFkqAh3lZfd8ElgzYWftnBTep06xThOhFihMlmLjoDlwLy7G
 j+z/lM+77MhIA40HpgaeSYXB3g==
X-Received: by 2002:a17:902:7c11:b0:178:a6ca:4850 with SMTP id
 x17-20020a1709027c1100b00178a6ca4850mr9118678pll.111.1665958210656; 
 Sun, 16 Oct 2022 15:10:10 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 0/9] target/arm: pc-relative translation blocks
Date: Mon, 17 Oct 2022 08:09:23 +1000
Message-Id: <20221016220932.274260-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: Xz2UEZWSjJ+i

This is the Arm specific changes required to reduce the
amount of translation for address space randomization.

Changes for v7:
  * Remove read_pc in patch 8.
  * Add DisasLabel and inlines to generate/emit,
    cleaning up the management of pc_save.
  * Restore pc_save after tcg_remove_ops_after.


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
 target/arm/translate.h        |  66 +++++++-
 target/arm/cpu.c              |  23 +--
 target/arm/translate-a64.c    | 191 +++++++++++++----------
 target/arm/translate-m-nocp.c |   8 +-
 target/arm/translate-mve.c    |   2 +-
 target/arm/translate-vfp.c    |  10 +-
 target/arm/translate.c        | 276 ++++++++++++++++++++--------------
 9 files changed, 351 insertions(+), 228 deletions(-)

-- 
2.34.1

