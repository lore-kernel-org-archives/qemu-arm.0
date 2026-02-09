Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A5CEF070A
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 04:54:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpJHj-00086V-LK; Sun, 08 Feb 2026 23:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJHi-00085q-Cx
 for qemu-arm@nongnu.org; Sun, 08 Feb 2026 23:54:06 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJHg-0004H8-RL
 for qemu-arm@nongnu.org; Sun, 08 Feb 2026 23:54:06 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2a95bfdb31eso8483265ad.3
 for <qemu-arm@nongnu.org>; Sun, 08 Feb 2026 20:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770612843; x=1771217643; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0QomsFYmffLkEMnxqCyMdufykr7r2CW8GT+jtuC4I9Q=;
 b=m4FRKSYI7ujALw8dRexGTGdn64PzBsGqPmUiQidic0eePrMvfNF73JS1/yrZgjBvzF
 KDH9QmzayCUkamAWWKZOc1tz4U1GG74j3vC5D92dWfGuLcLN4jEPzNQEi4xJKvqzwwc6
 Ei5oRBHhT79Ch0Bu7tw63PLe7oTrwRtORuFt12ClN1rQFfpxQlPtyS3b2YneGVbDLdVp
 cXTfxx4XHrgnozySD9WldIv4jXSy2Ydr2Hhv+s+l4MFn8/+tiSTTfkF3Cl1SlURFas3P
 uhExbLW4bzQA0C8ZoDOWvGovox5m15dDKpD7W7SMiKKECYSKnRR88s7kT9NWG8XTl2bp
 vK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770612843; x=1771217643;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0QomsFYmffLkEMnxqCyMdufykr7r2CW8GT+jtuC4I9Q=;
 b=SOgw+wxM1nXnC2wWaHXJT/RR+g6xFH92HXji4fBRvhpUviuHUmilU+1kCcvMLc4c1j
 FQsSEghk8SvywxwDxIRQb2kSKTBzo3JtMSGx3iAkl5aEgMbkUT+NVV+KBvrYcU7wxMeB
 WZhKs04bv6NsLcLJNJNk2lytFLTuFPqqXQgdyDXhweBXmfELduPM0VdGeX43ffFlL0al
 ziBhKin1yNFmWtWUX4NP/O8FbXJZ8jfnIQooodj09vyJQAuLE2pO/rJkHCuIPEVMl3yC
 thbf4j99O1Xb4MSydCoIz/E4KXRpKPeZPHp/MG80fE5/FWjZu9olG07JUfgOUXn1p30m
 Vt1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU06DfAhEUGlqXu9X5tm6t9Sgnm3GmZI4/PpZoWkqW9eGNcxLpwSlm2X4iQLh8tSSJxgPlY2RJRSQ==@nongnu.org
X-Gm-Message-State: AOJu0YzE9ZBPgQ09ccV08JeWC38kNxw03wSUUElgFic+9BVTzAHg5CvJ
 2jeMVNjy0MhPamZfDiaRtJP1sV1mrRPVj+u9fsljXaRUqlBz+U/M0kp5nLRC4BKZo0w=
X-Gm-Gg: AZuq6aLFkrRaT8W9RLSCWsX0EDlhyqlFwMpbP+8hKvfyYrs6bpp9KLSPLbiAlpcgVaX
 XLR6TbNA0QqQ2VHc3HkNAQMAtP7BDuGiboEj5+7o0ozg9uVvFvZStSr/ogO0q4UMB08ddHyGWLo
 +ynt6Zs5YaKA8m187fK+FqOAHO4lIOX0WYuVg+D9N0VBe5pLM4aFkEQWtLLJYKGcszRm8ZPmoxD
 BojSt2uYEgvvafgEwjhGVbsO739Mx4UvJwbcDhxzhXsr07acmHrTxOqaQOaBIFvjjLIVsYFV2RR
 x0Ms0f1j/QZFVIV4WSqd3WS1UPEdV637nMo0vTuFJpP4c91ZcuKu6LEU41AtKMd23aGUjXB+78G
 0+6pgsSdbQkOwM8BIMdLIviJhvdi1TxGk1V2HadlRW/h5Mh8n0x6YeF+ofu8gX2riGLa4PxDVPk
 YlgKPYD6EcqpYXy1HZtcaLVJTMP0XcVMVroFylNLig8WQpytcZWPsQIR8qKVTSgD4=
X-Received: by 2002:a17:903:19c8:b0:2aa:dd98:197e with SMTP id
 d9443c01a7336-2aadd981a09mr37260045ad.51.1770612843118; 
 Sun, 08 Feb 2026 20:54:03 -0800 (PST)
Received: from ?IPV6:2001:8003:e109:dd00:9c4:a3d:914:f9b?
 ([2001:8003:e109:dd00:9c4:a3d:914:f9b])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3549c09ff2fsm12553540a91.2.2026.02.08.20.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Feb 2026 20:54:02 -0800 (PST)
Message-ID: <3391dea7-05c3-4e9a-8ce6-b013b3615406@linaro.org>
Date: Mon, 9 Feb 2026 14:53:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] target/arm: extract helper-sme.h from helper.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-6-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260206042150.912578-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/6/26 14:21, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper-sme.h                            | 14 ++++++++++++++
>   target/arm/helper.h                                |  4 ----
>   target/arm/tcg/{helper-sme.h => helper-sme-defs.h} |  0
>   target/arm/tcg/sme_helper.c                        |  3 +++
>   target/arm/tcg/translate-a64.c                     |  1 +
>   target/arm/tcg/translate-sme.c                     |  1 +
>   target/arm/tcg/translate-sve.c                     |  1 +
>   target/arm/tcg/vec_helper.c                        |  1 +
>   8 files changed, 21 insertions(+), 4 deletions(-)
>   create mode 100644 target/arm/helper-sme.h
>   rename target/arm/tcg/{helper-sme.h => helper-sme-defs.h} (100%)

  Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

