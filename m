Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1098249wro;
        Thu, 14 Mar 2019 10:21:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfbG2zNvDKjaDRdnRcU/NkSHtjz4uHOn1NraGkqTKAvquQ5szCmKUYRIC6dYz4tTg/3dQZ
X-Received: by 2002:a81:1ed2:: with SMTP id e201mr17068216ywe.49.1552584074091;
        Thu, 14 Mar 2019 10:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552584074; cv=none;
        d=google.com; s=arc-20160816;
        b=vwJkovh4ATQf65JZgpkC+gMtgMm5jdHLGMf78uvbcRnIYjYcW2rb1uqkp3mlusnE8k
         9jy7RqU9MhWxHi/7PqJPskqCAmHjZd3YkEYSxOQBC9JgdzCh241IUH3U4MVp8qjzqvUl
         oxK06FH3lLLWnCOQUUhkfAMbDDLKlAT0BfYbBE4auWarXsVUxrgvLfSPgjjFTjtdzPA/
         7byIYbeFeeZvpRuMwTsBaBKo7/csN1mZ5A7xKctsEJcuyohosuSilhhive4zo+RdrIcP
         9TXWh2OPqikq1ihSFJXLZCKbgBayHr48mTpR2j45ceha/BVWBzYt4j63DohuXhjuPRsK
         R+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=eXALk2zWFCXox474NNcmMvf1RSaTSUrmy3DFj7WsI4M=;
        b=Dcm7TKbJbK1UV5VUzPlQkUrEQApChA6T1mhiUAKs33CebUS/Pm60hmP1IC8LghW2Hb
         fzSQvF4ovj8ehGEWXA3xYFzT+/kieAnqVXoqIsmnx4SE3WTPT75wpJbE/LVJtVn8U6kf
         4PzSNiNXbmNNMJsfZyqYjVV15cB1GYqcmd0o0H1f7e/ahNXs0xQTwZp0F+4XZEfEIiik
         96G/4SJ2W9wyxDAW7e5m+V9urKbdVXjPaX4BbQe0KYhqvO8PblJUSm0RQEon3fW5e2CX
         riOxU0xmnNsnZNSRXlPELtCAvwijfKF5DjC56KG7APRgbBb2WyxmJO2CksMmyzbKVBo5
         VLRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t32si10304294ybt.398.2019.03.14.10.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 10:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4U2b-0006vG-Iw
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 13:21:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4U2N-0006uy-AU
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:21:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4U2L-0005Lp-VE
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:20:59 -0400
Received: from sainfoin-smtp-out.extra.cea.fr ([132.167.192.228]:46743)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amir.charif@cea.fr>)
	id 1h4U2L-0005Ko-Ix; Thu, 14 Mar 2019 13:20:57 -0400
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
	by sainfoin-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2EHKsxX040961; Thu, 14 Mar 2019 18:20:54 +0100
Received: from pisaure.intra.cea.fr (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 3CA1E20634F;
	Thu, 14 Mar 2019 18:20:54 +0100 (CET)
Received: from muguet1-smtp-out.intra.cea.fr (muguet1-smtp-out.intra.cea.fr
	[132.166.192.12])
	by pisaure.intra.cea.fr (Postfix) with ESMTP id 2AF42201C35;
	Thu, 14 Mar 2019 18:20:54 +0100 (CET)
Received: from EXCAH-B2.intra.cea.fr (excah-b2.intra.cea.fr [132.166.88.87])
	by muguet1-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2EHKrRP003187; Thu, 14 Mar 2019 18:20:54 +0100
Received: from EXDAG0-A1.intra.cea.fr ([fe80::ac4c:b0e6:f68e:69cf]) by
	EXCAH-B2.intra.cea.fr ([fe80::6d9a:7f48:7b8f:6abc%11]) with mapi id
	14.03.0415.000; Thu, 14 Mar 2019 18:20:53 +0100
From: Amir CHARIF <amir.charif@cea.fr>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>
Thread-Topic: [PATCH for-4.0] target/arm: Add sve_access_check to ADDVL,
	ADDPL, RDVL
Thread-Index: AQHU2oOb8BRpE/x/yEuoxO4AJVjEJKYLXNYg
Date: Thu, 14 Mar 2019 17:20:52 +0000
Message-ID: <82FD2C51B435F943BACD9C947966BF2F0A0E3BBF@EXDAG0-A1.intra.cea.fr>
References: <20190314163259.3058-1-richard.henderson@linaro.org>
In-Reply-To: <20190314163259.3058-1-richard.henderson@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [132.166.88.106]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-23234.003
x-tm-as-result: No--6.518100-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 132.167.192.228
Subject: Re: [Qemu-devel] [PATCH for-4.0] target/arm: Add sve_access_check
 to ADDVL, ADDPL, RDVL
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kpAd2xZ+nKAY

I don't really know how it usually works here but may I ask why you are tur=
ning my patch into your own and putting me as a reporter ? Are you allowed =
to do that ??
I did not just report a bug, I actually provided the fix and submitted a pa=
tch, you can see here that it's timestamped prior to yours (https://patchew=
.org/QEMU/ ), I was waiting for your reply to send it to the mailing list, =
so is it fair that yours is the one getting reviewed ?

Thanks,
Regards,
Amir=20

-----Message d'origine-----
De=A0: Richard Henderson <richard.henderson@linaro.org>=20
Envoy=E9=A0: jeudi 14 mars 2019 17:33
=C0=A0: Amir CHARIF <amir.charif@cea.fr>
Objet=A0: [PATCH for-4.0] target/arm: Add sve_access_check to ADDVL, ADDPL,=
 RDVL

[Oops, forgot to cc you in the post to qemu-devel.]

This failed to trap when required, which allowed an EL0 guest to execute wi=
th inconsistent data loaded into ZCR_EL1.

Reported-by: Amir Charif <amir.charif@cea.fr>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c index =
3a2eb51566..245cd82621 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -943,24 +943,30 @@ static bool trans_INDEX_rr(DisasContext *s, arg_INDEX=
_rr *a)
=20
 static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)  {
-    TCGv_i64 rd =3D cpu_reg_sp(s, a->rd);
-    TCGv_i64 rn =3D cpu_reg_sp(s, a->rn);
-    tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
+    if (sve_access_check(s)) {
+        TCGv_i64 rd =3D cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn =3D cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
+    }
     return true;
 }
=20
 static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)  {
-    TCGv_i64 rd =3D cpu_reg_sp(s, a->rd);
-    TCGv_i64 rn =3D cpu_reg_sp(s, a->rn);
-    tcg_gen_addi_i64(rd, rn, a->imm * pred_full_reg_size(s));
+    if (sve_access_check(s)) {
+        TCGv_i64 rd =3D cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn =3D cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * pred_full_reg_size(s));
+    }
     return true;
 }
=20
 static bool trans_RDVL(DisasContext *s, arg_RDVL *a)  {
-    TCGv_i64 reg =3D cpu_reg(s, a->rd);
-    tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
+    if (sve_access_check(s)) {
+        TCGv_i64 reg =3D cpu_reg(s, a->rd);
+        tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
+    }
     return true;
 }
=20
--
2.17.2

