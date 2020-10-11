Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp506221lfa;
        Sun, 11 Oct 2020 14:06:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1pg2/l8fJYcXBUytJIpzoZu5nTGmYwcWzcjbhunrp0Ts/cBEmSCTUcoopxSboM7sRNpvb
X-Received: by 2002:a25:1f84:: with SMTP id f126mr28968954ybf.192.1602450401632;
        Sun, 11 Oct 2020 14:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602450401; cv=none;
        d=google.com; s=arc-20160816;
        b=wmMP+ysx54+gDB6P9VjlYsxB8iSx/5fa4IPLe00Ti7/xd5zag0d3AGxNVMcsUGmEml
         9l1IHWvUXscZeWiJuk+1PbMRur4cj4MrrfMvuD+HOswdVYw/Ol11S9ThYBNx0z1G3yP+
         QrIvnbLzQ1fikIVCOjn78OVyG0Oa5I/t4C9FePy4hF/uYnAdMuMno4/dv5sZhPVfuc05
         AqFcQonPvzTXlbpniIwsvl7avaaVUNHHIO0uipxA3lzvvDrUNAMaeqrGhUgiOtiV8LJ8
         oUZVMNtq3P4yV9qxZd2i+gw9zMbNFpzTmQA5XFhJoYzBnbaFrSZgNnysjZJ5BON4U6+E
         vJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3/Yc3WohY6Xtn0FpFPx5SHsA/mZ/UF7uI6UU+43HITI=;
        b=ce0xjXwo+HzKDeUbj/g4njQv6iFVg5HJv4Esw9UQNOHrunpmdbmwAZK0H4P9KKZ8b5
         CRhqpVp3kMhYC/Xpf32fTPhRd9v6BuJGRXPkkUij5VlAeStyu2864YXtGQWfj1ZXQadi
         ViYqueEWLmQg/Gbv5r+8hAhrCWos1/l52eX5u4e91LsylCbOS4nDnCy0b8xDb1gzQuoU
         OIfSBJs2bavCY0yCmuqOj4rngX5+aJOHczACyL1Cyd+JODq+IUj7wsVMkGirolWt3OBx
         aV0XSbhW9cKSpt9WY/w9GZnSt8hm2EdaZT7vXmykGhN9czUwNOlJtKzRA2Q2jgul7xDJ
         vR0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dly5QzSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si13397087ybe.18.2020.10.11.14.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Oct 2020 14:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dly5QzSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRiYD-0008DY-24
	for alex.bennee@linaro.org; Sun, 11 Oct 2020 17:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRiX9-0007pp-Dk; Sun, 11 Oct 2020 17:05:35 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRiX7-00006h-Q8; Sun, 11 Oct 2020 17:05:35 -0400
Received: by mail-wm1-x341.google.com with SMTP id d3so15561026wma.4;
 Sun, 11 Oct 2020 14:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/Yc3WohY6Xtn0FpFPx5SHsA/mZ/UF7uI6UU+43HITI=;
 b=Dly5QzSQXGzZGxUrz169OqjcKPpZxZr/+xZmt7vrY1jIUeDpMcLfRiLP0Z0Ql5oKn5
 zcmhIt1yAdsw8E3Kowe6IKNMk6bhEFw83SPqmWRnhr4GWCG2eGZRe2u9yaYeBnsk8Hxs
 gIYqfG57Vj+H0TGQxLD2OIdsppzZ+VkFyf6SB6FJq86iAvH/yzP/BOCuFeYwb+fqd4gl
 +uQYDvDNbTDRfx86Drlfk56FuhZJzAtBaJ1YrnXsdcocvV0cPDrEvjrFYpc7j9Q6xjaO
 QSTizlMt9UC3jauBM+/E+FEPhmja0d95MVffNAyhsz+tlUdfTkkTzcb9u9NveA1LBSNq
 Nmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3/Yc3WohY6Xtn0FpFPx5SHsA/mZ/UF7uI6UU+43HITI=;
 b=OS3CmRCxtN+hSzkxxVK6Ed2fx9GTw2tUAllWSWPBY6lzVtqsEpFKjVHuVrKNgwDb/+
 krUiWQGOqQ3oTJX+LzD5cc+n90XS5x5V779LrXU8kDYHByFxPAde+OHTYCzgr80BFH5g
 LP7WwHKJL32Ftq1TaBknHi5N8Vx8SpNVAjD0fiO2LE/PygD/PohYJZuSIIVKykBjp3iR
 QpZmvgI9+zuiox2w5ewKg4pb2TqkW+HuaALAHowptyffUQu8ubHLWJ1gawTcHmIBV6+b
 Sf4zil3Q2SRDfMtUOPsdcOx4J57c/yYeZte8nfrNU4LQj2Y9RzVnZMxvCgtSxXjyJdqH
 e07g==
X-Gm-Message-State: AOAM532PLKQHEHGZlrnuTXTOWiFlGD17okotLavKpdoGXWWgdwGU4XpH
 U8Id8yJ9KK9tiu44Rau5E7QBet/z9UE=
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr8292685wmf.104.1602450331111; 
 Sun, 11 Oct 2020 14:05:31 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id n2sm21987838wrt.82.2020.10.11.14.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 14:05:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/3] hw/ssi/ssi: Update coding style to make checkpatch.pl
 happy
Date: Sun, 11 Oct 2020 23:05:12 +0200
Message-Id: <20201011210513.3253905-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201011210513.3253905-1-f4bug@amsat.org>
References: <20201011210513.3253905-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Epim7oE5fzQR

To make the next commit easier to review, clean this code first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/ssi/ssi.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index fe3028c39dc..c15548425a3 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -1,12 +1,14 @@
 /* QEMU Synchronous Serial Interface support.  */
 
-/* In principle SSI is a point-point interface.  As such the qemu
-   implementation has a single slave device on a "bus".
-   However it is fairly common for boards to have multiple slaves
-   connected to a single master, and select devices with an external
-   chip select.  This is implemented in qemu by having an explicit mux device.
-   It is assumed that master and slave are both using the same transfer width.
-   */
+/*
+ * In principle SSI is a point-point interface.  As such the qemu
+ * implementation has a single slave device on a "bus".
+ * However it is fairly common for boards to have multiple slaves
+ * connected to a single master, and select devices with an external
+ * chip select.  This is implemented in qemu by having an explicit mux device.
+ * It is assumed that master and slave are both using the same transfer
+ * width.
+ */
 
 #ifndef QEMU_SSI_H
 #define QEMU_SSI_H
-- 
2.26.2

