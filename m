Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4035000lfa;
        Mon, 2 Nov 2020 07:46:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB1EEyhQyRFUaRR/Wdm++5+PbaRdKOBo2ynFRy4WzPs4asqCGm+pXIlK0JM9IoHQVsELMV
X-Received: by 2002:a37:9282:: with SMTP id u124mr15117830qkd.463.1604331977325;
        Mon, 02 Nov 2020 07:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604331977; cv=none;
        d=google.com; s=arc-20160816;
        b=GrJrJSUx3LPVZUrKCOZvkC8AFkWM9/xWar9ZF3w7LiX+ovQ4Oi/3HuYEwyI/vJF/V4
         N55N+QjEHyRJjSjCmIQhDYjO2Bdf7X8l9tnk674nWNW2AUQiidUXSeA2nHatR6Old3H2
         vi4tD7f2d64625aTOfAV0f27SHM6l0QJh8kO5kZKjEUCBW+BRKxY/6dadTWQFhddbF/D
         5fLL24jyhObggRWuN006xVHtl2/TA09CfeCRudaNb3pCJrbPewpXElJ96go6GX8ksjog
         MrkfmUAG8yuAiERu2XZsfPFamO+0jaQ/3Kq2vTX3/a7TOKhl1FVekBXBv1Pae2WP+MCF
         swlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZVQ6kbgfOwXBRNh9vECPguzgh8swVrhrdLXJyl8izOY=;
        b=X/+bvomO51uBuhzcbJbViucAZB7w3+icJ7rxpGQXziTKrVX2V6ghbnXLnFABAikljF
         v/wTKMgKzNJ5Y5mPAqjYl/ncm8byk7CZb66hkDZlr199dWLh4rkKaUU3/Sz6JeQv4lNn
         s0GKlHdDKK1L6mfdifXsXi6b2SLEgq4+77Zs3KxvXhTahVkcow9YtEBcXotUsgdsDH4D
         rCNs2FcUYFOZxBSW5acuSJSoUqPAeWMeMg/gdcMuKe3TmBH1KowHAsIUJnXoLUx7fUfw
         ZXbRpJWw5zopM4Ltu46fey+dlLs600wNhXtOCT0aJJo1iCsPr5D2tJgK8Q6IvUsoD5kN
         /Nuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ob+tAHSX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si2369214qtr.345.2020.11.02.07.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 07:46:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ob+tAHSX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZc2C-00025X-PU
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 10:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZbzs-0000Cv-7q
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 10:43:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZbzq-0002VW-HD
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 10:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604331829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVQ6kbgfOwXBRNh9vECPguzgh8swVrhrdLXJyl8izOY=;
 b=Ob+tAHSXAd62zA5271cYY1MgvwlrjFFnOgM8PHQlN2tYl7qtmV8QL9jFw2uFK2dBlvH8pV
 dyPYrUUDX0cgrxcG463qWbX1RCCRZVTNM3b4EdXIp+sMWcdzJ2H16O7PXrNseTt8NsHqsl
 MLOEZnjZmCmXPfOH+5I+faq76lL3FK4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-Drh5bWuIP5OefH2bXAgaAg-1; Mon, 02 Nov 2020 10:43:47 -0500
X-MC-Unique: Drh5bWuIP5OefH2bXAgaAg-1
Received: by mail-ej1-f71.google.com with SMTP id p19so4377565ejy.11
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 07:43:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZVQ6kbgfOwXBRNh9vECPguzgh8swVrhrdLXJyl8izOY=;
 b=brXbvYCiEZvcD+I/7wPxz5BrIP7uLPedm13Q+Bz0bQQphQGT97qSbGw9PpEx1VzJJ/
 MvS6bUzdpn2x1goCyBm8WaO+gozZcBj8EjYRXl1XD3x6+Drd0a47dY5pZ1JVELMrURqu
 qKOhETvF1su6UCpI1yrN+l4LyGgjYhPUGZgSvcS3D5fxmBLuAucB0xAYiiK40kHHLfON
 dJjD3SU+3TRVxL4MeGUbbAQxAx2kI/6JFyzO7xm2zvB5V5ol2iKkAFLlbnEFX66MgPBz
 iDQCo6yXwue3tOKU29NNmgOs9bF7yOVPoJ89QjJetvSECwyahb73GvB7CqaLRwcZEoDS
 9tgg==
X-Gm-Message-State: AOAM533H4ZNggWycaEzvCbhcdP1D05/wnThe/bbggcw7SqYm8mSirCZ+
 G2UYqIVGDK1EtSzirD+3oGGaLklUX2YPwNlmeToANbKQZFFDQhZpQDpNptJJjpJGASwqLvAqPmq
 +qhoBO+tubsv6lBA=
X-Received: by 2002:a17:906:2b8d:: with SMTP id
 m13mr11998174ejg.536.1604331826745; 
 Mon, 02 Nov 2020 07:43:46 -0800 (PST)
X-Received: by 2002:a17:906:2b8d:: with SMTP id
 m13mr11998160ejg.536.1604331826573; 
 Mon, 02 Nov 2020 07:43:46 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id s15sm6819864edj.75.2020.11.02.07.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 07:43:45 -0800 (PST)
Subject: Re: [PATCH] tests/qtest/npcm7xx_rng-test: Disable randomness tests
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201102152454.8287-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d46e922f-5e9e-3f29-d32e-177bb7905e0d@redhat.com>
Date: Mon, 2 Nov 2020 16:43:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102152454.8287-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tyrone Ting <kfting@nuvoton.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kmR119EITAZg

On 11/2/20 4:24 PM, Peter Maydell wrote:
> The randomness tests in the NPCM7xx RNG test fail intermittently
> but fairly frequently. On my machine running the test in a loop:
>  while QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/npcm7xx_rng-test; do true; done
> 
> will fail in less than a minute with an error like:
> ERROR:../../tests/qtest/npcm7xx_rng-test.c:256:test_first_byte_runs:
> assertion failed (calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE) > 0.01): (0.00286205989 > 0.01)
> 
> (Failures have been observed on all 4 of the randomness tests,
> not just first_byte_runs.)
> 
> It's not clear why these tests are failing like this, but intermittent
> failures make CI and merge testing awkward, so disable running them
> unless a developer specifically sets QEMU_TEST_FLAKY_RNG_TESTS when
> running the test suite, until we work out the cause.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/npcm7xx_rng-test.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
> index da6e639bf6f..e7cde85fbbc 100644
> --- a/tests/qtest/npcm7xx_rng-test.c
> +++ b/tests/qtest/npcm7xx_rng-test.c
> @@ -265,10 +265,16 @@ int main(int argc, char **argv)
>  
>      qtest_add_func("npcm7xx_rng/enable_disable", test_enable_disable);
>      qtest_add_func("npcm7xx_rng/rosel", test_rosel);
> -    qtest_add_func("npcm7xx_rng/continuous/monobit", test_continuous_monobit);
> -    qtest_add_func("npcm7xx_rng/continuous/runs", test_continuous_runs);
> -    qtest_add_func("npcm7xx_rng/first_byte/monobit", test_first_byte_monobit);
> -    qtest_add_func("npcm7xx_rng/first_byte/runs", test_first_byte_runs);
> +    /*
> +     * These tests fail intermittently; only run them on explicit
> +     * request until we figure out why.
> +     */
> +    if (getenv("QEMU_TEST_FLAKY_RNG_TESTS")) {
> +        qtest_add_func("npcm7xx_rng/continuous/monobit", test_continuous_monobit);
> +        qtest_add_func("npcm7xx_rng/continuous/runs", test_continuous_runs);
> +        qtest_add_func("npcm7xx_rng/first_byte/monobit", test_first_byte_monobit);
> +        qtest_add_func("npcm7xx_rng/first_byte/runs", test_first_byte_runs);

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    }
>  
>      qtest_start("-machine npcm750-evb");
>      ret = g_test_run();
> 

