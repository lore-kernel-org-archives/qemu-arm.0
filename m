Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp5885322lfi;
        Sat, 7 Mar 2020 17:30:24 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuu4VnMgH97TrYeZYVjTveqfw8hYnFvUWcxqkk9jKK8AU0Lq57K+v8794mJbus5MpdcAUiW
X-Received: by 2002:a05:620a:1021:: with SMTP id a1mr8869427qkk.35.1583631024085;
        Sat, 07 Mar 2020 17:30:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583631024; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4KvMih9bN3lQOVvbpvt6ulQcfJ2DHV8Oon95GBdA54jNsEBkwjULoIf3H5yn5NLDQ
         09TgQPFOtygr9mCKOKTQpJU9Qkxxta0PNkSsfkG1xDc/Hnxp2CJYE1bSJYtGdChF7l/q
         GNLsUGqxuz3AwnX+T4nB9YNrEWvZL+Oht1lhanPmPfDM1vX7z77znUmf9V4N/a66LwDp
         iLwsbOvggowEF1bYmV08THuaYBaBYlo1AagTVQ8kqgXE9pVlzkO+WhucAlPscYI2x6Bs
         tuj79O0G6MYhtNiipPU+rdVUi7CMQKAG1ibC+vahVOCXqYpS93GoZkRuSqip9wlCNEgm
         6+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gv99y10Tw9XL58AqjJTwfCMl/voN1k409rbwq+MWA5w=;
        b=jt02+FWXC0YoPg/H1GZahPrQYVOJgTKeVJYLX81GY0X+SF/KYURzWjCXw8Lw84vaBw
         orSCRspJ8YLwP7NaGr5zPZBScYMZ3ZCPWTYsf3NgUv8u5oZL2Bfcg5He4dH7QPntL1ji
         UG5/cECPDVhb9x7KJ8TDMc5x40f0Oa1wn0rexPPJC/6RgIHdKkqgIPVsl6vB9L8gzrTh
         +uF3Azwo7us7BC2IWGAEr8YvmPLeB+q5IFFn4OYQ2pd/sTlYfz/iJNxlgsE14CQa+I96
         T5M12WsrpxX+p6Vqhtk8dukf5ei6/nad/6CfRkUXWqZNMmy1T43fUo3ox10lYIxFRxHk
         O+kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jTDo5djy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si4126435qka.376.2020.03.07.17.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Mar 2020 17:30:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jTDo5djy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAklr-0006xF-Ek
	for alex.bennee@linaro.org; Sat, 07 Mar 2020 20:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jAklQ-0006s4-AF
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jAklP-0003w3-8p
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:56 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39615)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jAklP-0003vO-3E
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:55 -0500
Received: by mail-pg1-x544.google.com with SMTP id s2so3011451pgv.6
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2020 17:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gv99y10Tw9XL58AqjJTwfCMl/voN1k409rbwq+MWA5w=;
 b=jTDo5djyrC5CDMffAiqEM6L8KRzo65+Pi1blQ5PfCBPHKLWOSyFOm6HQWQEqawqLAn
 bR7eqk3COWKbtWxCjWey+hV2NjqMibb+J+3WSwyXYiamlsBdurbWgQPHRRojTTRQqkOB
 r7SIIYHOP2fAFsQPPyKiW2fFyDPiW64ukmurkzAmlMMEOy/WdFV4OY+6aqBmAcSGRh1Y
 mB823cD9c/6edxSkiViMVdx/1BkxH5WcI/sfVrjbz/L19psV1eVnXTYikHzGiA9hELTg
 +p15rFEeCrC6W7kxq5e7F+Y01wLAlAwsFOGs4oWIACKPsFHgmjyhwdy45mIel6sLXJ7Y
 Hxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gv99y10Tw9XL58AqjJTwfCMl/voN1k409rbwq+MWA5w=;
 b=KlN6cmEhmqsL3QnH2nQUocKKrAqdJ9USSSva9p54iUCZD/3k9d3lsZtTvowxhRGrxU
 FcaeO9jYSmddInHY2vA72b/gKr0FzxtyBBh7WbzovNnARQcfYYpGs7DKCsB9mQtm7BHf
 QknrNibXvxZBYq3Z88Et9bv/hd/V1FS1U4DEO+oz2KlUeUT8YCCyWwheoLbhHJG8AeEk
 BLXquUJDZ4Wghi3VvwddCPcMgQWxyRDruVDefSo1VXd2JJfbNbaLMN+LIQJZv2aMfd0s
 j0BYeD1T7kbeXA55tEszO2mndATArEShMuh6I89/K/3bmhXHwt8CAh7qfEtI6NQNsVeT
 wstQ==
X-Gm-Message-State: ANhLgQ3mFn4aJh0II7GbX1IwPHZNe+MpAw3k48Rc0tbuQzdUi0/1uXYG
 S/uHVlFoAYaYsvjhlufwu1p3lQ==
X-Received: by 2002:a63:8f17:: with SMTP id n23mr10567818pgd.161.1583630994169; 
 Sat, 07 Mar 2020 17:29:54 -0800 (PST)
Received: from cloudburst.hsd1.or.comcast.net
 ([2601:1c0:6100:5580:6886:21be:91dd:78be])
 by smtp.gmail.com with ESMTPSA id w19sm32636891pgm.27.2020.03.07.17.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2020 17:29:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] target/arm: Disable clean_data_tbi for system mode
Date: Sat,  7 Mar 2020 17:29:46 -0800
Message-Id: <20200308012946.16303-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200308012946.16303-1-richard.henderson@linaro.org>
References: <20200308012946.16303-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EMg5mefVZ9t0

We must include the tag in the FAR_ELx register when raising
an addressing exception.  Which means that we should not clear
out the tag during translation.

We cannot at present comply with this for user mode, so we
retain the clean_data_tbi function for the moment, though it
no longer does what it says on the tin for system mode.  This
function is to be replaced with MTE, so don't worry about the
slight misnaming.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fefe8af7f5..8fffb52203 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -228,7 +228,18 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
+    /*
+     * In order to get the correct value in the FAR_ELx register,
+     * we must present the memory subsystem with the "dirty" address
+     * including the TBI.  In system mode we can make this work via
+     * the TLB, dropping the TBI during translation.  But for user-only
+     * mode we don't have that option, and must remove the top byte now.
+     */
+#ifdef CONFIG_USER_ONLY
     gen_top_byte_ignore(s, clean, addr, s->tbid);
+#else
+    tcg_gen_mov_i64(clean, addr);
+#endif
     return clean;
 }
 
-- 
2.20.1

