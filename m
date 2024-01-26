Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp771224ejc;
        Fri, 26 Jan 2024 01:56:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVurPUANi0RjkMlWcPVaBPJJZC6HvdKW0z3wvNMLJ8YTMOlgHa8Aiur10xXQnbUtMcbIq4
X-Received: by 2002:a05:620a:880f:b0:783:cc4e:67b7 with SMTP id qj15-20020a05620a880f00b00783cc4e67b7mr954464qkn.137.1706263000673;
        Fri, 26 Jan 2024 01:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706263000; cv=none;
        d=google.com; s=arc-20160816;
        b=nI/oBBaoLyp7EIWHgS+/gry+KZf5W22ZN/dKKebqxw/Tqsd5/CZWz/vqtYuJxJdkRF
         1zxrZSlIRfBqJld7JdMqRddleqNt9DeYkbKnHR+9MmMwBdnTtFSz0opU/h3M6oI6GcvE
         E1D8xfPy21hv+4UIRP63dLsd8DgKzcY1kIqfNDLQtBDLOkMzD3g+jlvI2T7CAh1jKybh
         GcN3Q/qLB/G0OL3gIm/e20j8XW0VT0N+Hs47DBrkDYhnNdlp7EMtWpxnL5V6W3SU/eEw
         xe4UJ1QvddR+KjrhkkS2KLkWjHeIuOMVy1SnrU1p29cmiiKOzSQNxT4a/AsSbtEuFf0Z
         Gheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=I8CbpWHqRIrBEEmWHj5e8MJJKfJfXktiUc5nz45AVgw=;
        fh=HTHR+Q2d6bLhEl37Oh4T8uXQP5/6sUv4T2u8Op+j0Ns=;
        b=Nemy2YSYA+uL8mHCCesOhr4HsDY0NhLpo9xvF1GTglL9f2hvo1or313mZ9Xk/Pj4Xf
         3TvMN7yBwdQkM8C8M95q7mkkJ4Ky5LVkfbvn6QkmkPZO+hcPQE3TruKShTfd+lFv967g
         XNEsFiXtshLirfVsDFjuTXtLsuEotCOXVTwYrooNf6slORw6X2qgwUJvZPNP+JoqMVbN
         JiE1UGILLqHtMVmN09kGU05XE06fZ1IZi+FoREezUv7q9YFckSZYJzaCg8PK6jHUI9NS
         HWeRxHo2F3lUbLDZow9CxXWH8kBv6dISgBojwQAZWuwHBZZe14PAAWSgNkzrME27cY/e
         x+Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=LaF5ncCk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wa19-20020a05620a4d1300b00783dab074a8si171615qkn.582.2024.01.26.01.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 01:56:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=LaF5ncCk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTIwj-0007EF-Bg; Fri, 26 Jan 2024 04:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTIwd-0007Bv-11; Fri, 26 Jan 2024 04:56:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTIwb-0001P7-4O; Fri, 26 Jan 2024 04:56:18 -0500
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q9X96b014969; Fri, 26 Jan 2024 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=I8CbpWHqRIrBEEmWHj5e8MJJKfJfXktiUc5nz45AVgw=;
 b=LaF5ncCkr+zKj0X6sCIFxVunL1uZpxl5zaFn2Asb24yAuNril6QWh4ix6KY/1P2DRJN4
 AirkgmAdNlsdMmNbjYH1IQqnx3mHD+M3ZGVfZA7BsnPuKsTKAly8PKVCtztRQcRYXQRH
 F3DU+0Ng8b9f+BlwF7sE5e63T6xul50+erTCMoLQvBmN0vlxayBsirMGWtKdYFVeoB3B
 DOJmoiaBiGXAcn/4/LEfzXAMw0WnlyFa8yRn4msqt7XAb/RcnlGPTnES18wGNXAC12C8
 dtUYJtA9K5p/LpQQkmbtTZeUMtEJxyPAeDaAZBsQ5u3/GNM277Frsxp3bp4YBYAW5b9V cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vva6v8g10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 09:56:06 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40Q9XEqd015470;
 Fri, 26 Jan 2024 09:56:05 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vva6v8g0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 09:56:05 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q7DPLe026508; Fri, 26 Jan 2024 09:56:05 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrrgttarw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 09:56:04 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40Q9u4Ij5112448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 09:56:04 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 371375805A;
 Fri, 26 Jan 2024 09:56:04 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F75B58054;
 Fri, 26 Jan 2024 09:56:03 +0000 (GMT)
Received: from [9.61.160.70] (unknown [9.61.160.70])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 09:56:03 +0000 (GMT)
Message-ID: <e6fc7dc4-58ea-48e2-a8bb-4edac2ac398b@linux.ibm.com>
Date: Fri, 26 Jan 2024 03:56:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/11] hw/fsi: Introduce IBM's FSI Bus
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-4-ninad@linux.ibm.com>
 <769b7e74-6660-46e1-ad7e-4bb3e92e58d1@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <769b7e74-6660-46e1-ad7e-4bb3e92e58d1@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FLW2UxRgN5jC8JL82lbqq7Wm-HB9K7pr
X-Proofpoint-ORIG-GUID: at-z0N8umDlQAStm3vL2q1943_FjMJJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=627 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Abiqkbkd7BO5

Hello Cedric,


>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>
>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Added tag. Thanks for the review.

Regards,

Ninad

