Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2512706lfb;
        Sat, 24 Apr 2021 15:24:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGrjnYq805ddhEgu7BMmflZstMvfoGCgTEoZLf1p6ubecdv+lJHTHSx34/oMjBX1/gYtO0
X-Received: by 2002:a92:d684:: with SMTP id p4mr8159442iln.150.1619303078968;
        Sat, 24 Apr 2021 15:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619303078; cv=none;
        d=google.com; s=arc-20160816;
        b=qD/96O4RAYasRhF2z9x1YhHNIILGZo+VRX+7SlTxQHGgs3L1OXjg4nMnwTVdwkfkBF
         dpvXOfbwy7LGSMiRBEz2fzXHINpRMxs7tsOyycq111+zbGlXngsXAkKWTVRBScWsh/eo
         fcJmuIU1kEjiaxiT/lecvUEPuGgASPh4sRNWFsywqOG4lGwTYQisTQlfnS0/JTsG2Rd0
         3AW8s8+fq6rLBnjXbNaG60lzgESHQQAKZVDNo9goljhP57qGurORXt3w2FnGY323nE/h
         o56tCN0argXXe4A+cm3eXscofsRlPVjIcK/836QLrKk7fwx7meAONvrGDkxy/9hTA+Ri
         0Teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3+dFOkI8bPZaiK79ThIQ9LdlMB5G45m7AJVe6I7EqgU=;
        b=x2jg228ll+ZXvFuHfUrSroKhXnuHvCckp/r7wjRmphljSVSjxBqWQhqQc6KMegcx76
         2J4lvAddmDEo6o5rlb0H0sB+eD+1lGuwttC4mrwwvzNFJTdHmT/9wVjIIQ4aP27NxtnU
         nQnCDxt17O20gLeNhi0XvxtxS2e4CJitOUQBLzgtbb3YG8m4sXJjGyed060+Cri35Bso
         XHHvCQyQmWcawF2FlH+BBnSFo1V5nwIyWVvNkI+g5g1c1UZ5H5R7sox+2w3074tKWth4
         hZxcMaVJ9WJWaI1o8KsnSFbwTCFqWG50IgeJ+9TrW3JQR986YcSPMYfRz06uXG01+VOe
         mSGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LUPFyRfY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si11217308iok.62.2021.04.24.15.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Apr 2021 15:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LUPFyRfY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1laQha-0004Y6-Bu
	for alex.bennee@linaro.org; Sat, 24 Apr 2021 18:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeI-00017n-Nk; Sat, 24 Apr 2021 18:21:15 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeH-0005k3-Dc; Sat, 24 Apr 2021 18:21:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so51929917wrw.10;
 Sat, 24 Apr 2021 15:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+dFOkI8bPZaiK79ThIQ9LdlMB5G45m7AJVe6I7EqgU=;
 b=LUPFyRfYd/6E9Dz/JYPhuaS7QsXcfHwnogWrO2VNOxv8WJ53TRL6sdZUar37d8BdwE
 MLEXd9qmGwNW3xUUGtzE0lq1UX2z+cOKneEMvypSqZMdPvtQZAT9spyl8kwUI9V43/8n
 Xwvxu9oWElqw1N1RCfIplnw7MAPE4NunfULzgVQU8z0+h1MLC3LdJN9XcKrqDhOmlMwr
 g3vWAWxZBeOU72NTqHNsiHPBBiUYT8v0Uto1w0FILUQaWu4Lyz4tFDIalZBM3dLCDk/R
 SR/aZM1njmOtO3gaajKHjddgDH4mmLz+pAM50Qer+mrO5KS57+4drJkWM0md0kwnuCNX
 L4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3+dFOkI8bPZaiK79ThIQ9LdlMB5G45m7AJVe6I7EqgU=;
 b=C21sqHoBiJpISB1FKjCPj9kFq6r+ai9RA68tkwnBXm5dt0q9x2Xz3qazGaSO4f9Piz
 iXggJQP0s/DkhFmi73adO14hhIlYj5+EGdYjpPpu7Dkm06KxXpLrSA/APFha2dIDPf96
 CiU5YXvW6Tnn2yyPkJ3Hunqct2vcTTC12nvuNrDYkh3hLAFF9AgmahcMaXw2U4n0KNrs
 ApEfsgTAeTxcGal+Dk/OhAXDH2AoKXNDi22EkweSSFpKmMEqSJhuY/sPKPB1OteRR297
 ZEcZY+w0je/wiJKET5gBLrmDg9Emzm3XtZpgivrd3u4hpxBVuBZKqCjygWARzM/qLEM3
 WaZQ==
X-Gm-Message-State: AOAM5315RBIV7eRjs0VRD38wnSnyTaRJbs5Gjli9VnwPkobRaST6BVhb
 RRggQHjHYuzoZLybH02C55JSbU4Yy3D6ow==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr45309wry.265.1619302870880; 
 Sat, 24 Apr 2021 15:21:10 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m14sm13589558wrh.28.2021.04.24.15.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:21:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
Date: Sun, 25 Apr 2021 00:20:56 +0200
Message-Id: <20210424222057.3434459-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424222057.3434459-1-f4bug@amsat.org>
References: <20210424222057.3434459-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ToE/7UCRm1j

The Microdrive Compact Flash can be plugged on a PCMCIA bus.
Express the dependency using the 'depends on' Kconfig expression.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 5d9106b1ac2..8e2c8934549 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -41,6 +41,7 @@ config IDE_VIA
 config MICRODRIVE
     bool
     select IDE_QDEV
+    depends on PCMCIA
 
 config AHCI
     bool
-- 
2.26.3

