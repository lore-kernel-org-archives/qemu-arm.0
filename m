Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp371811lfm;
        Sun, 16 May 2021 04:17:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+sjGydTNx+hu+zufd4OxfYAPx8C31/in+c+u0eXl8u+hG5RR1uPG0ihYPuAa6rKjli5ho
X-Received: by 2002:a6b:ea0e:: with SMTP id m14mr27830391ioc.182.1621163854153;
        Sun, 16 May 2021 04:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621163854; cv=none;
        d=google.com; s=arc-20160816;
        b=gWFaBTpMdgZC0dCz9e8zg2NievVLCK8OyMPj+dj07WctV0SXjMDkakAJxLNOBtnTa/
         NGogd2j+IY18xUMHOU0DOy/2/NAccRF/mX/smAjGRBJFDVHqrWAyqx8ohoa9+gahRXVK
         csUwqviQV0mcYOO8fZDbxrTxBHEYtMZ8wKQsbwMjkggxaE3iqd/iUi5VhBvpALaEPS9P
         E4l57AeDHkCqrOffEOeAWTOR3pIj9QDFa+fS2sXhxiV/Rc14wRd2wk0BUbah7rvqBMy6
         bg/HeHIkMzsCZioQLqOetla8b7XadkS7x3wCtLWEAUPKFQtVwl/eYRpXJCiMANFHh4i/
         SVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=qIvH4rtTA2J6KHXKHBT02IQjnr6E9Cse631DC5wpwjU=;
        b=BKD9w41OZa7JifzgCb+SQUIrrPvGT+8HS43WHSHuy3/ZpmHa6i1+BLpbaWiHXnmXC8
         DGkaueQdpD5YTru+OdWp1DQW3QxADfR73x5ZsveEUj+o/xHjswDS877Md3mDljXu87Vc
         2s52h6MSwyg+dRBkoJAnL39tIwumKLBD1X0cFSvz9Vr8jj6AWrJ4fZH7UWiWAd4qShdp
         ILmZSXpwdrsXqt8QF20iiATEPkG9SKxeE5TAuKaeQHMahu9MNnu+rPb+uTPaaEcAWBHF
         t36BxaAcMy6Uoqwym4d6KlLLsRIpX9xbk4hILf9kzsqafrUbzxNDn3nyeVAWAr9eDhif
         H4LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si184548ilj.12.2021.05.16.04.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 04:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liEm5-0003zF-0Z
	for alex.bennee@linaro.org; Sun, 16 May 2021 07:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liElS-0003yc-9p; Sun, 16 May 2021 07:16:54 -0400
Received: from mail.csgraf.de ([85.25.223.15]:44928 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liElM-0003FV-BI; Sun, 16 May 2021 07:16:53 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-002-111-216.77.2.pool.telefonica.de [77.2.111.216])
 by csgraf.de (Postfix) with ESMTPSA id 5992560803C7;
 Sun, 16 May 2021 13:16:43 +0200 (CEST)
Subject: Re: [PATCH v6 11/11] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-12-agraf@csgraf.de>
 <CAFEAcA-021U3ehg_jnAHtako-A-GRxqwjqZWotroumUxfPhdGA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <223c7fbc-3a07-e97c-04eb-ef38ec3d67fe@csgraf.de>
Date: Sun, 16 May 2021 13:16:42 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-021U3ehg_jnAHtako-A-GRxqwjqZWotroumUxfPhdGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RMnlKwCkgdkJ


On 28.01.21 17:55, Peter Maydell wrote:
> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>> Now that we have working system register sync, we push more target CPU
>> properties into the virtual machine. That might be useful in some
>> situations, but is not the typical case that users want.
>>
>> So let's add a -cpu host option that allows them to explicitly pass all
>> CPU capabilities of their host CPU into the guest.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> ---
>>  include/sysemu/hvf.h |  2 ++
>>  target/arm/cpu.c     |  9 ++++++---
>>  target/arm/cpu.h     |  2 ++
>>  target/arm/hvf/hvf.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>  target/arm/kvm_arm.h |  2 --
>>  5 files changed, 51 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
>> index f893768df9..7eb61cf094 100644
>> --- a/include/sysemu/hvf.h
>> +++ b/include/sysemu/hvf.h
>> @@ -19,6 +19,8 @@
>>  #ifdef CONFIG_HVF
>>  uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
>>                                   int reg);
>> +struct ARMCPU;
> Yuck.
>

[...]


>> +    hv_vcpu_t fd;
>> +    hv_vcpu_exit_t *exit;
>> +    int i;
>> +
>> +    cpu->dtb_compatible = "arm,arm-v8";
>> +    cpu->env.features = (1ULL << ARM_FEATURE_V8) |
>> +                        (1ULL << ARM_FEATURE_NEON) |
>> +                        (1ULL << ARM_FEATURE_AARCH64) |
>> +                        (1ULL << ARM_FEATURE_PMU) |
>> +                        (1ULL << ARM_FEATURE_GENERIC_TIMER);
>> +
>> +    /* We set up a small vcpu to extract host registers */
>> +
>> +    assert_hvf_ok(hv_vcpu_create(&fd, &exit, NULL));
>> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
>> +        assert_hvf_ok(hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val));
>> +    }
>> +    assert_hvf_ok(hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &cpu->midr));
>> +    assert_hvf_ok(hv_vcpu_destroy(fd));
> Nicer to follow the KVM approach of only doing this once
> and caching the results in arm_host_cpu_features, so that
> for a many-cores VM you don't do it once per core.


I tend to disagree. This scales nicely with the number of cores you have
in the system and it's blazingly fast :). I would rather like to
optimize for simplicity here.

The rest of the comments I agree with and will address them in v7 :)


Alex

