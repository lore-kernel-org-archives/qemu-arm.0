Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3835322ejy;
        Wed, 5 Jul 2023 13:39:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5GS1t+RWiEt8AX+kIkLYbLixmXR+p6cKWGPdlIHsh/SZe/kvwzEl7UmGpJ7SN/tHawBLwD
X-Received: by 2002:a05:620a:2a02:b0:765:4d13:dbd3 with SMTP id o2-20020a05620a2a0200b007654d13dbd3mr21695284qkp.43.1688589563364;
        Wed, 05 Jul 2023 13:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688589563; cv=none;
        d=google.com; s=arc-20160816;
        b=qcZgLaPK9Z2Iw2Hl04ilSXV15ytB/yt7loA5meGrWhW9mwhr6ZWggMOkgCE01WiuJI
         rq8iShjU6wLIuJY7y6+hp/xz8saU8NrKEg8xNZzLM0SljQePafYlc1axbhrR/WTxIhtx
         Yce/WLGQXHa6bEjAwVgwzVvtPzAMEKycNsCAfKSP8HwfEgxL8tn+5nPKVYZW/uZrrvyO
         QDLjmCSqOxeZfXXrq4hyykSuVoddguQG3uNaxy1MeH+I/UAxeH7bMjNs/i4ud+u17Jiu
         91mBkjWKaOTBs+aQLCaVRV3hm3VtQdyoLdacGJPfYX5CBOfTfA4kX5JYGrHmALdGIkzE
         P8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=uhCYOBkUknaa+HV2QlqWt5y07AxZvMkkDzj+rfASsHQ=;
        fh=Akj8iOiYewjFMTqCUQ3OrNP1vWFT2Iqvp6chAA9p6nI=;
        b=QlEIfWStJWsekY48YOqrC872AM7cunFeR5avYfoobAYfCWFdr7s3h4n9xnFldwtgQb
         deFU9FFTKdp8SvEvOGSa6gMEE+utrHdYoHorTHazzjjJ0g3hp/RQG78RWcWj6XprGRLs
         WAeFgE0VOIADfAD8uTjzACdlXqphiDztgTe0iGudSOdXO/GlcfjZErUWPCNr87zD95Dr
         +6iPIiHWf8PxSjqqpW2jvNYIPc6wWAhwINvdUdU0biX8Lw4EbwRmCEU8lkteig3ATYB5
         t14IbLHM/pOf8xsP5tbBJ3e8Yqt4nIJnWhItlp/SCHR6QPqILP0/bESY94cbo1HoJbVg
         1f2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fjekj82y;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26-20020a05620a141a00b0076715d75186si17540qkj.533.2023.07.05.13.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 13:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fjekj82y;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH9H5-0005TU-V5; Wed, 05 Jul 2023 16:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1qH9H3-0005T9-Cp; Wed, 05 Jul 2023 16:38:53 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1qH9Gy-0006hx-Ao; Wed, 05 Jul 2023 16:38:51 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F2C520080;
 Wed,  5 Jul 2023 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688589524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uhCYOBkUknaa+HV2QlqWt5y07AxZvMkkDzj+rfASsHQ=;
 b=fjekj82yrlt36UChfWdYjX7DdXPiy21kp8tnshagRwYtEVSxUu10glKHd1ZFGdsphJNkvK
 yARcnrphrmL1qN1eGuBzgc2tRVwH5jKdkybnKfi/sm5FsJ51rGvFFT1aehTTohU8k+AMlm
 pujPkqcRRb6jfboWZxXRrBNMeyD9Bfw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688589524;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uhCYOBkUknaa+HV2QlqWt5y07AxZvMkkDzj+rfASsHQ=;
 b=LlGTD/+RpQT9onbe7ZB6cqJ2VPjDqS9JbtfNvAaciRnEjy1NpyGN20SQhZAlShYdLlZksA
 1s8rHKRTYQn4e8BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0187713460;
 Wed,  5 Jul 2023 20:38:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id djBqL9PUpWQbNQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 05 Jul 2023 20:38:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
In-Reply-To: <837e45df-08c9-44c9-b4c7-489251901860@linaro.org>
References: <20230628164821.16771-1-farosas@suse.de>
 <d8f954dc-8a69-7593-716c-e360d2c8e47b@linaro.org>
 <CAFEAcA9QSS7qs2kcCuyrDrRc6tb_0euMD3vFJ=_Q8s8dJYBRfw@mail.gmail.com>
 <837e45df-08c9-44c9-b4c7-489251901860@linaro.org>
Date: Wed, 05 Jul 2023 17:38:41 -0300
Message-ID: <87jzve3xgu.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: gxmxyNxOviar

Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/4/23 17:44, Peter Maydell wrote:
>>> IIUC tcg_enabled(), this guard shouldn't be necessary; if CONFIG_TCG
>>> is not defined, tcg_enabled() evaluates to 0, and the compiler should
>>> elide the whole block.
>> 
>> IME it's a bit optimistic to assume that the compiler will always
>> do that, especially with no optimisation enabled.
>
> There's plenty of other places that we do.
> The compiler is usually pretty good with "if (0)".
>
> My question is if
>
>>       if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) { 
>
> needs to be written
>
>      if (tcg_enabled()) {
>          if (arm_feature(..., M) {
>             ...
>          }
>      }

Yeah, that doesn't work either. I don't understand why in this
particular case the compiler seems unable to remove that code.

Can anyone else reproduce this or is it just happening on my setup?
Maybe something is broken on my side...
