Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5226853lfh;
        Thu, 2 Jun 2022 15:58:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCgLnorEqF2KfU9iT+iaEYqf1i5JbfSUgnzmneH6D3ZST5a5NFXC+b7DMIm4l6rlakHrdV
X-Received: by 2002:a37:9401:0:b0:6a6:9a6c:978 with SMTP id w1-20020a379401000000b006a69a6c0978mr610493qkd.384.1654210698622;
        Thu, 02 Jun 2022 15:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210698; cv=none;
        d=google.com; s=arc-20160816;
        b=aH6g2YfSB7GsbVgxBtME/fX/blv3vMWrESFK0qctmuuaRiDbzMg0MryRiEp6gPSkEg
         FLsav1zrJ9VD+vYcpwiED1grOQraEWRQGQNpdDoV2Vw/FiWlrklfQurgUILfzllTEANC
         YGhsmZVXg//T1OmSZ2h9IKdqdK+54g85FeHB9k4JARhaSvizLZWW4xFq57O9AZdW3CFO
         j/r+VAezE/tf+hjQI5CzGIaIEKXYbK7lt6w9th/bFm4L2IL4Ejla3remffeOTDWn1PNy
         5V8hexmdYC6ibcZb2gtTwF5GpPzJ1qxc/uCiqaLb83YWW8JB3sc7tOZYnKwpQQK9+IBe
         64kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SAiy4u2+hcjlkm4K4/FWEX6wsTP/y8YNbat6sNJslGQ=;
        b=JutHPvscJKpliQSZNsGqjpce8eUQl6HeFg1Fx7E0zWBm5unOHP5PorOCAYkvdv+ygj
         uBvQlTP8A1bV8lr4YEjTWIQu4TcdS3sQWhz5uh9rGdYNuNPpGy8FLDcWNKOmP3U25drs
         aEQ0UrkkoNv3ZlqP1Vq5bkCHqsDF2SYAuObpj/ITPO0Gi6rJKP7ONa1IvScl7cEqwUi1
         a0AStLqheYBQUe3Hyi0pJfz1/8QHB3wZyVCEwlqLyvzaSq/b/g88NAG4I/h+OVIRqLQ6
         zDpT4pfq1mIhOu+BmJoX7pB+LSHHLAM7FTDRXV9O+7jwJXmT+d8oTcwiWk7dG0sJRV/2
         gVuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LZVb9I1g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h192-20020a379ec9000000b006a68eb329d5si752732qke.674.2022.06.02.15.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LZVb9I1g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtli-0008L0-2b
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001im-GL
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskN-0000wF-MJ
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so5876427pjb.3
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SAiy4u2+hcjlkm4K4/FWEX6wsTP/y8YNbat6sNJslGQ=;
 b=LZVb9I1gjy3lEmOuvnrHzTPD7EeKZn7wicuW1n8fOgUHmjSpU1grEBNZyO63gg2mrZ
 WZHmeKlrfKOK4D1d47Zfizvroehz1IZRLT/CjqPGyj0sJDuW8yzGfG2kYj7Llz17jLF0
 YIe8pgLJgqXQ1wlI33LlPkIY+ARw5x2MEforEkIwMLIL6/qdp9eA2M79DEhG1LLeToSj
 4KgDKjMX/uE4hNsk4H6hLzlep/EoVUgbeCf/KqHABZVQDfr2XoQSXYIZMgTvqMe/logg
 3FgiVTwOlqwHLawAlIe3prLge6UX5I3jP6jtCqZYuCPSGw3Xp6VPfvv1CfoqG/tqvTJM
 N3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SAiy4u2+hcjlkm4K4/FWEX6wsTP/y8YNbat6sNJslGQ=;
 b=ly0Vzu7uAp5AFxDjeRifutOfJwRXyMw1CUruf5EHiQIayAZG6a7FR2TRVKCYfnPFX4
 Bfk3HDF7q+biZKb1RCFIuuQieLdrcER43zn3dDNt3u1/AZYWdIryI8TRqTjhrQkWl6My
 0m2/Y6PNdVGrXSM9/pYksWPHV4S0hG64yrZIaRgxNUx+cTeLBnHSgAu/9yI4IZpSHefN
 MNV4SoOt50FEbPGY9tETQyYlguFCofp4Mef117rrIyNlC+lUF7YBKRMsget3KgOyJN71
 KEJXcxJtMj490n/O4d4QuwyYkmMFrjuWRMsd+CKMOcHeow9J3FBHg+PPx2YekxLSWxe0
 6aSA==
X-Gm-Message-State: AOAM532QFK3gU2lGb9ym7sXbBIZulEYbRdpHD/xFVJDrzbxzAv6Lsa1I
 miwK5DockrAT4p1GcotR3pQfvg==
X-Received: by 2002:a17:902:bf06:b0:14d:8c72:96c6 with SMTP id
 bi6-20020a170902bf0600b0014d8c7296c6mr7019950plb.156.1654206770666; 
 Thu, 02 Jun 2022 14:52:50 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 64/71] linux-user/aarch64: Verify extra record lock succeeded
Date: Thu,  2 Jun 2022 14:48:46 -0700
Message-Id: <20220602214853.496211-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iSrRrMw04Vfr

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 590f2258b2..711fd19701 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.34.1

