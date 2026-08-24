Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2977EC5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 13:50:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyV3y-0002uo-Ua; Mon, 24 Aug 2026 09:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyV3x-0002qs-Nw
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 09:50:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyV3v-0006Xe-G6
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 09:50:09 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OCv2Tw3053660
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 13:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yKbttNmCiWAC8/kWZgONDgEVS8vSvMX5quD7Tek4ryE=; b=pubo48l1L5ZKVCdy
 jVUvcKsEm6E2lJmdb6ydHyhy+mqRnAzsKlGAoVPnMw0EPViBmg0MhFcK5IWtTnP8
 Zc1r/2LyzH9iYorddbmyowZorKbLk1L+1ffHcCjVWcb5wNgnXi3SZ45a/oBo1hvg
 inypKLH1P3/RpTcc1/zkxPtFAsrpzNXpN5M/Q4ApBNUGL/MTi4XEwq5do4yxqS00
 uVe5ha8hKYUzoha6fuk+n+wXT/3KKg6KzRgcMfYs2sdmR3tz0vKSumKdkKX43N5+
 qBKCSDjNFfNrMDBu4BQMwVYSiLi+5yu9SUfc1GXfHSNg/SXvfahzZXxGEIKDi8tO
 48FA1g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7k2eq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 13:50:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ef8249f871so36842486d6.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787579405; x=1788184205; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yKbttNmCiWAC8/kWZgONDgEVS8vSvMX5quD7Tek4ryE=;
 b=KURzClNRez17U9jI/d2Ay8TYtNXRp3lPAwSdWfKtsemyKmdG5zpCiI0GxW4doNgq3I
 sDhy3zpBvxnA04fekdl6B6SFjwduB7jovHU/rQBwQ9Cox2A6NtwYr1nmGRLhXYgEyxu/
 jFJXThzPOtCUWuMeoUO7LGS3PEjjlbeKOsD23Y/ft0KLil+aEzW8w1jItqAd4f0PUt0a
 SIpPQL3g2rUUC0NuGJbtUf7/TUi6SiLceog60p7cDChKPiuuvoqkm/zZ8p9gaQjoCzEH
 55amH/YlS0Mcyh4OL/wM5v68HWTcezjoukozu0d1pM4Ik20d63upa98A0VJICyrB0r3F
 qJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787579405; x=1788184205;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=yKbttNmCiWAC8/kWZgONDgEVS8vSvMX5quD7Tek4ryE=;
 b=VcKi9G4Vz0ObwWL+55T6T+fQf1+SpUM6C6mOU2eQn2ZYDqhTTP5VSpwlVQGjYsMc3T
 xP/H0dsMLlszBkOlJlQgmMZ3aH+GwTrEQYCpRiCe2PAUbw3LgYgT0MU/L5/m8d6BQL2n
 xOVuM7wl2mgglIGG2tK0qImE/BTLa1JOuQzbKHwXCvK0uKCoV1OBJKdEIV2RqJqouvxw
 iK/zl6LaVfWAlaAaWtgbbadNiciw7+dsduWSRbKtKakzvoX3mfI57KsC1isynjNyTdV7
 P7fZ9/EjUAwlnWdzOO1K+mPLEuP8SVdB8+giWymleGxkZ4IJrKBoCLOu9fZTXFxhx4KY
 t7eA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrC7Ba2gaZiDjZXjxbjEKdUZxZvXb7BuNyGkGQv0bEKC1sOFT5roWZkiM3FFr5LvH2wuxn+q5w3hQ==@nongnu.org
X-Gm-Message-State: AFuF++macDrq2NZimRpICUR7H6PFZHKe4IV3jcJWZnl42nMjlCZ8uB9q
 rBc1ZTRvsmMWrFz5VMU20Oqb4mdEA9qU/mpafEymuDk23U+Cq08qKwWXNchQQoLzRphrz1o6xqI
 VLed6UfaxJ0POIAuCiC1xjfC9/sXgmwBK36XLTRWcAPKa0nUAv4md1wk=
X-Gm-Gg: AR+sD12ZRgHxjhme8yGKN2Ux/lN0sBqt2uNyfcQeE/1aPLJcmFjBuES+4KwK4HoNhLy
 KEeHsVgeGTRlfWpcX3QR8B+uJz7phiLgBp5iQMnMJ/78Ftz9p5pbXgQKpPoVIAgUsPexOF5sVXI
 fYYMT3Yhm7MX5ZFmLzJeq5WD/r9hlNrg2Vc+aQk/ZEnfecSXPzgSiM+Tr9DrG5fLg1lsGQHzwAt
 FEG+2ViWV9QemUdHo29K1bjZqf7oE3SQtg9jVNipDmah2lrqfQ7zYUnSyVz0UFYFv3eZMJfWWX6
 Rl3/jbJ+QI3aa+AX/Txx1XDKSK0dN+Z3qF3l7s1nV/UgoUfZmLQVpSzpTRISL0owzOr+iVl+9bn
 QgO4CqCZEXR+mQ011N0djBnSvOyjsL39XdhjoCNMPC31o7wKS2Q==
X-Received: by 2002:a05:622a:82:b0:52d:86ed:8394 with SMTP id
 d75a77b69052e-52e09cbb788mr182756271cf.36.1787579404527; 
 Mon, 24 Aug 2026 06:50:04 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:52d:86ed:8394 with SMTP id
 d75a77b69052e-52e09cbb788mr182755531cf.36.1787579403924; 
 Mon, 24 Aug 2026 06:50:03 -0700 (PDT)
Received: from [10.254.188.74] (102.19.205.77.rev.sfr.net. [77.205.19.102])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499bebfa94esm76644165e9.1.2026.08.24.06.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 06:50:03 -0700 (PDT)
Message-ID: <f9267c28-6efa-4bfc-ac62-2efccf83765d@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] hw/intc/arm_gicv5: Regularize spacing in
 config_readl() switch
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260824102805.639072-1-peter.maydell@linaro.org>
 <20260824102805.639072-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824102805.639072-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c4c0d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=3Njm2NGJn2tjTLCKQaqOdg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX3YPiirpLuo8k
 pkeyIcibAA/rGC1lAG3SEqxeN9SfvdTIJImzK+jPTWdP8YCG/PhMExNtLnpwfg6YWkbhOU3DPRX
 yQhQ8nmOvyI9ROmm7i2PVhj5MutvSfw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX1y7fmuLetgjY
 naWX0AxplhnKotidGXZu6UPgV6sskf5xHI0wqKDkOENdKu/RZXhGDKo7oRCTPzYyP+93HxjZYzp
 6Joi1S4Bti/LwwLvf3IzKNN8njaEtdw+5yhlV4CbXA+iFv26Vmr68RvaBhNwQgVISNSuZdYazHT
 cLGPNeSPsjMU5O+ce20DqQfoHNygpeHcdpm++BEuZck0uKzpN5DU36ape1Z0TJmfQcHW4BEqzz4
 UXM35WAmajKCkbfV1FpgHtpWQb5o6CgYi0bNTtcsmFfB1j0ctrCAN42tQMbTuV7xfRsHD5MasL5
 ynO7Z0Zzj90+QirwSm6VDPMjdASOyIWQDQ59Wfg15YUcEA3ykWxygvL3VrQ1rgIiTTg0h7A3Bg0
 UCVMfbSiCts2CWVta5M4czVxRYJS6hpY7K+fqzfIryarjttZ6AbeCdi5fknFqBmS2Pnqrapdw/U
 xsOJjoSMe+EZGvOtd8w==
X-Proofpoint-ORIG-GUID: Bx_uSva3LugFQ5Fd5ntON-TDHVkHJxkK
X-Proofpoint-GUID: Bx_uSva3LugFQ5Fd5ntON-TDHVkHJxkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240116
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

On 24/8/26 12:28, Peter Maydell wrote:
> In this file we don't put blank lines between cases in switches,
> except that for the switch in config_readl() we've written it half
> with blank lines and half without.  Delete the blank lines to make it
> consistent with itself and the rest of the file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I figured probably better to do this before adding a bunch
> more cases to the switch, which virt support will do.
> ---
>   hw/intc/arm_gicv5.c | 15 ---------------
>   1 file changed, 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

