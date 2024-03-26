Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1236488ejj;
        Tue, 26 Mar 2024 03:10:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7ePBZN5KrAoRhesyXrS52+4Oze6W3CVSMcPS/qrbPNo80OKICtSG41b6uMOfQxu2gyXwdpioyWxrRW22SS4vTlonGB1KA
X-Google-Smtp-Source: AGHT+IG9sLNepiSSolFLt1yTuyRHib3TCLjaMK+3BXNTPO7oRej8OrBpEc/BOOfOozh3Q7MhkMQZ
X-Received: by 2002:a25:e052:0:b0:dcc:44d7:5c7f with SMTP id x79-20020a25e052000000b00dcc44d75c7fmr7097428ybg.62.1711447806689;
        Tue, 26 Mar 2024 03:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711447806; cv=none;
        d=google.com; s=arc-20160816;
        b=GVk6UsV45EI49W/BY1/1UFtTB20NZKjSzL7JQ6Azfz3158NbTbjGmZBtEkOigZv44v
         /ZU62RXhbV8hvkGhb0V40xzu6vYoqT6t8O+eXBr4qWD3Qzh2+L+S3TxQIFG8LFdGD5E5
         pGMD4GXu3LEeC/Agq/TnuqY+zzp/4n7cmERvMdaE/eV+zGL7W1nYVhvRo/qHsK5NYSZZ
         lZ4N9/DeOoGrLqBzSzoxeLZvKiUiAV+/OB3pI1kFRvu+M1KTcK4o8gUMOvqCZNgBDzis
         R2mZ78FTfzOIRfV2psZakF7n3znGG6mkB6brslyDeTyYZXXEAIiEMXCK1/BwuWJlYda8
         6XJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bvZPmz9vy0RCmtvYL34Y8frf70wRFwPX4tjmvWz7bfA=;
        fh=s9etL5/OoPqfgeH8o8++2PL5ZRLes9JRrLGkgQH7as8=;
        b=NN7Q1nWETiQeMSbR780GtxPMKTzlXeuh+4iv/yEHRM6AznR/8r0FMB4cY33mWO+lEK
         7DMJgVAtAXK23MseIX2S1aRJOb9Vt5CHqDi8COq4RgoxBZyZoZeSw0Z3WAU6C3hZU8dm
         6JqhsvQSX1dGyk3jUxMqKDJUC4etHPVXhbVNxw0t/9LbIVNQ8BeGhJlBzBCBJuYtXjD5
         4xza2bGW20HV1QBelb4/Tdg7ca/s65Opqqiati2ts8atppsUEY8/nN7AffUMSFtcnJ/e
         36WQ94guqUyY1ploSRGun7ICsRfxJljNpTazcKJqCq0nEMRLxumITpMSWmKbnK+P1/r2
         HVgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RTJWKseL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs4-20020a056214226400b0069019d45e93si9268949qvb.195.2024.03.26.03.10.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 03:10:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RTJWKseL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rp3ke-00085O-BG; Tue, 26 Mar 2024 06:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rp3kc-00084r-DC
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 06:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rp3ka-0001JA-FN
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 06:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711447786;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvZPmz9vy0RCmtvYL34Y8frf70wRFwPX4tjmvWz7bfA=;
 b=RTJWKseLQmgq55Ws3psT02aYOqVxYCdnrXTtHd8Rpqm2is7NGLpmGEq+YWhg3oM1TcKpAW
 7U6ry5gJg84J8NhvRGqQ0WoHn3ZAX/DnTJ/I+P0NBBTLPf9XWezWMOPXq1TChTq3+/K7cW
 I7X+NQ/Lumv2z1/H35Uk0iYng8ElGkk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-TL3-pEuyO2CcKqL3jjK08A-1; Tue, 26 Mar 2024 06:09:45 -0400
X-MC-Unique: TL3-pEuyO2CcKqL3jjK08A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33ed5ddd744so1592042f8f.3
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 03:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711447783; x=1712052583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bvZPmz9vy0RCmtvYL34Y8frf70wRFwPX4tjmvWz7bfA=;
 b=NaYiHNc6Br/38SEeaLAvMi6SPEWDvtuumL/fe0G1Y1KSYn6L6VoqabcFRtpzK8n4TE
 Z9bJwx+jgsff094eIQJGTAjwFbHBpmbmY43Sfsd48mdT3VCfwyYEZwOhyvuGZveHaLkm
 dVPaAOgPxP0Hhq43ijCRx+wQVfM3kRwrwVh4fnzxPCsSnSULquC8Henbq7yQQ/4rOaCB
 O950L6j+QM2is2yS+eybN2KeDQzkXkVL7+HeZAPD/s789dfw40ogZBaL9ktc0RumqySA
 CV4WE8943PxkptuwQNwKiIzQ6M+e1ewvfCoRAcygRVuUXOcZphmLpUVzzMUdDdlRB/3a
 SpLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7E1gTRy/Ms0wjJAdQAzRtV7IzxhaV6E7KFaNd8glLXx+Yu2Pkm3C1hHKuqOloh9gZxS38j9HuXqXQm+M+H5plOTzF
X-Gm-Message-State: AOJu0YzZTD5TuyHgg7TrA/KAx2Ui91K52c4dYlD5OpYzSu3pHGf3MNZA
 s6n30bgAHIl+mHX57s5U8J9d463pYXZOvg9kZVKi0noR9OTq3Zk7LFejMJ5tkueSRb1Jg51ZDTx
 kwUqt24Usj/i/qQzApMnsIIrCEZR7JJZCTT4SJiSmgV47lGloHA==
X-Received: by 2002:a5d:43c9:0:b0:341:cfd6:42af with SMTP id
 v9-20020a5d43c9000000b00341cfd642afmr3333261wrr.31.1711447783122; 
 Tue, 26 Mar 2024 03:09:43 -0700 (PDT)
X-Received: by 2002:a5d:43c9:0:b0:341:cfd6:42af with SMTP id
 v9-20020a5d43c9000000b00341cfd642afmr3333248wrr.31.1711447782788; 
 Tue, 26 Mar 2024 03:09:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 en9-20020a056000420900b00341b451a31asm5552312wrb.36.2024.03.26.03.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 03:09:42 -0700 (PDT)
Message-ID: <f4805b73-b485-46e0-938d-b0cf23ea2aa6@redhat.com>
Date: Tue, 26 Mar 2024 11:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/5] ARM Nested Virt Support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, haibo.xu@linaro.org, richard.henderson@linaro.org,
 maz@kernel.org, gkulkarni@amperecomputing.com
References: <20240209160039.677865-1-eric.auger@redhat.com>
 <CAFEAcA_i7x=F-mDgkoa4Tma1xGH0no+WCfNt2Ljyk3DYhHNTiQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_i7x=F-mDgkoa4Tma1xGH0no+WCfNt2Ljyk3DYhHNTiQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.065,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +L9Ei4qedmE/

Hi Peter,

On 3/5/24 17:57, Peter Maydell wrote:
> On Fri, 9 Feb 2024 at 16:00, Eric Auger <eric.auger@redhat.com> wrote:
>> This series adds ARM Nested Virtualization support in KVM mode.
>> This is a respin of previous contributions from Miguel [1] and Haibo [2].
>>
>> This was tested with Marc's v11 [3] on Ampere HW with fedora L1 guest and
>> L2 guests booted without EDK2. However it does not work yet with
>> EDK2 but it looks unrelated to this qemu integration (host hard lockups).
>>
>> The host needs to be booted with "kvm-arm.mode=nested" option and
>> qemu needs to be invoked with :
>>
>> -machine virt,virtualization=on
>>
>> There is a known issue with hosts supporting SVE. Kernel does not support both
>> SVE and NV2 and the current qemu integration has an issue with the
>> scratch_host_vcpu startup because both are enabled if exposed by the kernel.
>> This is independent on whether sve is disabled on the command line. Unfortunately
>> I lost access to the HW that expose that issue so I couldn't fix it in this
>> version.
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v8.2-nv-rfcv2
>>
>> Previous version from Miguel:
>> [1] https://lore.kernel.org/all/20230227163718.62003-1-miguel.luis@oracle.com/
>> Previous version from Haibo:
>> [2] https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/
>> [3] Marc's kernel v11 series:
>>     [PATCH v11 00/43] KVM: arm64: Nested Virtualization support (FEAT_NV2 only)
>>     https://lore.kernel.org/linux-arm-kernel/20231120131027.854038-1-maz@kernel.org/T/
>>     available at: https://github.com/eauger/linux/tree/nv-6.8-nv2-v11
>>
>> Haibo Xu (5):
>>   [Placeholder] headers: Partial headers update for NV2 enablement
>>   hw/arm: Allow setting KVM vGIC maintenance IRQ
>>   target/arm/kvm: Add helper to detect EL2 when using KVM
>>   target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is supported
>>   hw/arm/virt: Allow virt extensions with KVM
>>
>>  hw/arm/virt.c                      |  6 +++++-
>>  hw/intc/arm_gicv3_common.c         |  1 +
>>  hw/intc/arm_gicv3_kvm.c            | 21 +++++++++++++++++++++
>>  include/hw/intc/arm_gicv3_common.h |  1 +
>>  linux-headers/asm-arm64/kvm.h      |  1 +
>>  linux-headers/linux/kvm.h          |  1 +
>>  target/arm/kvm.c                   | 21 +++++++++++++++++++++
>>  target/arm/kvm_arm.h               | 12 ++++++++++++
>>  8 files changed, 63 insertions(+), 1 deletion(-)
> All the patches in this series seem reasonable, but the series
> as a whole is so short I wonder if we're missing something :-)
> Does migration Just Work? (I guess as long as the kernel exposes
> all the EL2 sysregs via the ONE_REG ioctl interface it ought to...)
To be honest I have not tested yet. I would also guess there is no mig
blocker but that definitively deserves some testing. I will check before
sending the next version.
>
> Anyway, I don't think there's anything that stood out as needing
> major changes, so for now I guess we just wait for whenever the
> KVM side patches eventually land.

yup

Thanks

Eric
>
> thanks
> -- PMM
>

