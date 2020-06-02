Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4112036lfc;
        Tue, 2 Jun 2020 07:10:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvOCSz/a7sxt3G+KcQHS/EsWdmBI0AClRG9+z5+s/cCQRIAQkNPkT4oh2j/wnDCBYebXtn
X-Received: by 2002:a25:c904:: with SMTP id z4mr44681890ybf.338.1591107011613;
        Tue, 02 Jun 2020 07:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107011; cv=none;
        d=google.com; s=arc-20160816;
        b=B1xWdEAmqF4pjKIAc6Po41LLn2fPKfE83wgKPmWTmRgOsfIhSOo+obJ9q79yJDMW0Q
         XmscOkR6Dp7vYd7dzB58LI/Tc7m9bH+mdclf3RVeamwNzE3pUoA/ER90MZtMpG+BxTFz
         Ul2Lfjd21TZi0pY0Nwx/hDkwqbeqK13k840zkSMQqzEOmjWSS2xGipw1ghglpgzkdz0d
         h03udbPik8oA4NavlHnejy5GV5/g7oF8gGHQ7Peyg3dIJywqeISeqpZxveX1VQ66sCAy
         IG3jUmsCnoW7Am/pn1g9yXKzCkj5spo9UbrzN419VkIqzxJiNPs3n4wqEKRq6pC2h9dK
         zyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=kFE17XkKysGavietTmW97HPVBqqJim2kc7DdJ7EQYGI=;
        b=Ys+Lmab9TWUeL1FFoz6AvWbqKYOst3kIZnuwA+PgenvYWeL+V58g58Evu94tp9tLM/
         oXKdMyXraKCe2d8HXoGyOssKP7xRYIuDZ7cmHYWpmoKPNzoLKFuglcrvE1DMTKd687ey
         MDHnJxy2LjA47VKxd5ljIkXdO0KdrgnUjnJgqQODEEdgudEA9gkTMh1YWwsT5K6VnpEr
         27DUtVY1/9MnLSGqouCEPQpj0vHHFJgMnIAaWGpZKTChRt648kQWncVldhs5yWwJAS4P
         /BenANSipCUp7Vi5nxrts5GlEG12ga55iMxKkrsjrYdnHorp2IeDb5eKZsD4+bsROvq2
         BNDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p68si669367ybc.488.2020.06.02.07.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 07:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg7cJ-0006Tk-0Z
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 10:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg7bT-000521-GQ; Tue, 02 Jun 2020 10:09:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41582
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg7bS-0004f8-Na; Tue, 02 Jun 2020 10:09:19 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052E4eU2151932; Tue, 2 Jun 2020 10:09:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31d2u23sfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:09:16 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 052E4rS9153465;
 Tue, 2 Jun 2020 10:09:15 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31d2u23sf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:09:15 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 052E5iiL024984;
 Tue, 2 Jun 2020 14:09:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 31bwg2g026-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 14:09:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 052E9D6q53477852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 14:09:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C58D1112062;
 Tue,  2 Jun 2020 14:09:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEC3C112061;
 Tue,  2 Jun 2020 14:09:13 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 14:09:13 +0000 (GMT)
Subject: Re: [RFC 3/6] tests/acpi: Ignore TPM2.tis and DSDT.tis
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
References: <20200601102113.1207-1-eric.auger@redhat.com>
 <20200601102113.1207-4-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <1272cf57-20c6-126e-51a3-8610f7330ee0@linux.ibm.com>
Date: Tue, 2 Jun 2020 10:09:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200601102113.1207-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_13:2020-06-02,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 cotscore=-2147483648 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006020097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 09:30:21
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vU1F8XHupn1s

On 6/1/20 6:21 AM, Eric Auger wrote:
> Subsequent patches will alter the content of TPM2.tis
> and DSDT.tis so let's ignore them until the references
> are generated.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..a2a45d1d31 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>   /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT.tis",
> +"tests/data/acpi/q35/TPM2.tis",


