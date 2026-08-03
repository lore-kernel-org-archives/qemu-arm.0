Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45981C55184
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Aug 2026 15:00:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wqu8t-0007uH-Q8; Mon, 03 Aug 2026 10:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wqu8j-0007rB-Da
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 10:59:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wqu8h-0000Q2-MH
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 10:59:40 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 673ECOvO843049
 for <qemu-arm@nongnu.org>; Mon, 3 Aug 2026 14:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xdEv45pyR8eUPlDT3J2io3cCde7adVXd5XdK8PTmtoE=; b=mVg200Gt+WxrWm4x
 0mrTK8K/Te8hQT/eTGEblkgwjJZ10U8BzOGjR5oAQ6o+IKEY4lyylF9nsPRpqz7+
 GUbMx2f90nQkB2zSm4tBzr70chlIQYMqzDnj1qb2sT6tXYvJZgij7rVQLzbqqyOW
 rY3YUEyBOG9vI0q5BGUdtVgWNdO6f8A74TraQ7+xujv/G1YguZDH2WPGjkqV3c8P
 3aiNq0jkhSyuNpJKO1CrIyaUr+1DR0m+FXVdR+5DwJmhr+/mBcVSI4V5eJWuIe9P
 cwl/YJZ6tgKOmW/39bhzB4NJq70OaE34iXF+6/Zb1IErTzOHnHQwk49uGdqWlV+a
 XxdY1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnj3uq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 14:59:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1eb52e1fso62157041cf.0
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785769178; x=1786373978; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xdEv45pyR8eUPlDT3J2io3cCde7adVXd5XdK8PTmtoE=;
 b=kb/CIx0aglS0CZblg+z29p0XrT1tiQf0w5oI/YJqKBVnofvUeRYGfHujqvHVdOxZ7a
 7icSY3TuzpQPzHu6hF5YokIEHUvjOIcEG3NcXUySRM+fZuDT6r8bhEfGHTQBoztJWa04
 XGisK9doiCDn/5mnLcg2mKN/Z+zvUaD6D6T1UGeIpdyl4r3EUSf5oWm261LjHf/umZHZ
 BnbxjlAhIO5i62K8vpLjzuIwhZW4gPr4w1n+facDUb40GNMysOSL85pwDmmccM/feLTw
 ADVTuPKk+9F7M2m76J6Z9IXeVXJC7+aiR9C/KXP3uIxtGQF0qKQwy46nytF++vsxv4qe
 1KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785769178; x=1786373978;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xdEv45pyR8eUPlDT3J2io3cCde7adVXd5XdK8PTmtoE=;
 b=eByufejOwJqQtN1fo2aWHJCqEgo3GpQK215iQ5Vn99BUW76cGw1aQOPCzEc2xsuRD1
 pVD11l51Zn21dsCSERprFEC046uVSNfxjtcraoX9TALImkXmtzGBsd3sw6j+q1xL+HyI
 hggMkKL9XPzoi15DTJL3F4wXAd10/IehO+wWVj7UgQyzlAX/iSZ1BFCj2kbJZcnQ9wbh
 wx7nFEPrXBiolEYV0BNJTGZJFZ3eQvuFH3x/uuwCNw30MPVUbqMbdrp132rA9XNQYpJ+
 dmrMp2GrQn3pQukauW3ATTrawUC3d8Zn2U2rRbXFaW3qM5QHYDqzZ7sm7WI61vnfYDmA
 Tfmg==
X-Forwarded-Encrypted: i=1;
 AHgh+RruJ8LSqM9V4y3St9KF9aYxlW3fNqpNLR/czfOAk24YS7EAb/A4n4M3oANADwvDOwzj/uQyu5Qkrg==@nongnu.org
X-Gm-Message-State: AOJu0YzNc5GPMU66AZH2M5dxiGCkjErb36RAIh2cPDJPwWu9whEU5gG5
 InMAJ/8ve6zzYCyj97hmh8h4v9ZJlF7Dhywq4F9m4G90Dp4rgFYJRYG+PIch7IWUzsVEE2OFD0t
 EZuXbgGId6pLKYgF+Y44meElPhw4QMjuPw71/xAkcrFPgI8t/5yBDx6AbNu5SOjw=
X-Gm-Gg: AR+sD11g1e56IwuQoRKPOxTDs/o4WHNISGWgwujhqFHIVZ6kH5mkBUH0obg0ZNHMUvB
 EnIKES/9kDL57T9JTXmfXchZ/fjEHVYwMAEUmwPeMnCMsqDn3JapJ/aA72lTPN3WXs/1pynzI7H
 s3NHa9+iURNXpVoDmeFVAofAUq1uAxPU52L9AiDdvh0DAPr6QhNgxo8IdjLDDkRIAjqmM2/wX44
 hD8cTvLjBKhZaYgteI0WJOMgJ9u5YbCGHrcVPzNIQzYM/y0CFRzoAssux/QZBUjcnfsWGnEiLgp
 4yKVh1cfxqwEJj00omex1ehdoKFOvwb/Z2k2BNxQPnbxTZ6PJT9ALLy39g3seIUFwzVOERBarAL
 uV4ufpuL4Jaxl2sEzdwzO/4nA93YLaLAwLoA=
X-Received: by 2002:a05:622a:17ce:b0:51c:239:42da with SMTP id
 d75a77b69052e-52b566aa83cmr233786381cf.15.1785769176999; 
 Mon, 03 Aug 2026 07:59:36 -0700 (PDT)
X-Received: by 2002:a05:622a:17ce:b0:51c:239:42da with SMTP id
 d75a77b69052e-52b566aa83cmr233785441cf.15.1785769175965; 
 Mon, 03 Aug 2026 07:59:35 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b8d04fsm319354595e9.3.2026.08.03.07.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 07:59:35 -0700 (PDT)
Message-ID: <f53ee4b2-20ca-4b45-9fb7-bf33fd5da8d0@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] tcg/loongarch64: Implement revbit{32,64}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260731000503.170446-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a70acda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: f0-gtNaBB1SxuRXwqgNVCT9jlqgMGxB5
X-Proofpoint-ORIG-GUID: f0-gtNaBB1SxuRXwqgNVCT9jlqgMGxB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEzNCBTYWx0ZWRfXxyBMfNkYkBVT
 Soacq8dOqeilCQolavtJsAze4enonIf+BGh3qlfOBCCOQFDCmoQG73zGIis/HJctg8QTtP2ugbP
 mDx8u7M7vniMsUOJGdgBFsPrw5EofBp5o49xX//UbkK5lYz4k3YfyAub/1hmkt2C12wJUwuJjxW
 vl64DqDOqgjl/ViBQeJEHSoe9AK+7f2e8H7KcPcL4wHi2KAeQfzPPtAu8kPpFi65RpeVQCOmKYa
 qoXeNO0OIHfgzZF//tv5adM4UZW1ZPqqi7c1JjaceWdhpHa5z8Hhg8FR9IQ4spFlZNEmmtBlp7b
 JcxzHSFcQz28KLpby0QumDXo4pwYFx4igoUybq8RdXgYa4uC13x/IOTt0WEg8s2j/yQgcQdPsco
 erz/IFDbzny1GeYzwHjjhWFf5QwfoPHnVSD5aPesJjoMCjDrZr3FTjk45FhRLbBsn1qKN8rRd2Z
 Mb4A80HgYBszsfwtAjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEzNCBTYWx0ZWRfX8n9Tv2HMwrct
 LNFwPdyJnbZI+HIzO3R2okB8n9o9XAyqEDYHQBV1r0LFPi+gv4MQ7BIVnzPFBOyuiPY8Bg8fu6V
 aW9HkJo2CmSfeHTZE/1Gx+MIZhgR86o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030134
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 31/7/26 02:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

