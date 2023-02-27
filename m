Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301951ejc;
        Sun, 26 Feb 2023 21:52:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9bZILyeCmcNlE8uP9sT4voPJl/iyu+3besjH/sHulxAMVdDOMf/P9HbejRiXCotDQZfjr3
X-Received: by 2002:a05:622a:1713:b0:3a7:e2df:e868 with SMTP id h19-20020a05622a171300b003a7e2dfe868mr29792330qtk.41.1677477131827;
        Sun, 26 Feb 2023 21:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477131; cv=none;
        d=google.com; s=arc-20160816;
        b=NOytsDKFUC74oT6uUQQqXI/4ntDSsdsH+1b6V2HL758x/CHUZQB4D+55e/10vxxE7R
         I14Aj0kkjd8zXpzW3z+jXlbORp0IxWTzvCkbLHjppYR+xsPpzDVo3oTOZbdLEEBOLYDY
         pA5Ti1BkoBfv3ogkDQc5PtoDSFjl4M3VaEO+sQaYqbfXTwqDxRxsHJJHcxtzBF7Aup6L
         zUi75AS7fgZhWPqhPLuOcAEhDSG0aVqmD64ROsBID4bWnjVNHBAZsOJdMp27Z+1MMSiQ
         lecekUaBlaDBULGHJQQF+Z71EoSuYATKh0k3e02ruJ0JdIx6mdIZCe7h9Cp4BBDfVh7d
         D9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
        b=Dus7X9ajNvqjOaVxiO3wOIJj1J9qSK2MVDUIUmzzy8DqlfZNIMhiTi8yZaigizv8hd
         EDkWvjYCzE7M+lrG9RidOg6jiVTfsiVoLfdtMqPetsN+Q4zAvtqXzioRynr5TjTFVYOd
         cdX0TjfICkNZnyTBFJJzezI37S2sxyEfUGGZzaHplctc4pcmHS4SbD7xvafvrJQ+OX/B
         Ze4rovoi2Wpx+/T8Ggby57Xkes2tjJJTqH409OqqbhazuOcI17CQJvZ0aZm3S48v6z6I
         NtEqY04GRasBDj5JtWDSCenVFbQ9rrwIV3g3/RdI4k3YA9+yprPO6NHJIh5qa59FHtGy
         FPeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWx21Cpp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020ac87e95000000b003b9b7747550si5972322qtj.575.2023.02.26.21.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:52:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWx21Cpp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWDq-0005Uz-R6; Mon, 27 Feb 2023 00:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCh-00034a-JI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:41 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCf-0002gU-R2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:39 -0500
Received: by mail-pf1-x430.google.com with SMTP id n5so2774193pfv.11
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=NWx21CppDsL2JMOvm4QkWSZWqvIOVJF8i+WdWr6ZobSiSWHSCp9zY13AjGhHUxyeCT
 nBMQapLUSlkVuzITSDSbdu0CRyR6UEwd+VwUlnW3VXgu0Tnf3zCb67PlXEdUAaMUIgm+
 B1gBz5vfjTezfbgI4vcsmHLTpO6N4d7rVWN0Z1tf4QmmyQhLFyYXB1tlgabQmh2ph79d
 PmuOH+M/olKr3c1vTQ/JyYCKxvSi7tbRZonYJJ7j1GD6usHSJqsOTIv0X85udnY7hv9+
 QA0VdK05I6us8BWtN0fsiaDGjBTKDmW2Qo8LoD3tUn16/6dEGV/rbvyuN+4wUqkQtcJQ
 ybug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=SxC99QxZIZ1zqNkC6m4O2ldeno8WQkrjBlqcN6jvL8VoVYRebqEl+SBk6wq05AvJ3V
 WuQ4bO2P5ZqNPxwKsqO6KHYP6TZ9Jdjy/jW58hxDMVGMSdjLVc0HAy/po8t7P0IJtKR4
 N4uATHjSGNFp5ifT1I30JwW/z3uGNxt3luInzMZkyPbQcXSEkd9t3eTiGDMKesUNthe4
 rueb+mk5CdBkPgysCL4K5mfuYiXA+lD00wb/tdJhrCVHpVvEWz7eVZRGwCcYp0tbdwlF
 8YCCQnd166BMQR3bga/K1O/RwOsIdkMtRTry/Y5TYoYQGJcYqEJAhq9NmKTIhUe34eft
 oteA==
X-Gm-Message-State: AO0yUKUiyi7kFnMMjDPP6PUYhBK3dyhcuiXbPKlHtQQnSfEQyPq1ceQm
 NI+K4gtztaee73Fvn2mGRjOkd8wt6TFN3TrIaxw=
X-Received: by 2002:aa7:9a0e:0:b0:5ef:b4e1:db0e with SMTP id
 w14-20020aa79a0e000000b005efb4e1db0emr4251081pfj.16.1677476256629; 
 Sun, 26 Feb 2023 21:37:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 11/31] tcg: Add tcg_gen_movi_ptr
Date: Sun, 26 Feb 2023 19:36:41 -1000
Message-Id: <20230227053701.368744-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: VEVCI5vCaojC

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 839d91c0c7..66b1461caa 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1285,6 +1285,11 @@ static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
     glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
 }
 
+static inline void tcg_gen_movi_ptr(TCGv_ptr d, intptr_t s)
+{
+    glue(tcg_gen_movi_,PTR)((NAT)d, s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1

