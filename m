Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1080694njb;
        Mon, 9 Sep 2024 15:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUImC9iU4/8eU6sW9SEhDODZv16X4/+XSgvBsQE0JXgxRS/CIJp7qFvUe+F+RwxZT0jr15KPce1CiSz9w==@linaro.org
X-Google-Smtp-Source: AGHT+IGImHJsGZkaTG4/ILJ9K254Bf1NTs5Ul14geTI83t47OWFlTO5RHYmFAc/GX+qo9xZZrp7T
X-Received: by 2002:a05:620a:24c6:b0:7a7:e45e:7068 with SMTP id af79cd13be357-7a9a38cacf0mr1148830785a.34.1725920552353;
        Mon, 09 Sep 2024 15:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725920552; cv=none;
        d=google.com; s=arc-20240605;
        b=JLdf0pzCJFH3UzfYefMrzGuwVc21i8kfc/JS8zVfftA0qx/xo56y6xGLjXre97ieoo
         3as7BlNn+x0KGUusN2tGOjZ6B+fLm5XF6FtoVadrb2BL9k0oyfHGdtwlwmbBTEqQFP3z
         prH2NgRHDT7+L57HTykxg7WE1cH1cIlrJAiCeOQBGoFT2g/2PPpljWrc3l51XkpSGbLI
         l2P6BbApgVlsMCjyHniZvVrue3F7/vXhmQQdJhMz4UHpy0Ld2wVi9YPwkNI7rQIdotb5
         OYYYcbhCroh0ZcpWLOfK86okmbnwK96yzn4rjTPag/GbjGwdCyDN8sXvdz1Ery/TB9dn
         HeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BhmLtNxKnRykV0PGmm1TkF6YvHoD2/t9qGUTEXRjJ7w=;
        fh=6kRp3K1jVRJe/0go9qIIcZsa+Wj5WXzmWLQ1QEnOntI=;
        b=CLrBQ8IFB/Ed+ewl/bpupRBzSg2/iKAmtTw0JNk7fRXxWqWXcNnSx0MJLeGcIgnFV8
         9u9BMt/ESzqt9FQU1vnDGCjdFgv5jDV6hmPA5azTXbGIsw5nprukiRu09e5CZnF4QHsP
         jxnWTQZ94CybKP+HH1jq9UXXZXo+4G/33WAPl+Tyw1CkKE0HRYZLv+zVIvXCBgUxVcfl
         doqMQLdcB7dGzmgHFMgzSWZLSSaj4H9796XJIdUGnnbSUxKMjhNJeG+73gjiAYZrTNCy
         sp9yQeIeFjI80MYLFMSQZrUENjOQ6uLdjY2cS9lelNDMrlUvrgcYswGiuYG7y7+/+Qw7
         t2bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gK6GXBRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a79c6a33si636220785a.30.2024.09.09.15.22.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 15:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gK6GXBRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snmm7-0004oy-Ny; Mon, 09 Sep 2024 18:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snmm4-0004mv-1k
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 18:22:20 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snmm2-0000Vf-BE
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 18:22:19 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a837cec81so210404866b.2
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725920536; x=1726525336; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BhmLtNxKnRykV0PGmm1TkF6YvHoD2/t9qGUTEXRjJ7w=;
 b=gK6GXBRYv9oj+ySlg5v0pHYcWB13I7oz0y9u0ae1g8cPC2MkuXhbtTwu30/dLpfLIB
 osM6TaCjz3hG4eOH1MHIId5x4Tz7Bg1G+cnW2lbr7lB6uKPCPtwEUTzhjPVbyUyf+ADm
 VCji8+DWo9zDobo87L/69Qn2jDhUpCwDqLvTrRRpQhZHlki1p9D2Mv474bnce7S2rK5o
 oiEn8vfa6O4PbAHca+eywACSBU51oqD+ptEgjaibj9Gz6kFe66nGeFOPP9q9owoPD+CK
 ZnPFz/Kg3mp1IlvaM4Cz3yL2hP8goKWAUn1eqZFZu53OypEdmPDPz1nQMQOYlPRFeyPV
 z9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920536; x=1726525336;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BhmLtNxKnRykV0PGmm1TkF6YvHoD2/t9qGUTEXRjJ7w=;
 b=pbSnxeQFWxj+31GkGN7XCSc6UAJH/fO3CSsoyl2EcVBv5chBIBG4EWuX9MeZ5bpfLy
 mfW9u+iTmKaXJx1UVEz4KW0ZkEu7RVdS8XX+sFiegfkScxKRNqkuq8Da2k/71AHrClZF
 TXuY+daqDkMM8lbG0LsLeDcjTC4R21HY7ow2kr5E90ehb2pPoGR/NJR7HxxLWAuCZzUi
 HVWVrGB6V/eWYGZa72Bgwz1oANQUYD7uVpzyWVdovhsdbvPsYRa9G5t/4TPQoPJSvaRp
 WBto9KJv4aD2H0LULi2h6+StoJUGGamCWJ5J8emx4g2bQw1MuJfJNgT+HAxaLCcHK5Cf
 0rLA==
X-Gm-Message-State: AOJu0YxPvi/215dQqR5llbooudVS1pH+ZHYRPjPeRDMo6UZWueCCAvKk
 Z8RrJ3dULTtLRcFOIJOBPzdHdHfAqzcV3wXRt5BJj3DXCHeNHmGF/7QBHKl5weY=
X-Received: by 2002:a05:6402:40d4:b0:5c3:d0e1:9f81 with SMTP id
 4fb4d7f45d1cf-5c3dc77ab97mr13050687a12.7.1725920536454; 
 Mon, 09 Sep 2024 15:22:16 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd424dasm3501807a12.9.2024.09.09.15.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 15:22:15 -0700 (PDT)
Message-ID: <2a247cb4-2a57-40b5-a65a-b0766caa5c98@linaro.org>
Date: Tue, 10 Sep 2024 00:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/29] target/arm: Use tcg_gen_extract2_i64 for EXT
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-6-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240909162240.647173-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w5z62hNQl0w8

On 9/9/24 18:22, Richard Henderson wrote:
> The extract2 tcg op performs the same operation
> as the do_ext64 function.

I remember this one:
https://lore.kernel.org/qemu-devel/60f76a76-709a-4f32-974c-c771a724d443@linaro.org/

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)

