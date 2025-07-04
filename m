Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064738dyc;
        Fri, 4 Jul 2025 01:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7d/7ipqg2R+24rMNFUFShTpq3Wad5zp28BXg+9hXrsPkJTql/5Gp7wwe8XmqiaNsyvs+degXsz+lwbw==@linaro.org
X-Google-Smtp-Source: AGHT+IF7s0KHY9b/QaRU36yvyYsZSw07BHpWhj0w/D+x1PtqbTa4/j5+rGb2I5LoD0ImAnbDy9+B
X-Received: by 2002:a05:6214:2a48:b0:6fd:74d9:c70b with SMTP id 6a1803df08f44-702c6d35b63mr15782846d6.12.1751618373871;
        Fri, 04 Jul 2025 01:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618373; cv=none;
        d=google.com; s=arc-20240605;
        b=IDO9eBSZauFeWKHANhcH7z1p8L7eBkJ8BevPelQVx7/ypsJM7OZrOcQ4KHAse7LN2C
         D/+IwTeQoz/TkYoKAknUOUQOMef8y0esLTgL5E9naglIro4tgqlg/ryGWY+4VjHd5IOX
         ytGW2lzrXTaPXaYnFhzu/I2+CIJId0UdbR8Sas3PDHwgXWXjV8d0YO1vTukoK3z40YoI
         gOwsAKkmzaBOU2OcA3mepCyIIr2WPtSgL2wvEnr1RjVowL6bq0/yyWopu477WZ8ynKkz
         7VPlODuhyDIGUmgX8ANDnDq3UgO13wBMDetw3QEfTLkKzMnhLTpKB2h7UTPQYi1kgC89
         Xc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UPEjaImuj/BbVkuYsqkV/v3D2BBUxfFDS/QvW0NCVWE=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=DGVaawzgs+06ukq/j0TXq9KmD/6KDwS6WYuLSWH/iMb3BhlHItQKa3uzV5jKPa1lct
         0JPS5YPnXX154T+jWPPHEiMb4VO/jjMEaplobKPBy/LMIW7qXvth3awC+NE+CkJIDQpt
         xIVruBjd5QB6CbTDZDlpWszFHbUUxdh1zjJ1iHHMnZttZGhA4t3rZ7m3CDK1TugHEclQ
         uze0NDeHgEZYfnJ+pBAhrG/E3zVAk6g2xACmo/1C4CuNRNNhQNTQeZuPiqA98ElDDIS8
         Yojx8Cfah2+q41vi4BCbFNjyL2+MKKYSX0jFR9nNeYdD3DPnel7bG1IY5M9s+U4CC1Rg
         Cpcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XJVzWFR/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbef0accsi156017185a.538.2025.07.04.01.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XJVzWFR/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXbvn-0006fY-4q; Fri, 04 Jul 2025 04:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvl-0006eT-QL
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 04:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvi-0004Sv-Q9
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 04:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPEjaImuj/BbVkuYsqkV/v3D2BBUxfFDS/QvW0NCVWE=;
 b=XJVzWFR/LEuow4ZxyuhQi2UHwA9BaW17qCNfn6pQX2sqUY1xc3LErOTmDd7bYLUYUBKY8k
 SM/pP3uOwDFMwnaOV/1DiR9nNDVHF9FTYZ7mE8TO+7uWY1jobjhIn5xg/5WcNElyTkHwBl
 13SMvVaw7PMpCh78lvD5/EmoxZASyFM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-T4qkReR3OcCYdutSPqSpWQ-1; Fri,
 04 Jul 2025 04:37:53 -0400
X-MC-Unique: T4qkReR3OcCYdutSPqSpWQ-1
X-Mimecast-MFC-AGG-ID: T4qkReR3OcCYdutSPqSpWQ_1751618272
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9DFAB193F05B; Fri,  4 Jul 2025 08:37:47 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6672C18046CC; Fri,  4 Jul 2025 08:37:44 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 07/11] aspeed: Deprecate the ast2700a0-evb machine
Date: Fri,  4 Jul 2025 10:37:19 +0200
Message-ID: <20250704083723.1410455-8-clg@redhat.com>
In-Reply-To: <20250704083723.1410455-1-clg@redhat.com>
References: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: MaVIS7o6/sry

From: Jamin Lin <jamin_lin@aspeedtech.com>

The ast2700a0-evb machine represents the first revision of the AST2700 and
serves as the initial engineering sample rather than a production version.
A newer revision, A1, is now supported, and the ast2700a1-evb should replace
the older A0 version.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250703052400.2927831-1-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 docs/about/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 42037131de12..5a3ed71a6445 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -315,6 +315,14 @@ deprecated; use the new name ``dtb-randomness`` instead. The new name
 better reflects the way this property affects all random data within
 the device tree blob, not just the ``kaslr-seed`` node.
 
+Arm ``ast2700a0-evb`` machine (since 10.1)
+''''''''''''''''''''''''''''''''''''''''''
+
+The ``ast2700a0-evb`` machine represents the first revision of the AST2700
+and serves as the initial engineering sample rather than a production version.
+A newer revision, A1, is now supported, and the ``ast2700a1-evb`` should
+replace the older A0 version.
+
 Mips ``mipssim`` machine (since 10.0)
 '''''''''''''''''''''''''''''''''''''
 
-- 
2.50.0

