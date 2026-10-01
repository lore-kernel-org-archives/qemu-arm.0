Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E0CCA5FD4
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 16:08:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCJK8-0007PY-Rc; Thu, 01 Oct 2026 12:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCJK3-0007MQ-6Q
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 12:07:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCJK0-0007Fe-Dj
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 12:07:50 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691G5DcT1677650
 for <qemu-arm@nongnu.org>; Thu, 1 Oct 2026 16:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 44gh9W2SuJdAPdLgdjhvXNRTAIjBu3FctSuw4szmWVk=; b=IYI/DmVDJ6Gffvdx
 SVD66JrJ4vG6XcOZXMckuo8QfoqMSCLS0oYxUm2zFAlNYkLdzXOxWZaTqpJGfC/1
 0bM4tgGOOSj73Vz0ziOJgn7CiTS3FYymW8LzZnN8NQM+e/FwT0OZey/Z8HBvMFhx
 R1uRxuJK37l61eRaGyNcOggR2zRF/qCTImknmnlPGSJZtlcSKXeMv4p+vpnL1QzT
 puxmA44p6NvmIj/geT0sBoPmIg6B6MvtvxNiVIqeEDtHvYdHqsafEjGCg3+BYIj9
 TkNS7AE+FGYLukDjC/OOJBtp2JofLKUB65aPIrgOU4RJ8GxtkoVzem57WeOQ3PO7
 pb/qbA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tqwg13r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 16:07:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-34344599f01so7719605eec.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790870864; x=1791475664; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=44gh9W2SuJdAPdLgdjhvXNRTAIjBu3FctSuw4szmWVk=;
 b=ElGZPxqI56YYCbyrf9g6XMMasT/4ayTKIBGc3Nq8jEZjEEyOq0McsX8ZvG020xUm4o
 lgofr8Ig8T/QZAvocFqu2dV/tcSx2U9MiFU8ME+qK3469RMPDf4fBg21n9MWtyIZq7jc
 9xc8qnEoPaoORD/gcdLVPxr6kQWIVdN0KucJ7lL1ZbuVnv8BOcRfZBvIw0pz7pJn908+
 LeSQMHW3dAEK6CKbcDwXwa4qZL+YclheVdR1HkF4fmdgNJ+QNFaE8dfLOLQGIsRM6Nfj
 hhrJCvcCvPbC2gEBHoaGZBozdD3ebiAL/unDQ/xIhcmljL8m4CyFt4aU65bhWtXNeLLY
 Z05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790870864; x=1791475664;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=44gh9W2SuJdAPdLgdjhvXNRTAIjBu3FctSuw4szmWVk=;
 b=0EnLq/OHrwtT556lxGkjHBTYi9CluIiv78fe5XvOzoahCVJLpjX+iWbI0eJ8iVOIwJ
 agNRQ+eqxh/W17zcOWubFgw8OyBLtrmapQjinoFpWMsPBA0MmY326S36dTiZWF3uI1j1
 8/EwFVwDrLoAvuCRjAjDJ5v+LLbEY3Tl9KLBmEhwigsbWTz+40oiTt2Vi0x6kIhymZTr
 Dt5RBzIwi+f+A9nW1ssNLvv5he3iW4xSEm1xSvSk9K30bQ/ySHMeoXvk1cZWSIUMo4jS
 6mR3oRxcxS8K/NgsW81jsftb6rmbihQFa8VcCQfD1drow9WDKCu57/zN30KChWLOd0tg
 wqbg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy0pOyt2+GyIPGwb5NwPlwvng/10Zg7QNXH4lrfdi8/hIRv9K3PayeiP9RLQ/4bVTxcC6EFguM2Qg==@nongnu.org
X-Gm-Message-State: AFq9FYI67pTI1BnJwsT24KTNh02RlHRof39jNGb9udCKD5goOYVBcNhr
 +FdsUfkUZa+NCrHSZSQ65VV2gBPPAu4Jbk+75/dFvcisAylSVK6njyzFnigPiVJ9pOxhgWh/7fH
 t125ahGxUkKzRPthPHAhoN426vUVStwLZHQd8/pSFHwCP6Q2OZJAsuu0=
X-Gm-Gg: AYBFou1JmaRRWvmZ4S0FSvPBYPyCxGuoRUJCWLH+KMIAuyhdHPKWr2EJsL3MqaM9zqP
 6tSJweeIPhLEJ84qllQQb4H4DyFgQakOlAzGLaQSG0IuC0hlR0zYscGWJSIqgofY9lJ3rVGCnWt
 0yZZWsJuYlmgED5H+eOQrgDVVz6s3oCsxrJRgxNP22MHv/ssRQBwNBwDbFBu8DDL+h9UZbDhm7Z
 Q4O1MMlydX+BDO3nmjrPn8+QNwZlo/9zDKxm6o8/Q50DBKMyHENoZfRSH5kMEW1hUMBh3InCrRb
 mCvgAOLMcjQClJBVK3xSw+nvEjMGXh/wtEwpUfeC/O6AiF8wlYXzyqoZJRJbeZ5FTaVwtBk6HAV
 PKEttyQF0UbEgGQVg6oWyi2lAgC6WfFZ6OVdsSvUN29X9bHmysUfTCbXS68oVGGFVnJq63Q==
X-Received: by 2002:a05:693c:88cc:10b0:34e:eba0:c413 with SMTP id
 5a478bee46e88-34eeba12b14mr577981eec.7.1790870863706; 
 Thu, 01 Oct 2026 09:07:43 -0700 (PDT)
X-Received: by 2002:a05:693c:88cc:10b0:34e:eba0:c413 with SMTP id
 5a478bee46e88-34eeba12b14mr577930eec.7.1790870862620; 
 Thu, 01 Oct 2026 09:07:42 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34ec65ad6ebsm5474022eec.30.2026.10.01.09.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 09:07:41 -0700 (PDT)
Message-ID: <1bac23ee-6370-490c-bab6-fbd17d437fac@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:07:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/tcg/i386: Build test-i386-opt-shr
To: Dominic P <gcc@gcc.dp11.uk>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org
References: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
 <20260930185124.3036980-4-gcc@gcc.dp11.uk>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930185124.3036980-4-gcc@gcc.dp11.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oYH1cPU5j76HtshvkGzqEZq8kTk7kenW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfX4m0wRGgNtKE9
 9XnoypCmMTPxoQM1rqx1XHXOIBV/VBzcA+z5oli3tdISDEmYqCpDqglhDT8ICk4sKmfbXwbN9RP
 nQEpcgYSVLOg+oOgMHPnkm5RuazqmbQ=
X-Proofpoint-ORIG-GUID: oYH1cPU5j76HtshvkGzqEZq8kTk7kenW
X-Authority-Analysis: v=2.4 cv=W4StxhWk c=1 sm=1 tr=0 ts=6abe8550 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=CP7RdrZA_qBg88vvjUMA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfXxjiYxHHrYApd
 GyaruwkTGpaE8m4LC1bCZJGSdG7Wd0yQusapOed6ZLJRNXIwCnlUGbu3aCCiKyJ3rX+pEqi7V/9
 D6asShvAAMh6olAzjumk0+O5YtyvWF2WYvoBZ6ETQ6ZEGkg+ynKamMd/NA3z3ODYZSe501Q5Pp6
 i823cvsTUcsPGB7+zaehpvjDG/rmHkMRf4hsRUhpSRbopHTW/q38adkP0Iq4jfJJypou9uMYB+a
 nfwHLhFt7W2I4O/i57LYH/WSje4TQ/OMcqe8189BxyHYH7MSHyvJDldJAULslPieMgt+mBMVufs
 aKRdngn1CKvml23FcJdWdvvWnsVkXvvRzmnl9bX7UFM2NWqtl8IlkMtiVieGR1AUTITPxfKMCcL
 V/0jk6IKRCOgA6WwiGYffHnvxvhfc2WZIUtrQtQeUgcpCwkaLfkoKayFmToYE5brnMZBKY+ZPGc
 jPaiEBdD0J21GvnNh2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010064
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

On 9/30/2026 11:51 AM, Dominic P wrote:
> The old Makefile.target built every tests/tcg/i386/*.c.  The meson
> conversion lists the tests explicitly and missed test-i386-opt-shr.c,
> which 5fe51606146 had added in the meantime, so it is no longer built.
> 
> Fixes: b4e3e90d61 ("tests/tcg/i386: user tests")
> Assisted-by: Claude Opus 5 (Anthropic)
> Signed-off-by: Dominic P <gcc@gcc.dp11.uk>
> ---
>  tests/tcg/i386/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/tcg/i386/meson.build b/tests/tcg/i386/meson.build
> index 4152371a3f..26bd85c05e 100644
> --- a/tests/tcg/i386/meson.build
> +++ b/tests/tcg/i386/meson.build
> @@ -28,6 +28,7 @@ tests += {
>    'test-i386-fxtract.c': {},
>    'test-i386-fyl2x.c': {},
>    'test-i386-fyl2xp1.c': {},
> +  'test-i386-opt-shr.c': {},
>    'test-i386-opt-rol.c': {},
>    'test-i386-pcmpistri.c': {'cflags': ['-msse4.2']},
>    'test-i386-pseudo-denormal.c': {},

Thanks Dominic, this indeed has slipped through the cracks.
I double checked all the rest, and found one missing test for hexagon too.

I'll pull this patch in upcoming tcg tests PR today.

Regards,
Pierrick

