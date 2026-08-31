Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E0BC61DD3
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 06:00:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0v40-0001ps-R2; Mon, 31 Aug 2026 02:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0v3z-0001pa-R4
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 02:00:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0v3x-0003mL-Tx
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 02:00:11 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52cRH2764557
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 06:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Cx1mfF16N24mRm3e1dMX8wA/WYCMowNZRnFxI7KBlOk=; b=WQbK4/IhPfzBnIu1
 C6v9juWO3Ljgo1HhMr4TFsS6d2MVogcmQMTIb6BvtWiTKMNERGBtkX+d9X1C6SvM
 /2S7x9G+3kyEBdLoGXyNnzYmgTPcD5rLy10VA9nwsZU7KyK6872+pV60YGHF8CiD
 h0rAK+kSwg04/g4xPU63w6Pjt8eNQ5BP6CdQIIApRPgtVu4bmQvhizFDhJtvB2yy
 Vj+bw/qkQeDJWr3HlCwKgB9BmQ/bH0K1fN2NWI1WA/+al9JFY6/5w/bY5eC/rEd3
 IpGTABoa9+gF4Zl0JOolZWpo3+pgHWh+0Q34k6V/3spLWWIUoR5XswUHGHKeQ9Y5
 z3FYxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgymtn9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 06:00:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-934956beec8so529787285a.0
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2026 23:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788156007; x=1788760807; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Cx1mfF16N24mRm3e1dMX8wA/WYCMowNZRnFxI7KBlOk=;
 b=hk0yTvAsVc0YYvZwsJhRDB2BFzYkJVgP7fnUj4tLPUCNY0HylJZrx0w25Woxu4rg1M
 V26KZ2ud5yQaG98fGI7pjIwgu7lBV2Zz7JZc/wMLcX3HLmi/Zbs2C0wgMF2DwnKR17sw
 idV2mm4t6sm91/6ctIWx3UndiUdYej4MLuKUxkF8NDMRiLNLh1poZYroILe6g2ONTgoZ
 DWU+om64HHagzhd2xXutILUh51EFjFGYdshkhSIAtv6qQKy+SoLpijzkoKa7VGAGjD6R
 XvDAeLgDO4+edigp3IfZqRusX773m1hdOQGcDOqAmsNMbRC1jcR+XT0yICYdLJszfcmo
 Ve0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788156007; x=1788760807;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cx1mfF16N24mRm3e1dMX8wA/WYCMowNZRnFxI7KBlOk=;
 b=Gkfi2atAXf822tkPpuMnjhM1vovj/8eKVEj24mFGtM+vLS2Wslny1nbXKDY917qcjY
 vBdhkMyUdj2nbYJ69y7aBDqQlVQUhKWgVTA1BwXie+KdSWA4/OruYOynxFTqeTKTS6fi
 ECiHG2nopAgg1/Qatx/uBHjePEm/g0cAuutTe97AlXlupJY9fOBmjVWWbpv815UNdURN
 Xd07PbGL5G2Vej+/dh9dlxJ7GquqHFdla3ETEjvGHPHzcN5Ub+8QF8Z+0rl0HCRNJmWV
 WvzXtPuKBMVuDjtvygPnNeBj75/t/ZzzIWBJB9W18gyzkP9dnCeeedDwOrghZnxzL45c
 ZD9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdaOvULUxMb+u3VXC7wFHn/5heh423ClwMEYGgxo2RvudrefJhgexUnkIq92q2B8bdR+DGD8NiiA==@nongnu.org
X-Gm-Message-State: AFuF++k66o3MXgeAV1mAADeLOTiQr8NMClyo8rlcly+YtlG7IxMCBxGN
 kHDQlK6GVo4NMVdMzKYvlNMygKNPaQPqRFHSQlN+7enO0n6lssdQcRJEKPxiCOJuSxhTHPohP36
 PFAQVA1ExKOcXuZ9/Dg5cK4xsr6zru2cz5CSJ4owadDhZcYkuZ/cKnwM=
X-Gm-Gg: AR+sD11RlvslB4FrJJxsQmta0BTrM/Aloli3k+XKv5ff1WW4WUsGkYhUD6OkAFf+vJo
 AxI1D9uKnaxlM34OwXISFIoD+1J81eFRz7GiULIcEI2XARnJgJEMA/0Kq7WO/szNlx0SxPXfMLa
 zXryiwoX3dyWWoPWYOKaRJHcJOYUjHElYTzkaphWSEObEVHHk8VrMiNyeERMSLAn5vInS3OrqvL
 vdvBAMKRgbtsgi5ENyUTQE+f2ajE754/yTMJ/0/KgVgcDY+kj+x8+QFXujyANU04DCI9FP/8UNv
 5+RapmFZ/7qtGNkUUvJqUgoF6cY8TK+vasok1WebABb55RhYW7TW3h6hlZrkdR61VXAB6fe2qjm
 GKl2sDvnJryieDX+B+Y9OR5hKGKvEcjAO+g==
X-Received: by 2002:a05:620a:4b41:b0:939:3c0:144 with SMTP id
 af79cd13be357-93913958c0amr2005519585a.33.1788156007334; 
 Sun, 30 Aug 2026 23:00:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4b41:b0:939:3c0:144 with SMTP id
 af79cd13be357-93913958c0amr2005513985a.33.1788156006847; 
 Sun, 30 Aug 2026 23:00:06 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ccae954f9sm195158315e9.13.2026.08.30.23.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 23:00:05 -0700 (PDT)
Message-ID: <5f9b574d-84aa-4220-afcd-a5d5bf80dcff@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 08:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] hw/arm/aspeed_ast10x0: Remove obsolete
 unimplemented SBC mapping
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260831034153.192916-1-jamin_lin@aspeedtech.com>
 <20260831034153.192916-5-jamin_lin@aspeedtech.com>
 <c8e259b7-3b42-4dc3-963d-2ce8ee680500@oss.qualcomm.com>
In-Reply-To: <c8e259b7-3b42-4dc3-963d-2ce8ee680500@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfXyKVJgGNzTltA
 W6Xc0PuheMAFkVBcbonuMeRYj+XbkKnv55ZSd1cChlrpmYm8tjak15B+6ObKw9Hh0t93cenU7uz
 RUPEbNpkLJJTt28cHyV6brwZz373krU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfXwlguuebyVDFT
 D1gBgDLKr3nZ+ImFXV3c7nPR9Kegl5b/C/5f0pXG9zGydkBrelpwuefNotkIyeNEJ6cV5Ah1q+5
 WxHMLywAimyuPWGBEkkkWvTfzH0anqwptEpn0WM6qVJvPQYhHyzA4EgXnBM2sC8pAM/Jx8q9IIp
 P/WZ8y8kjzsC2SDGU15aIogVF4NoT8+vjBMin7Btbjb7TyTBquw14tCsxtadALVGwZaWHaL/O6r
 C2LqGjw/mZbr3/gJQB+2GeVW2bJVrcXEEs4xDSzgiMHkVsZM562gLEJc7SqdQwe4zrYRDKSn/H7
 5b43j7J2VgoogaWW1T8CT4x3/9GTio+ayhu0wSjdqoqVVZcij5eQt9tzPOP2DcWX8YFlC4IakPO
 hHfXhANGJQrfG/ggUZu0FbdeIL9C8ljK2E2eWENVWlTJ9DPhPOFwMHCknmVYoq7hArC1FncaFnq
 WpAGX0TJaJogdT1fVTQ==
X-Proofpoint-ORIG-GUID: Vy66t4r6RGE62NB_cpAnZI5agUnxgwYo
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a951868 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=iSX6IlxhHMlephMWIyAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: Vy66t4r6RGE62NB_cpAnZI5agUnxgwYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310049
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

On 31/8/26 07:57, Philippe Mathieu-Daudé wrote:
> On 31/8/26 05:41, Jamin Lin wrote:
>> The AST10x0 SoC now implements the SBC device model. However, the
>> old unimplemented SBC mapping was left in place.
> 
> Since the introduction in commit 356b230ed13 ("aspeed/soc : Add AST1030
> support") indeed.
> 
>>
>> Remove the obsolete mapping now that the SBC device is implemented.
>>
>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> ---
>>   hw/arm/aspeed_ast10x0.c | 7 -------
>>   1 file changed, 7 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Please squash:

-- >8 --
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cd68c7f1caa..eb5b9291950 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -89,7 +89,6 @@ struct AspeedSoCState {
      AspeedSBCState sbc;
      AspeedSLIState sli;
      AspeedSLIState sliio;
-    UnimplementedDeviceState sbc_unimplemented;
      AspeedSDMCState sdmc;
      AspeedPWMState pwm;
      AspeedWDTState wdt[ASPEED_WDTS_NUM];
---

