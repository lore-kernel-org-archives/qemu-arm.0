Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8AAC5AD5A
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 15:38:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvGSO-0008BF-FR; Sat, 15 Aug 2026 11:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvGSN-0008Au-Iq
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 11:37:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvGSJ-0000Le-EU
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 11:37:58 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67FDMdNE484453
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 15:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H67gko6hcC1wtnh5zC0HpSHCRI4xOUOGy0u2azjsDhQ=; b=XWFZkjMEIHw6wvuz
 PwvpLeNwvpvxR0rxgTygSHTvkYJWap4vm4Jo9hW4LatmbfsNnWeU/fKdY4kAw9wE
 wiCOMfWVgvxGEciDjfup8SaIFOxchKvwG/mTJlxE2NnZYW+oYedLYYTHVP1++MSf
 dHEyLWEmNZtRoOsGdE+zrV7ynn6yMz3JetfOVRQVVZX1NYxk9Ngul0FwSFQBh4S0
 2YqiEuXY32DNVoZI2BnP+Kj1T5G6MEdjXKfO+T7vlGKAWpo147zUENXd4mWeIVni
 jeC4fmtFI8vvenHxh58GIt9cxmRMew1BMD0UxqS5DAq3FSMWeCNKPclXSzz2niEz
 xto1+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk1apv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 15:37:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9368f2b7b2bso201507885a.0
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 08:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786808272; x=1787413072; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=H67gko6hcC1wtnh5zC0HpSHCRI4xOUOGy0u2azjsDhQ=;
 b=NQfUofpFgxFzXfP/nl2oXHI+ENN24BvFgXCckpTeoqRF6YJTBJB865re8SsgPLPBMw
 lZFeyipca/toH7/FxfsCmXIXHwf4dT/n2oE+1m1L4kymO9j4YklooXbN8LZMdUeudvVd
 c4UOQKhD3t6WxnP9KbXjo/VTxEdzwqAyUBYIiugC9qS+cdanze7pHHwix3Z44dOkn1xG
 VaqOPZqqAQ4ipkUyprDGhCxOIG0OBc7SpqNW7kxBb3VllV6aEI187SaJ8SRVyh6oJn/A
 B7Iht4A8Hut5sitUMjE8VPf29F5B1lVnzNUkn9ZZogTPPW/pi28xfu/Rx2G0Mj+BFESy
 paLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786808272; x=1787413072;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H67gko6hcC1wtnh5zC0HpSHCRI4xOUOGy0u2azjsDhQ=;
 b=HgQse8yEpf8VRJ0Je0eYWm2LPzvh+P07ZMp6/7iZuITlB4rkmK//TLgCbKxmvbjvVo
 ocrh+6vRnrTiaRDVCtWfAyDXdCJrbyDGrq8ukdiFakd0cdUk54uhqSvaIbmOL8T6UmXJ
 ZVOgxrxgLYvSKrRBsHSDoSSE4MJ6iEIwvS8T/Cps78A8DdjiNuzzS9PYbMcLk3TcUHrF
 uJ2Slvl9D/ohVO0bnlGqYtiU5eeATBNCTZ5UeOJWUU1/ZhtVVYHAJ9d6MJWbTweZatL4
 N7qsDD+pLeB0eE9EDr13+JnNWAktbrVpTPPS3Ud0cBSvFmx7VTsTB1fJfy7dD09Oi46H
 EdxQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqhjPvTTlTew+O07XORSi7sdL+ES2b8jTEqnq7pMwRZKU4nxEBSIk9BRw0TpJj7kfxjqQe8XErQgg==@nongnu.org
X-Gm-Message-State: AOJu0Yy4z9IGf15k+vp1sypWB2o/mHdXqapp18AO/W+5b6dJUMxMHi7G
 m5ZI6LHRsk8s9hxdvz5sDk9Og+MshMIhxfRJNBnzdzBtSgU7LQmQbekp568MYNukgQsGwg0ue0n
 HLay7SAtZbTw9EgjKWccATu/Hirb99AXWFeQZQ9fG6+GuZUvcSKAeD6M=
X-Gm-Gg: AR+sD12SOch7jdUWbtHStVBu53UmQsMWZyYaqB7PAPRgCNcku5jI2ydJRtRn+LmrG0i
 /QTNtve3Uld2VeUf2k7mv1Ds1BxVlWySEKUASqkYlpyswOdmEVbMtGItjEIgwaTnXQ7DGr9w3FY
 S6Q+dXui8AC2y6H/m9MxoR6MU97z7yLpU7ktMpn3Nda2MZ+Y4bCsT1R9S4EMYh7qf3B+59JAg94
 lJ3C8Pc3U+KRR73/WsiyAHXeyt/To5LzS1ZXroNMZAtsJbEpZyxfIK48pyMEYhRCMtcfHFz2SqW
 PY1meX6T7aD7Hucs+Oryl9QoxZCWWiCbr6y49Qmgmfa4tu+JVTfe1wCjO0qp/cAt/o5dXFjJSyP
 umm+CwQ76WV/6SlEtHeodVdCVnicwKsHEiuc=
X-Received: by 2002:a05:622a:15c9:b0:51c:2190:3b56 with SMTP id
 d75a77b69052e-52d854c6750mr110678181cf.21.1786808272249; 
 Sat, 15 Aug 2026 08:37:52 -0700 (PDT)
X-Received: by 2002:a05:622a:15c9:b0:51c:2190:3b56 with SMTP id
 d75a77b69052e-52d854c6750mr110677781cf.21.1786808271831; 
 Sat, 15 Aug 2026 08:37:51 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c129dsm17454773f8f.26.2026.08.15.08.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2026 08:37:51 -0700 (PDT)
Message-ID: <a5315ff3-6739-47ee-ab4a-5b0de2d68d8e@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 17:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Restrict arm_do_plugin_vcpu_discon_cb() to TCG
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260814080507.23196-1-philmd@oss.qualcomm.com>
 <CAFEAcA9mO7R7ujwiv3CXOKqcVwtU3KoJ-i=EkawaGLUYUmvhqA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA9mO7R7ujwiv3CXOKqcVwtU3KoJ-i=EkawaGLUYUmvhqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDExNCBTYWx0ZWRfX8RQLq5r/GD1q
 Z4/Z5umxdmcJ8QEodY5rlu+N2Nm435BSNncSQm/9745n93afjH/WU91d7TFo+Jt47Rc6mjXpefW
 zVtRQe+B925UyEo4OPfpDtlAqTxA5/0=
X-Proofpoint-GUID: TVE_oQ32MKQFxlOM0Jbb_xwyg1SsnZFa
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a8087d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=P-4y4W9ic2ih3s_r210A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDExNCBTYWx0ZWRfX2LRMJjVBjcof
 tqDkLxQvmNSelirz5sc+rr5MRIJoVtezzmGWCWfVaO0xehzwArJMu5n60AHfUKsBW698h9e7a8O
 Z8Wv2UH+XNWC+jbgfu8UTx6oKijIWMV8m1JATPuADg8cDXsF8bjvqfrCUCkR0nQVdXkoQPT15Hu
 yZ87DoEGfEO4vP3O7FX5kP3Vq2GVO30Sx/z/IOHYXO5K5P2Kcm+2MKNeiOAK5TM3fcylnKcRJZI
 4GWsr1xgkO5r+vRY+gG7Ndt2CETx/nHheDrBkDq6Bu+9CLa+L3OsbxWSkXmapLbZASk4f327W2J
 K/dO9VgT/i9/ItWArC0RfIP0oFp1IDXiQ+dtD3+iRw2VQTMHYha01ZXEEq6a7gjmkyAkxRt0YqL
 aye1cp/WRtAUKUh2x+BPnLhrDJbXC518jnhMlqCINN2SKNThDFaw+mDQgKlqSiCgfQUtWfs/26M
 n9USXI3ZU7uFpST7OJQ==
X-Proofpoint-ORIG-GUID: TVE_oQ32MKQFxlOM0Jbb_xwyg1SsnZFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150114
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

On 15/8/26 17:08, Peter Maydell wrote:
> On Fri, 14 Aug 2026 at 09:05, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> So far TCG plugins can only be used when TCG is available.
>> Move the arm_do_plugin_vcpu_discon_cb() call within the
>> 'if tcg_enabled' block and wrap the definition with #ifdef'ry.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
> Applied to target-arm.next, thanks.
> 
> Does this fix any user-facing issue, or is it just something
> we need to sort out for hybrid acceleration ?

Not an user-facing issue so far, but will emerge soon (the
hybrid-accel series is too big and hard to split, I am trying to
split unasorted cleanups of to reduce its size).

