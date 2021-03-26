Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1654010lfg;
        Fri, 26 Mar 2021 12:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj3aWAxCl3kE+Hf5IaB5TW7eYxOvldwIl7zaalXtBtl8KjpGtXfP8lcEmhGVEToFnyq0li
X-Received: by 2002:a05:6602:2e95:: with SMTP id m21mr11718077iow.9.1616787244355;
        Fri, 26 Mar 2021 12:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616787244; cv=none;
        d=google.com; s=arc-20160816;
        b=N0k4RHTU2Ti7NXIgYBfxsy5Fh3TjY+1qKh4Vk2Jc740QecdUDPWk/uJbE+UE1xO7Qn
         VtActDtncsP9R5NZcwomYJaL0ZRPHkOzPwIX86uHrLwktN70YcOmEZ6bSoaGygf2aakE
         kcHHpc+uCfAH8N1JqWhkvtXQaxieDLWEo0Tm1ereLK1jTGQtwLX50AWBVtkbDcoaWTzK
         h4x3R8u9HHPLCWr0CEl2K9W+/J5JKKmcpFaGkRDlUmuRt3HtIZ1XrCG5pXk/p4JMmc5Q
         1u0eHr2xvEeOjGm6eUzMhc3NzL5TyJWH48oVvDTVnbFstpxSr1x/O0CxQ/HZs0YuQh1b
         CcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BaWR1Jvc2BUY2/kwF/4hS8XAxU9bhd7Oxb8wMjTsxHc=;
        b=Ew/5T1dIHopht4edEEqEeP52tIDb7z9/VbPkYx4ongEsqFEgLeIZbDjdPLZt0HT8mU
         X5DWu/M6O14170nuMKlc7m/N2ObAsA2RrMNO1qR38g2MRz3BH5AegvP1WM6WR+77s2Eb
         ld+zMWkgM7lCrtPYR59kCnjWPIF3menfUQbCrX31XynjGF5Uyb+GI3EVu9MZ2vvndFe8
         sH5g66hkMTs45GTZXNh/Mbanw5aHnP+BWtVtmYsCYtEadxsK4kFABrB/oJvy33854jqd
         7hs+DkUFKtSYEYKMUpF2YR+bwNI7OzQCGx75vveFqjgsRBUCfixeNA+K/BMFwOc+RYb+
         KOVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=FYiUcbXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si7463917jat.59.2021.03.26.12.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 12:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=FYiUcbXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPsDb-0003D6-LK
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 15:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPsDR-0003B9-DQ; Fri, 26 Mar 2021 15:33:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPsDL-0007A2-St; Fri, 26 Mar 2021 15:33:53 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QJXQDd146005; Fri, 26 Mar 2021 15:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BaWR1Jvc2BUY2/kwF/4hS8XAxU9bhd7Oxb8wMjTsxHc=;
 b=FYiUcbXaNPmNBO14yYq236chHFRUOljj1oOeuI25T0sDZs/XWteblNn6ok93p7/yi9DK
 rxqyA5GNQQ0IXRoyCTsdcEPcT4ac51ej90FFujIHi+jg/8UwwbQcBiEvgRcYJQ55fLlT
 4+KdlWb2PxUS+bYD8Ycij2C4IMTvuudA600ByX4GKn6QujMAorpbJmKaukgn7bMYtJSh
 wep9tlphwntm/0pPoWnBxGL3vjE8KkNAux4ha0LnTHIb6iOEDWStnGnJhqM4qWLOBMhQ
 21e0rD+F1103niQvaYHm+F9P0X+GHHgX+qHfh/aAXHTfJcI4QrpKiuX0vhidf/yU5CNx Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hhp77pah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:33:35 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QJXZjl146612;
 Fri, 26 Mar 2021 15:33:35 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hhp77pa9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:33:35 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QJNbV8018237;
 Fri, 26 Mar 2021 19:33:34 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 37h150hc06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 19:33:34 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QJXXKp33423814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 19:33:33 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02585BE05A;
 Fri, 26 Mar 2021 19:33:33 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6882BE04F;
 Fri, 26 Mar 2021 19:33:30 +0000 (GMT)
Received: from [9.85.195.191] (unknown [9.85.195.191])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 19:33:30 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] aspeed: Add Scater-Gather support for HACE Hash
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20210326193033.11798-1-klaus@linux.vnet.ibm.com>
 <20210326193033.11798-2-klaus@linux.vnet.ibm.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <0de054bb-d275-764c-79ef-3e2625c73a8e@linux.vnet.ibm.com>
Date: Fri, 26 Mar 2021 16:33:28 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326193033.11798-2-klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lmOnAo8tB4oX8VKn3b_O9Rwhur7dRJDh
X-Proofpoint-GUID: n1FRemccxYH95d4ZoA7kOalG7jXkWFwT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_11:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260145
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gk+cc3/Z2bOv



On 3/26/2021 4:30 PM, Klaus Heinrich Kiwi wrote:
> Complement the Aspeed HACE support with Scatter-Gather hash support for

> +
> +    /*
> +     * Set status bits to indicate completion. Testing shows hardware sets
> +     * these irrespective of HASH_IRQ_EN.
> +     */
> +//    if (!rc) {
> +        s->regs[R_STATUS] |= HASH_IRQ;
> +//    }
Forgot these, I'll send a quick v3...

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
