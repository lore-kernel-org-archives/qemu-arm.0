Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4229866ejb;
        Mon, 6 Feb 2023 06:11:27 -0800 (PST)
X-Google-Smtp-Source: AK7set91AdQPfwL+0EYVf5zoSbJnqAAGIhBoBWYhxHWHUoQJe0khQo2lg8DSQQ6wj2NUgjx6l5jJ
X-Received: by 2002:a05:622a:1647:b0:3ba:18c2:99e7 with SMTP id y7-20020a05622a164700b003ba18c299e7mr13204533qtj.45.1675692686987;
        Mon, 06 Feb 2023 06:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675692686; cv=none;
        d=google.com; s=arc-20160816;
        b=fj+EKZbMnd7lQ8/Ae3xF6A+JyJmuSa3WExuUP6BZmt7r5nNHEtrBdYf874YRyaHK5Y
         9VKhQMc4vLT+ambs1QPjTQMiyrSlISCWpm6M8sQI9BS2nXt+2FQ23eDjjnfs+p1SkKXS
         imfwW6HlOcuGy5m+eBjliXNAFxATp50yocy7kULqUIc8+4J/pQL+mDUHzX51O6Xieg5Y
         r8I6Kv5GjR6cOvUii6blQlP5ubmE5bQzw3A026HzNfaZ6xekcc4UUiNWMFhQLNCWG00/
         AHbLD920liVzpVDCCSj+lnVCP3UovsdWYZ9t55p4abed/LKP1otbmy0beslhKOhnxdN7
         Zb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=6Sr6k0UBoZ4rpW7+N3yTty4+4axcyqsEsxFDoi5sJPA=;
        b=F2O07qSJBFY9KgCfpBLJwIu0amYe+nxjtGZjprYmXXPdhlfGl+aZvXndRdEJr987Rg
         l/zG9dxx3Rtgf6ZeEKZcPUIdY1yLhbAY12l7zmpFC9UWWju+RDThZ7tYGBlJoOiVzjUa
         w6SwePXDzsmIJP7EuqQfF8eD7Gv1AtlVoG+vZBWNBre6YMc1ruCXy8ip0VkG2QYMwTcl
         rMUEaZqQn/MnRW2fBblNEO0Kxei7MCZuQ0sJia7XFW9HeOeWcs35B+ESTCax4vCfxDf1
         pBGSJCk6Il5qNjohHqlM4f3YPRSUQFuF7eL0oW80f5eB3o1hoIpD8ebAQ0zQV1pf5aM9
         iRJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ybztKT7l;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192-20020a3704c9000000b0072602c36130si8957743qke.173.2023.02.06.06.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 06:11:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ybztKT7l;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP2D0-0006BS-EM; Mon, 06 Feb 2023 09:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Co-00067z-Rn; Mon, 06 Feb 2023 09:10:52 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cm-0002h2-Kj; Mon, 06 Feb 2023 09:10:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8DE9F6042A;
 Mon,  6 Feb 2023 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Sr6k0UBoZ4rpW7+N3yTty4+4axcyqsEsxFDoi5sJPA=;
 b=ybztKT7l+Ad1tS0evGb3xpqrJtygw25BQ5uIRjUOVXIYq9WtOQ1h2QFB22o5sZLQbksi+U
 LeF79aDl3dYj7ExKv8GQygQ+50RNKU6ypAVQvE8Q19jEMknXHiz5PQXiKmuNwfAwoIBHLC
 dcqQRzykVElC8EqVWK20mkj6vjCAuxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692646;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Sr6k0UBoZ4rpW7+N3yTty4+4axcyqsEsxFDoi5sJPA=;
 b=yaO9VE5O+slz20P51rLo020ziIBxUr47DNgE9g8wIhGvkpa+1Fq7ib2/aOLrasp0QMip1M
 muFIIIfQA4VFNhBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25F49138E7;
 Mon,  6 Feb 2023 14:10:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YAZTN2QK4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:44 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 09/10] hw/arm: Select e1000e for sbsa-ref machine
Date: Mon,  6 Feb 2023 11:08:08 -0300
Message-Id: <20230206140809.26028-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: fyUExzqKnRZx

This machine explicitly selects the e1000e network adapter if no other
option was given in the command line. Make sure e1000e is present in
the build.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 823f8b11f1..5022d519ea 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -233,6 +233,7 @@ config SBSA_REF
     select USB_EHCI_SYSBUS
     select WDT_SBSA
     select ARM_GICV3_TCG
+    select E1000E_PCI_EXPRESS
 
 config SABRELITE
     bool
-- 
2.35.3

