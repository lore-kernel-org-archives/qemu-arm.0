Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2349134lfq;
        Sat, 3 Oct 2020 03:14:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwtEZEEZlBh/wTEYXd/k6zxffi89IRv3Ca3TW6aizI6wfv7c6tGBi1J9JhMqXIQRpTA3YL
X-Received: by 2002:a05:6402:7d2:: with SMTP id u18mr7708768edy.69.1601720070666;
        Sat, 03 Oct 2020 03:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601720070; cv=none;
        d=google.com; s=arc-20160816;
        b=n1LKpSzrAfurjT3fA0/9EHAZv4wrsL6CFgn5eJ9J1uJyOkT1KS+53E8SFGUnSQH+bl
         4zhnWUwfDpB6RYFJ1TfvIggN+LpRcOXEXwoAJH4zuSXBYYx1AUjQH5BTVV81CTiUAkdT
         gUSwn5RIJWcao/LJjRLfQIxgflo7XSfXMeU1ow7Xfg2fA05GVqLeLptCjVocj5UgAUiX
         spvOm0M8NPQp4vz2oVYzcsC+YUho4KFTBqYKC7Bjqj9tpcQfw2rqy/20enV6l4RnXiRY
         RAsNaJhljI+FxuOU4UBAqQKy+JVmscQ5jZ0gI/vRuh3iP3C8AAD4sbQGPwoRMiuc4bpn
         U9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LrY7ZzRUnhZ7GuZMqcELGWPYItfe77Y46Yqcbu2JTIo=;
        b=i99RznfmAILFguGfJifERqHJ9BMdtHp4PH741exGf9Typvmo5BiYrgUsRBktSmTKHB
         GsjlKt5JLf3eORWE8+vIiWREf4RPGR/Tfwb/KuYNGCLPk7wNWYvzmfqlIQK8a6ZuAnmz
         GyUpQRn5kEEpt40EucFZT13j77R2gd/20/0dnEcUSR9EWyM4oruDL0mJhNu38PHkagcU
         J3g/5IbPchPjL1hlYA3cad4X/39ON2fOPAV9JbH7jO/r+quUAsEQo43VFvJitWoKkhWX
         Rf7reGtJB6jh/O/bpd24jsn/rVLxdEl2CE7GnkF6ABrxy6kx45sCP6leK2GsdN6l097M
         ALjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TZKjNKpl;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id u18si3071865ejf.75.2020.10.03.03.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Oct 2020 03:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TZKjNKpl;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601720069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrY7ZzRUnhZ7GuZMqcELGWPYItfe77Y46Yqcbu2JTIo=;
	b=TZKjNKplibqpqhYqlezGWiE6pk+MlW79RMn2m9FhgIzC0WD/MdOaJ0ULOLK2hljKvRvIoN
	2dhsnsmHAEuk7f1sYBm3BF8SuPIBkMzHgxCuNWRDdX+4NOS3MMLoOmn4/BPEArURoIp7Bh
	VkCTfZUEhSz5/qhMQ1W9wVAuiM5P3Uw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-2BBmpV7vMtim8jnwcpfuGQ-1; Sat, 03 Oct 2020 06:14:28 -0400
X-MC-Unique: 2BBmpV7vMtim8jnwcpfuGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 656571DDEB;
	Sat,  3 Oct 2020 10:14:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 581107EB8F;
	Sat,  3 Oct 2020 10:14:24 +0000 (UTC)
Subject: Re: [PATCH v4 12/12] .travis.yml: Add a KVM-only Aarch64 job
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-13-philmd@redhat.com>
 <bd4c4587-de23-7612-48c7-afc8b94ab9fb@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c7140a42-043c-9bc5-88c8-2cdad9ae2a14@redhat.com>
Date: Sat, 3 Oct 2020 12:14:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bd4c4587-de23-7612-48c7-afc8b94ab9fb@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-TUID: TF/oGD55+H9j

On 03/10/2020 12.03, Richard Henderson wrote:
> On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
>> Add a job to build QEMU on Aarch64 with TCG disabled, so
>> this configuration won't bitrot over time.
>>
>> We explicitly modify default-configs/aarch64-softmmu.mak to
>> only select the 'virt' and 'SBSA-REF' machines.
> 
> I really wish we didn't have to do this.
> 
> Can't we e.g. *not* list all of the arm boards explicitly in default-configs,
> but use the Kconfig "default y if ..."?
> 
> Seems like that would let --disable-tcg work as expected.
> One should still be able to create custom configs with e.g.
> CONFIG_EXYNOS4=n or CONIFIG_ARM_V4=n, correct?

But that would be different from how we handle all other targets currently...
IMHO we shoud go into a different direction instead, e.g. by adding a 
"--kconfig-dir" switch to the configure script. If it has not been 
specified, the configs will be read from default-configs/ (or maybe we 
should then rename it to configs/default/). But if the switch has been 
specified with a directory as parameter, the config files will be read from 
that directory instead. We could then have folders like:

- configs/default (current default-configs)
- configs/no-tcg (all machines that work without tcg)
- configs/lean-kvm (for "nemu"-style minimalistic settings)

etc.

What do you think?

  Thomas
