Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp794120lff;
        Fri, 10 Jan 2020 06:54:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvoGOJlmIIHFgGCmhGj6c6yQNM5nxwQ9fiw6dpp0rDwQKkMd0SCN4AyqmVnAs1GSoyaup9
X-Received: by 2002:aca:4782:: with SMTP id u124mr2499580oia.93.1578668071204;
        Fri, 10 Jan 2020 06:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668071; cv=none;
        d=google.com; s=arc-20160816;
        b=w7PWyGx+vLym4GzTv2pMGhpQrwieEJvv+1UaegOoX2hEHNE1iL064AomDjUlOQg+Rw
         6GcvoxEJaBi2tMz3qyhVEISboVzkcdy6KuBtiO1PLAY69zV6imy090HwMhmKVHu178Kg
         UfruRSEEqub6vB9kfILdQz2GqP6zdWW14RIR1TwQh2tD4rxIqPl8ug0G94wZgYVhiNPY
         sgMXTiUbCswsfTjL0uxYaD7gXgYUo0R9mrlgn0/vW4hrolakILa9hFW5QrKmsO5Deu23
         YCy4mZEBZHBqMrNxDKvctolvnwp79RF2Vw+IZTDbbtN8OierJKv3PCgF9fJHC1lXQTKz
         CrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=g1Y7SAIkQ6YKL70iv+PevVOHVnPkk+5bW/+E3fVVoME=;
        b=o3saQ4MTM8RByQOV+jYZtPEaZNwnWdI1YzEOBBx5jcFSBhUUKjwXNlwvQVA6+xfmZc
         zSB7HFi93CJpxOiUOt0kT4SuU6vcx209mfRF6Fcro05ZvUF1UZJKHGVMKzEOGEKJX//O
         WIKPz6ztcC1HDPbBELLo7XWFrtKTFWM4PBptRYwn1CsJYiZQFjpQ9S0NXU7AalFsLwPH
         XWWkmFvx1SledFrIv+4EmtMCdF85gEbnBI5MYC2RuTagZAYZ9+w+0f297JH0GOOoaLNH
         ei7NWYMH3R1oOvgZxpgOxU/yEdGCF3OMkdRC10+5Q/Fhdw+3oSwXzP6O1sSj8lsMVS6c
         WGwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SvFGWpfp;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 11si1538069otu.301.2020.01.10.06.54.31;
        Fri, 10 Jan 2020 06:54:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SvFGWpfp;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgAJOy3 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 10 Jan 2020 09:54:29 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60680 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728137AbgAJOy3 (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 10 Jan 2020 09:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578668068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g1Y7SAIkQ6YKL70iv+PevVOHVnPkk+5bW/+E3fVVoME=;
        b=SvFGWpfp3DVBDZfD4bM3aH/YFOrFPI6GT1BxVzDUMtp4MqSc96m5XvVWmenZhHsON659sC
        XLvKJzI05Cddvh2ajlWClozArJZTumC1AQn4DLAdK7K6vgY2hfSMdrYPPNZF/TxMpna2F3
        3OB5xvJCGAlk7iC662MCE8jhFXqe5Eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-H6w6yrkENFmG85vKwnY_Qg-1; Fri, 10 Jan 2020 09:54:27 -0500
X-MC-Unique: H6w6yrkENFmG85vKwnY_Qg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B37618B9FEF;
        Fri, 10 Jan 2020 14:54:25 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B178A7BA5F;
        Fri, 10 Jan 2020 14:54:20 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 01/16] libcflat: Add other size defines
Date:   Fri, 10 Jan 2020 15:53:57 +0100
Message-Id: <20200110145412.14937-2-eric.auger@redhat.com>
In-Reply-To: <20200110145412.14937-1-eric.auger@redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: PbUc2kTEfDMq

Introduce additional SZ_256, SZ_8K, SZ_16K macros that will
be used by ITS tests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 lib/libcflat.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index ea19f61..7092af2 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -36,7 +36,10 @@
 #define ALIGN(x, a)		__ALIGN((x), (a))
 #define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) =3D=3D 0)
=20
+#define SZ_256			(1 << 8)
 #define SZ_4K			(1 << 12)
+#define SZ_8K			(1 << 13)
+#define SZ_16K			(1 << 14)
 #define SZ_64K			(1 << 16)
 #define SZ_2M			(1 << 21)
 #define SZ_1G			(1 << 30)
--=20
2.20.1
