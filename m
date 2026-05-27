Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D5CD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 17:21:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSHvr-0008RU-1g; Wed, 27 May 2026 13:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSHvm-0008Om-I1
 for qemu-arm@nongnu.org; Wed, 27 May 2026 13:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSHvi-0007at-Hb
 for qemu-arm@nongnu.org; Wed, 27 May 2026 13:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779902428;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6Rb/5e6cfKqUwsTpbO8ZKOU4I90esxxdPIWqIHIR8Y=;
 b=PU3Z+Gg63Qa0giq8tj0mRjG/m0t7gMm2OZN2AwPx8XlIqxfZOTgjPsCMdT6riuWrSErZUz
 Cv/rvtJKjeALgPjdIpkU1uEjhnJ8xyj0UllFYXCsGbik9LQTGbEEWjPhQJZH435glApnlW
 tZ28bDLTBi8NHT1tAbRhpIDB3/Kd//0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-7GKr3pxUPISOMpj5hWb0GA-1; Wed, 27 May 2026 13:20:27 -0400
X-MC-Unique: 7GKr3pxUPISOMpj5hWb0GA-1
X-Mimecast-MFC-AGG-ID: 7GKr3pxUPISOMpj5hWb0GA_1779902426
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43d7a5b9678so7362835f8f.2
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 10:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779902426; x=1780507226;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l6Rb/5e6cfKqUwsTpbO8ZKOU4I90esxxdPIWqIHIR8Y=;
 b=ivfkvczCvWgL5Qu/cAJ2nLDV5FwcMv/aP9yMJcAs9WXC6k1jhTJ/2LhDrBNUNGDx5b
 5yAx0QOrDPxDO6ILr7afEJfQWgVfTeHd2kzHb+5Ap1PEhkw2mF/fkRMe9Y33xN0Zh5Uo
 UfN25ZezlccRGs5hZ4dhaaWxKrT3Eb6mzBg5pD/ZdXZu34+mWq4ixOJvDfq0NqPIxhl6
 g3jy6q+R+lj59wrqbb6LnZjxE9pLA+URgte4DiUNFNCjeaCFGapcEMmHzE3xC5S1Buah
 CkDSMCuIVycDsoKO+lgxRHbqGRwUGMu26MFElSB6SGS97RQ0VtNEYoiGP1Av/iZvOChi
 ieaQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RmTN2EO7go4oX5NyR3oSBHdbOmJAG4us+MEIC0gwlE8yi/sOvaMjcyIyv7u1JuV9+fCLHuRjVlw==@nongnu.org
X-Gm-Message-State: AOJu0Yx9x9KNF1dGYCVdvaK81PTtcvXItzzdSsorvG6aO1y0SzFHyLSu
 azAllAr83BPBVQFWMpdkRO5qk2TpXDD7T8CAvUeikvrr6MDUSHrw3f6on/cnct8vKxJUCCXY8dv
 aWfMFcTeBxjOgDYrygh5O2fJjO3ymp2fIeA56NTjQ7fW6obgIOW4ofw==
X-Gm-Gg: Acq92OHns/IFnPrnVMBt410CQT+4wSdgi9vsh6pJtA5Vc2Ua5hZyLqcZVbsAB/t7/ru
 nKQzW0uWf5s290X9weWLP2SzX3w6I12WaAtsKMfGnXC6aV9JK/fNhh7SmGy4LBsgY5nKxXQ24Ml
 enklR5EH3rNYjsmHDPUnr/SVEoRe4CmttNVFqiKF5zKK4e9uGEzMOvxnEk9cLuty535wRW85R7I
 shekPxT9H9B8YcCy+iAowv2F79gbkf8HFiW/hc24durIAm7n6YFU7sYyrvJ27AH8ZaQgUIMS87Z
 RQy9mIv+vgfhNzTVxTr1bLAVdoHTLMTaax0SE1enCB5PLG3tzrFAtwnVRIXsx61coeZWAShXvt5
 JrU/9MEiiyR0wGQxySganyoB9p27UKLPUeep1XqPiUYoQR4yQeZzYjunL0ccJLenEPAaUwg==
X-Received: by 2002:a05:600c:3b8c:b0:490:480e:266 with SMTP id
 5b1f17b1804b1-490480e02eemr430022515e9.26.1779902425672; 
 Wed, 27 May 2026 10:20:25 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8c:b0:490:480e:266 with SMTP id
 5b1f17b1804b1-490480e02eemr430021715e9.26.1779902425144; 
 Wed, 27 May 2026 10:20:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454c5eb0sm438591845e9.2.2026.05.27.10.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 10:20:24 -0700 (PDT)
Message-ID: <8ee2b611-ef48-4805-aaf0-087856dc30f0@redhat.com>
Date: Wed, 27 May 2026 19:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/18] target/arm/cpu: Expose writable ID reg field
 properties on the kvm host vcpu model
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-17-eric.auger@redhat.com>
 <30F66A6A-E26B-486C-81D1-8E1B2CCB558A@nutanix.com>
 <6c14a58a-60ab-419f-9395-ca3489f6cff8@redhat.com>
 <CA136979-E0CC-420E-9271-63CF27CD7DA5@nutanix.com>
 <2fd2057d-c74b-4bbe-b2d0-cb9ed092a37d@redhat.com>
 <6F6ECB0E-82A8-4FFA-8687-2D6E243A2096@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6F6ECB0E-82A8-4FFA-8687-2D6E243A2096@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SENFFwonDwY9RUTeu2G96lkTs5YQEC2gfVTSNg3vf68_1779902426
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 5/27/26 6:11 PM, Khushit Shah wrote:
>
>> On 27 May 2026, at 9:34 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> On 5/27/26 5:56 PM, Khushit Shah wrote:
>>> So you are saying, if I do, 
>>> -cpu host,sve=on,SYSREG_ID_AA64PFR0_SVE=0
>>> QEMU will still show sve capabilities to the guest?
>> Yes that's what I expect. Require more extensive testing though. That
>> could be way to handle coexistence of different levels of granulaity.
>> Lowest level applies first, overriden by legacy compositive options. I
>> guess if you plan to introduce other layers of compositive props you
>> will most probably handle this situation too.
>>
> I am sure this at-least does not work with sve, 
> because arm_cpu_sve_finalize() just takes looks at the PFR0.SVE field and If value is 0 sve is 'off' otherwise 'on’.
My reasoning was:

arm_cpu_post_init
---> kvm_arm_add_vcpu_properties
    ---> set_sysreg_prop set the new value in cpu->isar.idregs
arm_cpu_finalize_features
---> arm_cpu_sve_finalize
---> arm_cpu_sme_finalize
---> arm_cpu_pauth_finalize
../..
those fonctions do some subsequent isar accesses

So I think in general id reg field settings are applied before composite
legacy options

Thanks

Eric





>
> What you describe might work for legacy props backed by prop_* boolean variables in ARMCPU like pauth (backed by cpu->prop_pauth).
>
> I have not tested this. I maybe wrong if some prop ordering magic happens at machine level.
>
> My plan is to just parse properties in order they arrive in cmdline :)
>
> Warm Regards,
> Khushit


