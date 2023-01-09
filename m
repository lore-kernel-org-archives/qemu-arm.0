Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2450541ejc;
        Mon, 9 Jan 2023 09:30:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvEXemHRFzQXfgbLW0hUWGP6qD21nxK483I1xHZ3rsBv1hqM7mt4CDhoBQOPPiQd+Fi6xvA
X-Received: by 2002:a05:6214:11a2:b0:532:351f:8a64 with SMTP id u2-20020a05621411a200b00532351f8a64mr1719613qvv.38.1673285410946;
        Mon, 09 Jan 2023 09:30:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285410; cv=none;
        d=google.com; s=arc-20160816;
        b=r1TXOqau6sybasxGgT63/tazJVuIp8Lu2NCFfa/rLFBFspOo0YI1fpwQN8O8oF+Alw
         OviLqMOVAAkpBlziuVXjVpe/33NwjZpsTES/pXz/GEP4b0ybVEeJMU66ynA4BHJKMBL9
         orNtuEE0jZ6KbmbqYzPQMeUbE+2F2UcaBylVFxmqnUtTwpRaQwX7W7NIRzZ6mT2tGNHX
         5H4t1bUBdTndcoovxW4AZEu2R3x98OL7Qf9VSaserRaBJc9RTJw75cU0f8lkZ1SGuI0A
         /f/BEzIJ4Idt5Y5ba6LQATMusDjqX1TQLGKJfv+Raa86jcSjxbWEPGARzuVdQAjqcBmb
         GQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b8AKo8XYZ7rGKrACNjXnGndSOAOE0j6XOYrIZ6N5FoA=;
        b=SlE9Zpm++uHvABy7an249d0hbSKgSQbWG/tOkHcBdimGq1+EmAYvcxZ2Eh14idlQSh
         u63VRHNebj7lTWr1gs04d+FL9AiLUD6Bkt65Gwts5V5qyTgY3F7qqBLUnoceeoHDwI9p
         d6jJWDp95kkvP1m3bFmIClAY57aN0BCqPvqdN9ENi166aDUn/koyPDloRxPbKKN45QCE
         SQn5va03mJxku2LkyVO2n5yMeEgocmIohSr2STQ+umjKnzw5BVQYqyWDrMVSxVv0sqXy
         Qqti/KMLZySLZ7l0cJu6X2Uohdl6IchYsIDMzwV6pGarJrDIfw8zzcTKHcvuLIb2ofN4
         LWcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=h8O6UJ0W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05621420c200b0053208c695edsi4696479qve.96.2023.01.09.09.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:30:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=h8O6UJ0W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuF-0003Do-Kp; Mon, 09 Jan 2023 12:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtY-0002f2-2B; Mon, 09 Jan 2023 12:25:12 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtW-0001Gq-F8; Mon, 09 Jan 2023 12:25:11 -0500
Received: by mail-ed1-x52c.google.com with SMTP id v6so13556021edd.6;
 Mon, 09 Jan 2023 09:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8AKo8XYZ7rGKrACNjXnGndSOAOE0j6XOYrIZ6N5FoA=;
 b=h8O6UJ0Wvkda1/AHtPtDBwk2/BYaXgzXL3Q1L1FjtB7Dv+9rmX5v7IR7XrdKjIqs5c
 fLeH9ywRZyB+LYV/7nd2uUje8oEIgNc3OdXOecLOqh98ORCOB4iRwGiEHBQjgD5dbY1N
 0alwECHjOJeurmTWpEQl7L+0GVZ53LUkQ/WyF6Xzl3h+07+ubboVoXa9wFRtNm17/Dr6
 Dp0ZbF1/0+YzAJusz+A4tjG7+0en/cq79RCEg7iIQPMIdAd4rXGAAerRCsxfC8KxzbZc
 WnfMBFdWEIKvObZgNhPZRBtXYKLsbWl55O1wUB7yY3MLwFcKwxvcUu6RZz3bFKu674BN
 iu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8AKo8XYZ7rGKrACNjXnGndSOAOE0j6XOYrIZ6N5FoA=;
 b=rsbizmyZD/yPgbfZS2BjDY9610oOnlG1GXQpObkPvNYhluAwZQOvYHrd9kdmafuIVS
 Ay+402A8zGlqgZz7sgX9RZFgimS4zBws9g5bSLn5bbEmNTr0R44J3D0MUuZsPFkQGE1m
 7DHSA69UPBoieht4ssL2Mevll4Cbjhepw88LnQFIgp9Ko8KM4Q6vodHxVchjoSR4Pw8h
 9yO9S/8Wz8rILmi+Tdl14YtP2T+FcvUMLpj+jfAIWfuLwAdK4GKk7SpSeYKY+lAE7WrH
 YQUySOtepLeO+3Y+NxZAYYECK3GFmYLuT4ZnuOhwjd7Nij5x5zGjbU6UA3SguVqFPG4M
 t59w==
X-Gm-Message-State: AFqh2kpOGxEldPVyXZYBJRJk4x4+83w8vt2SiXJA0jKMaREiXmS7vo4K
 78WAHQVKdjq7LzHYA84LwnVlcn0G4L4qNg==
X-Received: by 2002:aa7:d4d5:0:b0:493:1770:e87e with SMTP id
 t21-20020aa7d4d5000000b004931770e87emr13586404edr.9.1673285107372; 
 Mon, 09 Jan 2023 09:25:07 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:07 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 13/33] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 south bridge
Date: Mon,  9 Jan 2023 18:23:26 +0100
Message-Id: <20230109172347.1830-14-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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
X-TUID: AbH96dk7x7BG

The next patches will need to take advantage of it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-3-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a577ea2f4e..37afc01d30 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -235,7 +235,8 @@ static void pc_init1(MachineState *machine,
                                        : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.39.0

