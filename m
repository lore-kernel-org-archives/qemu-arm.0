Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp774135lfg;
        Mon, 24 Feb 2020 13:01:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzVkwMhzZsrNao3SowUngQnmX4sFzNBFCYiPduQH84MQXRUIyZsf6udao7P3y2JWfVCpyXH
X-Received: by 2002:a0c:ac4e:: with SMTP id m14mr45497677qvb.37.1582578062143;
        Mon, 24 Feb 2020 13:01:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582578062; cv=none;
        d=google.com; s=arc-20160816;
        b=cEIpJ57wUWyaMLUhB/FaTZlIurr3k355xibp5gJCkPXoCiFQHihBRbT1TcfJcKxLyj
         2hY10Y0OGr5cmEUCsv9N4SwxtdXnwNH5vlao09m6QvALL0onWP+Dmy+sUq+xI6x3oQUa
         2fSPwk5S2X5ZlxGyu7/EF/tJrjrSAmTC4CPI/ujXP2Itpnv+S7rJGZZI0Et3Std4Ylng
         CvB7dbkW2zM49Os73JgrUkMzMWOaAmKAKsGyvV07dm+2rlfrif8CE4PmEShbhKVKEHh3
         CqvnTPN/Uh91dE4qBR+vqtAPwFDY/Cb1ygoK8P2TqexKtw6nkGm4HJsS1RhQJnWUX6+i
         DPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aBf1Nz3dO7lmnq6x8HgckUD4/9P7/UEzlUI+mgbV/5Q=;
        b=k6kJkflbfmIyeb86kvcKXjzCH53OvhxM61mcqpU2JQ6nHamzFzlwsAciqGO0NGPTmC
         NlcWACZRBOBuCRRBSqQfjPJFhNJgTgF+iTyqbXu6NGK67kwGx8o3UsLi6U5op5YdB2nM
         yGv0MNo5YkUZPWvttDc3SySyM3Z3lW/gExr8msz5QE+JVaxKMi+vTcOz3MFWKLsPRlOW
         qGhHczMuXy0vrA1u5HloqpmwR4kztKpVAs3jjsk7mcItTO6q5JSkPOhQzJOBBx0Ztj+3
         eQ4SQ6a4h+3MVt/YGy/I1Wzf+1TbYNu1YWLSG2wdcHNrmR8zbDPXmlEoujtAmls3jgon
         k3NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z7IFn7uM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si6476958qtg.53.2020.02.24.13.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:01:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z7IFn7uM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Kqb-0005KF-Dq
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Km4-00063N-MG
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:56:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Km2-0002xu-KL
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:56:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48018
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Km2-0002wv-Dm
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBf1Nz3dO7lmnq6x8HgckUD4/9P7/UEzlUI+mgbV/5Q=;
 b=Z7IFn7uMULPt+eEx54eV8f1N9jpH0HtqbV/jXBGsuPXv2eqlqXjaJP/arRvd559dcfotUJ
 SpWvpQM4SwpnHK3GgYRe0Jo1RXXLlp4saq37BttCMSee1NnHQW9gHpDBr8kJ7uom03lYHk
 jKC4UKb5LHddmKs5AUnaSDXe6MXxLi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-vv3vpfscMoS28J8ygPcnhA-1; Mon, 24 Feb 2020 15:56:15 -0500
X-MC-Unique: vv3vpfscMoS28J8ygPcnhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E001B107ACC4;
 Mon, 24 Feb 2020 20:56:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C390B5C883;
 Mon, 24 Feb 2020 20:55:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 01/32] memory: Correctly return alias region type
Date: Mon, 24 Feb 2020 21:55:02 +0100
Message-Id: <20200224205533.23798-2-philmd@redhat.com>
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
 qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: 38sZ89wdlojU

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

