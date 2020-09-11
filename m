Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2191660lfq;
        Fri, 11 Sep 2020 05:19:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyGb3+/BDeJItCuKhhg2PrulRVsWoFJS+cBrpEWyyX80d1gKCi0vn6pz8KYigsSQjF2nN9
X-Received: by 2002:ad4:4891:: with SMTP id bv17mr1698591qvb.23.1599826743063;
        Fri, 11 Sep 2020 05:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599826743; cv=none;
        d=google.com; s=arc-20160816;
        b=uzIP97kaHA7WMxBTLfJSOVE/laWHjI2nCj70gpuSKf3TwTRtnL70X3XhGp+2S0MhbD
         GkQ8egDZWZ3rryfb36mEZblq20owjc4iBrmtbQlLkuHemSP4qTwoXvwR8HCQMgk4C0/K
         YraYDWAzWLcv4ERHZ+o/eL6bHT5bPEApR9qBiIO0wTESRpx8t2keAKK9r/t8KTXIdVOR
         fyzMUW7BuDmiOLtIXxfCk/6DCuDgvXNPU9BKn/JAdb+LwnsMBhWFGKOZrLvJunsQ8mNv
         UnuJsxAPVR8KZicq6sCJHFD5oG8eQuCS/3L87NKEXmKXZqNG0FukFN07jm5uRt4B7Uxe
         AiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=0sonYEoIK5vfUm9HV1fIji2OCjDdFDC+pHgrtmXxuUc=;
        b=oETUcE3Lcm0g8nQ1XQ5PF4pRuzrXRXnqykwE7co/sbrHCifN9DjsuGzWDDf8MNtlpU
         ALfYE7WlZmuG/8wWY9Yz2YB8mv8B3If+lwEEUFOT9l0s2MG9SuVPEuI2JA0592qR2M2C
         m49YzSnyq4VKev4BHe8M9q4/+VYFovRBQXrsBg3YROGNhAeLgm0T37rDVuy+hY+R1iqK
         aUP+VZBrhqut0jgDZoqsJiSiTa1IKUVQgfQ2QtKi2jKpyDI4zw9czloAhV3ZpaHK1yxd
         nJ1SKAU1z/eYsvVF8MNOpvwVihHEL9rUZ/6Tr/3ky7gNE9LcSd1nYJaIoIji6kRn80wL
         JhBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E3BgTvvx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si1143028qki.20.2020.09.11.05.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 05:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E3BgTvvx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGi18-00027U-Fh
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 08:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGi10-000275-Ml
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 08:18:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21774
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGi0z-0007RV-0k
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 08:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599826731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=0sonYEoIK5vfUm9HV1fIji2OCjDdFDC+pHgrtmXxuUc=;
 b=E3BgTvvx8scykg2lfjs96eP1pl/hKfsyyZ70OlGqmfpgfcBR7qiXnXsj9NNGK66yFQVcQj
 AzoiASp8GmwQuLvnJqWgqmOfp9rwv7DrsegCmldYji46D+bPespuLSZTc5IP/Gm/kG7Igm
 cBwwvmf5ClwXQ+4UH5LAt8m1N+PrcyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-S6Q7ZHrENDKE6GmYZaanVQ-1; Fri, 11 Sep 2020 08:18:49 -0400
X-MC-Unique: S6Q7ZHrENDKE6GmYZaanVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85C228030DD;
 Fri, 11 Sep 2020 12:18:48 +0000 (UTC)
Received: from thuth.com (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2755C7E8F1;
 Fri, 11 Sep 2020 12:18:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/pxa2xx: Add missing fallthrough comment
Date: Fri, 11 Sep 2020 14:18:44 +0200
Message-Id: <20200911121844.404434-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:40:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vT3Ah1H7ErKW

Let's make this file compilable with -Werror=implicit-fallthrough :
Looking at the code, it seems like the fallthrough is intended here,
so we should add the corresponding "/* fallthrough */" comment here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 76975d17a4..c1f45b2adf 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -443,7 +443,7 @@ static void pxa2xx_mm_write(void *opaque, hwaddr addr,
             s->mm_regs[addr >> 2] = value;
             break;
         }
-
+        /* fallthrough */
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad write offset 0x%"HWADDR_PRIx"\n",
-- 
2.18.2

