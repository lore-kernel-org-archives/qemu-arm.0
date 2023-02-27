Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4293250ejc;
        Sun, 26 Feb 2023 21:36:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9yn7RmlKfhqG2nuq2V8APHMv8YLMqXC+ujSA4p5GvutnELRi9P2+b+3eNPtAUZHO1DscxS
X-Received: by 2002:ac8:5945:0:b0:3b8:1f33:ab57 with SMTP id 5-20020ac85945000000b003b81f33ab57mr41027288qtz.59.1677476166501;
        Sun, 26 Feb 2023 21:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476166; cv=none;
        d=google.com; s=arc-20160816;
        b=JqUl0ws9Z3qrwMuZn7UTxIfcrGLAesXj4n6E8DXBgdaAaMeJFF5/ab5R5XDxeZUntS
         n/S0XTj/K0xrg5ueKCZkdpYlzll0dIEwPGH0a9iJ3yLYyfenhftiHbsga2M3wQPYVhsP
         w9daGHlJOebbAN3klo/bZ6wbY4SzfIAx3VhPTwz4KkQKO7zux/KIZeIeClj0e/EFnuIQ
         +yNeUGO+lSX0dE1BScm3so0r3vuEUdtWPV4PBqR+W44H5BjS6pH1YtaU7rdltUTOKctm
         zXycEwd6zS/AiFT/TCeIW0vWhnk9w2jJKNxFBjZZWrTu5qdecCG977mDj2wjVvbXrwtH
         lnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+Wc1hlFKIswkkOoSzlvhTQxjrrbSS+xMNCJHLW8hOEw=;
        b=qUCPX35BqoEU/wEVMu5bzvS9hK8GGxIAbqkpsASe7G+sSPNpTPH3mQyML+X0YOxrz4
         cpK9xrO+0q7WjgLF8ogga3XAWrtBMqsnHNvohUilKMmXXzWCykiiABntQ54z0p+cO61h
         bwGCmZu38QbH8rpmKQOQE/Y2+dFQ2lBU95qAoFVtZNV0Cokbvfpx1yROXWMDW/20vdfe
         jzggVHHjCWxN0jwmf1aDYtyBGtmL1/GZp2GEyCJ38mG+3HA0mHjKoKGk+X9rmA7G0jCK
         +ixg+BDlEN14JxOlqM05k4vAOebL8ZDtgf4Uy6YYRFO76nAqF7MUOQHAivypRzpjmqsv
         fL4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eyRpL5pL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22-20020a05620a291600b006fef590aaf1si6453088qkp.0.2023.02.26.21.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:36:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eyRpL5pL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW8U-0005Bg-Hz; Mon, 27 Feb 2023 00:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6w-00009T-8R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:43 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6r-00016k-JV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:41 -0500
Received: by mail-pl1-x62e.google.com with SMTP id p6so4695641plf.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Wc1hlFKIswkkOoSzlvhTQxjrrbSS+xMNCJHLW8hOEw=;
 b=eyRpL5pLnUx2CSsFS+1XTRS1ln1JMc4Wno++twKo123HrbFr83X4bGnb298DuobnbR
 j3CuN4u1dDkJ9IpDio7mwkoGIF9rq+5lYm+1CP5kK8VmnAbpwperLc2kzxO17rV8wlKr
 7B/mLFMPhtWFpxtsMrpG9nmpIGUjy2J4WfpBFdTceBZb9LraiG+kb8ryUTQn82T279yy
 0u0z/gAfDvVuwA71ZJMn+jBJpm0aEAVqX7kdQYaGLjMmPf5lMV/y0ZT/a6j0p+aoeVeN
 pLBvcI3W48fs64ufpE1SJv/uG8XbHXXNbezN20emfBhK9oGdSUpnmtfjCqS8X9PwtrjB
 yTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Wc1hlFKIswkkOoSzlvhTQxjrrbSS+xMNCJHLW8hOEw=;
 b=h7WY6pUSdO/aqkqyUt5mFrd3G+nx4Xo2yDPtZBqk09WN3kmsG6L1/8IXRHignqowpm
 IqfRvEnykL0jedawwuHKclXFtfYAdcmXuCCy9QKshQyQUmADUNO0J+8b9RVOmmR+pr1f
 c3cM36LHkbS02c2xvTcNydJaJmjpNsrHG2KQR1nA8GtBS456m80JJ5pkgyAeU8eESQQM
 uREdRpUXyBwbHjvGuNcxMWEShsfgLqEElEL+lhbIliy1nCqfwXIXRyTyRE2Bi+pk3mIX
 BsQhF3pIE1RYecXCX0P64IU2pjN8afosBP+/m98lQi1cy16brIuNX1TuF0dFPlSx4QC2
 rsJA==
X-Gm-Message-State: AO0yUKVR0pbpIisla2zOzXZ1kXAF5mIYM2CKXnc/I0FC2UUvzLZQ0Vb8
 7csxn1k7PdnnLHIoQS9s4p2r+wfiz9z1pdEVl94=
X-Received: by 2002:a17:90a:1e:b0:236:70e6:ef08 with SMTP id
 30-20020a17090a001e00b0023670e6ef08mr23185655pja.49.1677475896237; 
 Sun, 26 Feb 2023 21:31:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 73/76] include/exec/gen-icount: Drop tcg_temp_free in
 gen_tb_start
Date: Sun, 26 Feb 2023 19:25:02 -1000
Message-Id: <20230227052505.352889-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: oMkVaHb7BnrA

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 733a2fb228..bbeb85832e 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -62,8 +62,6 @@ static inline void gen_tb_start(const TranslationBlock *tb)
                        offsetof(ArchCPU, parent_obj.can_do_io) -
                        offsetof(ArchCPU, env));
     }
-
-    tcg_temp_free_i32(count);
 }
 
 static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
-- 
2.34.1

