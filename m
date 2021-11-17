Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp975896lfk;
        Wed, 17 Nov 2021 08:44:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOHjlBECBi+QiKVCRZvZYn7boB9xmkUHkbcSxScesRH+85JkxRQHltS2Oap39B+hmDX4Ya
X-Received: by 2002:a05:6122:ca7:: with SMTP id ba39mr92877924vkb.25.1637167469060;
        Wed, 17 Nov 2021 08:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637167469; cv=none;
        d=google.com; s=arc-20160816;
        b=rAxiWE21s2RHZJ2LgKl0NL9sN+9oSrIrlHunIqB2+jWDxE2nP5siFs+RjQ2TZeGJgB
         9dAYTziDv0VcTc4U+VuDDnF6JGPtEy4L3h0VXeq8pqwOnVky2kI460A2rLRMVVMt3mmn
         Wv/nBIrlnpi3aiEoymVHCQUTePmMjff3sg2whnXtD7Zghk6cOfefBh9XbCIoh0mGjRWn
         SA1OQmMor5b2N/Ve3d4p3ksYhqd/34B+w+ewv/gTdNdEQ7VZx7WdwmPBLuv+pUe+K/Ff
         3T4duqpJpzugm6P5zGOICyraqWLNdXUXqWTPMu+yuwIjiEfwzYW9ebrq/P8eHR+5UCpk
         1hwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XGpMwJw1PHYIcQxJSbkz4subx26/DcZw4fXuCyXFOr8=;
        b=DXYB5IZYP6ypYu+7muKqqf3ad/a9h9I+POEbM0g80nSPupQfjOWv7ivjmSYg6K9o/m
         kWBfzb0oij2K4Ugyi09onw7j67NK8zTqFDReHFthGn2Fbum/rV50sf0AB/zQyfyQNZPW
         CgeaHXmdJtrVD+m5onwjMJP+bCgJfScb3X0j+cMdHHJSpY+mzW+UR1FeOoMVp3oxPB5f
         p4bWG8uARgCSV2k4xAniysGvSN3jybnH23fj8PIvQGeybmNNjFccN/GbCLYTETGS4wkk
         yXO5K+qrjrOlAJixAxjtQazM28kci0cUFgVm3Hbwg8BG1F3kY+0cscsvFAO00MFgrxUE
         QBZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pw0+K2TW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si473467uar.70.2021.11.17.08.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 08:44:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pw0+K2TW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnO2u-00011d-F1
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 11:44:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtN-0003ch-SK
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtD-0008AC-OF
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGpMwJw1PHYIcQxJSbkz4subx26/DcZw4fXuCyXFOr8=;
 b=Pw0+K2TWsnwc8c/+q+BgwA/Kw3ZSv3GDgC12RkILTNB48eqUhEk6TqEQnMgUk+FKtrr64n
 V+Q0qFXAz3FM5mm1Eir4Dh8+HYgMwSJF+N2ziAvRElVEG6+ElFV+thU2IQV/SS2cboANIQ
 XQkrotkPjxar7caT+OgsmevWWuEbPs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-123-aKRgiaUNOcWcNH8zphsTvg-1; Wed, 17 Nov 2021 11:34:19 -0500
X-MC-Unique: aKRgiaUNOcWcNH8zphsTvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A84919251A2;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD99357CAB;
 Wed, 17 Nov 2021 16:34:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 862BF11380CA; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/13] hw/arm/imx25_pdk: Replace drive_get_next() by
 drive_get()
Date: Wed, 17 Nov 2021 17:34:01 +0100
Message-Id: <20211117163409.3587705-6-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AKf57TDXGmiz

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "imx25-pdk" connects backends with drive_get_next() in a
counting loop.  Change it to use drive_get() directly.  This makes the
unit numbers explicit in the code.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/imx25_pdk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index bd16acd4d9..6dff000163 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -123,7 +123,7 @@ static void imx25_pdk_init(MachineState *machine)
         DriveInfo *di;
         BlockBackend *blk;
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, i);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         bus = qdev_get_child_bus(DEVICE(&s->soc.esdhc[i]), "sd-bus");
         carddev = qdev_new(TYPE_SD_CARD);
-- 
2.31.1

