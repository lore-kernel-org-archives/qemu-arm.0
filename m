Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1173622ejj;
        Fri, 24 Nov 2023 05:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNqDBUimNoTqS0MDtwa1a2xN5xn0to+arT51VRFGUb3hacXU6Qnvedu6RRmiP8eavtRm6z
X-Received: by 2002:a05:6102:5086:b0:462:aaa2:ba52 with SMTP id bl6-20020a056102508600b00462aaa2ba52mr3057732vsb.34.1700832104216;
        Fri, 24 Nov 2023 05:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700832104; cv=none;
        d=google.com; s=arc-20160816;
        b=N+mAV00VVkcGAL5hUweT71LSGX+oRLaoT6wmLFsQ+MTkzczlZKz9CYEaWJZlSVRMvP
         7n+ZXl2rq41JNorhANu7OoQSqfeK8gRIqefwCfuF+lV46NQH2vxuq2Jr0EuIdcMm9pFs
         7tg7T67ndPHP+ETHknPCzF7AsAJcHjKke9aCnu7s8cwN/gEu9mCElJ1Iv4P3vhz18AlI
         czjo5aiwdaRGVZjk8BdAtvjYboExv3UAZWzXOhYxkop05Gu7by8Rd7ujz1kvl2qzM9Hm
         AAYgzB+vzvkpcW1kEf7I0wZZUJ46GMIrfDI2q/wb+tCtOgZp+lwiqa55Vyj3SWOsRXBi
         dZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GOkyeM2jH1GdpIo1SYMnTDDwqne+Zqb05ASn+zO5s4Y=;
        fh=LAwbg7fFJtwQ2XrkYA7rEVw5rlGtyBIwAkR19jkVKX8=;
        b=wa5b+kd1XrBin9ovYuTlDLVf9j3bNDOFQWIZfn/8IPOSny6z2+9UBlqkHsVWYN1rO9
         s6GT3v53UwMKIoWo6YjQH6Kjc23lJqnp1DFV3ax+CwU5+PKuMi7tyAz7CU+zHJ0m0VG1
         I0sh4vaoWRx2V/Gt7sD/q+r0lkMOFGjWOhggDN8gi1+QYGGybpVdWrPlkAFRZrPLnsUk
         Bf3q+Zg60RzAO3c25QKhiN35+Bn+cU8R6+Ch2qKVsqoKg19DLTVHfZbzFOqPJSEMV5Y0
         WgOLVcOQtmNrosaxd01A26KwcKY3sNYwIhdOfwJhOLqybX9i+egqWGhvx/yJa6kk3qKD
         149w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FO4x1yhV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a0561023a4e00b0045d3b2402e8si837427vsu.718.2023.11.24.05.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 05:21:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FO4x1yhV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r6W7l-0005QB-Ck; Fri, 24 Nov 2023 08:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6W7k-0005Pt-8c
 for qemu-devel@nongnu.org; Fri, 24 Nov 2023 08:21:36 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6W7h-0007yD-HG
 for qemu-devel@nongnu.org; Fri, 24 Nov 2023 08:21:35 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so14068515e9.1
 for <qemu-devel@nongnu.org>; Fri, 24 Nov 2023 05:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700832091; x=1701436891; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GOkyeM2jH1GdpIo1SYMnTDDwqne+Zqb05ASn+zO5s4Y=;
 b=FO4x1yhVHfX1tRQZ/wfUjccma1nWFPu2099qyU2KykZZ/0/eJJ+QvPYK5x7e0KexCx
 b4RJndAdk/cPs91qBZkyKyNtbyIlRgPHtfip7QOCZ1eaiGgWq1IrlIRFzzUAcVM7OjrU
 1949LEjw0dis7oeWG6lWPPLRWTePwBB2bW3i7y2eFySGGSM/a/D0ChCwTyIAQDBR1Xe2
 KYUnkdkOvXv25ZOEN7guc8gIZYbeQbNenG4XYKz7+1Bq+xF6P8IEPEAP2LHLsE5uF6Tz
 Kl7SI5UH8rVke2fjsXA8OyR7in4I2Kfkr7xihaZCHD0MnJKNTbfmQPzxvBoekmB9zfa6
 GaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700832091; x=1701436891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOkyeM2jH1GdpIo1SYMnTDDwqne+Zqb05ASn+zO5s4Y=;
 b=XJKY2XpJHJMT5eJ38+KbhBbLoVtgRKkzOrnO3UQVDxWeCn3eQIF/ClyCD+tjESU3hf
 tOdMFWiLIQIA/XeyHIkUDMziw5JwUuCbfAxmFz4teV16rn4FSs8uDj+xtQ4sDvduqBwu
 F94vtjJJAh3Wlv+rd7TrZZoxBVboHAU74xNN5ZGLZTtJW0yz3lCDDzrgrijwny6X8bCR
 EiMSGd79t29g0uBpet8XhGZ5lOPjzVj4oxvWoeJm/y2lvkZpSRE9lkpZnCtw0ZilOgpc
 OozlE6468/Ql9xOECc0imHKMBGuOmpkvF1f5z1gSKP3wYC4aeUrJ5LK7LXkMenRbVhpw
 3H1w==
X-Gm-Message-State: AOJu0YzFHoAfxhC2D01xZli0GTSmZX4in/uGmLXOrCWU6PVHa+iCnQ1E
 ptcONKRYSC1cCmj4nwlwYSAdJQ==
X-Received: by 2002:a05:600c:310c:b0:3fe:1232:93fa with SMTP id
 g12-20020a05600c310c00b003fe123293famr2131296wmo.22.1700832091387; 
 Fri, 24 Nov 2023 05:21:31 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c231800b0040b36050f1bsm4978142wmo.44.2023.11.24.05.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 05:21:30 -0800 (PST)
Message-ID: <ab62f61e-bf41-42d6-a2fd-d693918aef84@linaro.org>
Date: Fri, 24 Nov 2023 14:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2? v2 2/4] hw/arm/stm32f405: Report error when
 incorrect CPU is used
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <laurent@vivier.eu>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Felipe Balbi <balbi@kernel.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Alexandre Iooss
 <erdnaxe@crans.org>, Gavin Shan <gshan@redhat.com>
References: <20231117071704.35040-1-philmd@linaro.org>
 <20231117071704.35040-3-philmd@linaro.org>
 <20231124141301.5e03527b@imammedo.users.ipa.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231124141301.5e03527b@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: xJ8X8zaP1pu1

Hi Igor,

On 24/11/23 14:13, Igor Mammedov wrote:
> On Fri, 17 Nov 2023 08:17:02 +0100
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> Both 'netduinoplus2' and 'olimex-stm32-h405' machines ignore the
>> CPU type requested by the command line. This might confuse users,
>> since the following will create a machine with a Cortex-M4 CPU:
>>
>>    $ qemu-system-aarch64 -M netduinoplus2 -cpu cortex-r5f
>>
>> Set the MachineClass::valid_cpu_types field (introduced in commit
>> c9cf636d48 "machine: Add a valid_cpu_types property").
>> Remove the now unused MachineClass::default_cpu_type field.
> 
> Why default_cpu_type is removed?

"Since the SoC family can only use Cortex-M4 CPUs, hard-code the
  CPU type name at the SoC level"

> what if user didn't user -cpu at all?

The CPU is hardcoded, default value is not used.

qemu-system-arm -M olimex-stm32-h405 -S -monitor stdio
QEMU 8.1.91 monitor - type 'help' for more information
(qemu) info qtree
...
   dev: armv7m, id ""
     gpio-in "NMI" 1
     gpio-out "SYSRESETREQ" 1
     gpio-in "" 96
     clock-in "cpuclk" freq_hz=168 MHz
     clock-in "refclk" freq_hz=21 MHz
     cpu-type = "cortex-m4-arm-cpu"
     ...

> 
>>
>> We now get:
>>
>>    $ qemu-system-aarch64 -M netduinoplus2 -cpu cortex-r5f
>>    qemu-system-aarch64: Invalid CPU type: cortex-r5f-arm-cpu
>>    The valid types are: cortex-m4-arm-cpu
>>
>> Since the SoC family can only use Cortex-M4 CPUs, hard-code the
>> CPU type name at the SoC level, removing the QOM property
>> entirely.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/arm/stm32f405_soc.h | 4 ----
>>   hw/arm/netduinoplus2.c         | 7 ++++++-
>>   hw/arm/olimex-stm32-h405.c     | 8 ++++++--
>>   hw/arm/stm32f405_soc.c         | 8 +-------
>>   4 files changed, 13 insertions(+), 14 deletions(-)

