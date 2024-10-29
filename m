Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp321833njj;
        Tue, 29 Oct 2024 08:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzVeMmTbA1wx4v9nktkxtC6p9WgpLjmfBsDjzDIATTHsLtV+dY4SgBKd9zxEX2/dP8f/K8fvhDAoM3Lg==@linaro.org
X-Google-Smtp-Source: AGHT+IGUCGIH7UCcKC5hOTCKPmMwr50WUO747P4bunlLevd2QCRDbNsOYDL+/o45bHBkPYmdpww0
X-Received: by 2002:a05:6830:310f:b0:709:3431:94c3 with SMTP id 46e09a7af769-7186828da5bmr10887994a34.23.1730214948200;
        Tue, 29 Oct 2024 08:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214948; cv=none;
        d=google.com; s=arc-20240605;
        b=cAePOyVwgJ24K7xY+0YZ2EP5nEwZpwV9BWfAeDtZoHPFbJkOMzX1iPp+F9tCWmOddy
         tkLm8fqzXq6Ecgi/3ZP/J60zI/qaKBWQHjkNCL5IgA6xaHWsrJIP4P4ArcvXPTr0iCh8
         3Lwl6DLFDw9lMDvCiBTrt+AYHzfQq8aULHec6C0YJ5AEhqQ3EuUfUagyKrPx7tzYiud7
         djrCBTJO+x4yd2bLLCuwV675hMFCYA3vHDOs8ae1YLUYEu8iX+3C2UzXn0DIZnfOTYiO
         9TRCZcl9leKwlWcJ5PHNxQ2agfvLgsdbBH/ZzM4I/KpF3cTfXo8T5GdXJejMQESJgj+o
         VJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5gzoNBFS1PLdNZcKXEgXxV1vP4J/3wc0pQNMQSx1OQQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=EtvxIIOHU2i2T8JLG91R22C6Osy3czUUF6CTaA8lxl0QBVZgvxNkjvHtH6veEKFIOl
         a66OzSqlD2h0LqYflhUuLxYlT3XVoKeGICH/1qj0ouyp3cZApCzVk5UI45xMnLUSXRS2
         yPe8XujYl+jCxDm881lFNGPgy2ScnXlknntL91pO+U6bOKJdUg+7MtfW80HDSK32C2E6
         qYeR+v/QQI0x6UpEXOI1o0EURTzGZ0N42Y4JyBx0F0ixnZSHBLmKBJfkqi5aHNmc7RzG
         5Foz2e1qnKOhyl4JyeHtWvou6mOrEGsfH1Uk9vojEAU+MoTO0OJacTNFn5b/T9KKGYSG
         abOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCRyY+uD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a8c5311745si2221228137.358.2024.10.29.08.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:15:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCRyY+uD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5ntm-0002do-S8; Tue, 29 Oct 2024 11:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns7-0000hm-B9
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns0-0007h7-K6
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:01 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-431481433bdso54813525e9.3
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214655; x=1730819455; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5gzoNBFS1PLdNZcKXEgXxV1vP4J/3wc0pQNMQSx1OQQ=;
 b=QCRyY+uDL00zLmayy4lwh8kK8/AAH5OdlWrdJttfqh/dsWqL7Mwg2XqxlI80j47/6Y
 8eSGsgjeF7WZD/XAXZZdzTLa5u4ZasPbha6v9CwjQYtrZyLnXXXUHhE8hnFtKykzvSp0
 RX3RDLZswZkhG73HEbivgqLgUSUEAt1+aX9LWkreAPerfv8o4NkDwZ2E47fYhVewjjh2
 k55naODQZ3J6zC0rh/JTtJegDEQgUAUuoGPAtstkH7XRZlyKqBAVLot35w9YzIAoRYAo
 5f22XNsGvN1gk7GEHkvFMr+oRg6aVrWoNFpIw/NaUTeaG0Dxr6w8MW7H9DAb5rHQeDLv
 t8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214655; x=1730819455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5gzoNBFS1PLdNZcKXEgXxV1vP4J/3wc0pQNMQSx1OQQ=;
 b=N1gvC1NfuHBYKprJH+TVMLWfxVKpqzkXQyQq0AqU3GN5eB/GMgGHwqCXCyeYsOB5Xx
 RdvNPhWFA/gP1okqcmoIa6hQtzVg5H1PmSMja0Cb3ChJT2tYlS9glUFL3r1zv7mtRUBF
 sNAUY3awDvCLXLTa4Uo2O2e2/108+sua44GPq4tk13Uku7h6UlkmZn6QX9Cu0NtR0Ggk
 y2MwzRL/RehF4ATZnmGPvppDJ/fTWIs2FPF4qSydsJWRL9KmGoNMOmgb56AE+qSiqnFm
 cbnJ72wQQZ7WXu05/tlD8pbJzv/9i7To3MPXaw/v7X55GQ2Zp452c5S6ICrGeA+CuaqI
 VRkw==
X-Gm-Message-State: AOJu0Yz0TmxBC2cBdt9U+3/mr4WBzgZ/09rDhWMJtyoyXorCaDg4iHM4
 bWHdGuKZIXcFQ6oLdhdB8HB5cH+VzZN20Ry2S023Pkx6R4/fKpTLvMX1qxNVwVVlbD90wUH4pRh
 K
X-Received: by 2002:a05:600c:4fc5:b0:42f:8515:e490 with SMTP id
 5b1f17b1804b1-4319ac7427fmr102316295e9.5.1730214654766; 
 Tue, 29 Oct 2024 08:10:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 09/18] docs/system/arm/stm32: List olimex-stm32-h405 in
 document title
Date: Tue, 29 Oct 2024 15:10:39 +0000
Message-Id: <20241029151048.1047247-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: MVaLI5y1ju8z

List the olimex-stm32-h405 board in the document title, so that the
board name appears in the table of contents in system/target-arm.rst.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-id: 20241018141332.942844-2-peter.maydell@linaro.org
---
 docs/system/arm/stm32.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
index ca7a55841b4..511e3eb9ac1 100644
--- a/docs/system/arm/stm32.rst
+++ b/docs/system/arm/stm32.rst
@@ -1,5 +1,5 @@
-STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``stm32vldiscovery``)
-========================================================================================
+STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``olimex-stm32-h405``, ``stm32vldiscovery``)
+===============================================================================================================
 
 The `STM32`_ chips are a family of 32-bit ARM-based microcontroller by
 STMicroelectronics.
-- 
2.34.1

