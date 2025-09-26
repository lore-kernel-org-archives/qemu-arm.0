Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A43FCAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 15:45:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v2AcH-0007oT-4q; Fri, 26 Sep 2025 11:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v2AcE-0007lM-SW
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 11:44:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v2Ac6-0001JN-0T
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 11:44:09 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3352018e051so2000140a91.0
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 08:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758901431; x=1759506231; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ra8QnQqfsGiXDpU/ZxfE1BAu0nMnF2EF83yfvogVFvA=;
 b=UHpZlT+fFsmZlA4VYX6qgjCq64WHVyAYwAbZiocgsr31guYxSSy5LXn/ffAug0XP5F
 qcjfsPG+NiYSdgkWxZo++TMGvNkCt1QWpE4TRiBTH3jXz33Flq2hPbWKrOVhbuGDtu28
 eeEwtX771ErUeTd6pwKn1HnjLB7eM04+RwKDxQaGI4s/bP/oReNw7rXXk6L7dSCKarZX
 0OAVH03wb/E+g8mkwghTdM98bpt/dHS+gvkg3imGutw40qx4QpSwZ6rtDsOlahiwZg3n
 MtyunEhaq+0xqwpVXuce8gw+IPotlHrm2bZbzfn8dSLsnZsAtPE3IKFhD8t/+XwX/bKU
 haDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758901431; x=1759506231;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ra8QnQqfsGiXDpU/ZxfE1BAu0nMnF2EF83yfvogVFvA=;
 b=VFlUbw3NItW2wUxTBZ4ekKOa3B3lw5DqGKoXewtpi47Kp85MVdOwELX3Y8REHHDNnV
 qeL6aeVykABmwuOgm6HIK+z7c06gmGFmTm/wt2F45sMQmGWacitz7eE0zLPL3tG/5fJw
 3r/IcOoWJnWmsF6UJ3hskzeji6hIKq8qf/b+ZbaihPi8pJghrj5XW97Mru600SCEpuUQ
 hJ7TbDqEQowgYOrqUF389CAbSCFIXisxFv4wvWTpBD5SacVLQBfirwyMGIiQ7+mS5UzX
 mjJC4P21ac6XyqcUxx9y9zkS/wdYf3BQiufGa6aWvFVLURedtxvrQ5mcJWxLz0odUIo2
 NM6A==
X-Gm-Message-State: AOJu0YzW+zGlOu9/jytg2x9ZU5kvAlxmr/qYMJbBCu4FmuoI5PfnXmFr
 AHdtbyu1yPr/IuBGK400EWPG6tO8OtzFF6x2AyYqyzZwGeIbDM+qDsVX4kdgc/9w4Jk=
X-Gm-Gg: ASbGnctmWzBxCMZPCkBoSAYsoW24jFTM35DLZb2lWAnpmXagMoqkihRW61+l/Pp1+Rr
 NNCr81Y1pjSXSOGsF0X+czvGZkPSH8WHfrnSCFC4w2KqzrRV73tUWPKiCHi4UQPpxyQ8Ggi+6yj
 L3F7wsQTlZs69KUpd/CiVUTpdqnxRJ9xKb6TZ8uGPRYPA6hydNzNvC1+0H19oGMR0bNlfsFuy8H
 i2uVvJqqL+PSk4IkarI4ryOlgJt7bEwWMVyaW7u2GqHO0LvLI2mhZkswWmfAwR6DXWZkKfdVXR5
 8S64zSQsqMb4DGE0+U8JvMFgGN8lEufgjUdNwHFKejuJw6hYodme/TilGgF/VwABPCE41Ol9Im0
 s7bACSfGhhJ+NiMOtJ77RrIXXH6dEpn+9WZ/eOR+QZm/09wtoBPd0/rnF+mipNVY5
X-Google-Smtp-Source: AGHT+IHpFjC/RMYj3TNX/sp9pXx1G3WZDdGpu+fHlbsiZOoatyS9S50j+gvIAWMWwEGx4OSudIRAZQ==
X-Received: by 2002:a17:90b:1c91:b0:32d:f352:f75c with SMTP id
 98e67ed59e1d1-3342a26b46bmr6856273a91.13.1758901430797; 
 Fri, 26 Sep 2025 08:43:50 -0700 (PDT)
Received: from [192.168.0.102] (189-47-45-49.dsl.telesp.net.br. [189.47.45.49])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33471d711a6sm5777985a91.6.2025.09.26.08.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 08:43:50 -0700 (PDT)
Message-ID: <34599995-fe56-436d-82c2-3837037a58a8@linaro.org>
Date: Fri, 26 Sep 2025 12:43:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] tests/functional: Re-activate the check-venv target
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <20250926051542.104432-2-gustavo.romero@linaro.org>
 <5aefdfa3-4b8b-4512-a6a4-1a1684352d0f@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <5aefdfa3-4b8b-4512-a6a4-1a1684352d0f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi Thomas!

On 9/26/25 05:34, Thomas Huth wrote:
> On 26/09/2025 07.15, Gustavo Romero wrote:
>> Add check-venv target as a dependency for the functional tests. This
>> causes Python modules listed in pythondeps.toml, under the testdeps
>> group, to be installed when 'make check-functional' is executed to
>> prepare and run the functional tests.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/Makefile.include | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 3538c0c740..d012a9b25d 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -109,7 +109,7 @@ $(FUNCTIONAL_TARGETS):
>>       @$(MAKE) SPEED=thorough $(subst -functional,-func,$@)
>>   .PHONY: check-functional
>> -check-functional:
>> +check-functional: check-venv
> 
> I just noticed that there's still a problem: If you run "make check-functional-aarch64" immediately after configuring + compiling QEMU in a fresh folder for the first time, the functional tests fail with:
> 
> ModuleNotFoundError: No module named 'pygdbmi'
> 
> We either need to add dependencies to the check-functional-<arch> targets, too, or we have to make sure that tests still get properly skipped in the case that pygdbmi has not been installed into the venv yet.

Isn't it inconsistent that check-functional runs the test and
check-functional-<arch> doesn't? I think it's a good idea to
skip if the module is not available, yeah, I'll add it in v6,
but would it be ok to add check-venv to the check-functional-<arch>
targets too? That solution feels a tad cumbersome to me to make
them consistent but really I don't have any better idea...


Cheers,
Gustavo

