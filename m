Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2654972ejc;
        Wed, 13 Mar 2024 11:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZlMnKtAjs/5hwOScQCvSwRdzysu+G1UJIUXIra79GCd441TFdsfSH3VDy6xgA1fsixWVttMD+vZFrF2TpOL2bD7bke3Ti
X-Google-Smtp-Source: AGHT+IHW8I3ZkQ1+ql2goTT07X+lM2JQ+15NnCKOVd31BwOWmBqyzofjWAppaWpWrTdBpD4kLksm
X-Received: by 2002:a05:620a:4089:b0:788:ec0:26f6 with SMTP id f9-20020a05620a408900b007880ec026f6mr993878qko.8.1710355846693;
        Wed, 13 Mar 2024 11:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710355846; cv=none;
        d=google.com; s=arc-20160816;
        b=ZyHoM7C5PcNhp3r1AlDgTav6QIChsAHymp/NhWdjCrJFq0oNWoyWDFBvS1vFQGid8Z
         cUgImKYRIRcHFTrz99lCaTWAMdhxVya1bhg5ftBoofrilEEtIzJttkLXqUuREvcfZN/K
         1wHJktHhXE9tSqLg4ojK2Yhknph1iLZfkNqmrmT0FVAPf28dKwmcSDhp7OueuapaZ4r9
         F5zpgE/nBi4/jZqfkjQBLZoSjeCvxuxaMWw/uHryzy6/8TiI8BTV0MqrE5Frjwif/Hx5
         c4HZZWGRWBbMkhfNCfALTf1eSBB/NIyJCub5RlwlLjjb5rRJZitvSxpm4ZrywusVAo6P
         6uUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2uvg7pJFeMQcnPLMPf2nUqArdk7gKSBHY/6kmDxSVbs=;
        fh=B6vr7UwPZA4AzlOJwq/uNGyBt+SMBikCdZgCNjWHXtA=;
        b=1CStR2vX8AQbsuOJ3ZD5/wFwOynMFfW9OrfvOR+nadK3TpLQk0KZ9RO60nJLI8VWNf
         NO7Bu5ygjzidM7ulEjG1tU5pHUV+vi2iIiPkGjYqnkrAUZ0RciZIPuGo/YNsUUB5YfNk
         /wi3SxerRVSpDv5eqcmxEoc4N0gVOjbNNaMzxxgKBQqu3ORsQ2p1N510BCCwXucWI01P
         W3E8PZVRqPJr7Eq02y/d/81sW19/jJ0eF6yT2zlkWY/zK1dqNoBRBYtg9ZSRXowM79FF
         U3jUlkflTpEeBucwjt6y4Uvkkb2ZVjvsY/nRjn3kdqKiOv6tEwxKSOplYtXYkMLG/5RQ
         cTMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKbuVom8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wk6-20020a05620a578600b007886bc99999si7507264qkn.184.2024.03.13.11.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 11:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKbuVom8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkTg0-0001YR-So; Wed, 13 Mar 2024 14:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkTfw-0001Xv-MU
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 14:50:04 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkTfv-0003ul-2D
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 14:50:04 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5139d80f8b6so236777e87.1
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710355801; x=1710960601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2uvg7pJFeMQcnPLMPf2nUqArdk7gKSBHY/6kmDxSVbs=;
 b=zKbuVom8E5Ehj9++mWQzupIomgmIPzB9ta2GbFi6TK7TXPJNh7woMUss20a+4wbcv/
 18U0cYnzAWbnjALLMANhs6L/u21qIWZmzV5V0GLVpoPdw7kY2fRkKVEUzrW6xWCyfVQX
 Gi/2tG6fS4j3LSaeGOQsMH6c0tumWNyJWRjJ2Lg0WHfjCmmqFRkLRd9UjoQhJEefiERB
 bamBgwRBGvv4ulckZI8iZZENgbzwigpj48kEtZoftoJ0HtAEEV7Z4NmzwWukUrOHJ712
 E5DjNY5ZNGSxLOYzxBcGPWFWpvnKV80oXKxBY4rBljJ1VCQPRaoGi/i19NflREKp3uIn
 dbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710355801; x=1710960601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2uvg7pJFeMQcnPLMPf2nUqArdk7gKSBHY/6kmDxSVbs=;
 b=Lj1pz2WEajDElmgr7nbZPNccCD3df8ytT8PvctLpBq4bmgDBk2Mw/ssaHERO3AyvIa
 VJbVPu2qxsT43xzbafCvJFfjGg98E2ZgYvzKGBU6TsxBVMQfgmI+tnNq6+HDasr5XoTo
 lxvNsWxPh6r46UbPNhQwGdGXj0o/3ccaYFQ+qEsmjs02iCE8ffudsW1xW+P9OYPdMMbN
 a5fUsqsboZdzUMSG9oKAd5jWf4OY5BtXQBhaOrHQyjQrT+AxRr4gzEEbJtrnlCRTt/nM
 4cuFB3JMtl3S7OcEEAQdvaMxIPNeMpOAtGgSQvMdpoNNiUEVWScD/wIFEgxJ+BRDft9y
 bG9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWazautPzJ0yOw0lex4zXm8rJGN25E4YtDvazGXHOaSQ1ymbgW8YJnrV8t2jDcdCqtwyFuVG+01kYNmUjFmqxQgAMZ/
X-Gm-Message-State: AOJu0YyqJTcmMrXrP5LY5pzmOVKi+NaS4I6mKHHMKu8YGe0HH3xm/FSw
 5mXivxr08z0L8riE1zpmkxkGLYBAnt4LSAe+p3pVIo19/Xvn3zRN9+zEZxLRiRA=
X-Received: by 2002:a19:771c:0:b0:513:cbf2:50b3 with SMTP id
 s28-20020a19771c000000b00513cbf250b3mr1061509lfc.35.1710355800790; 
 Wed, 13 Mar 2024 11:50:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a05600c511000b00412c1d51a0dsm3088896wms.45.2024.03.13.11.49.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Mar 2024 11:50:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Eric Auger <eric.auger@redhat.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 0/4] overall: Avoid using inlined functions with
 external linkage again
Date: Wed, 13 Mar 2024 19:49:50 +0100
Message-ID: <20240313184954.42513-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: Dct5WJjDG+SL

Mostly as a C style cleanup, use -Wstatic-in-inline to avoid
using inlined function with external linkage.

Philippe Mathieu-Daudé (4):
  hw/arm/smmu: Avoid using inlined functions with external linkage again
  accel/hvf: Un-inline hvf_arch_supports_guest_debug()
  qtest/libqos: Un-inline size_to_prdtl()
  meson: Enable -Wstatic-in-inline

 meson.build               | 1 +
 hw/arm/smmu-common.c      | 2 +-
 target/arm/hvf/hvf.c      | 2 +-
 target/i386/hvf/hvf.c     | 2 +-
 tests/qtest/libqos/ahci.c | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.41.0

