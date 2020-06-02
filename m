Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4088191lfc;
        Tue, 2 Jun 2020 06:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqHVqXhFd1GYdx/u5jNZz7vmNvSW9mnVFK+MshTmVbpmUJHHBt75sKt/WWgzWqZfNl4zOf
X-Received: by 2002:a25:d057:: with SMTP id h84mr25694833ybg.23.1591105221892;
        Tue, 02 Jun 2020 06:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591105221; cv=none;
        d=google.com; s=arc-20160816;
        b=qp3jKL+Kb9JJoXjoGFZs4Vjuhkftvz0mR59mI82Js6hSKtHcKdwqD03elLtCW1RYG/
         0Bk2U3rjp480nnnr6mhqzGZv/A0oJX4fNN6zoA7fR1qFBTvElDB0BwaLizhoVnpw78g0
         96Q+dJD+bvAck+i+SU7WVm1UMh6U5/Ee0Ih8brmqK5TYXcLzCrcz623V77IWGfRkPTdX
         4DGLoIia98Ab4lLRw7zMHhV+rL/ju27JUefvNqJ1HemvLegMpb/ziHTQ9KCBvJch3+8j
         0uS+w990vAypOyeBfyGd1fzNb6cpgD8fJHGPU8llwg8Uz46JsOG+aW6AYw4RLmCWbJyU
         fO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=G1STl+XNRX3fJcng/QK+caQOwsuEveNjShC8rcmP/CU=;
        b=lz+1Z7UFKgUkCAiv4faWbn63iHKwLZQk05TekOEdphAX16IrVZxuIFAxZdwfr58fEZ
         0Cagl9LzTBw+k0f8C4LPY2jEgDmj6bGoWxM3oMnzwBSXqCYPgi+X4LkMoQI5C/nkv/vR
         ies0ya7B2Rxfag+5IC3ziLyVo+sqBlvlISgxDz7flb2eixwnUAXqiMNtaaguaXGrb8z3
         tlW1zV1Ltz3s9r5N7SXJRcaF3NpQeWGCV1kH1t1xXIN/IaKe9nWCYOsw+CryiHZWfs20
         EiYE+O3vJOu/cx83fR91XxVSSJMKb484I3D+TPN9GNw/4a311Lqh17smrOndDDg2XWoa
         iBIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si2953173ybt.337.2020.06.02.06.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 06:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:54714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg79R-0003a5-8V
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 09:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg797-0003Zm-N9; Tue, 02 Jun 2020 09:40:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35684
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg796-0005vo-Jo; Tue, 02 Jun 2020 09:40:01 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052DXflR107996; Tue, 2 Jun 2020 09:39:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dhekw478-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 09:39:57 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 052DXpRE109166;
 Tue, 2 Jun 2020 09:39:56 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dhekw46u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 09:39:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 052DQJNT011779;
 Tue, 2 Jun 2020 13:39:55 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 31bf49gp4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 13:39:55 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 052Ddtjx42009022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 13:39:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11591112064;
 Tue,  2 Jun 2020 13:39:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2B73112063;
 Tue,  2 Jun 2020 13:39:53 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 13:39:53 +0000 (GMT)
Subject: Re: [RFC 4/6] tests: tpm-emu: Remove assert on TPM2_ST_NO_SESSIONS
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
References: <20200601102113.1207-1-eric.auger@redhat.com>
 <20200601102113.1207-5-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <50a54958-e9e0-c95f-3893-f7f790186e0e@linux.ibm.com>
Date: Tue, 2 Jun 2020 09:39:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200601102113.1207-5-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_13:2020-06-02,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 cotscore=-2147483648 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020097
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
X-TUID: crp+oLpc1oVt

On 6/1/20 6:21 AM, Eric Auger wrote:
> While writing tests for checking the content of TPM2 and DSDT
> along with TPM-TIS instantiation I attempted to reuse the
> framework used for TPM-TIS tests. However While dumping the
> ACPI tables I get an assert on TPM2_ST_NO_SESSIONS. My assumption
> is maybe the other tests did not execute long enough to encounter
> this. So I tentatively propose to remove the assert as it
> does not seem to break other tests and enable the new ones.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/tpm-emu.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index c43ac4aef8..298d0eec74 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -49,7 +49,6 @@ static void *tpm_emu_tpm_thread(void *data)
>           s->tpm_msg->tag = be16_to_cpu(s->tpm_msg->tag);
>           s->tpm_msg->len = be32_to_cpu(s->tpm_msg->len);
>           g_assert_cmpint(s->tpm_msg->len, >=, minhlen);
> -        g_assert_cmpint(s->tpm_msg->tag, ==, TPM2_ST_NO_SESSIONS);
You should not have to remove this. The tests are skipped if swtpm does 
not support TPM 2 via --tpm2 option. This would be a very old swtpm 
version, though. So, all tests are run with --tpm2 option and any 
response received from the TPM would be a TPM 2 response that should 
have TPM2_ST_NO_SESSIONS as the tag. I'd be curious what other value you 
are seeing there.
>   
>           s->tpm_msg = g_realloc(s->tpm_msg, s->tpm_msg->len);
>           qio_channel_read(ioc, (char *)&s->tpm_msg->code,


