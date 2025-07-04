Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064641dyc;
        Fri, 4 Jul 2025 01:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0pIVp6mWtXFuyF/cqtDbwJRGtDDRpgdzTcZFMv1nq9CYpOue+Wfv4HfmYI12UxkEYpUua3L2tLcBaKA==@linaro.org
X-Google-Smtp-Source: AGHT+IFzXrVRM0Faark81Dq8DWNZyRlIf0MY0nkFO3Ns6NK9RuieFLNcZacON0xsQSssPZYDoVeJ
X-Received: by 2002:a0c:f40e:0:b0:6f5:46b0:7d11 with SMTP id 6a1803df08f44-702c8ce65cfmr16037916d6.36.1751618359333;
        Fri, 04 Jul 2025 01:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618359; cv=none;
        d=google.com; s=arc-20240605;
        b=kDbXJ2ZIKBMyeDpXCGtS/QaR78ofzgdsYv0y5wVXhTpuMkKdr1A0MRhUtOR4lJLp1n
         eXSnjprdKpqaZdzcAMyBrBocXsyrzQNgoiQ05Oqz53rkPjZn1XTjkfO9LXW+oYJYEphZ
         52T4zuxuD2OPNGG6B2pJCccms96ko5C/Ojgp5PfNlMu6zJSeUcqJlTSXL8JYeUFQSA+f
         J2oZ/W/4FZuNL/tQ/zC0LR1W600pnHuY2gBlulbhyWHw8rJEXMGhAQHg0pbwfpgH2u69
         8oqxbyu17EAu/vIHHf3FKMwzjoVzG6AH+urqOxc4PJmQAnCzq8BrSJJi9YzlyhwGf4Tk
         fNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UMJTYe82gE/sOFQrJXixBRnsBD7K3hMB1dtJqpO4Lh0=;
        fh=WCd+HP7/FsmbEbWw+7riHzfL7o3+UcMPBMMrs6IKlUM=;
        b=OtT1XnfsnpIMXix5RpYSjyBmYnv8gsSHdHZGxTHoYwPcfN1FSOtN/QnCZVTCxPjHuS
         Hr0H/EIVUl2QPS7ljMwxlIiSKF7u3OEzKO3yEDu2E7Jw0NLt5RJG5zd8FAdK0/sDn+cb
         ss/os6OM1NzhI8O4Uk19RJ4kI1Nv2Eu7JPlUMjkFAyV1ntcoXi5ykM0ASXuYljNWldhr
         NGw2jCBEuvFFlNYEYqg5P09pJYk/nZnBUEVrJ4s3RxlsnVyuhz2Dy0Wpb7D217qttUTK
         LWfTtivdnvOKbaStZmvn3OZNHKJqdEI0A1nCzpT6vegAwATDw8l1r9qH/or2Cy93RdBs
         0ZRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rqvc2LJp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4d60a4dsi14776176d6.414.2025.07.04.01.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rqvc2LJp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXbvl-0006ec-UY; Fri, 04 Jul 2025 04:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvk-0006dg-6i
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 04:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvi-0004Sh-B6
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 04:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMJTYe82gE/sOFQrJXixBRnsBD7K3hMB1dtJqpO4Lh0=;
 b=Rqvc2LJpQmbnMdYYf06aJZhKNMN0Q7mfm+QuFk2vTNn5fOhDVfJ0Hve1BG2ZD81PqzmwWf
 UzOg2okLE0EU0Pgp08y7iNHaqQ1V+aewNFL3UTQVcWsDl0tjYpUHEENmLMqpaJq9x87ews
 j9L1r4is6tbtpYucwCvMaDRJ/dJbdOw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-HOjckyKFO3mF3THQtTaF8A-1; Fri,
 04 Jul 2025 04:37:56 -0400
X-MC-Unique: HOjckyKFO3mF3THQtTaF8A-1
X-Mimecast-MFC-AGG-ID: HOjckyKFO3mF3THQtTaF8A_1751618275
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 09B741809C8E; Fri,  4 Jul 2025 08:37:52 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 278BA180045B; Fri,  4 Jul 2025 08:37:49 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ed Tanous <etanous@nvidia.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 09/11] docs: add support for gb200-bmc
Date: Fri,  4 Jul 2025 10:37:21 +0200
Message-ID: <20250704083723.1410455-10-clg@redhat.com>
In-Reply-To: <20250704083723.1410455-1-clg@redhat.com>
References: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jXVgJScLp/Ht

From: Ed Tanous <etanous@nvidia.com>

This patch updates the docs for support of gb200-bmc.

Signed-off-by: Ed Tanous <etanous@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250703144249.3348879-3-etanous@nvidia.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 docs/system/arm/aspeed.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 43d27d83cb54..bec0a1dfa8b8 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,5 +1,4 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
-=================================================================================================================================================================================================================================================================================================================================================================================================================================
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``gb200nvl-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
@@ -35,6 +34,7 @@ AST2600 SoC based machines :
 - ``fuji-bmc``             Facebook Fuji BMC
 - ``bletchley-bmc``        Facebook Bletchley BMC
 - ``fby35-bmc``            Facebook fby35 BMC
+- ``gb200nvl-bmc``         Nvidia GB200nvl BMC
 - ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
 - ``qcom-firework-bmc``    Qualcomm Firework BMC
 
-- 
2.50.0

