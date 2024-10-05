Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1162060njb;
        Sat, 5 Oct 2024 13:59:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXym+swjG+npDGC7sGfGVQTHua0e0SSjSrxLURywbW6UNWrjXweWjNPKntHLD3D5CSgWJOXdb//gEHOaw==@linaro.org
X-Google-Smtp-Source: AGHT+IEULPlAh4wOlzR12NTFuFyo8NW3yy4OCyuxAul0EMvyMF8RmArSKncxtzz9JMFj37yVktnq
X-Received: by 2002:a05:620a:4452:b0:7a6:68d1:7dfa with SMTP id af79cd13be357-7ae6f437000mr1112984785a.17.1728161945321;
        Sat, 05 Oct 2024 13:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728161945; cv=none;
        d=google.com; s=arc-20240605;
        b=OaKiJSR0Bxby/v3C1N12AFHTpvFjybD8B/B/L2fXrgMdCQ2J/BBFKNUDLkSXDLiPaP
         +v/QFhZ9x7bMErry9qdzwCwrc8XLAJaQ1IhHcyRNiEEr145rJtJeX4+ywsK9+oBxbTq0
         tBdysP7owMiFwEhPCkfxWY0yEk9U5gYYTui4od0tn7jCpfz1Yxm4QsilJiq7M5D+Ca6W
         v9nicYk6vT+I31/YploCVrVyqP5sSNcEoKZ8LKChA+6EBvID+9lEzZj8YYpSK7VuaQo3
         WmD70HsXYr9EdsdGT2J5RrysR9Ys3cS3Z6WamvRxAlkrmY3TSgR5/KFM5pU33F3o+u8y
         5SWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JgYpXgtbXLUe7lni8+U/LXo08TWpLW4e88SRJQEYyUI=;
        fh=wU1l73Q5jlzsTDMWng5XpHEgha3OeRC1rP+sq/GzOw0=;
        b=MdEZSOkwnEfXijhs8B8FLYz4xHN4XFQv1DaPsQe42pKfqVgyMtfhEPws0Bs6TjTnS4
         nUc2znNqEbBeW+Jwb/Mfik4wFBGNIL0vjdpB+faP7vNrHkZhTOyI+8IcpNmIzZXe6w3R
         EdGHvE+dTNWpWT9FgHTxrMKMemQ6p3e2sUWb+m+U5EyjQ+tsgHNv6qUKny/tEz7Vwuk/
         Tqw0mJOU3gQA9cJjcuvhZ+3h2aJu8fUaB8O+0Sky2lW4UrtmFC9xDOJPPNA5zVmhf8wB
         tpbarZ7XLeKYzaF3yH/YJv8eWneO7uQhhKp2yEvyyDpg9I3wxc6ryC5P/MvlvfuNTYVL
         hHFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlOSydc6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae756193d8si270568485a.15.2024.10.05.13.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2024 13:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlOSydc6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxBqr-0002kJ-RS; Sat, 05 Oct 2024 16:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1sxBqn-0002hm-6d; Sat, 05 Oct 2024 16:58:05 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1sxBql-0006n3-LN; Sat, 05 Oct 2024 16:58:04 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so435745066b.3; 
 Sat, 05 Oct 2024 13:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728161881; x=1728766681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgYpXgtbXLUe7lni8+U/LXo08TWpLW4e88SRJQEYyUI=;
 b=BlOSydc6wD3DOcyUGLDti8WcYVQt+66zXnBJPnxRef1VMqEQbWFoirWZKsZd24IK8k
 0InSj2j3qi0Miw+2iMjRFEXuTuPMkhBevzezWBN434NlsQ+FUTMFIYi9g/aHf1ye1JXQ
 MDeFV3+nfqYXu7XSW5FRR7XM6v5XxbE5zXVZJbafntb//8qP4WPu4mrpTOnamkN2g2zA
 bxQN9Ct09mKlQx2DD6hnbMWSs8iHst+AzPKNVaAG3TxLUNxAoVWliCIhsdR/qNw4WWkZ
 mkBZJKhG7uTkkG30KJdSiXzetR5HBldkMOHc+FjtnhVbhu5wmmhXU7yHnfxf9r6oU93v
 B7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728161881; x=1728766681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgYpXgtbXLUe7lni8+U/LXo08TWpLW4e88SRJQEYyUI=;
 b=p6E5IjtDhaJslwlam70W7ezPC1xKtuOGWXjwTcxIaWeh4zkIVp8ItuLGGQFNB9j1A4
 xU2VwfmJxYOjl1WgsoQ9Bg6EyBECAJDtHzF4wpdmaKvxR061nvWLGIRMOBZdfiXiNVFC
 U219htkBB8KlyskGQzlENeACtHV6r3y0cn8FRgldQJINZIipTEeLYDn4FkuyzjCjPu7T
 P34p3blTtX5Ziq8x9ZkrvunTpCtyJst6VuSQpYwr3K4Pbt1tD81DyW203evkxKnNNOlk
 6MRS0zLIXAdF/7k0cDM1auKgHp+7gNALWCXn9NRM4paE5bqdQwlGjNxfcdK45a64S5Or
 2QFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY9xGw736HckwI72FtWp+hqdculIcd+ou6xeLWwwb8kbvxyY/sjZpfUB+eMAWE28QR8phmvy16mg==@nongnu.org
X-Gm-Message-State: AOJu0YwGa2pFC48D7AJkisfDn6sAAckz/UFripkbWgj4Uuc+cqB47dvo
 w7WV0yFu6pNIgdhi4i5KPzYa/5uexeSMgbRyM7fJqMSZtIjmf/4MZWN7TA==
X-Received: by 2002:a17:907:3d94:b0:a99:3768:7501 with SMTP id
 a640c23a62f3a-a9937687755mr342299266b.51.1728161880922; 
 Sat, 05 Oct 2024 13:58:00 -0700 (PDT)
Received: from archlinux.. (pd95ed790.dip0.t-ipconnect.de. [217.94.215.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993f40d542sm105804966b.157.2024.10.05.13.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 13:58:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/4] hw/net/lan9118_phy: Add missing 100 mbps full duplex
 advertisement
Date: Sat,  5 Oct 2024 22:57:48 +0200
Message-ID: <20241005205748.29203-5-shentey@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241005205748.29203-1-shentey@gmail.com>
References: <20241005205748.29203-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 3Okl+pN6I9i8

The real device advertises this mode and the device model already advertises
100 mbps half duplex and 10 mbps full+half duplex. So advertise this mode to
make the model more realistic.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/net/lan9118_phy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/lan9118_phy.c b/hw/net/lan9118_phy.c
index 1c2f30c81a..4815a4da35 100644
--- a/hw/net/lan9118_phy.c
+++ b/hw/net/lan9118_phy.c
@@ -145,8 +145,8 @@ void lan9118_phy_write(Lan9118PhyState *s, int reg, uint32_t val)
         break;
     case MII_ANAR:
         s->advertise = (val & (MII_ANAR_RFAULT | MII_ANAR_PAUSE_ASYM |
-                               MII_ANAR_PAUSE | MII_ANAR_10FD | MII_ANAR_10 |
-                               MII_ANAR_SELECT))
+                               MII_ANAR_PAUSE | MII_ANAR_TXFD | MII_ANAR_10FD |
+                               MII_ANAR_10 | MII_ANAR_SELECT))
                      | MII_ANAR_TX;
         break;
     case 30: /* Interrupt mask */
-- 
2.46.2

