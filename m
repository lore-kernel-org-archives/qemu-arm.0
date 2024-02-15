Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp739636ejb;
        Thu, 15 Feb 2024 10:04:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU09r7PwMggMoE1UvLtzgrRpuAVZPXqSiQ3Bx0kN/CoE3sM++o2WsQmEHBZDh+OcoIDYzeGrI+Z4XfGsMKR8jOimTLK01qs
X-Google-Smtp-Source: AGHT+IFud1tWxAKkzw5MKCrmWB6elqDYjeCC7V8NmljWLjHMi39lePjD880+SxRyaNo8Yx347xPe
X-Received: by 2002:a05:6102:665:b0:46e:e826:941e with SMTP id z5-20020a056102066500b0046ee826941emr4425374vsf.9.1708020272930;
        Thu, 15 Feb 2024 10:04:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020272; cv=none;
        d=google.com; s=arc-20160816;
        b=1G+TzBYD2gsemUIpUYGQWKhc8F4TOoaePkQI6UsIX+jNnjUKb7xkXeqPv8AHD3iAbI
         iQi2brsKvR1xamnv8/SUoXTqvoxl49OzL+ryBOn1LITlg4nZM6UM2p7z8VFV1cwkX7Ql
         im2wj1z8hflePNDSo8bNYrdjbHqjafGLkhi+9spNtZ/bJmPFIhgGxUo6ME8Dv+lsG1Gi
         h6VWwBAgTAfImzPpRjxfjIBlGqdb9nE+zFAP0uy3NEIALJ8zVd0mwqYoZi2Qiks90oDn
         qRc6Vmsma6RsEqagVsVUIPXMJ0OJkulI3a9pXCzRz9dirgwKDmsDEVzFo0YwHYIOytRl
         t0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h+kbuqXqvCRZ8Tf5uJ9Kz/BLctdAvrq0mkkiLJY8x1o=;
        fh=eg554/wN9JdRoL8m5vc7pYsz+4sHK7JT3j5kjbSQ8nY=;
        b=fD6lwt9NqSbTYjH8RTNzIw2hncRyalJYc/bbY2xKIV3qmsP5HpKVJ8EHqpQoc/b9B+
         R5lPsdEGwJ0it0T8KYDn+NzQNIBm+KIGsoJ/kuNP2yXGEfYrR5dhqYytUwuHtrzVPiV+
         Jgn4+z6NMUQ1j6hT4gwQHy7zKni8Qoz0IqxCPJgYCxi9KJMSOld9phIlDy38HY04Nk/u
         vKBfxIO/FwPZqr1c9c6VBr9ofuJKIcr6fx3+Tnt59QbgNDz4aetWcB7SOp8BLxgUXrkQ
         7j/qc7TexXXSjGzlG1koPP0VfskYay82PlkOZnNat18fGQyVzHSiyFbw6ZZfLJBKGMvR
         QcWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wv111npn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib25-20020a0561022b9900b0046b2f7369d2si471104vsb.230.2024.02.15.10.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:04:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wv111npn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag4Y-00088s-UC; Thu, 15 Feb 2024 13:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4Y-00084q-1C
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:58 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4W-0002yq-99
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:57 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so176004966b.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020173; x=1708624973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+kbuqXqvCRZ8Tf5uJ9Kz/BLctdAvrq0mkkiLJY8x1o=;
 b=Wv111npnzA8HRnLQS/dO+XtTNFlSUy25gFkdlupWEUG1ut/xGaupEo98+gO1/5NZEj
 /yVnJenhVVX6asCKB9qgXKZXslcO2e/hhbiWSudtdRMQFbRJTS5JKm212muYlmZfrF+p
 ZBDWd4R8216nP2/CuRS8YTlIEUfYVhhZNw/TW1+0fl0q67g7JB1TQTnmr8PY9ik4RgCY
 WmYi0WzXD8y6vaa1+guxwuTiCyzFZzILT/fEP+U8AHvkV6FSY2NQd5pu+E4n/CI3QBL8
 6W+RWllk5LbPhdt/MJ7NtwsOuLHws38kBPUutDSjoAIhsic1wQETH3uHMXP3JOwDdBQG
 R2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020174; x=1708624974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+kbuqXqvCRZ8Tf5uJ9Kz/BLctdAvrq0mkkiLJY8x1o=;
 b=Hy67xMRubvk1IdRXlUtGa3REVBrHPOs0NPc420QcgICOjCU5rmkcUuplJ7tGY9vN9L
 Ff04ghp7y4ZF0KX92moZ2B2YhESmLmC+kL+GV4/uKMcZQjaAMX+t+rAdQwqSJUrxBddX
 WSbsSukh3QFVb2TzNiiXlKNf0X01hsvGeZzWx7ZX97Vdo+e9hBHLRAdTyMxcv71DH2cm
 W4ztE+EOqxI0rzi/kxsoEfTnSucM1WMjbCYxxgUZ1PrZWQZYZPbmv+xjgZv4JhFYDTUb
 m78x+yHPeLp2GjvI7tIJm9yS+ENa/Hm2/K4rTmFiSJOiijNd/bxMv033s615G5PXcBuH
 PeHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKHAFxV9f/LDKmmgqUBmoEUhAeRqm+zEVvaK5omCP/hD9+sqhrFhkkhPlvbPYivJBVCsARyX+vV0IeNEKrfaGZFxJM
X-Gm-Message-State: AOJu0YzalT1laZ2j7n1VWuf2wEFc1+BtYMNEtnLWxqvJTHy/LHJJVT08
 4W7wFNsUVfNbl7gUGAJwhgMtq5GQQM3+aYkO0pAuohjtWHpc5fttqrw9V0NTYWE=
X-Received: by 2002:a17:906:c44a:b0:a38:40fc:2bcf with SMTP id
 ck10-20020a170906c44a00b00a3840fc2bcfmr1876968ejb.60.1708020173711; 
 Thu, 15 Feb 2024 10:02:53 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 uz16-20020a170907119000b00a3d2ccea999sm788056ejb.35.2024.02.15.10.02.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:02:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 44/56] MAINTAINERS: replace Fabien by myself as Leon3 maintainer
Date: Thu, 15 Feb 2024 18:57:38 +0100
Message-ID: <20240215175752.82828-45-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rDDd2OFXOTQ9

From: Clément Chigot <chigot@adacore.com>

CC: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <20240131085047.18458-10-chigot@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8920ba403d..0ab73b265a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1709,7 +1709,7 @@ F: hw/rtc/sun4v-rtc.c
 F: include/hw/rtc/sun4v-rtc.h
 
 Leon3
-M: Fabien Chouteau <chouteau@adacore.com>
+M: Clément Chigot <chigot@adacore.com>
 M: Frederic Konrad <konrad.frederic@yahoo.fr>
 S: Maintained
 F: hw/sparc/leon3.c
-- 
2.41.0

