Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49145C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 13:23:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgjIC-000743-Uv; Mon, 06 Jul 2026 09:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgjI3-00071W-PH
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 09:23:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgjI2-0007kS-9n
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 09:23:15 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxDjw238262
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 13:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l1Vypo44nuoRmMbGeAqxoVIXpWzcYN9VIKeAKT/VOA8=; b=olQhxO8jWfyHYwcX
 srKflWX+RKAKB3C8OiSR+DN35bgay62AKpZD6THeOkF9mhsHe4F4NIVwhLFOnI1R
 bQ7v6FSBeKPoHJc08fP2ppDTBCyC+sYbbZ+52qPh1EZ4Ryuujhv+XwKcQL07Rc9L
 ZuZn2BoDz7ZJW7D7SJGN+ELXHjRzPhIzAEhlOnufwBNKhV4HNjaau2KFTodXTMJN
 honzxe74qzqVLzVPf8dOnvD+ZuMcOBcUm5E5AhTNsbuGZwt7QTCnldQIRj6/08hp
 DoiOC2B2WioVW/wAgR40O88lYgaaQM/3fsQNilJp6PHjBflSCgUQcoSFGs4a8QwW
 fgFF3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t895bg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 13:23:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e4f27f49bso242147485a.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783344192; x=1783948992; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l1Vypo44nuoRmMbGeAqxoVIXpWzcYN9VIKeAKT/VOA8=;
 b=YavPdKUN8Duw/MYYqn5Jb2VV6ThiE0QjZ65iZk3yFMNHs3HXNHQZ6LMI8vNOGhrIq1
 pi1EUrchTelsjPzu5REMJNJ0kFjCfk/xJQ7futq7/k6WoWM7W6RqeSyMjV92ND5uG90Y
 epIflZnXEVMrUR/zZNDCS9Mj01LhWdQ5vV9TDb33vyI7ME/Xzb0EAlsBPud5t+puew6W
 9vAbICniY9A4ifLM4REmjgAGpwePc4/aV3K7lhqJ4mTSPQeJhfVBZejxfUqg0F0S2FQK
 m1JophJERYo9boxg3XSWd5oxS9vi67J7Da+r2mCah3l6KhN6iCQqT+4WwO3+1Kvuz0UK
 aazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344192; x=1783948992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l1Vypo44nuoRmMbGeAqxoVIXpWzcYN9VIKeAKT/VOA8=;
 b=Zecutnzl40zojnaTJ60cbqbPAPdt3B1ZWOtb9Nf0poMb6TaaQFdpJx8Tg0SVyHVVsM
 4JOCCFMAAW60s8qQ+ZWNaxnEskcdbCrERenAQ6Pd9wrkjHJTWHLSys08HLXY/74SeA/U
 SNhmNXxoAhLiYQBCEYUtpuBJAfZzei4vE/CpqITav8D9zVvBDzvRs+MMDXYnMvpT9kqo
 kLPpGZMEYpPooakQj8jH0QPO1MkPiuFkFmA7olA7Lr09M7ziN6M4UnPx8j1OAfhz6or3
 EeSNfdJsZHGjU3v9cwVsuy79/kMOTLTm+MOd+2gD0POeK88dsl8JU0zDcj1g9CKFSyq4
 frug==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrva6fKYIs79YtxmPDGB5MrUA7qVV31jYrXJjm2ACGa0UE/MsKi4g06vrRXA8KRQpsCttJoL2WooQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSX+BVALD64QwLEZiskdVK4YSqyHdoyUZvG3KT07vUFwn0xhIo
 ESh42YokFlB5dc2b4k4L+Jdm+UNh3KHLW0hO5SvjisHPxqzkpubm8MulrbSWTK0FCu2wljqUO3o
 JB6/UwRbs5PHXNm3xQpD0D1DAhO+0Z2xws/8QW3Vwxs8Ffm/tht7sW5o=
X-Gm-Gg: AfdE7cmU+f5MB+VaF/m7WLKDB/bDwIsouMy3HcnmrGC5nJ+Y6LTnR9ESFQDlem7KrGv
 FI79l471TOvpXzQB0SCPGHYU8PQO5R+J+WIWfM5qYKfms1vWW5lE0VoDeJeGg24Tw5Q+ynnvOy7
 N7mnmpJCBs4S8uf/nXGEvmQtLYu9nS0U/tdlBbg8lDhEEuRRLkGLP9SLVp3bH+HPfFVDFL2OCJ0
 672v1NMDdfw1x3hyrDbXUDRBf0JsTSkbbeexq7A8SBDyI3aWSj1ARsof/OpsrRaXpW8KOPaVtep
 rmHfJUGke5pEMyYKLmNVw4ThKBqwHpSkGdBlTwn1CjQn8ivF1rw7G+u+35CKHD0e6WysTw3hNck
 S5bvvA3791twxojm1Ab2xmz5KMZWOb569mlfYBctsNULZXQRqMw==
X-Received: by 2002:a05:620a:178c:b0:92b:6805:91a5 with SMTP id
 af79cd13be357-92ebb5af395mr74258685a.61.1783344191690; 
 Mon, 06 Jul 2026 06:23:11 -0700 (PDT)
X-Received: by 2002:a05:620a:178c:b0:92b:6805:91a5 with SMTP id
 af79cd13be357-92ebb5af395mr74240385a.61.1783344189497; 
 Mon, 06 Jul 2026 06:23:09 -0700 (PDT)
Received: from [10.237.61.207] (1.171.88.92.rev.sfr.net. [92.88.171.1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c636ea60sm328344375e9.3.2026.07.06.06.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 06:23:08 -0700 (PDT)
Message-ID: <df5c8b9f-26e2-4286-87f3-8f45288f247e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hw/net/can/flexcan: Wire clock control module via
 link property
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Matyas Bobek <matyas.bobek@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20260702184038.178196-1-shentey@gmail.com>
 <20260702184038.178196-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702184038.178196-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfXyibN5PiSPe8L
 wNBOR9BkW9uBKNdBnd3GmCaDNSMs6fH1HXs3HmYipbEMM7HS6G65VTnPXNydz690wdTUeUZ9gLr
 Y3witjjfIznJOZHt2yEC9HkLRcjf86I=
X-Proofpoint-GUID: Hzoo9Bb4GROwl27Ujn-c7J524xlwBvIR
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bac40 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PLEY+c9/kVlxBKEpvFYBUQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=3vsBvid6nmlQ9tsTqnQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Hzoo9Bb4GROwl27Ujn-c7J524xlwBvIR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX3UxGh5cmX69i
 K5dboz80JM5BGPjRW1F2BhwSkfNa1fvmMqGuUvbLo4pmPstg9Et64XAfsCLGUfUXRtPsWBx+Cbi
 iTZy/Eh+khy6Qj06izyRQE0/JIUxz5cgZYPAwjYOyI9qun/gfLZTDh57/1/E22xtsAPFQqySxl7
 P/gzGXeSjR4/9hR9AwZ8Zf6Pct7lkxBn+/nQH/zGjfXXmhTGobWwIJTBhMPNB/tGbD8OyhWxq4r
 JB7B0+OkgCg6GF2O51FaSZRHRwX+0B6DOzcP/QTAQ6UElcwoo1RzA/OmbYml1S7vw4wxbznHfuA
 RhT1+l5KKajkhszAyXXXKIa7fuWB+APnT3oMnTxVClgEBVssCHs77qXG51KwAZYN2FxxPktucKj
 nKiDL4/Vr4kS8nCJxJ0d3QT8ypXXmtQ0gyOvQrBLmazFYXR/VMzSDwHzDUBppZTrGAcEb5GZajp
 tlzJZtLhgqWLUxT226w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060137
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

On 2/7/26 20:40, Bernhard Beschow wrote:
> When wiring struct FlexcanState to the clock control module, it is
> currently necessary to reach into its private data. Moreover, when
> forgetting to wire the clock control module, QEMU will crash after the
> guest has already started. Fix both by letting struct FlexcanState
> expose a link property whose sanity is checked at realize time.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/fsl-imx6.c    |  3 ++-
>   hw/net/can/flexcan.c | 10 ++++++++--
>   2 files changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

