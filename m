Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC24CA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 20:39:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xC14h-0004gR-Ry; Wed, 30 Sep 2026 16:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xC14e-0004g2-NT
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 16:38:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xC14d-0005Tq-1r
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 16:38:44 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UIQqS71210297
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 20:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Skp8V3QNb0VTWdC9jHILIB80vtdjxYqtIyw0RhGaKJk=; b=Ki1Gqm43udDm9LMY
 55kgJ5DgRhvpqaIUiTGcD0Dv88udM+w4zS6LRqGQ0M1WT2LUbLqUx36+jqajsWlw
 9Edd3OtQoXrK/CFJIPtbTCveb0jTpP5nPTd5z8kaI4dmGqyrkDEieKp4iCCSdpRn
 1fx8HbvhoURdGFWysELqId5KtWbcXdARWIWeYhVyBMd329gNV5mXOr89jFh1qiIl
 5RZfcrE6HvXxeUDElRahvUad/lMD6O9M7+LNn1kaQ22Om7DJDcG/MDPLXAmcdacc
 CybneR3Qn+I+u7P68oi+N6arapD5NBblJ5PhGpuY86gZKarpPhezc/rFuy4AfoHL
 dOIl6w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh82xqy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 20:38:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91789a9107fso40567746d6.1
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 13:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790800719; x=1791405519; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Skp8V3QNb0VTWdC9jHILIB80vtdjxYqtIyw0RhGaKJk=;
 b=Ln0BI/WT4GNBB6TQQcmAQU35Qk93Zicq5nVchUVVXopDrURSSiSuHKPemMEJPXbyHo
 /7u2UuMzRdv8miqhMKJFof9Yui2qTjQ5/2X282Em4o7vzyAfCLpzbKiFePMUyvR9DBWg
 5Ou83Lgg4C6Ew7mtTAnwZ3uIPM67up5SXnSMqlewKohaq1wGMoL6a8v7NeNVSL1ov7T7
 1xITBIZ8XjsFIYkgWFElMPOCiWhzGLZRUualArt8JabNH4zLu96NK0WOhhgYr4GWJrUb
 7wmaQe6jY3pAXtHoedo/GwLYT6+Nq3xZPkhLIP8PGlHyGEITa/sS5bbnO5EyvkxapJLy
 X/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790800719; x=1791405519;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Skp8V3QNb0VTWdC9jHILIB80vtdjxYqtIyw0RhGaKJk=;
 b=NzdY9vMPdnpQZNomi6YGTTiv9CYLRdXkEpyJ8f11yLTRCwfl1Bv9MTOPoBFr9ql1AV
 xI1AHyb1RVeA5frs6chiJTwQXrAjoffH3+j6F74YazooC0UnvksR2Sh8f2VEXRIpur7P
 xmF1jLoRMCmxcwNaLzPrAHqKgS26iuI0l4YGCBBZn91fWl3JRcWI+ZcCEy006IJU2Xao
 oLyNzBzuZ1HtCt0tb+OcHe2L8VAqbRdXQVjvH/lRwcwmFbAZv9m0vHWXsNKlXSU2M068
 2giDI0zijySRjWvsWlcDX0f0VPWAWM9c5aV1wkMsyifeBMj2ILQZ7s9JM6hwzr+ilAtg
 7LFg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwMibcKX2OSeXyFM/w4zxyMxvkzjP0F7xbxliIFEOkWsAekp7viHmhT80QdhyeTFQiUniW7cV6EwA==@nongnu.org
X-Gm-Message-State: AFuF++k4ByNI3qwDxM8iwXFGrrOsbiXB0jOJL641ZU4eFbad1BkDEZlm
 ESLtLHXmu/Ytn3l0mhxYQLeTkSBxUwBdew9ym2aCROzkZ61xGU/F3HpmZ5jfa97evgmf6yMnHTh
 435BsyjswaG0Z3jaHHWM90kb1p0/WV5DOn5X+5Cnrz3bItxSnRVmoR/g=
X-Gm-Gg: AYBFou33/aSBs08kHt0Rp2TxX1KoK43rmXZc7gEZrSi7WEW9XLf9sUMYGpxXp+S8CxW
 aNx3WAC0GF/dGHK784Cxl7CJaI6AxEuK70XrNLNGnkJnHCIELZkslQ+i4IG5beg8BfJuybfop0i
 0jurIgcUdWjvTGnJWG1ShjUoN2gPyOjy00vDc7F2ASDVC2s7sRcGLpwJFVYqwE9Cj4iQqEqiLmL
 11pWHewme0GzwahmyIeMRmen9jGVVKtzt2UFWoqMT6uTmBYDLErgQJ1Hwfr4ml9qM9sDHJRGEC2
 Z8TJ2gbDOVRCQ0qSQso7xoIut9RL6kOok4mIq4B8XFpZxTGjePvFAH6LB78As/pHyVHS6hUBNMd
 b35VfRwzzrfs09nhO1A3kF4EJ1aE6mGxSNQ==
X-Received: by 2002:a05:620a:258f:b0:936:e18d:763d with SMTP id
 af79cd13be357-93ca95e6ef8mr493018985a.8.1790800719204; 
 Wed, 30 Sep 2026 13:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:258f:b0:936:e18d:763d with SMTP id
 af79cd13be357-93ca95e6ef8mr493013285a.8.1790800718619; 
 Wed, 30 Sep 2026 13:38:38 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068bc9b1sm1668615f8f.4.2026.09.30.13.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 13:38:38 -0700 (PDT)
Message-ID: <3d020687-5d00-4aaa-8c77-4d73ae8c105e@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/tcg/i386: Build test-i386-opt-shr
Content-Language: en-US
To: Dominic P <gcc@gcc.dp11.uk>, qemu-devel@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org
References: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
 <20260930185124.3036980-4-gcc@gcc.dp11.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260930185124.3036980-4-gcc@gcc.dp11.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4NCBTYWx0ZWRfX4fdQ5Ohmy3c+
 Zuq3eyh78vWL3UDIRILAc4Y2ZDyJVjhuEU0CUE5TvdgBNjEFA4r7dZ8N8ijXRTQZCk1013Yacuc
 M3xNVfEpqr+plsp/cgHWXf6kX8xxNs6Srn2n+sdp1MbDap/nq3f7JBxyH8h0d1TFcori2BdXZun
 fjd6akAqjTxwbLXwaJOBAIK0TG5Lbva9tgBF8qwbdD2Vec4+2RJx+KLVe4npsyIl29/Rh7rwbXi
 wIOatq1MPx6qotkrvlZTMp6jxbExRlZyYMt2WxnR4GUx0HPb+aR4490sr4mMBgsAXu9Ro/Pa8zN
 2N9gBGzO5EPUqumtbCl1qxp061qvxJGm0tc1fxTB94lYgoF9KKyjg7tjt+A3kwX1aPNxV1Wzdzy
 TxyyV38yajnDl/8PymyC1xTYAHPSi1qH5UWE/Ba17TCXnraRzZP0+VxycljJVPe9NY0p2NGRLb0
 V3RZqiC0a2WPWlSox3w==
X-Proofpoint-ORIG-GUID: hn7alesb2AGUtuSrSl4vIV9n_fcV7ScQ
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd7350 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=yuWYNVxf1J2BtR792vMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: hn7alesb2AGUtuSrSl4vIV9n_fcV7ScQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4NCBTYWx0ZWRfX6yKlk74LWRrM
 ztBWIw8XJqUNKjCShrPQZB0NiByEhiT+/pNir1hPBEawyuaJf7ig0UwVckBHWHIy68cxzJEMa8L
 NZb95o+Y5r7BR+um0iJM+YPXeTkShng=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300084
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Cc'ing Pierrick

On 30/9/26 20:51, Dominic P wrote:
> The old Makefile.target built every tests/tcg/i386/*.c.  The meson
> conversion lists the tests explicitly and missed test-i386-opt-shr.c,
> which 5fe51606146 had added in the meantime, so it is no longer built.
> 
> Fixes: b4e3e90d61 ("tests/tcg/i386: user tests")
> Assisted-by: Claude Opus 5 (Anthropic)
> Signed-off-by: Dominic P <gcc@gcc.dp11.uk>
> ---
>   tests/tcg/i386/meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/tcg/i386/meson.build b/tests/tcg/i386/meson.build
> index 4152371a3f..26bd85c05e 100644
> --- a/tests/tcg/i386/meson.build
> +++ b/tests/tcg/i386/meson.build
> @@ -28,6 +28,7 @@ tests += {
>     'test-i386-fxtract.c': {},
>     'test-i386-fyl2x.c': {},
>     'test-i386-fyl2xp1.c': {},
> +  'test-i386-opt-shr.c': {},
>     'test-i386-opt-rol.c': {},
>     'test-i386-pcmpistri.c': {'cflags': ['-msse4.2']},
>     'test-i386-pseudo-denormal.c': {},


