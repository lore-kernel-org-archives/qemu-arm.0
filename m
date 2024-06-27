Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp309547njb;
        Thu, 27 Jun 2024 09:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeztq3knGlB38m/9PCJLWABqZu1Xo16ONywAl06oMRHHufH6ukrgLHsw4DE9QJorT9l/k3USEnPRGrIj+0O084iMpDHKMd
X-Google-Smtp-Source: AGHT+IGHeXgRiFBWirYd4NPcygNvsGgBItF5UsWQsxYv1MOIyZ345K3n7Su/OO8Sme+NU/ZBhmUI
X-Received: by 2002:a05:6214:29e1:b0:6b2:de80:2be5 with SMTP id 6a1803df08f44-6b5409e0be3mr201189926d6.31.1719505429180;
        Thu, 27 Jun 2024 09:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505429; cv=none;
        d=google.com; s=arc-20160816;
        b=j6a8fGpFdvVv+nAGmgp+WKhvmrDkUOc7yWNsNQxrkkts0h60Mg+3Ebs6S++9puUa+r
         dKxyU097WX/fxdyt0Cfuc9/XK4Ss5Bsrfln+5MXFUA4yhQrvmBFrCGTa6QHnn8VvVEFi
         L8P0XE6nu4wvOzVcS9SnPEDeM2MCq+rfRgYKGFLGXZFxt0Hm9sm0QvNG/1AxkiI46TfE
         LETx6nse+c2SrtXsOj/g3CKmRpgT27BrepfHXr8SnTtXjsGShIODGFoC5DyDQZHKdT3M
         +8Oe2hhrj1WUvODpzFHwokKZKjgcxNrVDqV44LgycFzRtgVEimT8m9ZwFdsqDRCn3hgH
         T74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FehxPMt54YZs4mKlk2O0dDcvxQwBqAiau0Ry18uuTzM=;
        fh=DR2NqLsuIIu6O8cxdLvOq+h9DtqYj1Y6TLZrXQP4yqg=;
        b=Hh4uMDDhyW+bEs1K9h5NKMzb1GGS1FNUP200O11F7AVrQhyI4LMGiSzCOtIkLjGxOa
         qyXGZ26YzpEkTd7kPhnmR6o9FvWugrJJRaUehlJ8ajh3LCnIaUQiZemAbtA4/QqIYkv3
         rvTEDUtk8uPzvB5yhWhUqNoG81jT/lpw/e2wPutBRPRBF9S6SE49dMG+FYLvsFotp4r4
         XNKrIcfk9JyvU9ZEDJZdt/bxNHYePY5WyY7qGZUbekTftBAoUd2Q8iaXd4jiErhAG3Qc
         u78o7/3vLAZbfSCX0+e3wBPZSkP+1JrK3ODIMibNi5QF771spL3NsCvAOPaHaWNx/dFA
         pbKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tDFYtmbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59264f7bfsi15974956d6.203.2024.06.27.09.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tDFYtmbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrto-0003UP-40; Thu, 27 Jun 2024 12:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrtj-0003SK-Dg
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:22:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrth-00076D-K6
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:22:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so5411580f8f.3
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505376; x=1720110176; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FehxPMt54YZs4mKlk2O0dDcvxQwBqAiau0Ry18uuTzM=;
 b=tDFYtmbWqkrkRQSj7AT/JOWFHicHmCzy7N04rbm154RPu6cFhptTVevzdysOCGGshJ
 ircp88kDwVFM3b+X7MG0UhWwp89iv15ZVmtzO6ZcUvmpVDAFxyOe3ImPdL5c7rC+V2st
 8rOd+M+BeQbM53UkeNtv2oj8ttiHNNm2Um+MypHhc5VmkBbyDfM3QhZ9LoDHWKFcHs4d
 +1W5DGLIcwo7kMhObEGvopmkQO3I1gpmwyA3lP43nEcT8ojWJ/q3Oi/qJ3eKiAcrfQgn
 Bl95HJSxWVgmsVN1Y6pcbJKE5CD1TVaNByAge0z5wwCNO5/rwkMArVw9fyBK1DjyXybs
 Ok1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505376; x=1720110176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FehxPMt54YZs4mKlk2O0dDcvxQwBqAiau0Ry18uuTzM=;
 b=qfB8v2ygED8xItrR5YX7mKhn5PrEy6hGbyuvxwsYeS0kZKnnMqmroazeUR+PvcWe+E
 fEaX6tVjv6B7UzAdMCn+qEk64FGrgXi3mESuINm1KzxW3ODXrInyhkxfLJJEYqF7tcMT
 wVC9/UfG0BIT7FOuLqZ7X4uld+qw0Qi4T4/EsqOyC/F9PWpuRUOEifmo4YRne+wxy/G5
 aKx+P1LO/weCv1+CwNyZBGVaR5lxZk8qT7+gyU/5dz1654HaIGSN1mai4mr0IEuegL8P
 kMWol5ADmfJrR8IJO21cwIG+5SmrGHVvGvRRxwZ5qmYZrIaR2sg60QfKDR35qeS/nRNz
 xrPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmoUv3O8LtxDzQXXGbBRM00kQ0oocYx4obFhcuRLwD2PKtw6Uf/seEOkejf7k5fsVMMTRz/gRBZGOz1GJUv8MY/TUM
X-Gm-Message-State: AOJu0YzejmcHvzovUXtDeAbIkEVkUEnl7ytEOP+OQWfrZJP+W2b5RoW9
 9kEYYpLCLescihvkLxi27EeFvIxmsewuBS5wAswkFGe+FcltoJp51JGyhVSZxXE=
X-Received: by 2002:a5d:4047:0:b0:362:590c:84cf with SMTP id
 ffacd0b85a97d-366e4ed3b67mr8850061f8f.24.1719505375971; 
 Thu, 27 Jun 2024 09:22:55 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674357fc35sm2384182f8f.25.2024.06.27.09.22.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:22:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 01/17] hw/sd/sdcard: Deprecate support for spec v1.10
Date: Thu, 27 Jun 2024 18:22:16 +0200
Message-ID: <20240627162232.80428-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: jleUXqeqQKUu

We use the v2.00 spec by default since commit 2f0939c234
("sdcard: Add a 'spec_version' property, default to Spec v2.00").
Time to deprecate the v1.10 which doesn't bring much, and
is not tested.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 docs/about/deprecated.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ff3da68208..02cdef14aa 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -362,6 +362,12 @@ recommending to switch to their stable counterparts:
 - "Zve64f" should be replaced with "zve64f"
 - "Zve64d" should be replaced with "zve64d"
 
+``-device sd-card,spec_version=1`` (since 9.1)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+SD physical layer specification v2.00 supersedes the v1.10 one.
+v2.00 is the default since QEMU 3.0.0.
+
 Block device options
 ''''''''''''''''''''
 
-- 
2.41.0

