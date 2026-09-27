Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B6AC9830E
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Sep 2026 07:29:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAjJu-0002zp-76; Sun, 27 Sep 2026 03:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAjJS-0001jn-UP
 for qemu-arm@nongnu.org; Sun, 27 Sep 2026 03:28:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAjJR-0005gN-EM
 for qemu-arm@nongnu.org; Sun, 27 Sep 2026 03:28:42 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68QKcw6a263743
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 07:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TEfeyU6VW9MHFvZc3xuJDDpjit7VZViG10ow1KCllhE=; b=XmakTD5tHUez5Tme
 1fu4Oygfx/SACtJUGbGLzDDWTVv5TB0+ZwWO2Pqr6j3kklkIheRnDkeFbgu+8IHx
 7ttQzzzG34KU/03KWQN5SZAmXGyHIIW2zuoNufVx3mQ8u+rx8BMGcZBF2tDONv2j
 TBd2FYUU8Mdyb4UHwFRTEFbvzZRir+8AQKXrXMkYENNuXYH6jUE5Y5z6QMSqxw/t
 5R+Jry/F3uagLGqIzsRyWAyhrbTKfc7fKcEQGLjYTNPAnrNv7NtSO3x1vnXLa3Q8
 /GcGN2rEBNRHWC0mbuq51RssscaMGXa/7n/1xLW6UCzD0UHzhYynme0VHTTsWjRT
 o4D/rw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6tejdjp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 07:28:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9394ad7f64aso345177285a.3
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 00:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790494119; x=1791098919; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TEfeyU6VW9MHFvZc3xuJDDpjit7VZViG10ow1KCllhE=;
 b=DO4YyDzoTkhTO/phBz2/74OGacdC46C/2OVB6doLgkv+n0glaEyEhc2Zj2l9hH4cT3
 7vohVS7HTGshhpxKnqFOL/X5h/44n0ie9mpuAavcQ3+eFPQehq7TPDXMokT7alfhbJP9
 iVMfZhnu+XYL+IBK1RNQx4Mgkq8NIWCOzrEmK2aY/HJEy2/sJMlaFTYJMuB21smfG9lO
 9jvOUMEwNG2q1XtLRLCFEMqo99omB6HWO1GKEdBsduceB8I9B9WTzrzpqouXS+p2amOC
 ylqtaE9Ad/Qiyl+saC66QeHI8DRXTKbqRaHSyBinDM7mhtCOFeCIXduiQpdJ2A6TOnZl
 tbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790494119; x=1791098919;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TEfeyU6VW9MHFvZc3xuJDDpjit7VZViG10ow1KCllhE=;
 b=zDHcYSo5Rlb7z4SkDcYpPlyheiHDJQ9rnFXcUWw6leCCCFOq2Qxf5LpWFeQDWXa1iT
 phFy9RQaLc95lVAqTzjv7iiWHlGA1eAyUnRO8XUI+YGzdyHesBsXj0yDibqHA6wZ7YKj
 Tgm0xaTZBsyljFFlvE2d2QRwv7GOwB033/oCVMR1WcNyCYhYmakoUltmPiOaI0QNLopp
 T4cS8QCuq0RSUAxyKV8pozT0B4uss+Wp2TFtML/QRl6e5QgYWlO79T6KGHhndscA+HYK
 7DFPk1SyCHODAUqAw7lRaSeUDlp9+givXZ5plai05ftJYg20tltmVkmDTgmMDg7OP/ju
 6R1w==
X-Gm-Message-State: AFuF++n2zcu+Rxb9k0xKNUohKgFhs6MkmsqadoQseSh32r+78iuu/3ZK
 wT+fVzEUVL9wdsz5XJ1kMyO7/dpYaW4MIcpFh3p0R/nKFmOZDf86hJPzppPBMH/Sw+/CxSnWpiU
 ff7nJB5KdRJUpXcnoXUqYcS8C1fs+dUrHYWL1LVBd0gM4e4t7/wQugXw=
X-Gm-Gg: AYBFou30rtuVOSJmDJUHvLMSZ7TTtJFDr4I2uQTCLgfye7B8rRob8BRkLvSW/MnQMuQ
 EuGGuSDcEGclURD6UdkA2AqkpnVZhOI7iq3VT6CkO36kk4RPXpu3d1aDkOhZsWuiSYfMBCPocPq
 qmkYCiX8KcLD0gm/HRA45REJhmiPekkERqB/SB164fWJYbK4aL5kwd0gKaWHHl/HJXB7q02Hkm8
 1KEHlodg23R1VD6vsIDZNns14uDuJspCixNcQ/kPcHySvVuLLq184/jGgYPNK2J6GsSF6uLe9WU
 iD8u/dguTapzatn3Ur3lDwDW5AaAlgS34DX6ED10I6YjHPePOu3NqKjF+dqJ6Vga6NUvBrg2p72
 uabbCuLh/WUh0sR0UlAPAdZHuJqYG8kDMEg==
X-Received: by 2002:a05:620a:19a6:b0:93c:62b5:fc58 with SMTP id
 af79cd13be357-93c62b5fd7dmr503030785a.62.1790494118591; 
 Sun, 27 Sep 2026 00:28:38 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:93c:62b5:fc58 with SMTP id
 af79cd13be357-93c62b5fd7dmr503028485a.62.1790494118111; 
 Sun, 27 Sep 2026 00:28:38 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0019162fcsm36853325e9.13.2026.09.27.00.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2026 00:28:37 -0700 (PDT)
Message-ID: <30fa3419-f6a6-402b-a1e0-b009196e9197@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 09:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/bcm2835_cprman: correct register index in test
 for mux update
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Jonathan Gilbert <logic@deltaq.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Luc Michel <luc@lmichel.fr>
References: <20260925100726.1546566-1-logic@deltaq.org>
 <507fb835-61a8-4e66-80f4-1ae6f07a5bf1@oss.qualcomm.com>
 <52c613fd-41ca-45c0-9d74-faccb58c11cc@oss.qualcomm.com>
In-Reply-To: <52c613fd-41ca-45c0-9d74-faccb58c11cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAyOSBTYWx0ZWRfXwHJ0Op0q3Ite
 vufKXVKqYpcqzpxYpepJ/RwkFNDpbBiH0413JoTROwnN2bdRzEzd1OoXn3/FRc3qf9xc0xgSlVt
 6yskUR7Ppb55dUr/n+SE1RBhHNpEsRZsjXaaCkBwNKKE8SLDAI8FpLZttQK4zD+4sEwDXqkGlLm
 /7onYVIjFa775rR1M0Dgw2ksRqWYPcg/rbZ7lCfuo2E91H/bcO3qyK0eS9vVsB+woKErHnGV1Lc
 tdNAg6ewCtykQeSwjLVv6hYayb17T++KUsPrH3D0b4tYoW5CLrr1qsdvPz1eQ+ZjbwrGTc1fHfV
 pC82dkPM9tbaISps8pmtwLEKQqUy7GRXhgmDefEUYv1gUipfo+y/igT6p0rQABYx+tc4O9fFxXG
 EjJJCjffwfbqXo1Max6UlyKTG3s33SmRcggtyiDj0qiWYvw16EBQ+fH39l54k5z+sU1HpxLi+ow
 HZzxSWkX6JmMuZ8ZZyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAyOSBTYWx0ZWRfX24lZguwdW30z
 r87DU+mVvUnoPLsYgWi0ZBCXNKtb7EMFGickP9gCskDnRGqSGCIcxFx6om5cebGD+WCtfx7uKIP
 M41BF6cKMOT/jMQ5t3cbDYQMZyMKwHI=
X-Proofpoint-ORIG-GUID: XW8y3hhmIl6Rltx8ejmX-ZvmnJfRWE0f
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab8c5a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-ISfGIX_AAAA:8 a=V7FwDPytFGZRKx2tYQMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=6K80JWTZPwV2TOQbRzu6:22
X-Proofpoint-GUID: XW8y3hhmIl6Rltx8ejmX-ZvmnJfRWE0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270029
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

On 26/9/26 11:42, Philippe Mathieu-DaudÃ© wrote:
> On 26/9/26 11:30, Philippe Mathieu-DaudÃ© wrote:
>> Cc'ing Luc
>>
>> On 25/9/26 12:07, Jonathan Gilbert wrote:
>>> After each register write handled by cprman_write, function update_mux
>>> checks each of the clocks to see whether the supplied register index
>>> applies to it, calling clock_mux_update if so. Each clock has two
>>> registers, so it needs to check the base cm_offset for CM_CTL and then
>>> the next slot for CM_DIV. But, it was checking for cm_offset plus 4, as
>>> though it were a byte offset when it's a logical index.
>>>
> 
> Fixes: 7281362484a ("hw/misc/bcm2835_cprman: clock mux skeleton 
> implementation")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
>>> Signed-off-by: Jonathan Gilbert <logic@deltaq.org>
>>> ---
>>>   hw/misc/bcm2835_cprman.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)

Trivial fix so patch queued, thanks.

