Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1156050lfm;
        Mon, 17 May 2021 03:54:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI9tnlwLPMORPoTDeoxPoLKhXXrDeygpVepWcyKlvXtDJTnLKF8svZCHx+ilRhTIdpKc1E
X-Received: by 2002:a5d:9804:: with SMTP id a4mr44607465iol.164.1621248874052;
        Mon, 17 May 2021 03:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621248874; cv=none;
        d=google.com; s=arc-20160816;
        b=JZJjkzFHkqXuE/RcMZqRO6tUlexZ+cYNt2txo2BtensVm648wTLFQiTs6WL92P+ocA
         oI51TBsg9kIIzx371labW6MUTOJSSqLDhcvMM9E1mXqdxSZxQK4mflvX4gvd8vkjjba1
         koD0n+KZhr1NAaSMgjI+a+xRBySJ6IfCsTvfxTq5OSVKudAcXvulaLiMecWY6Z5uE44z
         I8lyLRjqNk0JPVeTCLlYWo2a/CH1TnDGChKnYiN3gC11dVyKrHinlgJ/X9QYt0iIofPW
         vifJ2K9NjSBPy+FPwMuckqrstZ+cXd009SSaZmkVdPS9ZNqyqQ7ElgPG5EVQ6nzg4E7c
         DM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QZd/87Z8RVp2dDQlE17s2j2kfbwKqcNh9feGLDEoUT0=;
        b=0Jc8ojApcS5W+wjHp3GXIxaaTepW5d3TBzekq6g27EW0a069vkSCKkROIAm3y67sSO
         Q1FaVrkxLNU4MGLThXwVggF/Nfq5iic/VBDgu431B+/bo4zZ8/8QewQoQ4l4W1NoCCHR
         NQXGuqvNCExWcI5f01k+YcAeSN1VdMtpqYfwwJwsV0FMEzUt5DnzRcxIonLx+Sw+73Mc
         yv2UTjF3vaw2OpZsC9B1PSWGuwfM62kbxIyRyH9tlWCNX+gtb8/XDCUaOxvPoovlLj0U
         1C4x0O0U9Pu4R6+RilbJEJsoyGILTKw3dVptiZGxR670sO81SKwd8KDl2/WRZxyU9PBE
         Qgfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GSJGoC87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si16901516iow.52.2021.05.17.03.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 03:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GSJGoC87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liatN-0001iR-BR
	for alex.bennee@linaro.org; Mon, 17 May 2021 06:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqo-00046H-Oh; Mon, 17 May 2021 06:51:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqk-0006JW-Vn; Mon, 17 May 2021 06:51:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o6-20020a05600c4fc6b029015ec06d5269so3335451wmq.0; 
 Mon, 17 May 2021 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZd/87Z8RVp2dDQlE17s2j2kfbwKqcNh9feGLDEoUT0=;
 b=GSJGoC87NqEgxIwzRO1/6LBWqPZpuXPMZ0uXbz4T/sNWuMmbCnnuvO7vO19vrn5mNF
 sldOSfayHYF1gvCoJwMKAuj+1QCwKii25COszYAQyXKK8eumUNbi4P2D57Su8hFGp38L
 UzO5eLOhyMbUNxc+xkdcMlyo5We4ZxKSOaZlxAB4+UusHK6++x+vTdzaTMtFs7qXNgyr
 TLlH4pL+xNorKOAz4mzmTj+Z5YkNYRdaN5upqg1IfxNSz0ETlQL/XSupu21ISEw5WrN7
 WzE1u9OxS7aigVnYQfwLOckiW1U+1/itET15BsDkLkUPkWz/ee7jiSfEQhcTkLKUadYJ
 fTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QZd/87Z8RVp2dDQlE17s2j2kfbwKqcNh9feGLDEoUT0=;
 b=Xrr7PbmhoK2+WoxsUV6yUf5E7ZnRrvic/MrkO/0ZchERL54cLqWrx1TzQAB8Bww9If
 SI4K+4YH67JJkNb9N9z+UGeKyI3DpUgc30Gcc+S4ShRDMxN7F+0wl5Q8EixEFaO2kI2Z
 zGsX23jyRQPjSZKi4jO9vCFHP1g9Uf0nfo+H4/QgNPZM3SdGmBenatpcLeIV1L6iO+sn
 +/D8DetlkcOapwsDbbb5YaxPBk173/41IrKyHWPf94aLaMbXehCd0U01VXA3zAp5/3Nh
 +Thv3gi2QJIN1SnnbXR+vCWl09uAZMzHUBaQ8Pf3+arqGEJi0Gv1vO4wIFqIXRLlGiQp
 ySxA==
X-Gm-Message-State: AOAM530USOerGbQvOHhJ1ioFgPDGtO5WPCcwFC2DN4ONMlG6TdcxHo+5
 3SCRJTHfyVKoksx8l1AeiAhkcP2HGzbEfw==
X-Received: by 2002:a1c:7501:: with SMTP id o1mr64620985wmc.65.1621248707826; 
 Mon, 17 May 2021 03:51:47 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a16sm5196820wrw.62.2021.05.17.03.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:51:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/23] NOTFORMERGE target/arm: Restrict MTE code to softmmu
Date: Mon, 17 May 2021 12:51:18 +0200
Message-Id: <20210517105140.1062037-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rUs9xribjEDz

The following patches require the "arm cleanup experiment for
kvm-only build" [*] series with split various user/sysemu and
tcg/kvm code from the target/arm/ directory.

To be able to build the following patches waiting the series
get merged, simply restrict the MTE code to the softmmu source
set.

[*] https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02908.html

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 5bfaf43b500..09802ba1a17 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -41,7 +41,6 @@
   'cpu64.c',
   'gdbstub64.c',
   'helper-a64.c',
-  'mte_helper.c',
   'pauth_helper.c',
   'sve_helper.c',
   'translate-a64.c',
@@ -49,6 +48,11 @@
 ))
 
 arm_softmmu_ss = ss.source_set()
+
+arm_softmmu_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'mte_helper.c',
+))
+
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
-- 
2.26.3

