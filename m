Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp741747njb;
        Sun, 25 Aug 2024 05:14:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeuZegh+ybPNnqXbHgtUOrasKULkhaGgae8q0k04+z2zk4w+caqokqvxCXhDp1Gqzz9BdYUOPv/ImaEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEwzzOBeHSZlSC4HTtl+bmPdNrq5laBZ31Fm4z9nby+OY69JZ73daK+OTkSOD3j2vf23y9y
X-Received: by 2002:a25:e0cd:0:b0:e17:bb87:fd06 with SMTP id 3f1490d57ef6-e17bb87fe00mr4846705276.49.1724588082378;
        Sun, 25 Aug 2024 05:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724588082; cv=none;
        d=google.com; s=arc-20160816;
        b=PFAaq2J9fx8OwpefqXHI6euql3U9dPkbh6se3pYjHth3JpCVKrwCpjxLnDj+JepNs4
         zYIf/CSrhLA0drujns1zk0GL+GfTmpXEcrnFHqilCctO0UCvHrGba1QR8vFno2iCRglx
         MoxmWv9mmwEPW7EWaIIeUw7muW0oZdi4KIkJMnIOdTshSPllxNSAAp0plot5BLU7K0oG
         ii2Dfch/1Fllq9RFiwjwqs8sl+4a2Slra88l/G9HJxDx19MA0KR0fPjkox6fAZrUsSdY
         eLCwbY7aLTIuq/V9HvCofRSQ3+3z1AH7IzThbsq8smcRvp5zbT2r8MCHx/47+r10TeHJ
         21OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sbToXCrbajlrJ7hi8Rhhm4AB0nfPJ7yL41Ygg1MUy2w=;
        fh=nqIiD6dVem/YO7BZGfB+fhMUnZWeuOdOXcJEsARRpas=;
        b=l4ZPDvwKtq/vifnHj8956XoUupqGMZHPbn+tXO6dQsMXdzzjF9d/CR9lYA8gf8Y16A
         uRaxzEfyL4DDSLGQY8X8kUOrOV6iMkAj2Ejt7VbckfPP9SA1+7G53XaTpAiJ3ZeEyP/f
         nHspdv6n71qpTm/ce1+Ebno9mYZTppkIO+qdHDxcesYlctQKIJa+0DFpoRl0FclDP3D/
         Ldapaz8DF57YJv4566Ohiop8dnpjMuYmQqXwl4Mm31ldTdDDTmKezZtDgR2grCy8TKV6
         kL+EED51+v/v/jql/3hfU14IjA3nIZdyOyVRXv45mLYyxa0uXY1gr7WWTHJ67PQh8CkA
         qKnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IugYCywW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162e44b86si86938236d6.518.2024.08.25.05.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2024 05:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IugYCywW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siC8H-0004i9-6T; Sun, 25 Aug 2024 08:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1siC8F-0004fk-97
 for qemu-arm@nongnu.org; Sun, 25 Aug 2024 08:14:07 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1siC8D-0003Sa-KM
 for qemu-arm@nongnu.org; Sun, 25 Aug 2024 08:14:06 -0400
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-81fb419f77bso188858339f.2
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2024 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724588044; x=1725192844; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sbToXCrbajlrJ7hi8Rhhm4AB0nfPJ7yL41Ygg1MUy2w=;
 b=IugYCywWW8DxPgzB1ApxQWB6wcNAEJmagN6dMr+keeGm4jtaUs6nsnK3YYAJsa7n4V
 BFg3j4mJW6oUYK774SIwLc4xQQA3dJW6w5eimfqAUVfdQPrug6z7ErGZLmwbn0gJXFY2
 BvZaFZH5nTI1pG+0J7u73fjZIoW8CQpVN6xGLBdnU/dIKPxsyWN9UpS2MdLkGhlLoJO6
 BzG3yyp1mJHXS3dofv02iSquaGRtZ3Q11i4UhbPlbobJzfucXTyUXCETApns9LKfHUYd
 BjlqNc4bTYaZNJHmm5YZqZ35rL9QnO7BycP7+U9rABJBehU90Ujwjrbb9fuo9U24M2hC
 vMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724588044; x=1725192844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sbToXCrbajlrJ7hi8Rhhm4AB0nfPJ7yL41Ygg1MUy2w=;
 b=hSn0TG6oW/ctR5QpfocHGzkGUpyf4pM7Z+kNK0ov4DSK5t0xdiJgMjhxvmxLu5QMHl
 hC+GnQ/gxoKZ0nXSizOgQpelnbtUcKwe8bQxru7T+CnoAyXxY5DGJdWuR64MrTRrCkpP
 7VMsQtbNGBzblhOaG5I68e3Sv+sZcr5RY5lf9K5Spubylt35yd0Zs7vDokEDVSdj9y16
 HErFT8fugKxQewSOfMud92teu2zLXGqX3zf4Rbu7waC7EosCm5tcdZM45/kULng1GYhI
 bw2RSR6HWJrtM4fMmCw99evu0AfAmSe9zhFIKv15bVw8F5Es+O4GYaBylZAjOrXPPoKO
 ZNPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjBHOMPOHEmJ7nvm/3KTqGlbvR9s944PI/MMPdG4OVP2QIt7AcPKNIS9tSRGpO8mRpeh9BdYE8ig==@nongnu.org
X-Gm-Message-State: AOJu0Ywat3EewoupwUPp21eMPWoGKaXjMS46g+zoU1aav2nfQgUe2a+Q
 cxdi7wZiLDDhVqVJUUucs8x71gYIoyVIBeb/FfRwjVuHS5b1BuLJot3g8XqCUAA=
X-Received: by 2002:a05:6602:6185:b0:824:d4da:3c3d with SMTP id
 ca18e2360f4ac-82787360804mr902086739f.12.1724588043594; 
 Sun, 25 Aug 2024 05:14:03 -0700 (PDT)
Received: from [192.168.98.227] ([172.58.160.182])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ce70f5bd94sm1750062173.42.2024.08.25.05.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Aug 2024 05:14:03 -0700 (PDT)
Message-ID: <f9bfe251-fc5c-4ffc-9842-a13d6fbe8b66@linaro.org>
Date: Sun, 25 Aug 2024 22:13:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2] hw/arm/sbsa-ref: Don't leak string in
 sbsa_fdt_add_gic_node()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240822162323.706382-1-peter.maydell@linaro.org>
 <795d0c95-9bbe-43f5-bcd4-edcbe00cddc9@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <795d0c95-9bbe-43f5-bcd4-edcbe00cddc9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T//HylZrgtpu

On 8/23/24 16:42, Philippe Mathieu-Daudé wrote:
>>   static void sbsa_fdt_add_gic_node(SBSAMachineState *sms)
>>   {
>> -    char *nodename;
>> +    const char *intc_nodename = "/intc";
>> +    const char *its_nodename = "/intc/its";
> 
> Should we use static qualifiers?'

No.  The real object is the string literal.  The local variable simply allows multiple 
references within the function.


r~
