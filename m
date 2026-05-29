Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FE8CD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:37:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT256-0006GP-K3; Fri, 29 May 2026 14:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT255-0006D7-3e
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:37:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT253-0001LO-3O
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:37:14 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Nw2518485
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ds4eePQRVhbBzJnjqMZDIhEp7q7wwgndXkltHS6Z0s8=; b=VeTcmVZhllLsTVKU
 uotJlmRp3X8481EDz6xOHaLzEEG3uPidbPLCrj1G4XyNBAkyUTIAyoMpCMBZfNKW
 8+tGSDTIXGqicDnuQgLYyKDLPBva0w19+1ZLZrqac2CAa33yM186sIyXbKgaTfbL
 vAz1FEoVqt8bv95DQYCSrv6ILpDWXVm5G+/RfzhUVXkpzgL+0vETiEvuiFd0CaVP
 crKVAvJ3UKZTmhHxNmzkSf/UIOdkzdbARGhY8MdFjGKD0RXkSu/j7cCbsQ4DE9t8
 nBtwDX4GBAfzn7MQ0IyCu6HcDH+VfuqGbdZCUI9uhDaZtIg+pO49bBiIAMwlPuUC
 eMwSrQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgusp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:37:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304d8e9563eso511931eec.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079831; x=1780684631; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ds4eePQRVhbBzJnjqMZDIhEp7q7wwgndXkltHS6Z0s8=;
 b=hO7tHorNoA0a3sVnbJ60LpVCsSbVde3IBUNcVdtMC9ed4tkTsd6jE0FdujK7+2TxoO
 eHYMze5sfl7QN3tRc6lsW1ltX9ETQUwwEtlbtu/upGQONdpaShjdppVErBuCl+5+nblj
 36tXsubkVcIFIM4N3zL5JEze3+FEXWpoZIFXhih+JYsQL6cv/tr5hGDQEzg5C3BT7Igl
 EDgvmVtlnXQFQG4C6t2P0GsuAE8p7OvT2KNH9zpnqzSeFVm3hLWAHrydpay3/5DUuhSA
 557vziNhl5PNr8D2+0vLv0rYy0zfQfhWDdgsMsN+Dqx9AjwCIjbamlRdnbxRZTQurU6h
 eLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079831; x=1780684631;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ds4eePQRVhbBzJnjqMZDIhEp7q7wwgndXkltHS6Z0s8=;
 b=MOwUjdzIh6aBrcJuzm0eVNHV0ppFDK2QgAAug0CTpcyYTBRk76Kc8DHRP2824DjfGv
 HOnuFpa5FiYSYA9xANq0OFmsfpAUWtveaEzizcsYK/R5pIcZeFBKE/qIlNThBI03CLFY
 Hq6ARzK4TRJFoc5p43pEKtPeCA+5wfebC95AaeDndRGY88jQCCw6qA91t6qkrkcow2QJ
 iczNiTJa61bl15AMRDm8qAs5qJWVdm7d35/v6RQ+cxYxwV1bI0Swgmns8UCTTHHkDLgU
 qY9r7PTSzEntS8oF1mfgCDk5KXvpX0Zdw14Ag1BIqaSn0m/zm5yGCfmLLGResyPCB0Dr
 cHJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8IEy1CPQes5ocRBtFFLRozKX+f1ME7wdC/J6zE2pJNpYurMk9TwUImFFWDvlFEa51S7RmtrRJ38g==@nongnu.org
X-Gm-Message-State: AOJu0Yyx4ameFpZA8pcNkhVI4nmkOiBNOyTXFgbmvhe8RwWL98G2n3+G
 UT2t1WYW/UUH5GvVod35ypb3DZwn1ZF07lRS4OALXTQX0598l2o6V8VRQXnAFFtj5CW5FS5G0uZ
 cAcZUOJ0MiUmAbwiQIvj87C4rXNa8k7nrNufol4sR9WtNN2VE9Kspoxw=
X-Gm-Gg: Acq92OE5q4dFl0N+SUDJIKwz71uQwBa8r5aCvSHDzmYrxJ0o2/xe39ugWKQyW3J0HSp
 5Fup3XHdYS7qpTRY2/5bkmGK45ug0rS0bfemtme22pcroK0kAHzflfXAOb1a3vCvEZcjEskcfsa
 4EWtdS18X7UwOyVx4xTpys7n8Bdx3WSAMoz2YC2cBlU26HjGsOCb+y5egwXCiChUzP+FGLy9MQs
 VMfgcOF71WXUwVnxBOnOJbpF1achVM+jgDXfqKW6xH7JyzG7yK6cy4mVXJpjWG+DBlSOH70QL8B
 BSRd6wt4wArEDEPrtLRNrCk0VGWZxFg5P4gKvvaL0s4JcQkjsKR6wxhv+ybNeYes0KZfvcIz+nV
 s0/KVV14Cs9s2FNKVWSVSmBa8KX/+/hATkOB5hWb41xMu43kqnx4KV2RfkuUlB2wVv+A1fPimsP
 hu8k2JXKA5xPyzrZ7HYkjsir7W
X-Received: by 2002:a05:7300:570c:b0:304:4f23:4592 with SMTP id
 5a478bee46e88-304fa65a9bamr502905eec.25.1780079831198; 
 Fri, 29 May 2026 11:37:11 -0700 (PDT)
X-Received: by 2002:a05:7300:570c:b0:304:4f23:4592 with SMTP id
 5a478bee46e88-304fa65a9bamr502864eec.25.1780079830697; 
 Fri, 29 May 2026 11:37:10 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed53f316sm2011607eec.19.2026.05.29.11.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:37:10 -0700 (PDT)
Message-ID: <cc80a7f1-1d48-4165-9cc0-f24cb4ede599@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:37:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] accel/hvf: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-10-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wgVZjFZfzJTHsurFiONkpiDYGiqbLZpr
X-Proofpoint-GUID: wgVZjFZfzJTHsurFiONkpiDYGiqbLZpr
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19dcd8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6jQ7O0SlXpQS7W1eCiIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX/TIX/rUfchOR
 BA7AwjVianThqA4N9nd5buxIKTga6MLXOyFyajljd+HmDYVNEt7I4e85WZK//wnm/p5oMby1E+2
 khJ77hpp4HN8aj+bP9oRD5K4nGosd0fo2OZ9KZkxczOrQ5CtIsgQc6+L169k9V492XiS4RLD1e+
 8koT0ThSX/3bAD/5IMNjqBPTUmbA982hxbfNRQi2jWHiT0RJaIdm2tXjdn9D4gPGDIr28MxztX0
 QEI8b6s4NYS0c2gFQP/k09Gy9iZrdGLfNo2GkRqaa/loUYqL1JiNi5wCCnBrtMYMAEzrYG3BpPx
 1lFr7k3Wsf3VePzlz5nMyAZ0+00msFKOFsTjCZIMsLlMqHhW1ZmsEZXWEWGw8SlLE2FDVJnZwqB
 t1SxLU0aWPGB93ZoFRwUbRRZoexTF/aMAG+GB82l8fFQB15LM3crf7EpI9a57nwVUYiXaLCWAtW
 R/AORNFrCIiCLJIoLdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> HVF cpu_instance_init() was only implemented for X86.
> Add a stub for ARM, allowing to register as generic
> AccelOpsClass::cpu_instance_init hook.
> 
> X86's ACCEL_CPU_NAME("hvf") TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/system/hvf_int.h  |  1 +
>  accel/hvf/hvf-accel-ops.c |  1 +
>  target/arm/hvf/hvf.c      |  4 ++++
>  target/i386/hvf/hvf-cpu.c | 25 +------------------------
>  4 files changed, 7 insertions(+), 24 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

