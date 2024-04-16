Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp315706ejd;
        Tue, 16 Apr 2024 04:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXP0CA6e8XlK5BKgzukTVAUnMGYCGZNBPB6DRRsp3As5aGSpS7vBHWK7prgPY5DBgdlUMVHDFLwxOBB0sQI5ZcSmiMJrQI9
X-Google-Smtp-Source: AGHT+IGKtfqiDvB2NlBWtyKC/p3rlIJu+bhC7v+tz9IMkjFHmbYt3rmFIYv3KTmmK5YPoLrZN+xE
X-Received: by 2002:a05:620a:13ef:b0:78d:67aa:70d with SMTP id h15-20020a05620a13ef00b0078d67aa070dmr14405627qkl.37.1713268537036;
        Tue, 16 Apr 2024 04:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713268537; cv=none;
        d=google.com; s=arc-20160816;
        b=xQXfxttQCOQHscSgKQ6A23aDFW8S9SSmI2KwGFGLrCIRejlAUj7aZbUXl+WCXyuI3T
         TGLJgzMuQ031O+9J0fg4PbBC0VJc9+muRc3wkkd6i8Nfd2Xh54pAHxvPOU6TJQzD60h8
         6dtJWItkuto9EPqrefoHOcn3sJUZ7tXWXrP9te1jY655AsqRxiG9z2YTMNDnT+wHGmHQ
         D/vAr8ZIiu3To7UwzkR0uh3BNwRyierL0EAiF/X0H7w8Xy/SMBp5VX0dIfSZgixiFCUn
         9pqz/BS2RX/IDIi7HlcVI0M5v/LVGRsFHUvu0k5r3aIZxyjg+y4/LT3P4181/6fk5YhS
         2wRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BF+WWx2eyJpyEbVOTgr946Qb3Qp3BXMlMICw75obs9E=;
        fh=+/mR0YkOHdurNeN4hPXGYc3tMYx9JfsmV8mpgD07ZXo=;
        b=Ctr0mg70+q+Wzln+cDU1r2AC8JSKoI7nHzQvcbJbaH5cj/wY5WSPpiQI3YAd42TSkI
         nve0CCDHx20rPlQ8Jhk/9TQA4DIYz+pT5M3XxOz4u3k5JUh11fsbUm5Zm3eItBzRYEHd
         vZsvb8AZ20anJZButqa7X3j4b01AaOhMzt+gUo4M71TsLmDJpJXwSEB00JM/1tLrPIw7
         MiuKSzv9NNlg6+z/LPBYvgoBsDo3cAK19mgJ6S+BsvzICjUJQ8wnj0Kq2BUM+wvuoiSQ
         71rVLVwKbAP+/1rungWUUxzfDRMBmeHyxDA/g1Olby1YxokmYvDwqInj7dPRnvHbsNt2
         jqGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NYbG5VSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id yf3-20020a05620a3bc300b0078a4fe9e84asi12055381qkn.758.2024.04.16.04.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 04:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NYbG5VSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwhP5-0007SA-N6; Tue, 16 Apr 2024 07:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rwhP4-0007Rj-7Z; Tue, 16 Apr 2024 07:55:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rwhP0-00034O-Id; Tue, 16 Apr 2024 07:55:09 -0400
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43GAwSpR018870; Tue, 16 Apr 2024 11:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BF+WWx2eyJpyEbVOTgr946Qb3Qp3BXMlMICw75obs9E=;
 b=NYbG5VSQNK3NWK2XLcpaQKTcDVi84vffP5V3A3TI7pWPdywGgw2Z+7gkEa7cvdGFrg1e
 dZE2AENcx2wRC5i/mqCDJ0yP16ATZYgM/gRAj1BD6nG8tle+hPmdrlU4uT7+92tpRkiS
 d5g5ul1+mwOVGaaOVSxSC6dz8GFSXhcZY16zci3tefJr6I29HLP/lPECPqJs0nfPR9AA
 6hNjeJO3xYKNFdZc2lbGMPDJRA0vMOGK+C3LJXEZCTLz9904fqg2XF/OMB+BptmskUH7
 Vr7vLIIYP4CPT71GngSr9eQU5HpyyH+EDvTSCSOm3ULl8wuGHEc0uOFbFL8rDnmy1Efg ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xhr1rg3a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2024 11:54:51 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43GBspYI003700;
 Tue, 16 Apr 2024 11:54:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xhr1rg39x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2024 11:54:51 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 43G8fhhx027311; Tue, 16 Apr 2024 11:54:50 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg4ryx1hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2024 11:54:50 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 43GBsl2729033166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Apr 2024 11:54:50 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFAC458067;
 Tue, 16 Apr 2024 11:54:47 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 666EE58062;
 Tue, 16 Apr 2024 11:54:47 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 16 Apr 2024 11:54:47 +0000 (GMT)
Message-ID: <a860264b-e1e4-4d10-87f7-a95f0eee4e01@linux.ibm.com>
Date: Tue, 16 Apr 2024 06:54:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/qtest : Use `g_assert_cmphex` instead of
 `g_assert_cmpuint`
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-block@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20240414173349.31194-1-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240414173349.31194-1-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z5-AnbfhOBMo_IJkUGSeHREa5Uef08ku
X-Proofpoint-ORIG-GUID: mG6XJ0J1cvqu1R3E9vwkLOx5-VCk8zTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404160073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 94pVJmeDn6Kl


On 4/14/24 12:28, Inès Varhol wrote:
> The messages for assertions using hexadecimal numbers will be
> easier to understand with `g_assert_cmphex`.
>
> Cases changed : "cmpuint.*0x", "cmpuint.*<<"
>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/aspeed_fsi-test.c          |  20 ++--
>   tests/qtest/cmsdk-apb-dualtimer-test.c |   2 +-
>   tests/qtest/cmsdk-apb-watchdog-test.c  |   2 +-
>   tests/qtest/erst-test.c                |   2 +-
>   tests/qtest/ivshmem-test.c             |  10 +-
>   tests/qtest/libqos/ahci.c              |   4 +-
>   tests/qtest/microbit-test.c            |  46 ++++-----
>   tests/qtest/sse-timer-test.c           |   4 +-
>   tests/qtest/stm32l4x5_exti-test.c      | 138 ++++++++++++-------------
>   tests/qtest/stm32l4x5_syscfg-test.c    |  74 ++++++-------
>   10 files changed, 151 insertions(+), 151 deletions(-)
>
> diff --git a/tests/qtest/aspeed_fsi-test.c b/tests/qtest/aspeed_fsi-test.c
> index b3020dd821..f5ab269972 100644
> --- a/tests/qtest/aspeed_fsi-test.c
> +++ b/tests/qtest/aspeed_fsi-test.c
> @@ -63,22 +63,22 @@ static void test_fsi_setup(QTestState *s, uint32_t base_addr)
>           /* Unselect FSI1 */
>           aspeed_fsi_writel(s, ASPEED_FSI_OPB1_BUS_SELECT, 0x0);
>           curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB1_BUS_SELECT);
> -        g_assert_cmpuint(curval, ==, 0x0);
> +        g_assert_cmphex(curval, ==, 0x0);
>   
>           /* Select FSI0 */
>           aspeed_fsi_writel(s, ASPEED_FSI_OPB0_BUS_SELECT, 0x1);
>           curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB0_BUS_SELECT);
> -        g_assert_cmpuint(curval, ==, 0x1);
> +        g_assert_cmphex(curval, ==, 0x1);
>       } else if (base_addr == AST2600_OPB_FSI1_BASE_ADDR) {
>           /* Unselect FSI0 */
>           aspeed_fsi_writel(s, ASPEED_FSI_OPB0_BUS_SELECT, 0x0);
>           curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB0_BUS_SELECT);
> -        g_assert_cmpuint(curval, ==, 0x0);
> +        g_assert_cmphex(curval, ==, 0x0);
>   
>           /* Select FSI1 */
>           aspeed_fsi_writel(s, ASPEED_FSI_OPB1_BUS_SELECT, 0x1);
>           curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB1_BUS_SELECT);
> -        g_assert_cmpuint(curval, ==, 0x1);
> +        g_assert_cmphex(curval, ==, 0x1);
>       } else {
>           g_assert_not_reached();
>       }
> @@ -145,11 +145,11 @@ static void test_fsi0_getcfam_addr0(const void *data)
>       aspeed_fsi_writel(s, ASPEED_FSI_ENGINER_TRIGGER, 0x1);
>   
>       curval = aspeed_fsi_readl(s, ASPEED_FSI_INTRRUPT_STATUS);
> -    g_assert_cmpuint(curval, ==, 0x10000);
> +    g_assert_cmphex(curval, ==, 0x10000);
>       curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB0_BUS_STATUS);
> -    g_assert_cmpuint(curval, ==, 0x0);
> +    g_assert_cmphex(curval, ==, 0x0);
>       curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB0_READ_DATA);
> -    g_assert_cmpuint(curval, ==, 0x152d02c0);
> +    g_assert_cmphex(curval, ==, 0x152d02c0);
>   }
>   
>   static void test_fsi1_getcfam_addr0(const void *data)
> @@ -168,11 +168,11 @@ static void test_fsi1_getcfam_addr0(const void *data)
>       aspeed_fsi_writel(s, ASPEED_FSI_ENGINER_TRIGGER, 0x1);
>   
>       curval = aspeed_fsi_readl(s, ASPEED_FSI_INTRRUPT_STATUS);
> -    g_assert_cmpuint(curval, ==, 0x20000);
> +    g_assert_cmphex(curval, ==, 0x20000);
>       curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB1_BUS_STATUS);
> -    g_assert_cmpuint(curval, ==, 0x0);
> +    g_assert_cmphex(curval, ==, 0x0);
>       curval = aspeed_fsi_readl(s, ASPEED_FSI_OPB1_READ_DATA);
> -    g_assert_cmpuint(curval, ==, 0x152d02c0);
> +    g_assert_cmphex(curval, ==, 0x152d02c0);
>   }
>   

aspeed-fsi-test changes looks good. Thanks

Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>


