Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3867450lfm;
        Tue, 23 Jun 2020 00:22:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7xW8z5zIUI/hGXa2+3cF/LcGlspRVdtOj38isoasedQ7C3FWTbJ0BLNrWIIJmY9yRw4KD
X-Received: by 2002:a25:7003:: with SMTP id l3mr32962490ybc.380.1592896962225;
        Tue, 23 Jun 2020 00:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592896962; cv=none;
        d=google.com; s=arc-20160816;
        b=HtpQ1pQDpp99NcumAFKIdB18ZJdVvZYiJgW6pvPOiIgfHvIukjoNPLzhtuJAVM1Mj0
         Wt9n4gGqmRtSWMLubO0gX/nMx6q2Y6CVwpwtMs3a2zZYFHtkSK+W7Jhyj8ljDD/RZrgf
         g9A7M547SIJ3bcW8VhkyWXtrA7f1xjzIrJjcATdTk0qMTjunCNc8p7z9JRQR5/DZD/by
         8ZcP6PQtaj9CC/Z4wnwolETrhNAOsIFrj86jZ3Nh17xANEj1j9P2V4ojUnvwzN9mbmyX
         Jts4dRfjoH2lTloAKrcK3cqU3Fo0BFsoNmsXeBJFz1eGTtpn7/XiqS8yqqcJFM6KWE2E
         HPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PC262lDbsM+izIS4gIzIDS7tjH2mSBnNq8vbqL9Ixqk=;
        b=DswRRVfYccsgn7SFqO8gNHBsuZ4wCto1EqpdXKJv1ReshXY6UDLpOHDrkTTrSkFzAm
         VkOy1Be7P1XfYig1SW2do/zKJJHXHeyKG9Xs5kDq9MMGu8nmmZvOV4M2E40fd9M8HiKl
         O0d4qw8LNTsgYumL9NawF2fO40ToVCS6Ymjz61CmWJ8QuyPE92vdSwftogJ1i80xXh+t
         inoMoQi/5EsePllPg/KrUNLsxxAnQyy3nxukiH6WRNkkFWtGDL9Dkk5Nig+F6D2j2a9G
         LojaFCXJEs+rWGnDPBOeZT3Hy6VCRbx5f9DVOBDiStnTX7EGpvbyiGHyAQIt1Emfbfw2
         3SNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sq5S938J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p123si15958455ybg.360.2020.06.23.00.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 00:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sq5S938J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jndGT-00016O-HP
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 03:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndFS-0007Vx-1k; Tue, 23 Jun 2020 03:21:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:32822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndFQ-0003Di-FO; Tue, 23 Jun 2020 03:21:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id l11so19369537wru.0;
 Tue, 23 Jun 2020 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PC262lDbsM+izIS4gIzIDS7tjH2mSBnNq8vbqL9Ixqk=;
 b=sq5S938JWBN4musCRKNxKfdYUuGua+ni9IENCVr5LybQAO5ZgDwqIU/cvZCpNfp7zp
 k8jDZNRmrinRak/Q7Y/sRhchZbZ5gtyUmz/TLAR4xgrT90Tj15anWZKUdLoR8IcuMgqp
 NCJZT9MHKptyvGv3GbfsE0TBN3r1vxRxenyLGp8is1jmFR5pPjEs6W3amUHogkv559YC
 Ch2PB+i1lpExV2Rq6W8VhZg+r5ormpCUAVPRJfMSMbMq0kR+Yzuu+e5cCDlkcT0EKmGK
 SZ1QBy3ooqlFYAgh9cHvC6tpg6Qu3WMKrWdVvCO2+ugBOHhWIPbl/lWw/XnsC54jD/BL
 wxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PC262lDbsM+izIS4gIzIDS7tjH2mSBnNq8vbqL9Ixqk=;
 b=RrbmvjyrfU6mmspBzA9QUIOCXRT5UJpCRAs+1Cqi990+mwc2hcokppEfZ4z8soDXPy
 eS7DZ9TEq47upqsaSyuE1F6ax+zTY7so/yHboX7dk5YsRqpQ5qydji4awEjPdfgurWb6
 oQtL0bneSlrzCGYdchC6S7NpCCplu2yL925n13PojjhWjiYkpMIto+51kauU7YBPxE2O
 CVj74LXPIHbqTdNLRKIgzFwVhf0FFcyrp7ib72aIKFdJaXe2qTUzSs61B2yQo8AJK7bU
 RArZHemAPWpBLK6gQz0BskfoSaBKb7DbvouqgCrfNbphW4J36F0aGieroCuO1MNXeylg
 jA8w==
X-Gm-Message-State: AOAM532mH0Xm1QhWT4FMwjA1ulvqo5ASFMMC2s22wUhvlHtZVaf5d8+Y
 ctnPssNYRNir6CbQcsKCyjIwB1PM
X-Received: by 2002:adf:f707:: with SMTP id r7mr11331412wrp.70.1592896893875; 
 Tue, 23 Jun 2020 00:21:33 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x13sm21877236wre.83.2020.06.23.00.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 00:21:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw/arm/aspeed: Improve QOM usage
Date: Tue, 23 Jun 2020 09:21:29 +0200
Message-Id: <20200623072132.2868-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7QskUjr9tAjH

Yet another cleanup.
Simplify aspeed machine QOM usage.

Since v1, addressed Cédric review comments:
- Rename AspeedBoardState -> AspeedMachineState

Philippe Mathieu-Daudé (3):
  hw/arm/aspeed: Remove extraneous MemoryRegion object owner
  hw/arm/aspeed: Rename AspeedBoardState as AspeedMachineState
  hw/arm/aspeed: QOM'ify AspeedMachineState

 include/hw/arm/aspeed.h | 12 +++---------
 hw/arm/aspeed.c         | 33 ++++++++++++++++++---------------
 2 files changed, 21 insertions(+), 24 deletions(-)

-- 
2.21.3

