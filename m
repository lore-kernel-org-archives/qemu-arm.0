Received: by 10.25.44.15 with SMTP id s15csp2049285lfs;
        Sat, 29 Jul 2017 16:50:42 -0700 (PDT)
X-Received: by 10.200.0.155 with SMTP id c27mr15697830qtg.322.1501372242053;
        Sat, 29 Jul 2017 16:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501372242; cv=none;
        d=google.com; s=arc-20160816;
        b=LmJ5NJ1iUKzYap9hjl7VOBP82egMemE3y1UVtWr9MIBDNjnwO4b4VTVUEROHj2hO05
         MgNb4ecbNtby5czVnFOyNDAxC3e8joSc+w31powiPI3xl09oiXWvoDK53UOsZ594WRzX
         56jb7Cl3nhvZjZyxUFvLVl3Tb1TcsAzpQsEMFFp5gjCrHj3oKHKR7wCx1iU9TeR+aYcZ
         Y/OGwFklTvZYKFaDJDFrifZ/KXPqSu/CLl9jOjjwTaEiky9SGFn0CTWr8+wW8WfhZwFF
         IQMS0J78tQCeke6T7MJ2G4mAGtr+6WFlrDtyRZC3u25FMHmbLerCL/NwJz1fPIiTHy0B
         YgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=+FhIYYUdNAEZeigKpfQZ3ADAgZ/E+zzp+OVK/FnfBxI=;
        b=iTl+J401hBPRqTuvKhe1y/tnAPE9a0XPsIFhgbtycs5bTLtF7KMyD1ato6iL6ssDEy
         wBkFDutBSTp+F5ZO3yyhkdXF4/OzQ/2FtpihLULm0dZEJ0oa3LkNoQR4kk9+Ugqseg1v
         2FEqt4qmiosFWohdSQ4Ahu4mrDj29srkPxMEps2r7XKHsxtwJbgirkgZE5NBVUF7kvi4
         nQs0EtjdZEBPe4LV0m8bViFPI+uFG1OZcBqft1/A5HBFhCtCfB7Ox2TZ4erSxiOI2ATk
         E/LFcxMm2fPFiS4wiPDpPZ8nZ5IXgQnfB/ycK+irta0ymEx8wK+RbNjKs0Ve0ObKMsFE
         B+nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=rFsPp2nu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w9si9106252qta.296.2017.07.29.16.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 29 Jul 2017 16:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=rFsPp2nu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dbbVH-0006Xd-Db
	for alex.bennee@linaro.org; Sat, 29 Jul 2017 19:50:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbbUN-0006Aq-Kg
	for qemu-devel@nongnu.org; Sat, 29 Jul 2017 19:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbbUK-0008Vj-JN
	for qemu-devel@nongnu.org; Sat, 29 Jul 2017 19:49:43 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbbUK-0008VM-F1; Sat, 29 Jul 2017 19:49:40 -0400
Received: by mail-qk0-x243.google.com with SMTP id v76so12385455qka.5;
	Sat, 29 Jul 2017 16:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+FhIYYUdNAEZeigKpfQZ3ADAgZ/E+zzp+OVK/FnfBxI=;
	b=rFsPp2nuDvoSynq8ghfBOoAJnpOYpGoAzgPIF3+074+ASCGsxmvCqadaeFWApA+3P/
	B6VcKiMlH3leDWjlF904NKk9X73GdoxjUfFqfRJB+mdUOI3tW+Yp63IgGraeY/MZ5pmB
	B6ix9MM8GiWz6+KEqVlCIB6BwaziImxiAQJ+Noma2KA8+42EfxX2l4jczHkox3krb6Az
	Hp5gfV9QDFsmjnLwXkqWIhJeUjR8hEqeWRbd9KCAOXppWn4InHgHnpfi4VSdhBikAFHr
	9B2XpcBhko1kYGtHAMRB5NOeZDHLuLPz2sN7w3JXlSN1Bx2gUOkywohl2n4UNaE5n4UQ
	fDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=+FhIYYUdNAEZeigKpfQZ3ADAgZ/E+zzp+OVK/FnfBxI=;
	b=Oi74KGBbbe8pz3E80Q9wVOvTM5TSsfBuY5K/dg7MRCDOVShgJSsFnUfD0ASdLEAigh
	Ch8q1tsou2SIG/8A6xf2wvYoBN/ZIOAXLqOxQa+8ytjaBT0fLwWWzibDE12ViD7LwsLM
	/pVCMYLnyaOJV+Mz06eSUg7t0IAIoujNUecCzL17OA8T3MCnV8DDcw5ulWxRPAN3DU9y
	AVa2A5r9VdufxZVtdPNy9Q6pYcy/EVq0EP1qHorEUm2pD0yEkEI+U/pLGmCpxyZbsQac
	0AkK1AKOGciT2KlKvlsRiqZkQcosoG3SUdjpiynOk6UM/srdVuAQqoxLxhyTWwNRYDna
	INSA==
X-Gm-Message-State: AIVw112LzA37qzZalUbvuCZzUd25Cdn2I2IezvIYx1hyJ8+w5aBd1O+j
	uz+m+Xu56xiPZA==
X-Received: by 10.55.123.131 with SMTP id w125mr14807642qkc.177.1501372178413; 
	Sat, 29 Jul 2017 16:49:38 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id d3sm2733521qka.79.2017.07.29.16.49.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 16:49:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Jul 2017 20:49:30 -0300
Message-Id: <20170729234930.725-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH for 2.10] hw/mps2_scc: fix incorrect properties
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oWIK23j2C3E5

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
sorry, I missed them in my review :(

 hw/misc/mps2-scc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index cc58d26f29..32be2a9df1 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -270,9 +270,9 @@ static Property mps2_scc_properties[] = {
     /* Values for various read-only ID registers (which are specific
      * to the board model or FPGA image)
      */
-    DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, aid, 0),
+    DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, cfg4, 0),
     DEFINE_PROP_UINT32("scc-aid", MPS2SCC, aid, 0),
-    DEFINE_PROP_UINT32("scc-id", MPS2SCC, aid, 0),
+    DEFINE_PROP_UINT32("scc-id", MPS2SCC, id, 0),
     /* These are the initial settings for the source clocks on the board.
      * In hardware they can be configured via a config file read by the
      * motherboard configuration controller to suit the FPGA image.
-- 
2.13.3

