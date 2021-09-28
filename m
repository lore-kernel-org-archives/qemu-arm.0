Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5091354lfp;
        Tue, 28 Sep 2021 10:22:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIFbcmTHWNCNV4FE+YqXpk4P3X3LVyRWFg+f6AryWChl4i7Gf5WI/JWwGqMIrhpjVimNLp
X-Received: by 2002:a9d:3e4a:: with SMTP id h10mr6080154otg.171.1632849742166;
        Tue, 28 Sep 2021 10:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632849742; cv=none;
        d=google.com; s=arc-20160816;
        b=VnK+dTbsGWKqcN4aLeYnIJSN85R95C0c2fwA/Qu712K6QgKybi+4OUQdqZ//WprT5w
         koTW0TewFgHeO1kJYnbs0E4/sgLGAT33gcCu5WiEN0cUD01K6CqXcbMMN1WltUX43GrV
         2YxjNNceSvai35TO290BEI4MocNsQOBgDqq05s2Va4BW9qOMYiocAuMsBX1/xe/C/G+m
         stzlINQVLfA2TxydjfrzYx3YmeXmixFFNSUAUJBTSfrEl88c0CtpqAb6e21VBJAYBvUj
         6IcAM3Il3fqmyzmoxOH+5xXp1PcQ/o2yt03TyQYThWWjcx+LgCm1WfvZE0U41yW9il24
         Dfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ra5JVFmLKWSbFjZK3Fr3W1ySvwBXj16KO5md3YTpAAY=;
        b=s6Xmo/PW0ZNMCe0ls4W293ndYu55HGzSahwyfUdGfWkhCMTr4tJrl1XfX6WPZpwdeH
         z/WQQUWooO/RNBdQgZgzOCPPoKt3LWIkK6ru9CrPZUdOqtvZ1P9+03FT2gDWSjrL2YwX
         mMK2AxpTxUvlqE2jOlfCf0UFaMnW/G4SLMA4a6N0Hv7c4wg55BuhOPwKu3jbpfRECdyM
         oaGx06rHswBCLOER3u8q4yJg+CVifyPtRz002LtozpMXs6JAXUMBh0uk0fvwOKV9jYh8
         lnNAxWlpUYHRvXFe4iomU1bIIE6SWr+GmlkDe5VY9Gl9V92eNEXZFyYZTZiDzzTAnqDn
         w66w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CRChKk7D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si11399146uaq.7.2021.09.28.10.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 10:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CRChKk7D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVGo9-0000Ep-EK
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 13:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGni-0008GC-Fx
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 13:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGnh-0002Qz-0r
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 13:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632849712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ra5JVFmLKWSbFjZK3Fr3W1ySvwBXj16KO5md3YTpAAY=;
 b=CRChKk7DHK+VN9juKh6WhAh5Wmdt3s0RgAZL4Y+3pKp+aG6/A3w2yt2sPt7dpXaEanC1th
 xuO/Ta5h2B6953KP6Buz2F22NJV/iv/NOK0dNt0mlZWH0sbnHwTUkkK+KhxJzGVhcHDk5R
 WDnP1NsvVMn67Q7/ZemQ94TZzpfM16c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-55e2Y2MeNLKZmYluOUlPRA-1; Tue, 28 Sep 2021 13:21:51 -0400
X-MC-Unique: 55e2Y2MeNLKZmYluOUlPRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CF18CC621;
 Tue, 28 Sep 2021 17:21:50 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD6F85C25A;
 Tue, 28 Sep 2021 17:21:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [PATCH 1/3] tests/acpi: Get prepared for IORT E.b revision upgrade
Date: Tue, 28 Sep 2021 19:21:31 +0200
Message-Id: <20210928172133.79665-2-eric.auger@redhat.com>
In-Reply-To: <20210928172133.79665-1-eric.auger@redhat.com>
References: <20210928172133.79665-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HpvhL7Wzp6JD

Ignore IORT till reference blob for E.b spec revision gets
added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..9a5a923d6b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/IORT",
-- 
2.26.3

