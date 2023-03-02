Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp61699ejc;
        Thu, 2 Mar 2023 10:30:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/YxJxEVE84TX4Bxf6LxYfgYcrs/AWQ1vtRXdVGLwk/a3oEOqqIrmb6svRoatDxVqHqVlaf
X-Received: by 2002:ac8:5848:0:b0:3b8:4076:1de0 with SMTP id h8-20020ac85848000000b003b840761de0mr19154804qth.30.1677781830645;
        Thu, 02 Mar 2023 10:30:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677781830; cv=none;
        d=google.com; s=arc-20160816;
        b=Coh4009/E72jfy3dIa/IfH8R2EmR5BrYAF22iZfsnvRpJ5/Co/+FwCEoaI0ZWVFsNZ
         /I1MI3TNfhf/ULE+eE3vC7z/qP2OKd78nHCOFzT33F1MCMmRCubZNC+U+F7imuDidFcc
         gS9N+C75dXwL3XMdiAnQSDkH6LsBHXRKO+Var4oi/IPDzsfCPUFAeRYxh0iGi9nKRMQp
         hpKCh5ZoopI7Ub8C7UafsSghK8ymhhUHVApvSxVGExSiFAxt81CVFOWU8azrgVBPVBgi
         Y+e2O+pUZTo/AKCr6KX4T77TGaShu4HBNYxWV8VCRI6VmB6EpBd7yuZRyPx23cFm1Z7+
         NVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1jEgtpAiMKXZ3Hs/XV+hx9bL6CLZ7WScWJ0U+8bwJp8=;
        b=zOCEldgmOeEV11cj5ZEaUjArgCz8g6HAxAQB3KmG5rERuJ30HFdoTe3e7egIylS4PO
         iNvW9ktypMjlCKcErcUZzju1HxX/E3QyUWRlrUihc/f7nZokusTSG1SpR/kLu9duWNsq
         HgvFIaHTWRhKAI9J5o2hn8+WTTlCqkIobxE7Ai57/m9AmbTKw+MZuncqLHheZEqgl7Qy
         x8619oVtkv53V6RaPb89bamDL3W343HGWi6iwuB37xGSz0oC97jJ721ojN7CAD6hgqG0
         534knIdMW7HylBJuhtmG1ISnP5i/fw5cZOV4qrYIfr3srIahVmhHrgpAwdF3z2dqL2Zw
         lJpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=DjaXo02z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020ac85dca000000b003ba11617afdsi182149qtx.267.2023.03.02.10.30.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 10:30:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=DjaXo02z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXnh2-0004kh-Uh; Thu, 02 Mar 2023 13:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXngs-0004kI-0d; Thu, 02 Mar 2023 13:30:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXngo-00072h-L7; Thu, 02 Mar 2023 13:30:05 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322IMs9Y017408; Thu, 2 Mar 2023 18:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1jEgtpAiMKXZ3Hs/XV+hx9bL6CLZ7WScWJ0U+8bwJp8=;
 b=DjaXo02zyUCEakL9HGXKUGM1xNsfGj6n4NoiPGDKJVHEhtm+wMLahOk5cz5izw4Qei5u
 Z9lnL2HL+Xz9E5lW8+L3V0KlC+hqmtqH4dca0EzRbfx9+IyzERyHqC04cvFbOcHG2GVp
 XtBcYIjZyGVEJUNb+lx8uwvhvKJ4WDa3zHXHnDYlurcSSw2Ppey1XBXMWITq5jMzdBc7
 RVXmqqv16i5G0OMfEgr586MQ8w3YjquZHxsHCmWR5757PhAUCQcxQ+CFxQgBRz0seytO
 3A3G4Rg9XhbM2+iiaUNTX5cV8F/+UUyM0B11TrwskVNfSZbtbuZDMnSDiOISDV2y8jzv kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p311d86r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:29:51 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322IO2iY020764;
 Thu, 2 Mar 2023 18:29:50 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p311d86qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:29:50 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322I1N3x005676;
 Thu, 2 Mar 2023 18:29:49 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3nybexnx40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:29:49 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322ITlDc9568790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 18:29:48 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCEEE5805B;
 Thu,  2 Mar 2023 18:29:47 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65A605805C;
 Thu,  2 Mar 2023 18:29:44 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 18:29:44 +0000 (GMT)
Message-ID: <4fd9bcfc-a8e6-506f-f673-3f8198991941@linux.ibm.com>
Date: Thu, 2 Mar 2023 13:29:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 08/16] aio: make aio_set_fd_poll() static to aio-posix.c
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
 <20230221124802.4103554-9-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-9-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8ZewQRliIkOE_MuZfRv_U96sLHzZXX_6
X-Proofpoint-GUID: nk10QxdHiHylCBPqxnnKb5eVjzWSsoUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_11,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=772
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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
X-TUID: GaZl1xrdG0Yk



On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
