Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp58675ejc;
        Thu, 2 Mar 2023 10:27:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/jvxmRIi8B6as55rCHRlDskPjTD2/2DL1F3OO6DRFhSAxJcHZYOIfGGFa6m2lw8gmNqFin
X-Received: by 2002:a05:622a:1c9:b0:3bf:c665:20fe with SMTP id t9-20020a05622a01c900b003bfc66520femr18930799qtw.22.1677781643228;
        Thu, 02 Mar 2023 10:27:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677781643; cv=none;
        d=google.com; s=arc-20160816;
        b=MOIJhaY9qn5NUQuPTR+mdtcuojZQEK1X9dnwpxgAmh5tmeI7aYu6JYsb90qfJLz2Lg
         9gGeBkvHMMqB7Ii+oXPkx+Gn+g1YGhcVew2SDj48XYJuS3kg41IqEOryzk9xwkMuaUy9
         9NGzrIc81KCGcAO5ZWRjpeeJB6dUVpcI9+CgBwnfVhyFsIw1lnTKCNTRjmYcwrgqTEb6
         eKJ69loDx08tVAAXTZAKH1AfwGYfCXyL2ps5kLZxZ3tu+t/G+ol0U7HJlHNAFFlvxNu8
         kPhRcWIC+ys5c/ki8NKsl5vLwxrh8DvXwO9AMBsLy31sPjcygS5VHF7OKpFDK8kbOJ4N
         tvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wTMD4n+EnWrW/SQL+WkXt/CiK55UPvlr9A7MgTZxfow=;
        b=GccfRk9w9T/LQqOjNOy4/ZliYpBZc3O+tgJ8btJ64v7IYSjmvjoevmTkKXpCqGIPIu
         pBhQzi6/4btI2CxbgZ6ywYbquviRfCWchcdMHG1x7qWFzJIpPCcHEIZ16XvWnJQS71Ry
         SuacfQFaMTE18gO48plmFckAv3PgXtmL7Fs5SHDD1EK0g19PnuSHqqzR79LLANWxtVxN
         A4I1aRbJIIpmH1z/MzEpEGqkEDniEgxertlfwaYAsBDdf85y1/gwobJwZK7lGggTrnfH
         BwK7tYHwBXFQ0tQBQ40+LuMWPVMZ5WhhoOFM/5g+jBPmw2jY2jTc/uBgJBtZyCl7Ka4V
         3qKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ehxc6XXY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020ac84e96000000b003b1b92b7c90si142208qtp.721.2023.03.02.10.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 10:27:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ehxc6XXY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXndi-0002Sk-6g; Thu, 02 Mar 2023 13:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXndh-0002SU-7J; Thu, 02 Mar 2023 13:26:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXndf-0006ZT-MB; Thu, 02 Mar 2023 13:26:48 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322IMmV3016883; Thu, 2 Mar 2023 18:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wTMD4n+EnWrW/SQL+WkXt/CiK55UPvlr9A7MgTZxfow=;
 b=ehxc6XXY3ur+Gg8IjEqvhG7hDJO74kroRJuhrdRqrgJHXqhlafu/3i0pMlRK82P1T25a
 X4boniP0BMzvQdm9uyxuL0YKuG8ANjYm9Y5LgfdivVndAIaA0cJRXstppw1nNi4EyOG0
 Et5CbuiRe3U38m9IgsjAhefwSIfWIylBuvjsSezik8XZQh7bzKXOCl6QSvfOXLfdGZQi
 wWWxBFWVh43YV2gPqJeAsOcLRR5NkTQSCUKfkPIxe8DtCsxODQJF2t2pDe/02i++9kG+
 iL1lxjsUS5iP/OYYos2+w+XzgzTLJmE3QvmY8agperxtNAxAuU+cQ3LLNPOGdB/Few/4 Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p311d8457-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:26:36 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322INXHS019527;
 Thu, 2 Mar 2023 18:26:35 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p311d8449-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:26:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322Hu55R029702;
 Thu, 2 Mar 2023 18:26:34 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3nybcmwxq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:26:34 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322IQW7w33620392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 18:26:33 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90B7058059;
 Thu,  2 Mar 2023 18:26:32 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 760AB58061;
 Thu,  2 Mar 2023 18:26:31 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 18:26:31 +0000 (GMT)
Message-ID: <6722f774-8af9-f595-78cb-b20f7c282eb1@linux.ibm.com>
Date: Thu, 2 Mar 2023 13:26:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 07/16] win32/socket: introduce qemu_socket_unselect()
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
 <20230221124802.4103554-8-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JQHpoJbn7Jda7zh7IXoP7R5V7wAsGEGr
X-Proofpoint-GUID: 81h-oLZDXfvoB9OzXhnTBul81XEqB5Zh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_11,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=923
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
X-TUID: ZMFk/YmxBbEg



On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> A more explicit version of qemu_socket_select() with no events.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
