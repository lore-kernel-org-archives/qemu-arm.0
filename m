Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp413740ejc;
        Wed, 10 Apr 2024 09:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCBX9C4AW1Gt7tTgez8N+Ae5NwKmbIxRojFQZUNB7s7A8UHklDcBwx23ghOLH/z5nYSJB20hV1kPSh76TgfvlVtAiU0+UZ
X-Google-Smtp-Source: AGHT+IFCRQnUB08YNDy0Jn621k+zKGVGcza0zYHcegfYBOuFiHBGL5uSlINf/mXT3yrwdu6/wD1z
X-Received: by 2002:a05:620a:b41:b0:78d:77f8:e94e with SMTP id x1-20020a05620a0b4100b0078d77f8e94emr2724421qkg.59.1712765261865;
        Wed, 10 Apr 2024 09:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712765261; cv=none;
        d=google.com; s=arc-20160816;
        b=yc6LrcYqkspFFBvT/mUDX/df4/eVYOEQjBjKhDdjZWI+ERQVKaMdTAayeNH82B1O4r
         FrDJ5/rLu+GeTJ2qfHiGaODMQ9PLks/3bCgb/vyGnxWNHXnMtxlIFkZoZz/SwiriChIg
         V2UNbQwYBrNaD7th9lMxzvi2D/l6MGSZExZofaiduCqlhuCSbMr1EByouW2incURGe38
         dZWMag+TdtjF6b8466c4fsCLr1Qg5OGhLzJ/4PJsY3ljBFH8cNXRBovkM5A5PVnGVkaS
         TvH9r51Rx/Um9K5B+sf5yo+GN7xdL+EqCwf/pv1mFfwZy9dX6r1pvxClf4sx3gl97k4l
         H5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LDZo3IQYGRSUjwFMJgZFbdPKp1+CCXvSyhVLfSqq00c=;
        fh=E2Hi9dE2NUV5H+/33mf/+b236dvJczf2eqdigiqq65g=;
        b=sP9hNr27gUrg5/30SDs/qBNiUH0qgpjZpda8pH94gTwTrDIuEPYKlEFbw8sN1QYMr7
         tVyGNR/3Pm4LEomg1MlG+YZbi1hrU2pI28CyjEimeamioFMCEQ8skMSurSzsZaG6BFwH
         ySAM3TAyUMa8xoXULO3CPCDs0dJ2jPQWSTdwP6ZditzXbNyQxuJOjviENgOzKeJog1Uv
         rHMAA6X7Y2aSpKiG59QerJmXWnWnuG59AmSd2FgXtIY5DmZl2xM/ncEcujlT+VW3U/zW
         qB1K9Ux8GwVChgS1tva6N7T1qOqqbz435Dsjs5eCM099CUoBzLZTn0clePmjBBQQGZf3
         Rnvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GVIQLZUf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a05620a0b4900b0078d3a8286ebsi12231532qkg.151.2024.04.10.09.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 09:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GVIQLZUf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ruaTM-0000I3-I5; Wed, 10 Apr 2024 12:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaT9-0000BT-I1
 for qemu-devel@nongnu.org; Wed, 10 Apr 2024 12:06:41 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaT4-0002c1-Cj
 for qemu-devel@nongnu.org; Wed, 10 Apr 2024 12:06:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso9181186a12.2
 for <qemu-devel@nongnu.org>; Wed, 10 Apr 2024 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712765189; x=1713369989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDZo3IQYGRSUjwFMJgZFbdPKp1+CCXvSyhVLfSqq00c=;
 b=GVIQLZUfYb5YWk3EaBhzF41rlxWxBYtLa3btodEuOi8AnkW33w6CWn9t0kCSe3WwPI
 byC6IHn6hHHuJJXxhSsJZQsgJcPUDaafqUdPd+5SGZYZj4w7n3Une4Ji4XVLJgcJRo5J
 i/zJI1eh9GE1RoYLzGvz3Xg/uumKUZMGPJHecZdOi29L7C36VJG9Sa85i7PEEngRfaF4
 s+SmuQzmteLVH122xlFEfz5c/TWIAGKss2yXCagKVrTkqqMDMjPQRNz85D05sQxBLIpv
 FUlObDXf06wavEINCpNICd/SE0Gi/4t5w8F4B53op5ZRl1jTqFqrpSq/6/0TgWp2AFKp
 ddRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712765189; x=1713369989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDZo3IQYGRSUjwFMJgZFbdPKp1+CCXvSyhVLfSqq00c=;
 b=nv9eRjtGqmZi3HFszgfLOU8QLGHIdELvFpgQ1LLxv8ZSTdFOSHi//K1B5LXzc0MSmB
 5/gwqPQ698t3VVlavebfsMxBh7Xvs8+sejkJE1qDuSBitsHckcQq1/hn/kaKPV/tjYGs
 LLASWIooqvCjKgW+2oWAmLbrFD9JQzcQ9H8WImn9kaIrLLyHVfNrVCEqadd/8xeXAd8V
 sbXv2Uq/j1YSnSVHc+U6OBP2eLRddxVszoSbj3dVZ0UyaVd6O6bRzaOh/kutT2OaXUbS
 VnDgejaJ6lOH/aVNTrDGui7cXfETvIKO7Rc+OWmvHOiMk0+mmKGEFcgF9EKP/pcWKjZk
 e0Rw==
X-Gm-Message-State: AOJu0Yy6ldc/bHQd810A+aQjbK382b2R+OVYrCbSCZr673BN3FC3IRfj
 hQPI1svisDuD6xvy6qW3dj2hXU82dogkF6GFUkPmWn81UvwtVpirW89xA8SJTOl4nuNtQ2UfpAj
 3
X-Received: by 2002:a50:bb07:0:b0:566:47ee:b8b4 with SMTP id
 y7-20020a50bb07000000b0056647eeb8b4mr1995538ede.17.1712765189165; 
 Wed, 10 Apr 2024 09:06:29 -0700 (PDT)
Received: from m1x-phil.lan (arl95-h02-176-184-34-173.dsl.sta.abo.bbox.fr.
 [176.184.34.173]) by smtp.gmail.com with ESMTPSA id
 by15-20020a0564021b0f00b0056e591bb644sm4078733edb.45.2024.04.10.09.06.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Apr 2024 09:06:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 02/12] hw/vfio/pci: Replace sprintf() by g_strdup_printf()
Date: Wed, 10 Apr 2024 18:06:03 +0200
Message-ID: <20240410160614.90627-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240410160614.90627-1-philmd@linaro.org>
References: <20240410160614.90627-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: VgiPTs2h0kxG

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use g_strdup_printf()
instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 64780d1b79..cc3cc89122 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2442,10 +2442,9 @@ void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 
 bool vfio_pci_host_match(PCIHostDeviceAddress *addr, const char *name)
 {
-    char tmp[13];
-
-    sprintf(tmp, "%04x:%02x:%02x.%1x", addr->domain,
-            addr->bus, addr->slot, addr->function);
+    g_autofree char *tmp = g_strdup_printf("%04x:%02x:%02x.%1x",
+                                           addr->domain, addr->bus,
+                                           addr->slot, addr->function);
 
     return (strcmp(tmp, name) == 0);
 }
-- 
2.41.0

