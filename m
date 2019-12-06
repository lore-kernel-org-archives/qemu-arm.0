Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1040021lff;
        Fri, 6 Dec 2019 09:27:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnuJurBCb8z10cLH85YuMmqRepGYdbEBFor+2lXUsfO36llhqHkvvdp+mdjheYEiFW0E73
X-Received: by 2002:a05:6830:120c:: with SMTP id r12mr12214525otp.327.1575653264405;
        Fri, 06 Dec 2019 09:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575653264; cv=none;
        d=google.com; s=arc-20160816;
        b=wBmaQNwDwGgnJL8p75sh1b3q4q0m/VLlS+aolpLMlJSniBiy4NFhGBPYgHrun+CD1B
         E1czZAGs9R/78jIJvAzXfyy4N7YmfcGs26+2skJenG8oGdMEqHeJc7pNGAvn9KdrUYzk
         bcP9d2Fj6bGJX5B0nDQlQeGbOnAOGDYajFqJUWLSTZCyL4iIWqiaHZycoDB9tuM/DKj0
         1p/JPz2y/8Ytm8CX9/+Jg2ZjTtsHUp/8hcM6SSytkXXDeba2nB42Vug8Z2ptA00jLNVr
         mZPZqVbbHbWxGuTaNzs4U9oTeFTK4dVBo7CfJYp+9agYvozBv5jkDJ5TSKPOQH+BARth
         51iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=82q1ODmkZ7c1oPzZoGIi16jb3fC0s7ZgyAm8HyUNG/k=;
        b=wM57g4Ua51zJOvVU1ms+behT6U7QZRmKiZJSfc3AHjBnxpM0cWt+lyw2Cx6zyidmXh
         Ydo3luOmV5MB2XgtlvJM1sJ7NB8uZdtR98rw5draGFqS+eYViLocq3m32SbpC153sFbk
         LVOtK5VAeuPIK5jkCaw8xaGxowo5+2FRhk4F5ky8wYGEVJnUCtmnhfWhv/+WuvFlI8Te
         U/zClD5mbMupLQM7WEP1vs3zcfYUnMxSofqF8C1dT3BqUoFwYXussj0hLRht1NMk4AvC
         O5PuA7zdltK13AzhPV54g570puHoKMebQOCertMH/sFgHvEVhVunitAZd5FIp7/QshOB
         SWzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GqWKDFaN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g6si6984218otb.231.2019.12.06.09.27.44;
        Fri, 06 Dec 2019 09:27:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GqWKDFaN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfLFR1n (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 6 Dec 2019 12:27:43 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52824 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726287AbfLFR1n (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 6 Dec 2019 12:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575653262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=82q1ODmkZ7c1oPzZoGIi16jb3fC0s7ZgyAm8HyUNG/k=;
        b=GqWKDFaN1Wm9fSEJbCykqP9EPZCrn/NTMaKlhErAReFctSzaePjnd1kyiNftswvAukaybB
        kX0s8W6I391/vTmlXTeMx6Bb06EyfGP5X7c5b6PMNru1hGfiEoXWwEVnk50+nC/SATJx82
        iJLGUYnxO2W0RFEoaDbi2dQZdX92jGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-am3fbLFtNLK_jb0VJtV8MA-1; Fri, 06 Dec 2019 12:27:40 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CBB3800580;
        Fri,  6 Dec 2019 17:27:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3E9436CE40;
        Fri,  6 Dec 2019 17:27:34 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org
Subject: [kvm-unit-tests RFC 01/10] arm64: Provide read/write_sysreg_s
Date:   Fri,  6 Dec 2019 18:27:15 +0100
Message-Id: <20191206172724.947-2-eric.auger@redhat.com>
In-Reply-To: <20191206172724.947-1-eric.auger@redhat.com>
References: <20191206172724.947-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: am3fbLFtNLK_jb0VJtV8MA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: kYZeO5kZSAAX

From: Andrew Jones <drjones@redhat.com>

Sometimes we need to test access to system registers which are
missing assembler mnemonics.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/arm64/asm/sysreg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/arm64/asm/sysreg.h b/lib/arm64/asm/sysreg.h
index a03830b..a45eebd 100644
--- a/lib/arm64/asm/sysreg.h
+++ b/lib/arm64/asm/sysreg.h
@@ -38,6 +38,17 @@
 =09asm volatile("msr " xstr(r) ", %x0" : : "rZ" (__val));=09\
 } while (0)
=20
+#define read_sysreg_s(r) ({=09=09=09=09=09\
+=09u64 __val;=09=09=09=09=09=09\
+=09asm volatile("mrs_s %0, " xstr(r) : "=3Dr" (__val));=09\
+=09__val;=09=09=09=09=09=09=09\
+})
+
+#define write_sysreg_s(v, r) do {=09=09=09=09\
+=09u64 __val =3D (u64)v;=09=09=09=09=09\
+=09asm volatile("msr_s " xstr(r) ", %x0" : : "rZ" (__val));\
+} while (0)
+
 asm(
 "=09.irp=09num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,=
23,24,25,26,27,28,29,30\n"
 "=09.equ=09.L__reg_num_x\\num, \\num\n"
--=20
2.20.1
