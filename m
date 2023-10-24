Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2182155ejb;
        Tue, 24 Oct 2023 09:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXFNC09YmSvzn4AnCPA57/gBo751l9/iiMVSXMdLbFAfV7OsQPAuALGIzWprrOuUJBGt2f
X-Received: by 2002:ac8:7f47:0:b0:418:cec:5e64 with SMTP id g7-20020ac87f47000000b004180cec5e64mr25995218qtk.19.1698166229766;
        Tue, 24 Oct 2023 09:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698166229; cv=none;
        d=google.com; s=arc-20160816;
        b=0vnupWmBS/wDLFB/mGBgDt7u5sWDdkD26KJMcHKVjAClagueRdeYTh1bitvhxXHHpK
         8vNSLJPLB0UBWtfDSlApddU0T4pSSWfNSw5q+e8BLSxnjS4gnvIi2t8MofoFe5nzBnHj
         qT1+qXcsF4AGBHdOJKHn0MDfpbi4wfZbUQPWsQE/OussW9Z3jXLech5kqb2ZFQZfckYW
         lrYGNMCLnMu3wHs6NepwVa3Q8B+JXA7Y7AgLjOtR8sA6UDxkPBDnLzMJxJtUgORiXugc
         5hza3mvCNbzxGEzoaCRrFwuc/mW7sJws+uRQmlJYBRCT+xoG3aj1f8NKT4W2CzpJBCxA
         OL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:cc:to:from:subject
         :message-id:dkim-signature;
        bh=0lKyN66Rf1buaK1UeBUAkOfJg+45XKZmOhmJbMRVDSI=;
        fh=jzcARzHNbGpxEg+q0SPYJHtbgbJlh53yEEaSd0YDiUQ=;
        b=kE1Mv17vX5lJoyD+KeacWxmLz2+jlL/HCKhHxLEtYf8c0/0SGV3LD4o5R96qrgs+fo
         Gdm5mAs0PpZKGK7WmKm5RFXXDl9CpMp3HPzFsiYgfVkYTbptSh6TyROFTUeimHCiiM5a
         KbJs2iswxSvfioe3wMzD3ZhDN6oYFSTJHUS3vfUoNHflv7Dz4JCug0eTDqnDRzbnYEdN
         9vGNwON1ub98RGSasA+K6gEV0tJ6bT+u91WsCK4lUhX3l2wKma23Sc8vonjanIeALBhE
         Spck34XiUv61v1FPIX0cb5ut+n8yphZx8XMsMqaKIQ0MeU7D9RdvpJK/GhLVxO6t2ipC
         DReg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Ng8gpBfB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21-20020ac87f55000000b0041cbc899cf6si7251435qtk.180.2023.10.24.09.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Ng8gpBfB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvKbp-00028a-3j; Tue, 24 Oct 2023 12:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qvKbn-00024A-Vg; Tue, 24 Oct 2023 12:50:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qvKbd-0000Yq-Sp; Tue, 24 Oct 2023 12:50:23 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OGm0m5024081; Tue, 24 Oct 2023 16:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=0lKyN66Rf1buaK1UeBUAkOfJg+45XKZmOhmJbMRVDSI=;
 b=Ng8gpBfBf18g4pIYh1jmtxhMRFwzQnz6woOs7MSAeG0fp39HxfMGDOPkyNAr6gebwzz0
 tDl5x9zhH+5pHqzmpkdY+SIe5QpXRu3LEaUIwduJik+I6/8CVZEhLBBGflqaBb3ReRI9
 AmYQJZtoSHMBrEZBThkHCu2xN9JhU/NsUySKw2RM+af9ZuQvBIOm4MQ23VwL7nzOGZ39
 aHVA0nb71jRPX6qstaGek/ufWVjD4UCBnnp2zIoo1E6uyDoWKcKDm2A4YFV3n+pZsb8q
 xpGEJ24ySc4s2gd5Y5ZLeF/zCxhA+pNVsNf67CPRyGVv9QnY45mDNSMxCAlBIlznaLDH 6A== 
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3txhrpr2qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 16:49:57 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OG1UPh010218; Tue, 24 Oct 2023 16:49:56 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvsbyh1pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 16:49:56 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39OGnuZi17564386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Oct 2023 16:49:56 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48E9D58053;
 Tue, 24 Oct 2023 16:49:56 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4E0F58043;
 Tue, 24 Oct 2023 16:49:55 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 24 Oct 2023 16:49:55 +0000 (GMT)
Message-ID: <8dca5989e1db6f433c63183a3922f5ed90582ab1.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] misc/pca9552: Fix inverted input status
From: Miles Glenn <milesg@linux.vnet.ibm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, philmd@linaro.org
Date: Tue, 24 Oct 2023 11:49:55 -0500
In-Reply-To: <3bf8cd017b5d1386e1ed15392c74ed647b993011.camel@codeconstruct.com.au>
References: <20231020182321.163109-1-milesg@linux.vnet.ibm.com>
 <20231020182321.163109-2-milesg@linux.vnet.ibm.com>
 <3bf8cd017b5d1386e1ed15392c74ed647b993011.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zolw3X7cLff5i05HfArYo6-kw2mSOBWN
X-Proofpoint-ORIG-GUID: Zolw3X7cLff5i05HfArYo6-kw2mSOBWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_16,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxlogscore=896 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240145
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=milesg@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1tO6ZLYPI6eY

On Tue, 2023-10-24 at 10:15 +1030, Andrew Jeffery wrote:
> On Fri, 2023-10-20 at 13:23 -0500, Glenn Miles wrote:
> > The pca9552 INPUT0 and INPUT1 registers are supposed to
> > hold the logical values of the LED pins.  A logical 0
> > should be seen in the INPUT0/1 registers for a pin when
> > its corresponding LSn bits are set to 0, which is also
> > the state needed for turning on an LED in a typical
> > usage scenario.  Existing code was doing the opposite
> > and setting INPUT0/1 bit to a 1 when the LSn bit was
> > set to 0, so this commit fixes that.
> > 
> > Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> 
> I sent a Reviewed-by tag for v1, don't forget to collect those on
> your
> patches before sending out a new set. Something for next time :)
> 
> Anyway,
> 
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 

Yeah, of course I realized that I forgot that after sending it! :-)

Glenn

