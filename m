Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3109717wme;
        Sun, 13 May 2018 07:35:42 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpv6GdyYt5xrT2MuHPRlI5HnAHn71dUBtmivNg8ST0AnvCd75ObvQZwPzh29LMYtyxoXfRh
X-Received: by 2002:a37:d6d7:: with SMTP id p84-v6mr5172915qkl.74.1526222142512;
        Sun, 13 May 2018 07:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222142; cv=none;
        d=google.com; s=arc-20160816;
        b=YXwkw7yUeQgFg9ZUVqkRh9ZjRDt2ne/vccVr3GhHtaGwWY/RiupdDq1ZufSLXGy0Ya
         pkz60i6ecP34Dn2TCseXExhPFdcPirMgMymwNna5mUOglB2W3Kqb8CifO5BxrM5BtArm
         8bOJmA8buXxJer3n2q8cu7g7HXd71d3dlSupzGKoL1EnCbjMKMInl0Hsv4AhuKggngfR
         2tYsDChqMDWSMtpoSlFQMxOBq34xlZeUiMTHYYMpTcUbKZUyF+uty7X1bY7D8pHW3IsM
         xSWWCBTuwLq5vtTi9OhBIhfYGUOBOHJHT1/+YBBMfxtD8dfeVsn6ZyqXACAnqcLDIvL8
         8lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=lbcigD4LW20j9Kvzd+sIWBZixkhTDss5Y4SZKXf3DzE=;
        b=AqkFVHm/lVA6N4DSUu7CZhS43Qzsmpc3sd2s3NdsbdBei2330sI+P68tHnJuSRjZGN
         N/JY/e+xYK3raOQk/aBAkAD+BdSWuwPQwXXkefRlix+/tMCNVtXMhoNhmiODaI1W7iPU
         6vRh+UWJ6YTSXS5vtSVOGJAzzslGH6M6lOuF/EbFyEuMQMP3FInsHiLBbaexxuAI4zpN
         37tv1cbdlotmGu7LP99rOopegmasMUhVzbuMnWUkezBLhQPNwXOXLegDZylGUzetej4J
         I2I1h40h5OkDlT7jUB80PXEwKpTlPeKKNu3Xytfq5glzOW6fe1RScgQCVX93Zx2EQgmZ
         eJpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w184-v6si454463qkc.177.2018.05.13.07.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:35:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHs69-00080K-VU
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:35:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5x-0007yg-Id
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5u-0006NQ-D8
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58532 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fHs5u-0006NI-9m; Sun, 13 May 2018 10:35:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D099C402382B;
	Sun, 13 May 2018 14:35:25 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4819584459;
	Sun, 13 May 2018 14:35:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sun, 13 May 2018 16:35:08 +0200
Message-Id: <1526222114-5324-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Sun, 13 May 2018 14:35:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Sun, 13 May 2018 14:35:25 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 1/7] linux-headers: Partial update for KVM/ARM
 multiple redistributor region registration
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mje63IexfX/D

This updates KVM/ARM headers against
https://github.com/eauger/linux/tree/v4.17-rc2-rdist-regions-v6

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 linux-headers/asm-arm/kvm.h   | 1 +
 linux-headers/asm-arm64/kvm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 4392955..81ae4e5 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -91,6 +91,7 @@ struct kvm_regs {
 #define KVM_VGIC_V3_ADDR_TYPE_DIST	2
 #define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
 #define KVM_VGIC_ITS_ADDR_TYPE		4
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION	5
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 4e80651..d41f39a 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -91,6 +91,7 @@ struct kvm_regs {
 #define KVM_VGIC_V3_ADDR_TYPE_DIST	2
 #define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
 #define KVM_VGIC_ITS_ADDR_TYPE		4
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION	5
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
-- 
2.5.5

