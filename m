Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1339257ejc;
        Mon, 13 Nov 2023 05:44:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp1W3XJjfx54ymT7eH6AZXdW/5PjVytVv/WDKr+CFU8OrGO7a3VV3PGj116Mpo1A8nOQ3P
X-Received: by 2002:a05:6102:4b14:b0:45e:3da0:6a31 with SMTP id ia20-20020a0561024b1400b0045e3da06a31mr7779670vsb.13.1699883052805;
        Mon, 13 Nov 2023 05:44:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699883052; cv=none;
        d=google.com; s=arc-20160816;
        b=KoRoxz3lNi4kNv59BNlVGolExVgYnUyeHRR5gbfRDED2Cz7mZXEMEAJzijVgMFyeM+
         MvtLiKG7iSGdurV/s4szRn1NzWUao7vfRyk/07PLwitfD8lNdC7MPnTUdK+v4d9GAAME
         N+b92eS7deMu+Q+QPlV8kS4xGa57Ynac0b54ym6NxBlk/G/hORZNk+NzGl1Y5WUSoP93
         otttejtOCFDKiqUT/X/7lX1+g5s+/a2s3ZFMv8UaJR/wqmkxWgCCG40fweXNPfhs4EBr
         dOg/DcV/JCBkuWV86d66//c0z+enbkSycY0ft7jGNr7V3v6yEv4qof1vyvDUbzS0F1FH
         7JbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xBF1KNEXWxJeeTPiUNRgyegpGfzd4uqySoao4fHdCKY=;
        fh=fyoUBle+Um4ADRf4VLLg4tenzAlmU+iCfEmj0Kb7yeY=;
        b=hVaG3/APu9HDdlMczu3/GpaLp2VqlEvsCR/+D9Y6jNLt+k2jfK7HHE6A/bmDqdzoPj
         pLFImJ2J18RUHtkV21+Al/T8cu+vgrjnHiAV5Ach1UDJVuc2msACNREJ6C4XCsPwWW2I
         JnBzOFTjBFjpzfmOhcyNCRhqlwa7IBOHWXaaR2f9K+gsGXZYELY4nscI/OwbTAlD4Boc
         /ZhZ4kBgy3ylinrpAXspTSUz3wyRl2b0l6f2/0YNSrbLvSVfqk+uVZDBlhW030x4AnDp
         bSZBtO9xcoIys1fUS6ygQA5a1Ya80xo37Ohaot9tnG/UNTfBHvz14WxT9md3qNiiVy9R
         YoYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JYHgDL19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05620a455200b007758ed711d1si4943403qkp.55.2023.11.13.05.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 05:44:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JYHgDL19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2XEG-0005Ke-0D; Mon, 13 Nov 2023 08:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r2XEE-0005K0-R5
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 08:43:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r2XED-0006eB-BK
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 08:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699883028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBF1KNEXWxJeeTPiUNRgyegpGfzd4uqySoao4fHdCKY=;
 b=JYHgDL191tQzY1BWHp9Oy8lIGPs+h0PZY7i+cgeVDz/i+SS0fs9g07ithhfmBdthG1RotY
 kG2o5NFlqqmQJRquk/XYM+h14Y/ys/QetQebZQpEvhXF4OZxtLq2YSyklp0yXTp9kp7bIa
 G8ZIKr78TkQsSIvynaAdQA9sS65Rc70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-fi4yHjhTMvqcFSWJTx7pKg-1; Mon, 13 Nov 2023 08:43:45 -0500
X-MC-Unique: fi4yHjhTMvqcFSWJTx7pKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F2C485A58A;
 Mon, 13 Nov 2023 13:43:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 291982166B26;
 Mon, 13 Nov 2023 13:43:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2ECB321E6A26; Mon, 13 Nov 2023 14:43:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, alistair@alistair23.me, edgar.iglesias@gmail.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com, qemu-arm@nongnu.org
Subject: [PATCH 1/2] docs/system/arm: Fix for rename of type "xlnx.bbram-ctrl"
Date: Mon, 13 Nov 2023 14:43:43 +0100
Message-ID: <20231113134344.1195478-2-armbru@redhat.com>
In-Reply-To: <20231113134344.1195478-1-armbru@redhat.com>
References: <20231113134344.1195478-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
X-TUID: vHbIpcNhj0+W

Fixes: b65b4b7ae3c8 (xlnx-bbram: hw/nvram: Use dot in device type name)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/system/arm/xlnx-versal-virt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index d2d1b26692..a6a77b3799 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -194,7 +194,7 @@ To use a different index value, N, from default of 0, add:
 
 .. code-block:: bash
 
-  -global xlnx,bbram-ctrl.drive-index=N
+  -global xlnx.bbram-ctrl.drive-index=N
 
 eFUSE File Backend
 """"""""""""""""""
-- 
2.41.0

