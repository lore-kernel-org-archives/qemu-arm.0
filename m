Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp942213njb;
        Sat, 1 Feb 2025 01:15:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV2yXYEV154+1azKufnJ33Oj8Gl+P1YFjR9ZFV+pSkQod04NMy2skGxiOt/6oCo49aAOBjjt7KIvSnIDg==@linaro.org
X-Google-Smtp-Source: AGHT+IFcST8NCKassaBbCNmsCkk+4wyFo6ez/f9/bfS4SE5Mzw7QolkmUPB6PF+gXASaf9WgXOPO
X-Received: by 2002:a05:6214:2a8a:b0:6d8:a64d:da51 with SMTP id 6a1803df08f44-6e243b96651mr227011586d6.8.1738401342906;
        Sat, 01 Feb 2025 01:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738401342; cv=none;
        d=google.com; s=arc-20240605;
        b=Xai4PH2sV5OctJIfN7dkoTDPDYMNd6cr88JgPgsRKPTfQhzXDytCATNVF506BKvv2t
         ZHrHKHKclkTitTy8DCEaRqXFkAOUQxQ7l25X4JjeRbz3mI2jEED93Y6Y6foDX1qJCfQ/
         PrMk4VKbpDjEYrWD4R0RFOTGYYrX8S+0Nn/ixyw/vWvyFlN4oyZxQaIkDzyPnYR6a09y
         WlulshV5blmponlnq5VsPi4bgfkE7aDuKmvgvxbH6/blzxFVrfWQGnkPUqOFRNGnmSWv
         2VlnwVk1rGUBkLnJFfEar/WyZFUdcnlCo1eLT2/rh64Wn669fnnizSGyQEPnr2IqNKXZ
         +JRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cjXEXOEGqtOWDtj3L7AVJPhqlVI94sPYXtErkeIQ+4c=;
        fh=ImOZYdeR6OTr8Vh8xKlEyS+66EfEGK5QyGy5p+gsaE4=;
        b=G2BkAPDZtLOLmBhoVQVLkuq1Ny7fT3R2CpoYPRy07+C7xH/URl64cr64CZWzYcTGpn
         E97wCavFRKoKGUoJoAw8I/CnU+utlHRYR3OfuZ/rYLMpZFkl1hXhvxhPHkn8cKcR2KsU
         pY6B63eXXR4TcdaZ2M+uc3CgnOS2i098Hd8YH+wwHpmMeZnK30UGEbshxsHdcbOZOQ8o
         Q1p1Pb1HF59Y8tlD7185b+Tqpfybu0hj8z/nvF0SAIvoHeIcbEsAjXyunV/dy5pmTX3S
         dShYnEEKpcX9nPnnSWk/5Cu+7fezWw9fCklgnzMBiDwfJsUmWBtZC1WL8uUHNM+4Deug
         bLEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4eXXw3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e254972869si53582936d6.254.2025.02.01.01.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 01:15:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4eXXw3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1te9bE-0000xt-R4; Sat, 01 Feb 2025 04:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bD-0000xU-5W
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 04:15:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bB-0000OL-BW
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 04:15:34 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso20729855e9.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 01:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738401331; x=1739006131; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cjXEXOEGqtOWDtj3L7AVJPhqlVI94sPYXtErkeIQ+4c=;
 b=C4eXXw3Sb12Yp3qr5x7lgF5UNWUK6oBZIoIYwCKjkivin08jq1U5MVMCVkdB8kg1LG
 zpQEGWwm3tR7m2IYOnMJsoOD1jnmB/60rBTqDzHgT6DMH9+qvjHlFpO+ZT2mfddN92mD
 Dd9U0RZB0rTTCJTYgJvMHB4yqqEtb9kM86k0+4jwlFX/OCS5kRFCOvCt8u006gHXReyd
 w6Md6aV0eckRjYFVEZvBwTd9mQj/CHqC/mY1k0xQd/xbEcBEM6dJVNghFMZIEOQtABzB
 PqCQJeVnZ7iom7y8MrxEEALz7qK2XTLF5fayuMPKn1BUJ4RnElxXS9lttmZ6Nyk/BrJk
 galg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738401331; x=1739006131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cjXEXOEGqtOWDtj3L7AVJPhqlVI94sPYXtErkeIQ+4c=;
 b=OAgyGtEqh96v788C0FTLVzDZpw5qdgrVVscUMMxhuJhGtguuc1WZ8WXmKcL5oeXqSP
 dws8aFiyArnWYSKR5TcIZSVC931k1tNxSoGVbPxoT0Hf7Dnf5K7ONipHx4I+wgJkJ0Mw
 d1vlgV8UGMZJYJn4hcViyAE0kU00WuxsYnOU7nxXShtZXNGO0jyLfIoJUEa0D9+JgDXQ
 ysvsFRMU2AzNxYoLXcowJiKo9j3bSFzHeNwWOJjLljPVj+hMxZO+1Rd2M8ox99XBzRyT
 FKvCiuWEQu6B+tQ3xD6gV2FnzwE2OPD/jMi6MOrtZWg0EPCggkewgrj+sn30QVGMKc7x
 jdmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZnIs1KjvxL0qtz3su4b7oVVZ0lPB6YP0W6hPtvCcRUCnQH9JJ1HFRZLN8lAv/63+L7S64POc4CQ==@nongnu.org
X-Gm-Message-State: AOJu0YzgaIPt68pFGVUyC1zpSK0hb7MrnkRTslNHa6j73sgLG6gK9b63
 fFtZt+6lcmLwnS7yIJ5zXU/vp0riDkS/AcSEQyTy4OH11pNMtqLUyXoBmYqkAik=
X-Gm-Gg: ASbGncvyQGfHNllyj3EtDiLMl0V5FtSn2RUfrLX7r1KM7QhmdmY/2wgB8vR7zrsaeLZ
 Ar6H3morFrJ1WVcmb+U9M2zWXXfxrEAxDxETYHZ2WU/HEOf9ud4IBzCxZQFQ46t6FniAKqdSI/J
 vgGdHAg/oE/oNl5SVCPb/DTQGGLNHoDkhhRiaebJ2ce+lDESolXxbqEg/ORLy9+2mYLoZrOCsCh
 1MrGBD5vj7CcFfcoJZERWiH8UpNu9RbWffY7zleyOo15lhintUe6L2hS7NqaCu507FpCPb4n+qA
 fQxpWcehFoPdEdi0ZVjRSxjuhpvQcUwHYrYQfJmXvBlJe/TOQb/iV7GiTIj4bnIRHw==
X-Received: by 2002:a5d:47a6:0:b0:385:f892:c8fe with SMTP id
 ffacd0b85a97d-38c5195b4b5mr15152889f8f.21.1738401331589; 
 Sat, 01 Feb 2025 01:15:31 -0800 (PST)
Received: from localhost.localdomain (232.170.88.92.rev.sfr.net.
 [92.88.170.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5122sm6800804f8f.76.2025.02.01.01.15.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 01 Feb 2025 01:15:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jared Mauch <jared+home@puck.nether.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of DRAM
Date: Sat,  1 Feb 2025 10:15:21 +0100
Message-ID: <20250201091528.1177-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: Ta8/7N1yzzLP

- Deprecate the 'raspi4b' machine name, renaming it as
  'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
- Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
  respectively 4GB and 8GB of DRAM.

Philippe Mathieu-Daudé (7):
  hw/arm/raspi4b: Declare machine types using DEFINE_TYPES() macro
  hw/arm/raspi4b: Introduce abstract raspi4-base machine type
  hw/arm/raspi4b: Split raspi4b_machine_class_init() in two (1g and 2g)
  hw/arm/raspi4b: Rename as raspi4b-1g / raspi4b-2g, deprecating old
    name
  hw/arm/raspi4b: Expose the raspi4b-1g machine on 64-bit hosts
  hw/arm/raspi4b: Add the raspi4b-4g machine
  hw/arm/raspi4b: Add the raspi4b-8g machine

 docs/about/deprecated.rst |  6 +++
 hw/arm/raspi4b.c          | 91 +++++++++++++++++++++++++++++++--------
 2 files changed, 79 insertions(+), 18 deletions(-)

-- 
2.47.1

