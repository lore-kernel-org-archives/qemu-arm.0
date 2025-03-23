Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1518994njc;
        Sun, 23 Mar 2025 10:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhBrpiq8LY8Hq8yWwJB6uVKR7q77Ik/wQqcok/fhcqtQFChEAw3z/h0Ojygxbx5dxNGso39KUVBPP5qw==@linaro.org
X-Google-Smtp-Source: AGHT+IHdD/pNZ+I84XAjnRWt9H5DNb1fOTK2AUywl7zAAY9NKRPdhNKHePD1xBnR9oIFTLkaBWOj
X-Received: by 2002:a05:622a:1f1b:b0:477:d00:b448 with SMTP id d75a77b69052e-4771de5cc42mr137009461cf.40.1742752090354;
        Sun, 23 Mar 2025 10:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742752090; cv=none;
        d=google.com; s=arc-20240605;
        b=X+86eRLeya1ayKq2HKdpP8CPz9Il8eZM68BgcfcgoZUvdB9XrabFPaKOK/qeSxF/pQ
         0jyGI7Kus88dFvZQe3WMEDYF7jkIFd1SJcYRI3itX3JrxsHpG5KRjTrLK77AqkGqZ4sV
         76p9NI9Wfz6bkcUzrBMLYnaZmpiBAZ18rF8TQq/M05sOeV9TTJHXSvim7Drb4FxBdAIK
         BFBWuKteenI03Ncpbm/I/l9yNns2rEzzKM+aB4wMN8dyNQmpYHSkKVfXLYIghDeCX2ah
         aYNSMaubMMsibkr2GB2+vBglqdYGpqwNg5tFUz/NPVrxLtBvVF5OvrNbdvpNfCK5bSAV
         PvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CyDOAolXDC8JHNY7vW5wrsU9AZ5Pv4aAsrkKN68TzCY=;
        fh=2tF814yhlR9lAjKjhYIOYjzqUlsSQssx481Cid5Ym60=;
        b=g9IgubC6rCIO2rfJ+KoYJ7gCkKn8sSP1dCkZX2f2qXXdtcYJcJqNIz52XbwCTeLLDt
         vDqh3H0yLdZR21NIJcXcVa/QRIB90zV1NolpxASa1RQG0dVT4fvX9jHjtQTQJGxOFP4S
         u2QdqhLm6gxqsuK/vw0aiOIOYi87WTsiQ4nwUhjCX7q+Q3lCqQMJycJAq1TXEhng9EfI
         n7g7alWDOiJtOTkNYnDrhtFa8NObEg91b4VdBNYPnWzILPLQre5N1W8RdKRkVniY6pOX
         BgnIkF3x8ZsHaJ0iNqFAnnWXhg++H965OUY/gpaQ8B8bQWtCUlBQ2JJSraEBDmRFH4TP
         U+4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YSx6Ib2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d527806si58233981cf.418.2025.03.23.10.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Mar 2025 10:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YSx6Ib2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twPPf-00042K-6K; Sun, 23 Mar 2025 13:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twPOk-0002eC-22
 for qemu-arm@nongnu.org; Sun, 23 Mar 2025 13:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twPOh-00041p-Vt
 for qemu-arm@nongnu.org; Sun, 23 Mar 2025 13:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742751966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyDOAolXDC8JHNY7vW5wrsU9AZ5Pv4aAsrkKN68TzCY=;
 b=YSx6Ib2Y8c6xNKiBtC5dxC5RRyCj9E8gf37yR6aWpPiOFHNx5yPvGcQEg1rRNAIiJ9YBnt
 VG6ZMRLLHWNGunRxVTxmiYfgfv3kP93S+o4YiohKFoi5CmpyHamWWgS+9O9I1Kj1RYwJu+
 NZo11wU7CQg3IU25D73wSIg6qjbW3rI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-EWT7iP3COLyDYn-OBMQupg-1; Sun,
 23 Mar 2025 13:45:59 -0400
X-MC-Unique: EWT7iP3COLyDYn-OBMQupg-1
X-Mimecast-MFC-AGG-ID: EWT7iP3COLyDYn-OBMQupg_1742751958
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8FCB81945103; Sun, 23 Mar 2025 17:45:53 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.3])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6BAC11955BC0; Sun, 23 Mar 2025 17:45:51 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 1/3] aspeed: Fix maximum number of spi controller
Date: Sun, 23 Mar 2025 18:45:39 +0100
Message-ID: <20250323174541.406860-2-clg@redhat.com>
In-Reply-To: <20250323174541.406860-1-clg@redhat.com>
References: <20250323174541.406860-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DKervSgL3q7N

From: Troy Lee <troy_lee@aspeedtech.com>

Commit 6de4aa8dc544 ("hw/arm/aspeed_ast27x0: Add SoC Support for AST2700
A1") extends ast2700a1 spis_num to 3, but ASPEED_SPIS_NUM defines the
maximum number of spi controller to 2, result in ehci[0] is being
overwritten in runtime.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Fixes: 6de4aa8dc544 ("hw/arm/aspeed_ast27x0: Add SoC Support for AST2700 A1")
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250317065938.1902272-1-troy_lee@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed_soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f899356ed94c..f069d17d1629 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -42,7 +42,7 @@
 #include "hw/char/serial-mm.h"
 #include "hw/intc/arm_gicv3.h"
 
-#define ASPEED_SPIS_NUM  2
+#define ASPEED_SPIS_NUM  3
 #define ASPEED_EHCIS_NUM 2
 #define ASPEED_WDTS_NUM  8
 #define ASPEED_CPUS_NUM  4
-- 
2.49.0

