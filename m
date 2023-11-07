Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp274848ejv;
        Tue, 7 Nov 2023 04:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7f2hmuuhw5tnkPZQ2DQ2FEO9U9DOa14iSgR1dmiPsF4/rKdNIH18JdEsYU9pk/JHj+z14
X-Received: by 2002:a25:6a04:0:b0:d9b:453a:5426 with SMTP id f4-20020a256a04000000b00d9b453a5426mr25965090ybc.56.1699360146276;
        Tue, 07 Nov 2023 04:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360146; cv=none;
        d=google.com; s=arc-20160816;
        b=t1O6+Yogbne+78fu/6Jqw1R3Su81eJhI48jLOCvHRsYqkeqToOtGixFZF15Wvwl0jQ
         4oJvKlhvma1ZeA4TPJVi+jT88MHgc5i9j1fnRcMXekWoSTwaPkPs3+aYUC877uwRl7Gh
         6hUbVSewesSlHvUdfN65nCsum28q41dc7YiCotlWPqbFs6H8HgOEyoLiwrhOjPxBrn9L
         mUXaPGpa3ihwpQuEGm6M+yMeHbX3B9GGuvBgddFJyLV0aFbFvNITkHaZA1/bzQADJDen
         QCakhZIemFeHohatFd56apTbVTCHVlwuD0PpidWxrrPtX9YLifNk59jHpIiOgRNXeBzF
         8ZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qmG50O/2f50/2WgP2HPpZwiYXOel5yrYkpXTGRW5eAc=;
        fh=zXMpR0HDK0j6A1IwewknO0nLcQYT+10Y41Xt7eYFvs4=;
        b=pN+9qKGxLq+3hVJCxwDBSfxe9TbrKi2LlhyHGW7V+pV0VENDrYkD2hUHw34xG9ylwl
         F6JAGwmmaEkvMWMue8hNL3OVeUZ4/Wwe7P2gALwgAJ6hnuRqSDuK121Kb5VCir/g5Fes
         BCj5UYDxOAA+DeySoluyXzGTF4jfsp4eN6BL8OIoR/dbngtH34tgV2gTKbsBJZ5hBCAr
         xCiDpKMKbTEjsnA38ZxVV41DRIUqK+Pf6gp02+WZpFEcZQmg/vH1f2Eg7IdVS0P9pBde
         2cS+4MWNxen+DdgElzk3tbjrikOIGKibIExq1M4SDzXP91E+8uocCsUlsiI6oZarqKFI
         wvxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YqDKViov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dp7-20020a05621409c700b0065d124684a6si6655098qvb.88.2023.11.07.04.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:29:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YqDKViov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0LAu-0000LW-5Y; Tue, 07 Nov 2023 07:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0LA3-000739-Hk
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:27 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9s-0005Ij-6E
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:27 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9d10f94f70bso837167466b.3
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359972; x=1699964772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmG50O/2f50/2WgP2HPpZwiYXOel5yrYkpXTGRW5eAc=;
 b=YqDKViovIWaWNrSqs0vCDmYg1PEvUvvDip/VCoId1cERTIbMa4XR0RWxhVzZdjR3Ty
 +gFu49p3WcAIouwhKo7T9sDVjdpimbAvMkgnHzZFyOXuZLT8BqZzeQ3pz6IJUHqF0t54
 YzrfjgjoSpTQPPUu7TkrJhyTld4z/XEdiDWbHiOzys+ohKK+yLSuf56eDrFZP/22iTXh
 9u+aqpad2VMWFPcpqF/C3KRi59ftlgPoEbr9VIYP1Qeqf0sMdXMaveOqO716cgXj3Up+
 /jUDrz6B/vlGieQI1M8Ukf02J2SkTAOL1pFuiDz/WJi+6viybbwcmHHmb04lplI9h4AA
 1rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359972; x=1699964772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmG50O/2f50/2WgP2HPpZwiYXOel5yrYkpXTGRW5eAc=;
 b=NslK9eEY5uyrjfb/8coDnhYAMYE1zIRrymow3qsSHT1gq2UbZUdchvn0g5A6XcYZJL
 saznJyNuoeu1mMGQ5ebLLQH/bXcb4jBTyu1ySM60olThdc5kwj0c4Oj9JstFgjTxZoHy
 bKHdUEbCLRmLG+TbF00+X/2J4MpOn2yG5RHIypSSDcAptkMTA623YqQNqH785SrD2naY
 nz6BXB0anHXK/x69ALcFbRgnb6GIfu/YDoxslP/wCP1iGwtf/CS3ySSOawsMLJrqVN8n
 8cjWkwTAcOoWqDWgNTYL3+Y5xwPtL4VZniHC+v8uKsTP6Tymkn3RQrFGX/GDYMs9Dw8N
 5zBw==
X-Gm-Message-State: AOJu0YzDb2skx5HQwxWykHzYjuZo1ErHTBEkZfDX+Bm6q+S6hAkhD1CH
 O4U0Zx0lg4A+QU+aJuR5S7ftaA==
X-Received: by 2002:a17:907:934c:b0:9bf:b6f5:3a08 with SMTP id
 bv12-20020a170907934c00b009bfb6f53a08mr15984029ejc.52.1699359972231; 
 Tue, 07 Nov 2023 04:26:12 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906168c00b0099cd1c0cb21sm972160ejd.129.2023.11.07.04.26.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:26:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 72/75] MAINTAINERS: Add include/hw/xtensa/mx_pic.h to the
 XTFPGA machine section
Date: Tue,  7 Nov 2023 13:24:39 +0100
Message-ID: <20231107122442.58674-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: f4r3P3IfK2bN

From: Thomas Huth <thuth@redhat.com>

These machines are the only user of the mx_pic code, so the
header (which is currently "unmaintained" according to the
MAINTAINERS file) should be added to this section.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231107102104.14342-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a17decd31..2a9354e695 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1861,6 +1861,7 @@ M: Max Filippov <jcmvbkbc@gmail.com>
 S: Maintained
 F: hw/xtensa/xtfpga.c
 F: hw/net/opencores_eth.c
+F: include/hw/xtensa/mx_pic.h
 
 Devices
 -------
-- 
2.41.0

