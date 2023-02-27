Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4396763ejc;
        Mon, 27 Feb 2023 00:11:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+7HFqBOjCESRUe6A8EBIN75FjTCHmprckVwztP/+frOw4I9e6nymUkeFxnfqXuXR7WbaOf
X-Received: by 2002:ac8:7c46:0:b0:3bf:d254:bb9b with SMTP id o6-20020ac87c46000000b003bfd254bb9bmr7148798qtv.44.1677485495766;
        Mon, 27 Feb 2023 00:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485495; cv=none;
        d=google.com; s=arc-20160816;
        b=uIMC83wCm32EAzClZ/c8FCZ8M5ZTd109rnrubt/p/qGi2ROePzYnPrdGn3GshGwj3z
         wq47FRZCWvxrruw3kBHyM9WrTdXNenHu5Ow5Ele410T/nxVaQRX5CVe11NoobuBn/HEP
         WmoKgI5qcylMZD8uG6F3dysaL6mroWW4TLo6P1l/YlvUE1VYaNZw85sXZeaDYmMDS5fF
         n2v895P5vJnNbtOsGcN8mVVzsRWYRpnEM3KFuqfk6GnSOd96t8z70Me6nQ6tnaFTAzk7
         JkDYdVyzN0sfK+GK9d8SQdTXjHL1W+p2wnwqGmfr1ZcvhPQ/m7khkG3R6+wqshJIkg9j
         ThoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JLbIXbv3c6J31oUDt+65MrM/+9+0ofz54UivRKjyGyw=;
        b=vFzL14bJ5qaaLfUiu2jPqoWaFu11Sn5VG1NkQkt4tjta988xZTuB72Na0+b7ueP6xn
         vG7Fv97NBZqWxHAqSNrfBu/vBQW4BjIerxO+HuK6CEAULOnqASPJwdpK1IB71jEgypM/
         xHEJi7iCKD4/0GXKYrF2zw4Qac91EnUrzJeAXpZto/QGQYnI1iGdBp8CgRp/abszZWt7
         H/k0VYR93Ooz+f8on0DqKtsyByP0FuI14ZDoPK4NvjzB46zdT/BNaGfHqQMn1K43qXmB
         QfihscU05+fW+71VONY8IWi1CRUPNXamnM7kJR+btFrhmmq52S5mvT8BJ2ziZ/z3IsC+
         uXww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QnidWXv7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020ac87f87000000b003b4a6ae2441si6410654qtj.429.2023.02.27.00.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QnidWXv7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOY-0001lk-A0; Mon, 27 Feb 2023 00:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNX-00055F-Sc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNU-0007dR-FI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:51 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8875675pjb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLbIXbv3c6J31oUDt+65MrM/+9+0ofz54UivRKjyGyw=;
 b=QnidWXv7ZWJNKObdzSVc0lCypHJDXCDp27/D8eTGG/43vIpHq9h8xYz5Pvyb7Sgpfc
 CgsW9z9S21qR5S94+z116PdZ94/XPR9hLg9Xmij0gCR/niXzntOmtudUBdaFA/D6XJzG
 arfAX+5CcuspWigeaZ3Q7g5cloXI6QZs9WO59jqOwDCqpXJNuwIYzfIJHXwiX8RlWM79
 48eWVM6ZqL/3nPce203Qdj0BFdXa6h1bv2XJdIJWHPbDiqL5m/9u/sGYiKVPWvsWafQn
 diivcANvMdEnNMfzJK0zvqhdss1oYge3ulX9kODNjk6uDp1xiv6Vx/QrpVUXAqbfNcKP
 tSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLbIXbv3c6J31oUDt+65MrM/+9+0ofz54UivRKjyGyw=;
 b=1p9hZSqnKGU/+GtdmAP14iNm2rJVImO/rIMXCbgg/L3YU76ML08fGQnCyuwlN1tt+F
 BUesj+Z6CgCyP0+mkimMauuwzfr1zHf7Gp/wYNKFn7Jd/WQzPyhRHPV8l2JjJ73k/+al
 XzLCpJfVpzQqFlsfURCv6iRrKLohCjOmignqMIvqvb8+rJakUkVdRD3AblqdYktT/2Qg
 YQ5g7njsDDHQMrL5mms5XY9jcALTvJok78NIPG4pIQMVQ+hxYSkaKlCJOK+Q1wpqjsqS
 VfaHGQ/XoJma8bm5oE9hd+TiqiViIY0Wb4+ngYWziEDTNXmySGU607mfl6ao7TAKw4Hf
 pjkw==
X-Gm-Message-State: AO0yUKXDCxSeSLori7nIocJP2LcqaHmqVO7CCRkIvDhaOXRgwp7nULIK
 Jgu8rei1cnvoQym/jhFCuV38so6gqn2GUBtxRv4=
X-Received: by 2002:a17:902:f604:b0:19d:297:f2fb with SMTP id
 n4-20020a170902f60400b0019d0297f2fbmr4327822plg.53.1677476917086; 
 Sun, 26 Feb 2023 21:48:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 65/70] target/xtensa: Use tcg_gen_subfi_i32 in translate_sll
Date: Sun, 26 Feb 2023 19:42:28 -1000
Message-Id: <20230227054233.390271-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: OhytzKK7Vcvh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 41b84082de..2903c73f8e 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2324,8 +2324,8 @@ static void translate_sll(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_shl_i32(arg[0].out, arg[1].in, dc->sar_m32);
     } else {
         TCGv_i64 v = tcg_temp_new_i64();
-        TCGv_i32 s = tcg_const_i32(32);
-        tcg_gen_sub_i32(s, s, cpu_SR[SAR]);
+        TCGv_i32 s = tcg_temp_new();
+        tcg_gen_subfi_i32(s, 32, cpu_SR[SAR]);
         tcg_gen_andi_i32(s, s, 0x3f);
         tcg_gen_extu_i32_i64(v, arg[1].in);
         gen_shift_reg(shl, s);
-- 
2.34.1

