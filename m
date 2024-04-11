Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp853660ejc;
        Thu, 11 Apr 2024 03:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0gWH7ZwXlsoV7dSYbE5P//yZQ9zVCMl7Wku+jWjkGyQlzYqd+BRNmrZupeld4J2voc2ana9vPVY0E6UKmzPl4AbWMV/ob
X-Google-Smtp-Source: AGHT+IHPQUaQ17QU4GuLB4GsHbaQPOl+poq95TW4y39OWtZ6zkYB9Xcv0sec4bZFsIAe/HlhdV4k
X-Received: by 2002:ac8:5f52:0:b0:436:537c:72f3 with SMTP id y18-20020ac85f52000000b00436537c72f3mr2678949qta.12.1712830594084;
        Thu, 11 Apr 2024 03:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830594; cv=none;
        d=google.com; s=arc-20160816;
        b=SK/BYCpxvZKLMVMMtUKfnCcGtEdWJt9QHFjnQhVEWgjZL/9TmK2koHiE8oUR6rmxDH
         BuqQYsxyeVoJSOeBefVqV6Vm+Vd+WOwRCQS1me0cfeqdLf436ovJrn11gNlSi1XmE1O5
         DDLKN9RJmeoU/S62AARB4JHhvkt3UkqoEb8eizP6l8KrG077QRn/ZQ004r8FpFmkWkvS
         CKxZUoU2lTArze+shicDeJiJDc0LANSPOkdEv5V9aVPsCI9B/09aMC9h/lEZ4kFJNwTf
         CmGhvmIGKmB5Bhbhab9KJM3Ba5bZ46/ROTTpQox2AXcXx54Agh4HxbQ3r6U7DV4DLFbx
         CsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DYu9NeN6C15PoB5yWPnrDM1Qg3VSjQOVFu4GcSZeT34=;
        fh=TssSa9PNiRIadGrXNk+2LKrlUrl1dXImLX+rT4ruJa4=;
        b=AnlSWMlbiGZnVAaWYXpQQ2/+U1f/yqqG6cmmS/IFhnxNcPXaOaNTyDVqoOicv8iPuF
         WQ4cOytXKHcwovxJozYiWOtejuRimQ+DorJC+iT59nqxX/TE8ncRy+rdp2WNWmVe7iJv
         vKBHc9HX3Vss77L7EyCp1jS9XiI6Y1YIlR09jlL6wHwslLZvAnq7ChoEsVMEf/mfcx7a
         mPKgWO8ZXZbjM2hM/LkoOO0PKnq+N/As1wkTt+2eujdNdxHUWWJJGv4ddgY1sw7Uet5C
         GSN17eOH+hCHfU6rn17b+Bgr/lR28yeIsVCca7e0EJS2bTDUBdGNr/dcxSeIadVTTtYX
         U7Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cx3RV9w8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020ac87dc9000000b004365c91aeb0si1231735qte.105.2024.04.11.03.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cx3RV9w8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurTZ-00050Q-PL; Thu, 11 Apr 2024 06:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTJ-0004wv-Ve
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTG-0007Rb-Tb
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:15:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-417d029bf15so4682745e9.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830553; x=1713435353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DYu9NeN6C15PoB5yWPnrDM1Qg3VSjQOVFu4GcSZeT34=;
 b=Cx3RV9w8wW+GAi+XbsX7x/6b4qcdxcuyoOH1t6BI+h7gSUAUerFu/oNjoAuM8NLAtG
 f6U6YRZWNcaaQzLXoe69uEFIDhrD8NU45NslJXJmEo2/MZV/20ZPvU94Rsu0g7X/35t5
 nq4JZ6AsC7nKeTSTj1+L3GDOQEk02p+PlJ2gopVWHSKFQW8BnFNGexlwU8uKXdgzxwxv
 RPALybwWTfTGlN91JFk4+GnNE+tAU061KZy61nEw8bG/OQ8nRGDXDlf55ELHXchXc+ZK
 K1cr5890Yi/NEHjRgEBMvDz2zgdLoyV7g2W/DD9j8DDu50XcowWysYyN76A++AeHJxwG
 8UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830553; x=1713435353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DYu9NeN6C15PoB5yWPnrDM1Qg3VSjQOVFu4GcSZeT34=;
 b=AiYn7SP5ZxtT8LbwMDqrHcDvjFfa3OqoZv3BsWzCTbf/5IjcgWg+KD7ZSlPNhfWBb8
 TIBiJxUsy+5qIv22Sqx0mdU0rp3wW2cN+/rf6PgZF84HGeUffvXKdzcvjPIKtZRrsrT9
 meA9mZh15j+aZfDZnj5ad9F6Dv7qGdKnxhQ7XeXNrRHBMoiyBeQsQYIv65mCHi+v5nww
 cW9mzxAP5GblafoB7W5BgCIcvpJf7S96GYtvYjWkJzzVC2DHuuGvMrV4m6Ry1dT5kgue
 ZXKOp/byHX6WVuAVDQPNo1eZP0sGb7FbIS2+B8Tz7qXV8VFyZzvr8CoHAKLEQQTEhwII
 xiXQ==
X-Gm-Message-State: AOJu0YyJBOUl+5A7YmRTDJc6LN8e+Q+eH2MsTKj/P+zYOKBHVu/dDj6u
 m8JtVzRhlFdQILevX0Cj+Eifk2NEa5UlqCmYBxr7Q9mY2fitX5XSHQod33i6Sus=
X-Received: by 2002:a05:600c:4f95:b0:416:b650:cefe with SMTP id
 n21-20020a05600c4f9500b00416b650cefemr4789263wmq.14.1712830553135; 
 Thu, 11 Apr 2024 03:15:53 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 he8-20020a05600c540800b00416a08788a5sm5055032wmb.27.2024.04.11.03.15.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:15:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/13] misc: Remove sprintf() due to macOS deprecation
Date: Thu, 11 Apr 2024 12:15:36 +0200
Message-ID: <20240411101550.99392-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: NSej5uut7bzG

Since v1:
- Use snprintf() in patches 1-5

Hi,

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Suggestion to avoid the super-noisy warning on macOS forum are [*]:

* use -Wno-deprecated-declarations on the whole build
* surgically add #pragma clang diagnostic around each use.

None of these options seem reasonable, so we are somehow forced to
spend time converting each sprintf() call, even if they are safe
enough.

I'm so tired of seeing them than I started the conversion. This is
the first part. Help for the rest is welcomed.

Regards,

Phil.

[*] https://forums.developer.apple.com/forums/thread/714675

Philippe Mathieu-Daudé (13):
  ui/console-vc: Replace sprintf() by snprintf()
  hw/vfio/pci: Replace sprintf() by snprintf()
  hw/ppc/spapr: Replace sprintf() by snprintf()
  hw/mips/malta: Add re-usable rng_seed_hex_new() method
  hw/mips/malta: Replace sprintf() by snprintf()
  system/qtest: Replace sprintf() by g_string_append_printf()
  util/hexdump: Rename @offset argument in qemu_hexdump_line()
  util/hexdump: Have qemu_hexdump_line() return heap allocated buffer
  util/hexdump: Replace sprintf() by g_string_append_printf()
  hw/scsi/scsi-disk: Use qemu_hexdump_line() to avoid sprintf()
  hw/ide/atapi: Use qemu_hexdump_line() to avoid sprintf()
  hw/dma/pl330: Use qemu_hexdump_line() to avoid sprintf()
  backends/tpm: Use qemu_hexdump_line() to avoid sprintf()

 include/qemu/cutils.h   | 17 ++++++++++++++---
 backends/tpm/tpm_util.c | 24 ++++++++----------------
 hw/dma/pl330.c          | 12 +++---------
 hw/ide/atapi.c          |  8 ++------
 hw/mips/malta.c         | 23 ++++++++++++++---------
 hw/ppc/spapr.c          |  2 +-
 hw/scsi/scsi-disk.c     |  8 ++------
 hw/vfio/pci.c           |  2 +-
 hw/virtio/vhost-vdpa.c  | 11 ++++++-----
 system/qtest.c          |  8 +++-----
 ui/console-vc.c         |  2 +-
 util/hexdump.c          | 33 ++++++++++++++++++---------------
 12 files changed, 73 insertions(+), 77 deletions(-)

-- 
2.41.0

