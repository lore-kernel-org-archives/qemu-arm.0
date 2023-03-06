Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4696709ejc;
        Mon, 6 Mar 2023 06:17:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+481MSF5wjPGHhmYc3lTxCR8gXVVBxrsdTswJze2U+nrdvAWn9ARJfQUU0AdjsJ2fo6UYx
X-Received: by 2002:ad4:5765:0:b0:56e:f609:438a with SMTP id r5-20020ad45765000000b0056ef609438amr18908472qvx.15.1678112251885;
        Mon, 06 Mar 2023 06:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678112251; cv=none;
        d=google.com; s=arc-20160816;
        b=mRXcD4F3eat5KUvlBaLjpeu7iXO0R4jPcw3XQO7LofmCkxkJVvD0HWzYaxU+L3g+hC
         a8IK77b3A5WH7EgG2/5SZ1k7NitRoeP/GPKTKSFDC37TKAKenSx1stwUsQv5xIK9DeHO
         MaQbTcKXv9Om/EpBwqXhrvMBIQATzomDDQFURGnH3BtVaqf0XliEbZ4niKwmjr3T/vpn
         DFHiFvoqA64mK+ENfvc+YU7FMUxLOvnURgJVT7+lCH/b48abXEqVW8DlWLUxSwtyOEuw
         UfWjPFHmS8Qg7upCQN1Iic4T7m1Xkxuu1ddGg+vul+G/0ItGGV7M2c+S0wotk1TBHO0L
         HAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=n+d2uuaju6TturPd+sCJpTkI3l2L7cFWFkhTGXfmPI4=;
        b=F3WDjlRG2kErPAHL0+uzwtDd3/hHRhvc5UP3H9i/7oFc5LQX5c4fhO9llENY3QBnIv
         +jwmqPZiTdAkha3dAIX29zqEE/rMDFctXVe2RHTkuQGJY0GLkuqzz5nv0GJWuPpV6Kqc
         /HgKE87WpUAG8A/NRER3sq3FuPnhbOhY/19hb3ahF8c5tIk0esIG/PHQDfzZ6WsM9PbX
         BpJ6AxxBfxS1wiex3CIXHS5/L8UPitk5YNM+cC87QqwZwK4EsI3OUHFE1cBNQElgIAS0
         WTQ6pf9n4bvjx9jeHDu5SnbAjh6f8cIt0jXSW+XAntq+9WuEbGoRH5Qw4WUlIhhZVjgU
         2v4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Q65vVv7x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a05620a44d300b006ffd3e1339esi7990157qkp.444.2023.03.06.06.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:17:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Q65vVv7x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBeV-0008Mh-3k; Mon, 06 Mar 2023 09:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pZBeT-0008M2-Lq; Mon, 06 Mar 2023 09:17:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pZBeR-0001ay-N8; Mon, 06 Mar 2023 09:17:21 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326CnNur007742; Mon, 6 Mar 2023 14:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n+d2uuaju6TturPd+sCJpTkI3l2L7cFWFkhTGXfmPI4=;
 b=Q65vVv7xGzScQAJVUms5g8Q8G39kEHW2ddkEzHZSabudYbEvRiX/QhIssYUbnklTCeUr
 Nl4tkAS5F2+6kacopn1HSKNnwwmZuOBgyHptZyhYwnwH36m8MffaJHj1+xFAwwEv9TYt
 6WCvhpXWsaCDw5jYjgIpbDcQ844ZZhPIdmd5rorikROvm8Wf7C6npHaPWIvTSzO9iqb3
 8eWoxTZH22HtBb2YB75jZIwp0sLIv6iZeB3KB/v98w1A3ioLTO3kPYshe3eQytPtdmDq
 ZzsiXIxxkQFyoMfx3XuKQHZS0DlCRPKpqWxzmW+fOdvMA9Me5ql5jBhqSSXgaQmLhdSk Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4wsw7ptq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:17:03 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326DVtt9014356;
 Mon, 6 Mar 2023 14:17:03 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4wsw7pta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:17:02 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326D2QsV028669;
 Mon, 6 Mar 2023 14:17:02 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3p419v5j0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:17:02 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326EH1C129950640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 14:17:01 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C902C58053;
 Mon,  6 Mar 2023 14:17:00 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C07F58043;
 Mon,  6 Mar 2023 14:16:59 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Mar 2023 14:16:58 +0000 (GMT)
Message-ID: <b177ce6a-f5e5-0eb6-6ac3-66176906c760@linux.ibm.com>
Date: Mon, 6 Mar 2023 09:16:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 13/16] slirp: open-code qemu_socket_(un)select()
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
 <20230221124802.4103554-14-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-14-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wUclgeQ3pZF6j9K2Jau1X_w4JswtQgGS
X-Proofpoint-GUID: WjgPcg1UEoRqRzW8ksHUKJMQYHxY_Tgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_05,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060120
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: TnJPS9oI1FjI



On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> We are about to make the QEMU socket API use file-descriptor space only,
> but libslirp gives us SOCKET as fd, still.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   net/slirp.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index a7c35778a6..c33b3e02e7 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -251,16 +251,20 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
>   #ifdef WIN32
>       AioContext *ctxt = qemu_get_aio_context();
> 
> -    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
> +    if (WSAEventSelect(fd, event_notifier_get_handle(&ctxt->notifier),
>                          FD_READ | FD_ACCEPT | FD_CLOSE |
> -                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
> +                       FD_CONNECT | FD_WRITE | FD_OOB) != 0) {
> +        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
> +    }
>   #endif
>   }
> 
>   static void net_slirp_unregister_poll_fd(int fd, void *opaque)
>   {
>   #ifdef WIN32
> -    qemu_socket_unselect(fd, NULL);
> +    if (WSAEventSelect(fd, NULL, 0) != 0) {
> +        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
> +    }
>   #endif
>   }
> 

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
