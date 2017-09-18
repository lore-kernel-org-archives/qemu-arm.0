Received: by 10.223.172.38 with SMTP id v35csp4137128wrc;
        Mon, 18 Sep 2017 12:51:48 -0700 (PDT)
X-Received: by 10.200.51.211 with SMTP id d19mr41399703qtb.227.1505764308497;
        Mon, 18 Sep 2017 12:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764308; cv=none;
        d=google.com; s=arc-20160816;
        b=C1fxIBq8RpInZT4CsupoSr5Sdbyhs/cySWOlMSdqxBMhfcV0lmFbCyuJ1piBF9Rz6j
         SzgEa2j29BYKe5Gc7YdsfwFPGj6eLzUEMBX7j+YFzsQS7TflqHwMF9J59OGZVa+ztm5h
         AxvOzhDeqdmImESAuatc17BWxW0rdyhP1KqAbp9u757XPQpL54sPzNR0mF4sj2h+x9by
         0im9wARMgMGUi/Lemx/cwQtbX4/d1oW9eDljWSSJkUlniSjaciB5KJBiFTf6DuVbyR9F
         zroGb2340dnnleFA/oyIs9Y4yXR7pCA60cePI+S5XCbIFUD2apNTGMtlZLFoLPfO9cZv
         71Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=PPFJJFGlz6LRNHc5NYzxKFNjJDNoIVP9JQBS0o4H3QE=;
        b=bWVWnzgWeNkJsTfvyKnlhSqsAw5dBrlcNzxL6JYN9MpIKgCjbg2nL9PfwIzZKpaheQ
         +69VZ/EAQozRrtT2U4mh5RJIGrHkVTHT/Oud6rGNcl7nB3B5k4srsycOuZtzeLis1Bpp
         a9mlP0DaQcltZbYUSlmXRjxKXZbVRPqje7p+Ff69KKLsIiMxZhvU8ye6rqE93OBRAdJz
         sRCM3lm+BIkYP9kUaEJD4fBeLiAoHPhbVjIUWTNm7oi6B3aaaWF+kUGUcR4F/uslJRYG
         AwdhNT2NiVBDoPg7DTrGeQja15XYBfQQM0lWZ1dWjTerrdYu0iLX5ieHJ7mL/dMD6ptG
         s7xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lITy7IME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v127si5667560qkc.406.2017.09.18.12.51.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:51:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lITy7IME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du254-0006lO-6B
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24o-0006jz-Sn
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24m-0006Eh-4B
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:30 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24l-0006E4-Us; Mon, 18 Sep 2017 15:51:28 -0400
Received: by mail-pg0-x242.google.com with SMTP id v5so767411pgn.4;
	Mon, 18 Sep 2017 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PPFJJFGlz6LRNHc5NYzxKFNjJDNoIVP9JQBS0o4H3QE=;
	b=lITy7IMEvHkQjyM34xV2lrEPZ1FRqo2tqMg3i7lTkeyK7W6V8OyXI8YBMzD9Y6I22m
	uTd+l3io7YD6OH652Z0SKvXRflsByIAzAk3eEsmcogB7rYZPy6j9OL0ExzGW319LDl9L
	R/DyiKLx7aKbOgzOlMAmkcqvVFXKUPO7R1l5nCb9QhZ3+3F70clfklV2mR2N8EXMJles
	givaXJ/03UBUKTRUdnH9qooFu2WLOnm9TIewMQE4F38EJd2HxoATPBYk/lD5nnkDVi0R
	ReqS2dBlB62cR7bp913gFUZyXODhBC1545ndtZkIK2OuQ7tzP13S5BDOLRRHPf9q+Wrs
	kC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PPFJJFGlz6LRNHc5NYzxKFNjJDNoIVP9JQBS0o4H3QE=;
	b=p6MhJ3AVTBmF1eOHLfPzjMw+L6BKI8i8Fa6+gcUXghJe5AtnftqJQGDmm2e5A+yJZC
	Ayy2l21QDtvRLDeTEJlvNb9xRylcw4WRdydqBi+rutaX/w4ssv7ccQSL3GShqX25D00m
	0R01cSxRwYOH5iFQdPnFU654B2z3kbxq+nwDRXYvo+EBETVMPlpqlv53FqeHQZcRZcPG
	261YNpY6Q8Fe+NpvjPF3uSV2RvTLvl8dQHZvDBWXwmuPdr4hy5aPianB822J/nR1I2bI
	9Imb7t9fl+W56iakgpTciLBMnEa7HxzQxBBSNys4I5c/edYazAn2AaECOmGrJpRizuMI
	R0Gg==
X-Gm-Message-State: AHPjjUi+G511n7QZPihgjqHRGW9XAoD8BMhzUxaS8RTITH7GhKJPRIuh
	4BAA6H6lrcb1nPdNovg=
X-Google-Smtp-Source: AOwi7QBnlrdV2dAjPJ5o6XU0B1ZZT9VKBl9Vuwn1QtXL8E3m1hY6XRJ/FKEnoE1O67FGru4a6K14rw==
X-Received: by 10.84.211.36 with SMTP id b33mr24405445pli.47.1505764285554;
	Mon, 18 Sep 2017 12:51:25 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:25 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:44 -0700
Message-Id: <20170918195100.17593-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 01/17] imx_fec: Do not link to netdev
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FGsUu+brBiEx

Binding to a particular netdev doesn't seem to belong to this layer
and should probably be done as a part of board or SoC specific code.

Convert all of the users of this IP block to use
qdev_set_nic_properties() instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/arm/fsl-imx6.c | 1 +
 hw/net/imx_fec.c  | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 26fd214004..2ed7146c52 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -385,6 +385,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                             spi_table[i].irq));
     }
 
+    qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
     object_property_set_bool(OBJECT(&s->eth), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 90e6ee35ba..88b4b049d7 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1171,8 +1171,6 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
-    s->conf.peers.ncs[0] = nd_table[0].netdev;
-
     s->nic = qemu_new_nic(&imx_eth_net_info, &s->conf,
                           object_get_typename(OBJECT(dev)),
                           DEVICE(dev)->id, s);
-- 
2.13.5

