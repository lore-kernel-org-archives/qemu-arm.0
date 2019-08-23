Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp687481wrs;
        Fri, 23 Aug 2019 08:02:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsgJ2pyvP2yogH5Rk1o9dj8Zj74vN9+x1d65P6hyx4IL4Trl8RtaQQed4RDkBRNqQiWwt5
X-Received: by 2002:a37:5846:: with SMTP id m67mr4241973qkb.375.1566572555105;
        Fri, 23 Aug 2019 08:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566572555; cv=none;
        d=google.com; s=arc-20160816;
        b=YUFSOa5q4PzlaSBvc2avyzVU3jBTB1RPPJm7P9Srul2ZPtikl9FifvTJdrGEmtqfkW
         DsRjal2XbNvUWGUg9mJ36ydkwwYh9Irx2qc80o6idhIk+mT9W+nT8pLsP/1LWXXCYn2y
         20BSJGD2Zkuo9/kytdVe5Zytwog/gLfk1jsqeDmNxy1S4tI3bSDJqJXhbzXJsKqF+xlT
         Cswf/FCPACXbBaA+kZnnrIPA7S+f75MDRN1WiuClVW5Hq9h/LPpJNRjOYcDUHKJbtJRE
         Uxu6um4wr+NzJUm+p3xgAMHJU/5lycaI3pRyF12VUk81BPUERhn5nQCyUy65ekPZbnQG
         RAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=xPoUhroqLSrDe34vXvIBopbUjEmLdF9oYc+YKNHlzIA=;
        b=VtNVC4jX14sMDoVwVN2YhUKCW9qv+YFoHiUxHneK2BK0Yjr242ZAd0Dbqy0NHSuDFD
         JjKyHRZ/WeQ+uqBuxbG7UeVp3gO66CJLEoGJl77vGd1MdIAi7rUKL820VPjjODk8r2fN
         LU8ObfZb8Jvm7amRiefbCmonN5/7o7eSLQCf/Uoa/4VhUXCDEsrg53GANioZhZ4xwYPz
         hiXOYgQ1OLgc6WBub5qWBaWVsu5vo+LRJRZrhrTIBI3w7o4QWJUdSO7olqXf0q+wiBXW
         vBn7Tc51YN4S/JN5KOObklaokGZVrE1Cas1okYqORpnCOi+6l8D75gsV5vZrwEvTFf8Y
         4SYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DN+EMb4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si2065173qtb.285.2019.08.23.08.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 08:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DN+EMb4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1B5G-00062Y-0N
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 11:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1B01-0000ZK-45
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1Azz-0001ZF-31
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:57:08 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1Azx-0001YX-BX
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:57:07 -0400
Received: by mail-pg1-x541.google.com with SMTP id n9so5933785pgc.1
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xPoUhroqLSrDe34vXvIBopbUjEmLdF9oYc+YKNHlzIA=;
 b=DN+EMb4XwYAXoewykcOumDmuIswq0yvLaul2ui6EYCTRI/RwncRLyIgAXUfbqdkZY4
 WaTKRDZM3VYOjzj10NQFRWHKGaN20mW4Aj4MNbExrBq1MyVfwbCxhTv46IX6VllfAdpZ
 LytuA9OC8bn15/OsQcEkMv/jT2rayN4+UpKodCiFr4UVIgjivrl8+NSKQxeuS5s0bKCu
 YSuFtQnWOhVM/oo62B33SdtvfSMOBRKd24kqBQ0pyiukJJo2hEFFKwFbt/UBx4AAAUHa
 ducCFcB+2sDs1ymcnGLxF5H9ymcfcu5lSxgtSHnzYlkVkjerwUvn7r9MTW9c8xsmctaz
 t/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xPoUhroqLSrDe34vXvIBopbUjEmLdF9oYc+YKNHlzIA=;
 b=VI5IhWqyGQEcQ1ngOqc677yqxb+firNvbIxZ0MQrc3E163lAfGVFKwKI7rJ29ZKvYB
 YVubvYp4yzPibVRVwvhXsU0rTFKlihBjitS3K56Z9nBt/jRyVi1KukBOaCm6j8lVfMaO
 DK/ItrVId58nVM+roGvoRdS/jaMZ4ngrFEHStviClVX/R9mZccGs8+uqRP1RTaVkJ9Cc
 6bLD1FmcBvKm0z9PfGiQVMbe9bA0MEnay19lKwwJw/9zhlhvQohQTPjJbkFeT1Q3290z
 bY4zuysbaCcYowKiOVUlFXx0XTqN3UoK5RJX1xazzvu7EfhUsvhqCRjjsT2EYQRD74yW
 4WCA==
X-Gm-Message-State: APjAAAWmN3UQ1YNP3H794FGZhu0Jw8OFC0gQbeM/CHeI/Lr0WK4y4wEq
 VQEe7tn1hrrcflr5D08X7JmEac2ao4o=
X-Received: by 2002:a17:90a:256f:: with SMTP id
 j102mr5943859pje.14.1566572223962; 
 Fri, 23 Aug 2019 07:57:03 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id u18sm4159714pfl.29.2019.08.23.07.57.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 07:57:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-20-richard.henderson@linaro.org>
 <CAFEAcA8Q3ujQFtZfLXTsbKBxUQAHCPo0i_TpdX9KcmnNUY04Eg@mail.gmail.com>
 <c8809173-6b8a-afab-507f-69983ac29224@linaro.org>
 <CAFEAcA9Rq3VR3F+zUV3BiZ7zQm-gE=Ut4hv7Hi0cK3me4Vch3Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0548bd91-14d9-8e2b-3b9e-d5adad7a7dfb@linaro.org>
Date: Fri, 23 Aug 2019 07:57:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Rq3VR3F+zUV3BiZ7zQm-gE=Ut4hv7Hi0cK3me4Vch3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [PATCH v2 19/68] target/arm: Convert T32 ADDW/SUBW
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3iJoRAgEuFF4

On 8/23/19 7:47 AM, Peter Maydell wrote:
> On Fri, 23 Aug 2019 at 15:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/23/19 6:04 AM, Peter Maydell wrote:
>>>> +&ri              rd imm
>>>>  &r               rm
>>>>  &i               imm
>>>>  &msr_reg         rn r mask
>>>
>>> Should this change be in some other patch ?
>>
>> No, it's used by ADR.
>>
>>>> +  ADR            1111 0.1 0000 0 1111 0 ... rd:4 ........ \
>>>> +                 &ri imm=%imm12_26_12_0
>>
>> ... here.
> 
> This is in t32.decode, which has its own definition of &ri.
> The one I was asking about was the one in a32.decode -- the
> addition of that line is the only change to a32.decode in this patch.

a32.decode is where all of the shared argument sets are declared; t32.decode
gets the !extern markup.  If I only put it in t32.decode now, I'd only have to
move it later.  It will eventually be used in a32.decode by MOVW/MOVT.


r~
