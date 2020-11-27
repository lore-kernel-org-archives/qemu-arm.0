Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2638854lfb;
        Fri, 27 Nov 2020 09:48:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6JsJuHoBKaGXpxREywmIlQbeKM9ImEHIs6MvTrqzF81JMztSvnCPIyUlBFhLm7AxWjE9o
X-Received: by 2002:a25:32cb:: with SMTP id y194mr11298914yby.506.1606499337802;
        Fri, 27 Nov 2020 09:48:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606499337; cv=none;
        d=google.com; s=arc-20160816;
        b=knhpG69U3EmOFru/W/xT47jidXJ8Y4tJ2k3J9qR6zVGfjomVj8ka4ksWTeDievjVLA
         bsOnPizTikPegfEpDfq6iGNQOt2DyHx37NOpMhjWSjWmutAtdN9ewR6yW4wGhYHL+GtQ
         XdYsm2XqDr516OhNMA6y6yUTuaLSESR7/fztknjI1wjrZe3pshCTJhMchYbZM0KkPiBD
         +5N9biEoPF26dL651H5AkJct20ySzbOQzFeT5uQzi1DWKaAgCLlglVXb66PQusYK2x2H
         vwbRe43vf0AaQwkTLOz5ITB2+8lzeXCG8Cvg1zXoh5R5We0akZe9S4KM8ujYNYtg+oIr
         dHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FrUHxBdR6Ox1T/ChkcEIyNYihhGFZ9TLF2XdomcgI9Q=;
        b=JM40yFU4ygE+61DnrOnT6/6PR5aIHUm/oqjluqAO/LnFiQnK02+vIuVkjtvM/O5n+3
         DRXRixZOLVR2QALuf5140dPGLhr7Qrfb2DuyI/LzanYmJIe7OWCcIc5BjUQBK18ZKH1n
         ug/5xIU1XtP/1VOZVrlR5CW4VtGhR3kN8ZWF6m+ZkvuLNACOCRh1+nfgmtuSlq5NCK9C
         OlQEust0yX6cu275YzoLT1UGm2fw2ZY3CJOZ4Cd4dZWdN6bLg4IgBillD0Lx5XsujghW
         J3atFC+fAvNDwnEpRxM5yrGs23w9xSQ2Q8GweKVCwFMtJT2IO60P0O0QmIYwR0cVF+ts
         NUVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IzISu6TZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h125si9039908yba.281.2020.11.27.09.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 09:48:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IzISu6TZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kihrd-0001pQ-7h
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 12:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kihrP-0001oX-Bz
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 12:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kihrN-0006v5-HI
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 12:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606499320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrUHxBdR6Ox1T/ChkcEIyNYihhGFZ9TLF2XdomcgI9Q=;
 b=IzISu6TZBkUwIXhZo409M9xb+ndjPbM/y5jYlHaX9g8IeRlf7W3f8tKUP09J8v2FPbXF7u
 6i0WkaHAWrvoY85Pm+ZqHLRFFPYNLfUQq+NutxqR0cWRpXLzdQxhX4GL/Z/0s3Bu++5dpl
 RNwHago9Gte2TXCgFLoDutkrevNr+Pk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-FnI6TwnCMG-UcPMUwXxsVA-1; Fri, 27 Nov 2020 12:48:38 -0500
X-MC-Unique: FnI6TwnCMG-UcPMUwXxsVA-1
Received: by mail-wr1-f70.google.com with SMTP id b12so3776524wru.15
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2020 09:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FrUHxBdR6Ox1T/ChkcEIyNYihhGFZ9TLF2XdomcgI9Q=;
 b=Qtrx15fpimeGyKWeTlxpLdVRt5iCiBZw1Vop9t8KFNVzRviffjgglYROWT633kNC7Y
 TiJYV1OKvcVkUAY0BXVRWZWTikm6OdSVngyslk2tB+e1Gxp1hhEqy+CAizdihIK1axqU
 V3Dx68hH1YZZQytOqu3EJhnfxnyq2obf4krV2D6SySXG7axLc5SDeytsytdVATR/G0iM
 lreF5en3xMIj+NZStzkTSeDvJ+5VMlUJ3RWRDZDDBaKKrf8H10UhEfzBlTszVnNGzXB4
 1WC5qGq0dK9gqQ6ug3TcHPhoiOzZGxbrskXy/3imR0V2npMvpPF+DFu16FbCBTsds8LK
 QEMA==
X-Gm-Message-State: AOAM531LhdbBdWCrxy8OOD7wc++h+xrULqOZPS/WAwZBbhQ7CcVmdYoc
 JrBKMmb5oMu5rKvTtK894vrAVbHypKhZ1ODU3pxAFmZjBLYC/3CaDk8g7uXCs4kYlUsxyEIH9AU
 lmHA9g9bC3ai+
X-Received: by 2002:a05:600c:2886:: with SMTP id
 g6mr10503288wmd.110.1606499317559; 
 Fri, 27 Nov 2020 09:48:37 -0800 (PST)
X-Received: by 2002:a05:600c:2886:: with SMTP id
 g6mr10503263wmd.110.1606499317354; 
 Fri, 27 Nov 2020 09:48:37 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a15sm16287289wrn.75.2020.11.27.09.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 09:48:36 -0800 (PST)
Subject: Re: [PATCH 0/8] hvf: Implement Apple Silicon Support
To: Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126221049.GS2271382@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fce7fc61-24de-0b1a-4cca-bba80ab5de60@redhat.com>
Date: Fri, 27 Nov 2020 18:48:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126221049.GS2271382@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 11X5RlmgEDK8

On 11/26/20 11:10 PM, Eduardo Habkost wrote:
> On Thu, Nov 26, 2020 at 10:50:09PM +0100, Alexander Graf wrote:
>> Now that Apple Silicon is widely available, people are obviously excited
>> to try and run virtualized workloads on them, such as Linux and Windows.
>>
>> This patch set implements a rudimentary, first version to get the ball
>> going on that. With this applied, I can successfully run both Linux and
>> Windows as guests, albeit with a few caveats:
>>
>>   * no WFI emulation, a vCPU always uses 100%
>>   * vtimer handling is a bit hacky
>>   * we handle most sysregs flying blindly, just returning 0
>>   * XHCI breaks in OVMF, works in Linux+Windows
>>
>> Despite those drawbacks, it's still an exciting place to start playing
>> with the power of Apple Silicon.
>>
>> Enjoy!
>>
>> Alex
>>
>> Alexander Graf (8):
>>   hvf: Add hypervisor entitlement to output binaries
>>   hvf: Move common code out
>>   arm: Set PSCI to 0.2 for HVF
>>   arm: Synchronize CPU on PSCI on
>>   hvf: Add Apple Silicon support
>>   hvf: Use OS provided vcpu kick function
>>   arm: Add Hypervisor.framework build target
>>   hw/arm/virt: Disable highmem when on hypervisor.framework
>>
>>  MAINTAINERS                  |  14 +-
>>  accel/hvf/entitlements.plist |   8 +
>>  accel/hvf/hvf-all.c          |  56 ++++
>>  accel/hvf/hvf-cpus.c         | 484 +++++++++++++++++++++++++++++++++++
>>  accel/hvf/meson.build        |   7 +
>>  accel/meson.build            |   1 +
> 
> This seems to conflict with the accel cleanup work being done by
> Claudio[1].  Maybe Claudio could cherry-pick some of the code
> movement patches from this series, or this series could be
> rebased on top of his.

It seems easier for Claudio to cherry-pick patch 2/8
of this series ("hvf: Move common code out") and rebase
on top.

Claudio's series is still tagged RFC, but if you were
planing to queue it, you could take patch 2/8 out of
this series, as it is generic, and let the HVF/AA64
specific bits still being discussed.

> 
> [1] https://lore.kernel.org/qemu-devel/20201124162210.8796-1-cfontana@suse.de

