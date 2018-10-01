Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730928wrt;
        Mon, 1 Oct 2018 04:58:55 -0700 (PDT)
X-Google-Smtp-Source: ACcGV625SiCd5KLW4R1SFqNodo9OI7Ping+0Pe5EY46hhVhIv7WG41GidobdC+S+Hwq0l0fD0PD/
X-Received: by 2002:ac8:6616:: with SMTP id c22-v6mr3052420qtp.199.1538395135904;
        Mon, 01 Oct 2018 04:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395135; cv=none;
        d=google.com; s=arc-20160816;
        b=l9PXxRy0odflTRh5xAuCykBkf9r5EPc55uaIlnPxIv5UG5VUAINGEhwQlkwiZhZXIr
         t2MsVKKpQSQbUCvDKFrPo8Ffn73PzvScOAbCpeTGJwvC5vEc7tplrRfAtGK0t+K1cIqG
         ws+TzpM+jtRjbL+tBN1POW+AYpZUoWwI3dFBYWYMBvuviDXehykH8SI9A8GsjxLfDNuh
         F2ECj/UapFDrp9Z71p1nOPlbaFN7X5b5BEHc4t6TyRVzavmUsIrQtoMJEnXncCRNYTT2
         YlJQkPwsclgzoi6kSV6XCv8tDIiwkSkSKWUxnt1V9BRZzSjNY6yk2BHZUMu4Gr+5LeH2
         xSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=p0tDnzHNA41reHSymZ5jzzQU3jHsp0GZDRjJa2xFA+8=;
        b=nPpdp4sQ8RslFALtkqkIzQ1gg41TB3tkKFmo9YOVA4TMmq1DtEj42Z9VQnezgkws69
         Dg5PyT/yZs044TDCaH0zBdfb8Z7GEg8ivRsUk5x3t1oe/P92vcfW3NxYmHftWG955AxD
         wrBBYJwpmSpGivsN814ye4D4vLVE99FTfYfdnp7TuB/VJyQf4otM1XvZ5tbzdJpnD6d+
         D1w5FPvnJQ4AOqymZAXvzcx1kZO0gXTsoKyAaFlWebMwChj8kER5eBosen3b5/HmRxAR
         P/SGP3s/KOFnjrTgeCKJlngsjmdlwaPKsdOQhozgfMRWrXP31x80I3OFS7NtRa2X3DVE
         PA7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ODoDAjvw;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="I5Fi/0n0";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="I5Fi/0n0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22-v6si3283842qtb.19.2018.10.01.04.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ODoDAjvw;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="I5Fi/0n0";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="I5Fi/0n0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wql-0003SH-CR
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:58:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NU-JU
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpN-0005jD-11
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpM-0005ga-Jx; Mon, 01 Oct 2018 07:57:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 57F6F511C73;
	Mon,  1 Oct 2018 13:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395034;
	bh=sGpdDHnh6UkEpab7HOOlprckQf+/+DmBBAJDYJ7oNXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ODoDAjvwk7yRfdPWRSdA35lCvt40g2kD52UCtiffhDH1CkJzONR4zp9SMzD0ddTsQ
	fkmWqAJ/F+zisHEAOV3J0e3UHcKETGtQRyFmrbCwIFisTw81dWA4xOah6fTeC/SSqR
	N/mr2oX2SnnZsbXdGHLEi9oBD1D8WEKuW5eVxb2c=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=I5Fi/0n0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=I5Fi/0n0
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ktq2mU35kMaA; Mon,  1 Oct 2018 13:57:13 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id F0E13511C71; Mon,  1 Oct 2018 13:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395030;
	bh=sGpdDHnh6UkEpab7HOOlprckQf+/+DmBBAJDYJ7oNXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I5Fi/0n0fWy8A43hHgFNh/zJ+jNPhozWmosNy97lXL8Nccv3hFXk/ScySj8uB4z6l
	GSpH4jct18gq6Iv2ownW36MUKQ9drDQGd8ORjt0Pu5CUE+OXxHB5YvhRqzfL6p2F4T
	e45LaB9ZerfhHknhiJp/d8wnTC+RxPzsjALgWLRE=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7CF27511C59;
	Mon,  1 Oct 2018 13:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395030;
	bh=sGpdDHnh6UkEpab7HOOlprckQf+/+DmBBAJDYJ7oNXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I5Fi/0n0fWy8A43hHgFNh/zJ+jNPhozWmosNy97lXL8Nccv3hFXk/ScySj8uB4z6l
	GSpH4jct18gq6Iv2ownW36MUKQ9drDQGd8ORjt0Pu5CUE+OXxHB5YvhRqzfL6p2F4T
	e45LaB9ZerfhHknhiJp/d8wnTC+RxPzsjALgWLRE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:59 +0200
Message-Id: <20181001115704.701-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 10/15] gdbstub: add support for extended mode
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MJwp0J+qyasA

Add support for the '!' extended mode packet. This is required for the
multiprocess extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 299783b3b8..d372972dd3 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1280,10 +1280,13 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.0

