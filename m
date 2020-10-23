Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp293076lfa;
        Fri, 23 Oct 2020 00:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxigegEZxeFHXqFeBi0PRFiL0E/3C0FOWBLm3TEV2LI2bCbnhSL3cMkJZj9M81kjC7jO2Fc
X-Received: by 2002:a37:68b:: with SMTP id 133mr930891qkg.354.1603437553054;
        Fri, 23 Oct 2020 00:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603437553; cv=none;
        d=google.com; s=arc-20160816;
        b=Bjb48Kk8/ggNYvbdHZ4GdSY27nsF3oIh1jYLtYAKRj1uZY525J33rLDaahs+Z3l6x6
         4V5YkflE7rF69Ro/F1uGc7gdyxfOBEyIOScjJKAs8ikQStnkohYDJN5r4yHmPgRCgo+u
         i91P41qyM3rDzB2526qTUPVClJG2mNnsacXwzMP5TYng1kWKBzAFHSMAeHJfOcApHxdI
         3zV6PKcficffu2UF4vKNlswPRIltQx6m+pSJ9rYT9O8mflZbYQLaeXJ9kCTxQ4I/wYBf
         Yru0/fZLY5ja1mkarxUZIJ37PDCUbtzbZ8+H8lCe3JtkyjTk/ezLIHE91nG1ww+XRKjq
         rknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8evbe9bsQEdmiUiOgHQvYCGQS4Lgx+OwFxzjg5B1ZbY=;
        b=YTP0/XGDU6jL6c0l+Te6XFJ0gQT68I1J1o+nvSQb5skHwV3Rt93na3uXi3/tVQQdfM
         n9qa0BogkMEWowTZxLYkHlzFbViLDkI4DV7jJ+LaTAeF+S5X9jtqxQfRO1EekYOKDHdO
         htlt2J38RoWH71d6OhiGg4VruKpmsvLQpcXzbLlaWmNsOhNDMSthwtdjdANe6lvO8sSO
         yEUSHrXXDV279a20cqe7tlEPjKzrGfMhbjl8QnnkT4li2vvbRSuDS7vKADMohJPxjOK0
         2C0CLsdtBPCHVUm2rtMdoHoePh9DWYMiEozVy15foEQ9qx7NKM31croLwzXiJgq3aYTJ
         0fKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iLt15Lhk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si405252qkf.49.2020.10.23.00.19.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 00:19:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iLt15Lhk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVrLy-0001K0-Tl
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 03:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDv-0001Qv-S2
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDt-0003pR-VH
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8evbe9bsQEdmiUiOgHQvYCGQS4Lgx+OwFxzjg5B1ZbY=;
 b=iLt15LhkF5zfl1Yc8/GHkPnIj90MLaruCf5rcND94BXUZKmvaoGUqX20okGxjOCqCa8jum
 JfUge9m9yhIiXI4+6ADVKy4FgnLsfgHQKMVpM+YEqFF7GN3OuzhVI5F0PP/pHQSjvyeu9a
 KkVqToyjuoarecg6J9XfzctjJeAJ1K8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-jdNZevZaMDGwmlrnIaE5jw-1; Fri, 23 Oct 2020 03:10:44 -0400
X-MC-Unique: jdNZevZaMDGwmlrnIaE5jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E33C6835B8C;
 Fri, 23 Oct 2020 07:10:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FEF460DA0;
 Fri, 23 Oct 2020 07:10:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 64DA0204AD; Fri, 23 Oct 2020 09:10:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] tests/acpi: disallow updates for expected data files
Date: Fri, 23 Oct 2020 09:10:22 +0200
Message-Id: <20201023071022.24916-9-kraxel@redhat.com>
In-Reply-To: <20201023071022.24916-1-kraxel@redhat.com>
References: <20201023071022.24916-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/mCH91K8pHn

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 5d523ded1282..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/microvm/DSDT.usb",
-"tests/data/acpi/virt/DSDT.usb",
-- 
2.27.0

