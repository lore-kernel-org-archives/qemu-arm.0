Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp17757907lff;
        Wed, 1 Jan 2020 03:28:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOsPcwzy0LPPEmoe+Ww0fjQbpKequte7ji+m3VX4qTutTkGbm/DAn9YQ0cx8LSiDcOdUNe
X-Received: by 2002:a05:620a:1358:: with SMTP id c24mr64317035qkl.285.1577878096907;
        Wed, 01 Jan 2020 03:28:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577878096; cv=none;
        d=google.com; s=arc-20160816;
        b=hHsb5+620GtuS6FCUZEL3EDqSSHMyukT/uelDKaRQzLgbiczM1FaLpLxOMALhwjF0b
         APaUC0oSE6V5J96i4K3OrFo78dhAyt/PDeJWPSZiXe0kcP7p3c6W3tbVPuz16eJgvoHN
         tOXo/U8AreRDKR0yUfvmlsO0iM0Vr3HNTShPyskYiVzCq3IiCJ/RDtpICII1OyGwLrvN
         e86nGvnvQDBCpab+bc0iE05Q4XGdPqZqW4jZjP++WRgt9MZPqS/JNSR9OFJgJIdTEuoe
         9E4tx2WP6eQ0G3snpxrJ/h1MJ7f9ebcUtXrILJfLZ/oU6Ypo6pFvlCdChBRF862iiCcc
         3YkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XN7w6WjTLmQwKdcSLbf/GGYWTNO6EaFmK+erVpAdEwA=;
        b=FpiOzcRsPn3aFmxNU6zSvNZUOjbM5nQpXXblPaMoZ1fiMe7OlM6XK1lOhimi9/lay0
         zV7fVr12IrEBTmct6TzJGJyWNXIqM0ppR/UmHXxRFaSN91C7Kap8M+mroFzprZeOHw/e
         /iD/Tn5gF56Y8YccIPL8szJ7HpJ4VhCl2ujAGowBgExSI7t8ubD9rGxyx64tEYXIVqCL
         hDEr2SybSUY/j5ZcoGTAD/7lVslgBJcq0wrrdq0Ls1sXIWT9cLmssLlBzuSAoTEYKOAd
         67NDfR1U1LKPZJuVSr8XpJWB/3wuMXUfsEC0M7wrAdY0BXMP0iM9d6PleZo+4p4CaVWV
         iQpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NZUGC0xX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m30si20833117qtc.120.2020.01.01.03.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2020 03:28:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NZUGC0xX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1imcAi-00086w-93
	for alex.bennee@linaro.org; Wed, 01 Jan 2020 06:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59553)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1imc6c-00031b-8E
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 06:24:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1imc6b-0008Rt-1i
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 06:24:02 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51897
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1imc6a-0008R5-U3
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 06:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577877840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XN7w6WjTLmQwKdcSLbf/GGYWTNO6EaFmK+erVpAdEwA=;
 b=NZUGC0xXS7oKTlCSIQ+jsSlyQvh/p/1jOhampgy0xjPpNODlYGKMkFVvjEKoi+R9CTxilZ
 7H+G6zYFk04RzxpjPksTBt4nrFvoFSZ5sQUKttTp1vvJ7YTStX+C5vc1FqgZViRxDh1Jf7
 a7P5wQ3Bn6jORQ+3fc3bh9vw2cg/8Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-h2Cxkss1Nf653zW8M3agdA-1; Wed, 01 Jan 2020 06:23:59 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D370800A02;
 Wed,  1 Jan 2020 11:23:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-36.ams2.redhat.com [10.36.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B09E95D9E2;
 Wed,  1 Jan 2020 11:23:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] tcg: Move TCG headers to include/tcg/
Date: Wed,  1 Jan 2020 12:23:02 +0100
Message-Id: <20200101112303.20724-4-philmd@redhat.com>
In-Reply-To: <20200101112303.20724-1-philmd@redhat.com>
References: <20200101112303.20724-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: h2Cxkss1Nf653zW8M3agdA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Riku Voipio <riku.voipio@iki.fi>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m2F+KPdTmrHZ

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 {tcg =3D> include/tcg}/tcg-gvec-desc.h | 0
 {tcg =3D> include/tcg}/tcg-mo.h        | 0
 {tcg =3D> include/tcg}/tcg-op-gvec.h   | 0
 {tcg =3D> include/tcg}/tcg-op.h        | 0
 {tcg =3D> include/tcg}/tcg-opc.h       | 0
 {tcg =3D> include/tcg}/tcg.h           | 0
 MAINTAINERS                          | 1 +
 7 files changed, 1 insertion(+)
 rename {tcg =3D> include/tcg}/tcg-gvec-desc.h (100%)
 rename {tcg =3D> include/tcg}/tcg-mo.h (100%)
 rename {tcg =3D> include/tcg}/tcg-op-gvec.h (100%)
 rename {tcg =3D> include/tcg}/tcg-op.h (100%)
 rename {tcg =3D> include/tcg}/tcg-opc.h (100%)
 rename {tcg =3D> include/tcg}/tcg.h (100%)

diff --git a/tcg/tcg-gvec-desc.h b/include/tcg/tcg-gvec-desc.h
similarity index 100%
rename from tcg/tcg-gvec-desc.h
rename to include/tcg/tcg-gvec-desc.h
diff --git a/tcg/tcg-mo.h b/include/tcg/tcg-mo.h
similarity index 100%
rename from tcg/tcg-mo.h
rename to include/tcg/tcg-mo.h
diff --git a/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
similarity index 100%
rename from tcg/tcg-op-gvec.h
rename to include/tcg/tcg-op-gvec.h
diff --git a/tcg/tcg-op.h b/include/tcg/tcg-op.h
similarity index 100%
rename from tcg/tcg-op.h
rename to include/tcg/tcg-op.h
diff --git a/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
similarity index 100%
rename from tcg/tcg-opc.h
rename to include/tcg/tcg-opc.h
diff --git a/tcg/tcg.h b/include/tcg/tcg.h
similarity index 100%
rename from tcg/tcg.h
rename to include/tcg/tcg.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 387879aebc..02e1490895 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2374,6 +2374,7 @@ Common TCG code
 M: Richard Henderson <rth@twiddle.net>
 S: Maintained
 F: tcg/
+F: include/tcg/
=20
 TCG Plugins
 M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
--=20
2.21.0

