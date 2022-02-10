Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1703896lfk;
        Thu, 10 Feb 2022 09:24:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw34rXFcapJFmRTFmAQj1hLnSQX12lgK8tM2Aw5JZcpvFsuadkPUYIsrY6vnNMLrDe99PF3
X-Received: by 2002:a25:7d07:: with SMTP id y7mr8307008ybc.141.1644513858869;
        Thu, 10 Feb 2022 09:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644513858; cv=none;
        d=google.com; s=arc-20160816;
        b=qk4ojW+3HNZ8/tFJH8e6npCBcihhTBW9ZI/VgAQGx9BNVvOoi2U5cUedO5AKqUiOJs
         D7TpI3tWgzW07ro3Ir4GcnbFqSl2zq5h8133+9hYlgaD8dGhAFBWOd9qzTVqCKwhpk+6
         7WjndK2jMGPlnJxpErynksfNSK6SyUCf6jHjImXz5Vhw5J6KRTjsNQwjs3OfUHP40kAR
         MRbiZSbLiN9SZM0IG98jqQfVLQ3hivpWIV7WUOe5OBFWAfUuEgAGTsWZrf7zRKoF4uHF
         2eVq0FYP6xxHZUuo7mz5htAr0GuPnTnmbLluhLJeTk8PTaZpiKyNDB22RPG8coZ+LMxa
         TPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SxRgbq9ttrQRFvO5NnZwXwJjSMKQhw7d9CQ3Zqbmj3w=;
        b=Hmt7zVHafKnmWiKwAwdewdB/81pNbUAijtLOs9Nf1zZSio96TEoeapY0gOhI/wi5WO
         NolQBMigVtumXxavskB4PZszVfzpkpA8IvywbJqGBFgwapfHHfWmK/pRZsfYbfl9ejcA
         Yhllof0t+hF1JSRxFqQudopPhZEnZOvmAUvK4+xYGxj4AQFpxWPkOkEBeX2qYIOjgNxc
         hL//I/gRmGp2fMW8tpTKxDZieXkNkrf0oal7o2wj5j0NOlJDErYE5QV4uGcRlfXg8Kw0
         dXDLVRyMmXOcPpR7h3EPV5cK5NgHDOcj+YudSs+LFjcmxABo6ysW3McpDyRzV9oypzyt
         Deqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OJp6Q7Vd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si17619278ybu.631.2022.02.10.09.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Feb 2022 09:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OJp6Q7Vd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nIDB3-0007TO-SM
	for alex.bennee@linaro.org; Thu, 10 Feb 2022 12:24:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nIAon-0005PK-LR
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:53:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nIAom-00046L-7B
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644504787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxRgbq9ttrQRFvO5NnZwXwJjSMKQhw7d9CQ3Zqbmj3w=;
 b=OJp6Q7Vd6abzIjHd3CbFKU089s3EwTYF6uL5hv2Uu3c/Kumf7Qfc6wJfGiEcXxcLXiYQxR
 hMirhWqfGOcLPkxMlkM2dHBgryqeH0ZTVOA9qpDsL1wtpf7oreVznJKknkCZBLupxs6oQw
 mmgCTDfuQR/eWS8Xoe9Ru2zl8edvv9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-fWoaz-_IOkiWEJ4SOPS4Kg-1; Thu, 10 Feb 2022 09:53:05 -0500
X-MC-Unique: fWoaz-_IOkiWEJ4SOPS4Kg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E1ED1091DAA;
 Thu, 10 Feb 2022 14:53:04 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7478C70D5F;
 Thu, 10 Feb 2022 14:53:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Subject: [PATCH v3 1/5] tests/qtest/vhost-user-test.c: Use vhostforce=on
Date: Thu, 10 Feb 2022 15:52:50 +0100
Message-Id: <20220210145254.157790-2-eric.auger@redhat.com>
In-Reply-To: <20220210145254.157790-1-eric.auger@redhat.com>
References: <20220210145254.157790-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s145z0F+LAf2

-netdev vhost-user,vhostforce is deprecated and vhostforce=on
should be used instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vhost-user-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3d6337fb5c..6e79935c47 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -42,7 +42,7 @@
 #define QEMU_CMD_MEMFD  " -m %d -object memory-backend-memfd,id=mem,size=%dM," \
                         " -numa node,memdev=mem"
 #define QEMU_CMD_CHR    " -chardev socket,id=%s,path=%s%s"
-#define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce"
+#define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce=on"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
-- 
2.26.3

