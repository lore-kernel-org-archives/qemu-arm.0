Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1276860lfc;
        Mon, 9 Mar 2020 08:34:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuFYNIQfeJPOQjqqXFeGJ8RHrZfYjjKgPMLFq5mInUSfoDaskSKpnWSkRvh+0Bnw4VPdUKw
X-Received: by 2002:aed:2022:: with SMTP id 31mr14207538qta.321.1583768080734;
        Mon, 09 Mar 2020 08:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583768080; cv=none;
        d=google.com; s=arc-20160816;
        b=kEJnMbSgCaR0kW4K3u/+/Noa0eu4CpuzKRIYlMNmHjHyd3frsP3f/C0cEEBYzlTOYZ
         lfR+a8elyn1Stxc9bnE97ljov0jyoh3/5In4cxKvsEXxPXq7sOd8KXmPUcW8b6/vJt3K
         vLL/AA8xCQ+rwVB0Qeg7US4CpxN+XFrk0gnw+gyebToGbmtYlAYptozpjNJiH1vtwGtQ
         nWNyBM5BI4Cee8NoW97/N+hhY2lpodiW1zH64/XEgzAmduXshv0ijc5907oHVXEew8De
         c3Sq5fNuGeFtGcHG52J3LZelp0pUqBNO6+zWdAu9DApp93ouKCSvMA9JtYf15AVahZIJ
         HaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9WB+H8pzw1b5Pm8fm0c29AcCB+7Syqlo+cpscl0YNKw=;
        b=FrmW4eqUcEffYcOgUXlwtR17ji8TLNqonjxFHW4+1VYrqPqWC7+qQNRJ5sKsszljMF
         1vxDZsmCNnY7sTgPXB/JBbXv09jWWaqPCCSOnyKO8w5zc74Hy9+BuNY9PacAxHZupbDe
         nLAn0rG+XlYI4/J5oLYcNSv2N2UEa2hGZ0e8OPaPgR1P/mM2bBnq4egNSul7a8IzSXwg
         WJC5IzyfNfIhIvHOh1y+SnSUP21KiGkOE/3WitlchvktmOaJhQL1Zw6n3ypOsHG24eaL
         mO9ZRxSQ+bWnbYZHEwqfI0NYR7oECwuCXqxXIlFTodxBKyQg9odgi5WQvApG/FjzRJA0
         DW3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si1840507qtt.369.2020.03.09.08.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKQS-0001ju-1f
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3X-00019l-Ex
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3W-00005E-9Y
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:59 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:57057)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3H-0008M0-1F; Mon, 09 Mar 2020 11:10:43 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MwQKp-1jSA6N3Q1t-00sMOB; Mon, 09 Mar 2020 16:09:59 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] display/exynos4210_fimd: Remove redundant statement in
 exynos4210_fimd_update()
Date: Mon,  9 Mar 2020 16:08:36 +0100
Message-Id: <20200309150837.3193387-33-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vnjbFk+4XeEO6Y7jzUGToROLl3IXCk9V3Q5V/w1bgIDJkoBbJUq
 Rt0UUGtbZQ9WFlsz9dJscI+gw//SWSi9MfbBkqjjXKYpyN0yeYDgQa0RXsS1YWnRVRctQHr
 8Zoo+VCnvsd8plirugAetWJF6BpPX+FDPAB0sPsKc7ItAAdMWEb/R/RHixvLLe3SoAedMN3
 5trKziwslXaWxH1wEVdZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PVN/VKUgigo=:FhbXvK/Xvtl+yIGhXW2hn/
 P2HCxe6JY1samg9teh4w1/0xqyRec41DWzYWFe/K4ij3wWtUBemc0JfvtHYVGPuWYlT48H3Vi
 8qNNchT3iOWYHS6BnXTZcLysjs5cvKjmQPfNt143SaG5CLPhAmf52SLT26YUxrfjWNiGOJuVx
 k1skcHA4l8jTUcZNgR1v9TCm+uwDlkjYZM3Z6gIrzFTeCsI4+8iI6WKibm9VfGXX1wokHZxkS
 CBp6avvIci1O7W5063i84wbe9ZNgFswO3vtGBm3sUox12292pJglT4kDnjZIoIbsyDP94brSf
 LcqZKKwyiRnezy6O0G9fgA8iqR5OdZHgpPR2ab0aHJ+e+1IqqWkXNVHKD79MiV/SUjJo7Jx5F
 vMUccIiHeFx+tMAA/49HUev95X5LO3xjpvxkfNyLms5GsLse4kckQ/fsVwQS7X9HJ8YqO5BYl
 WbWQpJU9ChtZU0G7UZDfKexxFIDKkxavPEQgHhvH8vgntSm3J+NiTkqGPEeJCn0GDi8q2qCW7
 ysrMJQUdYhH+k2evorDPHrs8qH6wMdKPDaPwHKw8fR7EAaUY7BGcIvwFVO9hyuY5zASkddG0+
 p67nOAEI0/aeqo2qkQqCPA022zwKQjWojO5CEmi0MQOURQG/QMcZUSq/1eyzQ/sgjUEm8/5AV
 XMBwZ0SwuWYAzD3qIjp43D1bz35Fd2HPJw8SGlEC/6OHyscKZ3iZIWM14a+p/fKNbyq2Ls5+J
 YVvARaG6BkQmE/Jm93qb+TUk6nrdjJV+31bIIXw8AD09Tx/AaSdizSp997Bg/HBol6/3QgEMF
 YJYWBL1UGqfMZVVfEGqfx4CS0OulIbE2TPRBvOmcrVPppAO6KbEDTl/YjdA6XfDe9taftKo
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Euler Robot <euler.robot@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7IGlR2yt7+LB

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/display/exynos4210_fimd.c:1313:17: warning: Value stored to 'is_dirty' is never read
                is_dirty = false;

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200302130715.29440-9-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/exynos4210_fimd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index ec6776680e41..1c0266ce9f2d 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1311,7 +1311,6 @@ static void exynos4210_fimd_update(void *opaque)
                 }
                 host_fb_addr += inc_size;
                 fb_line_addr += inc_size;
-                is_dirty = false;
             }
             g_free(snap);
             blend = true;
-- 
2.24.1

