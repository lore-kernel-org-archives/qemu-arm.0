Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEE0C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 06:41:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpgw0-0005nZ-1a; Fri, 31 Jul 2026 02:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpgvx-0005lM-7T
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:41:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpgvv-00004w-62
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:41:28 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V6628b2636584
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8GVF2fqPtaAZZQunJVgfpc+XzjmoGZBfAQulPbNZTuE=; b=FxORd4P7F59VMqEn
 xXksCeJZPOFReYs8+5T42EHey3+v67mpaHlBQIOGo3ImwmyFnwsEcttlVXtu+SNE
 uks5GDClIO6kw7pf7r6GNtqZ68pzk7CuBVEzfs7wUwat5vUokdXku9yXC9SzwLCp
 xp4ZThyTFjn01on1b0HRku6WZFlq6xCK7yfPemh08I2gds68JTvIXDbZscSb+ksh
 SBFLigOHWuhzdewV5TeyiRkHfArvlaGcBrq2M6CbWbrpGnjf/5X+GwxQ8lO8eBVz
 CCd796kpCgjv3HSYUbBpaX/mNZhK67gZHPdo2wIQgp3FlhIP9VC7Yow2LowkeW/a
 NWrnsA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp4y044c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:41:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c07f25de2so4600491cf.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785480084; x=1786084884; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8GVF2fqPtaAZZQunJVgfpc+XzjmoGZBfAQulPbNZTuE=;
 b=JxFbS9Sg//9+WFlfSuD9VtvFHFSjF4cdjibsHtV/tUcH0wTnI8pfTNsPwm8k4mToYc
 0ooimvr+odsph1RiYsbvXlKZa2j0YCOfI2QS2UetPfLwb+UH4a3C0kWIGa/fBCJnh6CK
 QX08ypnnd+ULEyCDygZj1D8I1s+Ip+M4sXJ0+zWmQS5LLdJ7Ca3VS4I/DVImm8/kPjk+
 e9IiRMDEU6A0QdWN9CQZ3K9Wrs7qh4sIqlZqaN6tsqo1Hltg4DWQXbxz8VwMyDiNfuJ8
 AvWF5Z2cddGNnp5QknR7b9EaJRqRF9zKRKAhCAmO1DWnH4p1cTI6XJa0H4P2d3jhGaa6
 FVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785480084; x=1786084884;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8GVF2fqPtaAZZQunJVgfpc+XzjmoGZBfAQulPbNZTuE=;
 b=jhST/lU7GaeWesZf9BbEy1FS0wg1OaC+b+HPbvGeXWVgs4jL5QZ0Q2wETOVTiqe2ij
 EhPf44saZ56EIUX7CdFMrjPfZ5wPaSrWmS6bLUJGMIeWJq38QIJHh0H0JipieAnpauS5
 4VGuz8J5y0OpxfUd619e9DTGx8+uz1VlAM/QTbNDCbiiN3VYaOAc6GKRRaYiGnxTcsZf
 DLzfcBmy98BbCEfqEXUuZ9t9Fk/wUYHC1zNWPG5fkXTvPPIoGReDKYjPi/K6mI5oJVjq
 OMH4Vm1shYd0+IAAfpsfBLtlsn8oq7YGVBwqeZSBcpYhg3A9f+Dw1zXQBR+8u3w3kl0r
 iU/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RocJQO0ZSr8vdN78nn97bSViS3mGSPMgitxAoqRCFfzxkOjG3fV+6kEJDvHdxdH582p+Ya0nMgkWQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy6AKbIEfcorCadjCNteFO7J0z3ijZ4jxhW1UsILzbBNFEq90VE
 fQdVOyhPA8rg7Hb36PSLcVOh1B/TDBXy6ylL5m/GXx9IgQ2ycn/z2vy4/fRkkGvXoP5I26kgHog
 RLY4a8CZxF3dzMWPREW87jwtoV/HgF811Rn2AriD8bqjrD8FGrpr5VlY=
X-Gm-Gg: AR+sD126+7jvtf8ZhPFf7k+ojgi25Z/LBRGEbALtVxLds9spIeQhJH1G1o0n9+SWOr8
 uvtpnOT0A30Gog0cZxawbm8W/FzNXUk3on4/1xfrKGHbxtqBdukb6aMWVR/6rYM9f+Yj6sAH7cB
 boXuAlSObWzDLRmnMhttkoh38nQbzgPTtU+h3RMaJ4ci0RPDEsWfS2X+EvWFsdi6mpi3UlXKSIS
 Hgmvp86eaI5IxIFz4mUz4ynD0nJMJUdZnxZ/vu9c1uJdGwSAFyO2A4M9ELiTuMTKanOrAZxjMHr
 qGsZdYKiByB+XkW6174NZe5pKTBr0niMUujtwECruPe7tcsVdxgw1ca8vTb9Y57Ny3krGGOT5hm
 a+iQ0DoXKdSBrtsEXQ+4pSgB+pYEdR6Vbhd9ESeGC4L/96nZYxQg=
X-Received: by 2002:a05:622a:90f:b0:516:d812:c35e with SMTP id
 d75a77b69052e-52b4afa49e3mr10273951cf.21.1785480084242; 
 Thu, 30 Jul 2026 23:41:24 -0700 (PDT)
X-Received: by 2002:a05:622a:90f:b0:516:d812:c35e with SMTP id
 d75a77b69052e-52b4afa49e3mr10273321cf.21.1785480083203; 
 Thu, 30 Jul 2026 23:41:23 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a09c6551cbsm279294a12.20.2026.07.30.23.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 23:41:15 -0700 (PDT)
Message-ID: <2a9588f6-7d71-4522-91b5-c015858b0d17@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] tcg: Add tcg_gen_revbit{32,64}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-3-richard.henderson@linaro.org>
 <9ed4f5ac-c51c-4fe6-8517-488913ecf50c@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <9ed4f5ac-c51c-4fe6-8517-488913ecf50c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K44S2SWI c=1 sm=1 tr=0 ts=6a6c4395 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pnALmGF_m-dbqv6PJe4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OGm0Sbf_GqRQQ2yi0kNtQnO8ycqwU23n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX3sigD4FxwG4B
 JL5lMDqyprAKoOF2hdgTjMI8cQLSV+KtazAGhut4qi/lTGmOhDgyR1LPhYI4/H3stHyg+oC+3Vd
 FnoWDbPkS99f5A51hbUJ1emDFZelnuo=
X-Proofpoint-GUID: OGm0Sbf_GqRQQ2yi0kNtQnO8ycqwU23n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfXzgU431kKVdG+
 SQ9LfRJ7yAMzXrjQmdHORva1v3Hrb1x3J/fh8MDvpqoz1hxr2s9qVAJQM8MzD9c+EOuxUIGsAI8
 BlYjnoN048KmBKqopzKnne5hstJzw/dvN6v23bfcDBIzV6teFyGOvbE84K35vxRbDQTvnJhWFbj
 7tCo7BQOIejMz8PLM7m8OO4BtWxGrNBqoym7rIyAngFgFdON3s4qJwAkAjigwielEvAnM3l44gZ
 E5QLN1ngrNq8YAkkmKKz3PpmtwDS46E2oYFTx4JWoCsCIGlgOv+kKptqQthafpU4rer9blkhyKq
 2N00G7m0NlHyOPLcXXdJYG5Z2GUJX9zUbiw976E+We1Zqxm2OX13JJ4vLYqFeozy6CwwVx76TPF
 xN6s+nZKXTEhKWKUHVgJOkKaRwXZR5x0xbhiE4gHctUwtp7yuKJfqBSgm0Jm8XegaMmExAhi7Kq
 0LPfXzuwO+I4+RA0e1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310045
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

On 31/7/26 08:08, Philippe Mathieu-DaudÃ© wrote:
> On 31/7/26 02:04, Richard Henderson wrote:
>> Add generic expanders for reversing bits within a word.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/tcg/tcg-op-common.h |  3 ++
>>   include/tcg/tcg-op.h        |  5 ++++
>>   tcg/tcg-op.c                | 59 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 67 insertions(+)
> 
> Missing listing in docs/devel/tcg-ops.rst,

I now see that in "tcg: Add revbit{32,64} opcodes" in patch #7.
Since they are for frontends I'd expect them documented in this
patch, not #7 (backends).

> otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
> 


