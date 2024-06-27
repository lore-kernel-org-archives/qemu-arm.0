Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp147967njb;
        Thu, 27 Jun 2024 02:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA7oiON9TaMSV0/p8FNcT4P2RAWy/cmALpBQSOXaGfOe6FcyKN0OApIHh0AUkWMT6qFGnc
X-Received: by 2002:a5b:651:0:b0:e03:106e:cf12 with SMTP id 3f1490d57ef6-e0345456fb7mr1422094276.10.1719479327487;
        Thu, 27 Jun 2024 02:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719479327; cv=none;
        d=google.com; s=arc-20160816;
        b=OPkxw9X0b3Gs+fKo/awOpup0R8OoDgOs0USHI6PrkFGDxG0E/pBrYS/Qn+KpHbTTH0
         Kn3meUWDsDpKukzd4iuReNwRZjYr+DLNbdoBBR8ZgKPXvKGv6zPngDzMIROvSlc+9mUt
         8zuCvM14umvX8DUz0k2/ZwhB50QM+bo5IKJKBzrlxDjidQfLW0C04IvGKR29pcnMxOeN
         Czs8jYkiQ6QSLRo3Ot0Py1oNxBUx2dqp1cqVaFEFDdhlOZwK6ODy7eoiLcA/FRIzwO98
         XFg1julgh//6UQJmNAJ9vQHP/l+LdZUYZ1z0kR/tSkBiRe5J4u3Z+HKpIj/ibM2NxLYn
         vn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WYAZCJTlNRD1YH3Teohr6tMxl7+IcOW1+PZf/Vf4C48=;
        fh=ZYqwqfbePfbn0vstTXQWddNzQLEPAn+mQ4euUA4RD4s=;
        b=kmYPLnoeVL9lQUQnCWdgBslQbgpGnk7oFErfpqaHlOdDMEN/zy+yzWlSEXfTxQTRUl
         JxTQ6spcH3Ofv7STZ3wghF4Xt+x8tTJRnV4ZQGoI3d8pLc2uRgIN2CcRViPrNeyqPgjd
         y3wex1enidBjhVgxGDRatdQ2huLoK42yWBVY9/8pyMUiigijZqAp28WMUr1ry3Cm51Hv
         BJC9nkWlln1RWrCDQtSrdFybed6VOn5FYADCdIoMZxL/AbhJpL3T5EcVjYIiENASIRmQ
         CaB4fEh76EsxHr1QubXpDfluUrpBOmThesaEV2J5idZ9VozuLs1L180bbqrIr2epR93a
         4iTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=pFHdE9Y8;
       spf=pass (google.com: domain of quic_asalama@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_asalama@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_asalama@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e0345c8195asi443010276.677.2024.06.27.02.08.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2024 02:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_asalama@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=pFHdE9Y8;
       spf=pass (google.com: domain of quic_asalama@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_asalama@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R1AYe2019664;
	Thu, 27 Jun 2024 09:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYAZCJTlNRD1YH3Teohr6tMxl7+IcOW1+PZf/Vf4C48=; b=pFHdE9Y8ZKviNaX9
	t5yyH28iNieUxGBGGtjmQDtEi75xFIFey61FDSdMzIoIw59f/vMZtrxID5+hmpN0
	kYNQF+tB1x2Pui6nzrq5/wLEAzs0LRaLJgx92eAMk/ZCYM5M8LLHJRSjiCs3uoMT
	Dgz5BY3O/Lb56n6Kjpv7e6bTzo0cfbRZLrZn4KHfDV+abWTe2NZ027+8EVXENomv
	YxfQxJOlursBTYXDTqZ6+BRA8zVRK86VNVn66jdxkNmbONtTHU543+UY7x01D8Ek
	mO2WAM3SViqKNZw0rA4BohpbRsYWk7MBpqr9lVqxMFKOuhevgOlOfZ0zKwVsK9ln
	ttmGyw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90k2qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:08:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45R98WI0006373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:08:32 GMT
Received: from [10.251.40.202] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 02:08:26 -0700
Message-ID: <9239d8b8-2b22-47a7-b3c2-0699bab603f3@quicinc.com>
Date: Thu, 27 Jun 2024 11:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] accel/tcg: Avoid unnecessary call overhead from
 qemu_plugin_vcpu_mem_cb
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, <kvm@vger.kernel.org>,
        <qemu-ppc@nongnu.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        David Hildenbrand <david@redhat.com>,
        Pierrick Bouvier
	<pierrick.bouvier@linaro.org>,
        Mark Burton <mburton@qti.qualcomm.com>,
        "Daniel Henrique Barboza" <danielhb413@gmail.com>,
        <qemu-arm@nongnu.org>, "Laurent Vivier" <lvivier@redhat.com>,
        Alexander Graf <agraf@csgraf.de>,
        "Ilya Leoshkevich" <iii@linux.ibm.com>,
        Richard Henderson
	<richard.henderson@linaro.org>,
        Marco Liebel <mliebel@qti.qualcomm.com>,
        Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
        <qemu-s390x@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
        Alexandre Iooss
	<erdnaxe@crans.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Roman Bolshakov
	<rbolshakov@ddn.com>,
        "Dr. David Alan Gilbert" <dave@treblig.org>,
        "Marcelo
 Tosatti" <mtosatti@redhat.com>,
        Mahmoud Mandour <ma.mandourr@gmail.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Max Chou
	<max.chou@sifive.com>, Frank Chang <frank.chang@sifive.com>
References: <20240620152220.2192768-1-alex.bennee@linaro.org>
 <20240620152220.2192768-13-alex.bennee@linaro.org>
Content-Language: en-US
From: Alwalid Salama <quic_asalama@quicinc.com>
In-Reply-To: <20240620152220.2192768-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fkXsrTe-vAZj3ikkYfqToUSMaguTzvi4
X-Proofpoint-GUID: fkXsrTe-vAZj3ikkYfqToUSMaguTzvi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_05,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=806 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270069
X-TUID: mYnjbnXLpBgj

Reviewed-by: Alwalid Salama <quic_asalama@qualcomm.com>

On 6/20/2024 5:22 PM, Alex Bennée wrote:
> From: Max Chou <max.chou@sifive.com>
> 
> If there are not any QEMU plugin memory callback functions, checking
> before calling the qemu_plugin_vcpu_mem_cb function can reduce the
> function call overhead.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Message-Id: <20240613175122.1299212-2-max.chou@sifive.com>
> ---
>   accel/tcg/ldst_common.c.inc | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/ldst_common.c.inc b/accel/tcg/ldst_common.c.inc
> index c82048e377..87ceb95487 100644
> --- a/accel/tcg/ldst_common.c.inc
> +++ b/accel/tcg/ldst_common.c.inc
> @@ -125,7 +125,9 @@ void helper_st_i128(CPUArchState *env, uint64_t addr, Int128 val, MemOpIdx oi)
>   
>   static void plugin_load_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
>   {
> -    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
> +    if (cpu_plugin_mem_cbs_enabled(env_cpu(env))) {
> +        qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
> +    }
>   }
>   
>   uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr, MemOpIdx oi, uintptr_t ra)
> @@ -188,7 +190,9 @@ Int128 cpu_ld16_mmu(CPUArchState *env, abi_ptr addr,
>   
>   static void plugin_store_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
>   {
> -    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
> +    if (cpu_plugin_mem_cbs_enabled(env_cpu(env))) {
> +        qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
> +    }
>   }
>   
>   void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
