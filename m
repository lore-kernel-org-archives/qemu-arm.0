Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060DBCA5FC1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 07:39:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBouG-0000ea-IY; Wed, 30 Sep 2026 03:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBouD-0000WC-IW
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:39:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBouC-0003nA-5e
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:39:09 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68U6pUfB2982047
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ytOltN1iiWDLaJJ6kei9tERsE6R7+TCfcCRaM/leo2E=; b=mzcrcqfAT+4c1J4W
 iD8TWvh2P1Tisl0PRjPvybqe5LHut/6WukFlecDvciaO0ALig3K5GvFmbJN14IY7
 BRIo2PBqcRSSAS9jXk/xcfUm59rB0VHl7saj6dLAYuli3yzmbKrsiBXLyPyw3Q7F
 Ialg1F5EI/tERWKbZlLr3G+cBCD7GsN1+Nl5w1jvruMh+AvVLe9nUCGTCVormLTI
 +n6gDAQTQoBoA1EPL4/glnb1pv8FdpO/p/YrkxcLHOd4r1xMUGvSNs2vfswBiTvX
 tiQCGGE1qoAd381DFYoyZkK0coQzlOIIJ7Ju62wxHfngQv9FBCdU0GysnGxB9WzU
 A6au0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j0ek4ce-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:39:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93c444b438aso1093839085a.2
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790753946; x=1791358746; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ytOltN1iiWDLaJJ6kei9tERsE6R7+TCfcCRaM/leo2E=;
 b=F0YNI5I26QzV/wPkucXw9EIJbKXVSTCjDANsCp2r8wZUTnqJEBf8nBFIKqEUBzzbb5
 LxaZeKHABaYjj4kv5/vmIpp7nL8H6HeqXeSMsDCtmMBXvpfFlzZC6jANtUML/1O271H7
 KWiitW41v/Inguv/G6ZyctXEauBlDUIKOUz50/Q9ZN2Eay6gk0NRbaAGUeoIW7AkbKMj
 aR63go13uPdBnVr6hpJ/F42taLtPtHIEBt+atGV43mrxGIGrSwfZZpR5ckllabkhYepE
 m9Q9jBcSYSFp//dygqzVIea0Zha3AgGv1+FCTZmcoQG+a3S/dtrUM2yoO+f07ocyXRyo
 JwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790753946; x=1791358746;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ytOltN1iiWDLaJJ6kei9tERsE6R7+TCfcCRaM/leo2E=;
 b=h1Sqp0bzql25oI9RvPj66t+6o02Vu/4NP3L/cmalq+WUXtNvF1qgnx0pI/tiAWOFbM
 DKPgt/Zln6g8u9AkZXcNmMHqoaeTmfh2L3bc2TmGgjhr6JTRzikb/Zz2rzBQhTyHsvyV
 UBngO797TAG6Il7cUgnXHyn8McBKzxsgZzc6Byj/jgVKEaZOvNtDUIhnsCgpEJTHz0Kn
 6OI0XFWZF+rMItz2QxHQLNoNpEvKumuQO8kWYyqhFeU1uxAXfaAr2U6i+xJE02++XdFj
 5D6glw/f+a6acOpbyz6xunoCNefqrhe5QbexmnWNDH362HDbfhqKnsBKDIh6yOM1bIQV
 KIpw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeaiRFSZm3yW0RTrrRWPNdiCLxy2z2HlE34yo0F1CYiYHH2TPGufViWCCGDBMpE7/DQg8OIRSNgw==@nongnu.org
X-Gm-Message-State: AFuF++nmh18hP4lpw+xG7Aw7Kbs9XbKvJtmUvxnWOannXJSAZRWkOrKH
 a4xBzU0Na77gVXCMWa+fZ1gvSYqZPQeAE1PzDk3fb2g/488RiekTQUIVzAUrQ3C+5yhS85ms9eG
 Mzaycg+mkW9wTttlJn4a5v3Cu0QfXsYVNnP/fGcDFMM564Di9hhTTKtI=
X-Gm-Gg: AYBFou3BUneYgpsMaSWPeSGZw7pT0r+Ahy6k88Ifo1ql6Tx4vLFBg3NfCdljOtpAWJe
 yNgehr5aamccXw6QyUmcKZpVIElE2Vp3CWwt/F1J14wS/1zbDVuZkb1XnzOKSr1mQaNbbJK7whg
 lCho0nGs5QKa70sOvYTURzZlRLRoAJKKbMF8wckW7XT2qTaGz0r65vTu6hBHhX5RwWevksfu0+m
 UIE8yeIokC3BsboLBXc2xXJaiV6vNJi1joGrLsemRzarqtNavyXhLri2nlwbxc4IaWJNrzG3AeA
 F4Fz5KpmGNoJcyLgM9FHQrwUoQaNa6571inyWL0LQGM3Lnydvll8tjahQxATLSevqvjIF+CtfI4
 5wjsI2S4UrHSFl5XkuHw=
X-Received: by 2002:a05:620a:269f:b0:93c:6f06:8f7 with SMTP id
 af79cd13be357-93ca97c6111mr83149185a.36.1790753946519; 
 Wed, 30 Sep 2026 00:39:06 -0700 (PDT)
X-Received: by 2002:a05:620a:269f:b0:93c:6f06:8f7 with SMTP id
 af79cd13be357-93ca97c6111mr83146285a.36.1790753946061; 
 Wed, 30 Sep 2026 00:39:06 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.49])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a015df7c36sm26108395e9.3.2026.09.30.00.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 00:39:05 -0700 (PDT)
Message-ID: <1c197d4f-1f4d-4637-8de3-f14d25043e50@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 09:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] hw/arm/aspeed_ast10x0: Use unimp array and table
 for unimplemented devices
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260930072501.2612119-1-jamin_lin@aspeedtech.com>
 <20260930072501.2612119-5-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930072501.2612119-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cqgOAF4i c=1 sm=1 tr=0 ts=6abcbc9b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7g8aA7A78AY7OC82r+w+4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: ZZ4dU3vsfFu1dAMaSgW7WVLf9qazwKuo
X-Proofpoint-ORIG-GUID: ZZ4dU3vsfFu1dAMaSgW7WVLf9qazwKuo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfX1GrACZE7aTgy
 /Vsu08w8uBlKy5Crc1xQA7poLsgLVq5id8IOt7795w6t63hLqd2MvzlL6k/zx1688wOaMnIwP49
 CWo/tVOpRJ0aJCYWuwIOw0KrEQ2XpEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfX7j3qOmj88QHU
 iOi+GcNf4qdHt+0f4AhrujvZ9+h6YZPytsYLHzVo7sE39xWwbqDkjS/sQokOKSnWL0XiZg6WQOu
 ywYnhIJbgidmYXL2GWM8YzXzXc3n7adHnpgoWf1a5/OOGibpHZkCIveha1+BPrK2NmzgcAYX50+
 Ie87xNyx1knpgepK00o5QtqoglzJshCyRq4v7SN8YL9Mh7GHnhbh8p7QJ0rDsXeQPfQIBGNqBs+
 seySgxjTI7UTS/JKQzOriNvFsjaSsTyQZyY6ETj2gLNx4gplDy1TbmdJUsrdIEPzWVShvvj6/Rx
 vBJcDYlstQcB4XMMNcx+brkaxqOJI7TSw0Wh3qJ8fSfEHa63xcYxGG9B19/KTonhwpWYOB+lE9k
 qCOV7EW+MellQ9xcKKmZeR89mhqwys4vKfnq8Ke9TA+1ffdQ4bfMKjZVmkdcow3CTTegF3vo9lt
 vgRe/cAcDSuTKe/Sqng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300030
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

On 2026-09-30 9:25, Jamin Lin wrote:
> Before this change, each unimplemented device needed its own field in
> AspeedSoCState. This made the variable names confusing. For example,
> AspeedSoCState has "udc" as an unimplemented device, but
> Aspeed2600SoCState also has "udc" as the real UDC model.
> 
> Use the "unimp" array in AspeedSoCState for all unimplemented devices,
> and use the AspeedUnimpDevice table to describe them. This makes the
> code easier to maintain and read. Convert AST1030/AST1060 to use them.
> 
> This also fixes a type mismatch. AST10x0 used the "pwm" field
> (AspeedPWMState) and the "sgpiom" field (AspeedSGPIOState array) to
> create unimplemented devices. They now use the "unimp" array instead.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast10x0.c | 64 ++++++++++++++++-------------------------
>   1 file changed, 25 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

