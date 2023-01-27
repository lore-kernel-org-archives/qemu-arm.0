Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1338602ejc;
        Fri, 27 Jan 2023 09:58:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/ixBeZRgP9J2UL+4rQk0LE6wpGNWwKa2rwcL0jHcsERN6nr6oJHB6Tyu+478008JzypUgA
X-Received: by 2002:ac8:4e45:0:b0:3a8:84f:1d3a with SMTP id e5-20020ac84e45000000b003a8084f1d3amr13661300qtw.9.1674842293412;
        Fri, 27 Jan 2023 09:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842293; cv=none;
        d=google.com; s=arc-20160816;
        b=hX6C2DcxQwaSXyYhjJmZQPwd0ck6KQO9uz6lYYgKG+RnEL1VlKIsn+TNb74OS843ea
         GOZOGLyx/9kXz3OceDzkB8z89gu3xCDTVdN2qXVn8ooij6aozme5THaTdjTXRT4n8Kq2
         Eiat3vAQAkTq2ffB0ZeSbpXT5ogAlnmnYPaF9UJqmqc2zzwZJUU+j9ymzqNRctAy6q+n
         xgNHqFVoHvd97s6rAUPyhvbPxHz1t5aHM4pnbeI4Iavo7HoJ1UfNPd2lhrPGEgSQkZQq
         5QkNKvTMJkQtdSzBThqHjOPHhrkIHj7XCWqVdc5D3uIeQVfMvSpZK0str/agFct0FhbT
         HdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ih6y66Z03pJUHvoIRmviabyKWKywDlvBMjS6DEBZkMQ=;
        b=WcX99v20VJxMb3Lz29vqCEVuheKEe26Ere1M5hhAtvb1LUM5AbUP/Q496kBJddwA+A
         yvlZsCw0zgmwZKwDoRiZBWQvKmalcGzG1lbYTGXUoxnAjpx6dUat9CXUeDSLOu0GADWo
         LIemFC+YyeeSGq1c7cNRW5wZYK35Jw1Y5PyVJXy4Px5VI6nbagjiKZQnNzZVCRCwBuyJ
         MRj0Faaw/UoRQe7SWr4g4Wcy9vfZTrZb9cPqSqJYkY9uMy5rNOsjUEgS4dMIZ6+Iymk5
         phGBwAFhcBiuKDc+PhtNdNfHwMoGBZ74HN4/kxT5s0cylP1CpOu06j/EW1b4GQbcawA+
         dSuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y9TgZgNd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05622a165400b003b7eaec6826si2739962qtj.493.2023.01.27.09.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y9TgZgNd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSxC-00018P-U5; Fri, 27 Jan 2023 12:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwy-0000ut-36
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:45 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-0005zJ-Rc
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id m7so5672300wru.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ih6y66Z03pJUHvoIRmviabyKWKywDlvBMjS6DEBZkMQ=;
 b=Y9TgZgNdi3u6FxP31x481I8rfLJ3X7bEUM6ivqZWkzhiTpR18gpHIk2++MLJNTwI+N
 5EJHcnD2lI/B39uyZQKt9/qaUUbpzuNSQ/HIfeJ1GpteoQ4pSqhCHVnuPVIrgroyM0l5
 OooiPxZ33WhoTliKoDkYLIH5fnIO6yuaA/mrpWTeTrjOaoQ1x3n/toVjgkb3giSzNO3T
 Jl83RrIpw05mdYdkid6wfISrKdvhW4AfL3GzIUk/S7RcxTMEw0g0n5QuQ42kVOm8p87L
 SpsVo6iFM0Dc7IEEKhITeycTdnYllGD/Jpj/qGCbcpVy4bLdF0bBLwZgXmU9ksLzOqcq
 pmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ih6y66Z03pJUHvoIRmviabyKWKywDlvBMjS6DEBZkMQ=;
 b=vcuHAr4i2Xvs2N4pZ6krbRFK2usyxGaDCcryfmpntTWHyej8/zZe8NT9lKZ3u8+xzk
 lzVj91HhgrNQNIidcZ0wq6evhiV9hj6UFyhiRiW/FLnH2koajVMvuVvs9WuipVggTDcD
 8aoIT7kq1W4Yc/mncaSz8pg8af1Krnf2zgL4zOadYGNUOgJJs9lXSuqwGy5AA7nF6QRE
 k0zYA6pU7Ld77ttFcg26UtmR1j5qBg3Dxcy/8VUK04f92T06h68n4lKLWmnHL0Gowd/u
 0+YY9LZZL9RWGmachE4zA+V0B4mroL9RHJeQyfiJuVAKBtMqDSLyoW+r0msZS4rXdgZ0
 WaRg==
X-Gm-Message-State: AO0yUKXh2anTAPjHOnKTVyPPr/ZFU4dvorjgezxEhjMO+l5Mvpd39ZuD
 F7/RatTryh7thm2jsb51rrhQvDxZbla/WmAL
X-Received: by 2002:adf:fd8f:0:b0:2bf:d1c8:6a02 with SMTP id
 d15-20020adffd8f000000b002bfd1c86a02mr2866962wrr.68.1674842113772; 
 Fri, 27 Jan 2023 09:55:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/23] target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2,
 EL3}
Date: Fri, 27 Jan 2023 17:54:47 +0000
Message-Id: <20230127175507.2895013-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: 8GATNiFsMjQR

We added the CPAccessResult values CP_ACCESS_TRAP_UNCATEGORIZED_EL2
and CP_ACCESS_TRAP_UNCATEGORIZED_EL3 purely in order to use them in
the ats_access() function, but doing so was incorrect (a bug fixed in
a previous commit).  There aren't any cases where we want an access
function to be able to request a trap to EL2 or EL3 with a zero
syndrome value, so remove these enum values.

As well as cleaning up dead code, the motivation here is that
we'd like to implement fine-grained-trap handling in
helper_access_check_cp_reg(). Although the fine-grained traps
to EL2 are always lower priority than trap-to-same-EL and
higher priority than trap-to-EL3, they are in the middle of
various other kinds of trap-to-EL2. Knowing that a trap-to-EL2
must always for us have the same syndrome (ie that an access
function will return CP_ACCESS_TRAP_EL2 and there is no other
kind of trap-to-EL2 enum value) means we don't have to try
to choose which of the two syndrome values to report if the
access would trap to EL2 both for the fine-grained-trap and
because the access function requires it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This isn't just "not used in QEMU"; the architecture doesn't have
any cases where you need to do this, except for the FPCR/FPSR
with HCR_TGE case, which we handle in raise_exception() by
squashing the EC_ADVSIMDFPACCESSTRAP to uncategorized.
---
 target/arm/cpregs.h    | 4 ++--
 target/arm/op_helper.c | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7e78c2c05c6..9744179df01 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -224,10 +224,10 @@ typedef enum CPAccessResult {
      * Access fails and results in an exception syndrome 0x0 ("uncategorized").
      * Note that this is not a catch-all case -- the set of cases which may
      * result in this failure is specifically defined by the architecture.
+     * This trap is always to the usual target EL, never directly to a
+     * specified target EL.
      */
     CP_ACCESS_TRAP_UNCATEGORIZED = (2 << 2),
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = CP_ACCESS_TRAP_UNCATEGORIZED | 2,
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = CP_ACCESS_TRAP_UNCATEGORIZED | 3,
 } CPAccessResult;
 
 typedef struct ARMCPRegInfo ARMCPRegInfo;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 31f89db8997..def5d3515e2 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -673,6 +673,8 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
     case CP_ACCESS_TRAP:
         break;
     case CP_ACCESS_TRAP_UNCATEGORIZED:
+        /* Only CP_ACCESS_TRAP traps are direct to a specified EL */
+        assert((res & CP_ACCESS_EL_MASK) == 0);
         if (cpu_isar_feature(aa64_ids, cpu) && isread &&
             arm_cpreg_in_idspace(ri)) {
             /*
-- 
2.34.1

