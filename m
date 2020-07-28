Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp682118lfy;
        Tue, 28 Jul 2020 08:13:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0Kq40y4A3/WCSn6LuL1EBdXcOr4QEnRldO6t7MqnXT4uc5rxeNW4CfL77Tyv/GGz5A6Sx
X-Received: by 2002:a25:aba2:: with SMTP id v31mr30397008ybi.138.1595949181796;
        Tue, 28 Jul 2020 08:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595949181; cv=none;
        d=google.com; s=arc-20160816;
        b=DC5aFXyVCMkcvPLInm+hoiffwjyF++uf7EmXgmdNxPbPebV26PhwBQ6nmQrnrneA5I
         5JUhtVOLGLpfEC/j1FMQq9PBG8S8/no6S0/BETFsO0RPXLImMRWmYEsSmGPz0exxqZcL
         U+F87vSrW6iBYKrNHc3MR/WRPvlVC8sXUxMlqKNSNblKXMX82omGVCLTg/OGNUnrOL/z
         FMfc+mZDbXf1sldwrb8ufP/PEDsRhidJvifeg2i4uxkfN1pDx2vgei3MjS12vFGlXUdf
         NfFUOk7wHYz51wr4zoXLxzWVDwcXhQyk0xAmOooiT7cP18dyczKYBy0TZz7ZtCPPSgs0
         Y4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kzkZbHiaAXlpXHNAvFChVDMnSS9mfiTet/N90izk+PI=;
        b=s2prKpyCTDgsir3rLBFvYxJgledoPMi3vG+FltPxjbDOHjHkYOuSO3DHbxOLYwL4Wg
         OKUaUazrx6FmWZn+F11Q49uHmcxFbCFStMEntpWq991JnKR7WjT0bxuqIAMXf7G8pUXT
         iewhFgC/wJIM9l6aB3kfthpKQmZXMArURavUNgEzhQfOs8DYrxs0qPd2CkElY/3lD+AI
         7XYQB7gi/SV4f/aOyG8VnWI/sqR/oe6T/s4KkjoD5zT1AY7p3j9wk3CZuGzkoLd+EiYG
         vC1IwXmgIBCfhrTsx7RVf8kpIWJKp6H3Gk9RP4C149JcCzWF4qbOG7/0iHqPWVJCKHPz
         yZWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fPIlicee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si13200698ybt.173.2020.07.28.08.13.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:13:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fPIlicee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0RHp-0003yk-5O
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RFT-0008Rj-Lf
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:10:35 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43945
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RFS-0007xI-4F
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595949033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzkZbHiaAXlpXHNAvFChVDMnSS9mfiTet/N90izk+PI=;
 b=fPIliceejnf4wZUj6reSPf6yG+XJX5WLA23pxAPVjMQmbwNbvvfwJpIAlEvdxBq1xHN8+x
 aGc5Pam1GspmD9uzoOl0pAy8TgnTzTZUY408jk03C75n+psPyZwUq/ZPjFYoxyK435YNob
 PX7SG8U32cVXa5A2uKVY/UyHDQcG8D8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-iF5EPUm7MAKv6CUSHc9UVw-1; Tue, 28 Jul 2020 11:10:31 -0400
X-MC-Unique: iF5EPUm7MAKv6CUSHc9UVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6042100AA28;
 Tue, 28 Jul 2020 15:10:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AE085C1BD;
 Tue, 28 Jul 2020 15:10:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH for-5.2 v4 08/11] hw/arm/smmuv3: Fix IIDR offset
Date: Tue, 28 Jul 2020 17:08:12 +0200
Message-Id: <20200728150815.11446-9-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
References: <20200728150815.11446-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fzYQN4RlpINq

The SMMU IIDR register is at 0x018 offset.

Fixes: 10a83cb9887 ("hw/arm/smmuv3: Skeleton")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 5babf72f7d..ef093eaff5 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -63,7 +63,7 @@ REG32(IDR5,                0x14)
 
 #define SMMU_IDR5_OAS 4
 
-REG32(IIDR,                0x1c)
+REG32(IIDR,                0x18)
 REG32(CR0,                 0x20)
     FIELD(CR0, SMMU_ENABLE,   0, 1)
     FIELD(CR0, EVENTQEN,      2, 1)
-- 
2.21.3

