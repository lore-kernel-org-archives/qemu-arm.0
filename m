Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1197985ejb;
        Fri, 20 Oct 2023 05:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2+Puq5dBs0sj8d5IF7kAgfN0DkjWcWByNatpnLjwIeFRoaRx4rTF/vQTiuoHVCLUySlPd
X-Received: by 2002:a05:622a:138a:b0:417:a74f:69b6 with SMTP id o10-20020a05622a138a00b00417a74f69b6mr2000364qtk.65.1697806539240;
        Fri, 20 Oct 2023 05:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697806539; cv=none;
        d=google.com; s=arc-20160816;
        b=xTKMYqbysXbCe7B8aRycX09rwNBIRG6gdEPYh4+ZibkXSKt3TW4dy5VpU/PNbHKLgS
         eBaD7vzJBuxJeOCD2r8eKmqDTQTgXraeBp1nEAyTKH+EyJe/TWaLpZcoSSkl6DIC7FRX
         Kth4qs5T81LM8L3DlNEAVgJqEG9pBnaEI0qvl4BvOgBtICHYEDorgp7kICMJRi8DSJkO
         PV/m+NQn4YqDDcA6Qnq18NpFqLfJtiNBD9m2edtV1Yek/DKdnqCOaCOcW3YoutEAJmK8
         Tmwi3YiYqZIII7sLa629pmjE/tGJ24Y6CXvAFKIeUcQrrOI+hhTnoOA+Hq6n9VKYiIDH
         ThFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ah3WKGt0I4J6MGqXZ6iDMJbohTp8VA+zrxGknDCvKfI=;
        fh=hxN8r97iNzWvC8+Bso8+Ahc7JqNk88nE1GCafnow+Q4=;
        b=D6TLamKfI2ywFFdoDsCcs3o4Wm07vccS+NETlfmWO2ll1BSddRBZW99tJSLUDDAB96
         w/Plqlw6h4Kh++ze2Dfi9tcU6GmGw1jw8ynvt3ms2UDJ7nBVq65n1o2Wqr1hytkzqtZ0
         xWNI9QNIrI3qCMouMKJijd04dNIASwGtM4ShzACHcpjcslX8CvbBKBC2GK+wYd/23o1t
         y33Cqh3Ir72qNjXT9Oi9fw9FV7zc2ekWYippzlVnFr4dKBSG801/43ZDDoWETp5du6Hv
         4/hxQJJdaplDOHuBOVjGEHMVSUcxSc0NGTXBaUbtw7Rbg7N0W18MImhD5olHADxwJVCH
         hDVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3KlTbz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac85c56000000b00419986f0f8csi1193454qtj.633.2023.10.20.05.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 05:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3KlTbz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtp2G-0004oC-ON; Fri, 20 Oct 2023 08:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtp2F-0004m1-1b
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 08:55:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtp2A-0002AX-VQ
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 08:55:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40837ebba42so6068175e9.0
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697806521; x=1698411321; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ah3WKGt0I4J6MGqXZ6iDMJbohTp8VA+zrxGknDCvKfI=;
 b=b3KlTbz5AnJg1Ee/nInZ/tOzF3ttv4g3n1Qp2Tvj8opuM3NR4Pcc/MpdaYX4JZnOMD
 9qU0PiUrowC4vG7qeUwX9HQKWMwSB+bGMC57wQbhkH1gBwmRfdqhUropAwIYSDz7GvxS
 9GzX3rEqtPHGWttFut1g1z2hndnv0nLIiJ6z5XjqDf4JKX36jmjQ4W4rjazXeUfdVSW4
 6UpbNx8ZnMWav1Nhv68epoN8R1/MwKsDMVOUiQUA2ilUayqzJnX/bk2u971okezycMBd
 6oxfbW1vPEWXulHIyX51hwExsb1jzJ4qlSaSKu/b5p8xCRjdUn3mV9tRYleh0TIix39P
 vwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697806521; x=1698411321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ah3WKGt0I4J6MGqXZ6iDMJbohTp8VA+zrxGknDCvKfI=;
 b=Jt8NEx9A6Rs5Id4kmtEGZjpLJ1AcagnsRBTOaamcAJnEHqNSxhvrrMTi6UHiHLqWs9
 AKAUjsEhUYpzv8abClvM8kSMnXiCQC/UC5qXsMDzgmbBwggv4yOWgSI/b+zKj/+6Je5I
 QlETZZbcS0ESZl5nT6IsFUA5bASDdrmgnys9eIovzXN1h4CtdC03Nz/wOGPRWIfAGmQb
 4q5uHqaqIU7ywY/IGPvckn7gVU6CPRjqZZRrxf//HRHoLRtqj15A2otbcu/ZVMfGZPxp
 gSAICtHzctEFvcTrgThkEFMc/j76SVyXJ0eJ8Ysm1qOe72BHPfTYLehfxkZ3gKi5qNi4
 Cmgw==
X-Gm-Message-State: AOJu0YwlGcE5jwAK9kDecalk9PC4JAXVogQgdTCNUxJdveI42TbaI83k
 mDX64vhCi3nj39/NcjGRneXjsg==
X-Received: by 2002:a05:600c:4f91:b0:3f6:58ad:ed85 with SMTP id
 n17-20020a05600c4f9100b003f658aded85mr1587399wmq.10.1697806521310; 
 Fri, 20 Oct 2023 05:55:21 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c230600b004083bc9ac90sm2079272wmo.24.2023.10.20.05.55.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 05:55:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v3 06/46] MAINTAINERS: Extend entry to cover
 util/qemu-timer-common.c, too
Date: Fri, 20 Oct 2023 14:55:09 +0200
Message-ID: <20231020125509.49440-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020125509.49440-1-philmd@linaro.org>
References: <20231020125509.49440-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: a5NxTiONMnnJ

From: Thomas Huth <thuth@redhat.com>

We already cover util/qemu-timer.c in MAINTAINERS - change this entry
to util/qemu-timer*.c so that it covers util/qemu-timer-common.c, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231020062142.525405-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe11c98669..1b2c5b9e76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2937,7 +2937,7 @@ F: include/qemu/main-loop.h
 F: include/sysemu/runstate.h
 F: include/sysemu/runstate-action.h
 F: util/main-loop.c
-F: util/qemu-timer.c
+F: util/qemu-timer*.c
 F: system/vl.c
 F: system/main.c
 F: system/cpus.c
-- 
2.41.0

