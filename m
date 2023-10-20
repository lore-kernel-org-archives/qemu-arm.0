Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1272409ejb;
        Fri, 20 Oct 2023 07:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm5Hk7apEkXj7Q33UMFbpA5LKK34AA+xggy7MGoTMYvT4WiTCS2U0oXYcSCusQ2GMD0KtJ
X-Received: by 2002:a05:620a:3b18:b0:76d:984c:9d01 with SMTP id tl24-20020a05620a3b1800b0076d984c9d01mr1752498qkn.33.1697812435484;
        Fri, 20 Oct 2023 07:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697812435; cv=none;
        d=google.com; s=arc-20160816;
        b=lu8rVy5n+lS5QKOgQyBVMIDfvRXy5zsM8bO6pNr6drOhlXyQ7rmd7NMnaYDMNK2+SV
         +B1IXtgJi3lQaypGt/q0VJGPp1sDrCDTAAu7MVN0D7UvxbjiLklQFpPdfVfGfZZiKzQ+
         X7YKup5SprPT4OrTHd0SXodoS0+RAPmxO1HpKOzihi6ulyWee6OeRlbHrSUWB7V34wRu
         F2q/AwM0jIE8uAJx7W2I94uJoJH/X+7DxSUAalwU4vG1+nCnH0mLB4rzjmeMbUZFOxYt
         Wq2nva8LnoGyMAQjWiBstbWaXteurQg+eL+om2NysUrAkQwZdlXqEYUIbouZB0qQ+4bT
         Fxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=tYVE9IC2ClLdtgbrCfNb6VyOQ4yjydORJOpIfrgER9E=;
        fh=n2jljoNyX6xoPFNYGojQWAcfpdjZ2q1bno+WmE04BuI=;
        b=I24h4bug3eJKts2oNHqyK4r77M5EBSx1Q5J96327rU3MUbiJOs9KhGqZ1eoaeFKxTN
         HJG1bxU/yJN/yR/CsWh6V+jWPqDbE2y6EjXtMgVwdAVarILQVSB6ZBynC3GJvIWIHJeY
         AcQNq55pwlS8wsaMhYYCy//h0Ml3TGndYLRniUnodVBHCSZlfzwYOlCxFx6Xx2B4YF5g
         /MMz/DCBcSP0WC9PeQXJ2nix1lgKz4fpKt/eN7BEr41ebyaa5FNtBve3FrpuUKcAPGDp
         qrQbA69uzKyQ+PbJBHemM5NkrKbWbcH1tNpStPeHG1CC54CQCobIijcYLlyDknh+jfiL
         Y7Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=g3j49mqf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020a05620a2a0400b007758338a7a8si1431687qkp.653.2023.10.20.07.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 07:33:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=g3j49mqf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtqZ1-0000eW-Fl; Fri, 20 Oct 2023 10:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1qtqYn-0000Y4-NG; Fri, 20 Oct 2023 10:33:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1qtqYk-0007fP-PS; Fri, 20 Oct 2023 10:33:09 -0400
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39KETpRh024491; Fri, 20 Oct 2023 14:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tYVE9IC2ClLdtgbrCfNb6VyOQ4yjydORJOpIfrgER9E=;
 b=g3j49mqfZJDxUDRsR80kQSZs2ax4/NzqPrVvZCix+t3E0A0r8naBDpGVb8yuiTPpNuvK
 sdSWSUzuX9QiK0SOflzfilzxwjOynPWyVDpF/qVSM7XHaVX+Xk/2iGy3xTFwDGB44yVD
 2zJ6kY2Bjk/aP5PFYxk0C2dcIFJHcHPJGUl5BsrJrE19tu0G1YQcsk4OcDanZVjtJFRC
 fV4IXpKT3wHnDTUkkQIL7F3P2gozQzO+36F9UlBQ6VL7lAGyg8tmdOL1FKHfuyoQeMbi
 0GuJLXFBlQxuPrEg8EdBCfPkP0ed6IV1lgWbl17aJhSfBV+Y2Lr+jVGj3/fPeDpAJOxq gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tuuc3r63f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 14:32:44 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39KETxDr024970;
 Fri, 20 Oct 2023 14:32:43 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tuuc3r5s4-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 14:32:43 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39KCFAsi019366; Fri, 20 Oct 2023 14:21:27 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc45529j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 14:21:27 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39KELPtD22348344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Oct 2023 14:21:26 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D058F58063;
 Fri, 20 Oct 2023 14:21:25 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E6E15805B;
 Fri, 20 Oct 2023 14:21:23 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.61.43.147]) by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 20 Oct 2023 14:21:23 +0000 (GMT)
Message-ID: <eb22a091532e2e1a523fd070f7da1e82f11b85ea.camel@linux.ibm.com>
Subject: Re: [PATCH v2 09/12] hw/s390x/css-bridge: Realize sysbus device
 before accessing it
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Huacai
 Chen <chenhuacai@kernel.org>, Beniamino Galvani <b.galvani@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-s390x@nongnu.org, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Markus Armbruster <armbru@redhat.com>, Song
 Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>, Peter Xu
 <peterx@redhat.com>, Sergio Lopez <slp@redhat.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Date: Fri, 20 Oct 2023 10:21:22 -0400
In-Reply-To: <20231019071611.98885-10-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
 <20231019071611.98885-10-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RWyzPD_UQlEJFHxFSLt_Rb-lD0CDjEBu
X-Proofpoint-GUID: L4UfDEW0wWhhBzG8MkVemaV8Ee6d31MF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=849 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310200119
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jXDifuBMv1By

On Thu, 2023-10-19 at 09:16 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> qbus_new() should not be called on unrealized device.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> =C2=A0hw/s390x/css-bridge.c | 7 +++----
> =C2=A01 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>
