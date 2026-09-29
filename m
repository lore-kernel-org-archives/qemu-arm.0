Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA086CA5FB1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:20:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWol-00032m-QR; Tue, 29 Sep 2026 08:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWof-0002pn-Oj
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:20:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWoe-0003Jo-6d
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:20:13 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCE5p2773116
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZuekfKwt877oN9OAleZX0XVsjgv8QM7v9SrBnd7hDhI=; b=U3/2pyMhaEiNPLr9
 yGmQvPzIHAWqKGwq4fuB5oYfEf6HzQDRXWjFf/UQ0RXhqDip6Bb1yv7oNwvWdS2I
 hYaeHsTJVUYiIfMwueRMz20RDOhGbka0ixt/Pu70fOrJiNLOKRGN2QakMHMULpPE
 4wIEZbhrXoh2xjqyYuD7P3S10ZVcPe+zvgpUpshEIiVO05Msmbc20AdsYyuhtHzo
 c7NFgMCP6/qRVPTD1Ri/RZX+wV6Y4czVOEj5J/6yg2YNB0mGOXh+08rJC9KA9EAU
 HTc0eg+AlVyJfD/UEMW9QHGqPTLpKMxi1q9l/6ZYe9lSmsZAQ9syoV74KZPbM3LD
 7h1KOw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0hbbq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:20:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7a8a773db4eso577851137.0
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684410; x=1791289210; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZuekfKwt877oN9OAleZX0XVsjgv8QM7v9SrBnd7hDhI=;
 b=C26CUXyv4BPaREIvEH/4bXX7k1iFGVngZ2KSCXVD3/j3TyVMtyfEdnCECZdPpkC+Nl
 B3/mWmkkBHsoOU+T4aNdWiUKcAkvXfJ1Kt/MC4PjVPD4g9v2OZB0Pc51LFGuRVuNguiy
 BBbH0+yv9TRaofCmsQWqqlQHxpD/EP5hbhGDarJ9UdGx0RLHTi70HNnXf6QYEnYYE2BO
 tyLgrCHYBjbRiG2uWQo6mwrm8aAZky6Y4FimWvs/FPJ6i4pBVj+7g+Gc4VwVO6qY6xZB
 s7/av+Qq+VHiNCJjVWHCRrUEzG4xibuJWlAT2yzzyytD/hq8k1NZsGN5nxT4xIE2tFAt
 tXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684410; x=1791289210;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZuekfKwt877oN9OAleZX0XVsjgv8QM7v9SrBnd7hDhI=;
 b=ZqyySzUFlM/eorUX3hYMTYg+vv0cy+G/l9/FE3AuNhY3+jBQ3dNZ+BK3wsdjzL/5/3
 QjfuHOS43Wh2NBch0IUQBsOHl12aWKdNfjAKM9uaqjDmFjpa1AFRAafGKup1/TUpnqZF
 UlMNdy1aR2gXIg3X6mm9pb4WZZjeirXlzFJJdstDOuCILI5twWOPxPsEbL5z6SaOfbGl
 EaMr/hlQVtvnVch56nCb3hJWeGP6d/D6dEb3zTc2KY4z+nA2lNRhos1lrL2/QQQXnYMx
 7YpyFblVclt5RZUPCkG+vOYcYiKG64PXWNKIi8vX6ECr/7lzFmp6TEt7iZ2LFGjFZfO3
 TZUg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeZoyiWMGjarr+/+HqbYaOIvc/aeXG1d22PiG1QxzUEDyjSMwGe9fFYtdSs1L9ceNlNzUQA6QKJA==@nongnu.org
X-Gm-Message-State: AFq9FYI5wgY5OvufEG8ndtZoxmni0QPQcQWOAIs9JQFmB/eeodgGo3Bz
 iYnj6L+5ZwPbhERRe3JLYP03T26ivUlJ6TUnBC7m0FRI9dCHWWYXhcmyuRALqJ+SCLsQSIIpOHl
 cToq/jBJE803T1SkvzFW3qVrDQeoXpkrpQMcrPU23mlaeT8D21xB8cCc=
X-Gm-Gg: AYBFou0gnJxO2D0IxJwY5MN56MpekbBpmUNdZPmZfSi8X21oNINcOuapJiGPBWF7qgT
 CmXI7hqgjHq/RxiZIPgOPC/DaDx9cuZJot2zUxx20YtzS3UkYG4Pq3RqjKTIJzE4OzUIo07kx3x
 ACq66AAI1a0t+rQ/O+MPqAgoTHf2b1sZw4N/qB5e+jWaTtStP28Qc23Ro1/N5AAZv/H8+W/Y/fO
 RhiEuJasnuuJSW8EMBkf9QDJLQxNzh3HqHNg/U4APDWOUmBBuTC62lI+Vn0mAxjVZvnFa10t1h1
 ModKjuFliQBn/4084LGkq3eFinKRCPqP+bKsF8Tjy1bIZp4OiPsc5dMUMiLmiDllmMojY4Dhjeh
 sBtEIa2ot2XHmRFxmN3Fvr+KXd+wfTNr3wg==
X-Received: by 2002:a05:6102:8489:20b0:7b2:7490:fd75 with SMTP id
 ada2fe7eead31-7b274912cdbmr2299999137.7.1790684410529; 
 Tue, 29 Sep 2026 05:20:10 -0700 (PDT)
X-Received: by 2002:a05:6102:8489:20b0:7b2:7490:fd75 with SMTP id
 ada2fe7eead31-7b274912cdbmr2299983137.7.1790684409991; 
 Tue, 29 Sep 2026 05:20:09 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af509658dsm3230573f8f.32.2026.09.29.05.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:20:09 -0700 (PDT)
Message-ID: <0bde2a11-a2ef-4b99-ba2d-e8bbab4dd880@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/42] Kconfig: Extract config IMX_RNG from config IMX
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-23-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-23-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX2rY/waWrdB7O
 JY3laNqIQReyOTJw1l2hCqZmObxla1E64lqZ6cLTad9lkZ7pgCar8HRipcZJj7u4V751RaRQPwB
 EYZlObVwzZGIg+W6PdLF8b7iGTFq1Zo=
X-Proofpoint-ORIG-GUID: UqfJqDB-E1XDKfIx7wbEUDlSRYpUQTr3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX0OL5Hses2VmD
 e5rrb8pUcppqJEAPLCtoqwkamibwR5avQ/rAkgNVsxob7UHA4XCbi8j6489DCy4eKBRMlr+sYPM
 zJWWJY3QWvRyXoJr+x5kDUK8XPfd0uNs1910EWIAoWN1QdSxEBFYgj3MEHkm59soYnYKDZOF2Qm
 DpCKwQCS8AWXEgCrgA6yRnMl/FnY8IUg4eHRLIwIECRh4h9yss2/2najFaH5FrVe4QrVH3P5Rgq
 d/8CKpOpg2meL6AxxNlw+m9ANFwWy+bctHOevXh8Cz0LhhaYsGnH3WcT8WNEgVusNer8RUsY0pY
 MQkj6Za5IOz+xAD3Vf1Io7ur2Ecl1hI/aAQuddr2B80zo/0rK77JWOG+MwwDt4FeXbkIB1F7Emr
 2cfRH5k1OBPdI1jOHkEGZC4/HLesi2Ro2yPeAzlHyG0xb3BZ/Yx60snqwb5xtTtcFKgnzKV5+y6
 jBeCoEOThLkx85On1VA==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abbacfb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=lY-AFCGOYIL7-6051IUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: UqfJqDB-E1XDKfIx7wbEUDlSRYpUQTr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_RNG to eventually eliminate config IMX.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/Kconfig      | 1 +
>   hw/misc/Kconfig     | 3 +++
>   hw/misc/meson.build | 2 +-
>   3 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

