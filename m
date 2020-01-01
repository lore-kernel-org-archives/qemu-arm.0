Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp17755533lff;
        Wed, 1 Jan 2020 03:24:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXcIiO53UI+z9dc+/KzDNvM0an5PHsg4JwuO0oOJRmg38EmSGgotD9zB8owxet7LDSuNFo
X-Received: by 2002:a05:6830:2110:: with SMTP id i16mr83619930otc.337.1577877887464;
        Wed, 01 Jan 2020 03:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577877887; cv=none;
        d=google.com; s=arc-20160816;
        b=Vj3amym/oHOW1cXOpQskD8dgqGNb4e3wDeqDNIOcBjZWId2EZd02OipHBz71jrPoMV
         RcJr/g4hwRIZwEmzlr/AKyEILhji1Y8aSC553k5NfjmzmyCc9vq7DlRjCPLIGj9m/CR+
         SZwj9IjAVoTMIbI0uwXjfFEuH8iNFiUvDjC9Gl2qS4v6MjHhLVGSYbcrOoCZXW7RmhMU
         rqLeR2SNnMHQkHfLOE4K7UcHfUviZWirv2ynjkZm8uWqCaQei8vW132tYe2xPRfnylgO
         L5hosuFWWNxySwnoQl/GFB3KV7TzWUzACO1aTMrnIbR5/hCH0eJkYuyNayTji8JmX6s1
         atiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=huQ1XM2FC9X4C7Ug0J2Ty+HzCEUy30TWjQVBOx/Tu5I=;
        b=edTmeWadTdS9C+vgFM3Wyzh3gbUS6iD0oxnrTRc/BD3k+5mxmsCKcGU8WFZmsaAnWQ
         Mln0bN1iErA6BQzyGcZ9vGy1G0l9DKNpk3GD1BI0hAWSf2wYkUkR8u1dBGyOqErQrQLc
         XBp0cPb2yt1pZN8Pdl569oj7bF2zDHzEpDxTXzoSwzkCB3G6r6zCqvjRd0xov9+Gttvg
         PPEPE2+Cl/mdPLzK3KUW/W4w0kjFy1zzC1DFUcZIfl93KQkNROh3pH9AFl+Nq9v6MVzX
         yXemeYDljyaSS/0GG/TRnNAWit7uLvnFUS3/VW03cVHFM+LzsBcHqGdTDROmUXSGB9Dd
         6C5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QzXnsoI6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23si26828280otk.304.2020.01.01.03.24.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2020 03:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QzXnsoI6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1imc7G-0003df-8v
	for alex.bennee@linaro.org; Wed, 01 Jan 2020 06:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1imc6p-0003My-Lp
 for qemu-arm@nongnu.org; Wed, 01 Jan 2020 06:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1imc6o-0000mv-JL
 for qemu-arm@nongnu.org; Wed, 01 Jan 2020 06:24:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21358
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1imc6o-0000lp-Fd
 for qemu-arm@nongnu.org; Wed, 01 Jan 2020 06:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577877854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=huQ1XM2FC9X4C7Ug0J2Ty+HzCEUy30TWjQVBOx/Tu5I=;
 b=QzXnsoI6zoPttbg2OQ1Bas5fsqGgC07r17nWYVBdAWuYci/zbPH6J1mVUWQj3Sl4pWgIZz
 UpbN1gUod4ii/guuvvn53bdSDVX25f0vPA66wkbPv0F9rx0ZeFurya0MsCD4zSCt7Tf65N
 mAtJmVCKo5mlnHyongkeN5SfvZa87g0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-fVquBhN9NPeQQSbVIdJNTA-1; Wed, 01 Jan 2020 06:24:12 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B443DB60;
 Wed,  1 Jan 2020 11:24:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-36.ams2.redhat.com [10.36.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E16D5D9E2;
 Wed,  1 Jan 2020 11:23:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] configure: Remove tcg/ from the preprocessor include
 search list
Date: Wed,  1 Jan 2020 12:23:03 +0100
Message-Id: <20200101112303.20724-5-philmd@redhat.com>
In-Reply-To: <20200101112303.20724-1-philmd@redhat.com>
References: <20200101112303.20724-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: fVquBhN9NPeQQSbVIdJNTA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WcLg5/3NbPwE

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

