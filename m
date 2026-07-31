Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D5C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 06:08:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpgPq-0003pz-9P; Fri, 31 Jul 2026 02:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpgPp-0003pl-5R
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:08:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpgPn-0004HJ-Q4
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:08:16 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V67XHF3011001
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6mPEOvygjFhN+4bYhTKrNFRknYSGv09479CS+UvaIFg=; b=fRGGtrrjfRGU88eZ
 i1xg/WZjGJgMh5yoVXd1XF9guoI2qQqwjFR26a1eFu16cr/XqBuUPTsQtDtP1BWb
 w6WnsKttpBr/fAvMhpEAlKZFC//JR9DbPyeHn5SXwmcCGo9fn5Kpk/Xkuv7Gd8K7
 g5xW9g/h/oa8R/VII1T5WXJePeEHiY2HVP1E4lK2TUXegip9K54vC2I1mWyvp5Px
 4nVr6ll2yDsIsYnFjvNOg263Pu6XuzFU4yHhAUxVIVTZ5NLwh4ZXdZw9Zp3LSiDQ
 T/aK2HzhebV+UwfO754p3/t00QmWmaPisvwyFAIHsG7aHHJQK9N3jWnSusHcB2O1
 L0TqRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5n803e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:08:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e4f946461so74617985a.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 23:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785478088; x=1786082888; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6mPEOvygjFhN+4bYhTKrNFRknYSGv09479CS+UvaIFg=;
 b=g8ep8BNFmkVnJyeEcWn9qrGRMNy0TsKS9aZAt8KNgJEDfHvRhcU7z5EopC1a67fTb6
 AXWmnhRERXbjE2cVD+NFjWB15/MFkBybQhXm3IN7pb8RiK/w0HmGevFsqfraUXkPCbkK
 DWxRiueI0ZJ9HENS1DiVD/+9LLdcRubUcrJ5vcDfT59iZwbV3fLZrAxsErlMepoS4RT2
 bBbP/XgP/nZAqrzif6FyfzdN/JiaNyT8VfSDRpVCnk9BB7do7eEjVq+uWfGoIp1Bc3ZU
 mQbnJUiRHYohbQUm6MuYjp8tE5fsMM2acJaaMOkwJf04eg+FXbJ5pjB2MpfPOD76iEOM
 iVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785478088; x=1786082888;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6mPEOvygjFhN+4bYhTKrNFRknYSGv09479CS+UvaIFg=;
 b=US5Q5tQQiVmCnag81ffpnG0TLXrvdb+6cQF7jBQ/mfOEhoL8hRbYapuFvl43YqAlCa
 huWc5UdQoCILfUZT1km4dpQSecS1tX+5wc4Uv0+XHY1Sxl8CAxHWz3sAIOLpmzV3XBzX
 j7G04hgFQwA1m4+nr8xOac3StIo2paxe9IsTnJtpGyptIJe0Mge0brWJAhS2J6yxvA1L
 W+Xu7rDaue+2GSD7XIw0pUc3zfaKIj27b4tjO8H7QRwe6Az7bSFfl27fYwmYe2PLKnya
 CJC+LNj8n7ukkNWEnsNPw2V8jhYpN9hMazh6hiCC7i/iObTfcWE9Mf2UiEIbwljgeoHH
 h1FQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoyWkX7Cx0LVMBhdDogv6Qs95fIPk9tWa+7B5y6YeOcF5v9va4gBIBCoVKOkwDiVlB4/NRx/FxJIA==@nongnu.org
X-Gm-Message-State: AOJu0Yzd85YLeK1UaXOW6TtmqZwRTPLXgDeNwpocZr1WRJ1DNf0PUm0w
 CEkNCnIMqOd3sGgwKKMYkHa+QlvSjGtwALc6Syq07bPfSCbQlAPq22+v0j4dx25/7QutrgRvJ8n
 Pb1BTkNzB7xNCroTeYt04dET9bBSQPyEYvMz9JSeLhxN/AHquNCqVdA8=
X-Gm-Gg: AR+sD10OXn5wW9b7fVR/Yc3xhaqe+xL6B9S9u0jMX5GAcNxxvlTrpud1O7d1ALkmtOY
 +F9bSB7kopqLISJAoSVXf/XXD2d2MEqafgHMdMVUSqnDB2cv1dxmDhT++CDHMLv9ycozkY9yjlO
 q9Legdo5o9Wv1VpBr9vUsH1NMs9af8SyJtb6VunkpwU5dNyw9ozdbKB7E1rIkqKUrdmWkaa037k
 2jWQCKrgD+9NXllpc7Gasx79GZ19mOkO22tkk4Z8DyBCGMVAbdEFn9ftt0C3mY/s2OR1SE79qfV
 CPDv3fwe9Vij3Ncvu3McpKTg5c6lcaWA7rrZJ/VAFFC8ZSM44PclyMUfs9fytuT4qBCEsx5FwMB
 IpRnw1ROT2iph3N4uxjwaJTizNKu5iADz1t3LV0fYWyTBOFJtgEw=
X-Received: by 2002:a05:622a:1f95:b0:51c:1005:d096 with SMTP id
 d75a77b69052e-52b4af4fbb4mr8884701cf.24.1785478087797; 
 Thu, 30 Jul 2026 23:08:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:51c:1005:d096 with SMTP id
 d75a77b69052e-52b4af4fbb4mr8884341cf.24.1785478087368; 
 Thu, 30 Jul 2026 23:08:07 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2484sm921319f8f.11.2026.07.30.23.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 23:08:06 -0700 (PDT)
Message-ID: <9ed4f5ac-c51c-4fe6-8517-488913ecf50c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] tcg: Add tcg_gen_revbit{32,64}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260731000503.170446-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8-EgA_HChqHVJxP6f2TMiVcITTABa7l0
X-Proofpoint-ORIG-GUID: 8-EgA_HChqHVJxP6f2TMiVcITTABa7l0
X-Authority-Analysis: v=2.4 cv=bKwm5v+Z c=1 sm=1 tr=0 ts=6a6c3bca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX6wX3Iz2RpWdI
 wTGge2yRzLcemaXQIOMJrwGA3Pl1/7zwebSkQ8/kXv+8jjrghLQw82HcPNwUBL7PA4OYsiWGMfK
 qlmjR+WEJgOz3sJpZ+DASNnJE3kS2kD6kD+jhiHi/mfu+uw5/5uxMmdOBxgA4d1q5e1M1CMdOiN
 M7wjQVKoI1djIsu5JZr8O3l78tteFP3Xc5a0fM+o6/czYJ6BaMCkZIRMO21yDvzJAzB0wWLi7Eh
 dfjt+rOesxSiJuH+5f4MhEooP7eCBjHJG6oeiJ79ip6M7/BQcuUJnzAWHMUPC9sLMfYIaK87sOQ
 /A+thjAPgHAsh6etTcjj4P6udCh2Pslo2W0J3zRoB5jVsKV+TLIhoTtWwjsB5qCOJFtu8ao7cI2
 JyhaviK+OkthdOx/J+HCMrnB3pJHKpho5e3PqsMCw1wPtXYkgmjeKw+JPf/siQLvmWfFckqcaEH
 rrFfIZPKIbHrOJdMuJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX04EO63R/5QX6
 3zyq3598LeRR8N98Nbydez2MeoUoFt/W0Fmjg9OOyq4ScewQv2QndEBCp3UwBWnV07//tuVPx/9
 uBakbvCShnYmMGO47A0PtARgUadNOhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310040
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

On 31/7/26 02:04, Richard Henderson wrote:
> Add generic expanders for reversing bits within a word.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op-common.h |  3 ++
>   include/tcg/tcg-op.h        |  5 ++++
>   tcg/tcg-op.c                | 59 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 67 insertions(+)

Missing listing in docs/devel/tcg-ops.rst, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


