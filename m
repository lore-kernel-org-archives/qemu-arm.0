Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1756189wrt;
        Fri, 23 Nov 2018 01:25:28 -0800 (PST)
X-Google-Smtp-Source: AJdET5eTbE7aTa/kKcA7pfKMjZE3/0Lea8RnKL/lpQ1NUPib1aVMnwOGCt7Sdnh30zry03WRNhB/
X-Received: by 2002:a81:3cca:: with SMTP id j193-v6mr15381295ywa.273.1542965128867;
        Fri, 23 Nov 2018 01:25:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542965128; cv=none;
        d=google.com; s=arc-20160816;
        b=yePlzb5I8bFzpEXrH8Ss9B+X0bSV9+Kf260QEaF1hVZMZGqsxBnaRea9YquorXLxdq
         rGjTsudRdk9UxIfQJJIR1SR55O/P6fy7v824bcgMaUYqhzkIchtBcz1j8/eqzvi5yQl3
         ErSmN9WjjG9uASaV/FOcPjPraWF4FjzJBKe/5h2P5EOzN7fvG+hQdatmhxvDTrylYShi
         7YeAR4Hv4zlfV8Ax3jzm1ACUrl+7oifHCjN0bfDCa01HgvdNxjrPYR58DOT/Vhc5Ii2l
         cz++rzLWX2C7k4r4OjahQVNrRkkVOziWImTa/QwXX5x8MLaMuMFnHVRO1d52lL971+Lr
         kU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=w5Lfrx20DSJQ9L28NtcB9DFmrIB+gjRQ73c8XDLMPZ8=;
        b=DFr0d/X19Cm8zkG8XGV/2VwAM5aU2tk+FFk6wVHVibzXO90N/uMWFuYBx8u3X011LW
         ezdf6SUXemz7AO+kvRZIzMkCPKAfQIcPfoGXn/AtxPdbTKfLaa28y6T3UCaE3WPIZGPZ
         FzYR0GdaVyLvNiCb3h+Mu7HRT8oWtLUhy7jiAyVKG/5KoVevK9Uopr2DkR2PdGGjxMEF
         Zsymj+RZM+9vN5ymgldG1kBboccN0eMkdMWIs5CYvwiByfg+Ys4Bot+oVq8wz1QnxrYr
         lvDvMBsNzUftvpL2ZuuV8kCSCmNG81dlift6UOCT77LCh2tWDzgNwEitMjVzU9UKP3Rx
         y+jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1XagfGTW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sP2HEv8W;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sP2HEv8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n125-v6si32429543ywe.272.2018.11.23.01.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1XagfGTW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sP2HEv8W;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sP2HEv8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7iJ-0006fw-Ro
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:25:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bF-0008HQ-Ni
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:18:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bE-0001MQ-Pf
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:18:09 -0500
Received: from greensocs.com ([193.104.36.180]:47087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7bE-0000Y8-BP; Fri, 23 Nov 2018 04:18:08 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BE04C5E7085;
	Fri, 23 Nov 2018 10:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964658;
	bh=E4uuTgcGUqGNTMOd03OtfX4La20pAFXFtyf8Zbn5sAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1XagfGTWq49UqKnfoKysJGF20HX/i/+we8fNezvebsx3qSOO247einOjIdd2K9aCp
	0hwdqe/tHa3AEOqEP7w4X1sJGcqHPiJsxJzCloyj7e+aCmCvpu1hhWwC7CdU/PQTPQ
	2GDTVmGzjibbSaNWCIX0LhnPpWl4JTWRs8bv/+AY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sP2HEv8W;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sP2HEv8W
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVKZyILpyXjc; Fri, 23 Nov 2018 10:17:38 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id DB1565C0270; Fri, 23 Nov 2018 10:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964656;
	bh=E4uuTgcGUqGNTMOd03OtfX4La20pAFXFtyf8Zbn5sAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sP2HEv8W722Li+qwu+69t81cbF7qsN58HCOgC73I7jqPqnDf+RnjqaL/BSwLC1WCF
	twpma+9Co6A3kriRCGx4n2F+LiLbCCkR+0FIfQFUFrMG/Bwtt8MpO0HWaljeeErl/Z
	qmznUC6X/uKdsKi3+ILDpUQqR1H2rWGJ6BHWEJZ0=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 5655F5BD1BB;
	Fri, 23 Nov 2018 10:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964656;
	bh=E4uuTgcGUqGNTMOd03OtfX4La20pAFXFtyf8Zbn5sAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sP2HEv8W722Li+qwu+69t81cbF7qsN58HCOgC73I7jqPqnDf+RnjqaL/BSwLC1WCF
	twpma+9Co6A3kriRCGx4n2F+LiLbCCkR+0FIfQFUFrMG/Bwtt8MpO0HWaljeeErl/Z
	qmznUC6X/uKdsKi3+ILDpUQqR1H2rWGJ6BHWEJZ0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:24 +0100
Message-Id: <20181123091729.29921-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 11/16] gdbstub: add support for extended mode
 packet
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKAJEDnirW4+

Add support for the '!' extended mode packet. This is required for the
multiprocess extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 0cccce1f38..5cc643b9e0 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1296,10 +1296,13 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
     trace_gdbstub_io_command(line_buf);
=20
     p =3D line_buf;
     ch =3D *p++;
     switch(ch) {
+    case '!':
+        put_packet(s, "OK");
+        break;
     case '?':
         /* TODO: Make this return the correct value for user-mode.  */
         snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
                  gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread=
_id)));
         put_packet(s, buf);
--=20
2.19.1

