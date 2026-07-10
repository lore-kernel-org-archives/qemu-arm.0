Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912C6C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 22:17:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJWX-0002T6-Qy; Fri, 10 Jul 2026 18:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJWN-0002Ht-Ku
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 18:16:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJWK-00045P-IZ
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 18:16:35 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3KeR1622747
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 22:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8wQxZGyVH8pSSCrOcjhaecBK09igt7ZZxB02nS7Lm2c=; b=Fpua+oy+S43riO+i
 K90ZtqpCIE1ItmqqMBKWzogo0sw1TWRoypvYH72zt2MbCMCAwDCBjxLAxER9/2px
 ZRUwSbpDpT4EcaUa58E1d1sQBiI9th+PACN9UXbJHC0++UvQWEuZ93n3Pmh7wmGM
 p2Cn3gZX4Le7FrxVTxpU9XabweF8gBrHMYUTXmSEZ6RVJ+AMaFd5ZRdv3lLX89Wk
 0xlfIeLfpKWGOH5fh+nZn8WOWhyzW0Bc5EBKqCA4657pUoVJB9XzbEOp2x4Pr5mL
 a7Sb9AVxEpTfnn4eAFuvd/y4O/kE+noFYNg97O4ydo3WYQzi/veLyBvBjqbgDRnW
 ADI0OQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb4rm8xq8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 22:16:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso25185201cf.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783721790; x=1784326590; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8wQxZGyVH8pSSCrOcjhaecBK09igt7ZZxB02nS7Lm2c=;
 b=fKEDBq7M1g0rS48v5z21+5Xr6mJfHRKMZx2W/hLd+n8we8dQAu5HoRKI5E5bQecJOI
 /29VWr5mkY+vIFiWFldEURmiGyPIthQQNy4CCHiM2doqYAaPbmnVGYoOL88LZqdTMoTD
 ZRUfKRKqUr0US3K6wUxasEjhjE9UJ6sZTcqdTh/ODIWkhUp6YmLdsf5AA74k8yF0hjBb
 lVY1MBxEzV87abKyf9YvqWNfIltK7fvPyixRsAhXmoddDHI1Jb+2BQrUgxBaoQL6xVtX
 X8QPYgR/vSW3JXVCCkUhf3ehqWuViURcZ16Rppf+QFg3RtEFmUt/soPS5VO17tHtgCo0
 DS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783721790; x=1784326590;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8wQxZGyVH8pSSCrOcjhaecBK09igt7ZZxB02nS7Lm2c=;
 b=DjQ1tzXCrEjlP/iCD8PKd4LfScsPaGwGKP9DKdK8MY2O0WA7xmYfGtSmwb2BXK/i7W
 +4uBq5UYrR+YC2nMUEEyOnXU35CbS2G4siOS/UW7qIjAjg1NJ3Q/mKEHvMUwjwaoqd1R
 BfzdwqM+tAPt8UR7zOQL4LRcQpo7PiJa6dQ+bQqTX1sBKQ1ZdDTLEnSdWZWoIJY9Y0ec
 gntscnVZAXkNqyQgE4mfEvdXXG0KGGNKZvMuQtzhLIRtuR++hB7jgSalFOegqT40D4gb
 +qiDY+omW0+hXhdVmXBqUMaYRM5wzsS7SUwC74JWgax006NC4qH48D47BibR3lNCjFYt
 Lwuw==
X-Gm-Message-State: AOJu0YxSgNpHlCkqKBYnoZeiOjn832DHZN0AwvuIU8OWZ99aiHChlyY8
 ZxUwbE2n9VL/aowxHcQx8FcoTg/LFcRL2kUVlqRS9wRQW1abD4YCsXmjuAT05XsnHATt0twFqBU
 Qq5ezbO4eRzjuV07JsVqkdvxsyidx/hw8BoQDO2VKlRXIsNzrHYuKK08=
X-Gm-Gg: AfdE7clE5H+d1xFwTSGTlzQ0xRxp7v35LU26wD/P1lcnMeS5YkQcg7cH/G4SQfrOuuX
 vRJ3/N7RlSelDfYuZ4ES6VmzbiYqpYKNLc5rYRQB3g6BWmNmj470egblMGuF1NtBp8xQ3owVwmF
 9riTKEtIOPwMWZXP4pcxZabtKxz1jKefn0tPTvznLOVqELyRejX6irud3XWUYDC8gvINw3R7S2k
 IzCHmB3v3rUdauWH96ijDYTFRR2+TOZmnhuKihe6NEtKe169hndhiPlLKPipM7exGVnfuupelAI
 99AUzcJ25cd1fprCCo2KE3lzS7IHx/7etWOgsFB99BEzimQNsVy9jP0WjJ8WUYX2BF6kZVEh/Oi
 IZIXpxjvB7sSh3WmOBXrJ5EZpWeSvWMyvi0Yzx6C83ppTsCDPRvId0QvIqxHdSA==
X-Received: by 2002:a05:622a:8c3:b0:51c:a9a:b0ed with SMTP id
 d75a77b69052e-51cbf162888mr8719721cf.26.1783721790147; 
 Fri, 10 Jul 2026 15:16:30 -0700 (PDT)
X-Received: by 2002:a05:622a:8c3:b0:51c:a9a:b0ed with SMTP id
 d75a77b69052e-51cbf162888mr8719361cf.26.1783721789717; 
 Fri, 10 Jul 2026 15:16:29 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa09608d4sm64708519f8f.25.2026.07.10.15.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:16:29 -0700 (PDT)
Message-ID: <4e32a317-ffe7-42c5-b40f-96cb6b2ffbed@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 46/51] accel/tcg: Drop stale assert for vaddr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TS-DLKOa6Ln3IHp-dUWMtWA2nEq7If9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMyBTYWx0ZWRfXx9TuUCEFpVJW
 De9ZJ+90irKpk9e0WI9ETKKjbw6xaAmSIYdM2nsAdcNSXG4oGGGFV7aGTeQsZAPrWCYiRFfv0UQ
 P3mF1KQlrYtvMchJC4oJgciho00nsC6vK95Ku/ayoFqIWqe2+mZ69hDBAmo6JcS3A9WPNWcZhdP
 bDQ9AiU4lhDvxRPLe6t8i3vPaGig7Zl9CaNe2bw5voiwMCMwFTQc47Xo9Rv+ATEtoXJJ3gGoAbY
 kiPSD2Q+ygPoPFmkT6rvzvZH88cwXYVZmBNbEvUrb6fAfJ4RDhK4kje04UFnVcBh33rVEXoOPqa
 pqXtwuyf9cVUgCqxaz/cLTwQ4QLLGKQyZ4w083eVKVS40BG8Ff3hnV53j0sE/as0znh51f61x2e
 hCLidoG75hcaoKvoHrmx8FG2d8DGXxPoOXMB/urZlcV+SH1zyZuKJoBm+9ghQOTLvolGDvXVorg
 Rs1SJYp1t943/62uUqg==
X-Authority-Analysis: v=2.4 cv=JIYLdcKb c=1 sm=1 tr=0 ts=6a516f3f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TS-DLKOa6Ln3IHp-dUWMtWA2nEq7If9e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMyBTYWx0ZWRfX+kk2PnY3d3nH
 9A+9yxYH4+hBBhhb7FaU8+8CvtY+Ff/oGe/5b0MvjPovzKQc3+THY5s2DFjVDkbmD+71PKaJXnJ
 l9eZg7BbE1J7A5f6I4U55LNP2QeW0jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100223
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

On 10/7/26 22:53, Richard Henderson wrote:
> We no longer support 32-bit hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

