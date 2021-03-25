Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp854117lfg;
        Wed, 24 Mar 2021 17:15:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/wcwb8x5ppY8ocqF1kBSm7XL+Wxzk+6+y3EmN0JuKbuATHyI0Soiki82SEAIr5N4GpcpE
X-Received: by 2002:a05:6602:82:: with SMTP id h2mr4493158iob.20.1616631357203;
        Wed, 24 Mar 2021 17:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616631357; cv=none;
        d=google.com; s=arc-20160816;
        b=LXNDKQwGK6x9qJRwRE2DoDgsPRga9B37VwAwQsn3bq/39+LBmd/rTUXF0NjzEwg4tk
         /VILL/6baYoxICwr4Hycngn7I7LsvT43/dUDZEXHLYk5toAnsM+9fHPFa9J3EI8sB+Uj
         CH/bMI+xI7VMQratBzXGRcnuINz4LK+tBrnw/ORSgrkoct9vsPnTj+tyB4nAbmY4jIiQ
         /ttUBABFJZRxMycjboiRkdnBKd0vyfywclGdvxE8q/wSBfE7EjM8vAZYAhqLFOTTfna2
         oYFTRUyw6U8Ae3iCjF584qu8CKCXYTgc+RFDzXYF9EKBM5NgDn4JudshqL5n/qeMnReq
         f5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kME5r2TC3HHUzbr9t1mmFwr6w+kCQqjyutDJn16fu6Y=;
        b=gIJBOIkbMoI920LF9xWSf8A95KPRvAzv2QXRbJpEBD5Octfyy55MLT1RfjLzzF6yFm
         1nbLqLLmPJ3zvdfCNZ1Y0twPnym1qxKXrrthhbM7tCGsv45Yg1nv7k40lQuj/2JW4WO8
         /u1jHmLKM2xJOeDBNAgRZXYkDRImRHNr7+nYMHv9TurLoHPkyMXhnnIcnRPHXGL8a3Cc
         ryOX5671Ijqs8b3lp7Q29xFPQfxW7NT3RWrj3n5t4FVhkT9sVsGvf5JFxtZiz7GGGY3s
         7GSZDzNDnHgSIqH5HTYmEUxamVllcalyrcNaW9UT5dPqofWi4atRl1FXYQk3Zo3QrH2U
         twFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=Aq8NnD2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si2719089ilf.153.2021.03.24.17.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 17:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=Aq8NnD2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPDfI-0002A0-HR
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 20:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPDfA-00029l-PY; Wed, 24 Mar 2021 20:15:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPDf8-0005jK-H5; Wed, 24 Mar 2021 20:15:48 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P05QZk110496; Wed, 24 Mar 2021 20:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kME5r2TC3HHUzbr9t1mmFwr6w+kCQqjyutDJn16fu6Y=;
 b=Aq8NnD2c53Xz4KfDq8xuaZHbNKHa6BygOD/yWKs5ctRSdSLr5bOBtJggUunlEOMG21TJ
 C8zLRiFD1RsEfGeuc5pIJQfZ5iIJMYtXX7M3/sUe86WqXaztpeWyAKhGmoWyjjiSl+qH
 S4E9/vk3QDtlH+RFg82i12C21VUgXR6Ci42nkyopZAKohKCnlb5B8JF+f3poYQLBJzRZ
 JnXoT9pGTv2CaM9v+WNRxVqrbCSJiGkeOFOJc/Y9BZf79JmWM/+oLGYrc+6+NQW5EGMb
 xV4FcDURRDmZ9SpdOtesCdtru+HMzSrjoSGJ1V2YlHKSUGvrGP+/rjKxPpp1/+BQAo5D DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gaa9yxn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 20:15:39 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12P05YBW111197;
 Wed, 24 Mar 2021 20:15:39 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gaa9yxmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 20:15:38 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12P07hBG013152;
 Thu, 25 Mar 2021 00:15:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 37dyccumg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 00:15:38 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12P0FboM27787774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 00:15:37 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFE89C605D;
 Thu, 25 Mar 2021 00:15:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADB11C6057;
 Thu, 25 Mar 2021 00:15:34 +0000 (GMT)
Received: from [9.85.133.239] (unknown [9.85.133.239])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 00:15:34 +0000 (GMT)
Subject: Re: [PATCH 1/3] aspeed: Coding Style cleanups on do_hash_operation
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
 <20210324223846.17407-2-klaus@linux.vnet.ibm.com>
 <d3274402-58e2-c7ca-f808-7e2d51f29d89@kaod.org>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <2c679546-0f60-b8cb-cf85-29f2e897d877@linux.vnet.ibm.com>
Date: Wed, 24 Mar 2021 21:15:31 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d3274402-58e2-c7ca-f808-7e2d51f29d89@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_14:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240175
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fGpnMwkVZFHI

Hi Cedric,

On 3/24/2021 7:57 PM, Cédric Le Goater wrote:
> On 3/24/21 11:38 PM, Klaus Heinrich Kiwi wrote:
>> Basically using camelCase for some variables...
> I don't think CamelCase applies to variables, only types.

Thanks, I think I mis-interpreted your comment on this.

Will re-factor the patches with that in mind, but let's see
if there are other comments first.

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
