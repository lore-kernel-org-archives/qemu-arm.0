Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1071326njc;
        Sat, 2 Nov 2024 05:58:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXkP4dDHmZqEF7AJzgFIcls3xgczTW+acR5vNM9c8AhhyaQTQTpkc/84iQB9N82zSYU1OkwHTyzAW19g==@linaro.org
X-Google-Smtp-Source: AGHT+IEivriiQFkNiHM7mUouIf/cK3Yn6YZDB8WZCt7N1RZopYgcguU2ckHl6ZMS4B4hGO0y0Bqx
X-Received: by 2002:a05:620a:4086:b0:7b1:1524:53fb with SMTP id af79cd13be357-7b2fb950d03mr908553585a.2.1730552284154;
        Sat, 02 Nov 2024 05:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730552284; cv=none;
        d=google.com; s=arc-20240605;
        b=XnFfzxPj2Mw5oHXSSbnffwgJ9yCMtMEGBZaZLa37abEvdm1/X1enrmdFkLGpxn06kS
         j+xgiaG9L19CO7rCjpMu/f5+GQ9GQcXMDuCat8C5zS23rWSIGjJKleOt9+OrQOvoCXxM
         qCQlKAGDG0VAXbYLvbibM+64QnEFMy43c3odTv5NSP2WX0NI3BSkokNtnRYDej+lmJnr
         s/TlfKKYblzgQDmq0332IawNg+aIInH9kxNhEZTPPqltvl4oI7jwfGL8mOQJ0MB+PpBB
         6rmXO9weQjsRExziW2dxg8H+zQi0cBf6Yw9Ys7Ac0Ath+QLSVtXknFwxK+kpOSqAGfKn
         mkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RofW2EIjov9NM+DmNgmgHQcOhXHENpAoqGCKcsDoaPk=;
        fh=y64UBN//Gnu30Lse+C7+MSSGJ9c9WGk8SHJOBCYxkkY=;
        b=gZUfGXY2yq31NFKIoDiMSnjGfu5H+LbUZnjh8Md9/AVo02TqLY50ThmJ/b5FHIJsJX
         rhBEFUsQ8V8Erm1EhPXd7aFiQj0XMp+UsZ5VCInMX8vmCI48SAYW2DZb9zy17RSn78Su
         qTc9/OmHyYhsIqCBMCbKH+J4JDqhmMyTWoK/zB60aMl3wUg0eSbjcrLGCpgtv2MhZ2H5
         lrYH0qlUgFJ/IdrOVRTlMlZukR9c/SPaylu0RcNDam1TUSsnE53yWH7qMg0yIM61yjAp
         Bq2X/o7RUr0/VTFYgDQhwF4t4TR6kkY1ItX5JMO1sXZDv2LninYhUkzO993PKc8aW3bR
         R2cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQntati3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a81a32si661075585a.294.2024.11.02.05.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2024 05:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQntati3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7DhK-0004Kn-1A; Sat, 02 Nov 2024 08:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7DhE-0004Jq-CV; Sat, 02 Nov 2024 08:57:40 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7DhC-0003Wg-EQ; Sat, 02 Nov 2024 08:57:40 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso377488466b.3; 
 Sat, 02 Nov 2024 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730552256; x=1731157056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RofW2EIjov9NM+DmNgmgHQcOhXHENpAoqGCKcsDoaPk=;
 b=XQntati3nOx2bcielvksFNuRW41mcpvjcgR3/8XvPB2uwJ+dxZ7hvIZiObB9JzhRWU
 O7PR31zyalhLhLO1A4yB3tzMS3v56hgAgcZ5PYZR7toYHnTc0imFmDxmiJ9t9EHf46ij
 keeFHy4FozczopQ1Z3DFtxE/WXTZy14YoiRvMxERqAmAcxignMsFbdySXdg2gm+NnGuS
 Hm/+qjsYgYLMCqz+2atPRvHEcDvm7nsbxiyH8g/MXEpUAz5yrnk49uDr8fDu42Ll9TZT
 B2PdaPhLO+q7U5UMwq8yA9OUV2JsGI3Wx37BTkWV0F+yiq9zAvlkz1vyJAWu0s0P7qQj
 VTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730552256; x=1731157056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RofW2EIjov9NM+DmNgmgHQcOhXHENpAoqGCKcsDoaPk=;
 b=oqQiCpg4csBaNhROaGnJJbzUyNj/DeE3NuvNJFm0V/SX5hmPBmFjIO+zUzsoItfWQM
 VCIqJFvxkh2IKcCpIEr7TeAjYeBctqSd1+/xkCTe+NbXGrBIIo4c0g84AWzJnqIHkLf9
 qAlqp6MDRAjmqY3uFD3ATl8VxOEaME/RwkPyeedC6MR422nAl70llz5Us27rlv6x4Cfq
 g+GhdMA0BpGkzj56zZsSq/J9i0od+z4W+o5dX0qCLlo2D/VpBXtfvuP7IUr+jC3wx762
 ESMgHW56XLyA37hAymdxl+E/683jiTexucQbOW/ylPTVV/07paeanYLEHMzlnVie/aBe
 NQPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU151vSuMJUKWH2E8Od/z4YUF+TOUXPuTJnSmPVomP7LUtTSvnS2fpuh4MTBdWVJxozbyEfxKfSBA==@nongnu.org
X-Gm-Message-State: AOJu0Yz5dJMKclD3imSOUuT4aZLouY307eXfy95aU7O8UQR4rMOpzShc
 PFS0iQal/0KohMnKDK3cb501/zJJdYQtlWjV2n7jfdybcMCsT2OH6ZA08Q==
X-Received: by 2002:a17:906:6a28:b0:a9a:e9c:1d8d with SMTP id
 a640c23a62f3a-a9de5ed2633mr2508064766b.17.1730552255369; 
 Sat, 02 Nov 2024 05:57:35 -0700 (PDT)
Received: from archlinux.. (pd9ed7f6d.dip0.t-ipconnect.de. [217.237.127.109])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e566846a7sm305836666b.206.2024.11.02.05.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 05:57:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/5] Consolidate lan9118 phy implementations
Date: Sat,  2 Nov 2024 13:57:19 +0100
Message-ID: <20241102125724.532843-1-shentey@gmail.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DmjqtMm69Icb

hw/net/imx_fec and hw/net/lan9118 implement the same Ethernet PHY with simi=
lar=0D
but not quite the same code. This series consolidates the implementations i=
nto=0D
one to fix code duplication. It then continues to make the code more readab=
le by=0D
reusing some existing constants.=0D
=0D
Having a dedicated module for the PHY allows it to be reused in even furthe=
r=0D
device models.=0D
=0D
Testing done:=0D
* Run my usual sabrelite load and verify that network works.=0D
* Build and run Buildroot's qemu_arm_vexpress_defconfig which includes lan9=
118=0D
  and check on serial console that IP address gets assigned.=0D
=0D
v3:=0D
* Don't add SOFT reset, use device-specific method instead (Peter)=0D
* Reuse MII constants for MII_ANLPAR register which was previously missed=0D
* Fix off-by-one error in MII_ANLPAR register which prevented MII constants=
 to=0D
  be reused=0D
=0D
v2:=0D
* QOM'ify + mention boards whose migratability will be broken (Peter)=0D
=0D
Bernhard Beschow (5):=0D
  hw/net/lan9118: Extract lan9118_phy=0D
  hw/net/lan9118_phy: Reuse in imx_fec and consolidate implementations=0D
  hw/net/lan9118_phy: Fix off-by-one error in MII_ANLPAR register=0D
  hw/net/lan9118_phy: Reuse MII constants=0D
  hw/net/lan9118_phy: Add missing 100 mbps full duplex advertisement=0D
=0D
 include/hw/net/imx_fec.h     |   9 +-=0D
 include/hw/net/lan9118_phy.h |  37 ++++++=0D
 include/hw/net/mii.h         |   6 +=0D
 hw/net/imx_fec.c             | 146 +++--------------------=0D
 hw/net/lan9118.c             | 137 ++++-----------------=0D
 hw/net/lan9118_phy.c         | 222 +++++++++++++++++++++++++++++++++++=0D
 hw/net/Kconfig               |   5 +=0D
 hw/net/meson.build           |   1 +=0D
 hw/net/trace-events          |  10 +-=0D
 9 files changed, 318 insertions(+), 255 deletions(-)=0D
 create mode 100644 include/hw/net/lan9118_phy.h=0D
 create mode 100644 hw/net/lan9118_phy.c=0D
=0D
-- =0D
2.47.0=0D
=0D
