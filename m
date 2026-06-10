Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AFCCD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 04:30:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXAZe-0002TU-1S; Wed, 10 Jun 2026 00:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXAZV-0002OT-W2
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 00:29:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXAZU-000203-5N
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 00:29:45 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65A2efQU282545
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EciRQ08qHOwo1uINI2FcN/QQ7G9ZIg+h2VpqMuPVrLs=; b=XkzKK19l7Cs/WED9
 1kyxcb1KbGxk1uDwoifgPW344LZNBjvd7AkSpI4Yb2y05jfLF+cyMg+OshLZ1tSB
 rFmyX9tw1aeotbgoTjnWEC6s3jPerYK4fJRpsEkFOECH1u69ydx0tPr2PNfjcKsU
 50oUid8DOnJOVEy9q7WqMdBxVhwNnPdK6seT4yE6zf25cErsHkE9kWAMyLjMv6Aq
 r5C2gLeRpQpvskzQCtpUudPkCIQSoOv07KJDpMFQJ8BKHgaTTHORPflnFQSnlcD8
 CFcRErFGK9KnSB49QC4Rohok3oEdnAXj3vtjvd8RCp6zmhGxMeED4OJsqfj8vEC9
 8s5xFQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnrpjb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:29:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304df51ff3eso6523935eec.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781065780; x=1781670580; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EciRQ08qHOwo1uINI2FcN/QQ7G9ZIg+h2VpqMuPVrLs=;
 b=U47xy0Ng4HvfzEoPowO99PcSqd5cEAblMYu5CJdkWkUWI+TcP8xLP3J6RP3npTZ2CV
 oYoZbqtrFZabeEFp1w4K9l/hv50awh0Y7xl/GMn6tckJi7ol1+oPFLUsXHmX5SKwSNKS
 pwqW7wjbvW7v1ofOg+KZyMRQ/eepLY++1ibsSYoXo8wko5PFXe1MATVyb7lpECn9007t
 ZbGWeT/oSenajUHi+i6Jm0ORzt0PVw1Th7Nf2I5tBP6DLN4/tZILHbud6twQ4QbwtsCX
 xVOOoiXE1hHGyoUunK/iEDoMKd67/ttmxwgUlPTihwVhIZIIxvLNNTWYXGb/uA5u31Em
 rIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781065780; x=1781670580;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EciRQ08qHOwo1uINI2FcN/QQ7G9ZIg+h2VpqMuPVrLs=;
 b=K2BK3dFvOmXH2gc48CgqcflhtXkE222lOp5kItt+cxsotniwaYFRiL/YrMu6quMN2w
 T6ClhQg6HFwlOB6aRFVejjhEX4+xN+N44CdLCpihP9MUWz+H9VmUXuF/fb3EFe964fmn
 ZbnXyPd9qm7zHxudxshX/QV9BF1UagYGbw6K0U1mKJ5DcLqry8uIQgaX24ZcBEcQIPeu
 IczYkk5pyKF2CHs/rVvJJfTdgGmXMq60pioPPpFOcfSpJDNNWXKjStKOlX1+kyZIt9vB
 f5Zsl+36dci0tbWSxpMuWJu8vq23mQa4r0ykJsUIBJH2oQk2xE7Wdn84BwUJPhxx2Ho3
 fu/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TtcpFE1EOkOlGflif/ybs0EiDmWUSjzfyfuzi+0m44LGzpQPnI3EmetApo7dkk5ZLTshluFf30g==@nongnu.org
X-Gm-Message-State: AOJu0YxlzRzYOf9Tk9eINvTU2nwGpDId0eeKTOv8+gRW0eUE+86MasoK
 I+PVpxi1vI49bBmmEFaQIYIFiy76Gk/er9crEV3PprwMnvxUM5ojQcko2nHtcche5hI5yBfO1vQ
 9LM13zo92nxP3/41nNVeJMOsI191mdKjWX1XJFkvan6fbB9+Kh0MU25Y=
X-Gm-Gg: Acq92OE2n6S1OHyIi5qfNVny1gUdamLgM6Phh0asVXQNz3OP369untpDNEAXbt7TZB2
 bVLx3nOTINeYvMTXxCEIZsCpaRBgytGsmdEELxcEIbEwbpYX+xAUS39vBwAcA+GaucR7yLVXitY
 PlXn3EUxl2yJVDxsUgPlU+shvZcvs5t3yzBceVzMXVLM2aG0w9U1SiCPZdR5GVa9XDS9Ll/FpqM
 xxKzPAmtAV4WwNfVGQp8o4FMG338U5O/pruriBGnZ5m8wkmW7cy8VfTVgs2Pm3Ov4e45OR4Jt2f
 tP/iuVdq0oRaHjV5P5UmfDPzE4p04FI2e9JikFroZ2r+XtHhUjJLG2OH8uC58tJXJJ+01T6hZmI
 B4P/I36IpX0e9WL3YCqOy2PC3DWNi1j5rHn5eI4b6mcxv7sv43VaF6RwYGDcUh5tnAS12kIx1o5
 YUSbwjh12Od4a3hgvo1IbTLVNh
X-Received: by 2002:a05:693c:2288:b0:304:8881:b82 with SMTP id
 5a478bee46e88-3077af0de10mr13940228eec.1.1781065780340; 
 Tue, 09 Jun 2026 21:29:40 -0700 (PDT)
X-Received: by 2002:a05:693c:2288:b0:304:8881:b82 with SMTP id
 5a478bee46e88-3077af0de10mr13940198eec.1.1781065779794; 
 Tue, 09 Jun 2026 21:29:39 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074db5610esm24075334eec.4.2026.06.09.21.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 21:29:39 -0700 (PDT)
Message-ID: <35d9eec8-3629-4039-9120-1a5ae3b6c161@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 21:29:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/27] tests/tcg/aarch64: add user tests
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-22-pierrick.bouvier@oss.qualcomm.com>
 <3d519b95-595a-4a5e-97cb-6116eb577e09@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3d519b95-595a-4a5e-97cb-6116eb577e09@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uaMy7FS72CbEQk440xgvnDvJS2z2EoS2
X-Proofpoint-ORIG-GUID: uaMy7FS72CbEQk440xgvnDvJS2z2EoS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAzOCBTYWx0ZWRfX9zp9kkndrV8i
 vnJRr1lLLlTgySH7MXq6+ucHBbEokOOPskWoXobKxFJoCMRF1oxdE8Fc+FlRbQ9ZuvNcy2jbJaX
 1UhVDgbvlIvpcxVPDwJdkCb/gpyUhylQ7t5PKjGDCchYE3/Q8LhiDmiiZd5pHbvmynal5IAEhIG
 v5Nno1rfjIouVv3sb52R+dW6jTEG3+ohWfXiAL9HooPE5Kag1i0tEQsyGzo+KFs7c8Q+JZUq8ir
 k2aZOnGGXYFKrFU7ZAcWToLO8IDp6e65YWcb9p/4N38uAkOjB9ikNFY/v72dyxHS/Bk1fKmxkUr
 T4V5lWa4C5xH5ITsG2G4O/nlwb5kkH/XE6dcWhjsjSAR2EVBK1Dl+iVai5UtMyBUxC1CLM9wZnL
 TFGw1MxMosr8K3iSDfjCUx24ohZJIxSVvKsg7OlXELRf/xfZtG5TaR/REooAczQwx/EZ9gitNy2
 goH/Khu3fmFX0+dmLZw==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a28e835 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=knnLeVzCTpc433lMfA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100038
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

On 6/9/2026 5:18 PM, Richard Henderson wrote:
> On 6/9/26 14:47, Pierrick Bouvier wrote:
>> +++ b/tests/tcg/aarch64/meson.build
>> @@ -0,0 +1,213 @@
>> +cc = find_program('aarch64-linux-gnu-gcc', required : false)
>> +
>> +if not cc.found()
>> +  subdir_done()
>> +endif
> 
> The primary thing we lose here is the ability to use containers for the
> cross-compile.
>

It's definitely on the requirements list, but as listed in the cover
letter, out of the scope for current series.
> We detect cross-compilers in configure.  We currently write them to
> build/tests/tcg/${target}/config-target.mak.  It's not very meson to
> parse a file like that, but I imagine we could use scripts or meson
> variables somehow.
>

We can rewrite this mechanic in meson directly, similar to what we do
for gdb in this series. find_program from a list of known names, else
fallback to our cross containers which have a known and fixed setup.

The "build_container_and_run_compiler" logic will be in an external
script, appearing as a cross compiler itself, so meson role will be
limited to find a given program and test some flags.

> 
> r~


