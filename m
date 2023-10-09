Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1856471ejb;
        Mon, 9 Oct 2023 03:03:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0ILLvXsT/Lt9x6Y7Rf1a//txfidJ1uDRvgQgrdhObAuaVfaELRUvMyhXItIDye6Bei6Az
X-Received: by 2002:a05:620a:4e7:b0:775:7970:5e29 with SMTP id b7-20020a05620a04e700b0077579705e29mr14352297qkh.40.1696845799091;
        Mon, 09 Oct 2023 03:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845799; cv=none;
        d=google.com; s=arc-20160816;
        b=lnnUCpWYIg98OZ1pFaUtucfPH5LpP5BfRYDmAvw+KQb1vSGtW0mSoIVdtEjFvkq7HS
         +yz56F2lVJzS52mBZ/Msh/8GlW5qcGLwQ3Dx3eqq7VgtNlw8oYf7TJLJ9w+5V3hmuYla
         y9AxyMR6Mjc7rGTmsr1QqohLwvTEXn18NUE9wUhFjldYiHFLAM3s0jaWbelHI/mEhnXx
         hXTCX6q420Czv6ma2TC/JE5S5vUNF9HotiVTJ0Mua9Gea0EGNYkNI0OmZ+ZMQ8OIRRM9
         CZ4YpxtDtC1SPUJwz8l9+oyOnxtu18YfoAbKvfCJFlDEBB2TG6+G4OdYSS0d9HMyu8YS
         j01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=KNu5WskARX8t8uiglt34aaZEs4+GnJbim8ACZvASM0Y=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=YIHVWJaxv2fn22PPVMX2//jG69st1qrqbaP5j/zGEVJVQ8CKPqmlKgc7YtSUuYZD8A
         rwzIm/k9yZo/Qc4F/sqYKLNxsOR8Y+1lx8n+1xVUJdqC/YvT3yvoIPiiP4itM8uLcD3c
         wbdMLpUI6uFH6cow4h7l8e4tRnCb6Bjhbi7kOsLp+5BX+MCBkMP4uUlA/iOHe3/VPzBI
         odtO7QprA6sAseVh/xQbTlljNE9A/BwcipkE/CMJwBKtWwUHXPr43cVgjRa/5O9wMGk6
         Ub+AZ2UjIdH7FTL01a7O5U8cl/U7tSBQxqR0xou6/fh+Y+R/XzTlX5p4THMZvk4VzRVE
         fLlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tXyoQvhk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05620a0b0600b00773d3c0bcdbsi5767332qkg.427.2023.10.09.03.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tXyoQvhk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpn6O-00034G-4i; Mon, 09 Oct 2023 06:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6J-00032i-3a
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:02:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6G-00007n-96
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:02:58 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso39561415e9.3
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845774; x=1697450574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KNu5WskARX8t8uiglt34aaZEs4+GnJbim8ACZvASM0Y=;
 b=tXyoQvhkfD2Wf38ehOsdKFvomMms6DhkvoYTz4E2Gx2bPaXF4egALMXxY1SYhWPiFe
 +P4ejsy5TueuAtfS9qUjlej8UOE3eNtNwaPOyIe455iFuQCCFYzNY30uCa7GcsAoZ7M3
 pSwBagpbXbRnPuYfhAG3UXxmiSDHs1Xuneb3MiRma04Z62JeUDuxtlgP//VnLVl4s1iF
 KvGq7lyVsGd0aZi39msvgswS02Y4vtPBzZXybmHVhxTpXMcOo4qPyICzw9NqYBjx9E9t
 uGZ+J1qk7f94eO34S82kkuQRwjqVIo2r7zj8SwxNPGViXtimgHEpA2cKMaSKFoTqL/1V
 iegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845774; x=1697450574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KNu5WskARX8t8uiglt34aaZEs4+GnJbim8ACZvASM0Y=;
 b=wV3P97qToKRWh8QFKUh7nkamOfhl/SjOfpLWMaIoniJ9A82etoedVrP54BQpEO/gMJ
 uQZT8CajNgOMDNaTOUA1p/WIyqNFgwXEuaY/npGpqWWFwlMq5/OQTQwqmJ1nvcKv7ZQK
 pODKHsEvhcV6U3He4tDH6nhCsdmMvLNBCU7w2x0HbO3zrhTrLKkRlS/wqdP9dpF/iQWD
 tB1z9CZxjr8HAi9nW7Ik4DI34rBH7zY93eVOghM5Dx/5SaKFMITfYijWkB0fd9rUM4nP
 hQeY4t23mTW/WBqhzuk9HHwQx3m5vb2f7AfvRAzdqe9awF1JLnhZwxlKpzXcYnJXKUak
 NWSA==
X-Gm-Message-State: AOJu0YwlKY2S9+BmTf2kOlHejp4wmjQ7VfYgo+VZm0NxwX+rSKm0nfnE
 trYw0Vv/6/aig+2CWuDxQSSjcA==
X-Received: by 2002:a1c:4b07:0:b0:405:3ca1:f6ba with SMTP id
 y7-20020a1c4b07000000b004053ca1f6bamr12278207wma.3.1696845774603; 
 Mon, 09 Oct 2023 03:02:54 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 n20-20020adf8b14000000b003296b62d413sm8723513wra.82.2023.10.09.03.02.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:02:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Tyrone Ting <kfting@nuvoton.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/10] tests: Clean up global variables shadowing
Date: Mon,  9 Oct 2023 12:02:41 +0200
Message-ID: <20231009100251.56019-1-philmd@linaro.org>
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
X-TUID: +/tiOd3KzAWx

Clean up global variables shadowing in tests/
in order to be able to use -Wshadow with Clang.

Philippe Mathieu-Daudé (10):
  system/qtest: Clean up global variable shadowing in
    qtest_server_init()
  tests/throttle: Clean up global variable shadowing
  tests/virtio-scsi: Clean up global variable shadowing
  tests/cdrom-test: Clean up global variable shadowing in
    prepare_image()
  tests/hd-geo-test: Clean up global variable shadowing
  tests/rtl8139: Clean up global variable shadowing
  tests/npcm7xx_adc: Clean up global variable shadowing
  tests/aio: Clean up global variable shadowing
  tests/aio-multithread: Clean up global variable shadowing
  tests/coroutine: Clean up global variable shadowing

 softmmu/qtest.c                   | 16 ++++++++--------
 tests/qtest/cdrom-test.c          |  6 +++---
 tests/qtest/hd-geo-test.c         | 12 ++++++++----
 tests/qtest/npcm7xx_adc-test.c    | 14 +++++++-------
 tests/qtest/rtl8139-test.c        | 12 ++++++------
 tests/qtest/virtio-scsi-test.c    |  2 +-
 tests/unit/test-aio-multithread.c | 16 ++++++++--------
 tests/unit/test-aio.c             |  4 ++--
 tests/unit/test-coroutine.c       | 12 ++++++------
 tests/unit/test-throttle.c        |  1 -
 10 files changed, 49 insertions(+), 46 deletions(-)

-- 
2.41.0

