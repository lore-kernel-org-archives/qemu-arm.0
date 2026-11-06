Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27028606A334
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xj9IZ15z
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPE29-0001L3-K2; Fri, 06 Nov 2026 02:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xPE27-0001KD-SB
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 02:06:44 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xPE24-0004c9-NM
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 02:06:43 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso136555f8f.2
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 23:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793948798; x=1794553598; darn=nongnu.org;
 h=content-type:content-transfer-encoding:mime-version:message-id
 :in-reply-to:references:user-agent:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=JFO3oSEU1vOMULwohE7UZZcdkuXjFvGj+btGyl5NkdE=;
 b=Xj9IZ15zJRfE6peu57Gy6ekucJm6iIPir4NtwqgUviR+5PZJ9UkQZgwaDnb24C5pRh
 f5KTj8fRhaoy/VjZOTFWgmdZgI5oOJF/5SY0JkhjWgXmwYMNKKqnCuJ2cKBmClBPTGMd
 ooETiHxFaddXdvcdc16F8vVpQzlpojPQQZ0sg35nejPAOR+wffacD0fTzi0voq6jpMal
 B+9bFx/KtNaquqDESomuiRxo3HQPXN0OAFHYu8ezpkFqsW1MH6dxOnOjmgSWcOEK9Wa7
 9MXUBLUcLxZD/eX35H/Tk6OIwzEnMFQ31Yperwc9785eAiGNzKXIN1xzzjbxjToWJy+W
 EvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793948798; x=1794553598;
 h=content-type:content-transfer-encoding:mime-version:message-id
 :in-reply-to:references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JFO3oSEU1vOMULwohE7UZZcdkuXjFvGj+btGyl5NkdE=;
 b=qq14JNq/aDu2CFKd7TBGV+UVIm1tN7FuyuFmirXaherZhXETcLoaa74ku/AotXwXsO
 eWBdsV2/AtH2Pgy6PVz6r5M/CyCeW7e5aUMVlJoh44sftVLdN9+kPo9ln3ChNxN8CiP3
 1cPJh6eCqIpnuZJV5h6WLK9iU6V8lEjzTWe9cAb5a6suv56I+exvrd2OEwsckovdOCEw
 wZz6uHeTu37eK88+tZoCRPTdA5rvL/nhfHh9qgfqyYiRtSRwe3lD1ep187SWa1ttgQOs
 +smQ8KoAEbZPeyD4sR7HfWKyr/iNfCXriTFQmY8ttwPVFnuf93qZIHoUzcSok9PvpXt4
 V5IA==
X-Forwarded-Encrypted: i=1;
 AL+hErHifM5+AagDXD2CH3oiJ39ET3Z5oe7l/YvRGIYjRtetE9+lF7eCfZ+dqOOb0/NWjLTQrcbkXWx69g==@nongnu.org
X-Gm-Message-State: APuU4Z+r9Il+hK+qCbBsr7P16j/6b07wXtfveWkOlmrRvzDMlAarOK2s
 Fi+ruo39DMbZIVmIkKN6q2fLBDWlsnMlSHwqJjPw8mo86G6wfNYbkgH0Va1HtpwcjeE=
X-Gm-Gg: AYBFou14OSroIYrdB0+NQvO+oZC3ewHcE9kFdc8eTjvsUutiOUGHma3lisCOFyAxN1L
 Y1QEhOaPX1FO2tjEvSN32UeOQlmkQjdstmm81dnKE59NKpIvbQyR7JjQh8/UQuhRVDQnXNCkX3a
 hhzTxyOOrcMONVV/h+GTxN1w/Fn7vN5l6swI6G8qUPahjundAEM6mtStt4jpcVcuzKk/0EUpeAu
 P6bqb+wp5aV5FuAdFMpr7QNZ6eYMtJcCciHFfaDCa2gqQgFpKk6wX8f1+vMtJ/e8ffz0EH/vm1d
 diRtBYkOImZp7Bmu555gbEWg6kmzrg/D+w8GkwSla87BwfPEkIfv4DaXZxkP7bQAWeY8jRqTT7E
 Ab92DiUNbUyrsCsf3ibzoIw3mOn0vTZtyulzYOnlcrSArzHXsqKQ73y2X7VenJZjjG7b2k5ulLi
 b4Njg29n8Zxu7z9ABhItcDZHokwyAkxHplhq5G5IQ5XcWWKkfIBIoolsgeXng5YVIkZoOVDTr7h
 HHm6DDWcD2IklPei/L2S2tzGEJzpe7AY+T0rmrm9LaWlSxT63yepq1QJRseJhBWWTDTqvVKYRKI
 XNyXRxYkTrxScNDgxK2Cj3PZuSw6xGvsSjSaiiqAJcwBQpyiVE5BuMI2lVg8NTeIBn7CE4xbywU
 SQ7ICNNGlGhD2Sr1d6tlt7pPc0xdwM/j00GHi3XtA6XNWCotFBfAvXzxPWhT/e2zZLHlOWS9ixF
 kZUh6Vv4+ar4yAGwwBhN8tMKXBxYCqjZHMiw==
X-Received: by 2002:a05:6000:2488:b0:48e:2448:ea23 with SMTP id
 ffacd0b85a97d-4927807f0a8mr3433230f8f.55.1793948798488; 
 Thu, 05 Nov 2026 23:06:38 -0800 (PST)
Received: from meli-email.org ([94.66.192.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7cc5f11sm1823352f8f.49.2026.11.05.23.06.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2026 23:06:37 -0800 (PST)
Date: Fri, 06 Nov 2026 09:05:39 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm/ptw: check XN for ARMv6 in get_S1prot()
User-Agent: meli/0.9.0
References: <20261105-armv6-xn-check-v1-1-fbeff926e692@linaro.org>
 <CAFEAcA_qmyR0E3+n8GByA6=kDwDQomCpk399DEc8pOPr=sqEaQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_qmyR0E3+n8GByA6=kDwDQomCpk399DEc8pOPr=sqEaQ@mail.gmail.com>
Message-ID: <to2jr0.1wqw0hsi7q7wn@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x434.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 20:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>On Thu, 5 Nov 2026 at 09:44, Manos Pitsidianakis
><manos.pitsidianakis@linaro.org> wrote:
>>
>> For the ARM_FEATURE_V6 case, it seems like we retrieve AP and XN bits in
>> get_phys_addr_v6() but we don't check the XN bit in get_S1prot().
>>
>> Change the `if (arm_feature(env, ARM_FEATURE_V7))` check in get_S1prot()
>> to `if (arm_feature(env, ARM_FEATURE_V6))` since v7 implies v6.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4367
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>
>I think this is worth backporting, so:
>
>Cc: qemu-stable@nongnu.org
>Fixes: d8e052b3876356 ("target-arm: get_phys_addr_lpae: more xn control")
>
>> ---
>>  target/arm/ptw.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index 2e67d02493bd463cfd2d31ecf1316272ac3f1d99..b8b22b014e0574340a85abe73f3d9611d2360219 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -1595,7 +1595,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
>>          if (regime_has_2_ranges(mmu_idx) && !is_user) {
>>              xn = pxn || (user_rw & PAGE_WRITE);
>>          }
>> -    } else if (arm_feature(env, ARM_FEATURE_V7)) {
>> +    } else if (arm_feature(env, ARM_FEATURE_V6)) {
>>          switch (regime_el(mmu_idx)) {
>>          case 1:
>>          case 3:
>
>Digging into the various versions of the Arm ARM and looking
>at QEMU's code, I think that "allow this for v6" is correct,
>but  I think that ARM_FEATURE_V6 will always be true here
>so we don't need to explicitly check it. The two callers of
>get_S1prot() are get_phys_addr_v6() and get_phys_addr_lpae().
>If the CPU isn't v6 then it doesn't get those page table formats.
>(get_phys_addr_v5() is simpler and just figures out its prot
>bits directly rather than calling this.)
>
>So I think we can make this a plain "else", and delete the
>existing "else" clause that sets xn and wxn to 0.
>
>(Strictly speaking it is possible to get here without V6, because
>we don't enforce that a guest on a v5 CPU can't write to the
>SCTLR.XP bit which should be RAZ there, and we don't ignore it in
>get_phys_addr_nogpc(). But if the guest does do that then they're
>in UNPREDICTABLE territory and whether we give them v6 VMSA with
>XP or v6 VMSA without XP doesn't matter.)

It sounds like this is equivalent to this patch. Do you want me to send 
a v2?

Thanks for looking into this!

>
>thanks
>-- PMM

