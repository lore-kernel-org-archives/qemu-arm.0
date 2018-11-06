Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp749991wrw;
        Tue, 6 Nov 2018 03:18:19 -0800 (PST)
X-Google-Smtp-Source: AJdET5f23pJ1eF4l0F/aXJYiVtGDP0kMluQHhxtqpELx75fpEH1GkGx7BURVQRMda1sSftybzadU
X-Received: by 2002:a37:a703:: with SMTP id q3mr24394841qke.272.1541503099467;
        Tue, 06 Nov 2018 03:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541503099; cv=none;
        d=google.com; s=arc-20160816;
        b=uXnhomAwH8oOFYkNYj2KUX8XiGDqJQ6uNniQE1eTU7klP0h1EiQ6vFgU1veXK3dNm5
         wbPGX/p76uZgxYxOczeRlBUrdBnQ+WSqlyKDmLTsxwwf3WoR/PtdioJOwo6+QO1kxXYL
         IyykAfR6nKtykZsmQXZs3JTQLr6HMkRBh2lbRiw76J6w1+gNzoluTB7AkwoSdg25qX2+
         VoKgUMbdPcz+RXTqexLleHuI1VJFmM2SlSkDkzSO+rfivsZSx5aUPngSVIi1B9ZL6cnl
         eRYnORPoPOGc8pAgj96/8ai6vBjIfUDpVcx7wOguWF9poz0m686Ygh9IOLtwqfcmVWsf
         RG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=yEEfEsi6+XAjBxk95n8NYwVQ8wvzJMCTZAdq9BxhknE=;
        b=dbnfrwx8dmu/kKWKfjjvskzwXqueiL470t21HYw6U2aybxdXnLjyUw/g3Yis4dSrQF
         MiLmsocfgDHeJeOutYDHQZBnq5xOnUmcNCysr6lyO4+qz15brK98rysmSQp+yzoOiI3U
         o7me2Tz7CBakFepYLsTzHhrclOsjE4F2Q37TrCc1yCjXYL1mkCGH/Kmb6xMTvJE/sEri
         oJpm+6a3tJsexI5kWv7cYTlgOuLto1wRTORNp8ki138p+ro/N7XQ36h/sr1vwmtHI6WJ
         fIvpCcJ2bYtBFgggR8fT3H9A3PA5XyzvqxgS82UT3+bkZWjlvfFXEJZzMYdM+WT8S+Dt
         cP0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cn+2VUa9;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7WIts+2M;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7WIts+2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v63si3977604qkg.134.2018.11.06.03.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cn+2VUa9;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7WIts+2M;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7WIts+2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzNC-0002SA-QY
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:18:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzC9-0006mi-Jr
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 06:06:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzC4-0001tz-Im
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 06:06:53 -0500
Received: from greensocs.com ([193.104.36.180]:46712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBs-0000os-IH; Tue, 06 Nov 2018 06:06:37 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id EA729441B53;
	Tue,  6 Nov 2018 12:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502374;
	bh=o3KJuqJsYNukd/ec4ozLQhf6Dd7aHydQxO2sBiH7PrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cn+2VUa9fyPkfidaxNGwOe8e5O+PdNc0Cvm1UXFeiDOTN2rvMFrLJvJ5ZO50frgtd
	XaWO9gnEkVYVmmCyODRAc3tGWooF37Xfvz54AKbxZ1Jn73e7V7MVYaoVY2Vy6zBYXO
	KvTFWiryX0zA1cQZxEyn/r9C2RZiGpYn66bRnTMM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7WIts+2M;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7WIts+2M
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aV-oaka--RQA; Tue,  6 Nov 2018 12:06:14 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 21F165C9D98; Tue,  6 Nov 2018 12:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502370;
	bh=o3KJuqJsYNukd/ec4ozLQhf6Dd7aHydQxO2sBiH7PrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7WIts+2MS0Lfqpez9opuO08aybUrWkBoObTXe+keTARL8M/FUbf3Hr3K4yxQeXMjK
	DAQWm2NJpzfBDugezcWsFv7VrAk5r33/8LMwZUAmF5ls+EaNwOuPPPoIGh4qkGqlH0
	jkFVNPPG2kkqsMHyhoy6ISa4BKvBpgzGmTNu6jT0=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id A7CDB5C0276;
	Tue,  6 Nov 2018 12:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502370;
	bh=o3KJuqJsYNukd/ec4ozLQhf6Dd7aHydQxO2sBiH7PrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7WIts+2MS0Lfqpez9opuO08aybUrWkBoObTXe+keTARL8M/FUbf3Hr3K4yxQeXMjK
	DAQWm2NJpzfBDugezcWsFv7VrAk5r33/8LMwZUAmF5ls+EaNwOuPPPoIGh4qkGqlH0
	jkFVNPPG2kkqsMHyhoy6ISa4BKvBpgzGmTNu6jT0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:44 +0100
Message-Id: <20181106110548.4209-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v4 12/16] gdbstub: add support for vAttach
 packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /F2e/pmVb+vo

Add support for the vAttach packets. In multiprocess mode, GDB sends
them to attach to additional processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 4132227092..ba365808db 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1340,10 +1340,45 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
                     break;
                 }
                 goto unknown_command;
             }
             break;
+        } else if (strncmp(p, "Attach;", 7) =3D=3D 0) {
+            unsigned long pid;
+
+            p +=3D 7;
+
+            if (qemu_strtoul(p, &p, 16, &pid)) {
+                put_packet(s, "E22");
+                break;
+            }
+
+            process =3D gdb_get_process(s, pid);
+
+            if (process =3D=3D NULL) {
+                put_packet(s, "E22");
+                break;
+            }
+
+            cpu =3D get_first_cpu_in_process(s, process);
+
+            if (cpu =3D=3D NULL) {
+                /* Refuse to attach an empty process */
+                put_packet(s, "E22");
+                break;
+            }
+
+            process->attached =3D true;
+
+            s->g_cpu =3D cpu;
+            s->c_cpu =3D cpu;
+
+            snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRA=
P,
+                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
+
+            put_packet(s, buf);
+            break;
         } else {
             goto unknown_command;
         }
     case 'k':
         /* Kill the target */
--=20
2.19.1

