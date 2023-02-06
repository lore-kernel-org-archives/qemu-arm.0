Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4122183ejb;
        Mon, 6 Feb 2023 04:18:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/PYZ3wfEnBJ+FLkj0gitgpGihlCFfIW38tVeAGLtvqpwW7jzzbwF8d1j+4Gi3qtV/Q1aq9
X-Received: by 2002:ac8:4e81:0:b0:3a5:d1a:8f1d with SMTP id 1-20020ac84e81000000b003a50d1a8f1dmr35661502qtp.27.1675685883797;
        Mon, 06 Feb 2023 04:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675685883; cv=none;
        d=google.com; s=arc-20160816;
        b=DJJ1I62cmOMAitVePisFF4ecb/VM7kom2C13oTwsVaoJH1ZtsJTS3hl/mIXpvnBguj
         lK8VmTYH6DIhc9XI3njyxC+JBlRzgsitv1RsE6qrxZ41uQ7FxktsPgAiMTe8neLLlLKW
         ZG4NJQBFVnMZVYfeqd8FgCQi85SXATXTgeywnjSVXf3sPBmeSi8XrvGdpAdSEvugQ2CK
         2eQKLKtu4rrnesytkduSL1rZHmolIiV8UY8XRmIuNmzoKr3hvfvBDdo9exnYviBzSuCq
         u3QmPSpnbRQnScmOFbEbDAV1gHd+wYmjaHtviRrgE+w0Whh9If1TXijCE66goYhugqWM
         N5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oZQQqvS93Cp9O320hulFrJMLKiPY6Is3cKN8j3DtZno=;
        b=ixehFeLjjnzr0FoJ/ry8qxugJ+p9wLs4wwY2EQtJTneRgEzzlNlOBtZ6aWXcW6VrxX
         kY2S9NnokTETKRzgFi871MFLiywnBA4w9xQqxshSyHsKzRmgIDJTdZiz/IkWJXrRbzDi
         Z7l8MBB+8hjgVZKLOpLwxifB/nMKXyz1tAhV5E5RUQUBqOWs8MWAoD2gvUfU2Xn+Z1dw
         NhLAP0crnOU7U8WJh9Pahp2hzhaOdzNgejiJm/BfJGqssJqQASI5iMKzh/nmDc4Pmh3Q
         8atObpAriLifk0sF7BjpeP4CMrfxBWHudaJk6N5fCxAR1WJn4AuT2em/Sx/baJqP3u9M
         MLMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tP9ZTFEZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020ac84588000000b003b9f89d2720si7024037qtn.88.2023.02.06.04.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 04:18:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tP9ZTFEZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP0RV-0007oc-86; Mon, 06 Feb 2023 07:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RG-0007jI-Ie
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RC-0005oe-Ds
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y1so10181980wru.2
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 04:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZQQqvS93Cp9O320hulFrJMLKiPY6Is3cKN8j3DtZno=;
 b=tP9ZTFEZteL6qefhcYSx3zLrP0tSgupipS2jh75FsggQLEUxITcXJ/QSm6QISJrTmC
 ozFDJ63BFDoqsODbFUm2ctx7XoYhoioi/3H43wr2FOjHOtLYfbM8czYvAeBad/aAGQD8
 m1ytOxLcwGeRuVEVpob7blJvMOBMgUe5vPLRDy3kmys7WbLC5MlcRpEBCb/IeFMq5nqD
 t6cMa8ScZ5LvMseIDHrom/xqZjlSl3qg2R7ARQDcMToZN9a0rTCcuVZ1AstaCbcSvvfx
 CUs7TOs9Q3NZrdINvy+pW6JE2j1ofQXAV50vE2lYKts4vlbLn2VInKK4BzU+YuTmTt/h
 uMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZQQqvS93Cp9O320hulFrJMLKiPY6Is3cKN8j3DtZno=;
 b=MfO3dx2vpwlqMnGLxcbmoltQA5JsLyd9AapYr6/NUaAto/Yglk+eDnEmhL1kTNG18Q
 qAAd+RoxDgcekKd8Uy4yYqY+nQQZ4ixYY+Qs5hz2tsPrWtkV0mfxWkCmm1u+cWg2OUcq
 FHoYfzflAAY9HQtHP8M1uK6YAIyRzRjuY8IIyQcUkcmQZgqbu3no3qEoFTUMDfmv68Oc
 mk3Pxr9JlceanBr2Qg95i67NNbHGzvUlTjsx070I6FqeBZkaT7XN9aKyeLY4jLzBWqVl
 weIZIkR/QUiFcBZ/83rUo7dYQ86QAQO7TUHAGtuz3gl1u6AM4HeE9u/h/Bnz+du4OmAV
 5TAA==
X-Gm-Message-State: AO0yUKW/348mehDwGQq8/ABJvVFe6AhfYo9nsHF3eSQdku4pMuzUXU8y
 GGfPoxlXRW8BEeB/KUQ15XhYdA==
X-Received: by 2002:a05:6000:68f:b0:2bd:e87a:7fb7 with SMTP id
 bo15-20020a056000068f00b002bde87a7fb7mr18421515wrb.26.1675685852075; 
 Mon, 06 Feb 2023 04:17:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b002bfb8f829eesm9171354wry.71.2023.02.06.04.17.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/9] target/arm: Avoid resetting CPUARMState::eabi field
Date: Mon,  6 Feb 2023 13:17:08 +0100
Message-Id: <20230206121714.85084-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: EF5MOq6tl3XY

Although the 'eabi' field is only used in user emulation where
CPU reset doesn't occur, it doesn't belong to the area to reset.
Move it after the 'end_reset_fields' for consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece9..bbbcf2e153 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -721,11 +721,6 @@ typedef struct CPUArchState {
     ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-    /* For usermode syscall translation.  */
-    int eabi;
-#endif
-
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
 
@@ -772,6 +767,10 @@ typedef struct CPUArchState {
         uint32_t ctrl;
     } sau;
 
+#if defined(CONFIG_USER_ONLY)
+    /* For usermode syscall translation.  */
+    int eabi;
+#endif
     void *nvic;
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
-- 
2.38.1

