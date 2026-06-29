Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610C4C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weDPu-0005I2-F8; Mon, 29 Jun 2026 10:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weDPs-0005Eo-Vj
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:56:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weDPr-0007za-Ek
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:56:56 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TASpNw2601074
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 14:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CiH2B0nlKPSBnM3F1KubX/khe5K9fUlYQTsI9uqO43I=; b=DOEUce4a0uwyi10K
 1rX6DsIw9w2wr4MTOtiAkwQ28F0FL/2Bax3a66k5eSd4G+2F/xeqpOJb/dNP8QKf
 bfjhsTK5i5z5yBxsLAm3VtvV+8PDH3gMuvLu1He9Wa+0TJnH8iKe4cL8xWyuRTqS
 pZm8w9VD8fZH70C8Qv0bld0VB3ERaMfLJRHTylLyX64Cf/LZk0ibWf4401MdsFdm
 Y5ukF7fKQwT31qPiEskd38zeYGIJOYfIh2ncQReuB7U6DHwtfYfE4oiZ9faEM2aB
 YKrycEDeLzAVvibc2H4wtO7+Ivi6pE/d3yVStuCRVf9DTulvBI1Y5Se0jggzE52u
 TgmIAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw9ee6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 14:56:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92a62578049so553929685a.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782745013; x=1783349813; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CiH2B0nlKPSBnM3F1KubX/khe5K9fUlYQTsI9uqO43I=;
 b=jx1pyIjF4P94In4ws2+tMMACJCEUTL7EpU9/PdAjup/swY5gGpxkhmPYwZIIC3KoZE
 t087Q6zoCSdGyvDy+/PI0jEROWA9tLFlzUhPrREbnPTErnHJ7m/k1xaEknhNmJh1B9cw
 EEYOrhcQiL1TN1nwOmjagcBeQmpOZ0fDEkyjcbxWI96yi1ZcUdEmYTptgxE4Cf0tOYBu
 t00QpogmfUwu6wdp5t/6xeI6WSva6KhsDAsrH/AbQ0RG+e2uzTqPtr0CLGRs27Cew1cB
 znBOA22DpFxC7L494Np4SaUvWTuQItgtV/s85lj62Yx75qO0bd2WS+sbjUYOTCa33tBa
 TlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782745013; x=1783349813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CiH2B0nlKPSBnM3F1KubX/khe5K9fUlYQTsI9uqO43I=;
 b=YvbreLx8gbmJtbBTo77UbG0+ZMr6Hvnn37F1M7nhIkF41o2QcgbOxn9Gq8cRNQdIkB
 TEdNRxooEe2CsLIAgIdoiNqBj5190wBSVkDk6oNMZQGm5MNB7BWeQmrM8WtSFMmGmR1R
 7FMXJJgqiacOia04F3ba4qDdyZ10sIRroNO7mrpRFPz1dbkYWGLnfEdQ2RARtSEkH+fh
 CqtHYAaIEQBdHOL1fJVcAITsHeY0o/jbdGvuVnOcsiOAL5+1LxyE6Emobl911MooAgjm
 UnlQNAOo9mUztM2YsQCuf0lEKgFwdRh06BRelKLOhxacuyYQeM1jmpMcw3zTYFQ/oxIo
 PjkA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8bOxbBpscmAyf2EiK4fGb4pZpj2oYhXACgLtqNRAIvHxgx0L+muj9cqdJpypZwANgIGcVJJjktlw==@nongnu.org
X-Gm-Message-State: AOJu0YzDNZXxVh9hU6QsHt1tWfxKmmrmqXiTwAj2DF2aXTAW6/ZKYqZj
 g8jWQB4Sfhl/h+skK4MKszrEsqyc9EG+ENr9RcmkgTbbz1uldCZcX8ct/t1ExjojdlU10UjlFiE
 etfP/6D8jupeeHERUkWLvAudBcPzZRbMKLOeBOLQ+EkmgAqTVx8Nz8LUw0kDCRmQ=
X-Gm-Gg: AfdE7ckqiJFFKnfmrBbejZUSuZW02Szu5xJ8R1gMw5NLXeGsSvSWm7efQM5cly2kTjK
 Q1pNovWAw56i6HjYym2kp+PsD03VSZ0CvOY195amFVD5fn09/V2UJQRec0FrbgEoVcSlBxufZGn
 K00V+DyKSc8R7haQqj5Xvn/XBF9lVADtztztHzw7ScuK/1UTk8Adv93T0nYcv2pINMbdDNQ15Oi
 GlflGVSxl9kJ5BeSUoCYD5QXMa3AbietzENHuINchzP4vWP6gr6VMRFZV1HeEGhLZXHWKRXfnob
 c9fChptNark787mXsNi+OiuprZM2Rss0wjABPsrkKRtbcbEJh/d3645dlm8XJiykGgHg3Ry8Qsv
 CeRoGntFgOHJw1mjAMAwOGmV+Y5PDh7hlrKiY6Zf8770MOm3ucmslxzEp/31OmA==
X-Received: by 2002:a05:620a:29ca:b0:92e:5b63:224d with SMTP id
 af79cd13be357-92e5b6324fbmr248743785a.26.1782745012633; 
 Mon, 29 Jun 2026 07:56:52 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:92e:5b63:224d with SMTP id
 af79cd13be357-92e5b6324fbmr248738485a.26.1782745012119; 
 Mon, 29 Jun 2026 07:56:52 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4730937e18dsm15028101f8f.21.2026.06.29.07.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:56:51 -0700 (PDT)
Message-ID: <b2eb84d7-b74c-4edf-a4af-df92b4ea2032@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/gpio/pca9552: fix off-by-one in QOM led index
 validation
Content-Language: en-US
To: yujun <yujun@kylinos.cn>, Glenn Miles <milesg@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260629074133.187549-1-yujun@kylinos.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629074133.187549-1-yujun@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyNCBTYWx0ZWRfXyFGX3vhQKsFV
 dmWAw5GQ+8XhRkdsrOw3+ohSH+MvO9gInKKWs2jbcqFCRYIACnaE/ymU0GKB/rJVPCznTnWQP3a
 +one4nQJrCguygIcF/I1mx/dTjVynxY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyNCBTYWx0ZWRfX4uRwhRVZOj7E
 s2GhCTsJ9e56eOSZ8IHZ9fYBtbucjRkqYuq2zM5GlUXqPELo4FK+rtLkeismY8TPCISWMA3tjYD
 6fQscE7lddDSXHnBp3cJ12SN4inb1ijjSicuVE0Ke1LxVKFJi9EQL354EIi7+utZ4mY4mMmUNJK
 z4WZYC80plY+ctEbZt8n1GtquwUXtJJ4P6dt3qUrjA2bTEhwKJDvIO3A5TspGrJlI5vakeotq8u
 d/JUy+Bskap5Y8NhuLBBl3dVO74oiND5ms2ZzAtt4izZw4YXdcS2fL2b38MpAQjhucEcKBuVaz7
 ek4y1DuiGjSQ0/nUWeoANab2HYuR3UqKKr5Ss3C7gdkqueoEZY7UIhNcU34n8wbbe9yRB+ANf75
 RrKgDmZTt+5hFCMuXHsyZJZqg9C8d7SRz6xdVJmloxGDap5w4PgupZ5quCLVl8pRZI8tepycbgv
 IAUODlYbZzxcjh/L+yw==
X-Proofpoint-GUID: atdGhIpPR9YCBEWOhQ-cR2NLqLTqxiLo
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a4287b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6CSop681rr5zcgR6WfsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: atdGhIpPR9YCBEWOhQ-cR2NLqLTqxiLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290124
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

On 29/6/26 09:41, yujun wrote:
> pca955x_get_led() and pca955x_set_led() accept led indices equal to
> pin_count, but valid indices are 0..pin_count-1.  For a 16-pin device,
> led16 passes the current check and then accesses an LS register past
> max_reg.
> 
> Use the same >= pin_count bounds check as pca9554_set_pin() and the
> gpio input handler assert in this file.
> 
> Fixes: a90d8f84674 ("misc/pca9552: Add qom set and get")
> Signed-off-by: yujun <yujun@kylinos.cn>
> ---
>   hw/gpio/pca9552.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)


Queued via hw-misc, thanks!

Phil.

