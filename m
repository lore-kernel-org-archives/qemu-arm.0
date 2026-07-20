Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ADBC44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 17:35:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlrtl-0004bY-Cl; Mon, 20 Jul 2026 13:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wlrtj-0004T9-AU
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 13:35:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wlrtd-00021R-Bm
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 13:35:22 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KH6ceA2785419
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 17:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1nJSN/16zpCcBanPqmL4DZU9JKaSYAh1VwTvJrYDWKY=; b=GZ1IhtFHKrNVDPYq
 f0DiCXYgmSDv/W3RMEcughL1l+3OwWBtAmE6PfKmZjr9zGPn5OfSul+Hdbkl1MmO
 RWVH2NWLcFY6CYg8nG+tL+Yp2+pVgG+ErjJdBOzDsPW79MvEOSdHsK92jg3BntXh
 NmEh1NOk60LLn1uj7tBI++lgLtxdbS2s0bFwzB1huXbmx5ueQYkS6/DF4AVgokur
 i/mFny6Q9S9TC2NXpXubJcw9VrsV4+5fHoRXsL/9J8sKJ/K2XRDtmUJNoag5sN9T
 f2rXijnI9gQ6Q5irYPa2wh6gIKD7S10bMrIwxK9oE2/F7DTVe7ESmBiIQhbV4sEC
 89LeAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs528vx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 17:35:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cc73f47bdcso191038445ad.3
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 10:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784568914; x=1785173714; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1nJSN/16zpCcBanPqmL4DZU9JKaSYAh1VwTvJrYDWKY=;
 b=UC4lZG/hysMm0D5lNd6x03g9TvhXasbVCX7sfb/zbigYr/b7RwCprXu3MwnkHp6eKG
 F7syrF9LuGjfvdHgd34Dyvyd6uYLIH8dqWtiQCHgcgczHl4lVjIKvWHDdk7YCGHhgFRg
 DusE2+zuv/w+VlTy2+6+t2cXB+P/l+8WCO0DchkHZXgkGluOZUAFhjaw+OoCqr4n2W8W
 Jx68zWN8SWXf6X1TNcYg8ZzS4p2tsxL/3wwcodYLJwEL6Kaj5ClJajeZ0Jvh4LaDT/yw
 8LyuCrplouBVAxnN80sNJRPMH7fnHY2eG+KJpn7oVtuhWhdCoQfygb8e1KPezD1kWEvM
 jI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784568914; x=1785173714;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1nJSN/16zpCcBanPqmL4DZU9JKaSYAh1VwTvJrYDWKY=;
 b=NMVtSEmzgw6ouMtqVXk15uFI0gkHnbNfnXjUfKPWGWUYUQgAyjPBMZtit1uTN1Uh/z
 r7eKVEbYva46C+baa4+zz4l5W4gb1IMccKfm6SbPQkxBqErQH8uMexjqqjH0qCWIqjyw
 oqbc46JoqfR2u4k4EckypJK/i4rIXoIdBrwTTjmEUX1qbC4aIO1ekpBsxsp9MkrzZJ2u
 4kf0xwVwIwxNoGFgCKjnfVSP2+YcKjRD9h/CSkxPcaiJXo2VNcT+ySEF9u8z3lFqDfML
 7DeEjL28bSmmDzu6Vs0TbdpamPdtgS3+KW4pGQRaPF/0uFSfKHtQUBB+PiFQCImQtCHt
 GIWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqtZZqzhtOXiTJqsvJj0LCFGZ9sT7REIKZYWG1VC8jPI4iSJYL3cS3yyb184Dx90zBo8uwecAX2VA==@nongnu.org
X-Gm-Message-State: AOJu0Yz1ppgKSoKuab3cedjtKolXjAusA4bD/8jhhlMG9agCf5VASWyy
 jjao1dyg3G+T5c5GU5NkejHV1RcgX9q/S04f+mPrO5DWLXkwJLA5bS+ekNzf3oTpfYul/OWUOPt
 V6X5LR9CmH69dlKUiZuvgxNEM35kUZfycjnOmUUG3RICk1SyrKp1Be8k=
X-Gm-Gg: AR+sD1028AS+DkR14AhVRvZWtYKXzId791ZfsifB7DPwJ24hmqTfVkxvr0J3cVdj0Xs
 YONdgq93VcTm6SHa1Nyn7PdSvw7/EsvrmY0hzApsv4N7A0ZRQPwAH5WaH62JwJhakrXe+Aa6g5B
 3NdeKVTnHDN5dbUXGSqs7bqliudsARk69de9e539DW/4p8JudWf802+OascHt8FCpRQ3yan4RYS
 t6WrAmx8kCVofi8Xl4v6BMkfuHIl880Iw1FD5D0sgrCXxu/J1I0C3wrXSdxkoQt326e+J8jNWIa
 ueELPVwc8sMEhIjWn7zViqI7k8E1Dfhhsgnc7px1hFRd4lxJPLMs7btIpLh/NRXnfeUNNdGfI+e
 wdjtd2GygHGkPga9hANX+f18QMKbL5VvztlyvryRfJc6ATAxyE3WHPoO0/obWzEO0P/s6
X-Received: by 2002:a17:903:3805:b0:2ce:8551:318c with SMTP id
 d9443c01a7336-2cf349d1747mr147460055ad.40.1784568913985; 
 Mon, 20 Jul 2026 10:35:13 -0700 (PDT)
X-Received: by 2002:a17:903:3805:b0:2ce:8551:318c with SMTP id
 d9443c01a7336-2cf349d1747mr147459665ad.40.1784568913410; 
 Mon, 20 Jul 2026 10:35:13 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31429f9d44fsm37364959eec.1.2026.07.20.10.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 10:35:12 -0700 (PDT)
Message-ID: <764a8c69-0511-4b86-a649-c0a0ea9080bb@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:35:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "target/arm: Build cpu32-system.o as common object"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20260720100312.119894-1-peter.maydell@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260720100312.119894-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE5MiBTYWx0ZWRfXxWYwhh8Dns4+
 6/tyCmAnL/kgX7GLTeBLdIzzUV4OFYoGhNn5bsabVXLfYUHIz8pwGyE33UOktD7hZmravyuYYqM
 kq1/VpMxc3qN9xE5u/XERFTSEqfqRLs=
X-Proofpoint-GUID: bld819IJGZVSYg29UCgIAjCk2p2fsJ2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE5MiBTYWx0ZWRfXwNoEs7ngjuT9
 JeM0aMql8UpKrYS+PPYn3Xg3GX1ndTVxXVEy8UHz2Qe8x1HaR1AoCCUhJ+soy+zKORkAe16ifOx
 O3NG1Va98tLWTTzKVI2Sge0IKs84Ca9b3Aw1LvCqSRv//7m8ESHOF336qli32jU2Vo92HX4lcNn
 M+PUAMNFkt+0JZaH3RJMbA7ZtYZ2KRFCrXeOTFJMhxKSQ+Wqbmo2lTLnRuTWPjkdDmaD9uiHVsp
 b8WmBDeT+YOuGVWgfm0KcompZ55203PIFjZksUAY9C0Y/9kJyDJm15hdSDg9vGMyrSCfJAoDLCs
 WfhKe5Z84ZBbdOHRVU86PYM3oFi6DXXMYhEMFGXfFT0nLhYtiRiE46BTsPBfphkfP+Chm1NbuyL
 cTM2HaAedYP+mBqePaFrL62grS+Mu5+oHHM+mr3O3B+PO5IqIiJyMIYrXpHjKLeLvs9KViwgPjk
 LYPKPCfPPRgXkCYL3Iw==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e5c52 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p0WdMEafAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5ksWg3-Fzs99CpwBcB0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bld819IJGZVSYg29UCgIAjCk2p2fsJ2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200192
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 7/20/2026 3:03 AM, Peter Maydell wrote:
> In c8bea1276c we moved cpu32.c and built it as a common object.  The
> commit message says "cpu32.c only contains CPU types used in 32-bit
> system emulation".  However, this is incorrect -- it contains 32-bit
> CPU types used in both system and usermode emulation.  (The case
> where we don't need these CPUs and which we were using ifdefs to
> avoid is specifically the AArch64 usermode qemu-aarch64 binary.)
> 
> The effect is that qemu-arm lost all the named CPU types except
> the M-profile ones (which are in cpu-v7m.c).
> 
> This reverts commit c8bea1276c85855b2e088b740737d043c8556d58.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3962
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The commit reverts cleanly, and looking at the git history
> I don't think we have anything that depends on it, so a simple
> revert seems best to me, especially given that cpu32-system.c
> doesn't reflect the fact that we do need these CPUs in
> usermode too.
> ---
>  target/arm/tcg/{cpu32-system.c => cpu32.c} | 10 +++++++++-
>  target/arm/tcg/meson.build                 |  5 ++++-
>  2 files changed, 13 insertions(+), 2 deletions(-)
>  rename target/arm/tcg/{cpu32-system.c => cpu32.c} (99%)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

