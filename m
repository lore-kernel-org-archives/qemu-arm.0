Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp53065njc;
        Wed, 7 Aug 2024 00:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzR5HO97rcn5pfRu3hZ9yIwKHrXC1v5uPMR1sfYzueyD90aw8L/V6EIyJd2dKYF5uCpsqhQtA8v5Ltpl3qYNHgB2uo/IyP
X-Google-Smtp-Source: AGHT+IG7YAyu8dPiS42ks59jj9Xyh3pLuwDALh1HADgGVG1isC+uYRtMQKLwIAfJX3IEDmnLRctZ
X-Received: by 2002:a05:6214:5b82:b0:6b7:a36e:294c with SMTP id 6a1803df08f44-6bb984c549cmr186411116d6.57.1723015741007;
        Wed, 07 Aug 2024 00:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723015740; cv=none;
        d=google.com; s=arc-20160816;
        b=lToYD4ixP7mLzpV9zntlfYOZn7js3HGi41meoF1VymXIYGjNhRIrWKadFoJp3EnVlH
         qwm91CiVqiVeCWspaWDizuKf2IvcWoBRyeMGXff3QFQ8g+2aBYunQXDPTOcK7pQOL7Wb
         xV2fXMbwVJd4LjHqfXiCmBdSHjDwWMJ+xYL3+4kOHYzgQtD1nalekteXP2bTBPiA4nlG
         095gU7dJhOSkvWCB1q98r+rWIBy/z6zND5JSEfVenB+JmrBXdmUmCaYXQW+hy0POtsVg
         yE24jGxHlNwduan9QLDhc4JKgYVTwQSqK3SPzxWznwmiAot9Xj4vO6x9jYg+t+2SzeWv
         30Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zroGU1+lvxost8RNVnnE3lD/cZpLIsMV4fTQMfmZmnM=;
        fh=8vKRyPt3gkz2WMJVRTwO0fkwdglYshHh868p5vk/ow4=;
        b=rLkKApVNaOIkawf+ubKF5ZGD0TEtSaENdQ96s881oNGkZ/xHHG1JW41k4PG8GVGXG3
         j80JbJaHK8pIYQXA01/tFUcYEIY/bWZIMqhSWIAuvNbRRehVFPq2+aO2qoh3PE9cxoDE
         Y4xTUF9xxWzrwl2zu1LuXSBk/p/umpGu5gtF7QLUOhijwloD6iICPEip0WtnAy2BvqVD
         DB51bKzlEdOCvjLtW5l7zsgG/RMZc+DXu4RNT1glkaGVT0P2C1rH9fxbFzySBfNP2RNs
         /yyJex5Lbw7ZShv1i6A7gU4w9kT1EZZeg1JSL8JhqmKMG5dagONInz/wB5FusJVktaax
         02/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ElAwyBIT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb90f2f8si11863686d6.495.2024.08.07.00.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 00:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ElAwyBIT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbb6A-00022l-JK; Wed, 07 Aug 2024 03:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sbb68-00020V-NI
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 03:28:40 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sbb66-0008L6-4j
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 03:28:40 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso2148383e87.0
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2024 00:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723015716; x=1723620516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zroGU1+lvxost8RNVnnE3lD/cZpLIsMV4fTQMfmZmnM=;
 b=ElAwyBITQO20GKSm9pt4GqOGvt7lz2cjIvIgReyYDnoQaQmbidGKEX5DyrjV8Ola7m
 Ph0ymu7H+xnrG2G0lSwmtDmAjCfkl6jlhUeFAath3fN3F+HmP8M/PYT7SOeEPecQOzWJ
 WNv9HJR392E0H6z486ZpzSiabECZO3H3lH9yc0jV38Ovf13jSfDvgEF7blMpgGCbxshA
 +TgSLo8Prqt6u6gCPs2doOv4zke6eTctPtrZNjq/pnLAdJMWaGWCtHZ5rzvUaCUhmLbv
 cbKQsny+3DmAFnh9O/1jiHOjR803Ib332cQAlZrSUT3bOT2lMB6riQ5iTW3w0+cfGEp1
 i2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723015716; x=1723620516;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zroGU1+lvxost8RNVnnE3lD/cZpLIsMV4fTQMfmZmnM=;
 b=F/walIsE4ByMMVRaRWw2HFFGERwyM5mibTudfp0xFHwRLbF3jIqRAIk00IMS3x4KAD
 mvkcNV+mTzmtcI1z7p+Bj+lK8B776qZl1kvQX33IBxGF46hHdDouckljnUrFfmw4c6QX
 Erb/ibuEgug7+7GBqXRolQnHniEU+MTUPPimzpuEZtLJNZWw9iRDifPZh6nOeCjLonWi
 otTEGY9NcHlX5x1UyMHIa1fb8XFPiorl95COtQVS8ZULuEsA8ZZFHmm3mkrVkpu8m7DL
 Rka+LYPKT3EytGxBlB3Cl/lgBdXWep+1HnMapUWGnQZBS4ELAnUZbNpa3j6Xw+uq8fxF
 knkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Ii8GjeXCEeLo6oVK/+1OoceJ3KonOp/dk43xZ74wZUbQuoPopmJg0XdjC0Raac6ER3pV/MX6gp745+pws5V1vzl9
X-Gm-Message-State: AOJu0YxFNfE/73EqgPR54dlEmq94MGsK8nvVBCG1axqnzAztMkWrkFo1
 niEMHRUpbjDD/1jmSWkXW4gsSjmBdvnxa7q8NQpS2SxdFJVRfr+fmwGLTaZ+hN8=
X-Received: by 2002:a05:6512:3dab:b0:530:ad9f:8757 with SMTP id
 2adb3069b0e04-530bb39b897mr12710716e87.45.1723015715573; 
 Wed, 07 Aug 2024 00:28:35 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.120])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf0cc8esm14972839f8f.19.2024.08.07.00.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 00:28:35 -0700 (PDT)
Message-ID: <df628091-6d6a-4fdc-b048-3dd91a8060a1@linaro.org>
Date: Wed, 7 Aug 2024 09:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org> <877ccs29xh.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <877ccs29xh.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uCiQ1PZz97/4

On 7/8/24 07:12, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> qmp_query_gic_capabilities() is not specific to the ARM
>> architecture but to the GIC device which is modelled in
>> hw/intc/, so move the code there for clarity. No logical
>> change intended.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/intc/arm_gic_qmp.c     | 59 +++++++++++++++++++++++++++++++++++++++
>>   target/arm/arm-qmp-cmds.c | 52 +---------------------------------
>>   hw/intc/meson.build       |  1 +
>>   3 files changed, 61 insertions(+), 51 deletions(-)
>>   create mode 100644 hw/intc/arm_gic_qmp.c
> 
> [...]
> 
>> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> index afd1aa51ee..45d3503d49 100644
>> --- a/hw/intc/meson.build
>> +++ b/hw/intc/meson.build
>> @@ -39,6 +39,7 @@ if config_all_devices.has_key('CONFIG_APIC') or \
>>   endif
>>   
>>   specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
>> +specific_ss.add(when: 'CONFIG_ARM', if_true: files('arm_gic_qmp.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
> 
> You move qmp_query_gic_capabilities() from target/arm/arm-qmp-cmds.c (in
> arm_system_ss) to hw/intc/arm_gic_qmp.c (in specific_ss when
> CONFIG_ARM).
> 
> Both _ss are target-dependent.  In my testing, both get only compiled
> for target arm and aarch64.  Obvious for arm-qmp-cmds.c in
> arm_system_ss.  Less so for arm_gic_qmp.c in specific_ss; I guess the
> CONFIG_ARM does the trick there.  Correct?

Correct, Kconfig CONFIG_ARM_GIC depends on Kconfig CONFIG_ARM,
itself defined for configure TARGET_ARM (see target/arm/Kconfig).
(Also CONFIG_AARCH64 selects CONFIG_ARM).

I can clarify that in the patch description if necessary.
