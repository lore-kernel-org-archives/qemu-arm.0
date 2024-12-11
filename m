Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3845231njb;
        Tue, 10 Dec 2024 22:32:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQmW+gt94xd54GOCYfHH+pxuu4ukDcjtHKmzQ+jNY5n1kv2jCTNTD3xaw8cTasu49IjY3J2nroc9lIDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFKGdRhpIKO7ShkvlpCY8fFXeX581RLffwf6iLefjf178BB7r1LE0ZSdqa3twF1NlYEPft9
X-Received: by 2002:a05:6214:2685:b0:6d4:257a:8e with SMTP id 6a1803df08f44-6d9348d32e6mr34953766d6.4.1733898775148;
        Tue, 10 Dec 2024 22:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898775; cv=none;
        d=google.com; s=arc-20240605;
        b=cPsQTStMECkAGKqW1/E1MVhaA3D6UKR/6zQx9S4iRpr8XmVDuGiteBkfoPPLyv/OcQ
         azXP9Ig8+9pv8m0wipdMJBgWxTrHefQ9oqe+MnVvla00sdN3kdn70HjkEFUCPGy6CB5Q
         zQ8KdInPWbT1EiPn+b0wE/MSrmFiQki/Y+76LEQwtEHHlVgyfQ0v3iM21IoOVq/bY4HZ
         Vz+1VCVciXTTWZjyxkVJwwxwie5EBaYhvpqAWRqzfRmDQ0HXFEwXYS0Hlk2ymf+JEczF
         sIvo0EK0nvDKvmSeBKrrOn+IDuDz3tBGcG++Olk7a862HNIJ3iyyjC91jMJNtH5tL3oB
         7TjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BVG+pTgiY9Yj04OwehIdCKjJJ/VUEKuJeIgvGBguH+U=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=dh9ksrcVYiedv/at4gevX5/GqocMB2PEeKUEfSWKatEB/dcIMlDDZuOo4gF+mSi0W2
         6BZJ6+/+TdJuA7l8ltJ9HJAPJjsdQA8NtSamf51jvKn0IfUm0mU2El4tkhFJoMvhz1nW
         8TrNtYE7+aVeFkDgN7XvYmWwFus7lTn8kv5w2P8UxbNXLBHEzLBtP2lAR62o25GzmSYx
         5PaVYXED2Er/5si6QD3u9HX9ZMYozyEqpGmNU8jo0KL6hH1ho4WclDkRtIks9YNxsvxm
         8znk9zaNCBYMJMVITk3q9SiVTd9NGWtN/u5acLXoTaQh+6kFYYR0ErrFTOnBvG+HPQzf
         SPUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PfysZQBg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8daa07d4asi172125146d6.274.2024.12.10.22.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:32:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PfysZQBg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLGFu-0004T6-LX; Wed, 11 Dec 2024 01:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGFj-0004OQ-76
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGFd-0008RG-O2
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVG+pTgiY9Yj04OwehIdCKjJJ/VUEKuJeIgvGBguH+U=;
 b=PfysZQBgDxyX3Sca3mJKPaHXlAHgLr9v9+diAI86FVsDv8JY91hOHFrAlxlvVmPEwItADD
 NAWEOeymAk4Caz+vEMd7DrQVPqE9rrw8mun82pmqyQc27jrSBkXrboTq0QbGlmEKlGAWP3
 pLGR5e8UIcHlrMSR++dlIC7tdE05flQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-zGdqX3n3NkusWMOXR0X94g-1; Wed,
 11 Dec 2024 01:31:09 -0500
X-MC-Unique: zGdqX3n3NkusWMOXR0X94g-1
X-Mimecast-MFC-AGG-ID: zGdqX3n3NkusWMOXR0X94g
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9C9D519560B7; Wed, 11 Dec 2024 06:31:08 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4CFE21956054; Wed, 11 Dec 2024 06:31:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 02/24] hw/sd/aspeed_sdhci: Fix coding style
Date: Wed, 11 Dec 2024 07:30:36 +0100
Message-ID: <20241211063058.1222038-3-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +2zMc8Kk4L/x

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20241204084453.610660-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/aspeed_sdhci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 98d5460905df..acd65382611c 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -87,10 +87,12 @@ static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
         sdhci->regs[TO_REG(addr)] = (uint32_t)val & ~ASPEED_SDHCI_INFO_RESET;
         break;
     case ASPEED_SDHCI_SDIO_140:
-        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg, 0, 32, val);
+        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg,
+                                            0, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_144:
-        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg, 32, 32, val);
+        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg,
+                                            32, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_148:
         sdhci->slots[0].maxcurr = deposit64(sdhci->slots[0].maxcurr,
-- 
2.47.1

