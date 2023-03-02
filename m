Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp55024ejc;
        Thu, 2 Mar 2023 10:23:44 -0800 (PST)
X-Google-Smtp-Source: AK7set93wvf3DDIZMroKgo+/4mNh2xaN4BbhoRsykn2nzrp0kFMTlEXPGU28uhSxrp1aeLbeFVVv
X-Received: by 2002:a05:6214:2a4b:b0:56c:858:6c00 with SMTP id jf11-20020a0562142a4b00b0056c08586c00mr21885141qvb.32.1677781423877;
        Thu, 02 Mar 2023 10:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677781423; cv=none;
        d=google.com; s=arc-20160816;
        b=sMJilfVcFJBprw+aXp3CJe9Wt3k5IDcyotdyZqmWGnYrmVlhqhz+mRT2zZL0tb1Rmx
         6lxL+3khCnPBUaUHnMWWCX2+IeKUKIXBeZ5jzu2R3ig8p986rMsGGfevmayeLE8y0yAS
         sTIM8cSxCoE2FYG8H8WPGbkAQfaYdh7+G9/EYF/yQJshtV4pqmYuU6ppl88MTZbIw8UG
         OUW1+IP51O9yasorRIPt8Kuws9AyLRt4A1qr/B1nwUAvgrOXuNi5bEiRw5i7nnWz8dic
         6X3nX6aixDrKQvch//q2HBqXET9LRMQUq/xpr3ArFMIiVwq3H+B04hl5Wv/kdsizhQzU
         UTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gQCEemUfZEakFBzY2uFoHHgNMsEwDPcdBcBgB5lqXLc=;
        b=Np7EwmUeepBK0eu0r3i3ZnA+rcdb9vWkTCynZ0BIhMCq7VN1mE+Xg0EsZQElasVP8z
         iN/G4osgwnOhA1JrsFVSSV8c6CisQp/FOTgzvYueO0kSmY0R4uyPZe+1est7ppk0V+JJ
         IOvRBT3wPpsBhS3GSpu2xpAiEMzO1LSW50ozb7jUv7OjWxw4R6bz8MXIbRlwJvfbldzm
         Qs+L4iHUT7fozcujL3nkMEWhHWy5T8fZDMWqtFu1eezY052EydpOmqFgVSG4P02PwvQt
         //P1HJO+/DW5ayGVf7z/Bp7QLGqz16Gmab+3WrsdujHQC2NXIsyBGZmL2Nqsv3vkQsTd
         bR8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sMUyg9Gp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25-20020a0cb4d9000000b004c71a2b6580si14396960qvf.418.2023.03.02.10.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 10:23:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sMUyg9Gp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXnaX-0000q8-MG; Thu, 02 Mar 2023 13:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXnaW-0000pL-2Y; Thu, 02 Mar 2023 13:23:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXnaU-0004Xf-D8; Thu, 02 Mar 2023 13:23:31 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322IC2Oi021600; Thu, 2 Mar 2023 18:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gQCEemUfZEakFBzY2uFoHHgNMsEwDPcdBcBgB5lqXLc=;
 b=sMUyg9GpmtVOcRHnYlzgWVQTT6n36+cxbC0Rsx/s7GhkLac26SWaIKmz00HK3PFWjP07
 rbtUWV47oIpW4GHDP57XKRQOcjkQNkIfWyJY7kGyA2SKibjXSfOmHH7b01BOh+6/SPbx
 c6ovJZgsoiYuE8m4FghJSFdo4loDQ2fc+nHciOIBc3bE7zbOopimTwSQXofow2xRj0ao
 1/TA0tjYky8qDek28zq8Nipo9qY3Upmmf6JRoAXe48nF6PUx4rMHvLqh/wXk0FuHk2sR
 J6D/LCQugQlpKEeGXOBxD/gtgkwx4cOijvwruMMo+ujcWvuPbR4VX0J9i4XdbfOCuPXU pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p30v4r8kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:23:17 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322IDS64029141;
 Thu, 2 Mar 2023 18:23:16 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p30v4r8km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:23:16 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322G0YPQ017420;
 Thu, 2 Mar 2023 18:23:15 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3nybchwu08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:23:15 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322INDwU4522642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 18:23:13 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3D7158059;
 Thu,  2 Mar 2023 18:23:13 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B2345805B;
 Thu,  2 Mar 2023 18:23:10 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 18:23:10 +0000 (GMT)
Message-ID: <daf34813-1faa-5fb8-32f7-77806ddf5888@linux.ibm.com>
Date: Thu, 2 Mar 2023 13:23:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 06/16] win32/socket: introduce qemu_socket_select()
 helper
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 armbru@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-7-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-7-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8FT6ge0qAuDulx2h7YgHWixU_xr_c9NL
X-Proofpoint-GUID: sgforekUUmuXDX2O1henoZh_BIag9puo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_11,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=646 spamscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020156
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SR7Gr/n9pCIR



On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This is a wrapper for WSAEventSelect, with Error handling. By default,
> it will produce a warning, so callers don't have to be modified
> now, and yet we can spot potential mis-use.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
