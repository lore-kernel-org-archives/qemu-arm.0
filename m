Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79036CD484E
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 06:25:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMgYL-0005gV-25; Tue, 12 May 2026 02:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wMgXX-0003Fj-Dg
 for qemu-arm@nongnu.org; Tue, 12 May 2026 02:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wMgXP-0005hd-J8
 for qemu-arm@nongnu.org; Tue, 12 May 2026 02:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778567051;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAxdg8ECUy7638umgau+fD0qEUtkUi+NySXn2MqQUms=;
 b=K7a0KaqVgwm6yFu7ycr97EJQWLqq1IXDFwjSj6PhvTpPoRLREcEbG181vkbr/8DFyuNPA6
 A71qGbBno2wuscATWkC2QKgclFKf0f+uGL9z/ttPLA+/b6etnJgm8jBaSOZ2tBzuJ9rQiG
 RICxLKEh2p+o7RRUDfNNHLX5skDWE1c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-Mu5w_RuXOlGtrPurU4zdDQ-1; Tue, 12 May 2026 02:24:10 -0400
X-MC-Unique: Mu5w_RuXOlGtrPurU4zdDQ-1
X-Mimecast-MFC-AGG-ID: Mu5w_RuXOlGtrPurU4zdDQ_1778567049
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48d05e7b117so40412315e9.0
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 23:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778567049; x=1779171849;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAxdg8ECUy7638umgau+fD0qEUtkUi+NySXn2MqQUms=;
 b=T9k7YvpxwiWm64oJHNBdVjNWERICtFMBOsRYFNKWrLWEe4Cv67BhXAAxSj9/Rb5HyG
 pv0sYpttIO8qTIXoEYOAJpE1GAjjiuM8yKDPwRe6RDX862K0VGb9treQ4XxiQro5ZGAp
 Yy/sjiIWUuQEjaghS63WflUdsxJaYF9OWuv6f8CuViD8+UiybnMXmyXt6wtpbMeNxxN4
 2C3R70wkFPDRt9T+Ll0iWoWvCgjs44X3reyogv3Pdw+q0Dsbi4WTP4sDp1ee6FhJReBo
 vEnRvzrvpDUKoGtBpP2gz1RcnsxbgLIy9wktxlOdqMXnxcDYTkK9Ginmt4Bl8A+iCotc
 jE7w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ruom/lVNfwEdR7aXm4lvKHr8Cf57fyGTlUCGubgeGM4wyfdZvjk7IyDtp4ltR3lsVkAgRsVBJYA==@nongnu.org
X-Gm-Message-State: AOJu0YzEc7hWp84LgvIyBgbDu29MrrlSof2fTHgAcictuZHdb6WV71CO
 t5W7XFIYt7jXfGB1T71gN1+HVrC755j/tecwSOnNn4cMWdjD8a6q+Z8M6IRwLYQ7IsrjxW8LDj/
 bIvzUQYFLsuzQXhAZhL52+agpZjFrqzeQSaLGku7hY20CAZoKFucrxw==
X-Gm-Gg: Acq92OGn/0cPMxVW50byrNudElyNC0IfdFEvd6H2vofehWP3M9uBz3dqzTkEZSTgCfi
 pSRfbvb0iCa2tsSSLC023V1eModifeGUwNDnBHu3KIi80VCMLFjyirKSOrnCc68+Iuu1AGYBjhh
 YOci2PH8mDpQXIAbKHIC6ETc1UuK8jf8zKVQNqVs8j8esuLiWdxS3/0rvEBKAY2tMR5cnfiefHu
 WSPNREJx4hsKcsTcZhvD2mD/vhEMDb3ekODB7rSQW3uDYl2ALwJ5elAxrvHi2a59rZm9SkLlvan
 pOJZ8l4Pb8RNXEJ1SwzoxP9NDj+UU9VOr3vh4qFdHrbbJCX06mxFw7PHfVzW9Su65gNW+Bmw4dY
 N54fti/DPyBbLoB/BQSfPIGao29D5rgbFHQphzzYCaEd4uQjQarJfyFaYyn387nLY2H0Npw==
X-Received: by 2002:a05:600d:18:b0:488:b811:51c4 with SMTP id
 5b1f17b1804b1-48e51f3c4f4mr354628755e9.25.1778567049017; 
 Mon, 11 May 2026 23:24:09 -0700 (PDT)
X-Received: by 2002:a05:600d:18:b0:488:b811:51c4 with SMTP id
 5b1f17b1804b1-48e51f3c4f4mr354628315e9.25.1778567048620; 
 Mon, 11 May 2026 23:24:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8e5d3107sm19165665e9.1.2026.05.11.23.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 23:24:08 -0700 (PDT)
Message-ID: <29c49ead-c8d0-43e0-92de-a51c82079cd2@redhat.com>
Date: Tue, 12 May 2026 08:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/17] target/arm/cpu-sysregs.h.inc: Sort by name
 alphabetical order
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260503073541.790215-1-eric.auger@redhat.com>
 <20260503073541.790215-3-eric.auger@redhat.com>
 <CH3PR12MB75485D446DD0633DF463A415AB3F2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75485D446DD0633DF463A415AB3F2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5LHCjpxC9cbEtm_dmx225htZaxF8w7zwJ3hA5bqp7_Q_1778567049
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 5/6/26 6:10 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 03 May 2026 08:33
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> cohuck@redhat.com; sebott@redhat.com; Shameer Kolothum Thodi
>> <skolothumtho@nvidia.com>; philmd@linaro.org
>> Cc: maz@kernel.org; oliver.upton@linux.dev; pbonzini@redhat.com;
>> armbru@redhat.com; berrange@redhat.com; abologna@redhat.com;
>> jdenemar@redhat.com
>> Subject: [PATCH v4 02/17] target/arm/cpu-sysregs.h.inc: Sort by name
>> alphabetical order
>>
>> External email: Use caution opening links or attachments
>>
>>
>> target/arm/cpu-sysregs.h.inc: Sort by name alphabetical order
>>
>> Sort by register name alphabetical order. This will allow to
>> easily diff with the future content, automatically generated.
>>
>> No functional change intended.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Message-ID: <20251208163751.611186-3-eric.auger@redhat.com>
>> ---
>>  target/arm/cpu-sysregs.h.inc | 43 ++++++++++++++++++------------------
>>  1 file changed, 22 insertions(+), 21 deletions(-)
> Took a while to figure out the extra addition 😊
> +DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)

Hum I missed this spurious addition during the rebase. I will remove it
as the goal was just to sort the file without adding anything. Next
patch is supposed to add some new stuff.

Thanks!

Eric
>
> May be worth mentioning in commit log.
>
> Thanks,
> Shameer
>
>> diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
>> index 3d1ed40f04..d61f0d0a19 100644
>> --- a/target/arm/cpu-sysregs.h.inc
>> +++ b/target/arm/cpu-sysregs.h.inc
>> @@ -1,12 +1,12 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>> -DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
>> -DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
>> -DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
>> -DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
>> -DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
>> -DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
>> +DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)
>> +DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
>> +DEF(CTR_EL0, 3, 3, 0, 0, 1)
>> +DEF(DCZID_EL0, 3, 3, 0, 0, 7)
>>  DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
>>  DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
>> +DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
>> +DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
>>  DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
>>  DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
>>  DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
>> @@ -15,29 +15,30 @@ DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
>>  DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
>>  DEF(ID_AA64MMFR3_EL1, 3, 0, 0, 7, 3)
>>  DEF(ID_AA64MMFR4_EL1, 3, 0, 0, 7, 4)
>> -DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
>> -DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
>> -DEF(ID_DFR0_EL1, 3, 0, 0, 1, 2)
>> +DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
>> +DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
>> +DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
>> +DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
>> +DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
>>  DEF(ID_AFR0_EL1, 3, 0, 0, 1, 3)
>> -DEF(ID_MMFR0_EL1, 3, 0, 0, 1, 4)
>> -DEF(ID_MMFR1_EL1, 3, 0, 0, 1, 5)
>> -DEF(ID_MMFR2_EL1, 3, 0, 0, 1, 6)
>> -DEF(ID_MMFR3_EL1, 3, 0, 0, 1, 7)
>> +DEF(ID_DFR0_EL1, 3, 0, 0, 1, 2)
>> +DEF(ID_DFR1_EL1, 3, 0, 0, 3, 5)
>>  DEF(ID_ISAR0_EL1, 3, 0, 0, 2, 0)
>>  DEF(ID_ISAR1_EL1, 3, 0, 0, 2, 1)
>>  DEF(ID_ISAR2_EL1, 3, 0, 0, 2, 2)
>>  DEF(ID_ISAR3_EL1, 3, 0, 0, 2, 3)
>>  DEF(ID_ISAR4_EL1, 3, 0, 0, 2, 4)
>>  DEF(ID_ISAR5_EL1, 3, 0, 0, 2, 5)
>> -DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
>>  DEF(ID_ISAR6_EL1, 3, 0, 0, 2, 7)
>> +DEF(ID_MMFR0_EL1, 3, 0, 0, 1, 4)
>> +DEF(ID_MMFR1_EL1, 3, 0, 0, 1, 5)
>> +DEF(ID_MMFR2_EL1, 3, 0, 0, 1, 6)
>> +DEF(ID_MMFR3_EL1, 3, 0, 0, 1, 7)
>> +DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
>> +DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
>> +DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
>> +DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
>> +DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
>>  DEF(MVFR0_EL1, 3, 0, 0, 3, 0)
>>  DEF(MVFR1_EL1, 3, 0, 0, 3, 1)
>>  DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
>> -DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
>> -DEF(ID_DFR1_EL1, 3, 0, 0, 3, 5)
>> -DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
>> -DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
>> -DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
>> -DEF(CTR_EL0, 3, 3, 0, 0, 1)
>> -DEF(DCZID_EL0, 3, 3, 0, 0, 7)
>> --
>> 2.53.0


