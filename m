Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4397488ejc;
        Mon, 27 Feb 2023 00:12:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8UTyYouucz/qYWmFkIfT649PswADUhk5ZmuVajikaEMvgnFwr9n7MvwRIG8WOIY470dgK/
X-Received: by 2002:ac8:4e4d:0:b0:3bd:1728:8881 with SMTP id e13-20020ac84e4d000000b003bd17288881mr32533344qtw.19.1677485561331;
        Mon, 27 Feb 2023 00:12:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485561; cv=none;
        d=google.com; s=arc-20160816;
        b=ojF1+bwvxijlhIFo2Dv26kF/+asl2h524DHCQbS8Hpl7OvbtFRtSrzL3OxFLaRVJ5k
         E8S/tp9caaUqjmXM017Gm6SPhp5KlVkmBgNZl8q5UGIGCI9V6Zr/aJ9NMFxcVpQuC+s2
         rzCRLlVLmkLbkvq/aDbv4S6tS2Hs1r5BGr2Mkm1rky6j3LfhOO6MgKMDH4gTMrE/bzhk
         oz68gELiUO153tg8NpMvYudu+47FC7Zdq1YrIyXQ2u3Ru0sGV0jH6M3pb1S2eEwY7rsX
         rVBo+cqw9/4UsQROPsz7yYIXr4B/24eqYruNcqwSDsWVoaf0dcIa/VuiU7jlkVt3Kafd
         Nxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ko5d2/IanWd/pjymt4+iUKkd751sWBMgapBL5xX0YbQ=;
        b=Beaz2uK+5vMGtuuCUrGAW1sZarutrJi0VqY6itaWATiIZUj361/vkAfA6P/CfPwLKP
         Fl3RyOp4s6fOtczMHOetQVRMQMshh467cSLmj8f2bEr5NrpHDgMXjsOmS7GxZBtbohvL
         bpIpf2LEwOnhK5iabJ5X0jwE2GoVhzJvfHYPC++PujnmNPlrdJJ7xbO6jMrFBj8zVEuf
         +5yvnLZuFzFL6OdCqeeBMO1BuQmsQxaODUbksBTBCjAqgiPmK+qRfaZFaCH5c2xIs/Xx
         y/ad7X4Cg+yfAKEoXI1SHR4TyUnA/AQB4ozuBGQLVkWlbUq8S+mxOG4b/1L9VJx1g2f4
         wh6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1OkCNSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020ac87d8d000000b003b7ec1b1facsi6193582qtd.5.2023.02.27.00.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:12:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1OkCNSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWIF-0003Zh-0o; Mon, 27 Feb 2023 00:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIC-0003J2-Ck
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:20 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI6-0004yo-K6
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso944324pjb.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ko5d2/IanWd/pjymt4+iUKkd751sWBMgapBL5xX0YbQ=;
 b=Q1OkCNSXNxA92Cxl2bJxiDCZpgHHttWBi2+te6jFAEBClAAXaIfO53F5DQdCzk05VG
 LVycgjrjLleVGptjoHlY5gyYSYeW3byqnv46H+2cy4SRF0NU+16utvs85JjEPcXiOeXt
 KTH/gTtF1piO7PT8DfMO0Lf92o9i5a3hbsSBo46YKhqHg7joqvVgQip7vA4NSkvJbix9
 OFP0RX7UOt/yY011YJvvCVpStPJCn68vgK8GxXLGrC7xX2Ts+BYdB7RwCTjLae5Bw/Cw
 DfmXiKNljpnJ9TNaGgDCqiK9EBYxt0ZGIdZdMwnUtu4QGARhDWm5LZmtxStjcf0ocjqg
 HdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ko5d2/IanWd/pjymt4+iUKkd751sWBMgapBL5xX0YbQ=;
 b=RUlDl1OXh1BpRO/GPHvBktmdOxR21IvCUe3qq6EhmP+LDek0/w/UzuUCAdWicZiu+1
 va0xgjSpZW+VdaFXW9eHwJfL1L97vzwwJAi8cZ70FXBOtiTlg57+ZJI6GoxKb+CcBXCb
 k2xxV8C+QswFNL1M5jY3X/nr6VbpRTBs6kSdJRVSjJsy7bw+8MAhaObJwqTQxHqqY5r4
 kAJrQOj9FJ/wf1kuJTy337byHKHRg3aWY25wReCrkhesg/OaXLtDn0AVuzbXyqn7MHAN
 dPW25vR9g8k+th0F5zzYn/wi+cY4lncObVZwRhEOAu6ffOuKbuQsoy2rrLt2vw+mkmsh
 g1qw==
X-Gm-Message-State: AO0yUKUyht41pNM2FNsr8YeE+KJ1hwgPfSQDu8bRWOTgDvnEsSDa8CEL
 F5Q04N7vCDFc6mAOG6IeFqy0mA==
X-Received: by 2002:a05:6a20:548e:b0:bc:a257:5b2a with SMTP id
 i14-20020a056a20548e00b000bca2575b2amr27799341pzk.31.1677476593203; 
 Sun, 26 Feb 2023 21:43:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 11/70] target/arm: Avoid tcg_const_ptr in handle_rev
Date: Sun, 26 Feb 2023 19:41:34 -1000
Message-Id: <20230227054233.390271-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: hq1LjFUP+Iav

Here it is not trivial to notice first initialization, so explicitly
zero the temps.  Use an array for the output, rather than separate
tcg_rd/tcg_rd_hi variables.

Fixes a bug by adding a missing clear_vec_high.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 16aa71451c..02a61aa8b7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12003,22 +12003,26 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
         int esize = 8 << size;
         int elements = dsize / esize;
         TCGv_i64 tcg_rn = tcg_temp_new_i64();
-        TCGv_i64 tcg_rd = tcg_const_i64(0);
-        TCGv_i64 tcg_rd_hi = tcg_const_i64(0);
+        TCGv_i64 tcg_rd[2];
+
+        for (i = 0; i < 2; i++) {
+            tcg_rd[i] = tcg_temp_new_i64();
+            tcg_gen_movi_i64(tcg_rd[i], 0);
+        }
 
         for (i = 0; i < elements; i++) {
             int e_rev = (i & 0xf) ^ revmask;
-            int off = e_rev * esize;
+            int w = (e_rev * esize) / 64;
+            int o = (e_rev * esize) % 64;
+
             read_vec_element(s, tcg_rn, rn, i, size);
-            if (off >= 64) {
-                tcg_gen_deposit_i64(tcg_rd_hi, tcg_rd_hi,
-                                    tcg_rn, off - 64, esize);
-            } else {
-                tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, off, esize);
-            }
+            tcg_gen_deposit_i64(tcg_rd[w], tcg_rd[w], tcg_rn, o, esize);
         }
-        write_vec_element(s, tcg_rd, rd, 0, MO_64);
-        write_vec_element(s, tcg_rd_hi, rd, 1, MO_64);
+
+        for (i = 0; i < 2; i++) {
+            write_vec_element(s, tcg_rd[i], rd, i, MO_64);
+        }
+        clear_vec_high(s, true, rd);
     }
 }
 
-- 
2.34.1

