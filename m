Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3352951lfp;
        Sat, 15 Feb 2020 11:16:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/K3M39QYv+HpXaKGSxIglV5658XIb5TuDJXuT3NVAiSx9s21/n0RUn+TPHs/YWznQs1iN
X-Received: by 2002:a05:6214:1389:: with SMTP id g9mr7002234qvz.40.1581794162730;
        Sat, 15 Feb 2020 11:16:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581794162; cv=none;
        d=google.com; s=arc-20160816;
        b=DLau6CLF1BDN/MRp2bsBQq5Roi6PIxNF8j6pEWv4GJbQBIk9BN6Fb/pmDHAyQbD0XG
         C01AyoucjBI9fQ7Legf1jJ1xdxrvBvdpBvJz7JTqH6HXj7Um59zFk2vTVEnBv3aXNHXo
         l4mTYpG/Ny5gKHGxWEzMSpN216JmR3hD4b3m23wrTU8AFnVB1jOpxzdbb3+7+SSX3vtz
         zF/ITTkCb2NNPPUsyC3Ngit7onMQ6RsH5f29PQy2F4DBRKibNNVvf4CdJxfEbU8GahY2
         uS25OG98VNPj679017IVvHwoa0O4ToJNETn6M2OnDSMssKhsAtm68v0PzdGESVpipZYh
         eRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U9IbJegp6ro9etowLEDI81LWF21oSicPzoRfxCT2gAE=;
        b=afglGltikvapcIz3Gj73HBc0FzYIWoue617l1xaP+O+8ENo+BHt0oxQ75Ut3Vp4VYd
         9STufO9X7JvHlQcot34gHSGEYvWhTvfCod/vFbWdktMmEhF1vrs6IaUU5W6I5EGfgeDv
         zcVc80sY2oe8AWY/L4aMhCnRFmKdmilnwgyFxUU+Koj/VSvmTEFkxmc4+iboT8xtfGaj
         9hojMns2VnLBT7ZL3FGdMMyMHpKy0cY3z7op0QWhsL0eXt0Nr3vumtceMFNGPxxxmQYG
         tafHEj3TYAE1F2tEg4BFUvpqp54DExmBmGLwnJ1dir3jFRAiwGNl+X+WUnXgvuBp7F2O
         Oz5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jwUX1bVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si4538224qtd.247.2020.02.15.11.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 11:16:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jwUX1bVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j32v4-0008HI-4M
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 14:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32uu-0008Er-4Q
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 14:15:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32ut-0004F3-4C
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 14:15:52 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32ur-0004D3-0O; Sat, 15 Feb 2020 14:15:49 -0500
Received: by mail-wr1-x443.google.com with SMTP id w15so14913684wru.4;
 Sat, 15 Feb 2020 11:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U9IbJegp6ro9etowLEDI81LWF21oSicPzoRfxCT2gAE=;
 b=jwUX1bVKPlEVamC7xeJM2FkOEX1IWPIb1Nbk94LjK4dX4dpa1KorS6cCMo3IbW77fv
 IiYLxH82BpQX8Gf3m/LU7jb8bL7qiS4jj6u5g5J1w+IwKXUPcDPgdZjv89fiD+ilmDPS
 nzEMJE4C1aKXVbjBiS3CF9V113tXtu4A46p52LJ663npGp88AwnmqVE/pF16AEL469Vw
 wYlnVQyu0ktnlTJDmifzKiRPlT7KA1nckdO6Ka/H5Gx6zM7epG83D736t3C+RZAQBgr1
 xpaSdkgVhbfs2xdwtBL9L1MlITDJIN+aLWRTShRZNClBmoXj16LIGRqbkhxYnZ4QH8rF
 +SrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U9IbJegp6ro9etowLEDI81LWF21oSicPzoRfxCT2gAE=;
 b=eWEwMQEj/wFbElt5b3KMxNhVEPE87HN0XwcP2HRGbfRXLJGbvknNt+8UPG8xQk4U68
 kYj3+uBVKJ3W0RMTNq7O8lhgfVCK6AjM38PPJAKGfgX4yb/Poyk6ougxuKJ4VccCrDr9
 rb50vLJe9Mqr4ZCKJs9mLpIAM5vGR/DnPq8ROQ1NjWRmpJGTbSS/tsJYdQ2GPs/vTPnd
 IUIiIxOIre3w2+a0K1U/3317224sSsnxwQC9E5jfdfY9oebInOTmyiAS9DZiqCKXXDyZ
 xWRzczRLGiLEtmdRtLO8bJ3CqjNe+9qquk70SYJRHqg3q2jvgJoC7DUC+Uhrub4Eao0V
 M9Dw==
X-Gm-Message-State: APjAAAXe4DWd1DwgSOHvl8bqDUMJk8/mDtbzTJ++YMnVG1b1+JIRO9Tg
 YoeOVgdS2j6Xch0VQk4lMnKw4CmYE5o=
X-Received: by 2002:a5d:488c:: with SMTP id g12mr6650289wrq.67.1581794147765; 
 Sat, 15 Feb 2020 11:15:47 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id o9sm9678605wrw.20.2020.02.15.11.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 11:15:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/12] hw/arm/raspi: Remove ignore_memory_transaction_failures
 on the raspi2
Date: Sat, 15 Feb 2020 20:15:32 +0100
Message-Id: <20200215191543.3235-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215191543.3235-1-f4bug@amsat.org>
References: <20200215191543.3235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vrnnd8f5KhPs

Commit 1c3db49d39 added the raspi3, which uses the same peripherals
than the raspi2 (but with different ARM cores). The raspi3 was
introduced without the ignore_memory_transaction_failures flag.
Almost 2 years later, the machine is usable running U-Boot and
Linux.
In commit 00cbd5bd74 we mapped a lot of unimplemented devices,
commit d442d95f added thermal block and commit 0e5bbd7406 the
system timer.
As we are happy with the raspi3, let's remove this flag on the
raspi2.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 90ad9b8115..221356933e 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -324,9 +324,6 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->default_cpus = mc->min_cpus = mc->max_cpus = cores_count(board_rev);
     mc->default_ram_size = board_ram_size(board_rev);
-    if (board_version(board_rev) == 2) {
-        mc->ignore_memory_transaction_failures = true;
-    }
 };
 
 static const TypeInfo raspi_machine_types[] = {
-- 
2.21.1

