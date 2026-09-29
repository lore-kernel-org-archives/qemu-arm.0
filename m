Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC239C9832A
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 15:03:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBZMx-0006Qn-8y; Tue, 29 Sep 2026 11:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBZMI-0006Dt-HS
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 11:03:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBZMG-0005DT-O3
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 11:03:05 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCqho3858080
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 15:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 05Akc9GMnhequFmmilTTIdP4SVT+/WUgp356FieEbRs=; b=iWn3i+bf7e+NdglV
 Lswv28iLwyoPUpMcVzgn9ClvRoBug+TYNUxKJuVc+/cUjLojDVBlyraKVrBxLsSK
 SFoYbu9Ets04aN/T/e5CXh1EZRPgK89xwltldD8L1zy5pKLknHyswLrfp6hNKZyL
 GvIuQ7AgiU3+4FvolYibEdL4PGwd+bA7cu9hq0W0QRuwfgi0iqhgN7YpZkTNx4JB
 SO3O0ysIEPTdBHP+/hk0EYo9Zo/6vllnGRsnc2rAAOMTBjymXkVbFArzhKvk9OE5
 wuwJvdijP9iv0bV+KxqmwY2gPuo70Q2wqAXQIE8fDRQV+sGQkxKUqqxgX1v+S8i+
 UKNXWA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0j38g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 15:03:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7b43c5f2b6fso298731137.1
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790694183; x=1791298983; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=05Akc9GMnhequFmmilTTIdP4SVT+/WUgp356FieEbRs=;
 b=WwVo6IT95YECJxJr0iG+i1KFF17M8xs8dbIMqWATs+TGjgUtO4tukIkjXlxxwB8I0l
 10XZE1z6jUEYbxXqCb9ycUzs92bb1j1lVH1zA1O23jdxktNgtTAKEZ+u/YgtA15KsMcA
 tIZQHfB0GzBH8HcELAQs/EHl8P+twlit2NXKB/OX2XVz6sLtVb7tuGJOQmUUfnjqFcZw
 VeHYJkE64AQu2yj5LfCBCSfyKOSbtfbiMp4fRBMdDGg241iDdqrm0jidWgdoIpJCJmJE
 e7g+E+4pe9EzGAObdPRarLN+iWlRkN+t3JPbtgslZaGmS9s2NEjZwq0JiiWewpgii0Jv
 NlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790694183; x=1791298983;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=05Akc9GMnhequFmmilTTIdP4SVT+/WUgp356FieEbRs=;
 b=E7V1imalAIbI6tT6vY1RN0FpZUGmBOhy2HTUyqR7sRH404OwjaEgMHioSTWcwEWiun
 JFrpTIQUOaTUQOVzgoykgV4ewxPBYzLmxzv9tz+YJz4CeGkIzAY9+cPhQzetmwyB0GUD
 wHMf/sCTNMhO1NKn+8E0brOxGosPPlnfHWUS93Xla2TBt+zRKp83KH80K3W0oiY+oG7J
 gtXflSQhwjp9ZQDI2GQeLVATYONNtaDLLur6U6Egr9Z1+D6wMAO706OZOfpvchSwMW+p
 rDupZ7RsYaTjUqtIRUE3vmIBOnqits7PE+TUFRRgwWP0pUzhJhqc+7y32GQXngKc9xmW
 w4PA==
X-Forwarded-Encrypted: i=1;
 AKwUvByntLtvJ44g2QQndg5Z1Npiz05oHmZveuloOhrCeB318ETrzcdjOuJ5s1BWuxr3BL1cwUdWWWViWA==@nongnu.org
X-Gm-Message-State: AFq9FYImagN5TVOY+0hWFY2oT0fgtvSfho1GDX05lYYuuzuFaZUws05p
 BxMBm08k+DKggm5/fOzMNcAkXWe7RrtrTKrhKIri7KncSTY0RJsbvQ6w/QDq5ACw4FRrM7aDS6q
 quRFfGpOV5hf2TWlvRf51lPKumVZPY0/f8xJ52fBf6W44oOvOa07xih0=
X-Gm-Gg: AYBFou2mZ3PJuDHrweEALnCvDsrxnpUpLSCjoZwDEf8eMBEb+YYKQo68cK46rJ0Ngmx
 8Bpr2tTPdV6PucwCNumZBJcsMKH6E5C6OXiTe2fsfS5IzTNe6mMEjJXFDm2e/5BVnERrep7QNJQ
 qQfuqK0QxbjPFDPynB3oPFCBOKTKhOqWARWU4rFX15Ipnfb4penKxHcSJpe5kOC6594yOffrnkw
 KdNksVcszbVnwwp1hg1UzrVytYB5jelAtEcGt5zPcia2yzL5n05a23TMwdfdm5efGjb6cwEkiAG
 XKef77pAPv1FN/xfLPrbq/HHt1B+b5x3ew2j5qBRLjDnovAMJE9WIycb2u0DLjpYJGppsA/e/Lb
 QRqwkA84dnuT7yMymcUxttHjhT1YFEq4b7A==
X-Received: by 2002:a05:6102:f95:b0:7a7:198a:c2c6 with SMTP id
 ada2fe7eead31-7b1d76ab79bmr3387397137.36.1790694182680; 
 Tue, 29 Sep 2026 08:03:02 -0700 (PDT)
X-Received: by 2002:a05:6102:f95:b0:7a7:198a:c2c6 with SMTP id
 ada2fe7eead31-7b1d76ab79bmr3387370137.36.1790694181933; 
 Tue, 29 Sep 2026 08:03:01 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cf9dd27sm85331975e9.2.2026.09.29.08.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 08:03:01 -0700 (PDT)
Message-ID: <90a6d2b0-f046-49d3-9a25-3dd459477943@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 22/25] target/arm/kvm: add kvm_arm_get_host_isar
 helper
Content-Language: en-US
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, eric.auger@redhat.com
Cc: cohuck@redhat.com, peter.maydell@linaro.org, richard.henderson@linaro.org, 
 maz@kernel.org, oliver.upton@linux.dev, berrange@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, gshan@redhat.com,
 skolothumtho@nvidia.com, sebott@redhat.com, armbru@redhat.com,
 philmd@linaro.org, yangjinqian1@huawei.com, shaju.abraham@nutanix.com,
 mark.caveayland@nutanix.com, ping@khushitshah.com,
 sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-23-khushit.shah@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921123249.1708067-23-khushit.shah@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfXzgikPJ+8C4w/
 I/96kiqCgGh9xSgTEcEqdiXK6X1uMkVEBOrsSzDuvgKaJa8MLXl0rHmezC3YQJfwtM97f9PARdO
 eHeEvRZdWKqjEapU8WlmsY2LJphpP1Q=
X-Proofpoint-ORIG-GUID: 8J3YRVOphsaQTdmy9B2v7HoWwSBX1fuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX97PLQJ9PTjqb
 Q+NrO/phQzFaPe9HkiXs0g6krSRW90m3RLALqSO5afsBMs5ccwVoCP1FKMmAjh4Yc9y6Qz1czEc
 OFdvw32UIa5NFJCFl4m3XaCZ7jLZzqVUghiPFc1B2CBaGNw7Js9vnsAMJWqrJf31yvlbN4Af+51
 Q3hdqpqVhYJXgpo0x0lDHdGc7cj1r7VVhZsXTkK28znHEpOamBKV1bNOKMRYXmFTxDtoSnnBTsj
 qKJu1g/zp6ausrnsvj6PSCSPq4HVOYj6wfbKxix7NnTrfIVnbvtWCznowP8KBmOT9s/QJRfqiLk
 F20ZfJLqTWcVxDY97GUmq2JvzH3VV8gX0hUSVUtLPXxsnZMqXeU7BCn7a7AkeaGjIoIuZkhSjoR
 +EUDVrIbs9FACX8IQ3OKloODcDnZHQ==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abbd327 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=64Cc0HZtAAAA:8 a=ioU-NUoMSKYkJ-EG2NEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 8J3YRVOphsaQTdmy9B2v7HoWwSBX1fuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609290059
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 21/9/26 14:32, Khushit Shah wrote:
> Introduce kvm_arm_get_host_isar() to provide the host ISAR probed through
> a scratch vCPU. It will be needed by later commits.
> 
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>   target/arm/kvm-stub.c | 5 +++++
>   target/arm/kvm.c      | 8 ++++++++
>   target/arm/kvm_arm.h  | 4 ++++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> index c9cd47bf47..059a7afdcb 100644
> --- a/target/arm/kvm-stub.c
> +++ b/target/arm/kvm-stub.c
> @@ -151,3 +151,8 @@ void kvm_arm_field_get_supported_values(const ARM64SysRegField *field,
>   {
>       g_assert_not_reached();
>   }
> +
> +const ARMISARegisters *kvm_arm_get_host_isar(void)
> +{
> +    return NULL;
> +}

This stub could be avoided if using in qmp_query_cpu_props_info():

   if (kvm_enabled()) {
       host_isar = kvm_arm_get_host_isar();
   } else {
       error_setg(errp, "query-cpu-props-info requires KVM");
       return NULL;
   }


