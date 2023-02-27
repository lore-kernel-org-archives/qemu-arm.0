Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5120496ejc;
        Mon, 27 Feb 2023 15:05:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8puEGanOl/m41q0BmW6P5CLvD8KhG4Qd/cVfchnyLdrIpcijAa70nuzqbXNYPksLtkIy5g
X-Received: by 2002:a05:622a:202:b0:3bf:bdb8:c64a with SMTP id b2-20020a05622a020200b003bfbdb8c64amr1646819qtx.49.1677539122432;
        Mon, 27 Feb 2023 15:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677539122; cv=none;
        d=google.com; s=arc-20160816;
        b=lUIgWdARPQayAWBI3WE8hSMsKMrsEpY4OljSloOvz342rIKF8zhEtb3BGrcjB+eHoa
         +ngcPNANKjZ+ygs27L2h597snCf46ha4fnxZAwqEpotg3F32/Zaf9O3G8sVG0XNiYI+1
         5CZBEhoNuijdonjJDaWLvDfuJTkcvF0ThusK82RYLDtp5Ltb28CJMfIMMzTXi21rr4gg
         bAVNMu70exhgQIrcwF9dz8QrdqUI0hq0olxfGL1jRpPrFTUvB/rADW4xak95YrO/Jp11
         qF1a28HGWT0Ix6crTCXfhe1vK6pRGKtvIVZ5Ddyw0QxhnavhDzjMfQx5Rlv2ni857sIM
         vIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WXHoQLeqrbXEjWVkbOYob2JhZTOWiyKZZ2KU5aalHNo=;
        b=CJ4OcVD6BFzAz3h2BgHdn4DC5nennVI4osT5C6iYEEj0umpjoa6DdVsIkFFFG6lyBy
         8Fhj4EUVTQKi8nbiaiAeBIqBX3HuOIWlW+7dmpwbyYuit3lWefiRRcSaNfAUM5m+VMIh
         xKAipcrzVZ4sTq7gLPBHocXFASZsxKQPvnoH0o+mFSbtuRH59S/Z9hi+XkYkNhzHzIit
         WBS8wPsUHEscFAF541FxwAUgTiHSkm8Utot2poBU0sW0uJEtdLDxSDAyxs66szRdoJQr
         r4Q6TY6MGHi7wogf1CRI5nGXkEPWM+heLChL7y6ZkHWRw4gRfYsWPI1/Oq7W0UdQW6TH
         zs3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gdidk/Vh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c129-20020ae9ed87000000b00742709be80asi6846945qkg.87.2023.02.27.15.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:05:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gdidk/Vh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVR-0008OX-0h; Mon, 27 Feb 2023 18:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVJ-0007xI-F7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:02:01 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVF-00015d-HN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:56 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so7731370pja.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXHoQLeqrbXEjWVkbOYob2JhZTOWiyKZZ2KU5aalHNo=;
 b=gdidk/VhFLaj3VqljZ5o1gIlHpzeITDJPdc08wuGRMklA414hXkOSxLa2Lv3Z0jI52
 S/hMIcmkd+cfIA/FbGS/MXluTF94GNmR4QmHPH3d/2GL1lcodTa66iVYjqZtT5NuPF6u
 SIO6KvUjFM2YtF6gIxIms+biPOMDefiIf/TNIzyNtUPHBfO4s4N3D6rhM1XL1vifUxC1
 LNhYzAfTeesMvbv13I00XZiuealgk4ft3FsPfh6KqhP6YH4lE5YLkmjfHdp6f2yDFw6u
 dzy+gHVD9RfbZz/j53Q0bUCM7nnwt+XBIs2E7wiL2bh412nqPhNm6vUAmwhSuFHGY3M+
 TEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXHoQLeqrbXEjWVkbOYob2JhZTOWiyKZZ2KU5aalHNo=;
 b=2aEs4qeHjfybKlWoI06clz2n0PvX4f4ckDV9/Pk1tOZlt9fyRPisWrHBTYKCAD7uML
 PaVJDj3H6PIWmk3K3j4eB75NU7Pbt4rAjAWOhRRJpUXC242yLOjzLO+AP0ShmZNlgFrf
 PofhhmWuJ1upq2V7BA11lnK9wTVT9SBezp4kR04GNeckBaFYk6RueYpyxY0+RjpF4ZdT
 6N/WHmOhQJEVrHxKiovjVm7FfHrxU/Jd++ExdVDqIH2EilMbo88UtBvWHcDVaaJ/lTuo
 jAhKzPpscGPtMmgd0nQHECP/nASV31S6Grzjo/jD8cMlMyfZUJV2k/495i38XSK+2HSC
 YOsQ==
X-Gm-Message-State: AO0yUKW4SAUT/6EfFgwoZprRi8H81/di7KO4hSWJnt2Vwq6Xc6pZ4nLX
 WnmZ57yaO7rTH+ZeuT+RVKXFs5ucjsPPG0thDtY=
X-Received: by 2002:a17:90b:4a4b:b0:234:b786:6869 with SMTP id
 lb11-20020a17090b4a4b00b00234b7866869mr831600pjb.26.1677538911720; 
 Mon, 27 Feb 2023 15:01:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v4 16/21] target/arm: Use get_phys_addr_with_struct
 for stage2
Date: Mon, 27 Feb 2023 13:01:17 -1000
Message-Id: <20230227230122.816702-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: sRYP0AU2lw3S

This fixes a bug in which we failed to initialize
the result attributes properly after the memset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index eb3f37495c..95424bca4c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -37,10 +37,6 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address, MMUAccessType access_type,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
-
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2863,12 +2859,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, is_secure, result, fi);
-    } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
-    }
+    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1

