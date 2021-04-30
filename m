Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp473347lfg;
        Fri, 30 Apr 2021 13:36:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtpeH0WJ/NSq434XrG+ksAwY459T9XgOG8UCoITO39qTHYpqLjowZKXEt+F8k05rYQP5IK
X-Received: by 2002:a02:230d:: with SMTP id u13mr6761401jau.53.1619814975339;
        Fri, 30 Apr 2021 13:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814975; cv=none;
        d=google.com; s=arc-20160816;
        b=DfYTqbRvOIJkuQmQX0PxyuNWqTppiy+CPMYXuGdAxP+5V911Et4c1vD8Fo5N+6e2Nd
         0LlfA0mBm35zVNUtmXnG4ptEQjtlTndNtgw+az1UpjI23/R7TT7SjHvIW7Hv1Ok8XOXJ
         ckGAaHBnhAWU1bKM7bzsj2ExHXPfccpRElm0BxfoveH5c6NCoJZrx05EWxWwKHbqa18m
         HPBVx4O+sElWoag4o7pZne7xXIbpd3H4q9gLRiUm5+FfeBkzdK9zGJjZoDOnFPDus73W
         dy0VkNk5B4ISGwV9MBMiJ6Gh28r0Cd3IvSR2+hnIakTYKQUNS9xd1NGYQLDsI9+B3mmU
         sEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=br78Q7AmWJ+XfOQwE2rDFXsz+3JbpInND1mUnQKHlAY=;
        b=o8xs6q2Z52aLfdzVIhRYfRTL8hunJQyh8u0ztD9yZ9/+oVt3ebTqRQ4LCzVySFfQOA
         o57zjaQuATOb/D5sPUISkmWYgiwiU4Ghp1Qn5fl+YHx9REgfw7XL7ZRpQ2Nd45QP+qko
         Rqv1zzcNYg2T+f4oOuaM+Rf3eSG8ymNWxx75Pm7gZdbRtYPebBQNITV+9zvoqiBgRtRG
         fHuGxk84J3hUpXM/5/YSTHItrGJgE5zQ3ZOuVdTWZLITu/zXqwZgkhOcy32MMJ0zG2yR
         lSst+i6WgymGD5VVZ38Tt3tk05PW1ISUn1+ceAUjg1KUdixZU6RncynaA3GD8RtXVMPO
         P6dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uE+DNl4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si3377750jag.124.2021.04.30.13.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uE+DNl4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZry-0002fN-Hl
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiW-0008P4-JR
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiN-0005za-Ja
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:28 -0400
Received: by mail-pg1-x52d.google.com with SMTP id i14so5677317pgk.5
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=br78Q7AmWJ+XfOQwE2rDFXsz+3JbpInND1mUnQKHlAY=;
 b=uE+DNl4Z32104nNSkPou4iulwrQVxJiXMsCKSSq4XhAvmsGYzvq0Scl+AKe++orTDp
 6BXlweHk7ZimFAwvBhmEC7Lu4AqbdGVjU9vnHqY721gYUyRntXpDJF1E0nF1J7XVd/kl
 LlVhchQOS8NUHENB+/aJUYMzQnSiBK9tipGtBO1uQ1at27nonvJse7S+ioLp64m3co8d
 dLQkGxQ2KPdtRViJb4WfsnyyxwEmmpq+Rj38dzN0s+4vS1KYkzZSTAd0uq0w/b/q8bAR
 srBMBszlz8BfyeD7AmjqeM0SHXgZ99/ngL5ZkhlhD1CHWCaa2JTMLePkbEAbT8ioOpu/
 DkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=br78Q7AmWJ+XfOQwE2rDFXsz+3JbpInND1mUnQKHlAY=;
 b=MeU4MKahe4H5PBq4qpH+vo6CPLkLzPXTtVwYrZUNLnJAAKqvgB2yT1ASMla9Kgs11e
 vZJax/yc6FHdSOshmnZB7uswJRQO+HQUeShJYo7gqDKwjQ4DTsruLjEb/kNpWZJZgrIk
 7Rj1rpPOgj8ccjIXNRdo/FpeRPbt5OYvSVoOqBJFGw5MOcGDMVb9GBnz4FIiICei+AWh
 QYsDDyF8YLX3tXnV7XKmpzuhK8qlP79e9UO0LYkpDvIiKz5wSHm52aL/v7OYebrPJFSC
 Y/kaI9JLgQxQeIBaDE54TL7NRByyr/0dH6wKOXo3v7uRrJpKhVTPtPx80Yy2FFWr0Fun
 cQxw==
X-Gm-Message-State: AOAM53133Jc2ABpPJjgklspSip1MONIvuh4Y/vMI4Ait5UgiE3EawODo
 w3mpdCOLIJntk2Z5lcNKx/VPB9yv8UwJiA==
X-Received: by 2002:a65:6a50:: with SMTP id o16mr6335989pgu.6.1619814378075;
 Fri, 30 Apr 2021 13:26:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/82] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Fri, 30 Apr 2021 13:24:59 -0700
Message-Id: <20210430202610.1136687-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nqc96ZVbrFWY

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 6 ++++++
 target/arm/translate-sve.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fbfd57b23a..12be0584a8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1178,3 +1178,9 @@ SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
 SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
 UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
 UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract interleaved long
+
+SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
+SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 22983b3b85..ae8323adb7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6016,3 +6016,7 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
-- 
2.25.1

