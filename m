Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2635562ejc;
        Sat, 25 Feb 2023 01:17:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+4XisrL5M7ykY1GjM828x53Dc7vyNJEubdFv8HmtNO8APzlY0PrEsIvLs+56w/9c76gNfK
X-Received: by 2002:a05:6214:cc3:b0:56e:a918:a4ed with SMTP id 3-20020a0562140cc300b0056ea918a4edmr38460556qvx.1.1677316660113;
        Sat, 25 Feb 2023 01:17:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316660; cv=none;
        d=google.com; s=arc-20160816;
        b=VTj67YiF54Te6HdHG8Nm6z10+5a1vycNyCMOHjLMyl8dw7xwuurfwxXcNsCixWGyOn
         G+bO9EsGuezjd8LBOOcLM7DviRLbeuWsPw5ZiBbIZuy+YmSJ0Cf3jLD6H+2zAhs5/0f1
         xz7dJbL+6rIstX7HuxNpIYsLVM2Z7sf6mjrrBY4I57+/Ui1f6i/CP+qCby3HhV/DCTK/
         6fASoWOHk9CTnhkNMagjJNyR+kkogzFy8fpwRdNtudEl06rdjgEDMsHbxexTOTU1i9aM
         f4YWZcqDSb+4Cy2OdaCcNT5CEvPY8USEK19IAxfPL1vPQ6GaCNsKlmeeZijVd/Z22Ulq
         ayhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
        b=Nsh64kkYV4sNq5vLepUebOFAuRd8NeBPSih13tg04BMURWT4/N+OPHf35Km3Tb8ifd
         mkTtOWcgpy0QPH+Y92PLJF6lRsCJMxwCaLHA8d86yg4G1obfmX7uEok/8sw1Ksggii0f
         F8ZPRbqBuSGl11/ftsPyhQVU4FRzqgjDNNyQALxUNU+OeY1tZkyApREo07pWTqgPSyFd
         TBAR+qB3L+UkuxB4T1PEbsFrsN+qFx9jyFffPt6NOR3kmTVt4LtD8jIN5w+vLKcaGBAe
         nW/exF08AW3vTQsJcI6fuv1rotSG+S0bG30aRgquDrK51XbH+9pc3TGnbZZ5nEhO9RWW
         v/jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7Wf4CpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124-20020a370b82000000b007427dfefc91si1219617qkl.564.2023.02.25.01.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:17:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7Wf4CpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqeJ-0005Qc-BH; Sat, 25 Feb 2023 04:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeG-0005FD-Lx
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:20 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeE-0001hD-DM
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:20 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l1so1434695pjt.2
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
 b=H7Wf4CpTki4dMZf7CWGUMBD9Cu4Pk01In6wHW0aU19eN0lD0Sbv/bSCEfH91+tznDC
 vtm+EPLxIzJuaf9diEwkk6geP/xf+QOFemU+OhUCkGEd6cvdZCXHNHjU0LAzBHu/jGsw
 IncGyWtvfQ7YlH3cbMN9+xEf04Fqb5RVbnlD6oATuZvhxMTKKnxMqkrLkpI+JqGfWRul
 8aETUUv7bIbiIu/Ye1eSPKBbgh6uDmlJu4GizMQ9PdqdKlxsHCWPJePwVMWD3gIzWvJt
 HaZjQsyLLSP/iIDXjSPJ25E4IxIXjT5e2h6gO+jWqVwSpcvD+uhuewBk4qD39y2eWJ9J
 JJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
 b=ZmuSLY1YOFQhwVx5g8VSddQdPlBvJKvy513qfC2GM2DYX3DKUfz1QUxy9CB5PNaDCl
 Mmshi+Fv4Fhonl3lqp0d2JitFTv7j3ZAO37cqOlE5OMxbFPO/jfeNcOGACZrpFj6Xtxx
 5cmk6+i2/8LbDICkDm2ts1hYriFOKr069hhtfywxdKT6VqgvIF/2Yn2yD1IAxh1I4Wf/
 gAlxIu3ZOBZZX9m+5Ty11jxPdv3MC9J2yP/BTb7SqJ3O3x1FMTeA9lo4vDrvWhsPBFAL
 60jw/5Qcy0leAf9twU3gNC7AsvoCMUZ+HprYA7MxO4Bgj6k3tv5UaOlCMJEQChRUK514
 CC5g==
X-Gm-Message-State: AO0yUKXvMJsezY+Jt6hAnglcVjQ936TNNThdHj6tQvaS8jRchlaeYwwn
 ZgDawgNtcyZNdM4t+lw7ZFOgpw==
X-Received: by 2002:a17:902:e745:b0:19a:839d:b682 with SMTP id
 p5-20020a170902e74500b0019a839db682mr20758866plf.17.1677316517119; 
 Sat, 25 Feb 2023 01:15:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 17/76] target/arm: Drop tcg_temp_free from translator.h
Date: Fri, 24 Feb 2023 23:13:28 -1000
Message-Id: <20230225091427.1817156-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: KmF7iOQZuYlh

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d7fdbc1e3e..3dbff87349 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -331,7 +331,6 @@ static inline void set_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_ori_i32(p, p, bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* Clear bits within PSTATE.  */
@@ -344,7 +343,6 @@ static inline void clear_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_andi_i32(p, p, ~bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* If the singlestep state is Active-not-pending, advance to Active-pending. */
-- 
2.34.1

