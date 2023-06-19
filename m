Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2737979ejt;
        Mon, 19 Jun 2023 03:46:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55K2UVAa9c+My9+YMW61QRf0gscYu79xjwGMBZ0r4QDkZAxuEx0zgcnqXJVr5DwpR4jMTM
X-Received: by 2002:a05:620a:8ac1:b0:763:969e:1397 with SMTP id qv1-20020a05620a8ac100b00763969e1397mr540438qkn.72.1687171601041;
        Mon, 19 Jun 2023 03:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687171601; cv=none;
        d=google.com; s=arc-20160816;
        b=bDLdEoegKQAvUM67dozgsg3yaQcUa+dAWHjawDmqWwf1vN5KTefqvlMNUPrDWPMJST
         pw3qU6tcS/iBlyxOFGLHThq5t4zWO3honw77CFLdQ8EjEOyTuVAiqFVz6Gf5ukfvUCBu
         9uJuqLzMQMCNewQ2/Jp7XryacTbjMz2RfqMxG2VpHivnhuTlGYxMsdYXPlt591Cl9VdK
         GA5Ja/GnjpM5g7C/hQ7hTmtOU5eI2EP0DAMIG6kpoDLqA0fnhsqudRUmK74imvOIzWgi
         MQ8WI5pROKk73GCA/GNUljXh+hgt3+28FikcS/McEqnhNItX8r5Nck1sxvJ2qk7l3xqw
         ILdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=27eyYafjxwn1v204AEUHoAoSFDioWIeiQktJS2DqrkM=;
        b=dgyQ0P7JOUGepJhcPZHAr4zZ+Bua+Jx+sFh/reNwT/1au/bNdFoJ3C2il1Yv8dh2x5
         YfXTDHsr1eD8xdE7FeINtQzim/8AXNnz4Y6WtEXfWyzDrGXnl1U8+qa0nErSljN64bsX
         f1C0bR8qB+N60yTG7W8W7Yo/PVMokERIHBlyUFyhiqe+UMzYAXnnwUPLxpvxSAYfhf+p
         zzcMKXSAON2zuh6Y6WdJjuhwl3VrbdnGmQbDsgQFNgYryUgZ5K10jFiMx3tzKdFA6io0
         dfPHtMrQFFomCtkLciGOFdzcC5ohFv3DuSoH4khY/ZO6Y1vIKEZve3ynqrIluad7nxgI
         IoAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SFMh5MvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dy33-20020a05620a60e100b0075ebdc7eff6si12807582qkb.770.2023.06.19.03.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 03:46:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SFMh5MvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBCOd-0002t9-FV; Mon, 19 Jun 2023 06:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCOX-0002rk-WE
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:46:02 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCOW-0004so-9F
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:46:01 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51a4044b7a1so4111299a12.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687171558; x=1689763558;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=27eyYafjxwn1v204AEUHoAoSFDioWIeiQktJS2DqrkM=;
 b=SFMh5MvWKYMvW/HURT4GZhyOju/OFhrEc36hwy2NzFYnEJw19lYO/SI50BFrhqFamx
 5LR5i2/rE36nDVmnasHhFLalGeYXj0ovVX0LMZfQP4vNx480AaBwO5Cm3sNXj8ILdjri
 gJnOxKfXrggywmL+R7rWG2uGW0XmsHDzqgMeoXeI8DYao9fBxYghJwyS4jaeksxvq+cr
 9RcLySgwl87Tz3SR1RRAjrHctxQEt0fqdA0BPG3ygdO/IA0YzDK7z3R+IL5J+hV01IbM
 BDvSIQHYlhR73+uKPSBJmSt8urKw7dfdY9jh6Cy5r51MHj0LVYe3wTKDzOQPnqe08iMu
 POvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687171558; x=1689763558;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27eyYafjxwn1v204AEUHoAoSFDioWIeiQktJS2DqrkM=;
 b=QM82VjVHrt0lJFBTKsw67xzvyci4Ypihpr4ZQ7gApoqTh2V1Gka8Vf98Xh4a24FSS1
 jqRYB/D7BnzcHobt4Mfn0w+EUb6qPWfrZ5U/juQLSQTRdG535EJE2s1B1NBB/VL3y+uB
 CEgxGSiiEd+mzk9/uM6DXD51T+LWitjCVfiIa8q53zum5LVeAQPzM/h/oJjijJQLd5yD
 7F381czyQWDOw8nYrlI2wqeHzyJAmoYnghx92vEhdqbRZa1810F5KbigJWa3GdC3VrTy
 n0ASOw+XsvaFaPbiAD2Mh6WIrWlTMg2KD7r6qH+Uz9yXLcKpGJuCLX2Nizj8Kys1esxw
 ZCGA==
X-Gm-Message-State: AC+VfDzX8qNWPe2Y8V5gbxsKRraXXZM8AlORMDw+AtRq44j++6tgA/LH
 QV+pr2Iedhk1VIoCYq9S2NyB2Q==
X-Received: by 2002:aa7:d912:0:b0:51a:3e94:b567 with SMTP id
 a18-20020aa7d912000000b0051a3e94b567mr5933113edr.11.1687171558425; 
 Mon, 19 Jun 2023 03:45:58 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 s13-20020aa7cb0d000000b005163a6c9f18sm12747004edt.53.2023.06.19.03.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 03:45:57 -0700 (PDT)
Message-ID: <de85a0fe-9cff-74e3-464e-98667cf41fcf@linaro.org>
Date: Mon, 19 Jun 2023 12:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 07/38] target/i386: Use aesenc_SB_SR_AK
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-8-richard.henderson@linaro.org>
 <1e32947f-7498-9db3-1912-dd3847f4aa0a@linaro.org>
In-Reply-To: <1e32947f-7498-9db3-1912-dd3847f4aa0a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: h44kgmVXplNe

On 19/6/23 12:43, Philippe Mathieu-Daudé wrote:
> On 9/6/23 04:23, Richard Henderson wrote:
>> This implements the AESENCLAST instruction.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/i386/ops_sse.h | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> 
>>   void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg 
>> *v, Reg *s)
>>   {
>> -    int i;
>> -    Reg st = *v;
>> -    Reg rk = *s;
>> +    for (int i = 0; i < SHIFT; i++) {
>> +        AESState *ad = (AESState *)&d->ZMM_X(i);
>> +        AESState *st = (AESState *)&v->ZMM_X(i);
>> +        AESState *rk = (AESState *)&s->ZMM_X(i);
>> -    for (i = 0; i < 8 << SHIFT; i++) {
>> -        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & 
>> ~15))]);
>> +        aesenc_SB_SR_AK(ad, st, rk, false);
> 
> Why not use aesenc_SB_SR_AK_gen(ad, st, rk)?

Whatever, I misread the last 'be' boolean as 'swap', so this is perfect.

> Regardless:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>>       }
>>   }
> 

