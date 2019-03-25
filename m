Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3726469wrx;
        Mon, 25 Mar 2019 04:16:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmf2uwg9SE6fW/osFzqTWG4cz8lxtgKbpLMZ04eTESrwBlukxEZDG6VJ00JOfzABMRjL3z
X-Received: by 2002:a25:9a41:: with SMTP id r1mr18719859ybo.295.1553512604075;
        Mon, 25 Mar 2019 04:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553512604; cv=none;
        d=google.com; s=arc-20160816;
        b=l/TXAOY7MNYL1bf2aFO+i+ozgs9d54YXs4wo2u33smNCtSUPHxuGt7TzWTxo4Zci0a
         hFrc3c0gOnor8pEG8emSc2BZeEfgxjlK4TD2pdEYsBglOeqm5g2/xaV6MdSD4LxGw0Bw
         TKdB0xVfyV/VVbv24b9eh9lQGJkAQlKK/9MAcWi7I97M5QP7Kdl/6GN58Dbj3tDd7GeT
         Rt8aOTdJXO4jR56KXFUHxuSgbYse2ssUnLMfOZANiLxw1xeUpbIwv/yo5uC3ftrEsd2X
         zSeOkjgsds9ouu8h/QK++LjsRj3TTCe/yEcfZonnxLmIyTFBF/uH7GadvXanO4Ib1EDf
         Rk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Jvm8b9sGdd7QCAcKqZ64dZbRKdE1sBrJSp0DEToNUQM=;
        b=SrWu3xaLtL1YFBYc9Y1Sx4/SII0NzsY7yKdq/1eLzZyp4IQ/4l8gQjHKgYq2fZLhcW
         CBnEBD9AIBj/fWMfc3wBsFsblZGYtUOtfa19oa9HXZOjbt6Nbv/+dd4aKCSI9qX88Niv
         IhZc5BuK6H35XTeBcy7gYT1fZBhQatE8tz/7pmgKuBIsSQS+Ox4YbSeYNxIcys2VDBai
         xCKM9QXIzMEWNBTvm+MhNPskcWbNLyYER+iX2phaY/Htv6qVNM+/2e/m9TRbj0JSNaJd
         +OQp9WRHrgpgUzEwcOm3yUhLRESBFr4q8l2sVrf79PkRh/Gn30pWnlminxO+E5Gd05l1
         rhBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="ZxUC/V9A";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2WVHL11X;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VmYGWQen;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n132si9833739ywc.126.2019.03.25.04.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="ZxUC/V9A";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2WVHL11X;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VmYGWQen;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8Nat-00007Z-CA
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:16:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNf-0005Sr-4f
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:03:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNa-00084M-7c
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:03:03 -0400
Received: from greensocs.com ([193.104.36.180]:38397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NNY-0007tp-3n; Mon, 25 Mar 2019 07:02:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 67F497D78AA;
	Mon, 25 Mar 2019 12:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511755;
	bh=CXfPsIgEUI2b9cUTpOeKXwlJ/nJXiIf/2t9JTSfp3NA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZxUC/V9AzY/0fiRIfb2s4zSh4axNMV4l5NEyROhEkamrVgo97RGKZdy2XOwZtwJBZ
	qmoRbDx1ZhnSRIsZvEavcrsAnz+6Oec/9n/0NCdeGJPxXwnYIVVYh5JEwM0tqEv+wj
	Q8m4g0pWVDZpFL8tn9Y1eIDtkIy5R9f6EIp5QsOE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=2WVHL11X;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VmYGWQen
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epywVxpu8TSh; Mon, 25 Mar 2019 12:02:34 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 6AEC97D78AE; Mon, 25 Mar 2019 12:02:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511753;
	bh=CXfPsIgEUI2b9cUTpOeKXwlJ/nJXiIf/2t9JTSfp3NA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2WVHL11XqSsufurGRq6FKbbCiPNR8gqT5IZ56DbbIaUH3+hktVXx0MwwJrq69nq/4
	byMqCBeyP08YoT4BFPohujZh6UEx83WXF7IdvuUmqZ+oc7Syd+w9aqe9k0Xa2OFnEU
	CydOBQL3ZkrCi97NkujboW2RRnfJ/7qhURTLO9Vw=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E5D1F7D788E;
	Mon, 25 Mar 2019 12:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511752;
	bh=CXfPsIgEUI2b9cUTpOeKXwlJ/nJXiIf/2t9JTSfp3NA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VmYGWQenEkLE+w1Wc9fzSe7x1OZFZYDJuZTHMMVZxBHFXc45G0jmKFyoOLb//sT38
	KaXHpPFHZKrw5Nmbg0GhT8sQdW6sOux8nNA4VwSYFYBr0UzW8Et2PoEn5hpRIENo3E
	kztrVmrx7HRXre2KwsmYOUHMGZ03qwfhO8r/wyuY=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:58 +0100
Message-Id: <c2bf4b5983b8f0bb42208eaf62643aaccc0163a2.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 15/17] Convert zynq's slcr to 3-phases reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nWkah7IDJ3m9

Change the legacy reset function into the init phase and test the
resetting flag in register accesses.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/misc/zynq_slcr.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index baa13d1316..47f43e1d8d 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -180,9 +180,9 @@ typedef struct ZynqSLCRState {
     uint32_t regs[ZYNQ_SLCR_NUM_REGS];
 } ZynqSLCRState;
=20
-static void zynq_slcr_reset(DeviceState *d)
+static void zynq_slcr_reset_init(Object *obj, bool cold)
 {
-    ZynqSLCRState *s =3D ZYNQ_SLCR(d);
+    ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
     int i;
=20
     DB_PRINT("RESET\n");
@@ -346,6 +346,10 @@ static uint64_t zynq_slcr_read(void *opaque, hwaddr =
offset,
     offset /=3D 4;
     uint32_t ret =3D s->regs[offset];
=20
+    if (qdev_is_resetting((DeviceState *) opaque)) {
+        return 0;
+    }
+
     if (!zynq_slcr_check_offset(offset, true)) {
         qemu_log_mask(LOG_GUEST_ERROR, "zynq_slcr: Invalid read access t=
o "
                       " addr %" HWADDR_PRIx "\n", offset * 4);
@@ -361,6 +365,10 @@ static void zynq_slcr_write(void *opaque, hwaddr off=
set,
     ZynqSLCRState *s =3D (ZynqSLCRState *)opaque;
     offset /=3D 4;
=20
+    if (qdev_is_resetting((DeviceState *) opaque)) {
+        return;
+    }
+
     DB_PRINT("addr: %08" HWADDR_PRIx " data: %08" PRIx64 "\n", offset * =
4, val);
=20
     if (!zynq_slcr_check_offset(offset, false)) {
@@ -441,7 +449,7 @@ static void zynq_slcr_class_init(ObjectClass *klass, =
void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->vmsd =3D &vmstate_zynq_slcr;
-    dc->reset =3D zynq_slcr_reset;
+    dc->reset_phases.init =3D zynq_slcr_reset_init;
 }
=20
 static const TypeInfo zynq_slcr_info =3D {
--=20
2.21.0

