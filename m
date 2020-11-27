Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2831574lfb;
        Fri, 27 Nov 2020 13:51:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvLRBf1pn3i9eElfZRy/SAkrFpLRj8k1xfy6hsI2kOguTumfW0pjGK/inI2eLCfxpB/YQI
X-Received: by 2002:a25:d215:: with SMTP id j21mr12091724ybg.279.1606513893206;
        Fri, 27 Nov 2020 13:51:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606513893; cv=none;
        d=google.com; s=arc-20160816;
        b=gKsQtmjl5bZlvg2RxfqNXHhbPVCQlO20FHmrcsnG87anPG5mKROMjfyixBjAIEfoF/
         7WlnkiG9xEknL2ObykjcXe+obyGEZZgTcm0cH0LoSws8Ie8Z8Ul3amCGmQ9An7BZ4I2o
         2wx7szfw+aWBLbb3719Emlx7IHqH3wR7NvJwPbaJXOoyTLWzIadeTUst666jRXu0Of/x
         g4nR13HE3LQ+hLrArhz/H/oDhZ12kGVrtRQ7vSS9kSn1ouEb0h+V7sMOiJ7UWQehWX2L
         6dmg2B5aYICw98IgMDruLzqhxLzKqZq8fSlqdVZYQ99NNXJQ8VOOeuL+bUkuacT8Uljd
         bWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=04bDca8+j7/afacAY5wPCottanwIqVfXN0nE15N6jNU=;
        b=mW+BP6bgP1ARoKhms+LoqzDtXLAL7tsuF3NrshhNeaNfQzrC/uY6m59027ZqykRRPz
         FzlZgui3h7zZ8nKMSDm9xwntFVajR4yS5mG4/OPN1jQySzPQODHctw9qD7k5UV/iBmfm
         NA3svtAbDwpU7llKIuXe6rlrDLJH4VdEL1xthUl38oGs1xt8hKCwVff9aO90cIqItw/k
         AnTnJshSRq3PeW4ZcksdXRreazDa1mvjo2dyUwvpwDHfdcmIKTmTv8yfgYpe+OB5Uani
         BA86oatkuevw0V5wznz10skmGfsU8sL+erzF7P2SR7pchYN91R2XGtOrduoZGSKNIIgb
         PX1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e76si9235306ybh.268.2020.11.27.13.51.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 13:51:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kileO-0000hw-HL
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 16:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kileF-0000g2-9n; Fri, 27 Nov 2020 16:51:23 -0500
Received: from mail.csgraf.de ([188.138.100.120]:47414
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kileD-0006mi-0g; Fri, 27 Nov 2020 16:51:22 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 3F5313900397;
 Fri, 27 Nov 2020 22:51:17 +0100 (CET)
Subject: Re: [PATCH 1/8] hvf: Add hypervisor entitlement to output binaries
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-2-agraf@csgraf.de>
 <20201127194406.GB56950@SPB-NB-133.local>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <57d4879e-2c87-8a5d-eb06-3db5d55d726f@csgraf.de>
Date: Fri, 27 Nov 2020 22:51:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201127194406.GB56950@SPB-NB-133.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bb2ecI7B+BAE


On 27.11.20 20:44, Roman Bolshakov wrote:
> On Thu, Nov 26, 2020 at 10:50:10PM +0100, Alexander Graf wrote:
>> In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
>> respective entitlement. Add an entitlement template and automatically self
>> sign and apply the entitlement in the build.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>>   accel/hvf/entitlements.plist |  8 ++++++++
>>   meson.build                  | 30 ++++++++++++++++++++++++++----
>>   scripts/entitlement.sh       | 11 +++++++++++
>>   3 files changed, 45 insertions(+), 4 deletions(-)
>>   create mode 100644 accel/hvf/entitlements.plist
>>   create mode 100755 scripts/entitlement.sh
> Hi,
>
> I think the patch should go ahead of other changes (with Paolo's fix for
> ^C) and land into 5.2 because entitlements are needed for x86_64 hvf too
> since Big Sur Beta 3. Ad-hoc signing is very convenient for development.
>
> Also, It might be good to have configure/meson option to disable signing
> at all. Primarily for homebrew:
>
> https://discourse.brew.sh/t/code-signing-installed-executables/2131/10
>
> There's no established process how to deal with it, e.g. GDB in homebrew
> has caveats section for now:
>
>    ==> Caveats
>    gdb requires special privileges to access Mach ports.
>    You will need to codesign the binary. For instructions, see:
>
>      https://sourceware.org/gdb/wiki/BuildingOnDarwin
>
> The discussion on discourse mentions some plans to do signing in
> homebrew CI (with real Developer ID) but none of them are implemented
> now.
>
> For now it'd be helpful to provide a way to disable signing and install
> the entitlements (if one wants to sign after installation). Similar
> issue was raised to fish-shell a while ago:
>
> https://github.com/fish-shell/fish-shell/issues/6952
> https://github.com/fish-shell/fish-shell/issues/7467


All binaries are signed in Big Sur by the linker as far as I understand, 
so I don't quite see the point in not signing :). If the build system 
doesn't have access to codesign, it sounds to me like one should fix the 
build system instead? Worst case by injecting a fake codesign binary 
that just calls /bin/true.


>
>> diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.plist
>> new file mode 100644
>> index 0000000000..154f3308ef
>> --- /dev/null
>> +++ b/accel/hvf/entitlements.plist
>> @@ -0,0 +1,8 @@
>> +<?xml version="1.0" encoding="UTF-8"?>
>> +<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
>> +<plist version="1.0">
>> +<dict>
>> +    <key>com.apple.security.hypervisor</key>
>> +    <true/>
>> +</dict>
>> +</plist>
>> diff --git a/meson.build b/meson.build
>> index 5062407c70..2a7ff5560c 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1844,9 +1844,14 @@ foreach target : target_dirs
>>       }]
>>     endif
>>     foreach exe: execs
>> -    emulators += {exe['name']:
>> -         executable(exe['name'], exe['sources'],
>> -               install: true,
>> +    exe_name = exe['name']
>> +    exe_sign = 'CONFIG_HVF' in config_target
> I don't have Apple Silicon HW but it may require different kind of
> entitlements for CONFIG_TCG:
>
> https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon


You only need the JIT entitlement for the App Store. Locally signed 
applications work just fine without. I don't know about binaries you 
download from the internet that were signed with a developer key though.

Keep in mind that for this to work you also need the MAP_JIT and RWX 
toggle changes from another patch set on the ML.


Alex


