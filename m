Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2829494lfo;
        Sun, 31 Jan 2021 10:53:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKCEO/s3rM/3J1//g2d1CNyzldyROv39bnu0dWh+gus1u5p/5DHA3NDbgwEDso7xlcVu57
X-Received: by 2002:a25:81cd:: with SMTP id n13mr20028140ybm.134.1612119189247;
        Sun, 31 Jan 2021 10:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612119189; cv=none;
        d=google.com; s=arc-20160816;
        b=Bc1h7EH+EFAdy33Y5ZCe9Jx5/gPzn1mGegHWnARbNnILh77ayHg84zuKJbaVY5lqnS
         HxbMVOyxjMQ5MAnBU7fhF11LiPqz62gq847tQCRRQLksR5dy9TzSctOeUK7OWoXwhFTg
         7LTjEZ5l0JWDQmGSxjD8QHwpSP3lrETyk2vi42MDEAT4AmiMVSevbX8F7fCVQEWINCWm
         ezP9tjelOnzY/+jZgOBRZemglVF61g3b2SlyaO5dhOCLjXq9bGPSi1faBrHYqt+mKlpY
         CtNuskkhjVVLJqYj3jDrXvrzP0ibc1zdQi3+YZai7Vw8x4T7/ynrAB1LP7vxeQb4e+o2
         wn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dNCf/fnSg4i/RlVqvC4tpeAa/bGn7I/5i5RyvqlkfeM=;
        b=QTqpqEfzKZ5MGRx9GZh1vxAeUM9Va/J170OzsY4t9qmTnE2kUe5s/JLOuW3G4P0HdD
         AShays1qEYBo6lw8v+oFFjWyGIbOo1PngWzqpIEKLdnoivOdvHqwAlOoycCSq+kIiJrl
         Pnosg1DYgVCLtOiPZw4EtUJ2lzIp93FWwxcMVFxQ5/uhu6N9DFWbGkp3mT5rOQEDmgkd
         YrY2192vQoIcEjyF9hx7Nmx8tM9A57SwN7jZuH2oMOJtDwHL4tVjkir0HtUE5smWJCR5
         dVkqElmOVUAekQ3P80qvCVVEGcefIkMCwtlLHFnVSqpNGa3CsRWwG2xX3mBnXkpb1BWO
         SUHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fm19mkj0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si8566321ybm.497.2021.01.31.10.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 10:53:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fm19mkj0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6HqO-0007kO-LD
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 13:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hin-0001yc-Vw; Sun, 31 Jan 2021 13:45:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Him-0007c5-Lv; Sun, 31 Jan 2021 13:45:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id u14so11322068wmq.4;
 Sun, 31 Jan 2021 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dNCf/fnSg4i/RlVqvC4tpeAa/bGn7I/5i5RyvqlkfeM=;
 b=fm19mkj0jseLfnTszAPO7p6gj1tm7wIOqL2VuFSCAIXWsbmSABwfpdKaz1VQ7gGPCk
 bjlBOwASltuCQ971kuwmkacU5564b9IXM5DqZJdil7kFc2Vmuvfsi6L1rab8ZWhpYpCo
 c0GHQtk9OXdVI9sd9gZKb2MblWu6psSPGfZ9c+M9sRMOcLIe6KX+/751+j+KvKO61pEw
 knfG+Hl1uH4wWoBJDhq4bThOxBRssJ0VuQ7PIybgAoxKPg98r+wadKZg1GfQ6vAKKlRc
 2Lc8BPAiH9MN9SZAGp7dJRTBgZP/Ja0680mOdGM/THHmeHu+TRqJPz7ayCpv/SzVrf/B
 hJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dNCf/fnSg4i/RlVqvC4tpeAa/bGn7I/5i5RyvqlkfeM=;
 b=C8GCurOFdp9TX8jAQZhNLWhYghGgN51fzUAKDVUhj6jr/Urq3R6P4a1JLpb/uQZEri
 J/0VC1VcjxNW74ZpdEaupY9P4sQnabZly47NNQNJPY0GaFHzmu8oQFE0jtck6FWNnE/f
 Xr7TEk/pCqJ3Y1CJ5kAVaK1u1xwgcICDmf7feIy2rdfWe2bGulB30vmtXJFwwgb7457d
 H3q1lbrxI1Hxzf2oHj4cm9chMSVSlz3QtrAV79vEGKE3IHBBQFB3IE09+LmbXqoxlWF9
 Pdl5t7hCYPHuwcO6hOkjMNzQi6zHXWtCr/CUKZEpHZ3WSxY7DCBihEjxM4wvMzT5szCN
 OODw==
X-Gm-Message-State: AOAM532Kb5v3Jxx5eDBn2gbOjK/v8LU34ZpYtcM8LYYGZiGusird6OQh
 LBIaB741Pi8BS1X8mWLODggh2OSOgKk=
X-Received: by 2002:a1c:65d5:: with SMTP id z204mr6641246wmb.184.1612118713233; 
 Sun, 31 Jan 2021 10:45:13 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b18sm23653374wrm.57.2021.01.31.10.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:45:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] hw/arm/xlnx-versal: Versal SoC requires ZynqMP
 peripherals
Date: Sun, 31 Jan 2021 19:44:47 +0100
Message-Id: <20210131184449.382425-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fG7xzycRREBQ

The Versal SoC instantiates the TYPE_XLNX_ZYNQMP_RTC object in
versal_create_rtc()(). Select CONFIG_XLNX_ZYNQMP to fix:

  $ make check-qtest-aarch64
  ...
  Running test qtest-aarch64/qom-test
  qemu-system-aarch64: missing object type 'xlnx-zynmp.rtc'
  Broken pipe

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 09298881f2f..be017b997ab 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -364,6 +364,7 @@ config XLNX_VERSAL
     select VIRTIO_MMIO
     select UNIMP
     select XLNX_ZDMA
+    select XLNX_ZYNQMP
 
 config NPCM7XX
     bool
-- 
2.26.2

