Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A7CCD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:36:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXIAO-0003Cl-6o; Wed, 10 Jun 2026 08:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXEZs-00066W-Qt
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 04:46:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXEZr-0008PF-Bo
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 04:46:24 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65A7iYGH867677
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 08:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G32jXP+OcOCvuuXj0JA9LkCxKVwkm8jDLsB2sJ6kKQc=; b=EmWjyYLkv2wnN8yz
 CVcn3L/HZdCZPjEwTAgN1/4MQTB0OfOlpGF1LWlCcmYFrplanWmLVPPPzp2wthmR
 +BbOKz0210HoVBR5Q/5rWw5b67bfA3RZI3p59/0AK3Viw6joSp3zLrtMuxYfpsje
 a9Ak6oEnH7IdQQ0Ayu0TdEGGyvC+JtuP0RkGVN8mcFzpQ1R8QA/sBgn+AsDMBEZr
 2wg88/EESlGL2hLebK2OUAKTWoEsYg2i0M/MIwP9OJw4nce9Kl74QWVxWPKtEnKM
 qhxdqLIKIWtIQ60l4iMDvPB0aKNQ6JYGps0+4foua7rartat+hQIvLH1DyV9/NTv
 QQJLzA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8yfw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 08:46:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5175a1e32e3so176629121cf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781081181; x=1781685981; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G32jXP+OcOCvuuXj0JA9LkCxKVwkm8jDLsB2sJ6kKQc=;
 b=fOe4OEIH4PQchc/0pf5fM51PC/rCbboChczqRtlRLdPiwVqLUIASy7hzWCo0qDarW+
 53152qv9saBwJSCZOT2amQwTrIFX7zoM5cN/mLsyQy7VjO3lVhAVFAd4vQgqmjtThzvd
 WHiVVq0Hk5cE5WRcFEtIUpylxcv2MTAl5OOL/87wM9lQhWYX3AM6HKVAGq54BlUCyQrj
 7Hdf7kvhnwcxzxBOwsTaxiYBtFr5/fQnp2ZOrOwVX7Sbv/1tpJmd0CIJk3nqrKJYE/U8
 0KFSl60PWZWjjHoaKkLF0Kzko1z+Y9cI087NpfwrwpKZyS9C2QMYp/KccSOWrA48pDiF
 AMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781081181; x=1781685981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G32jXP+OcOCvuuXj0JA9LkCxKVwkm8jDLsB2sJ6kKQc=;
 b=YUcwIWrp/KHlrQ3UUnUY1Fwl6hmPiIkYNrO8clpfZ1AByYCGtPoo37Cu9kaerTXL0k
 6vKTyjtf02Hkm/mmP5sxKxfaqm3WYDqNL4gAE8aFPU39PeV45gD3UALPHqW0kwsfG56X
 n7dX6RbEf60GJbAcD99VyefZVPL07QzAVONlvXCw/04gJLCaIj4Y0PfnKwQ3mlAPVfVp
 LvkPCKyLioXtgud0czIcbDTc9JzIPel6QR4EWdMHsrFY9lbxAECTBwSZ90PAdtgzP+Cz
 Rhinz+Eh9Qm3Uzt/1oMMAkM/E1L4VH+LNVXi9JnDKMy5waT+Bq+K2kmOyg+BrbkQa6f3
 Cn7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tmdUU9DRILd7KRnmFmqBrrfHgSTdFl5CMqnjJL/5G6QsBoxbo+4G4VJOJpNtiRciGUrUeCiIqrQ==@nongnu.org
X-Gm-Message-State: AOJu0YwVzPqhdwg9mRZFQN5RIXIP9o5D8BQR9g4C2ch/qsp3mdr2rEMk
 hb9kHj3xjEYtbt63voMGFZXlhO1Qxk/nw/MlVgbmoJRh13O3JpJWX4vbt7pURAoIo1xBLUDFtqk
 PlVhHffc2hpNmz0TjiP6q93EAppsutM3krxYhjVj1n6gioBcXeWBcbQY=
X-Gm-Gg: Acq92OEr4d1o2slrAdazlmu+5VpBgDxpNlNfs2tShtN5l/zTAob29IxpDcuXI+EqcLY
 DtpW2+ahBmaHodY68OIlWpERDa+8HYzfU6BhkrfBYyW+vykj8ICNjR8V1kq9ToReelu7J7e58mF
 PfVb1+4LxyYzluN6Gyf1WswZH4EE/+tHGeRN/s6AxCox4sk0WQTAS9T8OUM3ZjDatMr7zTFzyPC
 +S5556dEyQvClEwppk0f6ZgHAsEFIPR8mkW76IHkue05ueTtKLv8TQCle5rFbZ7yGrPUcKRFUyD
 +hZu4NOyu1ZKwt/jJ8xAmJRKUJamjdso0oTxVBqnJWsi6Z+b8raG67Qq/DZq2YtCqAgJmh6LRzM
 zZbhWzGJUer/wsm0dNGrU38wjHZutV6WNeMQBZZonamlsRyJrLwnggmy9/LuAOnoVFUeylR5oHA
 ==
X-Received: by 2002:ac8:5a0b:0:b0:517:706f:9923 with SMTP id
 d75a77b69052e-51795b727b6mr336644311cf.1.1781081181013; 
 Wed, 10 Jun 2026 01:46:21 -0700 (PDT)
X-Received: by 2002:ac8:5a0b:0:b0:517:706f:9923 with SMTP id
 d75a77b69052e-51795b727b6mr336644041cf.1.1781081180667; 
 Wed, 10 Jun 2026 01:46:20 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0559f1f97sm1182162466b.60.2026.06.10.01.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 01:46:19 -0700 (PDT)
Message-ID: <716e6fe1-d806-4637-93d4-1dcf8e546f12@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/27] tests/tcg/meson.build: introduce qemu_args
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-9-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-9-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a29245d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VxAk22fqlfwA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _Gm0ZNU7FSlnV1MZmfdWitUQZnZYQp17
X-Proofpoint-ORIG-GUID: _Gm0ZNU7FSlnV1MZmfdWitUQZnZYQp17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MiBTYWx0ZWRfX4cK6d7xllDfr
 OAdsju+5QAFKsRkh1jisEmLtVOPcqK/wjCFGFrt7QCcyRcBRW5sytj+jK2j7ifVooQNt9baIns+
 YeGTV9uT1beZdO8/pgnioJxL1WmFHjzWTRsPKST6FHvJ29srMxAhW5ltTdkeP6nvCao3MPbm7uG
 nBrtlV7ricMyDA3F74BBaQb7qrVw4Iguc/xAM+6wmR0hRTaOE37bocz1QKIa9o7bnfI+YKg0Nro
 gHBiCnSEWvhUb6riwrBezwv5df8iLO8cgRdzt31SMuQMQt7U1yivBN2sQy8vN5uREvpu39Tb1ln
 eHQGlPYlk+uKSyB9vpf44LXwiwLPG1WxT344Wi8aMngePUb0fWcG9KFuLJCN2F8hIwxZHfecQiZ
 H/2rewTKtZpHYqmWqPgX6/9pehToJbk+2rTWFCSU2G5MZc+eARxdpNF8tQD5AW+5kEZJeQH52Bx
 G/KsSjiGETMdhPzO+HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100082
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
X-Mailman-Approved-At: Wed, 10 Jun 2026 08:36:17 -0400
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

On 9/6/26 23:47, Pierrick Bouvier wrote:
> We add possibility to use custom arguments when calling qemu for a test.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   tests/tcg/meson.build | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

