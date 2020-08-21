Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp488310lfy;
        Fri, 21 Aug 2020 10:33:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjsnreLrobH5yCM13AROD27LqEEHw4nuUBDxMKJ0gepaC41BqQMNj8PHf/0KiksJle6vdK
X-Received: by 2002:a25:868b:: with SMTP id z11mr5058727ybk.108.1598031197835;
        Fri, 21 Aug 2020 10:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031197; cv=none;
        d=google.com; s=arc-20160816;
        b=iOxort12hKbV7G+AdiDa2Fvzr7ahIbVvxp34FU0wJOJjl10w3gMKDiNCjz7qZsFE0m
         YYHhQ4ZkkrMTG0RZljKyoa92INLDYZH1a8Ay492BYFdcYBmn9ZQvVFXB/eDjfTIxZCGd
         Mn0N7MlO1ONFFabpDujd2d7piUWtQzy4yFGP8E5OTAA/1l2Kh5pkKyUp37fQxnzwug8n
         Q9BgofSJF/Fb8dnBS66w6jKYIDGrGqo4nwTRSP7J/GutXZO5p0OAQ5WrhScINOtw8wm+
         TwLLdWCBGuZLaOeiiGE/yw1Wi8y0MK6khvZUmm9iuUC7zVAkPojOVYlIRKNpN8xv7us0
         F/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oj9xYFI9YtdfvQ2O+xvr5D4uPJDnz6Js3VTiAoIt79Q=;
        b=zkPUCYXUA8iLLH35LiTGHxPG/2UQprLlxHBUKG7M9utXAk58EemGcsOSx5pa9gBYtu
         JENAkm7ouSB0+eyDF8JLrpnzGtPcXwMgKhEMkgQJaBXiQSQF6uH6lxWdV/KPPKa0KA9Z
         iQMvDtuzmL74F58soGOUIC2DXvjV3wENInn3hb86aWy+ZTKVA9WWqBNm5oi35cKsjLBJ
         22uHs63z3A8QRgbvhgFnYgcTRbLzbJoR62t6qLvDr/FH4lQGk6E74MtfPZp6NI4gD/vR
         f7K5b8+lre7I94kpml09Au4693lqJ0No2pBP/ZObv6w8ap88qg3adDLUhIYwVhC2iTxg
         Vzpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=teljjaHo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si2892122ybp.422.2020.08.21.10.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=teljjaHo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9Auj-0007Jl-8R
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar3-00018V-D3; Fri, 21 Aug 2020 13:29:29 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar1-00019q-FH; Fri, 21 Aug 2020 13:29:28 -0400
Received: by mail-wr1-x443.google.com with SMTP id z18so2625739wrm.12;
 Fri, 21 Aug 2020 10:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oj9xYFI9YtdfvQ2O+xvr5D4uPJDnz6Js3VTiAoIt79Q=;
 b=teljjaHoiUGABM8mobeV/fWOijAOVcbj02kYv9u3qTaIqBFpkOczmzAYuHr1SMWN7+
 8R1UuMwv56G6q9OzI3j+f2xaP+VVrME5jb5dxXttO5Z3HxDTtQgB4gpIC9nZuv8EYjj0
 UtPW5QVxXVeK62Mhk8agtrdupsfkiR5Mg1bK0ahuWuMS7ULu4F4Abi6/6gKISZVd/FTu
 ok0PaBPmpG16VJYd0ODBt4RqUmxQNJaXEGrHRDNyhkR1OabrmjXyT5B+eZeBN0uM/qda
 TZ1Evpha6n58N3Y68oQ3EWm/6ibq/dIm2145Kck4lUigRvY3FFpAbZDBWIfNnXeJzwhq
 pEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oj9xYFI9YtdfvQ2O+xvr5D4uPJDnz6Js3VTiAoIt79Q=;
 b=TCw1lEewdoTRrD3YpkaO2LdKNIa782pVGY0l/C2ZOVw/6wMEheFhEvSinH+gDXk7Y2
 ApWOgOLLhkZ7vF/SKK7n+Wza31z8KFu5PEfKLhJpRJ342wsCFmlukECI2WtzTj1PvbKD
 kXTxXpsSXAM7Cbdywv/ogv5AE+7qbiEr+PyJGA87HSsiYZvdy+cQqgSrFfgoGoTDLNKl
 wg5GsNe4IJ5EQXUL9B+aDLmG44S1/uWaJDxtNugFbMpN8k866SMnxd1shXFOZrrZerFI
 j5psg+JZhptdMIraN46veK1zQvAscMTFA1RLMKCDFrUO9FWsrtxqaHG6ijnrUBrIJ8gV
 Q1BA==
X-Gm-Message-State: AOAM531I4kwnBSEn4Vl+3GK3xK5Yckx8TGHhEl6AqtAO7xg5E9/7Bhbg
 /I915jGmomApGXI6ScaVUMHEzv0MtxQ=
X-Received: by 2002:adf:9e8d:: with SMTP id a13mr3459990wrf.94.1598030964965; 
 Fri, 21 Aug 2020 10:29:24 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] hw/sd/milkymist: Create the SDBus at init()
Date: Fri, 21 Aug 2020 19:28:57 +0200
Message-Id: <20200821172916.1260954-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lmpFAM3BHYBN

We don't need to wait until realize() to create the SDBus,
create it in init() directly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20200705211016.15241-4-f4bug@amsat.org>
---
 hw/sd/milkymist-memcard.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 11f61294fcf..747c5c6136b 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -261,6 +261,9 @@ static void milkymist_memcard_init(Object *obj)
     memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops, s,
             "milkymist-memcard", R_MAX * 4);
     sysbus_init_mmio(dev, &s->regs_region);
+
+    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
+                        DEVICE(obj), "sd-bus");
 }
 
 static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
@@ -271,9 +274,6 @@ static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
     DriveInfo *dinfo;
     Error *err = NULL;
 
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
-                        dev, "sd-bus");
-
     /* Create and plug in the sd card */
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
-- 
2.26.2

