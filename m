Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2653858lfm;
        Tue, 16 Jun 2020 07:12:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP2hn20jOFChGEuQ+367rj39MmoPZlFigoPIfcrb9RDo+m+z7jE5Y5RpkNP8q7Fz95hAIQ
X-Received: by 2002:a25:2515:: with SMTP id l21mr4845322ybl.177.1592316723432;
        Tue, 16 Jun 2020 07:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592316723; cv=none;
        d=google.com; s=arc-20160816;
        b=FPREYHaCyugZ3u9R1fCV/zEh3iG1rdb7LB6X6TfiCgPDOlGVXxhilYdRkhziBc4Yh8
         1AfxOMHCohYdq+dv0VN/MM8x63JWYQ3cwR9DZbH1eFIPiL7lA+2f7KgwEMd+gNmwtsBy
         rlZac86t/kIVpODjUvOAZQ1YukeKMMTQ6NSGjP7HkyuJCaQe0A8aWJzjb8mgOywgCy0o
         IvbAmckF8vFmT0HerjwUNuSPq516ib90uqll995JLVcAXp8Rkv0y+LD2I6r5Yu+Beqde
         hVqUlODoT4+/nhd43TyfouGt9dpbIIPc6tPUtycKcTLvG1VTwqOZyi78bLPIEGaaT7+I
         v9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=XLN9g7XEEG4KNg9+b2DtbOvATEWRwg+WzS4CV1sRsfA=;
        b=lF/REgySV9A0DD3ZmAnTt2nGG5ApRAWi1t/q2iuhOhnGlgHdKGXC0LtzgI98xIrTid
         DtSot4TUxd2qWA1AhVdaseenPjWtYn2K52/9ltVriUTcGUD8n0FoIqmCIL66yHzgPnfn
         Thq3FfHuzMBRxn70PWP1ng24VqxvxBPhSqX4w1bD2VDQzvUMgT0GFNnH8iLdGJtv0kAG
         36eqT/WMLzFP1ll0lx4nlMGkqtmJc0iQ2H57hT8DokMhqJV4r3geS7X1JuawaOWYOlzA
         cRrmit/tcIi5zn+CDYwPUKGk8Y6Zhlvf5L6OI3qzoIMPtV8AKPaXTt7MdNGdnQArTsrO
         +cVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si16108100ybk.427.2020.06.16.07.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 07:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:40400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlCJm-0005XL-S0
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 10:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jlCJc-0005Wn-9c; Tue, 16 Jun 2020 10:11:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jlCJZ-0005Z6-PH; Tue, 16 Jun 2020 10:11:52 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GE12Mv174684; Tue, 16 Jun 2020 10:11:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31p5evjn2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 10:11:47 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05GE1G9Y175448;
 Tue, 16 Jun 2020 10:11:46 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31p5evjn1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 10:11:46 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GE9HMc012446;
 Tue, 16 Jun 2020 14:11:45 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 31pe8p3mkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 14:11:44 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GEBie78454412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 14:11:44 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1429D124070;
 Tue, 16 Jun 2020 14:11:44 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0196A124053;
 Tue, 16 Jun 2020 14:11:43 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jun 2020 14:11:43 +0000 (GMT)
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
To: Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
 <20200616143327.2ee38a48@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <3c3b466a-c965-e3f6-9bd6-74fce9c424c8@linux.ibm.com>
Date: Tue, 16 Jun 2020 10:11:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200616143327.2ee38a48@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-16,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 adultscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006160097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 10:11:48
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 philmd@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, lersek@redhat.com,
 ardb@kernel.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CWfEKH5yw5Th

On 6/16/20 8:33 AM, Igor Mammedov wrote:
>
> nevertheless looks like faithfull conversion,
> btw why you didn't drop Acpi20TPM2 structure definition?
>
If we get rid of the table we should keep a reference to this document, 
table 7: "TCG ACPI Specification; Family 1.2 and 2.0; Level 00 Revision 
00.37, December 19, 2014"

https://trustedcomputinggroup.org/wp-content/uploads/TCG_ACPIGeneralSpecification_1-10_0-37-Published.pdf


