Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp266576lfq;
        Wed, 7 Oct 2020 03:08:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwprF7uqFFvi1a8vYf/biUMFRn1l05i+/wnhQIAuHItpUOEQuzOuUfEiHkJSzxiaVQyO7gC
X-Received: by 2002:a25:ab23:: with SMTP id u32mr3178953ybi.221.1602065303448;
        Wed, 07 Oct 2020 03:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602065303; cv=none;
        d=google.com; s=arc-20160816;
        b=dbDCU8OjaUHAL7B0Mh46DVClfSJxvrq0uFKPKg4nUQG18lfhIC8Hy2ALlJaIShrMr/
         7oZyBJ2qintRmb86bJToEct1gZv2GicvRBRbUaNS3c07FMy5TAMdA2JedeyaYvqYW+pc
         Ry1EQPgKmGpV3USoNHltOIuNw5e/uV32SmWaZQaJVcl7y7bjd2Qt9O9JuzAFytehuY4W
         NTwGNbCaGw2X1GBTrrRhPFa8FmZWn2neLhwKZ4IqS1BfI7gcsSbFvo8+pD2nw9n/UtUz
         TAMAhw2aGqpiNoXnxt2QWpAjgZYRwc0EGkyRg07DCi9EP4xF3vNorG/kQ98Exf6yR5Yt
         zAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+NWx5IEYq/NUxMmoCniXmRWP+qb5Ua3EyPcLkM+WBIk=;
        b=vFrGFqTjV7m8JUm4TyfJtypBB3pn6yIT51gM2Sq4maTSZ0/PK+efYF15k/kg7QjOrx
         GLABxBRVEfnLc5tgSKFdZEfISd474TY/E9469k9jP9BVLMisH2ST07wleEAuqRK9zUAc
         AAxv+RFK8ijgN6Be5TP+3BhU5OMnJcH1Up6uBsVxqg+KppLFuYrRNjDG9wHekAgEYju8
         rUYuoja4Tvn3Zt6/qlg7APUiLEml+KJ37SVcsyhpRye0oA3sz6wPXiUtadMFZ7Yw+z8g
         dEKCc2uJEvbljzCVpusO1pfVIwhoN4vnvOR0T5Eh6LyYtbAfG03ltePlzwBLqJioS6cJ
         bwsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=a6c1WyDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si1562243ybo.473.2020.10.07.03.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 03:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=a6c1WyDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ6Mw-0005U1-Px
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 06:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ6MT-0005Qi-Ch
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 06:07:53 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ6MR-0004UN-Fq
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 06:07:53 -0400
Received: by mail-wr1-x442.google.com with SMTP id e17so1437637wru.12
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2020 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+NWx5IEYq/NUxMmoCniXmRWP+qb5Ua3EyPcLkM+WBIk=;
 b=a6c1WyDIqcusrnopqFlftBdNatMKY2XMS6uGer5l+ulK7gE+6aFW+4DEtQnHkEFPgQ
 2bYe6mhB8juE6inlOt4w3XcnKjzNcOuViXukuMZv5ckn6qrApuUd07kdMqJlvl3TRfnm
 YhlwBidoW2Vy/+qyUOjm4Hgko8J3Em75bGR1G2X9Smvzj8i4tAqfdixYGWMlF08mmm6o
 GWWvQGloc2t0zGbYD7unVOQYkmSTnwXeMBPupuCAHejOcSb5/lubcnfwjhnZhbV3AEyR
 cOI+oP3SG+TgLlF2ypsh0YAQ/mHc1FZ5aAUsoKVaOmBe8PpqpvOt1MmVk0twso0AB3f1
 B5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+NWx5IEYq/NUxMmoCniXmRWP+qb5Ua3EyPcLkM+WBIk=;
 b=BCVoQkegeN2ZqS/4ZTfTz9mSg7lNVtmMNXgaAVUASLGDDPuLSkseipUop6eRlmgrgF
 KYGkvGF0BndsZupgdld1AbVcNxrM07ogGgdxsp7c/kL/pNv1PuEBBu/smdjl4CbuQ/8h
 Qdvh4YHupScYoGdBQORWD8LZY/qYKVpXQuO2txqRb30uKQFlfaKqL81xMdvBIiOwfjHt
 jWKJYfGcZoscdcfEWNg/y8U0Hvo6zbtY7UJyNxxKdU7gzyKJc3pmlYAjFAl2aPa+x/40
 kKEkQP5s/H0IgnCpd8O0iQ8GBfBD3KVtRox6f9jAtorDInF6PXRWQ/zjpCi1NQeRYv3n
 6viQ==
X-Gm-Message-State: AOAM532BpQMOEZmP4noWUiq1NXu18XZqTBZNgL9aPu9hZ69FkTpe7v9u
 CAHsbBJmdtdjB9LS4TkGX7mf3UOCm2DA9s/EmVmdj742mKnZfJClIqa/4cRJEyPfZItU8c9mRq8
 6rVZn3uyc1ruApKJNEqixsrhjPUuhW3UYp/NG5CUFdW0VtNtCNXARDBENjfa4u07cGd6pHA==
X-Received: by 2002:adf:f104:: with SMTP id r4mr2668789wro.202.1602065269294; 
 Wed, 07 Oct 2020 03:07:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id y6sm2208504wrt.80.2020.10.07.03.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:07:48 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/sbsa-ref : small fixes to smmuv3 initialisation
Date: Wed,  7 Oct 2020 11:07:30 +0100
Message-Id: <20201007100732.4103790-1-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=graeme@nuviainc.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Graeme Gregory <graeme@nuviainc.com>, peter.maydell@linaro.org,
 rad@semihalf.com, f4bug@amsat.org, qemu-devel@nongnu.org, leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dlskDy9mRjeW

Fix two issues with the smmuv3 initialisation, first where a previous
patch had transposed an i to a 1. The second an assumption that the
IRQs allocated were meant to be unique and not 0 based.

v1->v2
 - split into two patches
 - previously sent as v1 post split by accident, resending for clarity
 - added Reviewed-by

Graeme Gregory (2):
  hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
  hw/arm/sbsa-ref : allocate IRQs for SMMUv3

 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--
2.25.1

