Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7BCFF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFDR-000698-3s; Wed, 29 Apr 2026 20:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wIFD1-0005p1-DR
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wIFCz-0007Ah-QK
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:24:51 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63TNeVB5831469
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 00:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5Kkdc3OQFPGK6WIcxjNrvWLnswrUNrhK1wroj+ZbsJ0=; b=KHRPdymNUHpSeqq3
 am+Dnq0eD62STgCJlu4xlNTBzEPKDHvL9Lidtqiawl1ZRmzeEd7lexzDx8CUwopm
 nvYnxaG2AwpTtqNyqB/CVJfTANJCuBoORZ8SWXJazL0KTPfiVa/Onxi0gX3XRM7I
 bQG0pQRbcyoHA/89P0lNZqq164N1B0dRTeu0MLrpfv3U3XfJdRxSmsjdrB0STY7K
 vWU8LFqZ7QRoUjOlcgjwhpq42z3Lhk/Ezp8dNlqdc6PpXoPueNO42vZSVT+wqN1T
 8ERtq/+XMEhVYqLLh0F+FhcN3nO1wZ5VqZKdx7RBdQHGMFaIlpbmC5eIzjUuyyQZ
 t+XjBg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duuvb0353-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 00:24:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-12c20d5d7f4so712179c88.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777508687; x=1778113487; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Kkdc3OQFPGK6WIcxjNrvWLnswrUNrhK1wroj+ZbsJ0=;
 b=HGFunM0QBpI5Tnu4O3x4H4V6fAQPN/gdSfk63z5dpEVzhSdz/dTx40NddNzvLVa5KN
 n3oIRDu/5vXTb9EA5g8S3/Fmk1NWIoRA62vfU4iqpMVw7rws5faC5Uq0vcInxGNDq1Tg
 iKH/BJgVt/EMtlCSog870EJnydRajepSJyhIHJSQRPwC0/DqsVsQcIL7BCNtalW4GU5U
 rygQSFDWshFGyNSyPLnpjetIfa4R6XsWR6M4kz3OUUKl5iRdNG+qZN3l0KwwOZAR0FKB
 GJHek3uLeaVH0mT5R+b5VHIKDvjfezQOJ0CvdduiWNtcHAUl5CUrdOwah7XLTv9/0Knh
 hRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508687; x=1778113487;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Kkdc3OQFPGK6WIcxjNrvWLnswrUNrhK1wroj+ZbsJ0=;
 b=BHWvTyrMm4nrSoE4Psxk340pe3q4HbCMT1hsldTgb/oztBHp6sTUtE+EVLc0Bm44d3
 oGrAe/rOelgngdnpUpJ681uvmQK5HrAsYQChRyhES1gN6NtvTSg6DsBerK61Pwc544O0
 f3serKAYb5rxXD4cuPqdT/BRV5s/drjc2JRNSqYWaSXfvmlCAtYpKXr3YrRynn/jQIfQ
 z+90jYTBM+7ZYPVIDWCa+tU0Jnog2iGBj4EPMwOQPT2zufgUbWjG4wRv1bq8cWSlbVVK
 xpgCmZPwjkCd1mwrrHZLW3inM6CtANQXPq8mCTS0hdKr1V8KfNUrV4qgB5TsbZOfdXYC
 xu0Q==
X-Gm-Message-State: AOJu0YxkNGm0Dqy0C7q8SWKHBtwi5IPwPE9cHqP/yh4UM92cVND0dfC9
 ecEyi4uF4w4uT6zQfDQbyyMc2uggAQeGMrKe8d9ED3sswWpKNkEwUrKuBLekmIpQnUIx8G1oRC3
 OLKVqcKNWqwF4DpckwDTxdwl5vwJIhgyhssTVQgq6Kikmfmrjk5XHsP8=
X-Gm-Gg: AeBDietocXkfocQiCZBc5lT/StfypIyVL3tJeXDH3ywp/9BnTy9g9SCcubCaGkcCs2w
 japxOfCzdDO+lBvlpgxyBbezKHBU5EPoXoqtfLzpjm4H3fYOQ4ZgZJj/F/+oCRMX1DQY/ZGCR4y
 q4Ox+YW6QimUWF4525+/VZk7GqpM9Gw2oW26k7pSr93uLa4Vhmegz9BZcvi3vxo9JEWnTUN+BhS
 JRhpaIZKICLbEpo8isAoZgJ7rbzVHfnbqQzTLa6ozV37frFeYdNlfhQCKBaWZkfAniWotKh6P/L
 RKOWeLcZjfwih535inXeuVz/lTpMuNIh3ge6/s1/48mWI+g9fg6eMPpvnbjxLzWkFknsckmp0I1
 CX3Djh7pErl6slbPAPBAN3p/a019hsAU+Zfq4ZshbXyyT/GeZW+xuyghJZoemSTd64KOWfw1Z5k
 lucbmuh66Ko1YRD4ZDD+cg9r/v
X-Received: by 2002:a05:7022:5f1c:b0:12d:ed19:e6a2 with SMTP id
 a92af1059eb24-12ded19e754mr56834c88.36.1777508686895; 
 Wed, 29 Apr 2026 17:24:46 -0700 (PDT)
X-Received: by 2002:a05:7022:5f1c:b0:12d:ed19:e6a2 with SMTP id
 a92af1059eb24-12ded19e754mr56823c88.36.1777508686300; 
 Wed, 29 Apr 2026 17:24:46 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12de3261533sm5180046c88.9.2026.04.29.17.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 17:24:45 -0700 (PDT)
Message-ID: <ef8e4474-7237-4857-b425-902cb61573cd@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:24:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/47] target/arm: Implement FEAT_FP8
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20260430002046.59739-1-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gn--ZE5MCPwE1-OdE6BSwfocHGWgbBMS
X-Proofpoint-ORIG-GUID: Gn--ZE5MCPwE1-OdE6BSwfocHGWgbBMS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDAwMiBTYWx0ZWRfX8szTTqBNpLT3
 yqA8Flp/6A5d8O/QRAZcUIZpDMMTm4jmhnz3VZahirLnpL/PuwamFDx58nAPjeWhJpyMytSamLL
 ke1C5WvlqttPvdnHK8yNPm+aQTLtgX9cQ4wraYTCCx2SFUIXii9uQMhNS6Y54xLGSoEh7jiKwZC
 XWvt6SVAQo7YofxE458KgipJcWH+qugZc/W5czZxAQx3NvqCteE4ax4Xkxf8Uz7gR/0e3xPqO16
 A3c1vr0+s574WBamvI19eM83DQxRKJ6z1dHqubEp10781MOUD36OKhoU5pSnSEOGF6All+MfWVK
 p9hVrUyo44Zy6mpEshj4QiHyvW1JxKOI8RqonVP5i1s5LfNqDQVHBg0IJQFyub0eJoEM9rdx73G
 qJVsaMHBg2StyTZwwY9zSveMjj+5XzIkcGLIiepJFABK7ZbFdF2dS0kPM9UxVYVIf0VF34ndAKT
 o8AXFkAQgElHmpBBz8w==
X-Authority-Analysis: v=2.4 cv=V+JNF+ni c=1 sm=1 tr=0 ts=69f2a14f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=mKqt3sDg1JzNYCk9nD0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300002
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 4/29/2026 5:19 PM, Richard Henderson wrote:
> Based-on: 20260430000524.56046-1-richard.henderson@linaro.org
> ("[PATCH v2 00/40] fpu: Export some internals for targets")
> 
> v2: https://lore.kernel.org/qemu-devel/20260424043014.46305-1-richard.henderson@linaro.org/
> 
> Changes for v3:
>   - Rebase on softfloat-parts.h, which allows us to drop some
>     local changes to fpu/.
>   - Enable ID_AA64FPFR0.F8{E5M2,E4M3}.
>   - Implement FEAT_SME_LUTv2.
>   - Implement FEAT_FP8FMA, FEAT_SSVE_FP8FMA.
> 
> I still haven't addressed the required firmware update for
> 
>   tests/functional/aarch64/test_rme_virt.py
>   tests/functional/aarch64/test_rme_sbsaref.py
>

Feel free to send me the needed TF-A (and TF-RMM if needed) patches, and
I'll apply this, and send you update url for assets.

Regards,
Pierrick

