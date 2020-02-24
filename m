Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp795455lfg;
        Mon, 24 Feb 2020 13:24:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqy+hlEvVCQljCnfxMCjjxL4oRNNtjDGrStwr5gEQRcoXd4pWbrgNv7SlPoIzUVcfKhA+PRX
X-Received: by 2002:ac8:550a:: with SMTP id j10mr51465711qtq.354.1582579443108;
        Mon, 24 Feb 2020 13:24:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579443; cv=none;
        d=google.com; s=arc-20160816;
        b=wnNexM+K+gr1AB64tQRkrqwuaZAs/9NVwIEIFRF9XBgrQJL/WySvHgXFNYNKQnZoag
         M/AwOKjd18PNu2a4nJLZ7y2UtmMB7+lQv/fah9Bne/ILgPWCbU4xD46fKM6goM16KoH6
         456wGPuFP8ZgyWXZ8q7UJytUU3OaGdPyeMMpwGB7745zIMwZMYP3zt8LL6DShsYj+1QD
         zcbKMfSSDGg/Ue20FQvKVWswnhdn8M2A6a7F4rHSteVZ8FEw/5QlN2iPD1NEmfN6bxZW
         cJ3dzBCJy3THfquqzVn9u0gnry3+efiUVG55KLFvnG1FeJO49X6O0vM7Pr3haxm15f3p
         OMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Obnhgnn3k+TYUgOPS2vdiwScp7uLQL+D7VUoN9TWrvw=;
        b=Us1krwdHZdW+UyTcg1zXdkmw7BE3QT4cN5XNJHLMw76TYz+uKRzoMgGso5zC+U3pTJ
         EW0Nsw4HWOYuUOI2quD2htHaYuDBgd9SVHYUSIy34r8pzQgFhYsekPiRreHEdtAJ0cQY
         zDsCs+vUsfTcyELTNpMhs8Ff/Rwk5lAxyLwntaV2fTcsIpb8QzvjV1qV7KZv9wdOp5sT
         5fGUINPjSqaVebEzH8b5phpf07QQLGazBEvmI22VlPKKFWCk3itIoN+X4cL8k8Uemda3
         259V9bkFKUHHYKbydXxVo+9Oe6Be7hcKpnl+VkYnBIBiP9LeiJ3MdgzUyuL5YtlLNJpU
         +ggw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SMZluYH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si6324199qtn.43.2020.02.24.13.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:24:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SMZluYH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LCs-0002G5-F4
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kp7-0003dU-00
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:59:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kp1-0005pX-JF
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:59:28 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29441
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kp1-0005oS-Fg
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Obnhgnn3k+TYUgOPS2vdiwScp7uLQL+D7VUoN9TWrvw=;
 b=SMZluYH2B0aCSPlfvIvzPPRRgW7WW85soLI3JF8GeJ4T4rASGgcQXjRcPFnHLfV3toP1H8
 dZUU7pLFc3BHuoUCFpztUSusQulabRo5NiNUH/+VlR1PPoVsSlc6/rRXpGJRXSyaNVIKPy
 lR3Es7fiBQ2+18RsltpAIt2CHB/5C90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-E2INLCuiP026s5fU3mRTyg-1; Mon, 24 Feb 2020 15:59:21 -0500
X-MC-Unique: E2INLCuiP026s5fU3mRTyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42DCD107ACC7;
 Mon, 24 Feb 2020 20:59:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 164F95C241;
 Mon, 24 Feb 2020 20:59:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 14/32] hw/sparc: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:55:15 +0100
Message-Id: <20200224205533.23798-15-philmd@redhat.com>
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3xHSDHJw09lh

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/sparc/leon3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index f5a087dd86..23d0bdbd71 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -256,8 +256,7 @@ static void leon3_generic_hw_init(MachineState *machine=
)
=20
     /* Allocate BIOS */
     prom_size =3D 8 * MiB;
-    memory_region_init_ram(prom, NULL, "Leon3.bios", prom_size, &error_fat=
al);
-    memory_region_set_readonly(prom, true);
+    memory_region_init_rom(prom, NULL, "Leon3.bios", prom_size, &error_fat=
al);
     memory_region_add_subregion(address_space_mem, LEON3_PROM_OFFSET, prom=
);
=20
     /* Load boot prom */
--=20
2.21.1

