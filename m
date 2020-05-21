Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1917289lfb;
        Thu, 21 May 2020 13:37:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9QM/y6gZGAV3Mi4NrtpMs1KpryY8ezDQ/vyy+tQC9p41cguwFvI+L4ky/U8g7sQW02vLa
X-Received: by 2002:a0c:b354:: with SMTP id a20mr530448qvf.205.1590093468309;
        Thu, 21 May 2020 13:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590093468; cv=none;
        d=google.com; s=arc-20160816;
        b=wWEKgTBvgdTDZQ6CY0QuHnMmbJYKoV503TSGANOsGYDlDe3oSczP0GkVyagY68Y5GU
         CoDr7A27VZFxJawD7jgs005grwY919lYCu/txYz8ehDSfQ5NulTQe49Xqfbs0nuZzoer
         c/avVMEguIA3wnQMxBSNI6mpNaH+KwbuhA3DJPqQBF1pETbZvVOlqPaS+IE0NvU+/Vup
         HMmbc37B4zF0q26Qcu43HfcDH4bII31u28ZQ7v5JP1HwNStaL+0VMu6sTIdhpkema4df
         C+TjO3IJEuxAn8UtSMhfnJhzrSJhEbZQMryZFKG6HxbBsi7+UQc2ZWypOogYvp2rMPss
         3Htg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=oFHRlojcNpFQuMJIo95dy5CUFH50eFtN335sC34/7o8=;
        b=bPBBO6ZxQlEuR1jdxIOM/vpy/3E3/GOByF+Uz52UFSJjT57zr3NPhRoYKdwarJNNuh
         REll67qJkexZMv1tMzFivhWh/n2qPsr+ZdJYCCVGZU8/uWLzXeZdOlY+gBf8/TgiR2hf
         gkfeMfBz+sfTMminUMTXDlqnQCPFSnqdup2HGPSA5EMAlv48ln9sm+IVXw+ikDS2XMWu
         fYNKFBOPH58m9rR0G77WS6UwJxigdadRHey8gdK5NKxxE/BxNf5c0a3m6P7tvsbkLA63
         wkV82Y11EphrcPvwHTEukf92wYaZMTUwBymTgabuqBhI54MTFBCdkPg9KYV/pt5+YiZ6
         PBOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="BagUEr/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si4068200qvm.12.2020.05.21.13.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 13:37:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="BagUEr/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbrwp-0001i1-Kj
	for alex.bennee@linaro.org; Thu, 21 May 2020 16:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31tTGXgsKCJc8JB9EE5DF5E7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--hskinnemoen.bounces.google.com>)
 id 1jbqlW-0005ZQ-6l
 for qemu-arm@nongnu.org; Thu, 21 May 2020 15:22:02 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:45745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31tTGXgsKCJc8JB9EE5DF5E7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--hskinnemoen.bounces.google.com>)
 id 1jbqlU-0001jD-LE
 for qemu-arm@nongnu.org; Thu, 21 May 2020 15:22:01 -0400
Received: by mail-qk1-x749.google.com with SMTP id p5so3349641qkg.12
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=oFHRlojcNpFQuMJIo95dy5CUFH50eFtN335sC34/7o8=;
 b=BagUEr/EDaw1e84DTo31bTqCniDwb596evDbsKtUIlQxIhYftDSTi/fZKojKp1Keyw
 7ssnrmYxiNVqi4iBEpklgNEcYmkxvw5iQcGLemufByU7BAnl4Pbo7BT42i3hsxkHF0m1
 9jZPmI0ZlZIlvKM0X0307uBWI9AlhrmKF8oPCkiA5EsCP+GPdZRSRqV+5JOloUxTHqKi
 Kq079b2sxYmfohASiHw6y89nLkoa6zqMyiZFCEzgY+7+KcagCWbfOWnQInppeT20r8Sl
 XGNrkeCBOPC32juPDjyxT69yZu8XG5TFXyaqhygptb+MjjUrYA+cuWGa9nqwTMr4UByi
 0zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=oFHRlojcNpFQuMJIo95dy5CUFH50eFtN335sC34/7o8=;
 b=a4/zFxwD1UMYE9J4gQFlXspSqrgvJn5axeT0gBoQoewlCNYZ4iAYPYQf919DJcjX0M
 8aNz3btVaHK8ZknagV7NgTaCUhZuZujEFfe/m51XaHJXN8OqYLP3D3TsnxB/kWYGc/5x
 u5hewywJYK9/4NLx6JG6Qn4i3cd2DfSBEmk46BVgDEqDir6SKfqPODLSvLUg0/3tAjss
 iJQW3Mv09DbAEWlWst2pILnCFITkr3AuW94Tjr5wFyAj1SccD5+TMXWAwYlnz4Z9cmmr
 FDhp9jcuYbZ+MrM5H5nFaqTTA/gaaGzQu4exMs00lZvjZKdcFlIet8IppF7VFPp8pmB5
 JMRQ==
X-Gm-Message-State: AOAM531XjyFVtA1CHCdH0wPHVmzs2FrZf9fBqCjtAZ4Q7uomESui+Nj/
 pUhFTdXaNNQOZc9guLJ6jJ6NGgmutzGSYcikNw==
X-Received: by 2002:a05:6214:370:: with SMTP id
 t16mr231743qvu.197.1590088918969; 
 Thu, 21 May 2020 12:21:58 -0700 (PDT)
Date: Thu, 21 May 2020 12:21:28 -0700
In-Reply-To: <20200521192133.127559-1-hskinnemoen@google.com>
Message-Id: <20200521192133.127559-2-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH 1/6] npcm7xx: Add config symbol
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=31tTGXgsKCJc8JB9EE5DF5E7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--hskinnemoen.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 May 2020 16:37:25 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CPxkIKnfmNtF

Add a config symbol for the NPCM7xx BMC SoC family that subsequent
patches can use in Makefiles.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 default-configs/arm-softmmu.mak | 1 +
 hw/arm/Kconfig                  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 8fc09a4a51..9a94ebd0be 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -27,6 +27,7 @@ CONFIG_GUMSTIX=y
 CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
+CONFIG_NPCM7XX=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5364172537..47d0a3ca43 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -354,6 +354,14 @@ config XLNX_VERSAL
     select VIRTIO_MMIO
     select UNIMP
 
+config NPCM7XX
+    bool
+    select A9MPCORE
+    select ARM_GIC
+    select PL310  # cache controller
+    select SERIAL
+    select UNIMP
+
 config FSL_IMX25
     bool
     select IMX
-- 
2.27.0.rc0.183.gde8f92d652-goog

