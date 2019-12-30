Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15185139lff;
        Mon, 30 Dec 2019 01:12:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwX8EZSDwIyNHySvOlz+ggp/8Pi1+4nBe9652+b3Wgy1qA1YoxaVzg0zTTjioV06sVLikbk
X-Received: by 2002:a9d:6481:: with SMTP id g1mr74910239otl.180.1577697140218;
        Mon, 30 Dec 2019 01:12:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577697140; cv=none;
        d=google.com; s=arc-20160816;
        b=rZWOXj7q/gAryVrNKS2doVA1G8WlIrcTSJNUJjRNjaigK4xzDV8dhUijx8T4L4ZNDi
         hGz57bNhjlYppdr5fHL0SkLhOouVxxzdtHYuf2As+W8iqf/H/qbG2LFo8XjalCBAvY7b
         nubyye0KzEo5P2Oco+d0C2GcbElG8aK0n1jtyQPG/oRlhvzqUjEs15J4m/vWeynnMtTl
         N/cM5oJ5RL/O1QEwNQn4liB8y0pbDvPhUG4Nenh1pA5Pl6Akdb7usI8LlBShFY7JixVO
         lX4o3na8Iz55epZnmdRWAlo6n+gbazyVs2rNaIjZa8/pB3cPexeGIRZWLd8d1ZdtSlzT
         MnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=huQ1XM2FC9X4C7Ug0J2Ty+HzCEUy30TWjQVBOx/Tu5I=;
        b=lG9rjJm+V269rHRnvc4Z0wKEiDRQz2fNmgCR1LSOsmdzMipuVPV2ERO8W+dvtDzF1+
         fBR6ZMIb3AfE0+RxFc7zIoDZzYTDzvvdI2tyF7VF1MWj5b3AsAHuvn1W5slnHY1bJolD
         obt5gNiDzX36xZqIfkSAzyg0MVn1LCfnu5obzv+Wg3LHmvNHN+KwE5d5+G5BSnkWTnJ1
         PHryw3R/MEZcExQ+d4bzRH7LgzmQoUW3wcSDvBbvYWd5bmlhQNS9NFFKHO/FT1H4/H6Q
         Sz+rR90OCCKTJdHEPt5EhlhM33CQb4Rl0XmYkD0WBnayxJfIuR0gwFcx5aJS42WEy1ss
         XIHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vop3ZsKT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si16061284otp.164.2019.12.30.01.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 01:12:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vop3ZsKT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilr63-00015F-B6
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 04:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilr3k-0006oE-Jk
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 04:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilr3j-0000Es-Ew
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 04:09:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20401
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilr3j-0000Eh-BP
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 04:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577696994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=huQ1XM2FC9X4C7Ug0J2Ty+HzCEUy30TWjQVBOx/Tu5I=;
 b=Vop3ZsKTMxvO/mLVwYA9WiqVzYlb7CYeuBwnpZo+tFt1OVbMcpm+CYqH3HP8WsdUnf62RY
 5DjLeqMapN1MDDDixEPT6j9Ig/897MfiBUXFy8GucApDSMGMntcgm6l7dUHQxjuhQPTxw2
 DNFpH0/PUkzz+qJvqKIduLnvZd9Sgic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Eep-3rfQPkaErD9Vf8OLaw-1; Mon, 30 Dec 2019 04:09:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03C52107ACC4;
 Mon, 30 Dec 2019 09:09:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-185.ams2.redhat.com [10.36.116.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 161291036D1B;
 Mon, 30 Dec 2019 09:09:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/2] configure: Remove tcg/ from the preprocessor include
 search list
Date: Mon, 30 Dec 2019 10:09:00 +0100
Message-Id: <20191230090900.446-3-philmd@redhat.com>
In-Reply-To: <20191230090900.446-1-philmd@redhat.com>
References: <20191230090900.446-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Eep-3rfQPkaErD9Vf8OLaw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t+iIxlIDKPrH

All tcg includes are relative to the repository root directory,
we can safely remove the tcg/ directory from the include search
path list.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 940bf9e87a..74dad08580 100755
--- a/configure
+++ b/configure
@@ -7436,7 +7436,6 @@ elif test "$ARCH" =3D "riscv32" || test "$ARCH" =3D "=
riscv64" ; then
 else
   QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
 fi
-QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg $QEMU_INCLUDES"
=20
 echo "TOOLS=3D$tools" >> $config_host_mak
 echo "ROMS=3D$roms" >> $config_host_mak
--=20
2.21.0

