Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2884724ejb;
        Tue, 28 Mar 2023 12:17:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350bLyNRNWabA5ZF44ifkC5DCcK84ylH+5gTsTiTLFdRvSTN8zO6/FtJSuUwYicsnw5VJ0S5S
X-Received: by 2002:a05:6214:5299:b0:5b4:89b4:1af8 with SMTP id kj25-20020a056214529900b005b489b41af8mr27379635qvb.16.1680031035720;
        Tue, 28 Mar 2023 12:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680031035; cv=none;
        d=google.com; s=arc-20160816;
        b=oLKYNH2k7+CNPGzpNs7AKzinhiA26cQhCSbHQrW68pHEKrI/bAKkGPiRalf2JYFSGI
         fXYPSaDoWj0uJIgWBQdibxPmSmfHREBc/CZRjyzGC1hhL5H3fAkulgUTB0JwfupXARly
         g+CTbWCTe6CHt6kCVegSTllpKPHBhJjAX6JvW+hBgaaIrFtdnLcJdNckdVckk0R5ZFb6
         Sj2J414S12h/417EwBJRHuuOabX4WYhbenHxOyHwID9PuyC4gcV9J37kM7nv5IdvWXy8
         NB2Au3aovYOBOiaQLvKA6UkcS1vjHOuKx09e/RrqrduEkljeLOvJa61io8Ezvwt7ktKM
         /3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BgCAdPbJWxmezMLlCB+zfbqjlUeBDrYMH2bO6W7scQM=;
        b=elna16FbXSf1f28+YEu2osowl6EmHtFp+2X/YJR+0Ey4FCkO3oyjZIOyn5gLOBsB0G
         Y4ybHIkUAgowZX6FtMWLMOZz+UfjyKHfjhAbUFR3C2bmJC+pg3onFAicXfCFYrNk78GG
         zzmsz45osSmXbNWDwMASVtZzFDEh35Xo0/vnMpv9Z9TaGa85Z7wGv8Iytt/y7RCnu0vb
         TAIQdGSs42S7LsBOvYW+RoMfyxHeacf7x3o7IB34zzwZHBk0vkIVAOXtB6DSOOUiYns8
         bmUo1rrxTUZd2ZPdPPv8ZfEVrZQ0RjjT+IpQ4qCy2VT1WsexjACMXPwlnZfr+HXOi7II
         B41A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khAzcds3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5-20020a056214040500b005df34856201si5467379qvx.145.2023.03.28.12.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 12:17:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khAzcds3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phEof-0004ZU-CB; Tue, 28 Mar 2023 15:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phEoa-0004Yz-TD
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 15:17:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phEoY-00027a-Sx
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 15:17:04 -0400
Received: by mail-pl1-x631.google.com with SMTP id kc4so12670867plb.10
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680031021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BgCAdPbJWxmezMLlCB+zfbqjlUeBDrYMH2bO6W7scQM=;
 b=khAzcds3IGiKZQoQ29wNCp1y6GIGD9v9SKWbVLgfpl8Leiv3wCS8JsRkrq/qWXQoyS
 1qvZSECbxNugGgxc7iBkZxyh0DxYdNM6hW+a1FRoeE2ioycbUikZjTALYOVD2P2l0TRy
 8GAGL2fWqrGTDpFgq73pawmBLpi9ZxcbACyiGu8PaoPOZuIXQ4ms3oVW42la0mmlvec/
 14Y6NVfkk8gviKo1f2+lGy6uflKbhFSevUgXOReqv2kq9VwnY7TktCfWxal92hp+eTRq
 GOtkiAptoL6ycRnHEu7Zf72YuarICYUbo+hjuIgVUb/eSNzSN6ptdgrto85z51NhRJGc
 8G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680031021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BgCAdPbJWxmezMLlCB+zfbqjlUeBDrYMH2bO6W7scQM=;
 b=sfkBPinsb2+eZOb0ZXtcPkJnvGUEd6tUKnhi4DsYrcZAxm4y5vg1KCHYAfFl6uBJrW
 5LgpVF+eeYwl9qlPWacmlvby+Ps8c3ua0elQ6WRr2dt3/9s3zaP1/l/e46JZL78KnG9H
 Ow6WYeMJAFFIerP7TxgFS76FcuSixD5vkwH0GV3V35YCpLSe15YmmAAPckmkLLgOp6Fl
 muks4nOPsl4q/wpwLogV+wQf7OVl9j9p7B95zjNPJkE4ZczUmjCbqXQSYHu+5SyIITPg
 DswPyNL7+2qgwijh2XhBWc97N3CWL5qCw25f1Q4LICPjcXpns8XBfYqysS4iIJleCZuc
 OOOQ==
X-Gm-Message-State: AO0yUKU/De8Bg2Sg4T4qDgmQQ7L2LimMIjT1Y8rvKAoMys9y3Fxfbw7n
 Cts5WXk5D9T6R8LTLSnQszT8CQ==
X-Received: by 2002:a05:6a20:7788:b0:d9:18ab:16be with SMTP id
 c8-20020a056a20778800b000d918ab16bemr13770883pzg.29.1680031021288; 
 Tue, 28 Mar 2023 12:17:01 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a63f918000000b004fb8732a2f9sm20200487pgi.88.2023.03.28.12.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:17:00 -0700 (PDT)
Message-ID: <ab190434-1bf8-a038-e589-6fa150842fe9@linaro.org>
Date: Tue, 28 Mar 2023 12:16:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
 <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
 <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: +KIAWP4fJvLx

On 3/28/23 11:27, Peter Maydell wrote:
> On Tue, 28 Mar 2023 at 18:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/28/23 09:28, Peter Maydell wrote:
>>> +            /*
>>> +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
>>> +             * but since we're conditionally branching over it, we want
>>> +             * to retain the existing value.
>>> +             */
>>> +            old_is_jmp = s->base.is_jmp;
>>>                gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
>>> +            s->base.is_jmp = old_is_jmp;
>>
>> A third solution is to simply set is_jmp = DISAS_NEXT here.
> 
> I wasn't confident enough that the previous is_jmp had
> to be DISAS_NEXT to do that -- there are a lot of
> different values and it's not clear to me which are ones you
> might find lying around in is_jmp at the start of an insn.
> 
> I like the set_disas_label() idea, but maybe for 8.1 at this
> point...

Anyway, if you'd like to stay with your current patch for 8.0, it's not wrong, so

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

