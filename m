Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF3C56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:52:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws2Fq-0002Nt-7f; Thu, 06 Aug 2026 13:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2Fn-0002N8-2F
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:51:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2Fl-0004ZE-IH
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:51:38 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 676HPKBp2933081
 for <qemu-arm@nongnu.org>; Thu, 6 Aug 2026 17:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2QkwIxdfvmMTri1LtcuMsJFInP2XwNasOjmklKWAhMo=; b=LVXm3KuaQ+iF46EF
 2LSnSXseKbeqC/qNUlGtQGDtZEqWBraDaVRWLiMMbu9rOE+RLXKGS68h1ieLi5dz
 MOo+O3sJYML8AzHPWH49BlIA0FHyX0vHOgx/UHXboc+1IZAzICaBEEWc3HOkFnlI
 oZG5ZPdcEbfyrZlvqySCugkohMwYVDLimeDk4QGVr6iN4IDW2F5gDioGuRHENMaH
 lh6jzZcGPoiJpqH/JfKxdS2xXygAf6NuexadnXEpHlXVn4MiIRuPC8RNIwr5UUfH
 HItvjrAbshgXFVvLIB1bbPReLGHMa/NpEZxGeblXRwzkvCzpMBZ0YfF22HMwcFgl
 pwM8MQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvxner42n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 17:51:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso36545501cf.0
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786038695; x=1786643495; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2QkwIxdfvmMTri1LtcuMsJFInP2XwNasOjmklKWAhMo=;
 b=F69WNi4uuUlPKQ3ztsD7/nbO5GZd9mRFc0Cnfp6WUaE0HIdVZ666Eyu5SpVgNXNoTL
 AR5Hr3Y16EuGcrGqh8EBMMdy+dN+kFBKQr/RnU7jSjk0Kc0XxBxEXe8EFo/wk52onDzO
 xz8tpAbvJUUocIPMkatEIggW35lZ3GNnDPMqN+cWxvqatRlsUFsB53D4fv/Bq0g0otsM
 hLUFzuC5gBZq1bh1uq7O2bgOlUiaewXJ65rAwWrONT8s62TCAR9nJkWfQbh2L+8C2qKv
 6yBc68xEKMYfdEoLbwF5KaApfVtSoAUDx434C1sQ3Wj32LnT7RD1KRa9TzQ194Fc8J2E
 dW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786038695; x=1786643495;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2QkwIxdfvmMTri1LtcuMsJFInP2XwNasOjmklKWAhMo=;
 b=cfVJz/tB1xB6mfQG8yyTIUn5DC3gboUvjEAJP3lQvuWKkr8MVJPCq872nD35csxq3H
 M6ZrzodDrbZZ0F50Bz9TicwPM2bej6djMwYdlXJCwwTiPqcBkJ/KGQ1T+LdiPCgwt4YS
 n9j3+oaXN8fqBWqWTj4JBpWU0ZKphq20sOmKcW+17UZ5DZcsRlpUnZ3061bqoo/0khUk
 5b9ZVsewdbEVbxxOgn7l8swzs8iUhsJn7PPyrGA0YgoBLQ752ZV+qwWtRYbdd96iDQL1
 gBGyZthuOtl+dLXoYJSL27nrGF6Jvm2/rmxwUlOYJ4dIOv1Tm3imr4Y985KAbr+AF5/0
 XlVA==
X-Gm-Message-State: AOJu0YwHdHIACMEyQorpmgLG/v2WD5V/Ah885wAqpU8VZi2pBGNHGB0k
 rtpzJCwouhnQB1wpf2vBG+yHOcW48SYfyp9B53QPw/4zQjmBTQ8m80ydKnc1o629YDcMuUO0hCE
 2xMAFEww1ECwST2ZTq5NOYRWJFcwUHNj4fPQvbhjSD8V6Vmzs0Qcnvks=
X-Gm-Gg: AR+sD12DisNlAD91zXAzAZWoCkP/3gPr4RkRaCx4x7VYXXbe92kPrUg47l2ecqRhB5o
 IN0u/hwGGLYtF/Y8sw511PVocq+BDlont2RU4zyxLlfTlFzEuObd4MwaDwDkmuVV1aJLolZsKfi
 Rrr/ikmTTBvVQNYzlEQEGFNbB5udxPSjC/pVL/g/+XB+HFOtdp7vph4whcgDeDX/XwUX2vyD1aV
 uo4vr+Kj5dWWyUqjcdxHwYfH8BtAzrLHy5SDo9P74V46vjyaOiPESfO5izcOjnegLqtsTMWuy34
 lt3rfWZj0qGnOKsniliiq2qtbKvr2DdVHLeJrkzXtzqjTR7bpLbIw+4UANc4Hgz5KQ53vw3fVrB
 6rgiEuThi30nc2DjkQKiMeV4wUYM6Gp0WLG0=
X-Received: by 2002:ac8:690f:0:b0:51c:ace:de6a with SMTP id
 d75a77b69052e-52d0b0adb1emr44137591cf.18.1786038695188; 
 Thu, 06 Aug 2026 10:51:35 -0700 (PDT)
X-Received: by 2002:ac8:690f:0:b0:51c:ace:de6a with SMTP id
 d75a77b69052e-52d0b0adb1emr44137231cf.18.1786038694820; 
 Thu, 06 Aug 2026 10:51:34 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff7b32487sm7513872f8f.34.2026.08.06.10.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 10:51:34 -0700 (PDT)
Message-ID: <59c0d6d2-b388-4fd3-8b28-9d79d1b96af6@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 19:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] target/arm: Pass aarch64_enabled to
 aarch64_aa32_a57_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260806163939.328201-1-richard.henderson@linaro.org>
 <20260806163939.328201-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260806163939.328201-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7t-pqPN3Rmfx2ZuumkHODII6qdu-wujg
X-Proofpoint-GUID: 7t-pqPN3Rmfx2ZuumkHODII6qdu-wujg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX6txbpKEJYBqG
 8zkLsA9UCVgrSSSazXjzo0SHkFmXUdNZZmRe8XKdKTv1fBGhG7fGBol2BH6kaGBrxpB1fwKF10p
 lv7yJHFba95vslZxGmaDcdgONA0mUZYDs9IP6UHpiIuzh2wm8Nc5FVTs/LCSsX38syVVXIwLZGQ
 lE0AhRu7gTBNY+goddPL5HLwsMyQvdgujKOihD1RsaUuZf+K/rS+PLHY6dJnybps+ufY4csETDp
 VTgmyWUy/gzPTKwu+C3ApTFnLWmdtLddh6rwwMWOKEx466nDZ6rR5OwH5pzkfo3ofYaa4yXBw37
 myEOhQcr4OREl80quGt8Z0aUoLVr8guH3w04jghy9RQm/L9+V+VXaGJDC98EKm9Kq8HLEVal6tc
 SpxsUoMhyFsEx9RBRA/Fk4kqCti2otWINDnH2P3hmBSwo2rJyOAeowKvqEtMmknmpGA9xTHTCqT
 eqTnFW15N5IjS++0AXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX48oXe6QxcLMI
 MynSWNxtHtwD2vhGYbprYVpWOjczy0SE6EBvQPF+Xqsc5q9kk5bLMHvw3bR3CEiLiQBtXEWQ9oh
 BHPA3INLGGG3t8pF/CuvUwvK7eQhT0w=
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a74c9a7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060140
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

On 6/8/26 18:39, Richard Henderson wrote:
> Invert aa32_only argument to what is actually used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   target/arm/cpu-max.c   | 5 ++---
>   target/arm/cpu64.c     | 2 +-
>   3 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

