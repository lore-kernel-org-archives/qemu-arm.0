Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp216388ejc;
        Thu, 19 Jan 2023 02:12:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXugr+NXFYL7qOOdA1kTwnL6/izdoqtOw5Oo9tKv7ZfJE402bpeVi1WsO8ss24Q7Afqsm5gD
X-Received: by 2002:a05:622a:1dc4:b0:3b0:12fc:ff96 with SMTP id bn4-20020a05622a1dc400b003b012fcff96mr13272906qtb.23.1674123153659;
        Thu, 19 Jan 2023 02:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674123153; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMGW4xE+SbhiIYenKdbdkT8DeFFb/4CTK+hLXA3x2P2JWupSxJSgUTG+W+izHFGGW8
         Dufb3Fl/AJBXQ3MgaQs11Xxifnd8MQQLqWEzCQtJN9t355e6lBFffJOsUC3yHyZGvQOP
         KwxoXItb1lhtRak2Bvi+/+PpklrMrcXZJHzskxdt0kNiJAHwn0sMxW9gR0K7LHZT0fSS
         7mGjkUznsBpIX7C2l0CTVjcKKBwztPs3eAQP+oYdRm0tZeWqL1g2TyU0grDOHH7EJBsq
         Qnwj5UihSNuvMF3yQvrPXuuuXwbkfMUE51cbOsSxb0ubtfS0e6hawXMhuDAMV+1hYf9H
         jhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uN3qFnmoj1WnTfMm88xTldxtTtQOWE+7gMCV82qBTQU=;
        b=o2UR4IFMYbIe9BX7eL1Zwz5k7/qeNgtbw406Onxok+1fCvBFCdiLPh/r6p9YnEgnb1
         vWVWUVTrQ1KIvnfAd+H0fJYhDeI+uwfDeokUUd1R4bIVPdqzSJoMrLRkVKdL575oQVWU
         mSWy79kGwcHX4okF1VnP77GA874cTLbIKA8s8V9Vwf19IU9KuurpppxOYgmRBAsWmScm
         c9bFR6nh93TIj+bOs6DiZ6Gh3ReKr8ACBbmRf+hjjCjv7cL+ALcFKDO7L1OuO81iPBKq
         E7M6nrW9tm0yQNC7hrVifheDqkFswEWM4HEAAMgdDBjdg7krOwuQqxqX3VfjQM4C7viw
         z4YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N+wHtGZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge10-20020a05622a5c8a00b003b6346e84c9si6521157qtb.574.2023.01.19.02.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:12:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N+wHtGZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIRoY-00046s-4s; Thu, 19 Jan 2023 05:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnk-0003jO-K2
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:05:49 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnh-0005DY-Vd
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:05:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so1295507wrb.11
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 02:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uN3qFnmoj1WnTfMm88xTldxtTtQOWE+7gMCV82qBTQU=;
 b=N+wHtGZjO6Ax/xK9rwfKDzzj/ZGf3tZK1d1WO7pGB0zcYMue+jrnEkQVRPEfXSWL6+
 bzFGC4ZORT0hfN1c1c0EahlZ6iyihKnD6RP429JMNVQ4aXdpWd2VUlWRD/AjznE/C4kU
 qnkxBhSp8CAnhSGPxILrF/6Eq1SVb18cxdvJzc1BoXEF5XJJDaMYq4UStwuNp07NIZ3r
 8x8/gqh/cBTpaZ8T+mFH+HzM0VK4mcZtRT0j2L3LWpKrHZQK7NQDbi8UylzRgG3f0FZY
 gOTHdxBoYJ2lRINgdzcjF84rfxeCqbQjv/hB1pHaDhKEs9HOwwXc7eiuKg1uI3Dcexvb
 dNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uN3qFnmoj1WnTfMm88xTldxtTtQOWE+7gMCV82qBTQU=;
 b=SZkz8CCRJhdiaWHOPNvPFaNyROyhE1yuVkYXZA/3H1yMqgNgHkQKZX2C8//HZEkgZb
 /Ip3Jjmqe8Co3TL9O5cJBnbf7RX1RGLRUlULEcUoOnX6oFrPgSfEtDcenpUkmIT3LiT+
 wLfzZsZDtGo5VZdi9LM4f6lHNVaZKOnds7xx+v8bOyl43xxTrp/zbEFarWfLM44vfD5M
 Xk2QJmm/gTdXW0WOnacjCJU/zguTrq8YbxCZIPweFTBBNSajXqKj0o62pfzPUfjc5TkQ
 pRicJTy/8dez/x1Nvty+D3DnPm+++//KNm0ru5Uw1e4z6gWVij1JCgQxZO/QhhejQplu
 xU8g==
X-Gm-Message-State: AFqh2krqA+Ck3PCY1nvrdeHZ5T+BJ6Nd33ICPsekcs6LGk+zf/KRW6k5
 1gRRKiOnwpJW6YBflf06EtvpdQ==
X-Received: by 2002:a5d:5b0e:0:b0:250:22e4:b89e with SMTP id
 bx14-20020a5d5b0e000000b0025022e4b89emr10058002wrb.65.1674122739450; 
 Thu, 19 Jan 2023 02:05:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056000024500b00267bcb1bbe5sm34317063wrz.56.2023.01.19.02.05.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:05:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/8] tests/qtest: Allow running boot-serial / migration with
 TCG disabled
Date: Thu, 19 Jan 2023 11:05:29 +0100
Message-Id: <20230119100537.5114-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: bD/UAsBPjqKT

Two test were failing on Darwin when testing Fabiano's series
which allows building ARM targets without TCG accelerator:
https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/

These patches allow boot-serial / migration tests to run without
TCG / KVM, then HVF.

Pending: How to test for (poisoned) HVF with qtest?

Philippe Mathieu-Daudé (8):
  tests/qtest/boot-serial-test: Constify tests[] array
  tests/qtest/boot-serial-test: Build command line using GString API
  tests/qtest/boot-serial-test: Only use available accelerators
  tests/qtest/migration-test: Build command line using GString API
  tests/qtest/migration-test: Only use available accelerators
  tests/qtest/libqtest: Allow checking for HVF accelerator
  tests/qtest/boot-serial-test: Allow running with HVF
  tests/qtest/migration-test: Allow running with HVF

 tests/qtest/boot-serial-test.c |  42 ++++++++++----
 tests/qtest/libqtest.c         |   2 +
 tests/qtest/migration-test.c   | 101 +++++++++++++++++++--------------
 3 files changed, 91 insertions(+), 54 deletions(-)

-- 
2.38.1

