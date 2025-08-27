Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28595CA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:23:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4sU-0007t9-7u; Tue, 26 Aug 2025 21:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1ur4s5-0007iH-5J
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:22:52 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1ur4rz-0002ML-Iy
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:22:40 -0400
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-771ed4a8124so2435413b3a.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257750; x=1756862550; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=alNXz7XDt+/Gzjz8zwNmt5KRGgSbGDVcngw7hQnNDpw=;
 b=JNnGvbLV3zqjduIuquGi/rYWzcKA/YT/jl/39tw7RqjsCgYjQMWoQHhd069MT3s4Iw
 43CELkKgGR90QghFheq00Amtsm7aiF/TxFlYfymkLTeXwgvGJUoLq45z3ixARnq73KyY
 1epGrQs25E54pPWcSls/WfwCCc90MfUNSAxtR2DdY8l7tNYq3StjPqdNSoKPVgYNBZzt
 61OhPy69DxKbS60F59nFSdFH203AsZz1MYeNMquMkFBeKhgAIw7HRvAU+aQcIfvAhOqv
 S7VAHXgET3dQiOht2eJOk6kEeyle618HNELoZmOxRK8RFo3yl+gSCi4fXk8rvoqYhlmt
 f99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257750; x=1756862550;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=alNXz7XDt+/Gzjz8zwNmt5KRGgSbGDVcngw7hQnNDpw=;
 b=PBUey+su/GQdCss3lEBHvaM8xv3VrUHJYyr9pXUG6NQAWerau7GjuC7W2FNYhiv05S
 pIfSuVOAHeQhFzAIGHAcwxnzq8vL6e0f7hn6bElI47s8xBy+wJ4yswpPxI+Mf48hbSs8
 WNUe5wu+EBuV0ROwCzsq63nEa8ZhWyiJZDjeQ+eTj5EtQEoEsWGNmoQGlxDR8a4q4e62
 Gv2xlT0dkQI031QxGYo0esOyumWkXxjBFGng1SbnSZDK50/8p0XMmMswriAgwBDCULAF
 JJB4dWMVjhotTBG37+UBi1QhXnPGnZX/+ixzTDWmCmFvbSvfZJl42MlQsMVeT+RJAQBi
 0Hsg==
X-Gm-Message-State: AOJu0YypHudCWauZZNoWt15DCXgJKwfBk5hE+wPbtbw3eEYPNcJmfgQf
 408bcPXDwLcWK/BpnH015IgUwdGR688VLc0CyevS/25KV701gM5S4ui99nB0bhxLbU0=
X-Gm-Gg: ASbGnctYD0l8p3K+LhdiC3XD3gTZCtcs6gkIVzHe0tFqdvUTSi/smIZk1ZDo2wS6wcJ
 451w8tVfZows6Leu7MlT1T4Hz9eIhOgLUsGN+q5FrUGwbdhYk2K0scNZzedU5dz6/ukSZj8TOvJ
 iqvuZujtCFfjW/y2Eq7/A4ZUsU0aiopbWrVU//p4StxP2Pxa6L2Tx3x3nbpFxTI0CC90aWE2JTg
 LfJ5dGISRqofn2GqX8J9R4/Ottqoj678krIRv5kY5regbf9Aq+fauHNYZ+Yt8wBL2V38V0RSiPW
 ifFcKcTmW4p7BlM6bj9Lph/QoW81QatcdmNzDY10NNCkYasReV6ED5AEZXgWXLsj7pt8R6/lj6l
 d1gHGvO/pKXwM7jyrr2+RKLgjQeqH1NBw578CEZd1RY/U
X-Google-Smtp-Source: AGHT+IHmP409bB6GGaRifw/UT06Hfps1X7a+8+q3HSJRA6DuR8A7QcmKSR//t2yS4AYWfoCr+YjcUQ==
X-Received: by 2002:a05:6a00:190e:b0:758:66a2:981f with SMTP id
 d2e1a72fcca58-7702fa0590emr24716778b3a.12.1756257749601; 
 Tue, 26 Aug 2025 18:22:29 -0700 (PDT)
Received: from [192.168.0.102] ([187.75.38.174])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771e93ec6fasm6071979b3a.31.2025.08.26.18.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 18:22:29 -0700 (PDT)
Message-ID: <cc2edc28-1c43-4aad-ac8b-5ac8b26262e1@linaro.org>
Date: Tue, 26 Aug 2025 22:23:11 -0300
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x442.google.com
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

Post here:

https://lists.gnu.org/archive/html/qemu-devel/2025-08/msg03763.html


Cheers,
Gustavo


