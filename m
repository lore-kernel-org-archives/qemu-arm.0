Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C512C55179
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Aug 2026 14:59:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wqu7g-0007cE-DZ; Mon, 03 Aug 2026 10:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wqu7c-0007bx-Nf
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 10:58:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wqu7a-0000JH-BZ
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 10:58:32 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 673EBkSR595650
 for <qemu-arm@nongnu.org>; Mon, 3 Aug 2026 14:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 azUP8zVXrDW0Aib2m/OhbmVYA0b4Cy7Knwfiy8Z0L8U=; b=fipP25cbIZ6H7cPA
 JIVQYTlzRFIaM8l7PtLswVJHJuheRoK75MphmcsBbVwGkBQAOVMxh06WfXkdNBkl
 4OmaGgMBvcf0//vVIk5FmPdT/utHe5abNrpCTudzTFygFrBGKk1JTb7iA+qMud3w
 baGBUywDePahioHcW9/MUbd3uo5OQYxNrBfnwKLUmGlmJq6A8ZcguGGt6KaRvJ+h
 hj7u8uCGyF2Nqza274AlXquToc5SQrri5jZbVX8EruuYtK/pGwgNIaCPrNZhEFjA
 ziWEDyIN0jMiA8mx3+DRlmqTyizlNb7HCWi7URdRmjxfgVwK/40LMu7zDT/xkO4L
 vVfcTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb26tb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 14:58:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-526da7e3c9dso30949851cf.1
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785769105; x=1786373905; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=azUP8zVXrDW0Aib2m/OhbmVYA0b4Cy7Knwfiy8Z0L8U=;
 b=XYxH+zFO9s+pgXJE77m9SBGYyTaefPr5rH12nFxFpLnqgLg9r6T2pEt1DyJZrp3FPo
 l8LyTfxf1et8QhXRI/rZ72jFEEj9iwH3TXv+06El3vKI4IkQ+kirFURK3p+4uQ9Sfu4n
 j7sculNtUxzz4SIdD90/giPiwTnDscBnRnuFkOi2MCbYDn4QbtQ/iuTJPtHJAT6ujkGj
 sHjlYO99IBxkpNyoJwAkPGVzSPDG75pq4S2qU7K2IMhMcOvU53bkSswgMWn3LTCYBKRm
 IpK9Z4Ic9pO2yINiyncDtArwUuz7avSqGkJa2P8uuBZaPtNpZsKySMGS+UKqBzYABWyh
 kaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785769105; x=1786373905;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=azUP8zVXrDW0Aib2m/OhbmVYA0b4Cy7Knwfiy8Z0L8U=;
 b=fvwBUaiCwuS3z4RGuNCM7VJ1yLHubnBTx2+l2LGRRlGdnCbEEV+Uqilzb8CgY5oJaE
 8Sphvpe6nGigm9+uF3UBTPZ1el7OdTsthPLcJm2mKdR3+io5g+gSpkmZI4l8Xe9Pgjfg
 pAVwVUsv5tbR1/bjHtvisVrN0iszT7A7RWVRwoJp2atXayWQflaR3ZjpJ0ZCI4zA5uOj
 qLcE6y8NCjEsUotDF810WTqZuxN9nDnDKEdVfswh+07ePfPoMCMCLk393UEozo3xfvaa
 pX1XqRNAMgA7Cv4b+MS4gLeGb6tyrzSm6hOh6YloQTdb5XjqGsgti6Sw4EN0Byt/EZL5
 xuLA==
X-Forwarded-Encrypted: i=1;
 AHgh+RosNTJbPIn2JKZdl8H7UGTG3DzfqmzxvrJqsgFpLVApzoBO/xOeYTXOGyXvpGlsgw+QjhSfOFpfFQ==@nongnu.org
X-Gm-Message-State: AOJu0YyWPhKezVTvIZdvrcDhuoYdWphL8HIMaFejvJqmktMTSXDwpRJE
 jKeV+nvMt+YmcSwkOwW4jMKvRkp1j5RCNfMHDLjOT4nJzwB2A9G2aKHZPdqxLh2GZChruIw4QE2
 LL5hOkf1mtlPtv6aMWWOosCqc0+xJgqrn1Zm1FJI8dHyaz4A3dpmsBCI=
X-Gm-Gg: AR+sD11a77rR09ZSGMerW+5onZi89Uh2MxWpRvm+TTqPBzzvqseV2DeV5pnjU0EW5vi
 4PqVmAQdxEtaRdtbkL153sTEtR3JYMFayE6ouzynloHObOn0R78bxo1v2zlnGuOuvNzqZpTK8lb
 kB6HhVJtS/bd6IIz+3fZIKCKA5qxqAKXH9c7ikMuoTIkQ1MS1Cj2WZLTg7gIUcjgTxgFA7jEa+H
 uUOfKYEdm7ycsal8NFxieet2I4NRVBH0blBN5KrPD7qTYZVux7IQ8FA8SzgWgru1LN9Wq9/+kYH
 jmycMPfEKZ2dSQy0aLEkSI2e2OHGOB1IazhlfN9FzKUeijBE/rBmdWiw/CHZjKwOs0ax3+blanO
 AfLSeUqy0vzkE2Lb3fd17RYGlKtKz5hP9n7A=
X-Received: by 2002:a05:622a:230a:b0:51b:f857:cf82 with SMTP id
 d75a77b69052e-52b5669e087mr211377341cf.8.1785769105322; 
 Mon, 03 Aug 2026 07:58:25 -0700 (PDT)
X-Received: by 2002:a05:622a:230a:b0:51b:f857:cf82 with SMTP id
 d75a77b69052e-52b5669e087mr211376671cf.8.1785769104774; 
 Mon, 03 Aug 2026 07:58:24 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a5a4sm34213084f8f.20.2026.08.03.07.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 07:58:24 -0700 (PDT)
Message-ID: <ed657fe4-c944-4d72-badb-59219e8c100c@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] tcg/optimize: Handle revbit{32,64}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260731000503.170446-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JtzmCWZYDF8KcbzATjIwtd5Uk94jp7GI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEzNCBTYWx0ZWRfX6qepl2cMXl3P
 brby9i1lwUcUXsqExHvBTUatLAjD7gbsQCwiLeCX8djq4lUelh7SqZgYvZZKYDLVMWYSjWNQpOx
 +BN0TncoE8VyEH9or5rdTW8jpnE+2Gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEzNCBTYWx0ZWRfX/byh4qSz9QrH
 0/3tdTghZeOGvb8nCiSZysJH3fKtFpLIfAzpam9ChEiy6XRG6jqrY/cMsIwaenWplZHw4nwTg7A
 eyq7XT7Z5GKsIBX/4KjHFqj1d6I19smXzNiMItPzl3gxZoLITSyQvVTD9Tqvsj08CKrKLoQ1Rkh
 Dfj4TXaBMPa/g+Ga1/fwMTVcfMjOCQOR4ThpriCqkcMQ/RdlIvWlXcxWN6vUGP2gqxjVkSD12QG
 KGiFU7Bdwu2LrN3zsg/Th1795khG6HklOlrlC/3SiCuFdQqFfFBAZ8nQ3VRFAY/EKgY1pM/B2X+
 Jk63a0HjwLPG5VcHpR665MuA9CgWaZ9RwZOGBqHaBVnuT5WmdYO8jYv2m2alshaj7HGYu9dP1hZ
 WbFVrGng3rCb/23R6NqBptj3JNUdtMZnYaVHqpLSZoFH9B7slOZfmgQL9OLeI83mYkC6UZkE1a+
 JePfz45p6nfETGgw1qg==
X-Proofpoint-GUID: JtzmCWZYDF8KcbzATjIwtd5Uk94jp7GI
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a70ac92 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030134
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 31/7/26 02:05, Richard Henderson wrote:
> These are nearly identical to bswap, so reuse fold_bswap.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/optimize.c | 48 +++++++++++++++++++++++++-----------------------
>   1 file changed, 25 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

