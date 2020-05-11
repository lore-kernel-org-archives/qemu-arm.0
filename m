Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2445049lfb;
        Mon, 11 May 2020 01:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMALwnqzzaMO+CVfeVW6BzfUs1Zd3zqFyGf8FVmdcTZv4mCc7iJ6t401GEtQGlJ2RwvUqI
X-Received: by 2002:ac8:1959:: with SMTP id g25mr1051305qtk.314.1589185062096;
        Mon, 11 May 2020 01:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589185062; cv=none;
        d=google.com; s=arc-20160816;
        b=UpBiqDMZDF2H8fG9MkPTY15zeyZdJ4uQMRIUfeSL8TNG0S8R1cPCZawLh0Y6qzOfQe
         KYliJlmJiAgzCCjJz0pKmLbi8mJJ1Mv3PbqWeQzs2ir7JDWVnkX+w0qarCqJejWiLRxH
         IcLiHf2nge+4iu4NTfxXiUKrf3WTdPwsLgC/QcFCWjVmbDTuIw0lJTplTGoc+9fWbiu/
         GTikPQ8Sa7DnZXQxIPvYWSJUuFUD1BVbuvwA9eGucEqOAXcz9N0FImQOOTck2gXlMG6P
         /pNjOan/zTTbzy4C7nStk9gATV1ozM/f8q0BdGHxilab7CYyWaWq+TC+XH/4zZ1pILkm
         wfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+fMs+TwjNvZEraJaaspwuJO6dVzcXbnuMZr1UsCS+CM=;
        b=YK7SABRN5ScxNObp9Awi8uUkpddB4ZBEyK1CzdghmXzhEuJEEmx4/MTcnr6MoD8aLM
         isy1xTpkFdAb4X0kilHw2cgCs8xWoZLXBdwveqRbZlg2ZK1bAjtJw3VxPoqXcwxs/a0u
         61CxhhOrNtxRVzQKhbhCFUhtzIMkFbsCclyDXnMRh3u6xIs7qfyg4aLQUECnuKkSWeKq
         NNed+OL7ryZr1FYWuiKDAZyQjRb9TY0z9iNj9NM15KeUJ2Jlm7ozaMIgM9TKhnRp6tHO
         JpIBTkASxIr+b/8pStC7uD/XKWWOaEPklKL9zypLRHD8w5Go5sYW68A7hDgQpnXaigWG
         umfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VgmPJ8EF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d76si4812143qkb.69.2020.05.11.01.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 01:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VgmPJ8EF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY3d7-0002q5-DH
	for alex.bennee@linaro.org; Mon, 11 May 2020 04:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3cx-0002n7-Eh
 for qemu-arm@nongnu.org; Mon, 11 May 2020 04:17:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32875
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3cw-0002mC-Fr
 for qemu-arm@nongnu.org; Mon, 11 May 2020 04:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589185049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fMs+TwjNvZEraJaaspwuJO6dVzcXbnuMZr1UsCS+CM=;
 b=VgmPJ8EF+SIY9sSbz+g4zBEFzNyj1cAfZ5N+piRO8IXzkfNVdgh8F6cbTrsyPNJr5bSP5P
 R3098bA1tDKlHEZ2h0IIJXY4Heag9buon0sTNfVUFED7WiItRZPV+RsSqZU6rIyRnLk2Zs
 zhSoe0AuX3FC7xt7/mj9JR5nz0vTbC8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-82t94DWJM7mj_pHqp6V5Bg-1; Mon, 11 May 2020 04:17:27 -0400
X-MC-Unique: 82t94DWJM7mj_pHqp6V5Bg-1
Received: by mail-wm1-f69.google.com with SMTP id j5so7952113wmi.4
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 01:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fMs+TwjNvZEraJaaspwuJO6dVzcXbnuMZr1UsCS+CM=;
 b=U8XrxslDOyIohoGXhEur+D+RKjlKUK6KBqp6X/Nz9ilrIcr0K/Qf2XKVTMMoWLo8Ro
 vXi0C/vQ+/2vB+eMARXaxAmFqRYXEm3guR9KivwAW1FHtE7DOTAgWgdFWxr6h0QjKRIA
 zXvrg+/U5f/5KfBtl5k8a0n8fYU01hpjulcVTjuwb26hFsE9h2bR5+BFLh3pxpGzDmGY
 VwXRcOkyxYpV3rPeMwH22o3sZJ17MeF2RbSUiB9qZvEF/S3kc2E9s5HvzsRLDf+FFZtv
 tYRt7v3k2TLz7QaxXVlyJkKvuB23O2A4pV+a2XRqesgMN2Eo17hF89VW3uxXz9K0zOmA
 ZJGQ==
X-Gm-Message-State: AGi0Puae/ciK0Shsr2Lr1rxo5ZpJnQGgW0k/VSHaX9jSBnIFkBvZsQtV
 KCYQ7Ehmk0inYl+F31l8XulF3ivT8IhOVwKBVyiYu4YUsx0rrpFalarV6P2NIK7rb3D1Gdmjyon
 3bnnd6hIkikyZ
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr2991804wma.170.1589185046522; 
 Mon, 11 May 2020 01:17:26 -0700 (PDT)
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr2991788wma.170.1589185046328; 
 Mon, 11 May 2020 01:17:26 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id z22sm24828742wma.20.2020.05.11.01.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 01:17:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] memory: Simplify memory_region_do_writeback()
Date: Mon, 11 May 2020 10:17:16 +0200
Message-Id: <20200511081719.31641-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200511081719.31641-1-philmd@redhat.com>
References: <20200511081719.31641-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 02:55:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +tCRgJ4srUyd

mr->dirty_log_mask tells if dirty tracking has been enabled,
not if the page is dirty. It would always be true during live
migration and when running on TCG, but otherwise it would
always be false.
As the value of mr->dirty_log_mask does not matter, remove
the check.

Cc: Beata Michalska <beata.michalska@linaro.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index 601b749906..fd5c3af535 100644
--- a/memory.c
+++ b/memory.c
@@ -2204,7 +2204,7 @@ void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size)
      * Might be extended case needed to cover
      * different types of memory regions
      */
-    if (mr->ram_block && mr->dirty_log_mask) {
+    if (mr->ram_block) {
         qemu_ram_writeback(mr->ram_block, addr, size);
     }
 }
-- 
2.21.3

