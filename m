Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5074522lff;
        Mon, 16 Dec 2019 12:48:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0mVvFsPZHnjhhfk+QpVISJINPZstRkoXb57+iN68qclnWdzaV8mkvtEbXV6cXAkIst6NJ
X-Received: by 2002:a05:6830:89:: with SMTP id a9mr2403305oto.322.1576529300144;
        Mon, 16 Dec 2019 12:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576529300; cv=none;
        d=google.com; s=arc-20160816;
        b=cMIxC5vuHcMk1zbWsoy6XNihHLgq7bM3VIdGctIBGSBcajPsrQlspBftnzb0zDpvgw
         K9Qr3CdTN6UAnpb5P7TGge39JNC1JLwo+r3K0XwSDnzM1sLFCXJpE9d1qoN2hqktoXyt
         z/C2K0nBhY72MeBTEohXKXyqOiAkZa0bgPhAxN6tOg9daU0KbwR7ECaw9IBj9jk9AAK+
         WfiBLew8GHECsohOSH6qK6W8k+nPGH6KFvyKR5bLOHS0nr68ZuCVxyVU221fcXviMT6Q
         U07eXeZRQJCwTwpRftIbOr9YNLTt1p8/+pQFf3pN+9Sn1osIzW6x4RdYFOH59qrqnfh5
         c7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=5QgGQR5lmCzHdU2tw8u26Dp0LVz138MaKuXfv7AyzLc=;
        b=mCnUbjEiax/MSvDr6YbrLT2oRbZcr1AW53CN1hH73+eZuUVHdIasopa9iMxfCFbb6l
         4W1GAis9AyYS9RGqj7/t1Xx/U+RrqVL+6UgdhhP4mV471h1hc8e4gvJPaintSb8wQC4j
         j8T9knlQwON97uyXYD6Z7UBF6G+DdWiGN6e52JJTmw3RS0QxDePjdwj11nXcVDiGO+Dr
         6UQVnvP/AKbOUgwGoR3RKtAsTN024oD3iBjn9mjqRGkzBcbLDbgW0L2sai8gHkFO8Yrx
         GL5w7QuwmInhd1pz7wG/VSEXKdyNcTrtBEFbCXgLRM8X7rN2ysdI+UiVEBgjPSqOBbFh
         CJ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JuT3wKT0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h125si7917356oia.253.2019.12.16.12.48.19;
        Mon, 16 Dec 2019 12:48:20 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JuT3wKT0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfLPUsQ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 15:48:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32342 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727036AbfLPUsO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 15:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576529294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5QgGQR5lmCzHdU2tw8u26Dp0LVz138MaKuXfv7AyzLc=;
        b=JuT3wKT0NUxnVUL8Gyg/dpTnyQoBym9nVOgh7O523VxgLg16wTTrR8XwacysfLy3N4Z3VT
        pxi4oGbx5gpTW6aOO6jv28TTY0FisaXEoQltAep1ztiMamCqhIvgZ3s0jEZoRVpnKQbU75
        Im3JH9SwdXCDxTxbinBcqRvqPOntw8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-BnUFytWeO2mWLhhFFJvweA-1; Mon, 16 Dec 2019 15:48:12 -0500
X-MC-Unique: BnUFytWeO2mWLhhFFJvweA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA7BC108EE8B;
        Mon, 16 Dec 2019 20:48:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F38875D9C9;
        Mon, 16 Dec 2019 20:48:07 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH 01/10] arm64: Provide read/write_sysreg_s
Date:   Mon, 16 Dec 2019 21:47:48 +0100
Message-Id: <20191216204757.4020-2-eric.auger@redhat.com>
In-Reply-To: <20191216204757.4020-1-eric.auger@redhat.com>
References: <20191216204757.4020-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: sboBGaDG4jCN

From: Andrew Jones <drjones@redhat.com>

Sometimes we need to test access to system registers which are
missing assembler mnemonics.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 lib/arm64/asm/sysreg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/arm64/asm/sysreg.h b/lib/arm64/asm/sysreg.h
index a03830b..a45eebd 100644
--- a/lib/arm64/asm/sysreg.h
+++ b/lib/arm64/asm/sysreg.h
@@ -38,6 +38,17 @@
 	asm volatile("msr " xstr(r) ", %x0" : : "rZ" (__val));	\
 } while (0)
=20
+#define read_sysreg_s(r) ({					\
+	u64 __val;						\
+	asm volatile("mrs_s %0, " xstr(r) : "=3Dr" (__val));	\
+	__val;							\
+})
+
+#define write_sysreg_s(v, r) do {				\
+	u64 __val =3D (u64)v;					\
+	asm volatile("msr_s " xstr(r) ", %x0" : : "rZ" (__val));\
+} while (0)
+
 asm(
 "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23=
,24,25,26,27,28,29,30\n"
 "	.equ	.L__reg_num_x\\num, \\num\n"
--=20
2.20.1
