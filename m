Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp976456njk;
        Fri, 24 Jan 2025 09:46:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCtVKC8VCJF2zB9BjjSxJCTCWMW5DygOrzqC6+WVR39D8nNtZ6k4/PnQEcv+xOX3HbdWE+eJCzLIUxrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHbDs0Z76CRj3YUI0z8gpDQGQbWSTPjsRrt6K7QE6zBr1qBwY7HSfdDo6n5YROR7VC2cSBq
X-Received: by 2002:a05:620a:44c4:b0:7b1:52a9:ae1d with SMTP id af79cd13be357-7be631e5789mr5431807585a.6.1737740780498;
        Fri, 24 Jan 2025 09:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737740780; cv=none;
        d=google.com; s=arc-20240605;
        b=cj4Bqvy82gyv2zttapfeUj610ue18OG2zwJqW3Ndo15+0l2YZmNzfO5OznSUsXosah
         5NDLGgLVxtoyyLQiTe4IJFq19ruzGlI80+AEmhS+catbezh4bh9FobXxsBsXoSnF21+s
         4piXiuGgRQOEi7PoSZI1Q9ht3PTZO+cVJQJWAvUPHESWSXJJRAm37wLFZT7eceJoVvHJ
         TGuDkbiq7xp8SxR9w7O/92qcrg71GaL4vn5Bnbuui6frosepEAG+EsBOlwZErGlhU5WQ
         WORiiqvxhdFNYZXApHqXtDD+IEMn5BbNtW4fX7kinMlAD0Z1unjiG0cjc0q+d8JK8d97
         Ef1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=AB9Mxv8gRSN96n4mOkjaOuioERIcyeGoEiie8rKPdcE=;
        fh=NNCxpP+LUq2TWaETo4sa5JWl4CrpGNm0th8/N39SpMY=;
        b=A9sEdNy5sMxhYpTE6jv/lw3Ja8yR9Hq/kr2zqR4eMIbb76OAGP0dg4Of7WC2IdAnaj
         7U+Z29KaXdDsokyuhCtThH7/Z3NKPpKOwo3wxpwJVHflnxbZ0eTyOG+1GrST9Q1UkTQT
         WHbF0jAxCiCa/w1U+iiJcltZzIfErbM1otsq7N9j+TUk3QsoQXHgK6+0Se1LPUBUgWAu
         iq4Dud/y9w0PruKisz2puTZFkMJNkeeGuFdiYrLiOy/Dq6+8yCR76iE81BL+Bhg6Pcud
         3kQ7885Puf0hhSORQHw0pyKlZbTvJeTx4ukPEdsrHsOPcd7AOg5ndU181CUqbffzHgM+
         JMJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oc6tMHiV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba6c6dsi30261241cf.533.2025.01.24.09.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:46:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oc6tMHiV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNkV-0007Xl-D6; Fri, 24 Jan 2025 12:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tbNkJ-0007JT-E7
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:45:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tbNkG-0003lC-Ce
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737740726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AB9Mxv8gRSN96n4mOkjaOuioERIcyeGoEiie8rKPdcE=;
 b=Oc6tMHiVW9OXabj0gANWhxyXIVg5S31EZjJ8HLxruzChSuyJhsWpLKcVMOd7wGOWpETDWd
 +LXgwv6nGebW6aagOCK2IL174hJGnak4AP1NyxI04kXfCWGV9xXlwu/f8+Vb6/QfNyHj/V
 vSZ/48VLfPynNk+XzuUyqSg2ey04ZDY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-342-o2ZFVYETPXK_1BZ0ktEMOQ-1; Fri,
 24 Jan 2025 12:45:22 -0500
X-MC-Unique: o2ZFVYETPXK_1BZ0ktEMOQ-1
X-Mimecast-MFC-AGG-ID: o2ZFVYETPXK_1BZ0ktEMOQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D12241956055; Fri, 24 Jan 2025 17:45:19 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.150])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EBDA71800365; Fri, 24 Jan 2025 17:45:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org
Subject: [PATCH] docs/system/arm/aspeed: Remove tacoma-bmc from the
 documentation
Date: Fri, 24 Jan 2025 18:45:07 +0100
Message-ID: <20250124174507.27348-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: n5XqXGwAD4tX

The tacoma-bmc machine has recently been removed, so let's remove
it from the documentation now, too.

Fixes: 2b1b66e01f ("arm: Remove tacoma-bmc machine")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/arm/aspeed.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index fa4aa28eef..97fd6a0e7f 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,5 +1,5 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``tacoma-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
-==================================================================================================================================================================================================================================================================================================================================================================================================================================
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+==================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
-- 
2.48.1

