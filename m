Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp736678lfq;
        Fri, 8 Jan 2021 10:52:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzc3EjYynITubNmQUDV2IcmC1uDYckZmQpGGwItowsn7+hzWgw+5Nflc8M7kre0kVRRlEst
X-Received: by 2002:a25:76d2:: with SMTP id r201mr7572193ybc.107.1610131941108;
        Fri, 08 Jan 2021 10:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610131941; cv=none;
        d=google.com; s=arc-20160816;
        b=dGvJ7igSwWRbkqT9XS0TivaZD7U8ZtywPtcfl5oj+ss8t5QpbL/henJlyqhlrYBAZ7
         Y421cKC/1Z1q0tIzG4syWyudVYAvFkApG7wWfxt/btCEKzot4zjBhhbIGjKVOR/VF6JP
         ptNNjiCHd0vSy+ciB3oiq9eBvh1lKd5MtAdTSI9xFY2bKiiy0j24MhMBVHUMT/hzcja0
         7ShgEbyqjrQ9V9yeVWli9GfAamHn+W3dKmaoTK6ayU9cpgLHMy6ldKJPIiDUcDkyXMFm
         0wCx5bLLQOBO+Lpai+LS5gLUxJ7NB9WHD4QPg8j30LMfDfkOr2YvPG1wlHd8kLnYiheV
         oA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=His0BTVqpkxUWnuh2zB20a08QgRZucIAGlzkuVBHQw8=;
        b=RVk9UKxxU8ogamvAdCHzf3Kt6fYIyLR+YtvpTO7gntwOVaSlICzo3CbXVNO+8FruM9
         Kk4vEqoe6LTZp8q2FXpmNLxGJZFbNHg8DKZMMrEz/10+mHu34KS0x0ga9Uw+a5My4q5S
         X7f3tMFj29Mg8fjC++VijjAbYket5F9XC8OJ4VgyX/5viCGyDjK4lfMGaDnAmQ3/HFE8
         JkvVahDhY0fr/fmrTdzgYQLqxdpBNLPpFAfJ3xyW2z9zLct4UF6K6IL3WiB/6JqS0dXv
         7rmnQKTyvZWfHkgyVDzwvU8cEB6OHeiFlJ8CuwAR5XFvJ/6tbCEZ+4yVVXxgd++7FHmu
         azRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=NpxhsKMm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si9375869ybp.419.2021.01.08.10.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=NpxhsKMm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxws0-00026K-G0
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrg-00024t-OF
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:00 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwre-0000tM-Pp
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:00 -0500
Received: by mail-wr1-x431.google.com with SMTP id c5so9947065wrp.6
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 10:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=His0BTVqpkxUWnuh2zB20a08QgRZucIAGlzkuVBHQw8=;
 b=NpxhsKMmh298L34oB2RbvEmviBUMbnsGzkA0xxITwvtMV4o8n6HoSQppY+lp4BR80T
 DBX0LNTENyUFFrAFoBWWMHvoa8Ixipz8mH4aPVWjmtrQFYMfX7l8Fq8PMtBZhw1ZKyX9
 tn+EDJ1kWOTy+mNYSdwcZ9Jqhy6mbOTfRPICJDntXjwwcT/ho4EdYUEd8xXaByF6PAW2
 6gkfGWn0l5xbur/Y7+z/4nK+gk4hkoA2ht9BGhu7F3W10bFlCeqhqJoeSfTr1lGJB7/T
 kn2lQ5FvAoJqjKKjaaXeHL+5rYb5NecXrukSsUpAEI3LSImBznkOMl/o7UEKJaTrsddk
 hWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=His0BTVqpkxUWnuh2zB20a08QgRZucIAGlzkuVBHQw8=;
 b=jfZsCeI6r6CdXrgRGBGCfTARl1Y+L1dCEXHXVpNwotrOYTAAdVuY5pTJrWFzrqOwfh
 LQXCaPpSibAajQWMpUcJ1Hg3B9vw/mryjBLjiuZ3YUwgEcmPL7scYS7X0SMaH+GgY3ly
 rOGIDqxyfPMRVLA4O4LHxBtma3tpDMVThP39l2D6+OivepK5SF21sjOxQb60NZ/CVoFg
 qGeRDhggWr6pKXrqdE89dkZtjcSJIPG1CmWw3OW7D9H8uZ+QhbrEKMGTusEHpw95aWpl
 cAS2twctWzml/S4Oy7cEpQlu64cnKewiKILVcvNLbYtt7M/YhByaNqUMlvuBcTze7ZAV
 4lEQ==
X-Gm-Message-State: AOAM533sNSexD07l2vtQPQNOmg3llitUwVHLViJxdH4ht3vW3PAT14FM
 VFfdmrJXHb9XafyVBvaDC5aD9w==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr5039201wrt.209.1610131917585; 
 Fri, 08 Jan 2021 10:51:57 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:56 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] target/arm: make ARMCPU.clidr 64-bit
Date: Fri,  8 Jan 2021 18:51:50 +0000
Message-Id: <20210108185154.8108-3-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BwwIJap5ZkxL

The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
Extend the clidr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e3cf77ec7..fadd1a47df 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -938,7 +938,7 @@ struct ARMCPU {
     uint32_t id_afr0;
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
-    uint32_t clidr;
+    uint64_t clidr;
     uint64_t mp_affinity; /* MP ID without feature bits */
     /* The elements of this array are the CCSIDR values for each cache,
      * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
-- 
2.20.1

