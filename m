Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1412130lfg;
        Fri, 25 Jun 2021 04:19:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPYB/KmDO0vtmxWlhJywV/uqznkrRFCsoolTfTDrHTnCAXrWx4TMkUw24L9zRbL6KJ+C55
X-Received: by 2002:ac5:cf08:: with SMTP id y8mr7114394vke.2.1624619949359;
        Fri, 25 Jun 2021 04:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624619949; cv=none;
        d=google.com; s=arc-20160816;
        b=LN8g0Zb5AqPedh6HTSpApCJncx8sE7J/htZV9n1nunVj4McmNu1INYz6RA1nhPl91G
         xUacEiONu9tQ005U90fvMjNGwYPGtsWfES5V7LUo7kvdGISgaYhwpfjVveA60gi2BSCb
         i1NdJl4ANKhWETqNfzdt1VwHw5X8Jwh8OLLORSqgeA8oHGVdP/d8EQOIklgqSV/cXFlT
         ztU2vL7Hw9R2r4wYYVUBho+ACNlmP2YWXqbxxWBjkA4Agm2toLKg/ra5/SoQNlGVs2EH
         3qkMFScXZBq5C/x2srMVWlscX/iA/ISJo5Vn/Pwo4QDLjr6SwNet4v7ISa45Ucrhk6I4
         n1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=gtdORX/Lc1UAm+r9wIb6v8yFJiA3dxGeuTUthAA5zdg=;
        b=xFxu6bcrkl8WRmfTW5bIptN5OgnaLroYiEwnqUdwOZ79/RE/YcRcN8E8zprQ9Us/V6
         UTnyCb2jedo47u1sepJxo2TX9WPJdo2EVccIZTRjK3Q+V+hJPPu7n2roAFltMFpCMH1g
         AB019EC09cfvPU7fURWTTUuLBL4eKoGDHvKdaURGpltzNr7LE7fKDTNhfYUtZ7smQylD
         g+0E7nguMPEZiwGZB5N7BABrlyouqzCzqh8YOJT8rfYXQCSlKrtpysx4VBtTENawMGQq
         P8IVd/UPVb34QOtnUq1GO8oY/X9NIMGul+xklaILaasfMsTP75uBf5JjwZMshWDZldZ7
         wsxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DF74QdlO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si4321413vsj.69.2021.06.25.04.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 04:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DF74QdlO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwjrY-0007d5-C7
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 07:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrO-0007ce-QL
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:18:58 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:46768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrM-0004Uy-Vh
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:18:58 -0400
Received: by mail-lj1-x22c.google.com with SMTP id q4so3622853ljp.13
 for <qemu-arm@nongnu.org>; Fri, 25 Jun 2021 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=gtdORX/Lc1UAm+r9wIb6v8yFJiA3dxGeuTUthAA5zdg=;
 b=DF74QdlOlGF7Qhq5F7Xee72l7r5TUM05JjtTFsPQE2Qak4TRJit5dE12li8MIZiewM
 iwMtrvL4Dh+4PVjdI+xOmR8v0xMO2BBmr8ImcslORZ9ITk21ACLyJztdC2rSbSAxqkiB
 on7uld/Z9GpuIp813NFE97o45mvrqj8wcEiD9Hs89KUUFn3m2IJZ8DYtovHmwguy8SxM
 csvkxruuIjoKC+VIazy2AIBIzyib9gEqUkC2z4JKgpQY2fwPhFU0hb9n0KnSmq+yD7L9
 wohngJTdh+FL6lu1AiLpLlXyibvNHKCXQOUkcVJ2BU2fm0wxoxbn5bA0y1E3bpu+rl5T
 kwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gtdORX/Lc1UAm+r9wIb6v8yFJiA3dxGeuTUthAA5zdg=;
 b=EYoejE2TFFY7xXeo+FXqsus2k7oTNp+0AHhzkmKjCUolc8cKZzjUntKXxPeFsbW/ZD
 Is57YeaknlEA9sRWkyKSapSCLjplMYz2U1/8HOM1ACbcIixZRRNwVQIrOkM0HWlJ/Vpu
 13uYrESvT0FxcixwY6yKtQnpKEn2NML8RjI02Qc3X0vUmqO1v+kFFzW/wTObBBNLA6R+
 /krNl11qOmFz6ZaEQWartrXUyEmQ3b2KwSJ9di5kQGQK3tdzScr38z3Oz0H3OllDovby
 b5Z9EGXQI4JtRC43SpGjxh22KTRSCr6iVoLFfsmZyK8eocqATo6B/oFHpPfr1AQ6HaXb
 b0bw==
X-Gm-Message-State: AOAM533Lo/+eXmJI4HR+4gS8m+OCRA0dYZTx8psCZOnr7EUVsrr33cgj
 i58p1sbbrItqRkrzTCgp1Qv8ag==
X-Received: by 2002:a2e:6c1a:: with SMTP id h26mr8004059ljc.34.1624619934333; 
 Fri, 25 Jun 2021 04:18:54 -0700 (PDT)
Received: from localhost.localdomain ([91.193.178.173])
 by smtp.gmail.com with ESMTPSA id p19sm536354lfd.70.2021.06.25.04.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 04:18:53 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] arm/virt: fix machine poweroff
Date: Fri, 25 Jun 2021 14:18:40 +0300
Message-Id: <20210625111842.3790-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m7KTnGOSkb8k

Tested against the latest ecba223da6215d6f6ce2d343b70b2e9a19bfb90b
and ATF code. Patches fix 'reboot' and 'poweroff' commands issued
from linux.

Maxim Uvarov (2):
  arm/virt: fix irq mapping for gpio_pwr
  gpio_pwr: use shutdown function for reboot

 hw/arm/virt.c      | 4 ++--
 hw/gpio/gpio_pwr.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1

