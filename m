Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5082291ejc;
        Thu, 31 Aug 2023 06:10:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaIe3DBet7gwAYRN2h0Nn1v9FMRrKSG3QxMKOWSL57axps0IUdW8Zs7SZkh4clYsRZ754I
X-Received: by 2002:a05:620a:2586:b0:76f:1c78:42f8 with SMTP id x6-20020a05620a258600b0076f1c7842f8mr3415073qko.7.1693487418844;
        Thu, 31 Aug 2023 06:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487418; cv=none;
        d=google.com; s=arc-20160816;
        b=rBKBeDAbYMeTrx+aEUMqA943C13oAYf2yJYEDloU+qixPWBe/UrQbLfZ4yLHMtS76/
         0gUO4LTnHGUAyAc0GIAv1Az23WKefqfT/yXv4Ywi5hPNxOWFUhOKDEmlPG2JeFvn7nRK
         lH5L5P1IBeAAwFWWQjO+WMpL+bHYIUYZ9ZjQDYegD7wgEo77CpCwwlTag/Ny8bXzpNa3
         ZK5ZQgTHvPSADnZmQujFYkAef9YNLVJcZLk0kXKmR30fKInqgrG52vxuM5E9YbR3ZtY8
         8ZoR9P6qdjX5aaH0xvfM1L+jUwo0lIy0EmoJr2ya4/hiyfsEUxPWjdLnGNCuA99u4b5Z
         7BXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kvarTMVyPJNAN8F64FPOFchFGECSfRITva9tLBVtfvs=;
        fh=gmfPYtg/3PIHe9MnGR/MVP+gjobyeW7X44RtogqBIco=;
        b=ebiFKFzsulLIboaZr2mjmKvdSx0Wa4O7x2YiXjhaocqjgTUdpmVnWoLsbcrq7De8z/
         zW0ns9uJEbK7vFdH3HSsPvdMf00nsHro79w6tQa4HYV3VqyVOzFHS/xIHybT1as+Tzpw
         kaWDU3R7D6nucfN8LXMJ4oTItUjzDXsEcTSquyekBQ+EC9Lr0oUzj9vcIwkR6iXa6sGI
         pDn13f9g+Wq+E159hvsRhisSU1PBhAyCNGUFrEqFj3Cca3ZzWC0Rmx0rKgp6YnexyblB
         NyWayEsKhTcBhZonVSP9jYi1rvqbGump+8MUuDFhRJlQ9lIMPf0iFN7x1VIfuEw0h9tK
         y/MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tCiZhZgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05620a090800b0076db2a74a65si910082qkv.174.2023.08.31.06.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tCiZhZgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhLF-0007uX-4q; Thu, 31 Aug 2023 09:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHD-0005AT-Go
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 09:00:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhH5-0006Cc-9H
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:59:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31c479ede21so616698f8f.2
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486789; x=1694091589; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvarTMVyPJNAN8F64FPOFchFGECSfRITva9tLBVtfvs=;
 b=tCiZhZgxWgVafbd+FaSzuyf1rt70TG/lynt8nDP3x7UnEnDZVrw+OC0e1/C5vmTv0o
 bubLTtjaUmUIBCNstzaVdYZNDjWsQAy3OzStFWsXNPM7GiC0DmeJXTwwCoi7+8Z/I6EE
 C14f+4JblobPW69agfSbg3Hp24a77NT0nTVXtYWlZK9xkQW0EHHr0A8NKgCMsVYECWju
 yR12QRYHFbH/7sjadn17uN0ynMhuDuXTBqN0fI/dfMx2ejyNj1900y0CtjyPdjC+6VNa
 u1pjHShQJRP6mBiB3aLJRJhIavNx3IwEoomQCfn68N90f8kMlCvBqzK2fgWswPejmQxK
 ZDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486789; x=1694091589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvarTMVyPJNAN8F64FPOFchFGECSfRITva9tLBVtfvs=;
 b=fG5oFBfeDp6GCQnEhyfq7vVSpScJhWhlwDrVb8DzuoRjs1mZZb7oLr3trn+9K+VIks
 EqNFyInjvsI76Ft2dPXn/6krdb0Ctubq/EhC8iW2pxc2xGeMHaN+Dl+WYJuczRg1M+6Q
 LUFbMz4su6AyH4oed5KepqxTtQLsqbEUiW07XVkDc4vWeEHwgP96Hwi6tTrQi5ayr/BX
 iKO6QaCclSq/Tbp0Y1FzPiQzRNCJHJ9GakFdtiay9Unr5IaOZ7v4PQvhwJSi5coP4POT
 ksC4HIWq735NwM82qxD0nIswU5xJHSHo9fo4hM1k8xkj2yafM5aDyWWqJfL+kZAkznVy
 blqw==
X-Gm-Message-State: AOJu0Yx4tzQWiugfMXjncEx41mNAqaPEkXahQPY2jZcbY7rkwev/NSJ+
 6wnjTpK0yOM22ie9cZzXqqrmdmhT0n3gAubRyA0=
X-Received: by 2002:a05:6000:110a:b0:31a:e87e:103 with SMTP id
 z10-20020a056000110a00b0031ae87e0103mr3499071wrw.48.1693486789792; 
 Thu, 31 Aug 2023 05:59:49 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 x16-20020adfffd0000000b0031c8a43712asm2168289wrs.69.2023.08.31.05.59.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:59:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PULL 30/41] hw/sd: spelling fixes
Date: Thu, 31 Aug 2023 14:56:32 +0200
Message-ID: <20230831125646.67855-31-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LJ2tRyWdWPOh

From: Michael Tokarev <mjt@tls.msk.ru>

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20230823065335.1919380-18-mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c    | 2 +-
 hw/sd/sdhci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 77a717d355..43c374e829 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1224,7 +1224,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    /* Block read commands (Classs 2) */
+    /* Block read commands (Class 2) */
     case 16:  /* CMD16:  SET_BLOCKLEN */
         switch (sd->state) {
         case sd_transfer_state:
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 362c2c86aa..5564765a9b 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1811,7 +1811,7 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
          * on i.MX, but since it is not used by QEMU we do not care.
          *
          * We don't want to call sdhci_write(.., SDHC_TRNMOD, ...)
-         * here becuase it will result in a call to
+         * here because it will result in a call to
          * sdhci_send_command(s) which we don't want.
          *
          */
-- 
2.41.0

