Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8294BFD88CF
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 23:29:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w06VO-00012p-3v; Tue, 10 Mar 2026 19:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w06VM-00012X-Ob
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 19:28:48 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w06VL-0001Dq-5G
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 19:28:48 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4853aec185aso25315855e9.1
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 16:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773185325; x=1773790125; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jIipBOciV/N5EAqdvOqCy/byIz8fnTteD9zkJsFTV34=;
 b=ssA4f62xoSAN6enx3Z2tZE7vtsFwf6Z++HznFdMk1qeD4zS/jxTc0WDEJPfnjXThHb
 50/IV0pffqOzs4HczYqEEx6DF+khjdRnWqv5cT+ReVGKr26Ef1OgL6xNRmxK1pThUfl7
 /Ooe6kiIyu4tQZ5SH0yaeIkOeVRKguYG08a10yN8jGGUbktKyQoTkeSD5VmZTmAWVvjt
 5RCVV+9kXAkfsPQV5RVSzTDnFNgICaiyMyj/stYa95QOxAfVh2AAOXSsseUni3Jtjxf5
 wi2d7y6fqIL8c17eMi9iGmKLWNZ41DowYZn0lH2zpju0eN2QRBx3KhoALEBd2H2YN6Wu
 r9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773185325; x=1773790125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jIipBOciV/N5EAqdvOqCy/byIz8fnTteD9zkJsFTV34=;
 b=Ctbc8C5JqG0AlLDwoDaBAh4Sohp+VjT7GtVlguRE5FfyVNecV8p/MBZdfGEHJxgqn2
 ZsLcjkvkpvW6zt5JIu6HMBBWPIyWPm5JovPqI5bj6G90SxonP+V3HiWzZxAn7uQaV2qS
 nbL0KEkU2u+zmM13Lu/cb2BQvZUzaRjbxLm5HsQ/6RQZYNL+Qn+Zu7DJwAwdLf7yWx7n
 SBG1Zh5GjYW8QDtYspbSCXuUnuB203SB0m9jgaPvUAVnIgGEICIamRmZu4HmGFi+CwQ+
 tr8XQI5FFlvRAds37FHvtgakCugVf85Zx6VNmjy4HK/BseKeABjMczg6ya125Cf3iyYu
 eqsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC7IQ4IO3zWzacG8ZKyt9T2/DFJ9OHI2hpP/KUsYyT3OyMYhiL1Ufh21xfw4bBFP97Gz2CBmipMA==@nongnu.org
X-Gm-Message-State: AOJu0YzefY9Y5c8S2f3LUTkHCb2ugOmkcSTkyHtaIWZLA+eP6SJtvntU
 FBaN54Em1bG8vTBFucOuKwzHZURLEN5TPPKzwXPOvKTpTxEm3JSWV/mzwwKwnnfWIdE=
X-Gm-Gg: ATEYQzyoQN7HMLeVHK8tgw+yK7fqfrvuK5YnQhOHDQt92b9D/9Arzjt4kivHmB6grN3
 zTPATQsV2os5Gl2T9Jlf2Bql1lVgDVKcfyU26EvBBfTwhVAEh2WZS0ltsDw0uz0iy/Kgo5M3g8E
 WJLv/hIAPCM/9UnqHyhtRykG5Pj9uelZwgFWYyqfaH633pirqCalRwFd9Jba4l7J1TPJmGOR3Lr
 sj8IiimNQE+es/IjmiX3X8x/XtzeB2UEaFQ5a1FCTniQtGtrYOFbdgtPRaaFmQ8qF5UNlUlJr3e
 UCZvy0YWhD+IAI8AFX9IWmsW61upqxej8Ww7vDRQiEjgvpoli6WBU1IHkrWpuCH9cukwtOnT3hO
 38A0kxxTjqTJYl7GKl1zZbwU2mTfE0xJnWaOmKh3ueeeibyg2uFbMJSQMH2QF0F1NrIsCz1C2rm
 vZGqvDE4DdpzX8+kvr2H1hpn/7654SO9+nCDb8Z5v1ZxtKQA6r7LDftEZS38UcE1sYV3KVC29DI
 OPe
X-Received: by 2002:a05:600c:3b18:b0:485:17a7:b9c7 with SMTP id
 5b1f17b1804b1-4854b0be161mr9519005e9.10.1773185325110; 
 Tue, 10 Mar 2026 16:28:45 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541aa73dasm278748775e9.2.2026.03.10.16.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 16:28:44 -0700 (PDT)
Message-ID: <3c2bf09d-245c-4de7-b55d-37085ef24545@linaro.org>
Date: Wed, 11 Mar 2026 00:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tests/docker: add gdb-multiarch to all-test-cross
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
 <20260306161728.2657486-2-alex.bennee@linaro.org>
 <78c8b024-6dd5-4f1b-a19c-c7a71c7acc9f@linaro.org>
 <7e6cdb4b-4cb8-4968-acce-56db2f0ee307@linaro.org>
 <97506340-18a4-4691-8017-110ab2fc76b8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <97506340-18a4-4691-8017-110ab2fc76b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 11/3/26 00:22, Pierrick Bouvier wrote:
> On 3/10/26 4:07 PM, Philippe Mathieu-Daudé wrote:
>> On 10/3/26 23:33, Philippe Mathieu-Daudé wrote:
>>> On 6/3/26 17:17, Alex Bennée wrote:
>>>> This allows the gdb integration tests to be run as well.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>    tests/docker/dockerfiles/debian-all-test-cross.docker | 1 +
>>>>    tests/lcitool/refresh                                 | 1 +
>>>>    2 files changed, 2 insertions(+)
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> I'm getting:
>>
>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>> address 0x45001fff
>> Error occurred in Python: Cannot access memory at address 0x45001fff
>> qemu-hppa: QEMU: Terminated via GDBstub
>> make[1]: ***
>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>> run-gdbstub-prot-none] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> qemu-hppa: QEMU: Terminated via GDBstub
>> warning: Could not load shared library symbols for linux-vdso32.so.1.
>> Do you need "set solib-search-path" or "set sysroot"?
>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>> run-tcg-tests-hppa-linux-user] Error 2
>>
> 
> To add more information, we tested it on GitHub, our machines and 
> GitLab, and for an unknown reason, it only fails on GitLab runners.

Also we tested on our local Linux machines, where this test pass
for all our targets ;)

> 
> Which is unfortunate since it is where QEMU run its CI.
> 
> Regards,
> Pierrick


