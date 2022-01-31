Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2363651lfk;
        Mon, 31 Jan 2022 08:36:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvgecLzGJtIgyOBN+MOV1N6+11L38wK/kdvFZvgsO4nZ1RN7PTJvozbZ0iVw93tw/qLzhV
X-Received: by 2002:a92:cb45:: with SMTP id f5mr12503124ilq.86.1643647010211;
        Mon, 31 Jan 2022 08:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643647010; cv=none;
        d=google.com; s=arc-20160816;
        b=m0YacGgekSuJniOzcuLyOaCKocitym9VAmBwaCI0A5vGeAQ7ViXbU2yUjbkZ29/SDS
         s6cgTASjlst3/FTB+CzgMAic54sciIXIwOCRD/2Xi26/pKUPNvxsC+Mr4i4iqui8BtvA
         f55aTornuFqZghOQxBnGPmhAviFWbdPlg9AvQoQIbcxm8zpHWa8SETvNt0o2izB1zDow
         WgT5uavNOU6sIieP4dFwkug31Gg2dERk7OVFtFlzhDrKAdrUdkvTlXMplnflbkgdaMsV
         86Rr5IYZP1j1ey64ECLxt2JQTEL1Q3uiDynTB42VY3PJlgHjWdZNWg1YthE7DHkL35dH
         y0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qeO6XJV2jmnwI4OAOt5S9XoqyRxZqpx8HZqz9ac4uis=;
        b=wG1o01mNgO8CmZY1bTsW2n//qjI6kGR+yi7qoQrF0bHwXjHjHLfH/kr3ui4mdOXFVg
         aYmyYP5/ibRvCf8R2gvfZWtuvrxiDNmExyeUYampnrVbzhmBzkcYa1LYa9ttpx2+VF+/
         sLO5PG1HgWJuaoaBatqWYkciMgH/iQvdPgTTZZzEn2HIbuITPvAA+XlxMUlt+UaAKF9t
         zHIjNDLtlvb09gij8+BEEru7Q3Nsf5WVzOtQQPXovvUWz9zYYclywSotAuFuMpSJM1Pr
         JYFvt3MtYynAqFRAr3RPGSPUKyYZK7mu3EAhhIzvyfRiNM/M1lDURxd6lAM6v8VJIzvJ
         T82Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MaCdpD9f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si11586770ilv.13.2022.01.31.08.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 08:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MaCdpD9f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEZfd-0008A2-Jl
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 11:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEZO3-0003Cw-5g
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:18:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEZO1-0007h7-Dr
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643645916;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeO6XJV2jmnwI4OAOt5S9XoqyRxZqpx8HZqz9ac4uis=;
 b=MaCdpD9fhSH7Kk99oFCli86/PUAg+fUO8PFdR7F/Hk134qjl7zfqL6rzUZnIHgQOekWlR/
 0PXSfqKCCXQJZyaMVIdY3KtGdM9aPmt+Ajg16JSHBsr3YMB2qEsZLaX4TFK5spOlmidtCq
 Lz1swJYyFXFG8aDq7TjJ0xyHRoJgqR8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-WLqkKt7fPUSxriaLWn3Obw-1; Mon, 31 Jan 2022 11:18:33 -0500
X-MC-Unique: WLqkKt7fPUSxriaLWn3Obw-1
Received: by mail-wm1-f70.google.com with SMTP id
 d140-20020a1c1d92000000b0034edefd55caso10553674wmd.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 08:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=qeO6XJV2jmnwI4OAOt5S9XoqyRxZqpx8HZqz9ac4uis=;
 b=WN8OWMsAVcf/ebeOBFPlrRRz+ih9jsZe/Dv5vQlqe+L2MtK5DlRfb0/KJu7PnxBvVq
 A8SXmOAioZatRHHDWCKQ8Ze5NFhSLSKuLY5NdesP1lNXmzk6pOjO8yCMmw+Vz4paEY34
 a3rpA6BcT5L7nXQZzc0U70C0zJR4f7vJQgneRfBnuFFCEHstyeOH4lU1Mpdy87buaQq6
 wr400EQ3d5V9Y8BIay6t3NnnIdXHO3w33eDcWo/r/6aSSM+Ku3UO1DAdeJEFgzt8aIzT
 9HrNBa4EtaW52ZXlbJzkAHFvXHLXKLVANoY0YYnjButEE7f3l0N+0Nmtz/lu3bdXqQ8E
 2ucA==
X-Gm-Message-State: AOAM532grb7uUCMAk5+DPX2qRjYRAutbJRCZ/D/LvBcYBE7/0rykCC+S
 mYpa9o6mOlMoZNsSXCPNDqxuyjpGJUAoXZgz/g3xkbMrXjxND0wFRB4L3Frjr24VGTr/bNZONDr
 WfjUzIgAL+i0E8wg=
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr19472704wmm.87.1643645912341; 
 Mon, 31 Jan 2022 08:18:32 -0800 (PST)
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr19472680wmm.87.1643645912049; 
 Mon, 31 Jan 2022 08:18:32 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m64sm9468676wmm.31.2022.01.31.08.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 08:18:31 -0800 (PST)
Subject: Re: [PATCH 2/2] tests/qtest: Special case sbsa-ref and
 xlnx-versal-virt if !CONFIG_ARM_GIC_TCG
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220131154531.429533-1-eric.auger@redhat.com>
 <20220131154531.429533-3-eric.auger@redhat.com>
 <20220131155936.lm7jn32ihb2ndsf7@gator>
 <CAFEAcA-K3cAPMiAfHNCOaceRN2csH26W4w9RDOUUVhpKPMNh2Q@mail.gmail.com>
 <20220131161408.py2ncvkkxxhbkpjj@gator>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7be1cd57-c5e7-a069-f6a0-bfbe09358723@redhat.com>
Date: Mon, 31 Jan 2022 17:18:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220131161408.py2ncvkkxxhbkpjj@gator>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/SJmSM4/Iop

Hi Drew,

On 1/31/22 5:14 PM, Andrew Jones wrote:
> On Mon, Jan 31, 2022 at 04:05:06PM +0000, Peter Maydell wrote:
>> On Mon, 31 Jan 2022 at 15:59, Andrew Jones <drjones@redhat.com> wrote:
>>> Hmm, if these machine types completely depend on userspace gicv3
>>> emulation, i.e. no way to use in-kernel gic or another tcg gic
>>> model, then I guess they shouldn't be built at all when ARM_GIC_TCG
>>> isn't configured. I.e.
>>>
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index 2e0049196d6c..d7cc028b049d 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -209,6 +209,7 @@ config REALVIEW
>>>
>>>  config SBSA_REF
>>>      bool
>>> +    depends on ARM_GIC_TCG
>>>      imply PCI_DEVICES
>>>      select AHCI
>>>      select ARM_SMMUV3
>>> @@ -378,6 +379,7 @@ config XLNX_ZYNQMP_ARM
>>>
>>>  config XLNX_VERSAL
>>>      bool
>>> +    depends on ARM_GIC_TCG
>>>      select ARM_GIC
>>>      select PL011
>>>      select CADENCE
>> I kind of agree, but isn't this kind of mixing two things?
> How about two dependencies?
>
>> (1) Both these machines require a GICv3 and a GICv2 won't do,
>> so they should do something that says "if you want this
>> machine type, you need a GICv3 device"
> depends on ARM_GIC_TCG   (IMO, could use a rename to be gicv3 specific)
Yep I think it would be clearer to rename the CONFIG.
>
>> (2) Both these machines don't work with KVM or hvf, so if we're
>> not building TCG then there's no point configuring in these
>> machine models (a property they share with every other arm
>> machine type except "virt", currently)
> depends on TCG

That's what I would be inclined to do as well

Thanks

Eric
>
> Thanks,
> drew
>

