Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp693517ejc;
        Sun, 30 Oct 2022 22:42:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZEvabaf+IyQBwnq+MIRPrmXSATx3IBK0Gg/LNuX1pmCVViAxF1kIpKPjthPFyyBGpGEwf
X-Received: by 2002:a05:6214:20c1:b0:4b9:f285:de7e with SMTP id 1-20020a05621420c100b004b9f285de7emr9425023qve.14.1667194943624;
        Sun, 30 Oct 2022 22:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667194943; cv=none;
        d=google.com; s=arc-20160816;
        b=O4D5M3g8TaxwugRBAtybyoiEGqKKk5ytd4mEla6hjcmiAOLNxb0sMbumtAY2A6aQ41
         FgAElnG02mjO9EAiSvbbDdTmiacJxpxgBvsXZk2OpEuHtgN61V8FZucnnBsaEu570r+v
         z1ibRNSrV5hJyfmR6S7ht0Ahn1Z1wLx9jjtdyZ0rDGa7OFc980EUnaf1gYjBh9Q328yG
         hbMYyUa9b26I92DIzFZQOc6iM8S3vjES5zuVLDzsOXyhTEirQ4QYVHrgIy2oP1iPdKVw
         uyIlhlnYtcysjz5Q3pwE9bxc8ZmxBFlSu7yVbAuKh2BXfoCi8t97qFfOITVuQf/1E+Hy
         k0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=aTEo0Aq3CF9CDtdhcwYs6wkUEncR0N5grPyzOskqywg=;
        b=QuDHW3UFDGx6Ngb2WxXDzMTw4HCNxamm6rpLbEabuEfq8/KORaLfv1y4MvlfDsctJI
         MsOgxdHgkoA7ThesSDCdOwGzuUE9JazmdsjHUrde/nVKZYo3Jtaf7o6KDutUBkYxElTy
         8HZgWcH+dNd/Hhxv+3X4jirbLpisBYX/TbifCKw32UL7OL76o0bdKrtlTcvmo/smrrxZ
         WSsNMcBUzd/elwej/i8xL7nWTAGJSnNdkLqsAWCELEGT8/DGXOsiC2licuIwZXDMJvsa
         0AZE1s//e/xdFL4nD5e3/wDSuVy9Y3LO3FMHshkmK9YUiAAIpVaBQlBhUKH/ahhw1MeP
         cK5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJnkd7K1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx5-20020a05620a51c500b006ce1c3e8439si3147079qkb.584.2022.10.30.22.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 22:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJnkd7K1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opNYu-00043c-9x; Mon, 31 Oct 2022 01:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNYg-0003Pl-UX
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 01:42:05 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNYf-0004Q7-EW
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 01:42:02 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so12455989fac.7
 for <qemu-arm@nongnu.org>; Sun, 30 Oct 2022 22:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aTEo0Aq3CF9CDtdhcwYs6wkUEncR0N5grPyzOskqywg=;
 b=qJnkd7K1CrDy7zmyaqTgCBAbGpSwGe+CLzYptT6Qtuc+R/nh5EvwVmHmpfw+9cNktJ
 X//ySs0NCubPq0tuZOZBL8ySjemIFcx/D9/ndJKYePQGf2szN0ZbZDjWEBTuMP5YfbcY
 /4TXBKBUpu+M0wqDHrVk2ZLcBZ2p+rMwThlJIvzekPcleWuC6450+YuP1CclNVRN4uhh
 Wf9BeobxjoWfRTBMPs3DKeiDRQajw9DIZGuK6le6dIi0qXiYbOquMU/bw94bk01wKmh5
 dWLIyyr+6OUNjn8g3TLU8TaDo8V78xtivDvq01lZgeqipRKQJZqFwnig/7AH0d9dKxya
 d9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aTEo0Aq3CF9CDtdhcwYs6wkUEncR0N5grPyzOskqywg=;
 b=mVWJzdP48ofSSTpLX1Go4VdH25BW/Biws+lv7IEW4l5AT89QMpZBZiVhtDFoRt+WQd
 G+IJSAKY2j2mY4mQJ+iN93ow5kC/oA+eXAP2skSz6xTDAke8xSoTUIbJ3r8PA7P6gpgC
 pFf1WS+AsqBXKxHJ4URUqnjL027cuG7CBMRO2GIGXyYQjTP+euZfAT2pOpQ0RvZ4MS3X
 qnXSuaCmshn+3ZJKd4OWvl2r4R3OXlqMCiu4szcpbK9ar4p6SY9Xoy6c+Z/qylVwEgZP
 8M9Nd9dzV/WfXMw9Ycm0ojDjFf6cInYCQQfUkhCT8u4XiR7dVeszK01ey/lHb4DMgSP9
 pPuw==
X-Gm-Message-State: ACrzQf2yFnAiLlSpJD8BkHSBpsnyRgLEEmcHv2u5N52iGAwob9bEhIkD
 7VRua1fh+hIt+BF+Mng+q7dUyg==
X-Received: by 2002:a05:6870:ea8f:b0:13b:8dad:5895 with SMTP id
 s15-20020a056870ea8f00b0013b8dad5895mr16274503oap.233.1667194920125; 
 Sun, 30 Oct 2022 22:42:00 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 i21-20020a9d68d5000000b006619295af60sm2388837oto.70.2022.10.30.22.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:41:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH] target/arm: Copy the entire vector in DO_ZIP
Date: Mon, 31 Oct 2022 16:41:44 +1100
Message-Id: <20221031054144.3574-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j+uxN0K29mkv

With odd_ofs set, we weren't copying enough data.

Fixes: 09eb6d7025d1 ("target/arm: Move sve zip high_ofs into simd_data")
Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3d0d2987cd..1afeadf9c8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3366,10 +3366,10 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
     /* We produce output faster than we consume input.               \
        Therefore we must be mindful of possible overlap.  */         \
     if (unlikely((vn - vd) < (uintptr_t)oprsz)) {                    \
-        vn = memcpy(&tmp_n, vn, oprsz_2);                            \
+        vn = memcpy(&tmp_n, vn, oprsz);                              \
     }                                                                \
     if (unlikely((vm - vd) < (uintptr_t)oprsz)) {                    \
-        vm = memcpy(&tmp_m, vm, oprsz_2);                            \
+        vm = memcpy(&tmp_m, vm, oprsz);                              \
     }                                                                \
     for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
         *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + odd_ofs + H(i)); \
-- 
2.34.1

