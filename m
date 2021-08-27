Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1519820lfb;
        Fri, 27 Aug 2021 05:11:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAysalvUJBfDXXlbiiUXrG9pQXaaCQnJKV1kFlX9HjH88EFQkrb8OgT50qGrfRcsf+Ms+O
X-Received: by 2002:a05:6402:5247:: with SMTP id t7mr9756806edd.25.1630066261038;
        Fri, 27 Aug 2021 05:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630066261; cv=none;
        d=google.com; s=arc-20160816;
        b=B7LCIzzEMSaNXWWN7bqDiK1dergd8iFvLrGjT7yet191zqQbk/D4l0XIqflspLlacZ
         VuGGHcrjYUZ1ynXVFS2HT1VsqIskHSlbfd8TlXKkRHjz0Dp1xaNpoiD1YLZwMC4ojCJ/
         LkpNPTeFR/AmGEcO0Pb9FZyylMqdaSjdK1ujAiYF4I7ESc0mtCvljfG3+NmQ587Huffg
         uM/QC8ahsTx4//l6xPkkucBX0eLqsxVpWVSWeZpmJefpDVQb1dNIskDEXaloH7aJDc2A
         R1ls0P/J/kqWOPs3szqSu0oN7FSsZI9jB4vF+pphVYScl4266mkEtSvsr63LgygPO3Ep
         8U6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Va1kjsBc/tr5Ri5nGD7xsIm096GrN5gBEBaqydVcVC8=;
        b=cr70D8kI4z0OQxvdMi/jZTv8kdUBFgEiWnort+DpaLp7OrWwx6mOecyKePVtERDmWh
         4p/xBLuk7r8qJSBFbpvusjZ2NwLDOMDn5PY7kK124kFzFtRYJ890jPATiAD1nSgmCX3p
         NKZa9NpuRNkJSAaaLYwVoR0vnpQRo3BkApgqyz/wFuuHKkiW3WWqf+FROUYtPJvduFaa
         UDB7bCK6/zeeVRMDcAJV7ilJTO/v6qOPoc2OFfUkXCkvN9b2DtdIpcwwvr57LRWSnab3
         HlxqWGeQoGRpdFYbw+eM1v3YwwVRSSH/7Ae65AIAAtBzDdjDgf2JT3Kal6QGih2DJQ8U
         EAWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EpBOCmxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si549360edr.413.2021.08.27.05.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 05:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EpBOCmxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJahI-0001qX-62
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 08:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafj-0008DY-Ns
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 08:09:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafh-0004g1-3R
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 08:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630066160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Va1kjsBc/tr5Ri5nGD7xsIm096GrN5gBEBaqydVcVC8=;
 b=EpBOCmxRc3nbPD8DOm1JrjETRqJoAcXs3wlV9czL1rIpzodl06/j1IKk9oqHp2zBqnE6AP
 Uub41yixbZUvR3LqELBOxDRLp+o3I6KL5I2wbYKAtWI5ICEXtBohMst8SXUX84jOlCJmIT
 dg0S8NbaSA4Z4rL74Z/rYs5XI9p9CiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-SkESUGPAOXGO2OCHYylVWQ-1; Fri, 27 Aug 2021 08:09:18 -0400
X-MC-Unique: SkESUGPAOXGO2OCHYylVWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A0A31082927;
 Fri, 27 Aug 2021 12:09:17 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D68895FC22;
 Fri, 27 Aug 2021 12:09:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] dtc: Update to version 1.6.1
Date: Fri, 27 Aug 2021 14:09:01 +0200
Message-Id: <20210827120901.150276-4-thuth@redhat.com>
In-Reply-To: <20210827120901.150276-1-thuth@redhat.com>
References: <20210827120901.150276-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IgtU5HgG585u

The dtc submodule is currently pointing to non-release commit. It's nicer
if submodules point to release versions instead and since dtc 1.6.1 is
available now, let's update to that version.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 dtc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtc b/dtc
index 85e5d83984..b6910bec11 160000
--- a/dtc
+++ b/dtc
@@ -1 +1 @@
-Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
+Subproject commit b6910bec11614980a21e46fbccc35934b671bd81
-- 
2.27.0

