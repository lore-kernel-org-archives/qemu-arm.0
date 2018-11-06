Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp752118wrw;
        Tue, 6 Nov 2018 03:20:36 -0800 (PST)
X-Google-Smtp-Source: AJdET5cMzn7e5tPvkKiXqTQgDsVtwA70145dB126wERdwHn9LSJN5xP68s74fLKHaOvfJm7Q39Ml
X-Received: by 2002:a37:9046:: with SMTP id s67mr22917334qkd.289.1541503236079;
        Tue, 06 Nov 2018 03:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541503236; cv=none;
        d=google.com; s=arc-20160816;
        b=PPQGgZJX7GQmoJbRSK24j3iQhzxMEY1uwj0sDNIwB430Y3vspdjSRO0oi+hn1EZOvr
         j0a84KQRiXVy2flX/zlrNAHOA8EFR3hDojk8mqH+WwBEPF0S1p7Zec2xzbAppqMF/TyN
         47BIcbDQfQz8fjgyS/oQk0cyov3+/25EEVkriX8MBxA5GK1ZPa/V3Ws7Dq4X8utNzgBx
         IOGEXzlWsCP0MdvUn4UwLhXakO+UeQ2xfQoYaLkNlX4m5vrjQWPcUjZMvCd4zq5CH8a3
         P3pWq6IpdN/1AjDmq7Kl6fJxAskXQAWcWgpC03AMEZ3DTqdjtAImMzvLOXMqMMMI745y
         3i+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=pjXUpgOUGeK5dTocPFrhxuE/Oqaq+JchJ8+sNY0Rkag=;
        b=ofPVOChTl8xfnwUc+0cAhfKsPWoKe+CYef0WssJNMX/3CZ0R6aMwDeTWTrjASfu0aN
         Sz46YMC0J/HEwlGu7h48Oqa5lKDG3zSoHPlw+nq8TNX3+E+5NWwLba/SvPXsMedJbxOe
         1Pv+HuSyiDXbZYWMlhBTtAVOFXfB3GtQpIVJvgs8LhZtLHNIVnWtyCGP66itQ2h51qq2
         9QTbvpBgLNfCJZCgWnSL3C/bEhI8v8awOnDpjn2HhIq4jZwSBUdiAMD8rap2TC+oA64O
         VmjMs7Mzy0vjk8ssjhCtwyfuPfzGNDBxRksrQze1Kd7njuZXwTIr/Z7v7B4lNAclbYjl
         4BVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HeVVH0he;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=R4N11l2t;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=R4N11l2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t12-v6si10232908qtp.212.2018.11.06.03.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HeVVH0he;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=R4N11l2t;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=R4N11l2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzPP-0006pH-HY
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:20:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBy-0006dt-Lh
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBt-0001I6-Gn
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:42 -0500
Received: from greensocs.com ([193.104.36.180]:46757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBt-0000rN-0B; Tue, 06 Nov 2018 06:06:37 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BEE325C024F;
	Tue,  6 Nov 2018 12:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502375;
	bh=WgnMQ5pr+n/ESL8puF7jtpCC/FdzwfDNBDnQ0ACltqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HeVVH0heJOMDA+QGO9c54JgekKX6dhBEfx2lf244IXICmBfEA+lQwpW2/StL9Wkvn
	d9D1Aex0QeOwSK2odlPuaZlyM8kiXAgVRh+BI3/2Rqu4x6W2mFFdJ7nxttuV9gwzFQ
	FOvFlciOAmuAG0c7/h37yu9lDLQh1oCVd94Wm+Fc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=R4N11l2t;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=R4N11l2t
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ak2o_1jwB_cM; Tue,  6 Nov 2018 12:06:15 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 619705C9D9A; Tue,  6 Nov 2018 12:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502371;
	bh=WgnMQ5pr+n/ESL8puF7jtpCC/FdzwfDNBDnQ0ACltqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R4N11l2tv026tICF5QcMKE9GdctVx+m843XPTPvZ0tvJOnAU0b6RQ2bm3pKeyoZjZ
	8Wr21x0Uco3kFN7UDS+sUW2m63ZdFEDwZSL1JoZeF788Q3odXQjGSmVhOj9dlB226H
	JAvxuiLe7Lyvfa4iwtMSDyGxHZHgOAAzSzNs/Ubs=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CE81A5C0276;
	Tue,  6 Nov 2018 12:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502371;
	bh=WgnMQ5pr+n/ESL8puF7jtpCC/FdzwfDNBDnQ0ACltqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R4N11l2tv026tICF5QcMKE9GdctVx+m843XPTPvZ0tvJOnAU0b6RQ2bm3pKeyoZjZ
	8Wr21x0Uco3kFN7UDS+sUW2m63ZdFEDwZSL1JoZeF788Q3odXQjGSmVhOj9dlB226H
	JAvxuiLe7Lyvfa4iwtMSDyGxHZHgOAAzSzNs/Ubs=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:46 +0100
Message-Id: <20181106110548.4209-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 14/16] gdbstub: gdb_set_stop_cpu: ignore
 request when process is not attached
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
X-TUID: 2T6GeariEJpj

When gdb_set_stop_cpu() is called with a CPU associated to a process
currently not attached by the GDB client, return without modifying the
stop CPU. Otherwise, GDB gets confused if it receives packets with a
thread-id it does not know about.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 1a3353ff3c..c662ada6ff 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1787,10 +1787,19 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
     return RS_IDLE;
 }
=20
 void gdb_set_stop_cpu(CPUState *cpu)
 {
+    GDBProcess *p =3D gdb_get_cpu_process(gdbserver_state, cpu);
+
+    if (!p->attached) {
+        /* Having a stop CPU corresponding to a process that is not atta=
ched
+         * confuses GDB. So we ignore the request.
+         */
+        return;
+    }
+
     gdbserver_state->c_cpu =3D cpu;
     gdbserver_state->g_cpu =3D cpu;
 }
=20
 #ifndef CONFIG_USER_ONLY
--=20
2.19.1

