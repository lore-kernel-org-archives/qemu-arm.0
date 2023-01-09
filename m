Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2185191ejc;
        Mon, 9 Jan 2023 03:53:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvuJbNaq3k09xY+j9agyNMHavRM+OHBofUaXx0WH7VCWYG2BRYMn6/f43fXe90IxuJVq3du
X-Received: by 2002:a05:622a:5a92:b0:3a9:6cf8:9b4e with SMTP id fz18-20020a05622a5a9200b003a96cf89b4emr92418678qtb.35.1673265207657;
        Mon, 09 Jan 2023 03:53:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673265207; cv=none;
        d=google.com; s=arc-20160816;
        b=xBQ17WUYt9CfTUFw+miAGQt5zOgby47Dn1XWUqOsT88+zOj+go6+5ZXvpixkXTsHOW
         w/Jpo1kysAvOgP+G1hDKAg5kjg0ng70ZMQF6gHBNNBD39QGz9ISUYmMK8KDq1oxgTMY3
         h/sREV7i0Gj3f0HTHmnD94SioexLnozar5htdcXNi2apZOgzzqHhkzNoQpF+tUq1zjDn
         UvgqAUpeKIqXVbhBPlvJzsOPlAk+KNqnH4+Rddm/M6XvcVSWpwzC8sQoA3GGJd5MrQm5
         4m/TjQz5dO67ZC9vsFNUFRgqzky6MqVCJyrqXCgVRrG7nn5kssWgQ6nfJexauO32+P+e
         g9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=En2ECShv0kRWnzSOnm7XMPCMXkKsPEIuZqm6vHr6CKI=;
        b=dNwsJtz/Cdv0PvA8aHFnbl+Ue+IVQlNa+y8M1WNRE9e4glsf28OqG2E0coNkLynzsu
         8L72wR/tbzpPuMtaqVRaX79l77waqNCEJIjVcVcpCUsCMB2uj47/E2MpyPOI3j9577ur
         cfZHp0N/TMXhFINDawH+qeqqjpQUeKwWgqdmEYnrK8WZMT48iPNEj9umVZwFrVhopeGS
         At5k1+cBH81k0x3l2zQOiqvBJH38qRs7SlQjJiZBCR5G2K7Hnh+2b4Eg0Ot/SOf/jcvn
         kqd4behVcNbnBIhmc3MYSuRPl3PAV1lx7QauJoKg5MiQauw8GmfPT8xg012xndfyxojP
         NEtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8KMncHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020ac8740e000000b003970f9f8769si4273666qtq.560.2023.01.09.03.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 03:53:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8KMncHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqiR-0002mA-Nv; Mon, 09 Jan 2023 06:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiP-0002lQ-MY
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:53:21 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiN-0007tA-Uf
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:53:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id r2so7878704wrv.7
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=En2ECShv0kRWnzSOnm7XMPCMXkKsPEIuZqm6vHr6CKI=;
 b=u8KMncHg76duqBCs6KrKvA+tOa4W8vEunpceL24mhz3ZpBXxQ1NOZG9tIzCT8QQ+BI
 83dDTtMaAaI2FfRybaUAlQQNvNOPEsXQFiCC2jJa7WOcbxbWeBKhA0/GVEeBsack0e7D
 LH692XhsVf1HZLIiCHYVo5y9urFrYkUNZFmOttsX7aPyVf35zmp0s/CHBtUnFR4Y2NAt
 X6rizteHEmIm9HIESHvdMl/cjO3aXe1CvSriQ15LKwvUYgnDJheW4g8sTKlaB/sXq4s7
 b44ftJx61aFs5yQa/Qrvj/IBeGYTzqL5JEHroelaLewbFGe25f3WwqzJK1i+HrAZvIH+
 OFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=En2ECShv0kRWnzSOnm7XMPCMXkKsPEIuZqm6vHr6CKI=;
 b=rq11M76OpCbt00CuWkk4zz25G+WzQOYIlkCMKmhKYTBSW5gXVlHUvWlKfUtQAZEqm9
 2Jx5vz8sHo9X0VA+FMk2TH1EOpg/PSa5+oO2mRqOL9JsxvEhiQI47bM0y0TMYFU/0dEA
 YzSyqvDRsLWtLkexCPBpcRO8jXK30BJrvlUJh4m/8BhoWgovHxlxjgN8vB6YxdhJSvnc
 /V5KNWkyjQe1xRzjAbcZL7qxtxkCwivb3YpZzFHy9A3n+DlYdGbWJtbV5DjpGnDT+rbC
 9qdCHU6rFE1sMXC5bXaDkeedTS8Yz4PXfgDtG+3vVQyfd1J3UR8YLftwXoKBld8HW8WU
 IVGw==
X-Gm-Message-State: AFqh2krLRpI3C30zRAxReNaZbcnEkGWOBJQVo2uHZ2svjrcjgQ4GDy4m
 tDv8869G8KYwdckq1bArgKHX/w==
X-Received: by 2002:a5d:6e0c:0:b0:27d:a1ea:dcfa with SMTP id
 h12-20020a5d6e0c000000b0027da1eadcfamr30774572wrz.19.1673265198291; 
 Mon, 09 Jan 2023 03:53:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b00236545edc91sm8475609wrv.76.2023.01.09.03.53.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/13] hw/arm: Cleanups before pflash refactor
Date: Mon,  9 Jan 2023 12:53:03 +0100
Message-Id: <20230109115316.2235-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: 9td1bM4i9YoW

Various trivial cleanups:
- Remove unnecessary sysmem argument from pxa2xx_init()
- Use IEC binary prefix definitions
- Remove unreachable code calling pflash_cfi01_register()
  (another use in PPC sam460ex will be removed separately).

Philippe Mathieu-Daudé (13):
  hw/arm/pxa2xx: Simplify pxa255_init()
  hw/arm/pxa2xx: Simplify pxa270_init()
  hw/arm/collie: Use the IEC binary prefix definitions
  hw/arm/collie: Simplify flash creation using for() loop
  hw/arm/gumstix: Improve documentation
  hw/arm/gumstix: Use the IEC binary prefix definitions
  hw/arm/mainstone: Use the IEC binary prefix definitions
  hw/arm/musicpal: Use the IEC binary prefix definitions
  hw/arm/omap_sx1: Remove unused 'total_ram' definitions
  hw/arm/omap_sx1: Use the IEC binary prefix definitions
  hw/arm/z2: Use the IEC binary prefix definitions
  hw/arm/vexpress: Remove dead code in vexpress_common_init()
  hw/arm: Remove unreachable code calling pflash_cfi01_register()

 hw/arm/collie.c      | 25 +++++++++++-----------
 hw/arm/gumstix.c     | 45 +++++++++++++++++---------------------
 hw/arm/mainstone.c   | 37 +++++++++++++++-----------------
 hw/arm/musicpal.c    |  9 +++++---
 hw/arm/omap_sx1.c    | 51 +++++++++++++++++++-------------------------
 hw/arm/pxa2xx.c      |  8 ++++---
 hw/arm/spitz.c       |  6 ++----
 hw/arm/tosa.c        |  2 +-
 hw/arm/versatilepb.c |  6 ++----
 hw/arm/vexpress.c    | 10 +--------
 hw/arm/z2.c          | 16 ++++++--------
 include/hw/arm/pxa.h |  5 ++---
 12 files changed, 98 insertions(+), 122 deletions(-)

-- 
2.38.1

