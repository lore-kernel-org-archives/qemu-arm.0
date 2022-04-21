Received: by 2002:a05:6512:11ce:0:0:0:0 with SMTP id h14csp12169lfr;
        Thu, 21 Apr 2022 14:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd3WFlct5VBveCg2HmhzV9ffaJ88oSaOSmz+75nBrHSAVR4tFwN2xCfqlnMGMHKgZvFAxy
X-Received: by 2002:a81:8843:0:b0:2f1:502c:def2 with SMTP id y64-20020a818843000000b002f1502cdef2mr1833416ywf.515.1650577085117;
        Thu, 21 Apr 2022 14:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650577085; cv=none;
        d=google.com; s=arc-20160816;
        b=Gvzljg7I5NLcFHUG4n0SUG6GFXjgHM9gHbExK6l9THAeeV5y6YN8xTtgw1jofeKZQx
         uLmJHgxaGHESh05d9YSm2Xvfz/cJqrpo2F7hcgVXBWSFxcMdRzos4u6grqvAynRsvriQ
         f8eMIQ7bIBVGTkW8/WP1iCtRyDKh4VxqLI7qkRGV2WcIMMxfa+p2IQA80yPkS0fV14K4
         chgKE3MVjNEfhKu95rXHhsVZ5+1zQ2THWk2pq7B+JdCJalK4KIaS8PydwmPB09QRVfr6
         KKoRdCDOjlvCe3TcGGGsa23EgDbZnOl80K8KTDswSNOm1ghtmx0TAL6lF/ng93589yDa
         olMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=X5yCLDEtXnwTfceodqe/0kxx1G7CJjLYhHQhq5M8jTU=;
        b=wbsGB83RjmbEnBTRo6TUyljsfJLrDfy5E4e8k5Rn2NwiRWKKoz2POuQRnV8mBIr4v8
         USXyjaJQeOPsCo18s7WjoaDX26ZTnI2NfCH/JmCJ5pKzJOlEYJfHCbU21rTvZ7xa2sXb
         TpNznir98tNs8WaB280hz0c4q2u4DTtX03TjxD4KzsEuh8X41yT+Fk9R0tHU1EE4OBp+
         xRtVXwA1brApo8XRcRvdSxR3V6PCj9PMSKaajt2Mh4n97eEineTpZwl12dPPqSpdtoSN
         ByxaVtGyaiwoxWnwIojFxzGflyzaKoO6Nzk47LlqMuSwJDwY/wzKYZnSm68qOSoX2BaR
         dxRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pmLeTDRk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r188-20020a8181c5000000b002eb5b74d8ddsi4053603ywf.158.2022.04.21.14.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 14:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pmLeTDRk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nheV2-0003pA-IH
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 17:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nheUV-0003mX-Ub
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 17:37:31 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nheUT-0006uE-7j
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 17:37:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id s137so5725265pgs.5
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X5yCLDEtXnwTfceodqe/0kxx1G7CJjLYhHQhq5M8jTU=;
 b=pmLeTDRkWStelTBV66tiQI5LGyR0Pp/jzT1j+oz/p7c09s4TtYwbtbCcwSBJwmoraY
 1Cbua3bzSq6rwFITF24chLdvvGDMSJLu6YTsv8gHE8fSXXJkIXp3xBCzMGreOfgNjyi2
 8+dZQbNqaEyutTnUuJMkaVyiZ6xQ4XZAlG35qSJ+t6vs2lLD2qweLHzL+6bq/YwBAX1A
 5mrSiGbPn7AETULE3S9JiBgly7C5spvbFDzvJannF2qOczMuOHf4nBSwuXpAg0PbhriM
 hcsSp/DDkqouwIlY/psfRvyFNz/2zh6z9t1AKBJKblIoqHnTApdricJu6CSoLFeIUONb
 As4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X5yCLDEtXnwTfceodqe/0kxx1G7CJjLYhHQhq5M8jTU=;
 b=VuihJLohE49dN8TUsdLNrtllpCnj5fcHdcz91gRWs22G6Xv2wfEvotRns38RWMqzdn
 Qzq3As2S4n3mJUUp7hEEz/lI6KCjM7Gj+p7gD9E/lBwthCNj4jpKMchcbXfx2fwQ7KoG
 amWCV4INQOWcRV+3vWjlRQOGxmhy+WseTSzHnoi1tt+5jKnrY89J//ZM6io2zbstf9qp
 hWo/4PQveOHCo+5iqkatf2CEntnnZvg84NXdrHBItHkga5CihaiZpUXsmXmEkRXbxNPO
 sEyOoVhY4p53tFeMP9706vBUgsE0Ch+iccKexq8Q5vvVr/omEoUwvEE4W1c4PlXmC/MX
 76GQ==
X-Gm-Message-State: AOAM5317/6tTPXlSFSr4y00USvQk5bap6k3vt0MCfTpHAlFiG8XVNNCv
 0hq5hB18XItqojwcsf3vN8YKYA==
X-Received: by 2002:a05:6a00:2403:b0:4fd:e84a:4563 with SMTP id
 z3-20020a056a00240300b004fde84a4563mr1630665pfh.60.1650577046175; 
 Thu, 21 Apr 2022 14:37:26 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:ef88:6a04:9d0:2971?
 ([2607:fb90:8060:946d:ef88:6a04:9d0:2971])
 by smtp.gmail.com with ESMTPSA id
 23-20020a621917000000b0050ab87c15e7sm71115pfz.53.2022.04.21.14.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:37:25 -0700 (PDT)
Message-ID: <fbca30bd-72b1-5016-78a9-6410369761d7@linaro.org>
Date: Thu, 21 Apr 2022 14:37:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 18/60] target/arm: Use tcg_constant in
 translate-m-nocp.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-19-richard.henderson@linaro.org>
 <CAFEAcA9VN44x5JwvQTQchixsCz_tG7-bwBGShrEwJRFrU8x-TA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9VN44x5JwvQTQchixsCz_tG7-bwBGShrEwJRFrU8x-TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ptkXdbDBgmt4

On 4/21/22 12:03, Peter Maydell wrote:
> On Sun, 17 Apr 2022 at 19:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Use tcg_constant_{i32,i64} as appropriate throughout.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate-m-nocp.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
>> index d9e144e8eb..27363a7b4e 100644
>> --- a/target/arm/translate-m-nocp.c
>> +++ b/target/arm/translate-m-nocp.c
>> @@ -173,7 +173,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
>>       }
>>
>>       /* Zero the Sregs from btmreg to topreg inclusive. */
>> -    zero = tcg_const_i64(0);
>> +    zero = tcg_constant_i64(0);
>>       if (btmreg & 1) {
>>           write_neon_element64(zero, btmreg >> 1, 1, MO_32);
>>           btmreg++;
> 
> Looks like we were previously leaking the TCGv for this one?

Yes.  I'll update the commit message to mention that.

r~
