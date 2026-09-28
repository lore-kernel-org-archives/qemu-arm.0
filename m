Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C52CC9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:37:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7n4-0000nL-MH; Mon, 28 Sep 2026 05:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7n1-0000mj-0g
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:36:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7mz-0006iK-HB
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:36:50 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9M9xC1195737
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e3GJaHvbPfdbWTxm2g2TFWM8bLvxrqRTzgqwEV6l5bw=; b=Be8v1CZLUK5kxP4Q
 opTmxoTyfvwAicLydQrHZOHHOeIltwDq29YrtdiUT7GjrAjAnRU6rE7KUC/MAL3l
 NqSrYG78EJQhopMsIsm3asiJ5NuaO86APiIir5GvIQOB6uVMI32KXG36munMgIaE
 Lv+cNfNxqZf7QBDKscasXbBfGv0jhcbdpeF+GZDt31a2oHqdnYFfghFOepz0QDRU
 iLHY+tt0jhDVPut1sfkkh9bVV6UcgPE/0hHwMfFi10fT3BrKtXZY7eYcgd601BUz
 1HZLPBSRu3VYK6pn+WXBGThPrA4VWoqgLv0PSYG9s0bNWdNoh6kNLg5KrFmxghLH
 KqL1ZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s0weu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:36:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93a0b66ecd9so441475585a.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790588207; x=1791193007; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=e3GJaHvbPfdbWTxm2g2TFWM8bLvxrqRTzgqwEV6l5bw=;
 b=ePLm5NEupPZMp71l9c476rCNLa0qzIJKyFYEG8Pqdy03nooBLcqmOXE5PObTByyvIJ
 XEmj4LyUveREzt3mWN0Cn+ZGqyb0q4hvUzMBHto/0k/PI+V4PN3mpwJPSUlkod0pphgN
 9WKvGXl2HBJKCwVo8hCcqEppQjFbqOLBmKyfiFLDlwjeTPoFqYJMOL2zllLdRZ1yTAxd
 0gHea5hNmqXxezVISIKqpiBYftppuzzA2Asv8zk2t2heEsCqgWdpqjAgWZ32+9fPcBkq
 U7amVvrMMTzL9AJjz+BosXiNm0OgawSlHaH0Z3Xi+6zOkjcoFhfvHUS2O8LB38h9l+ez
 WTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790588207; x=1791193007;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e3GJaHvbPfdbWTxm2g2TFWM8bLvxrqRTzgqwEV6l5bw=;
 b=hQtVg/DzGgjTp/WL9kqfLycZVgeo8Zop+lXZ9s7ealR9oKFTIuVB3wi5TXAR5WvrPe
 3OUsVmoyt4clwKyI9W86Iz3fdenb5ue4bBF9CQSEcsjPd5gIxt231jh1xLKQZkYc8bDr
 j3+cHacVGohCAF8Uh5+s4zxJJN9gkMkh8jqwFVXk+nQlLUaUo+r+807GpDTMreYBMTjG
 WHoTJHHV6aEYJT1IyW2pL7+eVwO3azvPWrAmlNkp484uH72bqI6ige18wVtkI41jYWAx
 Hcn0LIMlciwyiYiZ8uybQB4YEfIv+2kX99woblTZ3rgMn+v3ttyeFfxr1VvPiFfIrOQ/
 Svxg==
X-Gm-Message-State: AFuF++mheAw7zRlBuuX8JkWgX4GNOVDImAyx6lhPLVapzQ2arHZepmFR
 E/whqjEG5P51aETtRYyUpg7iVfYNzuASmcAP/IAMo62w0IyabJtg531QeItk9cXmTPEhUeKP+Yv
 pFKKa6VZbed/578aegL5fyUl/jFhy6gie/YsSKZX1M9psnSKBtmO6qcE=
X-Gm-Gg: AYBFou0VwLm3tuFeUix0dGjmJYOY9Ib///4bb2wFrMLxB0FMxkFrhD5d+1cLVUlza5D
 k9GtLVZl6IaTEEywyCod6UrOJFc5HtTci1MXofY1csKvHdTwoE2+nLrJy/9HZZ5Z2hKyuD555QA
 31FxteiFdw9MCtTZaedAtCy8STmmGJ3QuWgDXCaFDW5fzgSL1uZVLnuMToa5rsOCq6qkrnIY3ie
 9LHLfJh4LkogqR/OED8iniYBMt17EzEvwJaP5knQD38lsjhyTXGb5xtS4MJx7glcYXfN4HlPufj
 2KB6w5rbMyliimO9ohuVRDgHPTpCUOqGOl/vrpRHcC5OdF4VzSmwq6ZrBxaZ/xy3IvKgyzTXZT7
 j6P8zOZk+jKjaam+txxlzm04Lb9H1UMEJZw==
X-Received: by 2002:a05:620a:a182:20b0:93c:5256:1901 with SMTP id
 af79cd13be357-93c52561a3emr1155823985a.39.1790588206990; 
 Mon, 28 Sep 2026 02:36:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a182:20b0:93c:5256:1901 with SMTP id
 af79cd13be357-93c52561a3emr1155821285a.39.1790588206462; 
 Mon, 28 Sep 2026 02:36:46 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a34a76fsm27551023f8f.7.2026.09.28.02.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:36:45 -0700 (PDT)
Message-ID: <7211c0fc-18d8-4bf7-8ca4-6c193f7812ce@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] target/arm: Add PSTATE.UINJ to tbflags
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925215004.456336-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX+FJfBZVg/JuJ
 thJvk+m0KKVu5qAJCZR7ei73dtTP0tkj3jjgJ8DmulCrPtVhRsHHXbwtJNvoS1wwu75AF4lGeO5
 JKSXFRbYKhQz/0eggwIf3ytP92YtjC3hen/8HzqzxKwE6vWc7QP/moLolQHLY7nWXI6TLU9+Lke
 zXf4thLoKP+dPoYpuFpqbx3LyI3y9zZiG+F6ylILwgOPQqIOGy1JtGxOF4639nXf7Z8od3e9ume
 8DSvwQD1cMP6y98VaSvtZ5SgUkfrYFbMgNMzaRZIHHfRjJ42TYsh14Vwhkt7SkkDBY/APMG3kq2
 dPqL/7qL6ZBbvCOytyGB8BtmS2df0YJY6HukOL2JFf4Kf2CMdq7DMGRw5g0n1famC1UQ8W77UBk
 MdevvLngI1hMeo/7OGBMLI+cRHr00+SjqLAnb6e5I9wPXCngyDOZ9z8cM8KSq29U8skzP42Held
 geivuD+4Wbf7CiC6SWA==
X-Proofpoint-ORIG-GUID: yz46JUG_u_9aKa7j3uDcNaCGuMSH3cu2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX5j5OY/oLYjWz
 +yxcPcPQ3B1Ulg+DAx2dK8Rc0TObmJbtJClsZs7jxAlCv9WPN41IPpP+SOL1yAwMuA/kz2xfhHm
 EdNq7ZsUC9kUsZsSdKsH3pDgnHUYlbk=
X-Proofpoint-GUID: yz46JUG_u_9aKa7j3uDcNaCGuMSH3cu2
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba3530 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280038
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

On 25/9/26 23:50, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h               | 1 +
>   target/arm/tcg/translate.h     | 2 ++
>   target/arm/tcg/hflags.c        | 3 +++
>   target/arm/tcg/translate-a64.c | 1 +
>   target/arm/tcg/translate.c     | 1 +
>   5 files changed, 8 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

