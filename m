Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1395478lfa;
        Fri, 4 Jun 2021 11:36:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7Rv1ez4mXe5ZWRLGyNeUfF9Psws+SwfcJ7trU9FQiRZ0x7sreaay0aKpNBi7EpXswYsmj
X-Received: by 2002:a6b:630c:: with SMTP id p12mr4811009iog.124.1622831768820;
        Fri, 04 Jun 2021 11:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622831768; cv=none;
        d=google.com; s=arc-20160816;
        b=lAhlJlYbrIcbsxQaFKwPa7oIUC+MIdoRCUWnTYD+EOTx6Ci+Qsgk/Yf0fo4Iu2S/J6
         r4h6ECo/6/9pKLIowt7KrnnOa+kyZDpPZSgdYl/H2U7zbJJaLHRtqrBJIbdoCp+X8lr5
         C7gIwrPwumZzVbVFZvsnA4j3qL762AvAdnKDBGKsF6kQN4otRUN9F8ZUBXJKF+NeZ+/1
         Eh4DikadfyCsp8cJo/n5i8tgnrMq4jpkjsQ+ELSPu0ozZCeWsWH1TQ41gImqRl54Ogot
         2qzW7hzEmUZYcoYfN0vajRQyEHpnmv76nO89MsCLpx0NqeybqWzuP9L3uOaXkApK8Fxd
         pB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LdUaco4sECfF9IUAX5NrMCB86rw92BNPZvWQqOKvyas=;
        b=R9sq1wBS5+2GU8+Xw0S0FJQ9H3iJ+O39/N/q16vpslNriStafAM8ySLJYoN5j5vPQP
         d8XZ38OsUvVhrjBhOSwalkpRtZYlDVVfQw4+fmKqwt8s4dUw/jH04aEGye0ZARtDKDva
         fgs6Gsys2PLUH0ktFsY9A5159w5XhJW+pKVHe9IP2NAw075Zk5KVg91UzOa7RXHoKfER
         N8FUna5WlSWjERAbBGFM0Hvk6eB9kFESNPqfIgQaEmlLyGo16H9jll+UseNTJzEJu0PX
         U8RuUsxdOEsWF66w0SUis7GOk+g41DQsU12t7NNTnuJRrzPiHCs52sjeVlR9ZAvVo/RU
         ul9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bga0f/A1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si7581525ilv.61.2021.06.04.11.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jun 2021 11:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bga0f/A1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lpEfw-0007zY-1o
	for alex.bennee@linaro.org; Fri, 04 Jun 2021 14:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEf8-00078b-CA
 for qemu-arm@nongnu.org; Fri, 04 Jun 2021 14:35:18 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEez-0000vF-5b
 for qemu-arm@nongnu.org; Fri, 04 Jun 2021 14:35:17 -0400
Received: by mail-pg1-x533.google.com with SMTP id l1so8576619pgm.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jun 2021 11:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdUaco4sECfF9IUAX5NrMCB86rw92BNPZvWQqOKvyas=;
 b=Bga0f/A17eVlsm7gkf5292g0WXtr9pgDlmH7Ywq0Dt+B5L3qXA3QfvmMV+ASY9eGOH
 jFmge7WNhsSTaIBKE+UJCQaczL7Ty4v/7XhV39PMMfh/Tpz4on7eBekuJY+gxgCGhb8c
 hb38VAeOAj7Qp/2kQkYw/lM3LiYzYgTH2okOn5npStEGpHngCt/wLYlWTPJ7DrkoIlVu
 sWQUglP9Cnn8FIuhB1A8x/uxJmvV2iSzQEkB9OhL9l8TzVB0IsY0/x8KvkzP7z2UoO0J
 Rt3vv8rfpVf4LKtc1mz+82xG7OXVN7bW9qnXZXfRjg6ucmaCDxOnk0lJj/uiNFHTkd3h
 b1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdUaco4sECfF9IUAX5NrMCB86rw92BNPZvWQqOKvyas=;
 b=WcFc5qdb7J+4PWvoJia3Zj7H8jgIdPRE8SqarcDWXo/5AKiwiGYlqeX7G0aANDso5c
 UMWWnrOklb8YlObh+nYU6gEY5LDS0BwKtpMwYoto0qKs005bh6Kt/38TSWxDrBuNzYa+
 VsQHVgDryPo2BYqhor6L9nBFhQLhGfzb0kiljf6yzI1qoeMOENkbCeJztqV366WK0gPT
 cBqqe+bnrhfOHF2XP1h5z5p29ilW7wU23dn21wQp+69vZrsh6QHdWDm3uJGKHaF7xmHK
 oh2KApGeAb+N2naghhSLIPmTFUmQ2kOUZEjl4OaaTO5/Zr/xOmLKfN/n5RczLjc1PSH4
 osMw==
X-Gm-Message-State: AOAM533bDZI0MJT/5lHVNkqTvsE5Y2OAUgI2tUGE4kl2lw2aRjuA+B+u
 MKIDLQdjVMgHWhw9QqbrPYDSMw==
X-Received: by 2002:a63:5619:: with SMTP id k25mr6405747pgb.92.1622831707195; 
 Fri, 04 Jun 2021 11:35:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m2sm2620578pgu.85.2021.06.04.11.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:35:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Decode fixes for aarch64
Date: Fri,  4 Jun 2021 11:35:03 -0700
Message-Id: <20210604183506.916654-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tbcol7UhHR0q

A couple of printfs left over from the beginning of time,
and asserts that are reachable because of lack of decode.


r~


Richard Henderson (3):
  target/arm: Diagnose UNALLOCATED in disas_simd_two_reg_misc_fp16
  target/arm: Remove fprintf from disas_simd_mod_imm
  target/arm: Diagnose UNALLOCATED in disas_simd_three_reg_same_fp16

 target/arm/translate-a64.c | 87 +++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 35 deletions(-)

-- 
2.25.1

