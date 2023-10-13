Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1481833ejc;
        Fri, 13 Oct 2023 05:49:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIqw0prEUJxV7roMmL4EyKB99HXUn3kfCt6ZyzlWo8FZ5PQ8JGxteD+SfEnir4aTjv8c5p
X-Received: by 2002:a05:622a:1905:b0:418:1a5c:dcc2 with SMTP id w5-20020a05622a190500b004181a5cdcc2mr33738242qtc.19.1697201354572;
        Fri, 13 Oct 2023 05:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697201354; cv=none;
        d=google.com; s=arc-20160816;
        b=EfKc4n6D0B1Df2tGtMb90bNSxSHEmvhvmwfNLvHx2Xf4bEr78p+1J7Htx2+tNX+VH0
         rjOJdR9DeXk2YJkE5Wz/kw8ON2CnT+nXJul4gN/l/1cPwfjIalt/kKxcmdbTM3Lo40Ld
         umLbLxHTgDvnRI1pgyiFaLSky01/ooxJkfHvjgZsXTp7t+FKT8x/NXkkSII+9oYq/NLy
         Xzoir76Ov5z4rhkguYiFgdqkot/JZpR7lQ6FK9eOgofo1oWAJRemTEqnO3O18FuOyU/X
         noZZkZWi8ArQvcPbqQQEfkNDN69pc+j7nOOlW72pKkW5fX2DdZnLfbfG0W8c8mFfc2bP
         UStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=dBz9GQdSEU9gKF/QgtOWHkAKu0z5HMjUNwmS10XT57U=;
        fh=F7gw6Ot60+/F3wUpPWAevnkEjbxRno8DXEU4LrM+9KU=;
        b=SYA+PvRHBirjG1SSRS1di87Wcn/v5+BN5YQOMz5i9f1wp5I44gqtBJoVYao1qk+wOH
         toNr3bpH+8oc69efRo4i6GnOA158NOx9YW5WpQwCb2ojg0wgBbne6hzEj4e3ZDIp9uL/
         JVe7buyDstWm66+KYEVpv8J4Psn5T5AxGi0km399t8JcPJ8YwospmIamOaSuVOUp5UwP
         gnMJaoYa4w9U6FPSQI06glZWSlBD4uvzbD9ZHwEaxzHoRVHD8RItCan+ESQwL4aBX+ML
         UQYXLoE2qVWuWNaRrYUzmY1PZpLw7TEcQ7c5ZboIt+5nGkUqHHmzZNAkvXT7OYjL7jll
         fjDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBzrAPLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05622a101400b0041980065908si1154215qte.506.2023.10.13.05.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 05:49:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBzrAPLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrHbF-00010h-US; Fri, 13 Oct 2023 08:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrHb8-0000vT-VY
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 08:49:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrHb6-0000fg-FX
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 08:48:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40684f53bfcso20867695e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 05:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697201335; x=1697806135; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dBz9GQdSEU9gKF/QgtOWHkAKu0z5HMjUNwmS10XT57U=;
 b=FBzrAPLya5nXNCA4Tl/1V8gW15ypZWkYW1NS6ieieGWfHByhUYUxuOEmmd5J/ybGO5
 24lkaa5fYAmqC2cr4RY/MgZ0Jed6RzjgcTCUHF+Pu/3ILALUe5bobNXQDCMjtYaKOaNY
 Ppp57MB3onCrw9ViIgWJs/b6KS60EpsVd7ID5e7kthRWbEQek7Y3TisAo/JDy653G/yu
 nFnLDX+McV4gg5CTKq8dEyKbuetCJ0FJsJWv0JX2Q0a5FbuLWH6C+3gGw7fqU6AI3Fzh
 zY1eVzGli5hs3UqePKDySiaMEOfbHKsFcqf9MRlQSUF4JsMpzMm0tezR1Vc2iRbnb2rd
 cUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697201335; x=1697806135;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dBz9GQdSEU9gKF/QgtOWHkAKu0z5HMjUNwmS10XT57U=;
 b=SsEsM0tK8eezFy54XzEI671lxGZhjpCNh26vSVa5g0ZspJnf9qdWXoIRzc/BBd1eIa
 1qKJbQPbjkEL/uoP6taTcdK9I99jJS+ryxO2LPxOiL/oY/i248epYPO0uyw5A0Fe3pcm
 jOqKJPqM9L+s7ENpJe0guLUe5ufyl5PlwA4oh8yBKKmoFIqmXOFSjZQNLuhSQ1nt3iRD
 DB7HoVGwqA2ipwRsINC0FSJXxfj0zTRkpKiPhQpq/ge7tQ/xnRhCeBUhmPq5Zs4O+y+i
 6KJSeLA1SIAFkkJ5TWs6Igmgze4k5VQ4YRu7nSMyhbEfImiERf/biscyUbsXarGiN45i
 U2DA==
X-Gm-Message-State: AOJu0YygyIMCwXmklw4JTrNzPjMZj3VEAAA5p00+/gO/OW0fCHh9gMSd
 Y122vhJlGQa6BqXz5NhIvB2ayJjtOOy+wozpLZU=
X-Received: by 2002:a5d:4d06:0:b0:320:824:e3df with SMTP id
 z6-20020a5d4d06000000b003200824e3dfmr22428410wrt.35.1697201334783; 
 Fri, 13 Oct 2023 05:48:54 -0700 (PDT)
Received: from meli.delivery (adsl-26.37.6.0.tellas.gr. [37.6.0.26])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a5d4dc4000000b003253523d767sm4275796wru.109.2023.10.13.05.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 05:48:54 -0700 (PDT)
Date: Fri, 13 Oct 2023 15:37:23 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marc-Andr=?UTF-8?B?w6kg?=Lureau <marcandre.lureau@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Bcc: 
Subject: Re: [RFC PATCH 01/78] include/qemu/compiler.h: replace
 QEMU_FALLTHROUGH with fallthrough
User-Agent: meli 0.8.2
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <2e08cff874b2f9fc4143bdcde87ebba9b70b356c.1697183082.git.manos.pitsidianakis@linaro.org>
 <874jiuiu4w.fsf@pond.sub.org>
In-Reply-To: <874jiuiu4w.fsf@pond.sub.org>
Message-ID: <2gwxg.2pv9ux2894z@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x0/Cpd+WDl34

Hello Markus,

On Fri, 13 Oct 2023 15:28, Markus Armbruster <armbru@redhat.com> wrote:
>The commit message needs to explain why.

Certainly.

>This is wrong.  docs/devel/style.rst:
>
>    Include directives
>    ------------------
>
>    Order include directives as follows:
>
>    .. code-block:: c
>
>        #include "qemu/osdep.h"  /* Always first... */
>        #include <...>           /* then system headers... */
>        #include "..."           /* and finally QEMU headers. */
>
>Separate patch, please.

I know. spa headers use the `fallthrough` attribute and qemu/compiler.h 
defines it as a macro, so it breaks compilation. If the spa headers go 
after, we'd need to undef fallthrough before including them and 
re-define or re-include qemu/compiler.h after. What do you think would 
be best?

>
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index 1109482a00..959982805d 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -1,215 +1,231 @@
>
>[...]
>
>>  #define QEMU_ALWAYS_INLINE
>>  #endif
>>  
>> -/**
>> - * In most cases, normal "fallthrough" comments are good enough for
>> - * switch-case statements, but sometimes the compiler has problems
>> - * with those. In that case you can use QEMU_FALLTHROUGH instead.
>> +/*
>> + * Add the pseudo keyword 'fallthrough' so case statement blocks
>
>Pseudo-keyword?  It's a macro.

C calls reserved words that you cannot redefine 'keywords'. Like 
'break', 'continue', 'return'. Hence it's a pseudo-keyword. It's also a 
macro. They are not mutually exclusive.

I did not write this, it was taken verbatim from the linux kernel 
source, see: /include/linux/compiler_attributes.h

>
>> + * must end with any of these keywords:
>> + *   break;
>> + *   fallthrough;
>> + *   continue;
>> + *   goto <label>;
>> + *   return [expression];
>
>These are statements, not keywords.

I'm pretty sure it refers to {break, fallthrough, continue, goto, 
return} by themselves.

>
>> + *
>> + *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#Statement-Attributes
>
>Not sure we need to point to the docs here.  We have hundreds of
>__attribute__ uses in the tree.

Again, copied from /include/linux/compiler_attributes.h

>
>>   */
>> -#if __has_attribute(fallthrough)
>> -# define QEMU_FALLTHROUGH __attribute__((fallthrough))
>> +
>> +/*
>> + * glib_macros.h contains its own definition of fallthrough, so if we define
>> + * the pseudokeyword here it will expand when the glib header checks for the
>> + * attribute. glib headers must be #included after this header.
>> + */
>> +#ifdef fallthrough
>> +#undef fallthrough
>> +#endif
>
>Why do we need to roll our own macro then?

Glib uses a different name. The problem is when it checks for the 
compiler attribute, which expands into our macro.


--
Manos 
