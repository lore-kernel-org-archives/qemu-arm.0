Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp305473lfp;
        Tue, 28 Jan 2020 02:36:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqx0e7XchsXxWR1Pe7SGL3v1aSF8DqqRtXvubsx68xMEZNJ5Ke+atg4uUKcxEiTtxu8fIF1i
X-Received: by 2002:a05:6808:8ca:: with SMTP id k10mr2291034oij.164.1580207784019;
        Tue, 28 Jan 2020 02:36:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580207784; cv=none;
        d=google.com; s=arc-20160816;
        b=IuT2uNWhZY/yUz0YMkzZkDzo6EDUlDPV0ESGc1YJu283F48FHuk6uw0XwlHeX1WPf0
         NFdhUfQ9leq7ccEv4zwY1FmYYqnK6LE9/nDWw/B3Elk4uOL8fu/pm86RZxvKyZq5tKdF
         j9xUAYdYKwkViIhMsvLncXW+zrcWTzslOp7y3olrPiYicm/5X2XegquN9n3idK8GuzK9
         YnoCh0s4nX0OovMgCCTpkcp9kqjHO1S1GAruJKZqB4vHZBvuxSE0CFZxTbNeeGfqU/1K
         QO/N6h7RHE1cuSsRmCzCWWsdrEkcZ84xqf+2qxVPvx9E6SJtD7NIYtr/bl8/ChkeePLc
         aNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=78G0omYBZtnhpn3J/dduj+Q41/b0ahCr4I2teh8jw18=;
        b=tBBeFKvxK9YeNxmK5rpMGEq6FJZDq26KznbE987HXJASI4NGB+LY1OE93bACAg1zFj
         xMm3KFNaahkwaw++7BjGODOqcHqBUCGS6mwAhC4q70KC2Rj3ku6yQbdvZDDt+LeQiyWC
         Ac2AxxeZnuK6km9442geHU/1t6edoLFbpMpm4/2kD7bXgVD6OaePy51SGC+ILa8qkyZj
         vaLm2HnogmGG5TwCP0dMT5jkrQUpQPJSf3XQZ8GQjUTjVyqVo7Td9lagsqozgO3XU25t
         hlpOn0k5p94ZreQZ6NR7nZI0WRKmgu9jcN+v1ERlxflq1Q9czFGXbCyHB1FIBsammlc5
         tAUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y8wufg16;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s6si3478540otq.115.2020.01.28.02.36.23;
        Tue, 28 Jan 2020 02:36:24 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y8wufg16;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgA1KgW (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 28 Jan 2020 05:36:22 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60672 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725948AbgA1KgW (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 28 Jan 2020 05:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580207781;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=78G0omYBZtnhpn3J/dduj+Q41/b0ahCr4I2teh8jw18=;
        b=Y8wufg168fsx2zz69IBuywVl65yAc3CR4GfPfE6tpMgYpRGUdGemsjNtMuZl8YvVugyWbM
        9gZhEfUZd1PyVnqaWPi9Y1wStYRO1iVgp5zXCq3s5o4KMW/5WU1Hb9ztxAboU0PgrqzRhJ
        gNXcTk6u849euCuhUVo0eXbyBcj6Ip4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-QHcEkjAAPcSg6VQP7dxRFA-1; Tue, 28 Jan 2020 05:36:07 -0500
X-MC-Unique: QHcEkjAAPcSg6VQP7dxRFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB695107ACC4;
        Tue, 28 Jan 2020 10:36:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 50F401001DD8;
        Tue, 28 Jan 2020 10:35:58 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 07/14] arm/arm64: gicv3: Enable/Disable LPIs at re-distributor level
Date:   Tue, 28 Jan 2020 11:34:52 +0100
Message-Id: <20200128103459.19413-8-eric.auger@redhat.com>
In-Reply-To: <20200128103459.19413-1-eric.auger@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: tVYX7dwhmzcd

This helper function controls the signaling of LPIs at
redistributor level.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- move the helper in lib/arm/gic-v3.c
- rename the function with gicv3_lpi_ prefix
- s/report_abort/assert
---
 lib/arm/asm/gic-v3.h |  1 +
 lib/arm/gic-v3.c     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index ec2a6f0..734c0c0 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -96,6 +96,7 @@ extern void gicv3_lpi_set_config(int n, u8 val);
 extern u8 gicv3_lpi_get_config(int n);
 extern void gicv3_lpi_set_pending_table_bit(int rdist, int n, bool set);
 extern void gicv3_lpi_alloc_tables(void);
+extern void gicv3_lpi_rdist_ctrl(u32 redist, bool set);
=20
 static inline void gicv3_do_wait_for_rwp(void *base)
 {
diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
index c33f883..7865d01 100644
--- a/lib/arm/gic-v3.c
+++ b/lib/arm/gic-v3.c
@@ -210,4 +210,21 @@ void gicv3_lpi_set_pending_table_bit(int rdist, int =
n, bool set)
 		byte &=3D ~mask;
 	*ptr =3D byte;
 }
+
+void gicv3_lpi_rdist_ctrl(u32 redist, bool set)
+{
+	void *ptr;
+	u64 val;
+
+	assert(redist < nr_cpus);
+
+	ptr =3D gicv3_data.redist_base[redist];
+	val =3D readl(ptr + GICR_CTLR);
+	if (set)
+		val |=3D GICR_CTLR_ENABLE_LPIS;
+	else
+		val &=3D ~GICR_CTLR_ENABLE_LPIS;
+	writel(val,  ptr + GICR_CTLR);
+}
 #endif /* __aarch64__ */
+
--=20
2.20.1
