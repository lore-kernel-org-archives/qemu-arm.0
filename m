Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5942620lfp;
        Tue, 18 Feb 2020 01:49:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOpkMgpBpJR6jCy8ap47SgoB6NILzvp6eEnH/Ae3PDyr2jxq073f8tb/YYUxnng8kjtJxI
X-Received: by 2002:ae9:f711:: with SMTP id s17mr17819315qkg.238.1582019362188;
        Tue, 18 Feb 2020 01:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019362; cv=none;
        d=google.com; s=arc-20160816;
        b=U1d+yWmEQ3dgYVKLJtR1QeBAVzCGgKYoQcMg9ajCGiUE8Rw+xj6bVrbGAS14QUJEpi
         vbE4IupQA3ytl9CdAS6y9cI8mX7AGpUOxcR/LjrEKjEY9dmwiy+24vpO+HCF1wl1ESiz
         7jub7efNt1+1kPV6J/RuyQJvn+iWL9fQl/E+nzwajsMpzW3KsWlBUXHEFoqW1eRbg3RR
         c6GsAjxfIHlINg0xBTWQNJuvauE+Bz0uJu7uVouZH4PFufG8SSRHnyKvAI7OW09zu9HS
         yU/WsgbvKpWAB+gVIqTA4gGT/vmmTTR12B1pU1jazuasf2bChNrMImrs3GeXdIRNVr63
         21IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O50p9vS8lAM1KgCOESGEUWsExX65Aroq2vWKbIYHyYM=;
        b=tVosffcHwQBeU/C8DE8IR27cUyYe6S4xE3oU4RTTi7LZX4raPgCzPuMLjIwbXehrkj
         hLQy0F5vmj0xkbbVew0crMgz+4oUBzwnOqkTBuyCZ8DxpJyKcbwIsUNfwyVvbupF15eL
         Naw61EiB2CYQK8KTke/uRU5AksRcohl7pcoTOew24smAb/lhE60eu7T+syHC0ysBAZJj
         QIyhlmOQZi9BbhJVCJaCq0Z15/0FJRKK6vCInpSKPXCHJac10Q7Ox6DHaNThXtrnRlSA
         UbUlc6dWeLZ/jjDhUcTBqqREgGepjSNxSrjzPsKf4UpADbxeJAr5Sr+F8CgbQ4nNhCsk
         lOLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KK1Hhprl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 80si1696990qkm.155.2020.02.18.01.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:49:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KK1Hhprl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zVJ-0000Ta-Ik
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQO-0001Ak-Bq
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQN-0005rK-8e
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQN-0005qw-4u
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O50p9vS8lAM1KgCOESGEUWsExX65Aroq2vWKbIYHyYM=;
 b=KK1HhprlsHtk5tCzMr9PrExquKoCl7EK5ZPJRUzi4hW5H6Hr/E3xppmwX19nTX5g098iwQ
 dvShl63frVhaoFQGTwMUGPO/8piMr2KKc4NjKwRXnu1bvWzFKMiH/CZgrQquGEMW1ydar8
 cMTPxyJhQNJgH8MnHpnqaoFf3G+CsvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-NfClo3GIN5asz13QspfNjg-1; Tue, 18 Feb 2020 04:44:13 -0500
Received: by mail-wm1-f72.google.com with SMTP id d4so872523wmd.7
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tYW7J9DRdD0EtwNm+zUUQ5S0X5D36o436wq58i4uWY=;
 b=KG5OII1b2QqD31Auyjm3B41VKuGs25t9CsUznCZLleMitv5gNxD/yxewRM+mXve5B6
 /7SJtz8iHetOe1tB9819785fMBkjf7jiFUilJUnLO/cC/S7DRZH4cq0QmdeHyiqKdg5x
 7+797xKUaP89UtPu1MAfi/kcG/cSJvEOPusmsMKVqQ9HCCXVLxHVGqb5ErNj26DbYNfz
 E/lVAPuhv4gdVancx6qhXN9CriXdfcKnXdwZDDlpM/n6nJJ3jDuV6yZdytbHKvetUre/
 QzI5N8m+xYjQjDVahzAKt0pRzf1RU1SN7o2cVq5CYSJsLbE42Xrwam08CNhvFXWUlTOW
 zj2A==
X-Gm-Message-State: APjAAAXcsbkoCEvj6OvXEpxMCo47m7oQSnxrXv1bw2/orOVFnf0gyBVU
 0SxaiK8XvHzJ+JgN1B8P7qFS+yTJ+EtWwv5hjc6tIzOG3wy3q+UY5eFXjAwVtGSJhzzAYZjR7kX
 HTgsvNsxkIoV+
X-Received: by 2002:adf:8b54:: with SMTP id v20mr28935367wra.390.1582019051948; 
 Tue, 18 Feb 2020 01:44:11 -0800 (PST)
X-Received: by 2002:adf:8b54:: with SMTP id v20mr28935311wra.390.1582019051646; 
 Tue, 18 Feb 2020 01:44:11 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 03/13] block: Remove superfluous semicolons
Date: Tue, 18 Feb 2020 10:43:52 +0100
Message-Id: <20200218094402.26625-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: NfClo3GIN5asz13QspfNjg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yisasX4ifqQR

Fixes: 132ada80c4a
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 9c810534d6..9db0b973fe 100644
--- a/block.c
+++ b/block.c
@@ -2435,13 +2435,13 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState =
*child_bs,
     if (bdrv_get_aio_context(child_bs) !=3D ctx) {
         ret =3D bdrv_try_set_aio_context(child_bs, ctx, &local_err);
         if (ret < 0 && child_role->can_set_aio_ctx) {
-            GSList *ignore =3D g_slist_prepend(NULL, child);;
+            GSList *ignore =3D g_slist_prepend(NULL, child);
             ctx =3D bdrv_get_aio_context(child_bs);
             if (child_role->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
                 error_free(local_err);
                 ret =3D 0;
                 g_slist_free(ignore);
-                ignore =3D g_slist_prepend(NULL, child);;
+                ignore =3D g_slist_prepend(NULL, child);
                 child_role->set_aio_ctx(child, ctx, &ignore);
             }
             g_slist_free(ignore);
--=20
2.21.1

