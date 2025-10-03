Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A212CCA470
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 07:26:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4aBN-0002DZ-LH; Fri, 03 Oct 2025 03:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v4aBG-0002AI-23
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 03:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v4aB3-0002nJ-Ps
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 03:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759476355;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAOoG+vGKs/VAvoeIIqDnbq7u9S4SeuHXDsEPfVbHfQ=;
 b=gPadlrLMYmxux5XFgqum3qWuGG8bV0Uoel8lUuGQiulu4gr2I/FbhUlAnPFjE0HYLTmtcV
 Or7Vw4BkHLjQCfQVFDn1wntHGVK60vwyWl2k6ktk7gvN5BPpw2xXSMlIebNZxToZjpwmvp
 FITyXAl+W2oLXCsGGUEpa8V7HvhoBQ4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-TZwuZRMUM5e5x2_Rk7BUkQ-1; Fri, 03 Oct 2025 03:25:54 -0400
X-MC-Unique: TZwuZRMUM5e5x2_Rk7BUkQ-1
X-Mimecast-MFC-AGG-ID: TZwuZRMUM5e5x2_Rk7BUkQ_1759476353
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-40fd1b17d2bso816928f8f.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 00:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759476353; x=1760081153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QAOoG+vGKs/VAvoeIIqDnbq7u9S4SeuHXDsEPfVbHfQ=;
 b=IVaLRZLNQevdsNNUYM79JkesK0XbKbGoG033BH4v44gYZUk2xi8KCvRLVW/peYr0u3
 g2RPvx1OXsh5Kr90ULhpQoEvSmkWw1QbrGz2b4FsWBvfst2xwv+Eo43rrGfPDhOzNWRy
 NzD31NuFZeemn+i5Sy30lA1biTYPi3B8YnKE98SIuATL9pSEb34tmIxxkYQTi8tiNzhS
 +EWr4NRFVZuPmASWZpfWtHMl15T06SrS0Z4Fg4481ww3xdfnez31XX699rwNCsuKugwd
 ioO4j4YiLUeYacuyigd4dzHzwkfNmOSAsQV5ro6orxDifxQ1qUmYinm4lkREPZOu3KzU
 OoBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvGxdlmMufz6ED3GrGLZA55SHghss0FZuBACOo7YKyFuyKCv8VFsosUlHaDaYe9nO0kqkkYyLUIA==@nongnu.org
X-Gm-Message-State: AOJu0Yzuw1z9R41eX6WcnL/CwDeLAYpiNCBLrVjOF8e7ag7+RzWZJc5P
 dgyl7ERjdNw+q19QOS6FOvFSWjsyBLgPcj4bNZTupTkJ0zvZ2PZGlHn6rKcRcOt+bA+aNA4NIrX
 fWyyS8of3yq/Oo4kz8Zt6Xh0w8F0KyZaQ2yIodonZhJrN7Z/w0yubJQ==
X-Gm-Gg: ASbGncuEQzBCZREaowCFNnQXaBgEoNE/849lljnLuvXXRFSgnslg5IkeRzFFmfiz6Pj
 yZudn4JLSCRwJVmVoW8a5tEkR4QHRnbG88Wv3wprjAdYxYk6nk0ZHmCYjOZzWk7g9y6gnaeQblL
 0TMcfxtiHk4+e7azxgSxmM1/e35lG6omE6OpJXybQd0Xqs3kNf5KW6PubBskI6JDzmgphe04+/1
 McoOV2FLEDbZwHzFFyEZv+stE4GUjCqwq+5VcsgGqhurtMRvHGUzjmWx3BCBJlerc26nf4M5RO1
 p2j8jwW+i/iUkFrM7cxGTn+dpzgiS2B9go1Y46TFp76KNaLjoq0Pjg24dNiAqeUCuEL/Q7fda1k
 9lh096yiGGi064jBA
X-Received: by 2002:a05:600c:a11:b0:46e:33a6:46b2 with SMTP id
 5b1f17b1804b1-46e71109edfmr13346545e9.12.1759476352939; 
 Fri, 03 Oct 2025 00:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN6aRXZnWy4PDJBAKpRA5uFyF8D9mVVhUeOnY4k8Ev9BmmUp9jbB2HfKlIDB9SQFO4tzv5gA==
X-Received: by 2002:a05:600c:a11:b0:46e:33a6:46b2 with SMTP id
 5b1f17b1804b1-46e71109edfmr13346235e9.12.1759476352473; 
 Fri, 03 Oct 2025 00:25:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723591fcsm17742725e9.10.2025.10.03.00.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 00:25:52 -0700 (PDT)
Message-ID: <b2ae3dc0-9bf0-4e89-a995-b97410d57861@redhat.com>
Date: Fri, 3 Oct 2025 09:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] target/arm/cpu: Add new CPU property for KVM regs to
 hide
To: Sebastian Ott <sebott@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>, maz@kernel.org,
 oliver.upton@linux.dev, gshan@redhat.com
References: <20250911134324.3702720-1-eric.auger@redhat.com>
 <20250911134324.3702720-2-eric.auger@redhat.com>
 <0f05a0ec-8b98-a9b7-6e3a-9ef73d0c34e7@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <0f05a0ec-8b98-a9b7-6e3a-9ef73d0c34e7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mGbzm0VWk54n7Ef8dmefO0D4Dif8O_xyLIAjJZ0Rsfo_1759476353
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.451,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Sebastian,

On 9/18/25 6:16 PM, Sebastian Ott wrote:
> On Thu, 11 Sep 2025, Eric Auger wrote:
>> New kernels sometimes expose new registers in an unconditionnal
>> manner.  This situation breaks backward migration as qemu notices
>> there are more registers to store on guest than supported in the
>> destination kerenl. This leads to a "failed to load
>> cpu:cpreg_vmstate_array_len" error.
>>
>> A good example is the introduction of KVM_REG_ARM_VENDOR_HYP_BMAP_2
>> pseudo FW register in v6.16 by commit C0000e58c74e (“KVM: arm64:
>> Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2”). Trying to do backward
>> migration from a host kernel which features the commit to a destination
>> host that doesn't fail.
>>
>> Currently QEMU is not using that feature so ignoring this latter
>> is not a problem. An easy way to fix the migration issue is to teach
>> qemu we don't care about that register and we can simply ignore it,
>> including its state migration.
>>
>> This patch introduces a CPU property, under the form of an array of
>> reg indices which indicates which registers can be ignored.
>>
>> The goal then is to set this property in machine type compats such
>> as:
>> static GlobalProperty arm_virt_kernel_compat_10_1[] = {
>>    /* KVM_REG_ARM_VENDOR_HYP_BMAP_2 */
>>    { TYPE_ARM_CPU, "kvm-hidden-regs", "0x6030000000160003" },
>> }
>
> One thing worth noting - once this series lands:
> https://lore.kernel.org/qemu-devel/20250801074730.28329-1-shameerkolothum@gmail.com/
>
> we might need to add a bit more logic here. Either using the kvm
> interfaces (only ignore KVM_REG_ARM_VENDOR_HYP_BMAP_2 when the register
> value is 0) or qemu knowledge (only ignore KVM_REG_ARM_VENDOR_HYP_BMAP_2
> when the impl-cpu property is not used).

Effectively if we "hide" KVM_REG_ARM_VENDOR_HYP_BMAP_2 on save/restore
we must enforce the reg is not used by userspace.

One way would be to test whether KVM_REG_ARM_VENDOR_HYP_BMAP_2 is hidden
in kvm_arm_target_impl_cpus_supported() and if it is, report false.
However for every new functionality in qemu it does not sound sensible
to check whether new KVM regs being used are anonymously hidden.

Another way could be to fail kvm_set_one_reg/kvm_get_one_reg in case the
register is hidden. That way in Shameer's series, kvm_arch_init_vcpu()
would fail if BMAP_2 is hidden, ie. in our example for all machines
types before 10.2. By the way adding Shameer.

Thanks

Eric


>
> Sebastian


