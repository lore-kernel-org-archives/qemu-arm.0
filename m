Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp368927ejt;
        Tue, 20 Jun 2023 09:29:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5va70/kl7nGRUpVcPISnYA8ffO6cuGcA+tUfRWa38Lx45zLOgbHLq7JjnaukPdQtPO5/iH
X-Received: by 2002:a05:6214:c45:b0:62b:4590:78d6 with SMTP id r5-20020a0562140c4500b0062b459078d6mr15351107qvj.25.1687278545775;
        Tue, 20 Jun 2023 09:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687278545; cv=none;
        d=google.com; s=arc-20160816;
        b=TOJExXH0g7OdjCOHpws5oSbaelfZTuxMAPruvC4eQwYjtFrrDDUZCpiMAXe2f5rRmc
         aZ6jW5AIrr6N4PnhMC8rOd7xhzLKdhiHePCUbjqcE1Hf+T52ps3r2Fk4GFEu/aiK3ltd
         BtP4ZoL7gA/04d34E1WUGp2Gr8J+zCV6cMzFXhElBI0fcHUkkCvQTRy8fmaC6FIYDkGS
         5kfJF/yIiKnh5X2vCAZWUDm52EHE/u9nojV57cIvGwP91YXfM74B5oQALEqKfBKGvM6m
         ymKQPQb/DIO3uXDYSwonvR7xs/HBmVDp/p2I46HTZSXhzLI/fVonstrDAhAGlzBKvBzA
         VwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VEDXF4XY3pSNSYETVpYa50Ho1wtdjeGGleIwhMLFs6U=;
        b=sIVrueRwYWmOOaO+3albg8GqMtACFk0lKxxN5wh2bqSUusDy2Mo19v7aEahwq6ClLg
         jffNNEZmj+atjE68gqOqNSUrEvsKWt7kSmb+NYk3RmQ+jZxFMUxbp/wGK1yu8KAc0vPw
         u0M5efJ1pBlZHGLUIFUhlgiVG7TiWc89Bp67gCHcJOkH24cRRgALLGMVz6rLiWKdAmz8
         eE7BCgOG1bqT8LcR0Y8L0QqDkO1cV9OKKKe8nEKwPZ3633jSK9JOJYPQCAwdT0+CiVfO
         teoMrFRnBlKVRV3PZ9QDNmqgUy6ZF1Fx+7Ec0xEw6HpJOHHR8tLZBr6V3esrKqJ0t7Mg
         aXkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lOTQfiwY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy12-20020a0562140f6c00b0062b6e4dc86asi961021qvb.479.2023.06.20.09.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 09:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lOTQfiwY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBeDu-0008NS-Hd; Tue, 20 Jun 2023 12:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBeDt-0008Mz-Co
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 12:28:53 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBeDr-0007Nl-MF
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 12:28:53 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so601357566b.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687278530; x=1689870530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VEDXF4XY3pSNSYETVpYa50Ho1wtdjeGGleIwhMLFs6U=;
 b=lOTQfiwYdGb30JMX7gokyS4rs06yTZo6wuwDUBwR+0pGgFly2odmEXY9WbVcdrhDv1
 6HoN6zmgvmI0a/Dp7NGH064iFcc0k+ZBaGZIkux7Vs6lKLSO4/BpJrb9klAYZiFiGPIx
 lUX7B8Dc6aVqxcKAnA5xvbeJF7iS7YEroRQRpP+HEXZV05+9LimySuqzo1AomqWqSHcn
 +wU+a+XbHX+G81A8hrGc/qUUMKQMWllpEBAxTi4I2WgckW6GFNK8E1u49ASsTu5oN6u+
 kaoXn174y8hdfRPdKElouD8SuapzBJ9P+xO/NppY9MeqEoVVIh4mQI+2pACs7BLTQF1V
 MlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687278530; x=1689870530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VEDXF4XY3pSNSYETVpYa50Ho1wtdjeGGleIwhMLFs6U=;
 b=Kgbvd7LYK+ULTDfwXDnGxvZvG4FVZn5YFLibhRLtmfo/9eHo3ZWyjSSfNjKSgzVDUh
 jpbbuOTrEC8OjYn5XT6CEDlnDehxZ0AvXgnb6q5bE9R4jQhdR4lPHw+X/Op2ts8taEZW
 7ADxhoDzplIirMOCVlWlWZzr70jnZlIw0iJUYwxrltsnYUelmWaG0dF7RajtQPRQ5ybL
 2p13faYggwUAifbDUZtyXGQapvXrmB2n1wgTJYwqnjXkgkKhJdvRuD6ddl9nXOGKMF//
 k/bfwX9b17uSt8aD5OGBgFmapca5k2xVSxlYsYZcSBE7WSkTk/2B8+OczsDdtv4rq0eA
 /nRQ==
X-Gm-Message-State: AC+VfDxmixrA9DSaOGGGjN+EubeYweEEP6WYbpLfiRHNZnsmQEqi/MdC
 iYqvMycm84MzOFNdfNTD85lucg==
X-Received: by 2002:a17:906:ef06:b0:961:be96:b0e7 with SMTP id
 f6-20020a170906ef0600b00961be96b0e7mr10624367ejs.48.1687278529900; 
 Tue, 20 Jun 2023 09:28:49 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 ch12-20020a170906c2cc00b00982b204678fsm1603023ejb.207.2023.06.20.09.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 09:28:49 -0700 (PDT)
Message-ID: <66f83d87-6314-8173-cfb5-47917584a1ee@linaro.org>
Date: Tue, 20 Jun 2023 18:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 00/20] target/arm: Implement FEAT_RME
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230620124418.805717-1-richard.henderson@linaro.org>
 <CAFEAcA91RPvuC_GArpu=x3rEpv1-HsfdEOTGf50N7VY9ZwgtjA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA91RPvuC_GArpu=x3rEpv1-HsfdEOTGf50N7VY9ZwgtjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NExc1fooru5k

On 6/20/23 17:57, Peter Maydell wrote:
> On Tue, 20 Jun 2023 at 13:46, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Changes for v5:
>>    * Enabled only by cpu property x-rme=on, not -cpu max.
>>    * Rebase vs SecEL2 fixes, now in master.
>>
>> This doesn't have the magic RMM memory, which previous patch sets
>> included for booting Huawei's forked TF-A.  Upstream TF-A does not
>> have sufficient code to build either PLAT={qemu,qemu_sbsa} with
>> the RMM enabled, so that can't be tested either at the moment.
>>
>> All I can say is that this doesn't appear to break anything else
>> with x-rme=on.  Which is less than satisfying.
> 
> Have you tried 'make check-tcg' ? I get:
> 
> make: Leaving directory
> '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'
> make: Entering directory
> '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'
>    BUILD   arm-softmmu guest-tests
>    RUN     arm-softmmu guest-tests
>    TEST    test-armv6m-undef on arm
>    BUILD   arm-linux-user guest-tests
>    RUN     arm-linux-user guest-tests
>    TEST    semihosting on arm
>    SKIPPED semiconsole on arm because MANUAL ONLY
>    TEST    convd on arm
>    DIFF    float_convd.out with
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_convd.ref
>    TEST    convs on arm
>    DIFF    float_convs.out with
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_convs.ref
>    TEST    madds on arm
>    DIFF    float_madds.out with
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_madds.ref
>    TEST    munmap-pthread on arm
> **
> ERROR:../../plugins/core.c:221:qemu_plugin_vcpu_init_hook: assertion
> failed: (success)
> make[1]: *** [Makefile:174: run-munmap-pthread] Error 124
> make: *** [/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/Makefile.include:56:
> run-tcg-tests-arm-linux-user] Error 2
> make: Leaving directory
> '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'
> 
> But I haven't run 'check-tcg' recently, so maybe that's an
> existing bug rather than something in this series.

Not today -- I only tried system mode because, obviously.  :-)
Let me double-check...

r~

