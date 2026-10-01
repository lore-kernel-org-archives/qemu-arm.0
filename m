Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850C1CA5FD6
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 16:25:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCJbP-0002oC-Ta; Thu, 01 Oct 2026 12:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCJbL-0002nv-U9
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 12:25:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCJbK-0000rQ-6m
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 12:25:43 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691FsfLM3987295
 for <qemu-arm@nongnu.org>; Thu, 1 Oct 2026 16:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GEj/Oc2ezBaN1BatLMv4h5m2yewynecrGZxYV8tOi/c=; b=aqZLiVqj9Ax8Djrj
 dkUu/PSIgJhTWKcNXNifoBt+MvZL6NEnnvn/k+OtwyXr+d4pWPUqwlbSY76zPLAF
 nweqU1FiLODUKx4x5SnCkICUWbc27LT7KWkXuDUEC8Ii7qelNUXhLOh1tZRHjFGP
 NcWLo3Q3xKPKKEq5reRenrHCwosNXNRLfTJweUvyiZMxSoIn1mz/8bICPWy/Ho0z
 aNXdRCxpoRatyKvC/TCz7ez0yHsoZ/EA1wW0ZB0bkoHbXeeFZ/adAEl6TElBEbps
 edi6SrQt/dX9jv5WdzkusI4RmwEJi6kpQ6NGQD74gpd/jjyl3SqxVz2nECoNcUKH
 GlX5xg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkjqrw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 16:25:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-33713e5e6daso9542398eec.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790871936; x=1791476736; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GEj/Oc2ezBaN1BatLMv4h5m2yewynecrGZxYV8tOi/c=;
 b=MuQproN87QinOyhOnSxIXux6Q0pr71JjMitvO+5w4yyLPX+OEIjVWDir5qem3dPw48
 RTxqM6hWc7yEMJi26A8LGMkZDwqDhw6gZiGWnZNdScGquweB7PCw4slS5giQ7ANH4yEE
 0Fq7PyR+Sot9iuHQNLoiu1Rwz/GO3vZNO2muRZPa5Br3aTu/M4ET4lVUAbM0OPp7drAD
 jfXvAfsgWBvXaPMb4qFprFDC7rbszsItTrseABzGRYsCFWej5korvskzN/wTbTGNdnLa
 cpXKj2dTdVpwI+gBrQx1C0gWk91rmzPWtKYrKYfOrrdlqONbN4P2p3bCD3wsw5cd0ag4
 ciLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790871936; x=1791476736;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GEj/Oc2ezBaN1BatLMv4h5m2yewynecrGZxYV8tOi/c=;
 b=2X2QY5dlcCvYLgJtk5uBmSa2RTkj11VgPc3QVLvew/PCCJF8HwjRkWEGIkUcI0lgfU
 MDRxcvW/bAaYJmRCUTrJ8Cf80L/GIgioCQlRMa25iRCJYbrI6Se2Z5bU3ks4HWSsjJWv
 x97LS05Ma+H/TGzUP0wQV/ABojMfUHAOSJPo2fLbgTfifiwRisyJIFUPVPvrultgD1XL
 wh6Cc5wl0l4uGt25KMYb9IG6koqWJ1ZIwycJp1v/TcK7eaDunWZff7tfGziXrUkz/w7F
 voZm2kRwHxwhCSTcytBvhfydXMv+SpRc2rk/TKVkQAHUF9BA8lEHOseW59AjF18TzsdQ
 bKTA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzsJ3d3RhvLNZp7prkIWrs+OJABtBhfUrGHJRnYX/2ekwlwbWcnIMx0V7X2c2IW71b2jgF5pShzQA==@nongnu.org
X-Gm-Message-State: AFuF++nUjgpKsagF1arRZL1oioGfExb8MPGUg5kPz4pRFuHBg8CV6/PD
 w8kh87yykJUYDTUyQsMEqVQbwm8zxG4mO8QVLX1Xk27vBBhvc0Xcawd3he5Ntf/lXSL91t3EzRp
 ucQBbiGf/zzNLJONASDRsE8v/i/CEuQx6wyHeFj4sREQxWAu7ZVlmoyc=
X-Gm-Gg: AYBFou0acd0eITuR5+eKjGvMAQ3msi+CdsEK75PfSa27pvARxa4vmFOKjVmAf8raFYE
 AHbcV5M/1xeKCRjyDkI3sdyFr4Ij/tDfFxlHlU6KIy4Kjd7u0iFlfJ0iM/RcU5CV5WhVLNMiqCs
 XN5i/ZT6fdIvmpq9ob1OKqj1cV3ecRNDoqtvqEX4W7BUDK1lNDpjblieiiIETZho3U0meKcmv+U
 qM/QChEaZDDA1gbFFMmfHByeEO2yLCUZT6KYYcDkWXwN0xEwzg5powhSFlnwHEEoKnJ3eZViUXs
 0fZ6eMvN/R+GzKMV4ii7zN1fXv77w8WXUTizeL1nRIqK4ydTAiq/T+Fdt4EA/jjNA/XLPbS3W2G
 XBYw/9sKfsCa/BseOZ32eiSPh1VbT2w5YswhycJ/ZdWH9Dah6uKM4FVrTzAA4WtUhhXahbQ==
X-Received: by 2002:a05:7022:61b:b0:14c:efa5:ee7 with SMTP id
 a92af1059eb24-14d3204e4a4mr7120487c88.14.1790871935818; 
 Thu, 01 Oct 2026 09:25:35 -0700 (PDT)
X-Received: by 2002:a05:7022:61b:b0:14c:efa5:ee7 with SMTP id
 a92af1059eb24-14d3204e4a4mr7120455c88.14.1790871935075; 
 Thu, 01 Oct 2026 09:25:35 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f27088473sm398751c88.10.2026.10.01.09.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 09:25:34 -0700 (PDT)
Message-ID: <f5b60b8f-f65f-49e3-b4bb-b1ebc92649f0@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:25:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/tcg/i386: Build test-i386-opt-shr
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: Dominic P <gcc@gcc.dp11.uk>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org
References: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
 <20260930185124.3036980-4-gcc@gcc.dp11.uk>
 <1bac23ee-6370-490c-bab6-fbd17d437fac@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1bac23ee-6370-490c-bab6-fbd17d437fac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2NSBTYWx0ZWRfX7he/aWNkBEQT
 IqAa0YcqFrfex04RcX3LRB2rlh/qIhOPsyx2f3/R1AnYpdhHjWPfls5Ftvqsib3YuIWFQiGTIpA
 5RtbXpVsuHBmgmhQ08d+GKNzHE7JNSA=
X-Proofpoint-ORIG-GUID: D9IuHtiyZA6irCGMR5LpeW6OrwbxInj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2NSBTYWx0ZWRfX8l4E1DeansSn
 g23VokO1XhOkjyBMQmqKovyBeVyGsH0xRSt2B4mDqWyRzkktu27+Za2Y+srHpG1Vv8bIDT5KBay
 Dc/rYMnugleIW7k3C0td7nHn/EHbKJUfGzPsN4YihxXhYb9yOPdr2oR3gqavBlJilc4ELurTKNH
 W+QTI5OzUmFaQuLpx3TuCe0TfcXHFVhSE8bftL9EC5zscMoGZKaEycRJm1KFKL2WgLGUrN8dAWM
 Rmph8l/+TBr4V8JbbSLqnNA/Zs+W2ON+zqLWIil9F0hcxb6hISdCDOjHnm5CmQAtQJpX89S0WL1
 Q292bNWWhGd6Z+rUrRABNkXVTKIcxqUi4g3PwB2/+/WP4TON0JP5gzU3JlsWOlax/rxIOgosfZn
 ORfOa7AovpLuKxFudVVeNlGbNw/YAObc3GyT/oUmVzUNomYf+SjjlB063Mv4WFmS8V+gaEw7KFU
 iuhNUQiTMVPBpD/CU/w==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe8981 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ohd7FOC1tvnkoCpmqzwA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: D9IuHtiyZA6irCGMR5LpeW6OrwbxInj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010065
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

On 10/1/2026 9:07 AM, Pierrick Bouvier wrote:
> On 9/30/2026 11:51 AM, Dominic P wrote:
>> The old Makefile.target built every tests/tcg/i386/*.c.  The meson
>> conversion lists the tests explicitly and missed test-i386-opt-shr.c,
>> which 5fe51606146 had added in the meantime, so it is no longer built.
>>
>> Fixes: b4e3e90d61 ("tests/tcg/i386: user tests")
>> Assisted-by: Claude Opus 5 (Anthropic)
>> Signed-off-by: Dominic P <gcc@gcc.dp11.uk>
>> ---
>>  tests/tcg/i386/meson.build | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/tcg/i386/meson.build b/tests/tcg/i386/meson.build
>> index 4152371a3f..26bd85c05e 100644
>> --- a/tests/tcg/i386/meson.build
>> +++ b/tests/tcg/i386/meson.build
>> @@ -28,6 +28,7 @@ tests += {
>>    'test-i386-fxtract.c': {},
>>    'test-i386-fyl2x.c': {},
>>    'test-i386-fyl2xp1.c': {},
>> +  'test-i386-opt-shr.c': {},
>>    'test-i386-opt-rol.c': {},
>>    'test-i386-pcmpistri.c': {'cflags': ['-msse4.2']},
>>    'test-i386-pseudo-denormal.c': {},
> 
> Thanks Dominic, this indeed has slipped through the cracks.
> I double checked all the rest, and found one missing test for hexagon too.
>

For information, this will unfortunately conflict with current series,
since opt-shr is added after opt-rol.

> I'll pull this patch in upcoming tcg tests PR today.
> 
> Regards,
> Pierrick


