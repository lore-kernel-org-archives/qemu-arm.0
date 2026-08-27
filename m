Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7743BC61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 10:32:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzXP0-0001so-24; Thu, 27 Aug 2026 06:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzXOw-0001s5-4u
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:32:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzXOt-0005qN-L5
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:32:05 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R9Gm6L470812
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 10:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2DBINuFMm58bjywl49w88Q8ntiTVwCXL5/JJ9jLbOUk=; b=CT588Ai/L4MtbD/N
 pq8Hzn/5S/K/UAW7noUxqq8PUSoO+edGRyxiZWTlIamtFKtg2JFcp64403PYiAU0
 vSU0dz/LOi4Yv20tnK8c/81Qb0FZ0OpbIzyBfUoihuxJMeJl47wh/UJEEthVN9wo
 7KPSZZbUWfpdsJxEXyKHeKJ2n5YDBZmjJEcvMswyKPD6+IyeTz/DCv2XBng1WK4o
 atDyIiidoXG68p4cJWDifk1cNgw0c09CBjlxnpfrEMlgq+C0m/x2NtN7Ugb55Dp3
 BZF45Nb19hzxdHZVplGte1NIUqxjtdjROpEubp4P0AjxP228WPr0kLoUktEdHpLl
 4z3A4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5jacx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 10:32:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52dcf1bb6e9so7429211cf.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787826721; x=1788431521; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2DBINuFMm58bjywl49w88Q8ntiTVwCXL5/JJ9jLbOUk=;
 b=EReQBofNvmUKzaKKmTvTlYDtQsBQd5GCyp6EyecsGu14X2bfGAGOmPKHdOGNE4CTC1
 blI3cBjQGfWJcb/PhfNhZXjlDE5wteBmVlA57VsUaSLE5AE9/jKACF+HydR35Xbts1qG
 71vFCmYaSeGyIoTKP7oMFelyqwwWZFV0rfHO2YfUdfH/8blaJjG97+ywx34MbbQjlt0e
 2kmwYBMKrsIi/EA4//Io8REwnkBkqPMpQo+2SxHjhSolQqBe3nxrxp/x1D9szZhtQ7MD
 1mK77VwiGEcx/jlWFi4pOVR7xnduzHlj0SKsTyNw8n+eoTMYgc/eDixiNgiSGU6JoktW
 Wgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787826721; x=1788431521;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2DBINuFMm58bjywl49w88Q8ntiTVwCXL5/JJ9jLbOUk=;
 b=drlsVUZGFA0B0XLGZg6DkeQkkMjmJa4ghjBzNf10tz9spkqO2KtukrlC99K7hfISz3
 BQkltGiYOtMmnKdMn2JdhKHMDj23WZQz8qLxdUn06RHI4i+A4T3ZjDDxisXIx6j0IPFq
 Pn83wr7KgClRn4n2Ta51tLiQiNE5C+bJQ6xKttwJ15PFneYjbyBcTW2GOBzfCB7tSqpD
 /e41Alig7NDM24pY9opWd3+8kEItcPdF2bUZM3JVYjiwPgMEcVlUQHFZPxx0vUkUBUAB
 fDJjEI9yxm2mu7KUXz/8CBFlHECF/ybHeDSq+rhEEmltZ6hhE52kUxRtNTG461vdrZDv
 v+aQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLqjA/zcsB0U90JEUQ4hMWBzCJRg8oHPmcJR7TW+MaSBFWvEX8oylqjbFZ1s4Qr2N4n6sC2MUKPQ==@nongnu.org
X-Gm-Message-State: AFuF++nkKXI6sTh8xQLldW58IV3Lah7t0t/anjrAak8RodnnjqIXtWhy
 eIm96vDqMlJc1Gd699e08QHI9Kmp5CJ17DtOwU6qtTMJs0t1xHYPs535mzCdVN6+xIV56L1VAm9
 elkkbrzncAiFrFQylqRj4GduTB8sKbIR2W9fNO0E82OG3XM37I74bLu4=
X-Gm-Gg: AR+sD12Q988OEoYnz/N9nqEVsI0fwBp3Vex6hwFEdROvM6PwN7SkKLrpqe1dDf3zFZB
 TNqjuzecluj/cBC8MggmTQrjqqjLMOupvzf/LF4WmtBFdtoiD1paaPwBjeSail0qXO/PKxN6yiX
 NQlr4NyCBt4OpQFVOJmA8ZnfzIbit87Fovs6/lm0rsgu3/2O6uLRhlypRgCaPNcrOuvXn/AEzEn
 yAl/mk6ub5+CIcbtVITgy7n/dtyOQXDyaf1kurdvpWNx4Lg8NGWwAj9oX9xby/cAslYNBQNwBnQ
 ABuPY9L9jDZjzkEzcm7Nes1JJM8VemXHeeO1l0kgte/8FodcXs03xu/0r7GmU8SaeL3EG7hDZpm
 srjfEsaHEF2v5U6vK5MA3R1TmyBDcFnRtlQ==
X-Received: by 2002:a05:622a:4291:b0:52d:9cfa:663c with SMTP id
 d75a77b69052e-52fa185dc9amr59596591cf.0.1787826720506; 
 Thu, 27 Aug 2026 03:32:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4291:b0:52d:9cfa:663c with SMTP id
 d75a77b69052e-52fa185dc9amr59595761cf.0.1787826719892; 
 Thu, 27 Aug 2026 03:31:59 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f854dsm8106335f8f.36.2026.08.27.03.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 03:31:59 -0700 (PDT)
Message-ID: <53ce22e0-a26e-4641-ba20-0ae65b290bc7@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 12:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
Content-Language: en-US
To: Alistair <alistair@alistair23.me>, stephensportia@gmail.com,
 qemu-devel@nongnu.org, Bin Meng <bin.meng@processmission.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Troy Lee <leetroy@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Joel Stanley <joel@jms.id.au>, Hao Wu <wuhaotsh@google.com>,
 Glenn Miles <milesg@linux.ibm.com>, qemu-riscv@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <d88347aa69db68c498b593eabcd2377413ff4af5.camel@alistair23.me>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <d88347aa69db68c498b593eabcd2377413ff4af5.camel@alistair23.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DQwRDTg3coq8eGkGMQ3VvUtqy1D_LD7d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA4NyBTYWx0ZWRfX8pb+yk8Lu8ec
 yrTlCo33sAsp9dgl3qYs+bMKF0aeIgl46YXe+iFCg71eV4DtBmoto1ryT0KNK02H4s+yFn3rf1v
 drxv7/hPow5HJLlbi4He+H1Nio1cBDY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA4NyBTYWx0ZWRfX0LB/y6gtL913
 MmLAFy0sSBFu2v9eiTdco7GtCLcoceVfYdM5Ccvb0OcqAuG4J2ImMpQl6QankRJqwiDiiPJ++D5
 fJyfFfpUTFrQ1pLzQGnOnuydWKU5eCTQNlfbcRcUKEXX5pO27YpTniN8bMU5dzYbvI7U23dO2+I
 en5HwVEZz6XjxwQW/p6xjvR9gVrGXNnvitBCYceiXUJwKkEWKh9QXrdKAgb45iQJrwk/ewbE9V+
 RgpfWCgRo27XUVu6BoIBM9z/EGM2wt1Dv4E9SVcpntZPz/Xa8/JUHTvuwkXst/eg5UW1WbCiGpS
 4Gqk/kfH7NbrBbQ0jSDdXF//y1mNSBSrVzCgSkh8ek28Rrn4xsGAqBSVgRAqx/GvbKPjV6q2FIL
 YHW29sprTFdoQcOHYYa5NPEeuVQBgnFJP9q9B1FWiY72JUvW6JvNnZHk7nzTPVSH+MHM4b0qntR
 K5WyQJI6tRo2rdbXg5A==
X-Proofpoint-GUID: DQwRDTg3coq8eGkGMQ3VvUtqy1D_LD7d
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a901221 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=t9496tuAAAAA:8 a=6o3zYDZGyaI6ylSOKDgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270087
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Hi Alistair,

On 27/8/26 07:37, Alistair wrote:
> On Tue, 2026-08-25 at 14:04 +1000, stephensportia@gmail.com wrote:
>> From: Portia Stephens <portias@oss.tenstorrent.com>
>>
>> The ssi_transfer function comments say that it takes a word varying
>> between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to
>> transfer
>> but there is no means to indicate the number of bits that should
>> actually be transferred. All child classes of SSI_PERIPHERAL class
>> have
>> transfer functions that, despite accepting a 32-bit tx, only transfer
>> a
>> single byte; m25p80_transfer8(), ssi_sd_transfer(),
>> ssd0323_transfer().
>>
>> The current implementation depends on the SSI model to know
>> what peripheral model will be attached and what transfer size it
>> expects which is error prone. If a SSI_PERIPHERAL model was written
>> that
>> accepted 32-bit transfers, it could not attach to any existing SSI
>> models.
>>
>> This change updates the the naming of ssi_transfer to ssi_transfer8,
>> as
>> well as changes the return value and transmit argument to be 8-bit.
>>
>> Most ssi models handle this correctly already, sending a single byte
>> at
>> a time. There are a few models that are written to support non 8-bit
>> transfers but there are no in-tree use cases that connect a
>> peripheral
>> to the SSI device. These have been updated to use 8-bit transfers.
>>
>> Portia Stephens (4):
>>    hw/ssi: Rename ssi_transfer to ssi_transfer8
>>    hw/ssi/pl022: Fix dropped upper bytes of ssi transfer
>>    hw/arm/strongarm: Fix dropped upper byte of ssi transfer
>>    hw/ssi/pnv_spi: Fix dropped upper bytes of ssi transfer
> 
> Thanks!
> 
> Applied to riscv-to-apply.next

Can you hold on before merging this please (or drop it from
your riscv queue)? I tagged this series to review but didn't
got a sufficient large enough slot to look at it.

In short, the reason I think this isn't the correct way to go
is SPI "words" can be any number of bits. While QEMU only
models 8-bit word devices, I have be working with 16-bit and
even 24-bit words ones, so I believe the current implementation
is right. I have be thinking of a better way to model this
granularity in our class hooks, but haven't find a good one yet.
Restricting some devices to 8-bit to simplify them move part
of the complexity to the host controller so I'm not sure it
is useful. I'll return with clearer comments when I get more
time.

Thanks,

Phil.

