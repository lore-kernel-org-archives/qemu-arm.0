Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785AB10AB82D
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Mar 2026 22:54:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5tb0-0000bh-QU; Thu, 26 Mar 2026 18:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1w5taw-0000b9-QZ
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 18:54:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1w5tau-0000W5-6I
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 18:54:29 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62QGKrAY639492
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 22:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GAJeOIQCFcqcDe0X77W4oTwnmC/GvUDN9WOkXNBwQWo=; b=cAjg7otcfSf4d4IO
 8pTfxIJdj86oMHOhH3LopNYVb2Ovp/nPr5XCo4sAQlzPTqWHW0xYiNIRCMrpm4hD
 Id9zMLw+sELFhfu6n7r50q4ONDaOhzuqi5Hp4lLctj5/7FZaYIvt/+JqBjjB73T4
 ZaI2ZlXb+OIIYps7/V/tpQNjv6SeUGI4pf4OUexfGqfIY64m4P33N4mZZQpZYbrk
 gMjUVPAaJxUER5PuDoWD2WOhtihUxKHBYRN24M4uxpLFTaYvEeC36MwLEihBMa1h
 NmaiHAjzvaCrFTgMKF8YbqYnNM81cAp4EVOFpzPGuDDIG6ybpmw/cNjkQRu6gSe6
 WkLtSA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883h8kc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 22:54:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2c0ba59a830so1602389eec.0
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 15:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774565663; x=1775170463; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GAJeOIQCFcqcDe0X77W4oTwnmC/GvUDN9WOkXNBwQWo=;
 b=a90Lg6FT74Bof6QcimzGwC5gz6Qnj2gYVnI5sai00TyRlULMYkwbMmOSTl54geL7/7
 7zZz8ctrwwBC1wZXM808v4hloPCnBolkgaEsWvuQi0yt2JPlN/aR0zK5A5pMw1MaGMkp
 +cZ+SiOqRSyDPaLYIz7/X7aqOQwvZCYy6i31QiJ1G4bNEFX8fZMsHExmoAR+p3NObTII
 Q0YvkyZLPbHOpWv/ETPRZP1zyFQRI3UmceIs9HoVe79lsQuiCLM6YbcV0tynjRElWtUo
 MrCmzbVi+5+FzrzX0oa6WldiDnE0nXyTLyTvwqfJxrjJdRHbBgKrgD5HFJCYA8dUgIuN
 WXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774565663; x=1775170463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GAJeOIQCFcqcDe0X77W4oTwnmC/GvUDN9WOkXNBwQWo=;
 b=Huh8Lwad6hKs+eLWd+NXKeJws50REUF4mGdAFLrsq0VN87ewuCc33Ax76V2zFS8Wjv
 9Tkz3+J/+2rxKa7eIm7kYGfRds9NHo4rAPxorOCKfYkgq678T4PScSBg1iG4eB0dfac/
 YFepGi3Eu5coC7kYmjNpm88ghYJW99pb8OMjW+WG5F1fE4Q8nyv1kv7g+Q39x1y8DHsH
 nGFn6oPZ4xBw8s4jJf77WkPT1JvWW9JJtr1iPMp7WzKgmK5RVpn78PYpqLmZVLSGrmZ6
 6S42cZyVQTiMp5Tw5FkmQ+HiPWUVVNdkomNMHo63ytgetQ1W3EstX6FYy6m5OciHNRU9
 VfCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRhBgmdEfSNP217OWpZl0p/Ygl7RK5Nxx2qVZTY8ZrIexjOnij4piqPGLvPSI9MEUVHv/MbdEixQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzbz04ZPqbnK2ueKgmiY/mG3OLso2e9k6gSb7V5L92T6LqC2S9r
 W11HVUuzH7LkZeAhO6Li5Myg2ITpvQULUnEN7mk5QzNRQ7pVU0iN4NuC+aWRXzMxpsfEjD0gmGZ
 NZ2t5wcRbapgkQNgJ3OOGU/QWfTREoLHWwcL3qHg4IaRARMiys4VPfsgeu21rZqI=
X-Gm-Gg: ATEYQzxDy3JKg/REAeEYX1JbrSdRWhvR6ThPVVn5evHcpAtBV6/vt9yxtHoY/GHoyE8
 rKUxBTLGcNTxe1uGvVGqghH3vFFedDQQwLciSAL+SsqEXPOHprgx4K/1o0mxutMLZJl5PuFh9ZG
 NBZoPoz1uOWiWGd7+sYm41cbpcNQBPoaNjxoiFQj9exHMomqbeh3Oc3QzlTgPScPed+DHI6mJmV
 ycgG/U9B/z5zboW/vbZHAfw49bmGzL8yJBAFRoP/dku3cFsijMmxSqWWSOfnVwX+5ltXmFnEWHC
 sJ2gc3xizH+7pm5bNNslxX3PKK4itcB5ve7qIVMt8GwR9ktuN/FldX4FNoiuwyhaQnVVSPRyDwk
 JLVBDNq4x+QIIiyodGkOrqBfe2PBWtTW72aDuELfAVgBFydYHrFtzp9QRUjHcsQh502wQ7tOgkz
 C3+To=
X-Received: by 2002:a05:7022:4398:b0:127:9e95:a2f with SMTP id
 a92af1059eb24-12ab2838ba5mr218916c88.2.1774565662829; 
 Thu, 26 Mar 2026 15:54:22 -0700 (PDT)
X-Received: by 2002:a05:7022:4398:b0:127:9e95:a2f with SMTP id
 a92af1059eb24-12ab2838ba5mr218897c88.2.1774565662265; 
 Thu, 26 Mar 2026 15:54:22 -0700 (PDT)
Received: from [10.110.108.41] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c16ee39627sm3608032eec.30.2026.03.26.15.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 15:54:21 -0700 (PDT)
Message-ID: <7927329d-68a5-48ff-9a90-3c010637c643@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:54:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i2c/aspeed_i2c: reset and migrate pending_intr_sts
To: GuoHan Zhao <zhaoguohan@kylinos.cn>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260325085450.126595-1-zhaoguohan@kylinos.cn>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <20260325085450.126595-1-zhaoguohan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dw5Zf0KNl9Zqgf46GfZbLRgBi5VNXbRz
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c5b91f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=54KzJIt8zcjPWxL9LpEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Dw5Zf0KNl9Zqgf46GfZbLRgBi5VNXbRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2MyBTYWx0ZWRfX1QXZglTIHmS3
 b1KZPeBF590bo3ZFE/oC7KV/1paULEbKkhEhS/o4ttW0lG5gXSaNLMr4PD3GMZtNdrFEFZRAn53
 gtr5nNdfnKEHkfoSAr+qiPkjuyHNbRbXtYDhpVkljQg4/4vMEj5Bagbc/zTycGyXmrj1/EwFFd5
 1/vASvWPrtvjRt9Wbo00SttJquw9j/FCk7rrSjf5seWbzy45J5mmmrmh30dWvUBQ9xaqkIGs9v4
 zGptZJeYkgUbj4bbcxwMFBGIQHfPWd1PjzuD2LsmP21chZuzWm04q0trqhpYKq9dsK1eysOBXtw
 3S0ZFIrnmzkq88I0e/+xPyzn7XUqqnXa4exBJaXEnYo04ve7yeiVnxoAn99gzFYokRXgF1arolL
 +iCZH8eCnq5e1RqlyU4WQfgQtZ3RTrJtG6zC3KdO1pvOIk6loNw8TxT/yDlLAuH/2SL+LPkPZLi
 +kgKOHGeHw4nfEETxoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260163
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=jithu.joseph@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

On 3/25/2026 1:54 AM, GuoHan Zhao wrote:
> Commit 7e82393ed058 ("hw/i2c/aspeed: fix lost interrupts on
> back-to-back commands") introduced pending_intr_sts to preserve
> interrupt bits that collide with already pending status bits.
> 
> That deferred interrupt state is consumed later when the guest clears
> INTR_STS, but it is not reset in aspeed_i2c_bus_reset() and it is not
> part of the bus migration state. A reset can therefore leave stale
> deferred bits behind, and migration can silently drop them.

Thanks for identifying and fixing the aforementioned omissions

> 
> Clear pending_intr_sts on reset and include it in VMState while keeping
> compatibility with older migration streams.
> 
> Fixes: 7e82393ed058 ("hw/i2c/aspeed: fix lost interrupts on back-to-back commands")
> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>


Reviewed-by: Jithu Joseph <jithu.joseph@oss.qualcomm.com>





Thanks
Jithu

