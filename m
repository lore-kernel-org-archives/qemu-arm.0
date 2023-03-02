Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp189852ejc;
        Thu, 2 Mar 2023 12:53:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/+U40Mpqt+r0jHmXbjW4MF/y1zCBS5KOB7b0sWft+rH4SiMvqGpy4QJoPTgQpAhI+5mzCm
X-Received: by 2002:a05:6214:da5:b0:56e:a2cb:5732 with SMTP id h5-20020a0562140da500b0056ea2cb5732mr21451699qvh.9.1677790429405;
        Thu, 02 Mar 2023 12:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677790429; cv=none;
        d=google.com; s=arc-20160816;
        b=oK9Rt+IGwoI4WLefc9R7j8A9CoA2dCpPha+d4mmqeQTKzfMSY4h7jKeXMLwuYwbvAf
         Tc3okN+LYMK0iGkf1+RuVXdthnINChGq2LhpRz0ExMN99D/in6/HeQ8j61WlARQ/IQm6
         gUwvTO8ETajcTF7xPk4GsfoOi94Nijqrg1+s1EN6TwDcGQwYPWZvhXADYLCurJmzrqY+
         grbIPjULMswQifruI76jllJ7AhfBid3Rp/tuJiKjAXK+r3zPGCmtI5oxcBJhPnOviEkf
         wO4KWkyEV+xHjYeIY8IdRDf/dHGhHM1tZ9yN+ZFYvSvSXNuoTS0SU356vBXVNg6wgurg
         tc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1kCyE9WQ+NQegbTNYXStyT2Y/1nWO+SteztXUpmtetk=;
        b=np5MLbKemh609m3SphgsUT3vSUcDOz3dByGAm6q2OrBB4T5EwZ9LvcRu5H3MYSu8fb
         213TbjSQaLnk7L67s5dY9oC2qR6jIPsACSwQBXhsxLhO+4UevryvC9tKDTbJvk0gbyCe
         JoiGAbLk7MPqwIRlf34p7vObc/MoR8+A1iK08E/88S3xLZf+hKM7HHvIHiY2vSWzoh4r
         Df3uJpbQyvJCJtu8piNXlwUY+MRmvuOIxYr5Xkd/O3mYzrTHAy21kCwzZfWGvo1Okesl
         IOH0+kFnORL+0kS0XT/qXNig0ICO3z851N+VTsz5CfQKIx+o+Ha1JzoI5/4Z9qvlsRAH
         wA4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=aaws5xmk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp8-20020a05620a458800b007426e52504dsi401908qkb.601.2023.03.02.12.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 12:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=aaws5xmk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXpvi-00018W-5Y; Thu, 02 Mar 2023 15:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXpvd-000187-Ou; Thu, 02 Mar 2023 15:53:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXpvZ-0005lR-QT; Thu, 02 Mar 2023 15:53:29 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322KJln9022863; Thu, 2 Mar 2023 20:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1kCyE9WQ+NQegbTNYXStyT2Y/1nWO+SteztXUpmtetk=;
 b=aaws5xmkTvV0wcI6/4yb+FYHQlVEO0Oy03WdZAw26xwwidFabtqRJV98VS1JXY+8pOZi
 nVXsrAKHvb0GaHwjoM/vW3DEj2rFczZCGalx428Ou0M3LX5F+cVtOq5X6+F2nxooHqK7
 c6TRie8btozhUXefZIuacOQ3r2D/iLzLZXDJ5DH54MgaTZjsV2IY8qzow9lqQrcBU4JI
 nSJLcQrlMvc7sD6Nk1pSfKDHsBjQlnOVgH1S649pMOOSITYwPNJ5pU7SsUy4T8OkjFbJ
 smSEcNOMgO2VYsu7tiyjU26IniJfres51bTtEjMqzw+6sosrNapez/PGcnqnZvGM2Uav iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p32r50nu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 20:53:11 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322KYbYR014808;
 Thu, 2 Mar 2023 20:53:10 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p32r50nts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 20:53:10 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322KLGeb005629;
 Thu, 2 Mar 2023 20:53:09 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3nybexpn54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 20:53:09 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322Kr8wn64487704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 20:53:08 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 586CD5805A;
 Thu,  2 Mar 2023 20:53:08 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F40F558051;
 Thu,  2 Mar 2023 20:53:06 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 20:53:06 +0000 (GMT)
Message-ID: <df7f2500-4f0a-91cb-961a-d2737ec66e78@linux.ibm.com>
Date: Thu, 2 Mar 2023 15:53:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 14/16] win32: avoid mixing SOCKET and file descriptor
 space
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
 <20230221124802.4103554-15-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bVLzWAY2ezVa5kBg30B1V5-z8Xuo2UsF
X-Proofpoint-ORIG-GUID: hJI9T__asCfeDH7a4adJVR5axYfmsv8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_13,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020177
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: utGsvkro1yU4



On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Until now, a win32 SOCKET handle is often cast to an int file
> descriptor, as this is what other OS use for sockets. When necessary,
> QEMU eventually queries whether it's a socket with the help of
> fd_is_socket(). However, there is no guarantee of conflict between the
> fd and SOCKET space. Such conflict would have surprising consequences,
> we shouldn't mix them.
> 
> Also, it is often forgotten that SOCKET must be closed with
> closesocket(), and not close().
> 
> Instead, let's make the win32 socket wrapper functions return and take a
> file descriptor, and let util/ wrappers do the fd/SOCKET conversion as
> necessary. A bit of adaptation is necessary in io/ as well.
> 
> Unfortunately, we can't drop closesocket() usage, despite
> _open_osfhandle() documentation claiming transfer of ownership, testing
> shows bad behaviour if you forget to call closesocket().
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/sysemu/os-win32.h |   4 +-
>   io/channel-watch.c        |   6 +-
>   util/aio-win32.c          |   9 +-
>   util/oslib-win32.c        | 219 ++++++++++++++++++++++++++++++++------
>   4 files changed, 197 insertions(+), 41 deletions(-)

>   #undef connect
> @@ -308,7 +315,13 @@ int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
>                         socklen_t addrlen)
>   {
>       int ret;
> -    ret = connect(sockfd, addr, addrlen);
> +    SOCKET s = _get_osfhandle(sockfd);
> +
> +    if (s == INVALID_SOCKET) {
> +        return -1;
> +    }
> +
> +    ret = connect(s, addr, addrlen);


Previously you passed int sockfd and now you convert this sockfd to a SOCKET s and you can pass this as an alternative? Or was sockfd before this patch a SOCKET??
    Stefan
