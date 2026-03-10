Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE799FD88CC
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 23:08:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w06BH-0007Su-8p; Tue, 10 Mar 2026 19:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w06BF-0007SZ-AO
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 19:08:01 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w06BC-0001jT-3s
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 19:08:01 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5a12cd0bd79so6997450e87.2
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 16:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773184075; x=1773788875; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QpnxpHAyjsumQQONTdWDImo4bIsDlmfX2AhU4bIxn4k=;
 b=Ho32CDa0YekUuNv+aGKtpRQk7bkY1X+D9cpKhm2kYpIutq5yAYLjXQyhMMiOHme2yQ
 gG5ZJSuSXryWd4dN4nVWs6wWL4oKZfqcKibzx+6oqFOSXgOxF+ynmOVL396zJvwWxJLu
 GYUZ904ifIVFbaDTzV8wk1hWTR11EDxVUYKTmxhQArsJDTZUvj3nCrTPrbuAytkT2lAY
 0ND8LffncNLrdN49SAvtkGPtVM6krxQvjQX7tkK9ZPVVCwaJkZjGsVnc/4DKKXMTp1Dd
 4+sb3HPc+/nBA22ytLB/e3DGpXhnKVvva5l2w9E6GiVeTWS9sb4XoHTEeibK5Kqb6ZGN
 9JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773184075; x=1773788875;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QpnxpHAyjsumQQONTdWDImo4bIsDlmfX2AhU4bIxn4k=;
 b=AqwSfoPFmMYDSJ4rCJI9Wu34EOqU/8C8OQ4Lvg2sBuWWoGvV87wX2VQ1lWltbiTKoN
 CHmJWCnLywwpNhe3BbFgkdJneoc/j4HQM6U+ZsyaE13kYpm0DbC08Hnchvp4LxKHeL5n
 7ROu8ATUgNhSrBsQx0MOYW4YKFpxdHYOFggmusFl7nyL9Y+04wdJnCPtq1fTTFUqYEXh
 con3ZDlS7ckRbqyCs/HDnDeNdb2k088Ay76FzBn4C51tJTfMqbmbB2ZkOX5j1Vi6ADqH
 7igatK1VCeymqUPR9Qfov5yH4X1F7QH8OMF8TKPlJMxZK3n6xMnzxN5LfWRZhz9EySBZ
 EqyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1ybWqMI92wEzmwXa4epxQo731R5pIX5Uv6RgMTbylJ/n4oyWhT5ZU4u2ERL4hfrsoobklYAff4Q==@nongnu.org
X-Gm-Message-State: AOJu0YzVyPhsb9JYMXqJDQVhMOoDsZzgpsryuEyRtfarTA7NkVhRJCbj
 N40/y55naZYMDUY/AnU/Ie1R+JgbLloy+lRu9SxExlDbBV1+hYe1KaNTTSL9p9zk6TM=
X-Gm-Gg: ATEYQzwy3KaerC7OEcEebm5hHUXz5awDcjoc6/6FwgjDCzExC11CKZSOfQotahctWHD
 P4c2O3ghuwMqK9N+F3/PjTpCNsVbrFri4iZ55Htg1lWALPNeXZVDEtiq21U/C3qHdr1k5OpS2Kx
 qMhhlo9VX80Y7bi4c1ZypWXVYBbU+WCdFTpljY5z8PdclFUe1YAtk45hIbtdxq7hNSth7hepr90
 oczWwPq94k9TyFFDR2g4YJfmOy1A3U04RR7INFDoBG638TwIbEP01O9av6mCvmF1OtG/wP8C2ir
 F4+Q97HznDmUtsbzrYrDvcxOVvfxHVZL41C/BV8pbzx7ClA4NS6jmWV25PEj2AoA8SGzSggAiFf
 iuWJyRXkxXMbwMkewULsCiLvrMnAwOeSB11/5W9YSxUHPDAgbIV7ZtOTUp7p4Fpi05yD6Eik+QF
 CsN8XEU1ZZ5TO7Da1ml1fUmHAyLeFx3toCO5VIt9Qq5DijDHh3Gh0QEnoPOEEoHI7rkw==
X-Received: by 2002:a05:6512:6399:20b0:5a1:2e14:134c with SMTP id
 2adb3069b0e04-5a156ba055cmr64971e87.5.1773184075137; 
 Tue, 10 Mar 2026 16:07:55 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a15602e239sm89267e87.23.2026.03.10.16.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 16:07:53 -0700 (PDT)
Message-ID: <7e6cdb4b-4cb8-4968-acce-56db2f0ee307@linaro.org>
Date: Wed, 11 Mar 2026 00:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tests/docker: add gdb-multiarch to all-test-cross
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
 <20260306161728.2657486-2-alex.bennee@linaro.org>
 <78c8b024-6dd5-4f1b-a19c-c7a71c7acc9f@linaro.org>
In-Reply-To: <78c8b024-6dd5-4f1b-a19c-c7a71c7acc9f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/3/26 23:33, Philippe Mathieu-Daudé wrote:
> On 6/3/26 17:17, Alex Bennée wrote:
>> This allows the gdb integration tests to be run as well.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   tests/docker/dockerfiles/debian-all-test-cross.docker | 1 +
>>   tests/lcitool/refresh                                 | 1 +
>>   2 files changed, 2 insertions(+)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I'm getting:

Python Exception <class 'gdb.MemoryError'>: Cannot access memory at 
address 0x45001fff
Error occurred in Python: Cannot access memory at address 0x45001fff
qemu-hppa: QEMU: Terminated via GDBstub
make[1]: *** 
[/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121: 
run-gdbstub-prot-none] Error 1
make[1]: *** Waiting for unfinished jobs....
qemu-hppa: QEMU: Terminated via GDBstub
warning: Could not load shared library symbols for linux-vdso32.so.1.
Do you need "set solib-search-path" or "set sysroot"?
make: *** [/builds/philmd/qemu/tests/Makefile.include:66: 
run-tcg-tests-hppa-linux-user] Error 2


