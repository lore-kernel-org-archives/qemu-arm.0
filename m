Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp701401wrx;
        Mon, 1 Apr 2019 11:18:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxCi5W27b6o+MSoRaDGEY0Xd0rau8gqNOcX7+R2+EMT96Ws3BBuqwWvHy+gscKnyj8hlIR
X-Received: by 2002:a0d:e24f:: with SMTP id l76mr52687525ywe.414.1554142688596;
        Mon, 01 Apr 2019 11:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554142688; cv=none;
        d=google.com; s=arc-20160816;
        b=eYUkF+STE5U9WP4zS8+BSy+uOrKllkQ5PZZPUf0wr39q9jQL+OAcOfgKhOT2qzatSy
         epYiFnwuYK6HlktLr4u7rZ6z3BumOjFDudh0T/FqxxvWFfjiN7Z9GVVyKIcDAnjL9TPZ
         J+wGrqHaH59nkl1z3t027Gr/tnKpKL61JtO6XRhXKdKyJg6U59PI7qOMsDBMNdco21pJ
         Q6cgaUt2XGEv2xMjpir60QLFyHTLe0SJVJLd/Ow1KEqPrSzA1K0tt06U4g1WcG7tdphV
         FX2+8IkehfatelfIfWZ1NE7T96j+yCDt5qaVaotHXm1WRCeMVAhvBJwZg7tPFm46Y3mj
         lefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent
         :content-disposition:mime-version:message-id:to:from:date
         :dkim-signature;
        bh=idHxJz9UeQL5kzUO/LqzANlFAMEkVrcPe0/syvjf2Hw=;
        b=mujhayVyMvmgt+IDkItkTG4X6Ts4VfnKYM4Dv+bB1l+4dqR+yE6cxPz7RoAUfE2ODE
         pMoEW5/02dCRtzzEPUYOuxvh5o7AUX7i7DHZEPimNgJ/gwHe9wF7wBy4GbK7/oD9B41o
         Q6R/knr23T6wsHkUMS7y+tzHwHT+3+QVIq8O+ihPCfmHpDFwbjy/Et837DqC3QQqdEN/
         880peBX/rXlCk3rtqy3Ctk9EI6f06uJbrF9tRpxlFTFJEjuWGGqWdWOHikruexS3glwL
         sefnTPkR78oebyrvimSZLJDvZVjgXGabNLtlqbu9eHCyw+QBDnHz6b0ApLEUl7DHML+r
         ruZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ETpdskLu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si6730202ybg.35.2019.04.01.11.18.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 11:18:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ETpdskLu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:46464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hB1VY-0004Kb-3R
	for alex.bennee@linaro.org; Mon, 01 Apr 2019 14:18:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eroken1@gmail.com>) id 1hB1To-0003PL-GB
	for qemu-devel@nongnu.org; Mon, 01 Apr 2019 14:16:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eroken1@gmail.com>) id 1hB1Tn-0002BE-Gq
	for qemu-devel@nongnu.org; Mon, 01 Apr 2019 14:16:20 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <eroken1@gmail.com>)
	id 1hB1Tn-0002Ap-5z; Mon, 01 Apr 2019 14:16:19 -0400
Received: by mail-wm1-x342.google.com with SMTP id z24so437776wmi.5;
	Mon, 01 Apr 2019 11:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=idHxJz9UeQL5kzUO/LqzANlFAMEkVrcPe0/syvjf2Hw=;
	b=ETpdskLuQs3yD1zie2vBD1HWih4vaLl2WEJ+G0n/XgC/UBpruRK3nKUzqTmnYZxYfW
	hCLmUno/tPOiMgnGMFz1/EDSTLlLly6PpPim3e+0R0mad/MuxREQsCkdA0G3sWOWhpd/
	6gVe35iaC/zO7DfLhh0wQFhGWcPmDf09akR5w6CJhg9zX0vHNmf4tRO6SYKjFM3nXFOk
	oB8GBSSyW/sazs2cJRb4Yl5+GjK74vIUf/NtgbjSxbX8Lp8oqUkT7qTG6ftiAyTEtU0j
	5PXqBqpuJs3GcqJkDL7irguFYzCqjcPv+75Qzv4LUfweluxORQUu4obe2XnbY71LyHyH
	/LaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=idHxJz9UeQL5kzUO/LqzANlFAMEkVrcPe0/syvjf2Hw=;
	b=a59T2EIvICzDC9SSjfcxNl2aKegdY+WjPU+SttaBjOtFsNqsNDhX8pkHRDP5y0cavr
	c94f0FpVQV4k+wqfWIYc2uRBHZb050aWHkY0MPXbqpRnZfxJ04s2eUPxqPqgQxKal5Gq
	rwpUEhRfFu7WhAu0oatUHTQ5Cz69sdU11Ajlhwr3aet6s86sxKAvgUHQ4nHvs+dvuzH6
	MGylORUYGBYVyLE3a5QxFTilyASeQSuTuRZ97f98m/H4cUegQjBxRro2YVUiD7in+li/
	x20xjRIaCWveVPuIizSOIjKqXnhEeS5zhoKM4G3xnMkqpF7+fzO06OQuvbXTxEMHsR+R
	2mBg==
X-Gm-Message-State: APjAAAXdDseuz/+2n7ONUKt4qwbQ7FtLrkanfUJGCFyfvY7M7yQ5H1Ig
	lyqU6st4IrvX7rn/E0xukAk0M8x4x0I=
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr662706wmi.57.1554142577372;
	Mon, 01 Apr 2019 11:16:17 -0700 (PDT)
Received: from erokenlabserver ([41.203.78.50])
	by smtp.gmail.com with ESMTPSA id
	67sm10935019wmz.41.2019.04.01.11.16.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Apr 2019 11:16:16 -0700 (PDT)
Date: Mon, 1 Apr 2019 19:16:21 +0100
From: Ernest Esene <eroken1@gmail.com>
To: qemu-devel@nongnu.org
Message-ID: <20190401181621.GA31851@erokenlabserver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel]  [PATCH v3 3/3] Categorize devices: iommu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rLRBFWdqUAvO


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Set category and description for iommu devices.

Signed-off-by: Ernest Esene <eroken1@gmail.com>

---
v3:
  * set category and describe smmuv3 as suggested by Eric
v2:
  * split into separate patches
---
 hw/arm/smmuv3.c       | 2 ++
 hw/i386/amd_iommu.c   | 2 ++
 hw/i386/intel_iommu.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8c4e99fecc..d5a3df047d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1463,6 +1463,8 @@ static void smmuv3_class_init(ObjectClass *klass, voi=
d *data)
     device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
     c->parent_realize =3D dc->realize;
     dc->realize =3D smmu_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc =3D "ARM IOMMU (SMMUv3) DMA Remapping device"
 }
=20
 static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 6eabdf9917..4a4e2c7fd4 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1601,6 +1601,8 @@ static void amdvi_class_init(ObjectClass *klass, void=
* data)
     dc_class->int_remap =3D amdvi_int_remap;
     /* Supported by the pc-q35-* machine types */
     dc->user_creatable =3D true;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc =3D "AMD IOMMU (AMD-Vi) DMA Remapping device";
 }
=20
 static const TypeInfo amdvi =3D {
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 055a1e865d..f9781a5d20 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3727,6 +3727,8 @@ static void vtd_class_init(ObjectClass *klass, void *=
data)
     x86_class->int_remap =3D vtd_int_remap;
     /* Supported by the pc-q35-* machine types */
     dc->user_creatable =3D true;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc =3D "Intel IOMMU (VT-d) DMA Remapping device";
 }
=20
 static const TypeInfo vtd_info =3D {
--=20
2.14.2


--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFkNmxXgplc+HqgQGJZ4JoaCvxKoFAlyiVXQACgkQJZ4JoaCv
xKo5fhAAjefjbIaOLqRZ5RAF1ly2x3X/c7InbIQtQyqcRWn3CLulaZqqEmKvX2Bu
JMsQ9towcyVodOezH5PEgS08mQEgyXIPqRlK9lDRdjezgF3R3cir/KBmv4QA2mzF
cpJ4bF3fAazDEMX85bFfJ7Ro5d883/WpHlQj7p4sjfWlH1MOJndg7/kyrLK85U3z
oIxdIVtVPJYEP161uS3nbxjPK12PVWP+JorFH+mgCpzGi4xkLcrLpEFcbq3N5qd8
qUdAavZn5wGnIG+27ZxZ4ngQK3I++htJYU/usmzppokgG30fH0KIXi2p18PLwVsG
erE1o4SkYV0rqUcB3DlAI4Y12hTB1TV4/JOrgywOohPDUEyG4zbk/H17FFUXHMtW
ddYQJBDvm49qQclEmtQKVnLIOAcssictafLgBuqdqwcQ+B2fX0eJBdXT3qJ9eBRx
j06r4i4fK3mtNNAUBSSE1qGfuz06h39AnQsuJEjgmYgW/cERiLOQ4Eeq3m2xkP69
czx3luEvFBjK8Qb5sW2TxsLAPhAdm/yk3UTKC35kGa5ISs5SNXf4e6OIScnQagON
BYWHqFGc4NBrhl0YdcqtriVHikdM9nJh2s9ZQH9jtKmhRS4vsBZD/qTwxu9r7McQ
Tyx+Y7/Y63Wyh274Fb32MEXvUe6I7CrIoz9kmOc9G2vfvcwYrpk=
=Rbt8
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
