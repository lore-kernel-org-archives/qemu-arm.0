Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp806901lfg;
        Mon, 24 Feb 2020 13:38:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwcHu+uNVTG4oaySOhzKOlc3Iph3IU0e16rNPGoZpFiFYrCG1jBCI+MmC+j8IHF1gfkfQI
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr3272009qkg.244.1582580313884;
        Mon, 24 Feb 2020 13:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580313; cv=none;
        d=google.com; s=arc-20160816;
        b=kMn0v1gDACrqTve3Qn8xocIov94jFleM2Q4PFssfQ/RrMPgbQUFCG252U023CHBoH2
         +gjVXjjfXfMjvOuAcR2/1Uh5mLEUD3UhLD4HtCHdDhxydfLVp33+7kmTIDdOO6OV85wE
         307PSlh2ev5sCQmSQUxq9dnSVo8V6AHrLj3m+2p3HABU0nZPRk3lIXubJGGJZfDEh/Zq
         p9QS5FWY/cJNGCkOKivOkIAsRk9uBWNUhNWZTFjLrElubNbA0oNF+M8nqy3YDtuMc+ux
         Ps5OKXCd1jKxba1cgmUewqoywn6/s4c5zisVQGAAoeZw1MFRWQIgQAQRhtJ6If4MT9WA
         g4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MiaNZR/YFUXbUQr2CW30itYe2jJLit5uoKbrlDDb9zo=;
        b=Zl5aEqRr0aav5gnDjINbSq4sLI8+TmKgEoNLsJO0YMsfhbW6Hggqyy7aBkicMeit3+
         XuJ98aoSzflAc+OrNRAaP7+ivXU5HCR67Jc2RmzXQKLJkyoo6wzBd9z34iQWPXfmvo9T
         IN79uMRFHWn0JylMyrlYHyzvnLwVCaOGK0LAkBdRjgKYvzGbq/CnLyXHhafdHTjeDOSt
         RJq4+Y4yWjTle/CP4frmJsXSqbE1UIxNQCoOb07cWaWy8X1zwomss5lLoFyDPvlol7p9
         Cw7URoX9UpNGDfzE12rIsms2MwwcseQWFenUd8j6BpF7yGav/lGtJ4Ts2mjA6rISajrr
         UpOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bTy5V6vw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 43si6291764qta.50.2020.02.24.13.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bTy5V6vw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LQv-0003ls-Av
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KqJ-0005sX-Tj
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:00:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KqI-0006oj-PD
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:00:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23876
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KqI-0006o5-KI
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiaNZR/YFUXbUQr2CW30itYe2jJLit5uoKbrlDDb9zo=;
 b=bTy5V6vw3UbHZIJxp+OG2TpLDNf0RizhStPVbBSZymFhJ13y0CfEbCdj1Dcc8vJpMw8NR2
 NsGwTHpSXS8Ck+tLCD9Sk/Q3M94fREfe0x6VaACImiZdQPUC/6Zjrjpl0nBR5VTy95pWQm
 N9kTIIXZ7ZyKcCVvUBQ/CMHfSPmaiaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-Rmd8_EK5OM2HmLO6EDe3Rw-1; Mon, 24 Feb 2020 16:00:40 -0500
X-MC-Unique: Rmd8_EK5OM2HmLO6EDe3Rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01584801E6C;
 Mon, 24 Feb 2020 21:00:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D09C25C883;
 Mon, 24 Feb 2020 21:00:26 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 20/32] scripts/cocci: Patch to remove unnecessary
 memory_region_set_readonly()
Date: Mon, 24 Feb 2020 21:55:21 +0100
Message-Id: <20200224205533.23798-21-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JWUAkOFemmAw

Add a semantic patch to remove memory_region_set_readonly() calls
on ROM memory regions.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .../coccinelle/memory-region-housekeeping.cocci   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/coccinelle/memory-region-housekeeping.cocci b/scripts/=
coccinelle/memory-region-housekeeping.cocci
index 9cdde71bb1..5e6b31d8ba 100644
--- a/scripts/coccinelle/memory-region-housekeeping.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -48,6 +48,21 @@ p << possible_memory_region_init_rom.p;
 cocci.print_main("potential use of memory_region_init_rom*() in ", p)
=20
=20
+// Do not call memory_region_set_readonly() on ROM alias
+@@
+expression ROM, E1, E2, E3, E4;
+expression ALIAS, E5, E6, E7, E8;
+@@
+(
+  memory_region_init_rom(ROM, E1, E2, E3, E4);
+|
+  memory_region_init_rom_nomigrate(ROM, E1, E2, E3, E4);
+)
+  ...
+   memory_region_init_alias(ALIAS, E5, E6, ROM, E7, E8);
+-  memory_region_set_readonly(ALIAS, true);
+
+
 // Replace by-hand memory_region_init_ram_nomigrate/vmstate_register_ram
 // code sequences with use of the new memory_region_init_ram function.
 // Similarly for the _rom and _rom_device functions.
--=20
2.21.1

