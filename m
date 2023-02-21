Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3710885ejb;
        Tue, 21 Feb 2023 15:26:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9XqF46ZMWhp2SADSwO3qxuwZ4A3Zp2N+xhnj9OofsF4uePDUEmamDXDYi2t8MqPW550CVQ
X-Received: by 2002:a05:622a:389:b0:3ba:138f:7b46 with SMTP id j9-20020a05622a038900b003ba138f7b46mr27067176qtx.42.1677022002855;
        Tue, 21 Feb 2023 15:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677022002; cv=none;
        d=google.com; s=arc-20160816;
        b=KcWgzJ1ojvJYGprCOltJwuCHnvuq8yICYXye5/Rhp+8FO5bsMueTx0NYKV8qZDIRpo
         MUKBwEtIxwP8rhJgySqOtiy/9F4j700VZjXuY2pj3aCoMOiTF47+4JW+CT4BKOj9zbQc
         jA7y1MV6/A9swua03/H4WspudqWrjmrzBzA5Hl15LGe4I0kxfeBGSe4ZBrqG926SjEdk
         HxaYXJnfZoYtCEyyCxFIQQsZzDzcDXvn90f6sL4+nNN0SfPPyKUYeGK/84+WEDF2/BV5
         LZESpSiTGJn1dNsR9SfDByVm6NsxqXJX4XbWTAj9GWNwe+egEs5mh2Z4pibO1C58Jl0U
         Ohkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kCjOFfN/JCWa/PeEus9yAgUI0eq6WXQy8QoVJLxSGDI=;
        b=B/qEtK1rTO6LO8/Kvae9BUQQnazmxuUiKdgXSTGVJsxJCAEPtqK26aAdtv6dKQtisM
         tVP0SZnIRJJwW3uA5SPMRA2LuwJK8oljUSpbJjQ1cCCVAIJQP+FnlxcQGiHMvpaJK110
         JojauPaJcA/nqqyg7pPhEDoc59nbMkRLO9pV/NuSX91HQCRM1f1NBsPFOwZ9t0Gijm/e
         NAJ3C0R3mQn/Slig/6bfDhpvFDisw9Or3I/wYgf83gIl0OHOItwfb6vRDGMyoxvYbynd
         Olm4spOhCKOArjWVGitzImIS7zgoPx6mw4+zKKROQ2rkHgYn4FpLmpO0MhCTzpGrTP6O
         sxig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jMMKDzXX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19-20020ac87f93000000b003ba283ac662si807061qtj.438.2023.02.21.15.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:26:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jMMKDzXX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUc1F-0005Ow-PY; Tue, 21 Feb 2023 18:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc1C-0005Lb-W2
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:25:55 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc1A-0002im-10
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:25:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso4849876wmb.5
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 15:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCjOFfN/JCWa/PeEus9yAgUI0eq6WXQy8QoVJLxSGDI=;
 b=jMMKDzXX2P8N4rIHCofsi7Cr6rQJJnrEkC2mpN7TAiI6UwEri8p3Yt2JfHWTayJUjI
 qoQ6lSksT7eR6cEkukai1JvI+BQXeSJTLkUWFiR6JqxmpZSWo7fFIMugI49JIJt1urTz
 3F1X27CjnzS+zw3lMk71CkzYc1HqJpbMufkBnewUlZsHe33d02QJe931E6X0LRX5V6s0
 GoMLYAbx5DGN7/TGyEggkcn90Ieb/nEjKFbAMNaF3SKVGbkGKzKnYZukpkzLAyoz3KVq
 Y3E5Cr5P/hOoFcqhjD6wIA+auK4W2DTtlTEOPLAl6/IeGszuRfms8b2JuOfcTjwEaulP
 59VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCjOFfN/JCWa/PeEus9yAgUI0eq6WXQy8QoVJLxSGDI=;
 b=rSuFpVT9xddGlkM3WSIoT1DdLGeBh4Q/bIdCi7ainlafFDTDFvTU2y3IsPeCSYFQ3S
 g5uOfThvFDDOU/Wyeo7+8vEEo8rkf8WphEBGdPkv4ghBZPA0D1Jc5GjW7aSI1cjLqAq/
 1IAVdaDZ07jlaRsEouoL2VFQM+4+826y31kz8qHA4W+77OOi7ALByZJGfE3YqpjAcknQ
 PAsaJeyvG6L0T3J8700J3wTzHq7VLgmB3BY9w2cKOxGc34itEtD2cnhzkWqglX7RARpd
 v9YS82m5BPNwxJLy6FZzbW+ApZJ/e7EpfBds1HOX/vhFxqIh0ntwqVybaCON29kf+agM
 Wx8Q==
X-Gm-Message-State: AO0yUKVy03wo8bMSeoPjlwuS0Sfk4fNne7q/du575kVsjUeaLLk4+Xz+
 7hJTsj+fLFNbXRhG8nhaG1lShg==
X-Received: by 2002:a05:600c:984:b0:3e1:fff7:e970 with SMTP id
 w4-20020a05600c098400b003e1fff7e970mr4862034wmp.30.1677021950629; 
 Tue, 21 Feb 2023 15:25:50 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc858000000b003e11ad0750csm3155554wml.47.2023.02.21.15.25.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 5/5] hw: Remove mentions of NDEBUG
Date: Wed, 22 Feb 2023 00:25:20 +0100
Message-Id: <20230221232520.14480-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221232520.14480-1-philmd@linaro.org>
References: <20230221232520.14480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: q2bnkUTJ/5+N

Since commit 262a69f428 ("osdep.h: Prohibit disabling
assert() in supported builds") 'NDEBUG' can not be defined.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/mptsas.c   | 2 --
 hw/virtio/virtio.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index c485da792c..5b373d3ed6 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1240,8 +1240,6 @@ static void *mptsas_load_request(QEMUFile *f, SCSIRequest *sreq)
     n = qemu_get_be32(f);
     /* TODO: add a way for SCSIBusInfo's load_request to fail,
      * and fail migration instead of asserting here.
-     * This is just one thing (there are probably more) that must be
-     * fixed before we can allow NDEBUG compilation.
      */
     assert(n >= 0);
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f35178f5fc..c6b3e3fb08 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1898,8 +1898,6 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
 
     /* TODO: teach all callers that this can fail, and return failure instead
      * of asserting here.
-     * This is just one thing (there are probably more) that must be
-     * fixed before we can allow NDEBUG compilation.
      */
     assert(ARRAY_SIZE(data.in_addr) >= data.in_num);
     assert(ARRAY_SIZE(data.out_addr) >= data.out_num);
-- 
2.38.1

