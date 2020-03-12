Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp800026lfc;
        Thu, 12 Mar 2020 08:44:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvnrQRI4tAjzaY13xP2GOtqSudlrZSnTQCyWfQ0hIJuSOM+flmsK9NfCIfLyRnjQKdTJ9h9
X-Received: by 2002:a4a:83d3:: with SMTP id r19mr4521045oog.26.1584027892572;
        Thu, 12 Mar 2020 08:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584027892; cv=none;
        d=google.com; s=arc-20160816;
        b=tHQrWRJQBqxbyjV9edrqraEg+KZjnuX+iECCfDxmNrvE2falh+ecCwJEkLXuR1i+jx
         9EAHGA5kBwsIl021jJH/nnX+ogzqz/slrhVjhtdMdhYVNOCCMXFnsifSpISoi1k5O6Av
         AgTvEVBiqTbyTkf0+regcF6zcCfOetF94kKC8BlGk9WZnbCXbLfSD8J4JhBjXYSHb90P
         QwYf6slZcOPHI9zEMcAjKo8jyQKl1eL0vDeDf4J2OqSpsff0M9GOltClzmtF/htt9tXu
         j+F7mJoXq9dk3vjwHTGYvVNyAN/o0gqPqf4q3XUBlnHxpeYhpc8Gl/N+k9klwz7e4sIj
         4utQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=aafjbtXSHBMixYKwM8RWXU8749gRXQWdvAvew/5369c=;
        b=xuu2HX7xkrZGxcQLHSuXLEzAC9KX2SWbAjshK7vVZfryXQP90Nj16hOKob3xO0E0RO
         a20YhUsW7RAeNCrkM6uEKwdPuuIj9rk7JdFtxxEcp9HbQN9noZGRTyyAcRm6U2AzF7Tj
         WKzqep+VA6BFdGVSL+9gaRqLsxeO2mR5nu0C2wnQniuh0N2FGoZPbnRx7Idxzps0X45Y
         e87jGrps4tMLqKZVNa780KXkCbNr1spN6PzhXFbDr5q2/YbT0K8/n4Hd4w76nnUY+1p4
         rfYWxjKxVZzm7fq4+6T75lrl1/xnEiNGKGEddjaYtmHcP2RtePe94XMwFW0f2i7WWmrL
         oSGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dF2NeWyt;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c21si2835424oto.137.2020.03.12.08.44.52;
        Thu, 12 Mar 2020 08:44:52 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dF2NeWyt;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbgCLPov (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 12 Mar 2020 11:44:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55257 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727790AbgCLPov (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 12 Mar 2020 11:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584027890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aafjbtXSHBMixYKwM8RWXU8749gRXQWdvAvew/5369c=;
        b=dF2NeWytV8hGE2QZelkeBtPPQhPPnNI1/aTuEwdbKy+ejcgZG0wU8i/Ogy/Jax5cd57hwt
        2s9mmDMvlxWQudGCYEuxQ1zSHDVwraOqnzRgfJG5e6HpLyJc0QGo4nN7pliVkxZDg/rAWC
        BRqSP3mjpT+llVt/eyGE4gulaLi6+dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-YXlDPYgvO8iokUUPdlF-6g-1; Thu, 12 Mar 2020 11:44:48 -0400
X-MC-Unique: YXlDPYgvO8iokUUPdlF-6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68109802CAD;
        Thu, 12 Mar 2020 15:44:46 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DBB885C1D8;
        Thu, 12 Mar 2020 15:44:40 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH v3 11/12] arm: gic: Introduce gic_irq_set_clr_enable() helper
Date:   Thu, 12 Mar 2020 16:43:00 +0100
Message-Id: <20200312154301.9130-12-eric.auger@redhat.com>
In-Reply-To: <20200312154301.9130-1-eric.auger@redhat.com>
References: <20200312154301.9130-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Jek0kKJtzsxW

Allows to set or clear the enable state of a PPI/SGI/SPI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 lib/arm/asm/gic.h |  4 ++++
 lib/arm/gic.c     | 31 +++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
index 922cbe9..57e81c6 100644
--- a/lib/arm/asm/gic.h
+++ b/lib/arm/asm/gic.h
@@ -82,5 +82,9 @@ extern void gic_ipi_send_single(int irq, int cpu);
 extern void gic_ipi_send_mask(int irq, const cpumask_t *dest);
 extern enum gic_irq_state gic_irq_state(int irq);
=20
+void gic_irq_set_clr_enable(int irq, bool enable);
+#define gic_enable_irq(irq) gic_irq_set_clr_enable(irq, true);
+#define gic_disable_irq(irq) gic_irq_set_clr_enable(irq, false);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_H_ */
diff --git a/lib/arm/gic.c b/lib/arm/gic.c
index c3c5f6b..8a1a8c8 100644
--- a/lib/arm/gic.c
+++ b/lib/arm/gic.c
@@ -147,6 +147,36 @@ void gic_ipi_send_mask(int irq, const cpumask_t *des=
t)
 	gic_common_ops->ipi_send_mask(irq, dest);
 }
=20
+void gic_irq_set_clr_enable(int irq, bool enable)
+{
+	u32 offset, split =3D 32, shift =3D (irq % 32);
+	u32 reg, mask =3D BIT(shift);
+	void *base;
+
+	assert(irq < 1020);
+
+	switch (gic_version()) {
+	case 2:
+		offset =3D enable ? GICD_ISENABLER : GICD_ICENABLER;
+		base =3D gicv2_dist_base();
+		break;
+	case 3:
+		if (irq < 32) {
+			offset =3D enable ? GICR_ISENABLER0 : GICR_ICENABLER0;
+			base =3D gicv3_sgi_base();
+		} else {
+			offset =3D enable ? GICD_ISENABLER : GICD_ICENABLER;
+			base =3D gicv3_dist_base();
+		}
+		break;
+	default:
+		assert(0);
+	}
+	base +=3D offset + (irq / split) * 4;
+	reg =3D readl(base);
+	writel(reg | mask, base);
+}
+
 enum gic_irq_state gic_irq_state(int irq)
 {
 	enum gic_irq_state state;
@@ -191,3 +221,4 @@ enum gic_irq_state gic_irq_state(int irq)
=20
 	return state;
 }
+
--=20
2.20.1
