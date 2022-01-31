Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2361945lfk;
        Mon, 31 Jan 2022 08:34:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpsu1dTMwLn18nu25+pxystTYM4AKtVCbgNl7+zPceq1NrTGV034XMBvG3jumMxowtpTGw
X-Received: by 2002:a05:6e02:1cab:: with SMTP id x11mr8484414ill.191.1643646848577;
        Mon, 31 Jan 2022 08:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643646848; cv=none;
        d=google.com; s=arc-20160816;
        b=tiPYZTyeIKWZEJ5fZ7Zi7UsP+0mqMyVVo7OiKNndcKNSnPUd9PK3JOjPhlqMKx0oY9
         9kzo4oTvFdM2hzZScB6czeveZ/WF2s4QJUsg9Uy5ocQxGd20UlkjfU7v2VMS7LjLbsBm
         tWnaii4ilW+8jioFSobnSN09mYWXYMV8RLU/i9L09x3QZzXWol14lnQViHfcyvjhJVic
         f024o6QXLQaXqXB3dgmak8sUfiqvsHj3bIVgqwrjHJx27/SV6eAVHIHl/yj1BBbHORhd
         Vk4g4ACOnmXZviRJ9zWMnpjD+1gEGUQ2SgQja7cwyZFDMMQfMW8HMTG0gE1jTzzvKl1D
         jtig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sbKtwxN9m5m0zYe/LSEkRpKGhWpmgcO7lxI2HAJZxd4=;
        b=czabZbnd5mPWVfFTpYDNVYracgTYUflo1DRkVqtXLY1vD3r8VCuaCOoda8S2Kw722O
         z4/oHG6vHABiPwcwzJoswUyC6xVooDjphjZraC4LFHAjblcKqIbQDiID+CieRcb6FF8l
         q5O8QiHbK7QYb8jWxOBhcAqJvEfYUfo7djDy7hNnMrqQP2xODf28TBIlstQ91wg8yoor
         GkzrQfYG0RBxbl8WDApNoSOTrdToPT47sL0qa/1BFyHvkVI16NJlV9d0N1l04XsZWXFK
         u1o0O0ZEpDXAKKoWO0Dlc9F6zR+OAVSdh0IqF1ie1zAanvnEWy3I5JBv/AwixWuE/YsE
         AA1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bBzrsEVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si362199jaj.110.2022.01.31.08.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 08:34:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bBzrsEVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEZd1-0003XV-VA
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 11:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEZLr-00083B-FL
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 11:16:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEZLp-0007ID-0j
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 11:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643645753;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbKtwxN9m5m0zYe/LSEkRpKGhWpmgcO7lxI2HAJZxd4=;
 b=bBzrsEVU8mol8pB0wwB5tnAaT3Bw/nSXrK7gGowSoxjV35Bm4lib8O6uiqDlXYF2o0+jOu
 ZiIoXXJbtwgjoJ6zPaAFptzrAk/w83ROUb5I0bnFXwGSBBRm20/YsRuwFWTlj2xWrEMgXT
 qPEOz5xgQdiyuNRh6J2qZc/xm85l+jM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-auJ-3VXRNEqDUOKG2f39Ug-1; Mon, 31 Jan 2022 11:15:51 -0500
X-MC-Unique: auJ-3VXRNEqDUOKG2f39Ug-1
Received: by mail-wm1-f71.google.com with SMTP id
 o194-20020a1ca5cb000000b00350b177fb22so9792182wme.3
 for <qemu-arm@nongnu.org>; Mon, 31 Jan 2022 08:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=sbKtwxN9m5m0zYe/LSEkRpKGhWpmgcO7lxI2HAJZxd4=;
 b=IWfpKDiz3ILLQTCQOt4346InDVfAe4Cxyq5St1J4Y0jK9UOT7Bi9VvsxkSh5lqiQGx
 RMRKXzCmKC6IBrc3GSgMUdYsaXGYvyS57XZZWmsTWxDb0We72Cy+pbRkQJzWYHgjSab8
 UEd4GTbapQ7nr/MArn96qcg2+zCT9/GUDA1Rq3VTkEJR3lpUEGFcLiognntUCf5KSDx9
 L32bCsTRmRjzE8gce45Dh5U+BnnHoIVmzMKUM0x+DYDyzHpm5zkyUHP4Ai7KzoWO6jN6
 OgGjCoG/09dP3cG6b4rGrJeGcuyvuL7RrpYgshInGIDXPI/grbDPVqpgWOvXdUMoKI/V
 uLmQ==
X-Gm-Message-State: AOAM532wZSgyiSTbNdtQJtnIhmobNRL7lqpzfPZ5yBjWr3hLm49R0J3p
 va2aye62kkVVgJq7eilQlB7gyorsGV914up5rCNBENDSzP90gj+sP0Bhge/mheYYy9ucZph+859
 luJEJ6IfjCCDC
X-Received: by 2002:a5d:5583:: with SMTP id i3mr18561131wrv.411.1643645750759; 
 Mon, 31 Jan 2022 08:15:50 -0800 (PST)
X-Received: by 2002:a5d:5583:: with SMTP id i3mr18561112wrv.411.1643645750553; 
 Mon, 31 Jan 2022 08:15:50 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o14sm14128897wry.104.2022.01.31.08.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 08:15:50 -0800 (PST)
Subject: Re: [PATCH 2/2] tests/qtest: Special case sbsa-ref and
 xlnx-versal-virt if !CONFIG_ARM_GIC_TCG
To: Andrew Jones <drjones@redhat.com>
References: <20220131154531.429533-1-eric.auger@redhat.com>
 <20220131154531.429533-3-eric.auger@redhat.com>
 <20220131155936.lm7jn32ihb2ndsf7@gator>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ba89bcc9-417b-c373-d11d-365675e90414@redhat.com>
Date: Mon, 31 Jan 2022 17:15:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220131155936.lm7jn32ihb2ndsf7@gator>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6R4trLx81WOK

Hi Drew,

On 1/31/22 4:59 PM, Andrew Jones wrote:
> On Mon, Jan 31, 2022 at 04:45:31PM +0100, Eric Auger wrote:
>> qom-test and test-hmp shall not run tests on sbsa-ref and
>> xlnx-versal-virt if CONFIG_ARM_GIC_TCG is unset as those machines
>> always instantiate GICv3.
>>
>> Otherwise the tests fail with
>> ERROR:../qom/object.c:715:object_new_with_type: assertion failed: (type != NULL)
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
>> ---
>>  tests/qtest/libqtest.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>> index 41f4da4e54..f53983a28e 100644
>> --- a/tests/qtest/libqtest.c
>> +++ b/tests/qtest/libqtest.c
>> @@ -1394,6 +1394,12 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
>>              g_str_equal("xenpv", machines[i].name)) {
>>              continue;
>>          }
>> +#ifndef CONFIG_ARM_GIC_TCG
>> +        if (!strncmp("sbsa-ref", machines[i].name, 8) ||
>> +            !strncmp("xlnx-versal-virt", machines[i].name, 16)) {
>> +            continue;
>> +        }
>> +#endif
> Hmm, if these machine types completely depend on userspace gicv3
> emulation, i.e. no way to use in-kernel gic or another tcg gic
> model, then I guess they shouldn't be built at all when ARM_GIC_TCG
> isn't configured. I.e.

Yes your suggestion make sense to me, thatw would be a better fix indeed.

Eric
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2e0049196d6c..d7cc028b049d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -209,6 +209,7 @@ config REALVIEW
>  
>  config SBSA_REF
>      bool
> +    depends on ARM_GIC_TCG
>      imply PCI_DEVICES
>      select AHCI
>      select ARM_SMMUV3
> @@ -378,6 +379,7 @@ config XLNX_ZYNQMP_ARM
>  
>  config XLNX_VERSAL
>      bool
> +    depends on ARM_GIC_TCG
>      select ARM_GIC
>      select PL011
>      select CADENCE
>
>
> Thanks,
> drew
>
>>          if (!skip_old_versioned ||
>>              !qtest_is_old_versioned_machine(machines[i].name)) {
>>              cb(machines[i].name);
>> -- 
>> 2.26.3
>>

