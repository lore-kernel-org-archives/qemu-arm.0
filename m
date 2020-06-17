Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp817093lfm;
        Wed, 17 Jun 2020 10:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxygD9DWS+0qw5xA7qBqAoixuB2jKcGgOv3gVoFI62nqRKM5GgRHzKp8wIAtkq8sM93jaGg
X-Received: by 2002:a17:906:71ca:: with SMTP id i10mr268452ejk.550.1592415469215;
        Wed, 17 Jun 2020 10:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592415469; cv=none;
        d=google.com; s=arc-20160816;
        b=hce13EJT6RfZhlntDshqyo+w1TkYn0kqhTABowNpussRq2/RUxKfq3KL3PLgnoY4TI
         UpyhFryFbKrd9LaUv2W89WvmtX/Szm2motmQJzQCeoFCFDP3hqTt6Q8PPzeo4dwxdNCG
         JgA4XqlSqib9aMTW4lGBFOp2Km7qsYDd8SY8gkgc++YK1yRO9r2pu93esIgKBlK/R+wo
         RsZCDSSh4pA50BTX5reP+vI4weR1nS47quZN2xHNzxV9mphftqDL5fjAV6xfS4SV4jZi
         PE7CWt28CIdxfVDSQfv42QPcGAHlk8grhASfQqyEWhqz0JmAqWiRznSzoCyEP/HN+9DH
         5XTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=2hNrLKFzx+SU91EcmopqxtknC1GSH8vyiR3LApBQTDs=;
        b=KGYkJefFj5ItLBHm4snxooGt7y8Lwbv9EaoIB6CXYAFXdVPcHv9UhEv6H4QPw5jI8w
         elhAUcg4sHpKgwVtWUTg4PbaGa9mDAqYX/yYaptUjydPpUiBwGM4TlWr2/wFpoUKr3Cu
         Uv3R95uLjtCJoBIUqjRtGQAtUYAdGRiAfoKMi3kCvn/16AwRg6tiBo4UGjqLysIAkH+t
         IiILUm7h/R2eAPbApIf9beTpKpBaiFRiUaL0HX2zST1BSQAMhnnPmWsnoIfZR9y3I6NN
         My8s3nWDYIEcgKIkN3fr1fwXNGQacZVz/8j0gH4sryKonF+UkMLfPhRlgYZ1EkUqJXIy
         Wj8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KRy6Ly5W;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id n28si453962eda.445.2020.06.17.10.37.49;
        Wed, 17 Jun 2020 10:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KRy6Ly5W;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgFQRhs (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 17 Jun 2020 13:37:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55252 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726511AbgFQRhr (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 17 Jun 2020 13:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592415465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2hNrLKFzx+SU91EcmopqxtknC1GSH8vyiR3LApBQTDs=;
        b=KRy6Ly5WyCxZthah6nJzmHzzaSgcuVlT3iEZObTbeY75Comc4T/FlSTsNcXEXYaKu2Hd+x
        lp4CLTf86NgdYno3cwVZuN+3pROcCQjFNwaOzJSKTdP0CT6LdHyi3KvDYa98d5L2miwUck
        ikTQoJOYmIj3zvvbkEh9DxHea6q0G24=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-151YugsHMlGM23N1dhmmPw-1; Wed, 17 Jun 2020 13:37:44 -0400
X-MC-Unique: 151YugsHMlGM23N1dhmmPw-1
Received: by mail-wr1-f69.google.com with SMTP id w4so1671656wrl.13
        for <kvm@vger.kernel.org>; Wed, 17 Jun 2020 10:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2hNrLKFzx+SU91EcmopqxtknC1GSH8vyiR3LApBQTDs=;
        b=Tf31jjxkwN8swVvsV1CeeYiSRPrSSZeFXWK1yZN04UoCN48i1PiPwYB++8EnrzK6oA
         AIuaVMq0uWTL9S6fmK2Dy7L7Uuou58Mc89jk8UbCSG9nHLMZyTrSwsnPSA/QA1V3Dyn5
         AhIPUcD7PuJcZfszQ+KJlEOztIVvZfr9zDOGPhvx/YbNNz26n9n39x7gyAkOKSbMd19R
         HvDHOgPkFOBQoqxNGq/O62VJzSjEsC3G1WmHIM7y8jJABsCCETrIifCz8kIvfvLtl3tX
         fWa3QpRxJcDyssSDiiVEIPxF5/m90e0i7pnSewGjUzAjwZ9UFJH/I98txfM+9JBQaYJt
         n5yA==
X-Gm-Message-State: AOAM532EzJLbzsu1tElKEUInhhpcLbjBb7vtw6pnWTiVJEQR9DPEOyyP
        Z6KKzSTIUCfDRIy4VSrPXPXBW6QsQD4Qu/OpUYsEZ8XXAbGAO+/vf6MS9gQUfSNtBjJuybrGKjq
        vYo+ulSwYnOHe
X-Received: by 2002:a05:600c:2317:: with SMTP id 23mr9817908wmo.139.1592415463042;
        Wed, 17 Jun 2020 10:37:43 -0700 (PDT)
X-Received: by 2002:a05:600c:2317:: with SMTP id 23mr9817888wmo.139.1592415462827;
        Wed, 17 Jun 2020 10:37:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:48a4:82f8:2ffd:ec67? ([2001:b07:6468:f312:48a4:82f8:2ffd:ec67])
        by smtp.gmail.com with ESMTPSA id r4sm334822wro.32.2020.06.17.10.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 10:37:42 -0700 (PDT)
Subject: Re: [PATCH] target/arm/kvm: Check supported feature per accelerator
 (not per vCPU)
To:     Andrew Jones <drjones@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        kvm@vger.kernel.org, qemu-arm@nongnu.org,
        Haibo Xu <haibo.xu@linaro.org>
References: <20200617130800.26355-1-philmd@redhat.com>
 <20200617152319.l77b4kdzwcftx7by@kamzik.brq.redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <69f9adc8-28ec-d949-60aa-ba760ea210a9@redhat.com>
Date:   Wed, 17 Jun 2020 19:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200617152319.l77b4kdzwcftx7by@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: r5ChyGLEBhZH

On 17/06/20 17:23, Andrew Jones wrote:
>>
>> Fix by kvm_arm_<FEATURE>_supported() functions take a AccelState
>> argument (already realized/valid at this point) instead of a
>> CPUState argument.
> I'd rather not do that. IMO, a CPU feature test should operate on CPU,
> not an "accelerator".

If it's a test that the feature is enabled (e.g. via -cpu) then I agree.  
For something that ends up as a KVM_CHECK_EXTENSION or KVM_ENABLE_CAP on 
the KVM fd, however, I think passing an AccelState is better.
kvm_arm_pmu_supported case is clearly the latter, even the error message
hints at that:

+        if (kvm_enabled() && !kvm_arm_pmu_supported(current_accel())) {
             error_setg(errp, "'pmu' feature not supported by KVM on this host");
             return;
         }

but the same is true of kvm_arm_aarch32_supported and kvm_arm_sve_supported.

Applying the change to kvm_arm_pmu_supported as you suggest below would be
a bit of a bandaid because it would not have consistent prototypes.  Sp
for Philippe's patch

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks,

Paolo

> How that test is implemented is another story.
> If the CPUState isn't interesting, but it points to something that is,
> or there's another function that uses globals to get the job done, then
> fine, but the callers of a CPU feature test shouldn't need to know that.
> 
> I think we should just revert d70c996df23f and then apply the same
> change to kvm_arm_pmu_supported() that other similar functions got
> with 4f7f589381d5.
