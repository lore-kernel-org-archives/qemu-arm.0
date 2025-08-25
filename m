Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF2BCA0FE7
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 14:05:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqXoP-0006c1-Eh; Mon, 25 Aug 2025 10:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uqXoM-0006at-Bd
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 10:04:39 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uqXoC-0006f1-Q7
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 10:04:37 -0400
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-2461864f7f8so35388605ad.2
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756130666; x=1756735466; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UyZkrXDZ4YF4atYTEtBegm7kT7FyJfwyls7AyxmGXUM=;
 b=V4fqg0zeNs0U8fNyH50814O4Y744ZXkhlScMRlmfjwhguwdNoRfc8mA0r/NIBxXDpY
 aUklE7bmbkCero1SP3GBe5recrR2xnGoVsLroUu7R15AgaH00T0aQmlVZw7NAm2TfXCs
 zg3b7fmJisJz8SaNGaRvhWkMEitOlyZuVNCcXjtX/Ve3hgCX1M/oO8vlEn7IAGZzI9fk
 aap4Zv2mAQZJ/0MV8ClKk13RtAzLICmeiIxpM+hVta5g9ZGal9po2yKscIu2wn7DI9/Q
 llvq5zVZLmvJWYXUxvSWY8739hDSIUsARdQ40KkjrNB10zu03go0mSS1baXEEq/aMMMn
 hxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756130666; x=1756735466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UyZkrXDZ4YF4atYTEtBegm7kT7FyJfwyls7AyxmGXUM=;
 b=ggQMAIwdRDmGFRqqFQ8RBzDuXt5r9LvImIZmQjvN/6m3pwj552/efD3P1CXjs9GTWD
 TCEf4RPMVj8ATzoqmgXElw33g/JuyXHPIs64B+RaJE/iScdGvVUvIlTxnxroowdMZ9Yb
 YffqSTQsgOyLrxNDHoAFqOtT7meq76/OfQYTKTnbQD4q+dJc7QA50lP+twaqH9Kw2OBU
 T4TvzDlCuJrwqi/TB0Xjx4jYx9kmoer99qL2lyfdRONaxNdkvPNfeHfguAtQ9nQ78GhC
 C+8Gx4urH2LE43tFodVoKhYRNAKGQIHuXH7kkq9ZfdxiOCK3Snr29PhJ40NMLrjM0OoK
 Izlw==
X-Gm-Message-State: AOJu0Yyi8A4oE1Rjr+cVhKpaYiJHFOVkmRLLGLAv0GJ3Hjz6rCVh1a9F
 JJOWO0yRjpJ5G1yWlCfl+LZ8D4nlUhJj3x/pBIYCRWSQtY5W8uoK5cko7Tg5LwTjE7A=
X-Gm-Gg: ASbGncv0ej4wc/49ujMduFFzpgUVOpt3eeCaxH5LaiS6gy16PaJWFl49RmWkrnX+lhs
 5OVq/wDuYJna2xIGTeOjCcpetPXKZLSV3FCutI98ADRDbdlW+9aq8ppqTtqepuBuEDwk9+G5qZD
 6+pFKsZhtv3tMaJ2l2FBvknWe2eMPddgW8sQrrC/pdcmauzPO7PqvE61vfigp/cea5X3FprQpeW
 dO6pQckYYcS9zKt2zT2xUpFLBQYeZo7LmDgSqdyq5ipH7OkrfcPBjIhNeRkQfjfOHosYgvBnKOO
 nQkRODrbYVymmt/hUSsoke++i72lUnfWtxkyZ7lWk1hv54VgcrMbHmmlKZJg3Mgx4+xIvFoduIH
 Wz7S0PJuIRdKSEkrbgbAbUDcA5kPKghJb7YgF5MxUxVGJ
X-Google-Smtp-Source: AGHT+IGOFbXikgEPb8HRjC0rCtrvCy/gLiu1suzNu1qCtuTHGxe57LDDlR5UV8gJRc2UiJl2Cwxlgg==
X-Received: by 2002:a17:903:2305:b0:246:916e:40c2 with SMTP id
 d9443c01a7336-246916e450fmr113586135ad.56.1756130665774; 
 Mon, 25 Aug 2025 07:04:25 -0700 (PDT)
Received: from [192.168.0.102] ([187.75.38.174])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246fbf368ebsm12959075ad.151.2025.08.25.07.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 07:04:25 -0700 (PDT)
Message-ID: <34c80114-8a7e-4761-add9-3b20a587ce18@linaro.org>
Date: Mon, 25 Aug 2025 11:05:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tests/functional: Adapt reverse_debugging to run w/o
 Avocado
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
References: <20250819143916.4138035-1-gustavo.romero@linaro.org>
 <20250819143916.4138035-5-gustavo.romero@linaro.org>
 <2ef8923b-18f5-47c6-b688-c9fa5b4fb0e4@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <2ef8923b-18f5-47c6-b688-c9fa5b4fb0e4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Thomas,

On 8/25/25 07:34, Thomas Huth wrote:
> On 19/08/2025 16.39, Gustavo Romero wrote:
>> This commit removes Avocado as a dependency for running the
>> reverse_debugging test.
>>
>> The main benefit, beyond eliminating an extra dependency, is that there
>> is no longer any need to handle GDB packets manually. This removes the
>> need for ad-hoc functions dealing with endianness and arch-specific
>> register numbers, making the test easier to read. The timeout variable
>> is also removed, since Meson now manages timeouts automatically.
>>
>> The reverse_debugging test is now executed through a runner, because it
>> requires GDB in addition to QMP. The runner is responsible for invoking
>> GDB with the appropriate arguments and for passing the test script to
>> GDB.
>>
>> Since the test now runs inside GDB, its output, particularly from
>> 'stepi' commands, which cannot be disabled, interleaves with the TAP
>> output from unittest. To avoid this conflict, the test no longer uses
>> Meson’s 'tap' protocol and instead relies on the simpler 'exitcode'
>> protocol.
>>
>> reverse_debugging is kept "skipped" for aarch64, ppc64, and x86_64, so
>> won't run unless QEMU_TEST_FLAKY_TESTS=1 is set in the test environment,
>> before running 'make check-functional' or 'meson test [...]'.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
> ...
>> diff --git a/tests/functional/test_aarch64_reverse_debug.py b/tests/functional/test_aarch64_reverse_debug.py
>> index 58d4532835..8b6f82c227 100755
>> --- a/tests/functional/test_aarch64_reverse_debug.py
>> +++ b/tests/functional/test_aarch64_reverse_debug.py
> ...
>> -    KERNEL_ASSET = Asset(
>> +    ASSET_KERNEL = Asset(
>>           ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
>>            'releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz'),
>>           '7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379cbbf7')
>> @@ -30,9 +29,9 @@ class ReverseDebugging_AArch64(ReverseDebugging):
>>       def test_aarch64_virt(self):
>>           self.set_machine('virt')
>>           self.cpu = 'cortex-a53'
>> -        kernel_path = self.KERNEL_ASSET.fetch()
>> +        kernel_path = self.ASSET_KERNEL.fetch()
>>           self.reverse_debugging(args=('-kernel', kernel_path))
> 
> Ouch, that "KERNEL_ASSET" is worth to be sent as a separate bugfix (without the proper "ASSET_" prefix, the asset won't be precached properly). Could you maybe send this as a separate patch, please?

Sure!


Cheers,
Gustavo

