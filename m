Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp764973lfg;
        Mon, 24 Feb 2020 12:48:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyg0Z5sEodlFQvFpvL6rqB18c1FoxRgLRMzFh7duNeIczL4nS5GPWiOcsksFkjbnwJ9qryu
X-Received: by 2002:aed:29e2:: with SMTP id o89mr51661315qtd.353.1582577332298;
        Mon, 24 Feb 2020 12:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582577332; cv=none;
        d=google.com; s=arc-20160816;
        b=MkKj1QgawIGv8k+u6GrkL1yA6t84hvFoV1WedMyYE/nFYygfLcmvZJMJT960rRLaDq
         YrkCPy8Njdc/bGEDj8Cf4V5Xbk8H1L9EsD+EkHC5bPjtnOuqByxxfS9zgklxmnzK7yKi
         0dNu5vJG0CX+bpM/T5QiXfVztTTeKiUYnPsbG7F5YWD/WszbpBRr+rBduuCC0tIMISk7
         LqZTX3FGDNsTV/tXsTS35pGmMFXihEW+NgTc9rsAYEjERuyII+tQkEHeiORJw/bYPbvD
         6zvRsPuz2PNF/wdDhI+beW0RBAIfy4AYeaP4kxKbS68XjOKwM35oe9Bckazw6NjMztfi
         Nb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aBf1Nz3dO7lmnq6x8HgckUD4/9P7/UEzlUI+mgbV/5Q=;
        b=joful7g+7I9i387r2O4ZH7Ie5ApWUhOqT+54MNyAkbrn1tvdOuLgwPFrlugwhr3GXt
         kxmTTf2I0adAP1m9D0hrY7wBnH+FPt0lv0udtUpHiIgoZysNaqUgsUJ1caEpR9318y1o
         vJktgS5qKZrlCxzyl+hdhoRXKHnEx63zdHzyQqLbtqqYpcZtVllp08mgyHCWC+50Rra/
         i32N8NTCqCLuIXETncLPiQALy4EGlunFMIiwjuhHX7tX8hw8DsZMvqR3UOfY7cig4RME
         OR6uT6EsJRkvCJ8s1wYjFPGbyQGBDVJMoHFVglgMs6q3PEPX7yTlhWGo25OHTqcOcRiW
         /bIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMj7UkRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si6730205qkm.146.2020.02.24.12.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 12:48:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMj7UkRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Kep-0000n9-DG
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 15:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48453)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kee-0000m6-0H
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kec-0005vA-Kh
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46431
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kec-0005uQ-GK
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBf1Nz3dO7lmnq6x8HgckUD4/9P7/UEzlUI+mgbV/5Q=;
 b=XMj7UkRy2EpxhnTeNtl2VVqUfFnxHqfFiLuDbQCuM9B7KNj6x/QlXSe9Dtze/eNk9x2/U3
 +6PQU0RI3AUYB15gHeKDUfCq/1U0yPNBMhb1SYEGciP9jmcdsW6wEiXVl5Pw/KoAH1VCVU
 Bot3eIAmmMkzuDVrDtxWRkC2dBAziSg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-NOaTz4z-PnmGxjT2-gFegQ-1; Mon, 24 Feb 2020 15:48:36 -0500
X-MC-Unique: NOaTz4z-PnmGxjT2-gFegQ-1
Received: by mail-wr1-f72.google.com with SMTP id n12so4253989wrp.19
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 12:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9F9enB4mqr+YPnaVrLHGBnKs+NXe+icyfAm27ef64A=;
 b=DgFwrYLQbYEx3kYqI8vTwsUVxV+abhQOzGUMaJPnn6pbrd2tHKIhEHdTxmUOyWT61A
 MlvciGKzqO3i2pRrOeFSceIC8OHEZxs+EoSDJLkw4M9EMQQIqDR6RWrjNg6fjuRXs8n9
 +gcDc7EVacFsu8jv6wOdRJHrELZyZi+6E7NLTUJfv38J4TqlgGxQcKZy88o4Hywc5k2G
 fXW9D65FgEC5l+FV30YCqLkrXUBxbdx2asfS267isi0bDaRxMIbABbqc6thM6KfpnGUC
 ziz/7zaApaQeIi1JDfdki2WQKkKrJPV/VR1NgxVNVlkEkppGR+A3BaG0YJLxKTYqmx1p
 ei9Q==
X-Gm-Message-State: APjAAAW1B1ZIbS9px1wMFReyfLiR8Bxi5agfOgS5lAizwwgmtLtaSn1W
 FGG3bjao18v/EYWZTy4wlnjLCrcfVuN+pE4a05pldZfPuRuHDCO4faQKUzUmcBp+WwtjI+Cin+W
 sTu3RCUNOaet6
X-Received: by 2002:a7b:c759:: with SMTP id w25mr805762wmk.15.1582577314793;
 Mon, 24 Feb 2020 12:48:34 -0800 (PST)
X-Received: by 2002:a7b:c759:: with SMTP id w25mr805686wmk.15.1582577313662;
 Mon, 24 Feb 2020 12:48:33 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v2 01/32] memory: Correctly return alias region type
Date: Mon, 24 Feb 2020 21:47:57 +0100
Message-Id: <20200224204828.23167-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200224204828.23167-1-philmd@redhat.com>
References: <20200224204828.23167-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OlDpr8xQi85J

Since memory region aliases are neither rom nor ram, they are
described as i/o, which is often incorrect. Return instead the
type of the original region we are aliasing.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: qemu-trivial@nongnu.org

 memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/memory.c b/memory.c
index aeaa8dcc9e..ce1179874e 100644
--- a/memory.c
+++ b/memory.c
@@ -2818,6 +2818,9 @@ void address_space_destroy(AddressSpace *as)
=20
 static const char *memory_region_type(MemoryRegion *mr)
 {
+    if (mr->alias) {
+        return memory_region_type(mr->alias);
+    }
     if (memory_region_is_ram_device(mr)) {
         return "ramd";
     } else if (memory_region_is_romd(mr)) {
--=20
2.21.1

