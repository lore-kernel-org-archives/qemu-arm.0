Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4793640ejc;
        Thu, 12 Jan 2023 05:53:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzWkM3PSXab230+OQ8HEYk4b6c23JPAelWWBkAuHaac8cBmWB6VCbI3cxe0kov5noH+fjX
X-Received: by 2002:ad4:45b2:0:b0:532:2fd0:5932 with SMTP id y18-20020ad445b2000000b005322fd05932mr21387022qvu.30.1673531639483;
        Thu, 12 Jan 2023 05:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673531639; cv=none;
        d=google.com; s=arc-20160816;
        b=FgwRCY+vcKprYKURHQcKTkzItUV/dKyPq7JGk2rduFuAlj2I40jTWgrWYJyQM3fpbc
         mupZadE8HelnEXCw6Twy/k5TPafTDGC9Vr+iknh7H4lFj7WZeguQuh0EAfPbXIVQYDbw
         xr7EKzwvsP2QemRcUk8yV6AR3UOoCxKD7lZ3JRALjaO5VQ98x4JiuleX0+joKTBtlwT/
         aX/kvXCHb6bNNZTxYpAeFdgE/uqp0d7qN5qsMuzPNcevgwm+7T/QV2R5NaEq6xU/pd7m
         VKxJ0bEfXy2yDJMrlkNelD/2EkYV+XUU+Vj2iPy0AUWyNsVm+QlI5kv0z+5SfhKxqt2I
         IxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I2MazIJlglkEzIo5AdsUjj8BWJ7NmMe7Yj6yOWjXLWg=;
        b=OCPQZphG0+DffMiiezV5eYMLi05WeSNrut76KL9k+vitQ8Wc/OXxVUCTdJdgxC/W8A
         ngahZ3dw+6tGt9eglnBdt35TNJ1lGsdYysAby6tIAZlGliXt9KJ8mB8g0zzcjPEILxgv
         xxEXuGtgLEsAtT8z6SGOUr6b+B7NcZ9w6/k5OvQl/h3dd0rldMw3sAFG7Ulq0fRwbTsj
         FUYTZ0asO9fc8L3HZpwqGitoRkZtcIugNSr6zLUsK+UcMIN9J2+FdE5QhtacLLClnfFG
         kv8MtBBUNxNPTP4cki7o+sRcY0OpRZK4C1+hA/+Ype6vNK7Gf8GBH+FW3I9IhVEKRaQD
         NW3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zv8QhS2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020ad45c42000000b004c62f35ea86si10743367qva.273.2023.01.12.05.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 05:53:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zv8QhS2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFxxk-0001jt-OP; Thu, 12 Jan 2023 08:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxd-0001ZN-M9
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 08:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxb-00037l-Ih
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 08:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2MazIJlglkEzIo5AdsUjj8BWJ7NmMe7Yj6yOWjXLWg=;
 b=Zv8QhS2Wuf5ks1RpTfuI0nbNDh8aNh/wzJyuc/OcrSCDabkhV/GPzfN0GSdOyuMaH07CyQ
 HqwtcLZ+3LMqEScshaC+bWWqRYJ0FPvYDnKC+3Y9XCe0ydBGFfoyIaoxFBRIrCFbneCwoD
 ut6dk5mrsP2SzvZRSHs50V9S2r1m3XU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-v_BMhGuCM4yNYsR-HDmVFQ-1; Thu, 12 Jan 2023 08:49:37 -0500
X-MC-Unique: v_BMhGuCM4yNYsR-HDmVFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 331C6811E6E;
 Thu, 12 Jan 2023 13:49:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6269F40C2064;
 Thu, 12 Jan 2023 13:49:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH 5/7] hw/cpu: Mark arm11 and realview mpcore as
 target-independent code
Date: Thu, 12 Jan 2023 14:49:26 +0100
Message-Id: <20230112134928.1026006-6-thuth@redhat.com>
In-Reply-To: <20230112134928.1026006-1-thuth@redhat.com>
References: <20230112134928.1026006-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 30woskd5n+WF

Seems like there is nothing target-specific in here, so these files
can be moved to softmmu_ss to avoid that they get compiled twice
(once for qemu-system-arm and once for qemu-system-aarch64).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/cpu/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 9e52fee9e7..e37490074f 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,6 +1,6 @@
 softmmu_ss.add(files('core.c', 'cluster.c'))
 
-specific_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
-specific_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
+softmmu_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
+softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
 specific_ss.add(when: 'CONFIG_A9MPCORE', if_true: files('a9mpcore.c'))
 specific_ss.add(when: 'CONFIG_A15MPCORE', if_true: files('a15mpcore.c'))
-- 
2.31.1

