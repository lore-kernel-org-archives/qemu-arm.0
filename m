Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4297073ejc;
        Sun, 26 Feb 2023 21:42:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8+FD2atYxy+I4t9fOsk+wUxXgyJtTmvPFv7Id8Vlt8387NfzmRDTC0TKWvIGXOUES9wLAB
X-Received: by 2002:ac8:57c4:0:b0:3b8:6555:342c with SMTP id w4-20020ac857c4000000b003b86555342cmr16098757qta.11.1677476578586;
        Sun, 26 Feb 2023 21:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476578; cv=none;
        d=google.com; s=arc-20160816;
        b=IIeISJOm7hwwDBbIo2fYhEUPuLHqJwiQ+gS0tzHuizCZYk6ZiBXMY8dCtmNvlLzAOr
         8+U5z7lK/DIdxlMZFqpwp5qgV5c+TxR56EfiZ6vwBrNLS6/+goxbpgUh1RevrsXX9bmv
         GVksy1rjBBtMcA44njK2fWDYZ8cCn8Zqq8EooS7VDMBvoQNXGpA4EY73/T8/hz9jT1q5
         Iciltq4rEAwg9NAIFn8Lz5cCwV9wcCTi8wZ5TCmiyhWXzLXtxiGiVOQLos3YalDOAHCT
         8fwx9wxBFGflcA6lQeabogWd6zaNjW+c6PZIMdezPUMB8QkBR5q9dgwfCulaO1mH+9OZ
         vTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=o/EjYc2nVUGmJDjgiY+6sooQV/WDkGEXpQsAaSq1iFA=;
        b=u5rRUz26PC8eYrHn9TlilrCgHclO+nRHmk8rjRsHDsI0x4eYjJuH3hgv4CyEwCKBvu
         KwYwbI/SHwlCPHTRsWu9Hg2iifmed8QL/iUN8dGjg+W+2OY2zAQgzIMiiig3s6GCXOsm
         3YFFaaptAyuDf0811UsJqc1emRrjRwvN+KNELDooy2rkdIPiROWcbdosByKPtX8rMjlw
         HFfFP6em85pUdhYdnYZPuvKFzQt0HW/WNKGS49Ik3SqEnILZOkr0lhJtWDdIaYWAxt2n
         NHayHKdJxBquY4xljvC79is//6iUsFhajt8AEWu70REroYw6QcDFKuFW5bjZv8O5Qpoe
         izXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YT6jOUiB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18-20020a05622a041200b003b9ee04dfc0si5550461qtx.533.2023.02.26.21.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:42:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YT6jOUiB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWDl-00053T-TE; Mon, 27 Feb 2023 00:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCg-00033T-6U
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:38 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCd-0002by-B3
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:37 -0500
Received: by mail-pf1-x432.google.com with SMTP id bd34so2802685pfb.3
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o/EjYc2nVUGmJDjgiY+6sooQV/WDkGEXpQsAaSq1iFA=;
 b=YT6jOUiBrbX3oGd2PhE4NgjvtF1tNzSZ+O8na1jDHSBxIIAlwb+vXgPI5q/brU8tWd
 Q8ENE7KuwVBGui764pi+f+yD8Qn9FBfmyH2fLQn3x4AFT1L/dWMGrklVkyS8sDaUlR45
 LmnuX9e1UVP7SZqQeJYSwi18UAyzuGwxVStAv6u1hME9oepfyEJGBaSaClUZptaxF377
 mACMe+OLbrS6OoHRHms/jVDG4RXljBrPKvGw1ZXu9NBeOEIbQxp0hocCjujaiz8iXWBD
 Ww6444SnFOuiOK+fCSC+MqbXQ0vxoLjF6yB+8IFqEuDSjt2Mrjr3MwXJj1TUE5eOsdw/
 XXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o/EjYc2nVUGmJDjgiY+6sooQV/WDkGEXpQsAaSq1iFA=;
 b=Sn0kAWowGh8L5c0lsczapE/RMEofqzfaUlmPAeWhNqwpFZjGXXATjzf/lGLiY0d7cg
 YsbbffH6b2XEdFvgJrAodoEGG4bcLu8dNeVWWB8zj3NgKTFyUOblIKcu39HXhg+lyHof
 JNsuoq+xXjTnhN13aNhFI4gwB7lx8Zp7CK2ss/5Alb7jeX0jrG6RJWXoa7rB36zw0zfu
 wKRXr9Q1wJGb3CuwL/dyBGHjIFmjb8xcjQsSksQxu7+BhU2cZMBjRKgz018vn8CUW+HL
 IZPe/ZmqjvDcpOSuHgAFYJEpHOV3YAUOnCQkoVIrFpkRaTwL/+fn0YLSX39LhL/9QvFz
 GPKw==
X-Gm-Message-State: AO0yUKUFc1Kh6/C3CUaNdLCvXNK9LFZ6Jj1tnlQmQwQZ79gXUpLcV5EL
 5qUKa3Adj0bPp8hnz4Weq6HkqQ==
X-Received: by 2002:aa7:8882:0:b0:5a8:e3d5:d7d4 with SMTP id
 z2-20020aa78882000000b005a8e3d5d7d4mr9489088pfe.7.1677476253963; 
 Sun, 26 Feb 2023 21:37:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 10/31] tcg: Use tcg_constant_i32 in tcg_gen_io_start
Date: Sun, 26 Feb 2023 19:36:40 -1000
Message-Id: <20230227053701.368744-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +H+R/NxoRTUg

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index c57204ddad..4d8b1f9ae5 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -10,11 +10,9 @@ static TCGOp *icount_start_insn;
 
 static inline void gen_io_start(void)
 {
-    TCGv_i32 tmp = tcg_const_i32(1);
-    tcg_gen_st_i32(tmp, cpu_env,
+    tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
                    offsetof(ArchCPU, parent_obj.can_do_io) -
                    offsetof(ArchCPU, env));
-    tcg_temp_free_i32(tmp);
 }
 
 static inline void gen_tb_start(const TranslationBlock *tb)
-- 
2.34.1

