Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6887C624D3
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 15:34:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1my3-0003AP-Sw; Wed, 02 Sep 2026 11:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1my2-00039e-OD
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 11:33:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mxz-0002nS-RX
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 11:33:38 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682DHVV5468427
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 15:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U3Q+GQnfF5ilVqbH66h9gxYBW8Rm14Cez+KeqeNRyWU=; b=IGfivb1EULF0+oBI
 UaIlxzVx/biDfz/+cW+OD/ZkDHLhC96fPbWLU9fXv0hhjq/F6rNwqjVWFcY1gErw
 P2bVaB2biD10vxXjniKqynEt1rCsowxupUUQ8Px59tQKIgVNXw7pw0VAUkymmv/u
 n3Ua8FqULRbH/NmoEOcJorEyOqwrSprmOXoA9P9Y2DOtSNmI3Z7yirLTBl+pKSwt
 E9B8BNhICmuKKlqfAeO6PWOi4WkDBqTNC43tR2it4dEPTJrWmr5cbEdpggcxGdbC
 WF6lqk1IWbdYDZQixdxKM/1KdIOwop4aKMEjsZxD3uLpfRlxiM8QeyoFtApEgZnW
 hkRelg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0gmm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 15:33:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-933023a5980so283040885a.3
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 08:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788363213; x=1788968013; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=U3Q+GQnfF5ilVqbH66h9gxYBW8Rm14Cez+KeqeNRyWU=;
 b=G4UHRuq6crPUFtWu/PlbNwVqb8TsD43JxA91n8ZOxvIust6Wj38cCAPsZjGrRgvR98
 omjlLp8nBaV/WAWz8scPW9LL+KenTRhJt9L7x6fReYR20PJPFbMI9cp5P5ind61eEpCL
 HQuZW3lP06r09XgoKCO+tvaROjCpYDgZECnNSV0Z0NVjIkPzhMyFWNzNzpkfR5MAIVuA
 2Kg/C0j3EzWlXtyO5YhZ10c9faQ2Usht24FdAjwnRA0Rq20l/rQBj+uj4d68RmQr2JRH
 R65T5zIMY9YzeXtR/We4HJInZSs3CrwSFSyvInq1LOIpz9JN8IOglDWwZ43bP2agVfdT
 hrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788363213; x=1788968013;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U3Q+GQnfF5ilVqbH66h9gxYBW8Rm14Cez+KeqeNRyWU=;
 b=qMYv1F6WgtNiIXctGK1pwyb3B3fPqTK3hSMau006xhHq9LewX1m+XdXEKfPrrBVXdQ
 thY/vkuO9qOToyNPTi/JmE7pNXZEhikJ1rv1iDv7tZgbhUhknN5U1xA0QQtxNWEzQI7Q
 sMe7q3KKqsETAMmVdwGV441wUdA6QsV4WBWMDQ5IrM37Wi1hSExHLwLi5RQjKV8g5dZB
 Ek5mQP/M1tBmetxX5XyXp7eb6/HFT+4iMBkVsUq1dg3E6dNCBeSlkY4Vns09hmM36OG7
 XrucHAkBM+9DcUFBo7u06xG6o91It0QqgqfZgjWz7k7ymvB6T9Fz2SPgiaHQrsKKPfXL
 PI9Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDENgaszEL+rEdi4oXtb27ETIn4b0YIa9Adc/nODehDkZYFlsluFZT0vaPB4JFmalUBDnNKUOEhQ==@nongnu.org
X-Gm-Message-State: AFuF++lw7WmU5VGcEFqozaRQivr2G3qJYHb1vlFzUk4kjnZtSTM0yx0u
 esi0yPr59xqtzJ7HKjX9+oA79xS7Z3F6CHWI1N0HatLqAMYjPHMYmjQur+/Id+oP8XyK7+18jni
 gVldrjxMbUFTo0a3evoVKTX2Jf2FqldCpXT3XDhl06zq2Q82j41I9yqQ=
X-Gm-Gg: AR+sD11Ww1OF5/3UpcLHRxzMUyE+y4mWH5eW6StUMmAjFuOMFJJY1qAUUnv2xpIrq76
 AKP6o5n1syza7QXLlQgTKNqNhqBJKphED1Frsg+Mb5vRI+RB3NuFaYmCXm3YGN11UcmDeKPKYad
 MidejMfw8b4zp9m8YtxNEl+Dv9MElXPbnmkHtugOKJhzkt1ofkA0acPQrAoWaC7wRfBQKFFsbRx
 pWxH1s9UNqjSaz0UCF3A72YBHTdD4UJ1pBL6I08cQATGHBZWN+dsfBTpT0EPrw5OkZOwLA5qD4X
 6Fwxgrf//E4RFCgzWRXt7YHyCgqDzlkz1TbbBrmrEEeW8TuPF7G21o8HEJKKperEfoNQYrRiTnp
 cVKYD+TOAXnZ9FXO/NjxKLQzjkErJvLfbGA==
X-Received: by 2002:a05:620a:d8c:b0:92e:ef09:f8f3 with SMTP id
 af79cd13be357-93960c91ccemr715167585a.2.1788363212311; 
 Wed, 02 Sep 2026 08:33:32 -0700 (PDT)
X-Received: by 2002:a05:620a:d8c:b0:92e:ef09:f8f3 with SMTP id
 af79cd13be357-93960c91ccemr715156885a.2.1788363211634; 
 Wed, 02 Sep 2026 08:33:31 -0700 (PDT)
Received: from [192.168.69.200] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eeacbbsm6815023f8f.30.2026.09.02.08.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 08:33:30 -0700 (PDT)
Message-ID: <4df7584c-08e7-42cd-8f09-140626e99937@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] accel/tcg: Push BQL down into per-target
 do_interrupt handlers
Content-Language: en-US
To: qemu-devel@nongnu.org, Robert Foley <robert.foley@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260902152044.31291-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VwvsaronBby-x7rLS1O66ifPtVLyAEVv
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a9841cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=n4G2-de4B0qz_4TvShIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX9ZB1KAFzVJbz
 M2hQ1dcnDhTEoEeLYlQCPMhM+q4uzG51gmJNk5+bMj/0XDnszmV/hIOhEmoxXfFx8KRz7VddarX
 BcXcmI0ceQsW6z/puXFdqesQ1Q+ALOc=
X-Proofpoint-ORIG-GUID: VwvsaronBby-x7rLS1O66ifPtVLyAEVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX8ow2msvh4GAa
 Rl6p5+8nc/QGBAjRcV+vhbUfGQPLDma3jawOQV3i3vXSEr2oIefgm4BHBh7zyfMCBjo7IfLGO7k
 Kx81AL+CMVp4VKU1EhMyeyNNbKQAJZE5c/dka7gzyF1sumBeXDaARWVzpB2rLTZKKTXTwSC2iIT
 w4xoICjNshnLNe718kNzqeZ6YlJeQnG9XFX08iS+ss/q9j81ulJPO8byluBioapP6YzfR/hF5Em
 pvhNYulKKfNxJL3ffcbfWoQ/IGePUxLNagc/hXR38NtmhFibJNpQw2UpsCic+1gDuN7UoDOecwT
 799JpFtoTsjnvjwiPrkTie7UXNHkL547aTt2PKlXFK3iOKQUEMEfXf3kbbMD+9w1rfdrFw5kxoT
 +OJljFinwc4FRW6olVms5saBxrXr//UZ79H1bluHKjw9PEzmZlW/GzXfr4oIwANA8DhzYdNyC01
 Bp4k5qG81xotw+TWFew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136
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

On 2/9/26 17:20, Philippe Mathieu-DaudÃ© wrote:
> This is a respin of Robert Foley's v2 series from August 2020 [1]
> triggered by a broader review of BQL contract in my halt-to-exec
> transitions series by Peter [2] and Mark [3].


> v2 Summary
> ----------
> 
> This series pushes the Big QEMU Lock (BQL) down from the core TCG
> cpu_handle_interrupt/cpu_handle_exception paths into per-target
> implementations. This allows each architecture to manage BQL locking
> granularity independently, reducing contention on a known bottleneck
> as measured by QEMU sync profiling (qsp).

(I couldn't find what/where 'QEMU sync profiling' is).

> 
> The BQL has long been a scaling bottleneck in QEMU, and the
> interrupt/exception handling path is one of its heaviest users. By
> allowing targets to acquire the BQL only when needed, we enable
> future per-target optimizations.


