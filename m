Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3489905ejm;
        Tue, 25 Apr 2023 06:20:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350b+/92GP12rxwRa1DVseizJEGXVV9brAm4laOSesfUCPNaZ2+PPVn3zM4flH5F8+VAiKorG
X-Received: by 2002:a67:ff8f:0:b0:421:e607:bd4c with SMTP id v15-20020a67ff8f000000b00421e607bd4cmr7111889vsq.8.1682428855809;
        Tue, 25 Apr 2023 06:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682428855; cv=none;
        d=google.com; s=arc-20160816;
        b=vS8oeQeOnjqd0eKyVgPd32F/jAHcMHz6fv/kGO4lOBy5t8QKIXNHcCOPp4mCR5gplP
         Fylf+h2vwgmQQBGecp6WTqicdo+SXpSru/WhI5XK8QtibtEiG76aUcXbgoq4jdIVvUo9
         SEFbJfxz7b0v3iXVNuWCQNQvoNvI4qn3XRVj8tNWW6qDHq6HvvcUSYn0LrD8hkFs4EBP
         NbQC7RFUHlZ8n7Fpz1cIScMqvgHe53caKVP9zA8BwIT1I6gWYjH/xi9kBbU10AXyzHiH
         l/H2MV5p884LADIyPdtcvMu6aZZUCeGWhorYMOjVcoVt8LO7achKEIQ5BcA/3d0o24kW
         8yCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:message-id:subject:cc:from:to
         :dkim-signature:date;
        bh=yDy/hiWAID1GYWoKBo6HFKzKXnO8QdDKXNTIM7E1ej4=;
        b=c7bCgn7QE2X0PXgfZ7pPQkvbEwhylqvLOqHTctaHCLjH0vevbCVpjk9zrPSImoloVp
         Fbm1rIjMX+YqzkgegKQE4d9Wsc2sYT21yOmw08BCb6B/nyM4WI4nyENEXRwq4zSS0gAV
         kIV8nMwPApk5n4Tbe9RltiTjCWAL3rzlid1BopIWUp0U+aOKVGVBajmoJ+9I2RFzRp41
         t4nSzmuaRLDoRytsR38jzzLEvVkAZ5HCgb7i4ct7Gea7yYsf1QG9V3JPDlX76A6UQ661
         e/xJ1OwBBtXVPyQp3XfoGFoLxbB0evJo7aPhSbjChikG0iE08TkhVP+HIHisy3vXErHp
         +o8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@danielbertalan.dev header.s=protonmail header.b=HYR5gHtY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=danielbertalan.dev
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20-20020a67c314000000b0042603f626b5si2165532vsj.373.2023.04.25.06.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 06:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@danielbertalan.dev header.s=protonmail header.b=HYR5gHtY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=danielbertalan.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIYS-0000lb-5A; Tue, 25 Apr 2023 09:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dani@danielbertalan.dev>)
 id 1prG0Z-0004YD-7p
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:34:51 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dani@danielbertalan.dev>)
 id 1prG0T-00015H-7T
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:34:50 -0400
Date: Tue, 25 Apr 2023 10:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielbertalan.dev;
 s=protonmail; t=1682418877; x=1682678077;
 bh=yDy/hiWAID1GYWoKBo6HFKzKXnO8QdDKXNTIM7E1ej4=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=HYR5gHtYxMaG8Y30r4gvG4ZPDRGULkXZS+2HM9gAdz1iERl/Qp0+IWIUUzDoV7Mti
 IFbg/dD+TLq2cPfwicI8MsyuEuJK3qSOdGTivNm/y0To/3Y2mY7T5vWgHjJ8EULbKB
 eJcBvvy2X2Ph7NjOAHkPK5RMiZvpcoNRJMIprxWlc39f9vm4uxrfr6+LosmynVcA7W
 a5b+TEV4WjVHryIMO1c9ffhJfGTGwmuGDA1E3YiP2wMoFYYe+qetu4aiiK3GLCjzB0
 Tz2IxQKyVqBduCcSqOVOfol74BeJv3cV9PKMyPCeTp+Jdx+UI4WWKH4Ksh0fhfSWEo
 FANuFT2bzK4kw==
To: Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
From: Daniel Bertalan <dani@danielbertalan.dev>
Cc: Daniel Bertalan <dani@danielbertalan.dev>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/bcm2835_property: Implement "get command line" message
Message-ID: <20230425103250.56653-1-dani@danielbertalan.dev>
Feedback-ID: 20340505:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=188.165.51.139;
 envelope-from=dani@danielbertalan.dev; helo=mail-0301.mail-europe.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Apr 2023 09:16:31 -0400
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
X-TUID: uE3WTZQ7oKXl

This query copies the kernel command line into the message buffer. It
was previously stubbed out to return empty, this commit makes it reflect
the arguments specified with `-append`.

I observed the following peculiarities on my Pi 3B+:
- If the buffer is shorter than the string, the response header gives
  the full length, but no data is actually copied.
- No NUL terminator is added: even if the buffer is long enough to fit
  one, the buffer's original contents are preserved past the string's
  end.
- The VC firmware adds the following extra parameters beside the
  user-supplied ones (via /boot/cmdline.txt): `video`, `vc_mem.mem_base`
  and `vc_mem.mem_size`. This is currently not implemented in qemu.

Signed-off-by: Daniel Bertalan <dani@danielbertalan.dev>
---
 hw/arm/bcm2835_peripherals.c       | 2 ++
 hw/arm/bcm2836.c                   | 2 ++
 hw/arm/raspi.c                     | 2 ++
 hw/misc/bcm2835_property.c         | 7 ++++++-
 include/hw/misc/bcm2835_property.h | 1 +
 5 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 3c2a4160cd..0233038b95 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -90,6 +90,8 @@ static void bcm2835_peripherals_init(Object *obj)
                             TYPE_BCM2835_PROPERTY);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->property),
                               "board-rev");
+    object_property_add_alias(obj, "command-line", OBJECT(&s->property),
+                              "command-line");
=20
     object_property_add_const_link(OBJECT(&s->property), "fb",
                                    OBJECT(&s->fb));
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index f894338fc6..166dc896c0 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -55,6 +55,8 @@ static void bcm2836_init(Object *obj)
                             TYPE_BCM2835_PERIPHERALS);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
                               "board-rev");
+    object_property_add_alias(obj, "command-line", OBJECT(&s->peripherals)=
,
+                              "command-line");
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
                               "vcram-size");
 }
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 92d068d1f9..7b9221c924 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -280,6 +280,8 @@ static void raspi_machine_init(MachineState *machine)
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine-=
>ram));
     object_property_set_int(OBJECT(&s->soc), "board-rev", board_rev,
                             &error_abort);
+    object_property_set_str(OBJECT(&s->soc), "command-line",
+                            machine->kernel_cmdline, &error_abort);
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
=20
     /* Create and plug in the SD cards */
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 890ae7bae5..225bce2ba4 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -282,7 +282,11 @@ static void bcm2835_property_mbox_push(BCM2835Property=
State *s, uint32_t value)
             break;
=20
         case 0x00050001: /* Get command line */
-            resplen =3D 0;
+            resplen =3D strlen(s->command_line);
+            if (bufsize >=3D resplen)
+                address_space_write(&s->dma_as, value + 12,
+                                    MEMTXATTRS_UNSPECIFIED, s->command_lin=
e,
+                                    resplen);
             break;
=20
         default:
@@ -413,6 +417,7 @@ static void bcm2835_property_realize(DeviceState *dev, =
Error **errp)
=20
 static Property bcm2835_property_props[] =3D {
     DEFINE_PROP_UINT32("board-rev", BCM2835PropertyState, board_rev, 0),
+    DEFINE_PROP_STRING("command-line", BCM2835PropertyState, command_line)=
,
     DEFINE_PROP_END_OF_LIST()
 };
=20
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_p=
roperty.h
index 712b76b7a3..ba8896610c 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -30,6 +30,7 @@ struct BCM2835PropertyState {
     MACAddr macaddr;
     uint32_t board_rev;
     uint32_t addr;
+    char *command_line;
     bool pending;
 };
=20
--=20
2.40.0


