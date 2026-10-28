Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6907F606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GTY13MEC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPeZmmhx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAYe-00027v-4r; Wed, 28 Oct 2026 16:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAYc-00027b-Rr
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:47:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAYb-0005Kl-Ak
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:47:38 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIPK3r1942039
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I45lKDOum5NoadfEisVqegAyLlJKzS1QagJLtqlpxh0=; b=GTY13MECEnm+Wbav
 03Nn6prN/WecN87NrUB4GrHBjhRufIlyoqSzz6N/pHb7a6z9tb150ZD24vDxjxg9
 EXZXYJQRX/zJgrabOgct1k4Od52Ly5N94iNxCNT63jlsG93/KO1RhTxheXa71DS4
 dKEH/EzEi4u5ME/cpgI/aqESYyEaVBS/HN5FGtdfz49j2Hq1tjiEyLwOn5DHSIEl
 X4X6ON8jbGtFYmk44rzNxhFjqbO8kpTRU0TIhMjizi80Zh9qlvPHLQCzn8cLfwad
 cb/yMdk6+8z0Nq9BWeQxlFkHJxQEaM7mneJIqnbsRYMD2EeUmVYDDjmh+TMnDvUL
 D198RA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwbegg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:47:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c0d568830so2744693eec.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793220455; x=1793825255; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I45lKDOum5NoadfEisVqegAyLlJKzS1QagJLtqlpxh0=;
 b=RPeZmmhxlxKG7o24GA6LtthLQBdDOY+PQdWIfGmjHaOiPfE34iLLpmOh6J1QE+MMUD
 jZYeaVVrnNcTuQ++Vyi+QRg9603Of2oM20kCFNcTfZLeOByW3XV/Yd23cpEyftTj1m0U
 cg3Mx6tklafaUXUiE4ncNCrlxPd461JTaehtljyPMayhRMzJB3Q/Gjg9dOqD5XPZOT+i
 Uyut4z1m4ey2taHXcTSsMkLJSdBp/5p1vyfh/Gz/sTHgZ/ZjdJKxrGrVi46twaRGAgwE
 /F96Q40SZrxektbgm3VHuK84XjYYdzKOG88a0MJN0lzKtm0mYePy1EzSztS5zhOAKKIB
 hf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793220455; x=1793825255;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I45lKDOum5NoadfEisVqegAyLlJKzS1QagJLtqlpxh0=;
 b=f/3YEoQmDiVajv8c76euaVvBURau/g4RyCoqtxDmlVzoo6C2y91PD7tZkt2VPqQ2PD
 J9UGGSQPVBS64rEA5wX81UiX71qQy2IQ8w+qyNjp8JQ4f5IGioCo+A2UAENjy+zaPcoz
 tf0YbVioBldt8P+BmW1qhOjigtB35OaVJRLJF/3lKgED0OsKwwUfUoyfvFD8EnehFxjk
 9QPOTOtqRedrsP9Badv6j0UN+ct8Wli+4LrsoZfjblZ2Ysjgr5cTprOvgPV7Ii1DJu7h
 zsTKlEC9tKmFqNXft9LrHwWEryW95s99jeRmAK3Fjr2YUf4XR624iRnQ0VsW+lPfPfxG
 ivSw==
X-Forwarded-Encrypted: i=1;
 AKwUvByMd7Jod0SFRQKYGdqFYivGegNZLyMcclBNLCpAcnLhPRcH+s5629lqhnBm6GaIcpVOQUv2xfBahQ==@nongnu.org
X-Gm-Message-State: AFq9FYJG5CgiLFm0nynpGctHpg6hfGa+ZpL7sQtqJ6bufD7KtaEaIfug
 TTLH9PSjJKCF96XUMwTDbvOE3dMt86KNqZFVFzFtUJr5bOF7NQhx156gq42UVzBvBu7qALb9MK5
 cFbNp6KAAJf1KI9M7BdV0LZAXfbx4z7L2EH55UurbcRIHx0YGoZbtlpY=
X-Gm-Gg: AYBFou0z1GV7WAscqWnudPBfoyBypRx0D8UZfXfDmPN4iKthaUn1oJdRy5TqSyJAvZf
 Lx8r/oNH1Nxqwdbn2k9Cfb7eCQXVDQCgOEVMHDmB5RVcfzJHe3xWQrfBYLwB1TGnJv/jZ0JiR+d
 Fx94f2KEZQnCK2MpUrBSEdHF6sQ8kMmeYs81REB4ShiJb6zb/0T+VpyA9JY5U9UqpLJajdfwujg
 ZdRA7x6ljr2KxGH4RNt4ZAplfUe+IW+b6kY/arAv2Lsv36iO78mK+22LGGEcHxFnPUKoHDaY8AI
 APpBr/KBXNX3WqYjNNeQzEbrhqfYDlacW4viUg8hu3UlEarQpMnX6AGPMmtOhFDc3oFSTdRVH+h
 OYAbV8d1SjoAsKBjufw4yY8Xz31c+TXhyCGJnMy8zr6cqAf6YGjSQP7SOAEEAa9VC/b9UDldMCw
 wj1UQSZ3BdIDO7ofG8FfBk+vOq785I8fdLIW7BlPE3jKg=
X-Received: by 2002:a05:693c:2a17:b0:36a:1bac:6bf4 with SMTP id
 5a478bee46e88-36a2039cb09mr5202678eec.18.1793220454959; 
 Wed, 28 Oct 2026 13:47:34 -0700 (PDT)
X-Received: by 2002:a05:693c:2a17:b0:36a:1bac:6bf4 with SMTP id
 5a478bee46e88-36a2039cb09mr5202639eec.18.1793220454312; 
 Wed, 28 Oct 2026 13:47:34 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a238da3e1sm12647365eec.8.2026.10.28.13.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:47:33 -0700 (PDT)
Message-ID: <9d4b42d4-27b6-4899-9ae4-02fa4baa7563@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:47:32 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] hw/loongarch/virt: select virt machine types with
 is_available
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman
 <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
 <20261028201557.2688-3-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-3-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ShUmIwMk856nX7F8b4oVZ0L8MBmNVT6E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX2+8GAQSmxoeu
 ucCRrp6FOo4KjhCDlpmPaM8GWeWwyCFU2JApAae4Yq/BdYqk7542jvAqG9s6gQX8c95H4z1el9I
 TudhGQftAUitZcAAkG2c1tt7Dy84P6o=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae25f67 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=mcrl7TYwk7DjkRtL9ZEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ShUmIwMk856nX7F8b4oVZ0L8MBmNVT6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX8wXBFx7Qi24g
 ALFygdF+2b5UVAe3r49d0noPTk/xzXeb0yZiHfC8RHjirq4YAVXAVMJJJRYpmMkrr1OeqzbUTlU
 YDuXDVTVj3mYkGisOen1QHdGABxBdLPFRp5HC/Rz+Vnq76K/Shp2PiYCCN2CI6WsUH0gnd4l4gF
 O+FhcJd1lTJZhySWx91ukVP1byu9ibYQBqTu77AMs234+yZdEr2OqLFst4cQM+2ffLcYMpYDC2U
 ma9rDEImjS0olTPCO1/u4DVXYCSr992FRB873sTdkYkpdyn4h2Dhkg3Ih88NiRZ4OA3FpR4LgV5
 flBjfJ0FmbyigqMtLb8C4USx/Wu5Ep/anNQyd4k7hawUjEE6+s1WDLJkDG6Q/r0vnvyGVbY2p5m
 0JpAfmea8HhIF5jFKFyOeqsxmenTwYsfRa7gWR6Jo92o6OR6JbRKnGJaVR9OpI87kIz3pg5ZNbg
 mDNQj5bHMimoI+0Qu5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280082
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> LoongArch virt machines use the same QOM names as virt machines on
> other targets. Register them only when the selected target is
> LoongArch, via target_loongarch().
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  hw/loongarch/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

