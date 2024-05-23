Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp881090ejb;
        Thu, 23 May 2024 00:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX79AvtCfb43sIY2TqWSAjPlCbNRPOjlPyqPWlG6XX8phEOEwNlRaZAY3oGjUQi675sZZKyis2x6DlD7JERpv2a7NKShtDO
X-Google-Smtp-Source: AGHT+IEDgKH5Wh8YGmMXoVQ3DNxMhwEYhYvP5rkilGgvpPv/wsM18gHm2DyNPDyc8itGwcOilxyj
X-Received: by 2002:a0d:cb58:0:b0:61b:34b0:ff04 with SMTP id 00721157ae682-627e4846b5dmr39415107b3.32.1716447957274;
        Thu, 23 May 2024 00:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716447957; cv=none;
        d=google.com; s=arc-20160816;
        b=EdP4yeNU71FatOs7FgBIBTsfvIzqPeU5m3jGC7rOFxV20WJJhqLGZiYcbsMArKVq+C
         zmv15PmcYSBwQl2vHfdgGaBn6kfKbs0T12d3FUzJu2Hn9uMX4lle0PHcWYTJN4Ty20do
         2BlWK8cDeIGWKkY9/HxPsbTcqynrQFBFF4PS26LWba6Bo+bkb5qE1CxIfV2UN9Zs3W2h
         KO9zlbMtQf/iIeY3How2qYLQ24R+gUNmFyc0yEACVRMR3IOXQI1b6nd0CY3nCML4pzZz
         DxPzaB/mkU5ZRDe/huzK2oXjKYIFZOxoemaFGQcbPFgp3FW3/sOrTKinqvJNcd4G0XBU
         4Ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aqf4+Qv3dUYxAzYu5cRaT10hnzSfHy1IWF1VvgLdWJ8=;
        fh=2akEwGyYYotRF0QbSCoCGNFKhexddu7/CVj7WiNtaRk=;
        b=OJ0dZIGbvZ9gRRYi5pffO3by84f1bfCb9HdAlHqh5A8i5JpJ9IWCYCoIcCoQXncGb9
         /tmWr1C1E4lAFAFwf9sjlo2igzyCrBlJ0kJCGZzBiF3JtqO9P1wrvIbkUoPxz+eel54v
         ogHkZpF6mYdc7VRR0ZkJ/I3j0rRHfpRUAWai+57+fm7eeypT0EOZVsiNi46iPlTIZXpZ
         BA9wqApXh8MsyHm7oeboG9QzQopMC9ftFIX66hQsd1isgUdZ3NDL038KmI5PVIl/UHHy
         ALlbGknvpP04F7g1a9DFN2OtTDRRPbKhSQojcy1VyI+x8j2TwZl2KGVzTC1uQIHcuMXu
         GPKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=hl2L4Rhu;
       spf=pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=harshpb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <harshpb@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 00721157ae682-6209e71a6b6si138447877b3.222.2024.05.23.00.05.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2024 00:05:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=hl2L4Rhu;
       spf=pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=harshpb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44N6pL2r009574;
	Thu, 23 May 2024 07:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aqf4+Qv3dUYxAzYu5cRaT10hnzSfHy1IWF1VvgLdWJ8=;
 b=hl2L4Rhutkkx0WfFA7FWj6mMlN5ZRl95zn/BPn5aKV3leewvLmwNcuE28uVP8T7BDCll
 +E7pADluaUxEan9CZGRXNcdxDRWC5VeUGZfp5igtCdjXryr+6mkYR0e87cT65hAlOyun
 xQeTBkuvnNIUR2NbwfroSdiOtd3R/q4myK/FT86uA/DKcgxxYrqSeL3sDu/+rtkKmoJx
 DmyYFXXbN9wFJjfsRwU1mA69yrVyYtVboUfJyb/M/ovQY7eruqWWYj942HuOcrM7ydTo
 WLG31VElPN52Tak7EZKZ/IrBvd3chIudhdwHJcNNQwAN1ekOy9hPjyVnqA9FZMPQ0biF Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9wkm8g6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 07:05:32 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44N75WGf030873;
	Thu, 23 May 2024 07:05:32 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9wkm8g6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 07:05:32 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44N4JpEZ026447;
	Thu, 23 May 2024 07:05:31 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y785mrfqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 07:05:31 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44N75SX842008936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 07:05:30 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0622358043;
	Thu, 23 May 2024 07:05:28 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF0CB58067;
	Thu, 23 May 2024 07:05:15 +0000 (GMT)
Received: from [9.109.242.165] (unknown [9.109.242.165])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2024 07:05:15 +0000 (GMT)
Message-ID: <a5f3d78e-cfed-441f-9c56-e3e78fa5edee@linux.ibm.com>
Date: Thu, 23 May 2024 12:35:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
        lpieralisi@kernel.org, peter.maydell@linaro.org,
        richard.henderson@linaro.org, imammedo@redhat.com,
        andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
        eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
        mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
        alex.bennee@linaro.org, linux@armlinux.org.uk,
        darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
        vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
        miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
        wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
        jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
        npiggin@gmail.com, linuxarm@huawei.com,
        Shaoqin Huang <shahuang@redhat.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
 <20240522211111.232114-2-salil.mehta@huawei.com>
Content-Language: en-US
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20240522211111.232114-2-salil.mehta@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eQ0Si8-1UY7Or45sVHGBpHTIG4N_oPhz
X-Proofpoint-GUID: Ylb2JmW30nSgPF0nUNOME4KdUvrkIfdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_03,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1011 mlxscore=0 mlxlogscore=872
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230045
X-TUID: WOkJRl1DCWS8

Hi Salil,

On 5/23/24 02:41, Salil Mehta wrote:
> +void kvm_park_vcpu(CPUState *cpu);
> +
> +/**
> + * kvm_unpark_vcpu - unpark QEMU KVM vCPU context
> + * @s: KVM State
> + * @cpu: Architecture vCPU ID of the parked vCPU

s/@cpu/@vcpuid ?

Thanks
Harsh
> + *
> + * @returns: KVM fd
> + */
> +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id);
>   #endif /* KVM_CPUS_H */
