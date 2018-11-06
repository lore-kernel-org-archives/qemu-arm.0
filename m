Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp744541wrw;
        Tue, 6 Nov 2018 03:12:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5cL8arqnDDUPkKSJuCt7AkCop1EJPq0hvTYx+nruqyRuu02GEBNdLdZmMlCUrWaJMaNyiCX
X-Received: by 2002:a37:af85:: with SMTP id y127mr23023669qke.352.1541502769352;
        Tue, 06 Nov 2018 03:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502769; cv=none;
        d=google.com; s=arc-20160816;
        b=04S0IZxxVZSH8iw2jxn6ifSx7ensEvZQnF/a82+CQ8Ys4Yb2ZhwSjIelfKVsPn4w0c
         SAAV7ZQ7bhJntcO2j3pP0Q6A5ve3Hpdq0YQhxoNJuD2unAfmHb2iUAn+tXebXOT5/9iY
         IFrEIJT8vpPckXWKcguJ/nreEX8JFWDCtK5KD4U4jZvh0Q0JnAW6PLUsRaBGOp1XRUom
         tkm8OUgSdL4S5Zpo2elXmWRwcgiISvXQrqZXGxSI1hwhhIfRMd6PR0ibO5Ow7V81yYyg
         c+1ggZ9Lda0HX41ABKdTJPyWBMIKQvYZJlY5TNyCb4rQ/cOFDuDsk4CLbGRYgYBhMwwJ
         PN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Kh4aHP5sMQLPax3FqmUNxUEPI1erG3Nd6v4bXvufkUw=;
        b=DxfPp2jcNVMyjS2D1tICIkwR9FVlbuXMBbxsdpVWIFIUqRQy70bdnSYOdXi2N2KTan
         27Bc0C0onWux9ThQjWOSbiQoXcHj0UQnxHOef3tP8pQzQGp055qiVjLNl//0VzPjw+w2
         VCS/2WZe+6TdC5Wz5Kh1p1PmK761AKp50nkqbLl1h4BG2zZ2ZZJvXVWHQ3+z+wmPvktu
         dbppt8QyuNmpGJNpTfJYbTMzyQSlhrRtA7Pp4J1L3JY80DecZodeUwBtYirdkOs5962x
         F/Kf4V4nGGvVAkw8Nfb7bJ6fexeqhzTs0tSAE9wViDwPfKjBouQDcpWRMT6Z/XNYvZ1q
         /llg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2xclOS3q;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7fLbtjKN;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7fLbtjKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si6198332qke.104.2018.11.06.03.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2xclOS3q;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7fLbtjKN;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7fLbtjKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzHs-00059c-O7
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:12:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBy-0006du-Lr
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBt-0001Ho-CT
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:42 -0500
Received: from greensocs.com ([193.104.36.180]:46762)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBs-0000ra-Q1; Tue, 06 Nov 2018 06:06:37 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 29E0F5C026C;
	Tue,  6 Nov 2018 12:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502376;
	bh=Th2MJHUdNYEyzy14m2vDNx88f11TUXsyKWgcqpJpXlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2xclOS3qyEmApezL77MjwVe1yh+hx9Gtt1nWqCBO6vPd7nFLnjjKkRhzJUA2sknbd
	i+Ix+i56IAiGXiMMPcE4nBN51rNGTAUE0Njbk/GvPSyrQxlU9goiPfDLoBMAiibHSj
	cnMB0TjeWBYrv70vPIhw7FVZY4dluPeT10cux7zI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7fLbtjKN;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7fLbtjKN
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejPYYCtokP3r; Tue,  6 Nov 2018 12:06:15 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id C168C5C0276; Tue,  6 Nov 2018 12:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502371;
	bh=Th2MJHUdNYEyzy14m2vDNx88f11TUXsyKWgcqpJpXlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7fLbtjKNRjzI4BaglFHoezCUqwSK4xfeKuADv+I0dBhmdTW58UIXPzYDux06U+WS3
	+WZEqD4lVzvMmgMZ+Sraa31053XAVxv7bjbuMLyfVyqx/eWM+O2ab8p6vXotW7XP7X
	UwVqogk2prIjjBt7v2UgdOMBBt64kYJbtf2ZnEmc=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 558CA5C024B;
	Tue,  6 Nov 2018 12:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502371;
	bh=Th2MJHUdNYEyzy14m2vDNx88f11TUXsyKWgcqpJpXlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7fLbtjKNRjzI4BaglFHoezCUqwSK4xfeKuADv+I0dBhmdTW58UIXPzYDux06U+WS3
	+WZEqD4lVzvMmgMZ+Sraa31053XAVxv7bjbuMLyfVyqx/eWM+O2ab8p6vXotW7XP7X
	UwVqogk2prIjjBt7v2UgdOMBBt64kYJbtf2ZnEmc=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:47 +0100
Message-Id: <20181106110548.4209-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 15/16] gdbstub: add multiprocess extension
 support
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
X-TUID: YiCZUTyYSJYD

Add multiprocess extension support by enabling multiprocess mode when
the peer requests it, and by replying that we actually support it in the
qSupported reply packet.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index c662ada6ff..93a7c956c2 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1721,10 +1721,16 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
             snprintf(buf, sizeof(buf), "PacketSize=3D%x", MAX_PACKET_LEN=
GTH);
             cc =3D CPU_GET_CLASS(first_cpu);
             if (cc->gdb_core_xml_file !=3D NULL) {
                 pstrcat(buf, sizeof(buf), ";qXfer:features:read+");
             }
+
+            if (strstr(p, "multiprocess+")) {
+                s->multiprocess =3D true;
+            }
+            pstrcat(buf, sizeof(buf), ";multiprocess+");
+
             put_packet(s, buf);
             break;
         }
         if (strncmp(p, "Xfer:features:read:", 19) =3D=3D 0) {
             const char *xml;
--=20
2.19.1

