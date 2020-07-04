Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3427956lfm;
        Sat, 4 Jul 2020 08:47:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwek6rE//ANBN5R2bV8PYOAXt+AgQHFaUDNTm2l9ErN+CXUDyV50jUpV+Si4GVYKbK/+WXQ
X-Received: by 2002:a25:b511:: with SMTP id p17mr70780168ybj.86.1593877663345;
        Sat, 04 Jul 2020 08:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877663; cv=none;
        d=google.com; s=arc-20160816;
        b=nnoDrkutViXHGmKcNigUiapVEhG4YQnY1B+6wFaiUOJ+JhvCDnXZ+lYZA8AsB7yV7D
         Pui/mKkmVMgMjxAyUotYMHqvtp8OH8WRVQZTE5pUAFpE0yASBt5sI8lsiWpj1g9ayutw
         aOrEyYDh7SYJ3i/ivcGSxVDdz9od//hvGUsfdgmEzUe4m2vH+P+HkoRKKtoPW81WQHV2
         UnB+NdlJkjM6bDziJZA2LV+Z9pvBLKF9R7wqNLpwuUeey7Gbf+MirdQGyshaTe8G5xUV
         Ro4pWlcNonyUvHWHbl3J393GqmPeWTFftaK8nBzXUU1d08ycD/t/JAPjk86v6tbNW794
         DTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
        b=jwPcIeKWBUf+WdoYGR36IctFaWRcI+C/NSHjsSpaAETrvZR2oVWhipQtowWL25+m94
         oF+TAkeRygoeHIWgilODXHQvF1hUFrUb2MqT5TVATNzEtmhGF6PoydRRdMEucedHLdpx
         a+ePSb+hYHCeOqOUOXdsQLt2WKiSypdTgQUALiw794r87G4NoPS3f48uLmJGfBbd6kc3
         hCjBKLAokn2wCsCQFc/pqAGqVqEsgd9WJBb34KvIZR1cKZeE6gUcbkfLAdJ98DSbBX8C
         VoiLDfka8OFlYCKxHF4JL40IKj2JzIu78oM0dByV/LWC3E9QLkeT0VTW5L0NAoBJTS+v
         x44g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ge4dGhOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si14354780ybm.156.2020.07.04.08.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:47:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ge4dGhOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkOE-0007Br-KW
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkH3-0002Cz-6i
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32537
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkH0-0007mC-EP
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=Ge4dGhOWB3qdHk64C5v/M/SFOAj1vNvDqqeyJxp9G4dwik0RJhQRSb+fBDcnv7Q9/ZdSCN
 z6ISOWPxA3j0UwdF643PTI6Oy82HkFQfAayFCog9ufgNH/PGRniblvNFhMc7zQEmvk5R7y
 gGN7Fq7wCEhAXJ7H77oDTsVs8oG1fUE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-u3VhZKv1ODmAf7eFT7g7wA-1; Sat, 04 Jul 2020 11:40:12 -0400
X-MC-Unique: u3VhZKv1ODmAf7eFT7g7wA-1
Received: by mail-wm1-f69.google.com with SMTP id t145so39827990wmt.2
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=kRk+ly0eKTpX2j6xN/RQQvbT1zxwofrTQChb99csGupK6u8UdTfK2xwq8lvemFvmCR
 YRLhBwxLtJlxMsmMRxVZ61q6KZASmSK0y9fFKM7Gkmki+9RuRgNPh1h0JINJ79q2UBJO
 rHGl69QIzVDp8tlX79nvnZ4k5WUzmfX+olG95MSM91Nia6uV0CqKDqz1WkGMcy9zRyGZ
 Ff3YOWphwjgKvv0/T2/K/01k078SLcHKGg4Nza17cTLLOh8QjijgYVnSKhbqFeqgJDrU
 NRM2fYb0fqAm0jz05o3H7eOFMZ3WCadgJiZMRK5/ZpeXd0YkKm/LCg+4Nuf1qzGpRvvz
 ePBw==
X-Gm-Message-State: AOAM53163JzF1gpupRW4riEeaSCxcOPS8guQz2gUsHGw/HWi5W091xui
 yOg29RCGeXexW0jfw2qdT61b7acCurlSXGGtoeLMSVQ6KMS/zpvqoW4ROI//ZVDTNWFlGEGgGsn
 BvkniY//2DYv+
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr40832223wmk.30.1593877211223; 
 Sat, 04 Jul 2020 08:40:11 -0700 (PDT)
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr40832203wmk.30.1593877211076; 
 Sat, 04 Jul 2020 08:40:11 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id q188sm16902969wma.46.2020.07.04.08.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 11/23] hw/dma/etraxfs_dma: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:38:56 +0200
Message-Id: <20200704153908.12118-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 62VnqBkz4KjQ

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/etraxfs_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index c4334e87bf..d2f7e7ca9d 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -28,7 +28,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include "hw/cris/etraxfs_dma.h"
 
 #define D(x)
@@ -765,6 +765,8 @@ void *etraxfs_dmac_init(hwaddr base, int nr_channels)
 {
 	struct fs_dma_ctrl *ctrl = NULL;
 
+    qdev_warn_deprecated_function_used();
+
 	ctrl = g_malloc0(sizeof *ctrl);
 
         ctrl->bh = qemu_bh_new(DMA_run, ctrl);
-- 
2.21.3

