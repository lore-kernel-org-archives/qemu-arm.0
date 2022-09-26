Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp80524ocs;
        Mon, 26 Sep 2022 12:46:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6X72AbZ4K4tlamVuxTxauE2QXj7Iky2s3fi58TditDf/MSKvI4EcJRQQCoOGFOqtNNxxJp
X-Received: by 2002:a05:6214:20a6:b0:4ac:ba17:e20f with SMTP id 6-20020a05621420a600b004acba17e20fmr19026307qvd.101.1664221592433;
        Mon, 26 Sep 2022 12:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664221592; cv=none;
        d=google.com; s=arc-20160816;
        b=G0ueRiWhoiFAdez8S1DI/fZECpfT/LUBdQWPw9q0KVRFF1pCM/+VSpg2p7QjeWdiI1
         k3JZm+twFOO+jSloPB6X6zUrA4IjNsjIalAqRzkoeFngg5keLGaSXzhS1ynr22ymyhGk
         NpDJWq9+HlQom2FS1/sflJrZ7yW9hAs7m1LNUk4McRh7e3M9A8c18x1dLNjR6FR2Avgy
         6+Rrb/AWQ+SW0O412gcYOSHm5mBqhLDlkjuz8gFUbbzJOecrzDh6yTZHDmfSqRf8W+0g
         Lx8c16KPDVG8cn5DBY0DckoaD4GbocD0R3pcFHC8xX6HdLEy9awgTs+PYR1pF9dsnYQ1
         34XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eRGbgV7CewtnPo9ajuvUSujXQ8mMIdCVqygf/ajaJSM=;
        b=OyTEQx5UrJ/LGN55+qeHkeCi956J/Uj+jprmjERa+IGtKhoTqDo9WRrFPfGRJNZtKt
         JAURanoBdhiBUrgLV1ykKDdTATXYHw1nAy+SGt1fA7CbAvH9HqvCjIFmQPop+ab/+OSm
         HtEmQfK+ajbgHdp3cEN/DC/bAndt+C1oZsGI90wkSHgj1TJg1+gKpzNcWcPAUGIe+VPq
         Hdd2qcnIHWE2FPhH6Atu26lEfLeKrUUqswF/FXklPwIHrM2J5mWq/o2ZgYaXQz0vzp4d
         0WFBvXZfQ83E5KC+djfu/4c0OagDn7IA1J+GgI5zFixyjZrIdvPuP0mDqpscLefK66Sc
         AvLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jiiagrbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a05620a444600b006cf22d71dc9si9817484qkp.490.2022.09.26.12.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 12:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jiiagrbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ocu3j-0004RJ-R1
	for alex.bennee@linaro.org; Mon, 26 Sep 2022 15:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ocu1d-00021w-4O
 for qemu-arm@nongnu.org; Mon, 26 Sep 2022 15:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ocu1Z-0004hm-JN
 for qemu-arm@nongnu.org; Mon, 26 Sep 2022 15:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664221456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRGbgV7CewtnPo9ajuvUSujXQ8mMIdCVqygf/ajaJSM=;
 b=JiiagrbzCyqrMZnbAf2fXwuvAUODUQNArVuWcC6JPO5MOaTuFk5bCqNtQFDkX+Nmj73Gpc
 yddxI+538/vz/rd3glXEUTKHrJXh8q9ITpsGzLtoeLmu1qMYU50ldPRdLgVWrHvTZ2MPiO
 fCsm6t1lCpPtLzw+2dyD2pqiq57R6N8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-a0p2Ql47OLWKvllJknRR5A-1; Mon, 26 Sep 2022 15:44:15 -0400
X-MC-Unique: a0p2Ql47OLWKvllJknRR5A-1
Received: by mail-ed1-f71.google.com with SMTP id
 c6-20020a05640227c600b004521382116dso6247303ede.22
 for <qemu-arm@nongnu.org>; Mon, 26 Sep 2022 12:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eRGbgV7CewtnPo9ajuvUSujXQ8mMIdCVqygf/ajaJSM=;
 b=pIpUxQ3rkmOQaKmOvCEYhEkG+48QLFg63qilLGnl2zaQAlzieWKpf0eyLmVMD3hKzf
 hihJqVhGVbRujkMK3xFpdDwMYSThO9IsM80IWWRYQlrZQ7W4sA3RWAaH3A3IyvRGOmfo
 SvBgfkm0UKiMU/fk5eXC4B9CyQWDTsWHMEGGHFxiwNOx8plD9mBoC71Hnc7GNOl8140z
 Id9nGepNhMC5lUtHGDMimupewqNenWlBMcYxqb96WWE418WIHT2xHzfNMAjv7UR26lqO
 CU/IHAF2gdozqZlbQshM+f5pZ74VcggFLUm0FFx558ioCrV5Zez8Oxx/O4evGIRxMRdN
 ayXA==
X-Gm-Message-State: ACrzQf3NuZmK0qyEbH/+dbFtzIjJ2CEWvNkKU2zzuEBEmf/DtWLi38Jr
 7SYbW13P+MdighMD4lvTzmeAHW6ZGq5lRbseS/slNXBFGcFUz6EFOEK3TEJeLeFuAgKJX4QRajx
 vnHj2RFjBrzgI
X-Received: by 2002:aa7:dd57:0:b0:453:2d35:70bb with SMTP id
 o23-20020aa7dd57000000b004532d3570bbmr24973524edw.26.1664221454512; 
 Mon, 26 Sep 2022 12:44:14 -0700 (PDT)
X-Received: by 2002:aa7:dd57:0:b0:453:2d35:70bb with SMTP id
 o23-20020aa7dd57000000b004532d3570bbmr24973435edw.26.1664221453298; 
 Mon, 26 Sep 2022 12:44:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b00731803d4d04sm8562479ejo.82.2022.09.26.12.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 12:44:12 -0700 (PDT)
Message-ID: <e8ac651a-8736-7455-8945-34f680404f5b@redhat.com>
Date: Mon, 26 Sep 2022 21:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
To: Peter Maydell <peter.maydell@linaro.org>, Vitaly Chikunov <vt@altlinux.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dmitry V. Levin" <ldv@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220926133644.1345269-1-peter.maydell@linaro.org>
 <20220926180812.oojocmldqsf7kl2o@altlinux.org>
 <CAFEAcA8tfam1tENE+O9Ae=69mbb=k=XOuJ0AsM9ErqURSnsuXQ@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <CAFEAcA8tfam1tENE+O9Ae=69mbb=k=XOuJ0AsM9ErqURSnsuXQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TgMwcspN3w20



On 9/26/22 21:07, Peter Maydell wrote:
> On Mon, 26 Sept 2022 at 19:08, Vitaly Chikunov <vt@altlinux.org> wrote:
>>
>> Peter,
>>
>> On Mon, Sep 26, 2022 at 02:36:44PM +0100, Peter Maydell wrote:
>>> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
>>> there is no pending signal to be taken. In commit 94ccff13382055
>>> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
>>> generic KVM code. Adopt the same approach for the use of the
>>> ioctl in the Arm-specific KVM code (where we use it to create a
>>> scratch VM for probing for various things).
>>>
>>> For more information, see the mailing list thread:
>>> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
>>>
>>> Reported-by: Vitaly Chikunov <vt@altlinux.org>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> The view in the thread seems to be that this is a kernel bug (because
>>> in QEMU's case there shouldn't be a signal to be delivered at this
>>> point because of our signal handling strategy); so I've adopted the
>>> same "just retry-on-EINTR for this specific ioctl" approach that
>>> commit 94ccff13 did, rather than, for instance, something wider like
>>> "make kvm_ioctl() and friends always retry on EINTR".
>>> ---
>>>  target/arm/kvm.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>>> index e5c1bd50d29..2982d216176 100644
>>> --- a/target/arm/kvm.c
>>> +++ b/target/arm/kvm.c
>>> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>>>      if (max_vm_pa_size < 0) {
>>>          max_vm_pa_size = 0;
>>>      }
>>> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
>>> +    do {
>>> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
>>> +    } while (vmfd == -EINTR);
>>
>> This does not seem correct. ioctl(2) returns -1 on error and will set errno
>> to EINTR (in this case).
> 
> Oops, thanks for the catch. I was copying the pattern from kvm-all.c,
> but there we are calling kvm_ioctl(), which does "if ioctl
> returns -1, return -errno", and here we are calling ioctl() directly.
> (We can't use kvm_ioctl() here because this stunt VM doesn't have
> a KVMState.) I'll respin the patch with the obvious fix.
Damned, I did not notice either, sorry.

Thank you Vitaly for the catch.

Eric
> 
> thanks
> -- PMM
> 

