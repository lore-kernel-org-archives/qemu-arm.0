Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5139224wrt;
        Tue, 2 Oct 2018 07:43:42 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63GJwhE3x9sB1zQKr0h0GVjLDDb1pfUt804llqmJ3tTJsivUTr1sK75QqIXSVGrFV83QMAH
X-Received: by 2002:aed:23c5:: with SMTP id k5-v6mr11542955qtc.230.1538491422287;
        Tue, 02 Oct 2018 07:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538491422; cv=none;
        d=google.com; s=arc-20160816;
        b=0jw8hiJiSuK1/b2TOoV6KCLqcvdLXET+WblvEmgYg436/9SONz5FqYzl+LLsFHjV2d
         PEmv2DbsEfy35jZ5neN2xQuKEBA6uD27j5BKeYR63+dA0ARcwQV9MHOwq/Pqw+JPaDlK
         +P4AV44jClFA9ASUUE8KP4KwzQMnFH3+liEkN+fqyrriH8WPZtEM9z91g0qG3hD2ATLY
         O373W+iwY/UCiSPwsBThPJuvgzVGh31uCNoHCo9KDksLv56IvmpLxHFfEp+13PqK15eq
         Lp8hA6ZNhGnvlSbq3zfZgm01h8p3l6X96peWua0WYUyJG//uzJRbAxIf5WgdZrpsDUmO
         IpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=gtCXD6Wq2+i92Q2UN3Up6dBucaSvSe+/0rj+LfncQ1Y=;
        b=CCisDMvpG3a1s0C4XCJB6u3Z1BgfmeKq/fu4LF5N5WvIeJQs08V8tN0ZE4pGydjG1R
         ql28fb5RqkqmqXU7pltueSL3t6Gf/6QYffzyGf3a8LM9hTG8H+fg0BOndMSy7ByyvjfQ
         w8DQrFvu91uT3oOBRd4aVqI37Y963aOHlaTJfU3sZQbLF4aMCpUwMqLFSnYjQkQR4uwt
         ovh2hyk+vmKgKLNIXteKTHnfCTb/BEe9eLdCl/xrAGxE4xEwmaWqPzNnbaobVWxznX+D
         BFXG4ZpqjcHjD720FULAhHe/rh2pSh2VZcKHPV6Oeytby4UkoFZHvPIFOrszJFD5NKRO
         g/5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="I2mDQ/VP";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GyuUaZGz;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GyuUaZGz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o101-v6si602831qvo.278.2018.10.02.07.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 07:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="I2mDQ/VP";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GyuUaZGz;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GyuUaZGz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Ltl-0002pk-N4
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 10:43:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7Lmw-0005FG-7W
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7LdC-0004QB-IL
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:26:35 -0400
Received: from greensocs.com ([193.104.36.180]:53815)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g7Ld9-0004Ky-E2; Tue, 02 Oct 2018 10:26:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 328B8442AEC;
	Tue,  2 Oct 2018 16:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490366;
	bh=FABDGza8O8IXXcL2AXTXajpC14NFz8iYXb5Sqj8mK8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I2mDQ/VPJeKkVbDyj/oHDbhy0Q54iQeSsTKfc4f2zaPtAOBAc5ryPZTsgPwOxRb81
	EbfYhwCjmPYB+YjVtS66gjRe0mCRwuJUhCYrf32h4WyrrlxHqQBEyyti7r3/oCOAVK
	m1yFDbiyU++tqXknBcd4LCRk1oNueRobQO/kQ7A8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=GyuUaZGz;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=GyuUaZGz
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DmLwSbXdySxe; Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 28BED442AF9; Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490365;
	bh=FABDGza8O8IXXcL2AXTXajpC14NFz8iYXb5Sqj8mK8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GyuUaZGzGGN5LtxLmojGJCqLPAXqnePxt5aa0MMAFF0tCKGYstoeGtiBNnzbO7o7Y
	l/28kGlQIld7E/QTOLkao2t6n4PsTP3WXUW3mI8d++GAbHvE2sk8qc2UIocqJ/lhoX
	091KDL4KsZUg1MkIU4yCW1+SSGJ2HgSIUnWBoHgQ=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B6AC7442AF8;
	Tue,  2 Oct 2018 16:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490365;
	bh=FABDGza8O8IXXcL2AXTXajpC14NFz8iYXb5Sqj8mK8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GyuUaZGzGGN5LtxLmojGJCqLPAXqnePxt5aa0MMAFF0tCKGYstoeGtiBNnzbO7o7Y
	l/28kGlQIld7E/QTOLkao2t6n4PsTP3WXUW3mI8d++GAbHvE2sk8qc2UIocqJ/lhoX
	091KDL4KsZUg1MkIU4yCW1+SSGJ2HgSIUnWBoHgQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:24:37 +0200
Message-Id: <20181002142443.30976-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v5 3/9] qdev-monitor: print the device's clock
 with info qtree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, konrad@adacore.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wyQHxEX4rgu9

This prints the clocks attached to a DeviceState when using "info qtree" =
monitor
command. For every clock, it displays the direction, the name and if the
clock is forwarded. For input clock, it displays also the frequency.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 qdev-monitor.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index 61e0300991..8c39a3a65b 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -682,6 +682,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev=
, int indent)
     ObjectClass *class;
     BusState *child;
     NamedGPIOList *ngl;
+    NamedClockList *clk;
=20
     qdev_printf("dev: %s, id \"%s\"\n", object_get_typename(OBJECT(dev))=
,
                 dev->id ? dev->id : "");
@@ -696,6 +697,17 @@ static void qdev_print(Monitor *mon, DeviceState *de=
v, int indent)
                         ngl->num_out);
         }
     }
+    QLIST_FOREACH(clk, &dev->clocks, node) {
+        if (clk->out) {
+            qdev_printf("clock-out%s \"%s\"\n",
+                        clk->forward ? " (fw)" : "",
+                        clk->name);
+        } else {
+            qdev_printf("clock-in%s \"%s\" freq=3D%" PRIu64 "Hz\n",
+                        clk->forward ? " (fw)" : "",
+                        clk->name, clock_get_frequency(clk->in));
+        }
+    }
     class =3D object_get_class(OBJECT(dev));
     do {
         qdev_print_props(mon, dev, DEVICE_CLASS(class)->props, indent);
--=20
2.19.0

