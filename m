Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3941383ejc;
        Tue, 17 Oct 2023 07:02:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRpHQoHm+jbhPgjGIjNY/DEssJJTB2gbIsPgnlbxssuzLLFk/Ief1RxIsG5VhGHlTaAAGv
X-Received: by 2002:a92:c0c9:0:b0:357:a04c:31d2 with SMTP id t9-20020a92c0c9000000b00357a04c31d2mr344168ilf.16.1697551336871;
        Tue, 17 Oct 2023 07:02:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697551336; cv=none;
        d=google.com; s=arc-20160816;
        b=DDE2jUjOmFbwFQfr76RaeqSI4FQF36vYLPqEZa4Og3Jtr0KKY2d/14ZNjv/fiz/q35
         g6RL6AbOHatCoLIMzy/N/kH8fnPcVmN/RBD+RyhebdSMhwF6UjshMcrzE+Ghg7Pi7S82
         2kvazN81RVY69HrB17u/FC276T6T0dJ1KzoUSJaUpG58ydbnh0KYdbQemX2CsN+dlsil
         mFXkh8qKIgSWNJ6BzYt+MeJrM13vkpsQoDzfKpGPv3XsyQQO1UgSMJL5y7uPCMeaqw4Q
         O6/PAcjy3OsQ8HbVBjcHYl0+NdVgX71ahM1IN4yDvRhGi+JDgIf8KsopiP2tSP7Bjesc
         D/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jK9MnOkarN7NF0Qc/XLSYHaYAFfcVhsfbF2N1g/hNuw=;
        fh=PkQUf9c5shm23GEgSgwIjaGjrTFXVTBGToef+bFaIfM=;
        b=YGA2GyunKK+ILXyEry2kpPult0XIBF0leR33lpG8F9j9854LamVXVfMi1iObwOhfBy
         qapO3Y4uPR1qr+4fKy9ZObtEi5XquhDT7HEKvBP5DIaX3waiHff0uGtlhFqsEuHdC36O
         4gukeyU0wJhUAJSdYB/B3IZXqqNWTosyRnfeFruCnsRYomnmoTUQVJCO5R3wojdgFG9J
         0u6xfRrbhLGpajqZdOlEEDOf3NvxBSMwC2gqn+1joymxb1G/U+kunjHcDoRYyqjWenUB
         esuwFO521gmJIhtd3zjHdJOhVEEYuBCqbnVzPdKlS3TII9bLutPrVRHnXyhj1y8k35SM
         0w7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zSdT+W3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ds1-20020a05613027c100b007a4f345e7a0si148970uab.152.2023.10.17.07.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 07:02:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zSdT+W3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qske8-0003t2-GQ; Tue, 17 Oct 2023 10:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qske6-0003ni-1I
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:02:06 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qske4-0008Kk-AF
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:02:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-323168869daso5299701f8f.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697551322; x=1698156122; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jK9MnOkarN7NF0Qc/XLSYHaYAFfcVhsfbF2N1g/hNuw=;
 b=zSdT+W3RXlk8Y+3VgBCP3MsJ/OnvuuLZTZbf33m0UqBVFYinFzWm6xqx6vKB6VfhXd
 gG+KmKFbIUiNRNOdeQUutJzVOmjxZ7ba+ROV/s0htRUPb5NPdvbQ39sMMIODSIlu/5rW
 mTUwO+ntSr7ziwNfdqQNZcrLoHSnvWd6xQ4SDOdOTUinTj867TNy34HndKO7fx+oZkj4
 wSbFIDxlWYkl/ew3vhaPebKznJv45Hr17BeJ+6hH8v+fXa20RaHa9qF8L1WyhFGjWIww
 0tQKRHF40rF+C/QVRDtLqgNAJPgVkNAGXexNxl/dQTuSHPw+TxzBQavNWEI9RlFzGWvh
 EVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697551322; x=1698156122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jK9MnOkarN7NF0Qc/XLSYHaYAFfcVhsfbF2N1g/hNuw=;
 b=Mw4YDkJyj2RJcG5hJy6MICWEGdsNJiazpiVGO1QeqEfr2HrFPGar6dFKaALLDJxadX
 ms67r2jRLFcwv4VsiZShA5VBMCoDQ+FsaS7+ah0tGMbKlX3v8tcnGqxKOuB/4uKFxz9D
 i5yJe3+4sa//nLFX25COcd4+C9LWs6luijnq8mEMpk0R4bG1RxSCjUGBzWk+VH0pxXD8
 irNxggMVrCak3FyPgW13/4/n688/ElHr3VoakArXND3qKaI3uBA47pxoD7dN9OrbAy8T
 vpixVl5V9ZNdN+c/b74U7tsBHf61S1S9ktoXiWf/A9yWCNBtQm7cXWTND8ndhkgv7Oq+
 ooRQ==
X-Gm-Message-State: AOJu0YwHzJAK8qKaiaipNHgkPSQ6tGWyfZsipKG6vJ7vZzXKUuUpuzjF
 gEyOfmCU2ExlQx3V+OrCDT1iLA==
X-Received: by 2002:a5d:6802:0:b0:32d:9a1b:5d79 with SMTP id
 w2-20020a5d6802000000b0032d9a1b5d79mr1705786wru.33.1697551321681; 
 Tue, 17 Oct 2023 07:02:01 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a5d60c5000000b0032179c4a46dsm1730095wrt.100.2023.10.17.07.01.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Oct 2023 07:02:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/7] hw/virtio/virtio-pmem: Replace impossible check by
 assertion
Date: Tue, 17 Oct 2023 16:01:44 +0200
Message-ID: <20231017140150.44995-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017140150.44995-1-philmd@linaro.org>
References: <20231017140150.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: LugwDPBcOuQJ

The get_memory_region() handler is used when (un)plugging the
device, which can only occur *after* it is realized.

virtio_pmem_realize() ensure the instance can not be realized
without 'memdev'. Remove the superfluous check, replacing it
by an assertion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio-pmem.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index c3512c2dae..cc24812d2e 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -147,10 +147,7 @@ static void virtio_pmem_fill_device_info(const VirtIOPMEM *pmem,
 static MemoryRegion *virtio_pmem_get_memory_region(VirtIOPMEM *pmem,
                                                    Error **errp)
 {
-    if (!pmem->memdev) {
-        error_setg(errp, "'%s' property must be set", VIRTIO_PMEM_MEMDEV_PROP);
-        return NULL;
-    }
+    assert(pmem->memdev);
 
     return &pmem->memdev->mr;
 }
-- 
2.41.0

