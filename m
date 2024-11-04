Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2002216njc;
        Mon, 4 Nov 2024 02:16:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4xJjb1o7wA83AcgY3HzYD3BuKfTEhJIxucONnV8QGg3X7ecqTuCkNF64GyRgdhxaVBBoS1OvjCL5DDw==@linaro.org
X-Google-Smtp-Source: AGHT+IHC5wJ8bvMbEWTBzNAGq3ExQ05WUEQ0/vmP94/zC73KOXhZhSXJAm+/d+WzE3Y0j0fRXeWm
X-Received: by 2002:a05:6102:6d6:b0:4a4:8b67:4f73 with SMTP id ada2fe7eead31-4a8cfb49d5cmr29125020137.7.1730715395337;
        Mon, 04 Nov 2024 02:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715395; cv=none;
        d=google.com; s=arc-20240605;
        b=cHC2AVvLok7kiKhjT6tk9rVYROr+q7U6xlh3DPExIH0DgkWksTSc+IOjmwsX6yGT4w
         Njf5BBnYYUIWWNWlZuPi8Dl/10vSwzntBK9lm5gPQXGK1JiMJv56NGoF1pt6ih7BWNUo
         gR7tDvABZe4Id1NjeMjNI7wFlV+gGCRGKYoUCInftOgLWHP3zBBxWau7HBqBp9PNkHBP
         rgviyO2IznA7ZPlyni+27RAWy7Hmu0b7E6I+XtOQLSLrWcAZCeiVdAazDlaWldBeljgn
         +LZr15BR84p5JvnO8afW6GszHjwcAb0XnL6HIj+MJYwmTkwjZK08gVTqYIgzAfDs3bJQ
         209Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+N0l3/VFbJLlzTSBf3h/Tyd7n9TFYqg74WR1kiyhgZg=;
        fh=EVHcNKdNc4g1MQSNqN+hQlWriKhBggmLPv/jonv8svE=;
        b=bn3JKIvJqbzgyDm1FVZYiZ7863ew6KdgRx4K5O540u/Y5AcXJYT/ExhdkIPgP+AecO
         q0XAn/DEeWkorUKxwmZBPLSPnqDLJ2D6X+RSmcgysFufW5Ng+6avs9IiLtS1fJmSNxJG
         /kvGpi8b4OezwJ1aZ/Rof9TbzS1QLzohdlOFobTbU8aOpzacqosxXaILO+4kPV9EvKmi
         WOQOjWdNQ57T8e140pJ0YeW780QLpz1p7xLM5aW1i1Wsz4b2QXuzfzYJcTsE/c2mPWux
         vHfOnIZcd4IN/54TSSwTQa3R7jmoifOOK9GhwltNrAamw48u5p1XteQTBPvWTl2fw9b7
         oD5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GdyIlo4J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1fa86csi114717331cf.528.2024.11.04.02.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:16:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GdyIlo4J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7u7J-0000hs-On; Mon, 04 Nov 2024 05:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7B-0000gq-Ub
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:15:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7A-0006Ww-FJ
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730715315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+N0l3/VFbJLlzTSBf3h/Tyd7n9TFYqg74WR1kiyhgZg=;
 b=GdyIlo4JUv1vkkMtVW+vKd65p9CitdxVqbFirOPkbuLFobAMLV8Wct2XjiNz04Mo8xDIX4
 t7ThAkaK1edImK/jqN4W2lhFPj8ad9mOChosfS7z8bW+ap112+6G4T9WAyCJshnWYzKAd5
 SxgUprLRfG56VU1kDvBGk61xVPSn/w0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-394-Um-2wqQKMH6DvfkVAta5Gw-1; Mon,
 04 Nov 2024 05:15:11 -0500
X-MC-Unique: Um-2wqQKMH6DvfkVAta5Gw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 858281944EAC; Mon,  4 Nov 2024 10:15:08 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.67])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 74E941956052; Mon,  4 Nov 2024 10:15:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Patrick Leis <venture@google.com>, Hao Wu <wuhaotsh@google.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/10] hw/arm: enable at24c with aspeed
Date: Mon,  4 Nov 2024 11:14:52 +0100
Message-ID: <20241104101501.2487001-2-clg@redhat.com>
In-Reply-To: <20241104101501.2487001-1-clg@redhat.com>
References: <20241104101501.2487001-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +thzaLtbFnm3

From: Patrick Leis <venture@google.com>

Enable AT24C with ASPEED in the KConfig because the boards build this
device.

Signed-off-by: Patrick Leis <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e7fd9338d11d..1b25e73578e7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -539,6 +539,7 @@ config ASPEED_SOC
     select PMBUS
     select MAX31785
     select FSI_APB2OPB_ASPEED
+    select AT24C
 
 config MPS2
     bool
-- 
2.47.0

