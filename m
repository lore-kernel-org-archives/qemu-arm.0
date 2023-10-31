Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp291402ejb;
        Tue, 31 Oct 2023 06:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6sbOfwXfhiYz+g6lEIaHJNVzX4QeTEnpbcwRW3qlfZqq+SsEf69B4KhxOBlJyEd/oVXPh
X-Received: by 2002:a67:e041:0:b0:458:64ae:fc1a with SMTP id n1-20020a67e041000000b0045864aefc1amr10935707vsl.19.1698759947231;
        Tue, 31 Oct 2023 06:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698759947; cv=none;
        d=google.com; s=arc-20160816;
        b=oieI7Gbqd/m10ap1ukH7F7GIGnYTOFBULWkDvobbFEWKOa5HblJc+yAvHK4Gt3SaOR
         ZTzCWBTP1gX8jfLPfnwTocBUJtLGLoBkIvDzLe/lI1YK52evD7rQU9hb/tYJ6jzs1Lsi
         qKXTva2qqplKHo3Ai5E5WJemMUkmIO3OmX62/+rj5ShHJu+b8+ekT+YNi3KzgBnAuVXz
         RsIi8xZcst92ZzOnZdS0Xg1GBZU/HxZTTq/MG2MkUQeEuOVunKhIjU2ABv3jCk1wdwoJ
         T0SDLrxoveJyVCzNM6tuwDNc/e7x1I++BGMcwWLHej1WYeU06LolYL3VbGNF5+/WSGFh
         EN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ypz0cfC1DEOkumJW+Z/7m5C5efFoS/oHtx6ppez0zu0=;
        fh=wqfvLaBYopGyGisjq/k8ulPaCl1xshcoDnGh5kvEEbE=;
        b=f70Ck6SO4vSnRTdmG17PaQa6wR5loa4RJdnpUPz6UxcVMqHXt2L5SxhptX/RTbGg9o
         0bru8zRbt13JWH9cx0E9Uz8KBbCmDUiDDriO8Bg1Z2WDZMe9WQEM9P3+jishhwfVK/BW
         QmhW6dzQDZvpYuMqyfYl+nq4A432tbuAq8C4zM3CNTnR3PrTlIXPL4QbcuTHO+VrxvN5
         s9FS/W3/z0rrBP8tU/CZsHK9b/nD8l5ch2oCk7x1HnCeUdob5mSOzHW6u5O+Wsscs7Mz
         R9xoGQlheqtdFc3F66mVzNm60CDQnft1UftMJmgVAN0ifmhAD+nluFK6r9C+HpalOLMG
         yw0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FZ4rSV0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx9-20020a056214188900b0064b78e57cf8si1077644qvb.38.2023.10.31.06.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 06:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FZ4rSV0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxp3Z-0000u9-Ai; Tue, 31 Oct 2023 09:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxp3U-0000sm-9h
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:45:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxp3Q-0006db-36
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:45:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso46609385e9.2
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698759906; x=1699364706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ypz0cfC1DEOkumJW+Z/7m5C5efFoS/oHtx6ppez0zu0=;
 b=FZ4rSV0eq1dpNa8REXFgEjxCT9VswnUo5PpCR5H1O3ZarDvQI52o1mWpu8uCOH/AUF
 XGfC294z1lvUoLtB6XoFoeO+wTMN+j43chdp+PpHGWOT3h7wXFZcCJzezryhruCpmjD6
 D57L6MtiJAb4uW7hBg6pkoseZDrdSYntWgx46EKQp/ewwteY1/nkD1LELEPiu6yU0hPF
 BkSzbiSahzNFADzvuH7d3Utb+wMeGX5kOBWCY4avGyXD8DHRLnuUtktlWBsOzdr3nA6J
 pZGldqkTy/39AHJDFiSDu0H2A0PsdAHfnH36iwT10dWXOy8RM+p29ghGTxZrxkpobaCc
 l+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759906; x=1699364706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ypz0cfC1DEOkumJW+Z/7m5C5efFoS/oHtx6ppez0zu0=;
 b=YOWqTnBEazB/UW+IKgOhILFkHwSOq5Qiv4xPHTEtnr3yI0jXBj/dWfKI6VGSiLgg/r
 VV5mrmkaHb/putEZOJwY4BCLzOkIHMtzH0f+ke4SQUWm++5qNkcv5HRXkGAvIKtxMLjo
 Ez4ok4CndQhjlzOUfExhi7/SMyzouZa7stZjIX5p3FdQbMUPkcXuN4NLJBVODJuaxN8l
 JeBk3yr8k9qTIruh5hrVju+yoV7sOzDDNRlg+/R/iC5gFAcSxC98UeZ5Ay7VlixsGTi2
 AOlR6oLUHS4JhKoVLdhQJqlYW56D1QZbxicTnuZ4RFLTUk/VQs6HHa2cmJF8u1olGESB
 rtiQ==
X-Gm-Message-State: AOJu0YwzuoU1dJgE5uJ751JD9lvUHAZAKouz3kUz6CxZ2kN65Clh65Tl
 5FgYlTDI/UCjLlGZYvXSAtk9dfoqq9ZSkWnChL4=
X-Received: by 2002:a05:600c:20c:b0:409:4823:57d7 with SMTP id
 12-20020a05600c020c00b00409482357d7mr3516088wmi.14.1698759906599; 
 Tue, 31 Oct 2023 06:45:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a05600c00d800b004068de50c64sm1754989wmm.46.2023.10.31.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:45:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>
Subject: [PATCH v2 0/3] virt: Report UART correctly in ACPI DBG2/SPCR
Date: Tue, 31 Oct 2023 13:45:02 +0000
Message-Id: <20231031134505.4110877-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OlTQ+4szEGeo

This patchseries is Udo's patch, plus the necessary extra patches
that update the golden-reference files for bios-tables-test so that
'make check' continues to pass. I'm sending these to the list for
completeness, mostly: review is of course welcome but I plan to put
these into target-arm.next fairly soon.

Patch 2 has already been reviewed.

thanks
-- PMM

Peter Maydell (2):
  tests/qtest/bios-tables-test: Allow changes to virt SPCR and DBG2
  tests/qtest/bios-tables-test: Update virt SPCR and DBG2 golden
    references

Udo Steinberg (1):
  hw/arm/virt: Report correct register sizes in ACPI DBG2/SPCR tables.

 hw/arm/virt-acpi-build.c  |   4 ++--
 tests/data/acpi/virt/DBG2 | Bin 87 -> 87 bytes
 tests/data/acpi/virt/SPCR | Bin 80 -> 80 bytes
 3 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

