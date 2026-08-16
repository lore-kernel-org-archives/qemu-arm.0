Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB943C5DF66
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 09:20:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvX27-0007zC-6t; Sun, 16 Aug 2026 05:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX23-0007yG-Od
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:19:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX22-0002Xx-9a
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:19:55 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G71rLk1945754
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0WLiFdEY2G2U983r8gPuwMkxWRCW1NfILks5kWK0wUs=; b=pK5JedONye/tCjhZ
 I8ZNdlx91UPIirz7w0ywy7Ig9FaQoiDMaGkcfhmE1mKyke5WuGQrU0WfqHBL8cxZ
 MYSF2p3OzvwseFqyVn4ay+VXW2hX3sNKpm07B8ivEy2dUuwvIZr3nuNCl6pBmF2E
 1fAtEmYlWsuS8t00XTFmGReknCr+futP9yrLTrDN+/JYe3D7vikO1zGLvzk6CJdQ
 NoTtQpx2a/BwEqVepLeTa+GmHXUTwcxruW6B5lYORlPJzDmfrKichlPmB6940A8E
 ZTQNcGgUqpc6Y8XkdzlmTJPHhyNBX1Cj8DBhV6jN8qF59hMurSdRYrEWcXqoLjOu
 1g3QTw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2h9gk1f4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:19:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52d7b3adda4so24181451cf.3
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871987; x=1787476787; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0WLiFdEY2G2U983r8gPuwMkxWRCW1NfILks5kWK0wUs=;
 b=MYQjRsP6meH1ixJkg6QYnFDUESnaj7mWVXEy65uKOnTKJbi4AEik3cifcxeVFNERUP
 fvChK6Q8s7emLnlrkFdVZrADHw/jeHfGVBCmV12bOGsP+kNhz3zJcZnQZLct1rEDPUSv
 HJOjjdj5dDH9Ax74/7SLUbIBrE7PUznXkEwt7BRqMBHn9llvDzaHd5vmxEkjLrp+3hnY
 5blwwQ7xcP8dNaJnHgZQK2udvESoAQeLHX+cPu+F7TKXjTELNNJ/3LMeUIINoInT1KFE
 fTWGZ3+K06suOgNlH4SR6L/a07SDyfTpmxGZgF06PCzbf4v+nwwN54uWsQuS8YRIKGrz
 wEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871987; x=1787476787;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0WLiFdEY2G2U983r8gPuwMkxWRCW1NfILks5kWK0wUs=;
 b=nlAzWqkTs5H/lCfFG6DYNjbz9HMeVShKstG32ze5NwDvbco/2XnnXUeaSPBHHQtUg7
 db1scyJpzhLrrhIdiKL+WzC5QS3WXqRotRIMrfAs+FChSv5Sq0PRZ/3xjmUFmxZ3m7Ch
 EMSZAQ8OZuy2l4shfr17zzMdU80tgri4u29dDvm1CLQ9LmNtGFg7DD5uBkt0L3CJG2t8
 s96wH8/NxDht6q2dx31lc+DjBXs89gAfsQCGqoJhVWiG62Nox3Uv5/I/4ovy3w7VKcW7
 eT5/rCj1Sz/5ysakkdaDi3JH7DfQBtjIcofcQMPQhiXF7E2hcR0LoDqPTzCwoS9jUlU8
 OYAA==
X-Gm-Message-State: AOJu0YyTEwl0jh+nkpdcTHOOFDbPq3HoqAoXgfV+w4+Tds3z7hXw3tsM
 WyGkM6k4V2evQiPa5ChbAV9+BPbVmD/pB8d88BaGg7I5zrh4GNUELTEdJwzCp1jERjJgKe9/DSP
 lUbIfxxTOC/r7beJdg746JmlPrzMJbyItmCMlzn1q/GxW3rUZaCtAFEk=
X-Gm-Gg: AR+sD12kmSK3Ivy2fXiPTP66902oBNaAI61Zt81eNZ89xVnN/73WEmNVD5H6vvOu0up
 tF94t0igGal15JBtncBN2RjXmDfRR6zmhAaS/wDeznQrYHm6IhDLsZE/Hg29kw7yZ0hxhlzLey2
 jKWjYR5frTo9QB/KgIeicGXaU7tmGJOE80Y7iMdiPVWnoMdxYs3d63Xd/k/euHhU6ljnH6yk2RI
 fg+JaAPo5hdiT4zvKyli2KC3epLH5vQ/iPiPUW4mxK5gGKx1ocrjpSizLSbn0DqogwnnYyNeF1O
 qnYTAQTwPzyExi+JveeHmIRLikDEo5i5GgtRpM5CeamhBkVVCxO1hAp8zZgTX4qrNHz9T8iCp/V
 RrSnLzAhkcRZWmKoe1E8OeHfnKR5Iyxertr4=
X-Received: by 2002:ac8:59cc:0:b0:517:8470:2d2d with SMTP id
 d75a77b69052e-52d85477a33mr185610431cf.29.1786871987403; 
 Sun, 16 Aug 2026 02:19:47 -0700 (PDT)
X-Received: by 2002:ac8:59cc:0:b0:517:8470:2d2d with SMTP id
 d75a77b69052e-52d85477a33mr185610271cf.29.1786871986979; 
 Sun, 16 Aug 2026 02:19:46 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b203cfsm163596095e9.3.2026.08.16.02.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:19:46 -0700 (PDT)
Message-ID: <591ca5d4-1c35-4f54-af97-2269907509df@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/18] accel/tcg: Replace size with first/last in
 probe_access_internal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Nr8AecZ6IQGrS1hmap0GnSffhBEtXH9N
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfXz/7LReJYq914
 DYsfdRyq6yxfWul+WOKE1ULmPPRdv4Zv3tWUNwP6xLffBGqxZgnlnEwjY5eL2CCTCX3NYnRQyK1
 FD5eiQlxMMfh/Kohuu5RFSPvTTdEyTY=
X-Proofpoint-GUID: Nr8AecZ6IQGrS1hmap0GnSffhBEtXH9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX/Uu386EAiiWD
 4yDPiXMvUiUkykbLqh6oGY7qKGTiY+PtNB0n0lBJRH8IKD9Ei/00ufgCrIT6LTJLnOq+E9kjM45
 hXo5mtxEzSQKVDM8X0ENGNiAUdsWc0mB2PYh/zAA5RUJnUZU9u/J020xusWrF/eDeHD6jK66n5y
 neO+aUpKfqLlV4GKGcoeQhXv1XmVGrqs+D1iG+AHMtpCMYYbVWLzXwObtB53/q/saP8g8GNPh7F
 ERkhHwwbEVRRoRqcRZEuUMnQgSah91yr8q9mDEIcWru/k3E+RlfE7Iom5NJ5Sc1QYege4BUX7Rd
 yvSRueMqXthzVLMidMg5k/bEQ0zCujj8KknMIK8G0i1WAxPz2FYG43Um+SHbMqIkRlx7Um7lDb3
 c8AHTIIVM3sCcAPkN1NDY9qB+1uM1WSc3CiUk9NmuGPgQwMCqBBGqGLsxSoxF6Si8iAKF7FwAsy
 BRtXxQpH9ABdsHNLsCQ==
X-Authority-Analysis: v=2.4 cv=XM4AjwhE c=1 sm=1 tr=0 ts=6a8180b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160069
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

On 15/8/26 22:37, Richard Henderson wrote:
> Propagate the API change down one step further within cputlb.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 37 ++++++++++++++++++++-----------------
>   1 file changed, 20 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

