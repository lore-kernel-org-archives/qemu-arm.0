Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2667758ejc;
        Wed, 13 Mar 2024 12:12:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvEC5PTLAgmGlMYDkE7yctWd8HYOo8EXJJBx9opgaul65Q8y/Ak92JXs6vgYYoKk/uwG9qXMRXQORpklDgN0BosbGZ9SNV
X-Google-Smtp-Source: AGHT+IGhMlymYe0yq7mGatUroyzgkgiHiFwEgGGFeBjhX+4jA8fg8p6TdjY5TfV2b6HasbT/CLVa
X-Received: by 2002:ae9:f215:0:b0:788:255b:3f5e with SMTP id m21-20020ae9f215000000b00788255b3f5emr694048qkg.75.1710357176529;
        Wed, 13 Mar 2024 12:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710357176; cv=none;
        d=google.com; s=arc-20160816;
        b=Vt/84AggXiBYLwKFPUnf3DLb32zRDZprJbqKB5yGhV4m6Boa+I2FYVKAj3AFW1xt/R
         Yz0T+wF4xfI3QnVPs2pdj98zfP11NcbhzVwO5lEAbQCGn3tRi4qVCWLcei3yynuiduOR
         leMD3ZHUCsoqgeCBOf0dFTzQ6y+XfJMS7XtCHKa0GNx3SRvM82U3V9aTz0fRfxHq3THA
         bx6gkLcdzt9Z5hixdKnOMAhRyE54aM3EvycZiF37c6Y9ezwlS8Drk5+pY3WpxsoE1F4P
         a33mWaoyOzDEeH9kKnhTIJjGt5ZCCLA+zBZWCvsmgMOfm2zlLuqiC9xhGLqLPhSmdUr4
         vZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id;
        bh=dkPJwQB5WpogXWAK0veLpn3jDoLGj118SyNxpCPsz5s=;
        fh=BI9Pe6Z9Mv/w/YnpyeiS1KSHJEuys+gj/NtrFzpHJfM=;
        b=Q0LtwLI5EaSPukgbI808f/yrqlF4fXXxhfWpledSm2La9jKhx9qEFEHaJyZ14h8f/D
         UEbZRjlN97jdzTA7dabYE+F90L/Sn0hK5L2gX6GBCC541BMAp3TD2G0HM/Cc5cami96a
         KdKrHTq8rGO458z0fMvEKO/1Wff0YxuJJ0RyWiQpCAQAsOzWqHKhw+riCRjWDz2COBXK
         TJyzrAh5jr+xHVZUj82u8+vc2qVBEK11z5l0z2aVkL5mhrbINdF3dqFYguGRiEmHbML5
         kj0gimIqsEhoDsbp2Okbp7hlD7KXwOCgHJa6dd7/1kR0rVHcX9JYMWtVah/OXxkLvlkw
         MYvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a05620a030100b00788371ee81csi10263246qkm.25.2024.03.13.12.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 12:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkU1f-0001PU-1N; Wed, 13 Mar 2024 15:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rkU1b-0001PL-LW; Wed, 13 Mar 2024 15:12:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rkU1Y-0007fe-BW; Wed, 13 Mar 2024 15:12:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0B2C755BBF;
 Wed, 13 Mar 2024 22:13:24 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9C71A9899B;
 Wed, 13 Mar 2024 22:12:19 +0300 (MSK)
Message-ID: <0ad81b09-e115-42df-a5c0-b8032b0e8875@tls.msk.ru>
Date: Wed, 13 Mar 2024 22:12:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm: Fix 32-bit SMOPA
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Zhuojia Shen <chaosdefinition@hotmail.com>
References: <20240305163931.242795-1-richard.henderson@linaro.org>
 <ffe7207d-c88f-444f-804f-a3597976ee3e@tls.msk.ru>
 <1f5e8229-18d5-46e5-afba-3fecf2c5504b@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 xsBLBETIiwkBCADh3cFB56BQYPjtMZCfK6PSLR8lw8EB20rsrPeJtd91IoNZlnCjSoxd9Th1
 bLUR8YlpRJ2rjc6O1Bc04VghqUOHgS/tYt8vLjcGWixzdhSLJgPDK3QQZPAvBjMbCt1B6euC
 WuD87Pv5Udlpnzf4aMwxkgfTusx+ynae/o+T5r7tXD+isccbC3SiGhmAPxFyY3zGcFk4+Rxc
 0tP8YY2FWE/baHu+lBDTUN79efWAkHhex1XzVZsV7ZD16rzDbXFK5m6ApvGJWlr5YDEEydTF
 WwmvwBfr4OINVxzEG/ujNiG4fpMf2NsnFGyB9aSbFjXZevB4qWkduYYW+xpK1EryszHtAAYp
 zSBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PsLAlgQTAQoAQAIbAwYLCQgHAwIE
 FQIIAwQWAgMBAh4BAheAAhkBFiEEbuGV0Yhuj/uBDUMkRXzgoIBEZcUFAmBbcjwFCS5e6jMA
 CgkQRXzgoIBEZcUTIQgA1hPsOF82pXxbcJXBMc4zB9OQu4AlnZvERoGyw7I2222QzaN3RFuj
 Fia//mapXzpIQNF08l/AA6cx+CKPeGnXwyZfF9fLa4RfifmdNKME8C00XlqnoJDZBGzq8yMy
 LAKDxl9OQWFcDwDxV+irg5U3fbtNVhvV0kLbS2TyQ0aU5w60ERS2NcyDWplOo7AOzZWChcA4
 UFf78oVdZdCW8YDtU0uQFhA9moNnrePy1HSFqduxnlFHEI+fDj/TiOm2ci48b8SBBJOIJFjl
 SBgH8+SfT9ZqkzhN9vh3YJ49831NwASVm0x1rDHcIwWD32VFZViZ3NjehogRNH9br0PSUYOC
 3s7ATQRX2BjLAQgAnak3m0imYOkv2tO/olULFa686tlwuvl5kL0NWCdGQeXv2uMxy36szcrh
 K1uYhpiQv4r2qNd8BJtYlnYIK16N8GBdkplaDIHcBMbU4t+6bQzEIJIaWoq1hzakmHHngE2a
 pNMnUf/01GFvCRPlv3imkujE/5ILbagjtdyJaHF0wGOSlTnNT4W8j+zPJ/XK0I5EVQwtbmoc
 GY62LKxxz2pID6sPZV4zQVY4JdUQaFvOz1emnBxakkt0cq3Qnnqso1tjiy7vyH9CAwPR/48W
 fpK6dew4Fk+STYtBeixOTfSUS8qRS/wfpUeNa5RnEdTtFQ9IcjpQ/nPrvJJsu9FqwlpjMwAR
 AQABwsBlBBgBCAAPBQJX2BjLAhsMBQkSzAMAAAoJEEV84KCARGXFUKcH/jqKETECkbyPktdP
 cWVqw2ZIsmGxMkIdnZTbPwhORseGXMHadQODayhU9GWfCDdSPkWDWzMamD+qStfl9MhlVT60
 HTbo6wu1W/ogUS70qQPTY9IfsvAj6f8TlSlK0eLMa3s2UxL2oe5FkNs2CnVeRlr4Yqvp/ZQV
 6LXtew4GPRrmplUT/Cre9QIUqR4pxYCQaMoOXQQw3Y0csBwoDYUQujn3slbDJRIweHoppBzT
 rM6ZG5ldWQN3n3d71pVuv80guylX8+TSB8Mvkqwb5I36/NAFKl0CbGbTuQli7SmNiTAKilXc
 Y5Uh9PIrmixt0JrmGVRzke6+11mTjVlio/J5dCM=
In-Reply-To: <1f5e8229-18d5-46e5-afba-3fecf2c5504b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: AJSDXWj/Vf9C

10.03.2024 21:13, Richard Henderson wrote:
> On 3/9/24 08:40, Michael Tokarev wrote:
...
>> I tried to pick this one up for stable-7.2 (since the fix is for older commit),
>> and faced a fun issue in this change to tests/tcg/aarch64/Makefile.target,
>> since 7.2. doesn't have CROSS_AS_HAS_ARMV9_SME yet.  I went on and found out
>> that the following commits:
>>
>> v7.2.0-374-gbc6bd20ee3  target/arm: align exposed ID registers with Linux
>> v8.0.0-2358-g3dc2afeab2 tests/tcg/aarch64/sysregs.c: Use S syntax for id_aa64zfr0_el1
>>                          and id_aa64smfr0_el1
>> v8.0.0-2361-g1f51573f79 target/arm: Fix SME full tile indexing
>>
>> applies to 7.2, and lets this "Fix 32-bit SMOPA" change to apply cleanly,
>> including this very change in Makefile.target.
>>
>> Now, 1f51573f79 "Fix SME full tile indexing" is Cc'd qemu-stable already, but
>> it is not in 7.2.x for some reason which I don't remember anymore, so it is
>> a good one to pick up already.  3dc2afeab is tests-only.
> 
> Oh wow, I didn't expect the fix to get propagated back that far.
> I was expecting only back into the 8.x series...
> 
>> And bc6bd20ee3 (from Dec-2022) seems like a good candidate too, is it not?
> 
> Sure, couldn't hurt.
> 
> If it all applies without drama, all is well.

While it goes fine, it doesn't quite work actually:

https://gitlab.com/qemu-project/qemu/-/jobs/6386966720#L2482

timeout --foreground 90  /home/gitlab-runner/builds/E8PpwMky/0/qemu-project/qemu/build/qemu-aarch64  sme-smopa-1 >  sme-smopa-1.out
warning: TCG temporary leaks before 0000000000400714
qemu-aarch64: ../tcg/tcg.c:1052: tcg_temp_free_internal: Assertion `ts->temp_allocated != 0' failed.
timeout: the monitored command dumped core
Trace/breakpoint trap
make[1]: *** [Makefile:170: run-sme-smopa-1] Error 133
make[1]: Leaving directory '/home/gitlab-runner/builds/E8PpwMky/0/qemu-project/qemu/build/tests/tcg/aarch64-linux-user'
make[1]: *** Waiting for unfinished jobs....
make[1]: Entering directory '/home/gitlab-runner/builds/E8PpwMky/0/qemu-project/qemu/build/tests/tcg/aarch64-linux-user'
timeout --foreground 90  /home/gitlab-runner/builds/E8PpwMky/0/qemu-project/qemu/build/qemu-aarch64  sme-smopa-2 >  sme-smopa-2.out
warning: TCG temporary leaks before 0000000000400730
qemu-aarch64: ../tcg/tcg.c:1052: tcg_temp_free_internal: Assertion `ts->temp_allocated != 0' failed.
timeout: the monitored command dumped core
Trace/breakpoint trap

Does it make sense to pick this for 7.2 with the above failures?

Unfortunately this test does not run on a private repository clone on gitlab,
that's why I haven't noticed this immediately.

Thanks,

/mjt
