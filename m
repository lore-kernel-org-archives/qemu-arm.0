Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp244221njb;
        Thu, 8 May 2025 00:27:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURDouxMvvm9WKlLwEJKOYqxiVUCMrqXBwT70LrzQVokwTfEJWnmq7OSW5Imu63jQ7RE0ZTvxPl2giBSg==@linaro.org
X-Google-Smtp-Source: AGHT+IGtdB6E5sRX5M9HgwolWiqBdhJqrPV5HpUzi6DcJWfSTUMIdvapo1frWSP2E2N6K9PK3Yx1
X-Received: by 2002:a05:620a:4090:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7caf741cb26mr1017254185a.49.1746689248501;
        Thu, 08 May 2025 00:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746689248; cv=none;
        d=google.com; s=arc-20240605;
        b=Xq4B4EAs6l7XwZaarNIqHzYKMyV7Qz1kzxTSZgfWy9rNjDk0C1dpI6LiqigFa3hERA
         nvsJB6syXNKsm75Z/3S+H+r2l0kVa4olFHcVOreFef7K4NZWX30FMZ9rtrBuEnMy9cY3
         i/tk+E6bCFo2qZ1A0Q97nLJF8Il9t9AMpAt/jH6jndYTAClWwNAUs2TE7bBy2cF6gEJj
         OWdmSb9zRiTV51/MDFaGB3qbRQnuaho9P94fZvBuIBzYiyF6ArZephSe0Xga4IeFnl4w
         PH6KKBp52mkeV63oKTPpdNPjYBUbF3kUvkb5IgqIsFHxCM96cChwIUx7peUhRd08Y+jb
         jFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=v04j7YqujNbPMmV3Bc20oW5CcoKXOkDE1n9fxUbwpgo=;
        fh=N/txMldgPIWhnSAXSadF1W1xw4mj5KyFf4GcDyzP0Dg=;
        b=ZIKdpSS+v7iRl+QGD/+gpOjkFdaWvz2Rqrhw74FDXql2F1QNhLXO9t8ULcbqhfO8fB
         NHK59FdiGW7j7FczZBHpUNPuSQE674m/jjpCPydRn78eH25BjRZ3U2PW206at+4Q1X07
         U/pxNBBTaO8IyM+ytsZ3Fb5FOBUiA4hqWpKzmlNtbQO1A2sJvuH1CVu8SUcP2lV37qCi
         sg+9bjaQw2+Hay/Kl2KO9y9yV2o7aGSkq7W3qKCkiqi7bUSkfu4wfTvdrYlSpZ+HTYPC
         8xFS8ULHf5R+HU2Zlsq4+fchI0EryWtTcpSzusHMOTQZ9ruOfYNOrgRuGk9kvVfm5Y+q
         fTkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aIzUApZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75acfecsi378479985a.343.2025.05.08.00.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 00:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aIzUApZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCvf5-0000w9-T5; Thu, 08 May 2025 03:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCvf4-0000vj-7v
 for qemu-arm@nongnu.org; Thu, 08 May 2025 03:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCvf2-0000Lu-DL
 for qemu-arm@nongnu.org; Thu, 08 May 2025 03:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746689235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=v04j7YqujNbPMmV3Bc20oW5CcoKXOkDE1n9fxUbwpgo=;
 b=aIzUApZKUAwjasSAwJIoZ0SzNWuo57KR6WLvonWME6HP0p3PlLtJNmWZq7gEajn69jTJUY
 LL7k3W1GDt+qvOxmzb1m0n7PDMBxOP8pxk4pqbC+5yPOe1DQBTlMvwAHcRRl1dlIww7UkC
 UJeC/07qHcvf6y6eTneqVDV53rU5bgg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-3rq90zNjOg-6tVyeztBU8Q-1; Thu,
 08 May 2025 03:27:12 -0400
X-MC-Unique: 3rq90zNjOg-6tVyeztBU8Q-1
X-Mimecast-MFC-AGG-ID: 3rq90zNjOg-6tVyeztBU8Q_1746689231
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9DA70180045B; Thu,  8 May 2025 07:27:10 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4E64919560B3; Thu,  8 May 2025 07:27:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [RFC PATCH] MAINTAINERS: Add an entry for the Bananapi machine
Date: Thu,  8 May 2025 09:27:06 +0200
Message-ID: <20250508072706.114278-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XdJ3WnX42kXW

From: Thomas Huth <thuth@redhat.com>

This machine was still missing from the MAINTAINERS file. Since there
is likely no active maintainer around for this machine (I didn't spot
any contributions from Qianfan Zhao in the git log after 2023), I'm
suggesting Peter as maintainer with status set to "Odd fixes".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c2b9e69add..934e5f08ae7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -722,6 +722,16 @@ F: include/hw/timer/armv7m_systick.h
 F: include/hw/misc/armv7m_ras.h
 F: tests/qtest/test-arm-mptimer.c
 
+Bananapi M2U
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: docs/system/arm/bananapi_m2u.rst
+F: hw/*/allwinner-r40*.c
+F: hw/arm/bananapi_m2u.c
+F: include/hw/*/allwinner-r40*.h
+F: tests/functional/test_arm_bpim2u.py
+
 B-L475E-IOT01A IoT Node
 M: Samuel Tardieu <sam@rfc1149.net>
 L: qemu-arm@nongnu.org
-- 
2.49.0

