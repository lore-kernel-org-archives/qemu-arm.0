Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1998274njc;
        Mon, 24 Mar 2025 07:46:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhH/p5z1EU5juq9r1gMniFKZfRXCRYqh7xBUZM47coeOUbX74/KGhBt4dmDkjPtitzocPQsLgnXoWc5g==@linaro.org
X-Google-Smtp-Source: AGHT+IGpQJqYQ1yNbeWCSRh+i4UnsnqC+oR405X1EMkPoYZPkN7AHJADRSA1Bc72o6DBEBPeThm3
X-Received: by 2002:a05:620a:1a0a:b0:7c5:5794:3e66 with SMTP id af79cd13be357-7c5ba18fa04mr1909221085a.31.1742827615092;
        Mon, 24 Mar 2025 07:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742827615; cv=none;
        d=google.com; s=arc-20240605;
        b=CCZmkFuHm7JD1NoELe+7/j/ACkh0Ko6WmEjWEaEUbOmnksdAu5XxRQ6rr46xrPKlzu
         JIVDv7iRM/rRnprccJ4yUhxxjRx203oyqdz1l3K5T1hue+4qGugYcSQaZ+hQRJIwMQNz
         izjt8RnoLOq0Gu/+Q0hcR4PIxWYuvmLz9Wn31ToxY8TMNkSzFsSIk3nUqo1ANQRJc3Z5
         1fp0Z55/e+K7+bITQoGPoIQgWJ4XzZv25REnp6RxVbBSwShmsacTsVoJFvkqs2ZYLDYs
         C1kJQMOe8bbp5/+GZesfoTXihJqYTi15eP0CW8fxD2OvuoJnGXrurkr89JMcF3HvD78v
         DmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y/6dJM7WjLY3R3rYiRGivphCR3M2STG0pH0mvJdxxt4=;
        fh=Wqf8ZSyQE4y4etbheSJpTnVMLzxt0RJQGzBlZJjXmBA=;
        b=TJegT0FdZiPdYDjnsysH1FJTNVuzZ4Z0FdfqCFMNv4xOlV8TImybUUHNUPiqjSovhg
         J1Ty8uVwJ6fw1YAMKKL6M2/cPL/k16pgefnsg2Aaut3wRsfwgXII4By42Z0lQjomiolg
         GyBMjkRclMTlvgk0IAi0Pv6XvHeGVyGple1TZZwv/3U46C4h7Jy3PNIIF0xJTwee0AjN
         xproRntHp8VFBX9xTit+ZQQRoFwnfKRjFxVPe/X8fy7R+cWVKh5c8nGvj6Yfh3PX5y9P
         nSl69utwXTayBZHgXlqJOQ2bTnmR/dWiL1LDLsi/feJ8z7EI0kI/2uIN4ccHxltycjY1
         ev5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dbaCjjpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b93580f5si746008385a.444.2025.03.24.07.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 07:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dbaCjjpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twj4S-0007kR-JC; Mon, 24 Mar 2025 10:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twj4R-0007jv-DG
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 10:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twj4P-0003Er-GG
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 10:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742827588;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/6dJM7WjLY3R3rYiRGivphCR3M2STG0pH0mvJdxxt4=;
 b=dbaCjjpqpfKZpMPYlp0F0pJCi2zFvAzX/P5ryi/KsBYq3f/RoO00DUKuyvFfui5QTnJP7O
 v37xUJL7xcNDqzYExeDz/pacrmZPVL6x1vsvPm842J3UH7iNQxcu6U/25yKsSs7QSoQwpb
 v6QFj/4/SjQrKbwN1E13FKoYiM1fndo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-9Ahoq0euNmKiV1T8F4WuuA-1; Mon, 24 Mar 2025 10:46:27 -0400
X-MC-Unique: 9Ahoq0euNmKiV1T8F4WuuA-1
X-Mimecast-MFC-AGG-ID: 9Ahoq0euNmKiV1T8F4WuuA_1742827586
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43bd0586b86so26458915e9.3
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 07:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742827586; x=1743432386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y/6dJM7WjLY3R3rYiRGivphCR3M2STG0pH0mvJdxxt4=;
 b=ZYRAEHDsvSST2bwTyz90GGr976x77lQgvkrb6du2dPyglI7si8tEWPgPou068xac/N
 PzNdBLjjf8hXFhfFm4AXk6HHEhgn37XEIWzW2B8lbercStwzyZXBx99bu8YrTG2YrZA2
 rkJd7YqxSNUYnwsqS0oQwJ7fh8lLGfV28b2zD/fD9QzKnRra0AqikIvMO/AuxATMTBjn
 5r/8TfMODRUAQ4vAA+Rh5s7REUcahg6YmeD9MoAi/sL6pkNNoXOum1NvK8BcZ+5lPhnb
 +yW6ETlXDFGEcmfwRXTcnLJbTZMcyw1XuWS2oLlkjJNmIJMfMy2kt6nmGe2EhstenK1F
 ZQxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB7gNBt/ZEE61K5csY+SFTj4fw9GQFb6EI76hTlYQgxULeC7HnaOR1HCAwQHsnZAVc5RyQvfzEBw==@nongnu.org
X-Gm-Message-State: AOJu0Yyc5sxMrYi2s2iE0mZsmimxl2FHMh1SnxyqhjLfDPfVvqfWyIW9
 z7d2Y2cIkCB5xruxxQGhId//LNZtssmOj3U7IIdymHGr5ds/tEL5lQT2KuLMh4aPtv315X2r6+I
 82uqTo3gnv3lb9Epj9WpHr6Vzvc+ltD8msO0ov6qeNBMiybgKHg==
X-Gm-Gg: ASbGncups64bQ2zympGn6SDRL2TBViNY0BDkYv3J4sbXws6czCKlTQnCrBaHBbvJnxD
 gmDM+FjKD/msy3tI7GWUrrC/3k2HATnf1MZpIo0QVlMMieTpbHRywmHCm6CPtK6Lh37WDWdL/Dd
 UXv9xF7/2Sp9Uscy3QdZAmJTHns+lF+vRC9D7DRmkRsk4DHNq89r45mLIShY/svqa1oAhukuwfN
 so8BSWDj/wkxFrd1bkhMZTjI62ieVxUML2ZujCzov9JhnMzBbgEEG9D/px2PG0AYHMvhqN/+2iw
 OdSOSr0eiiHgI7p/emZ0C4cH9a72w8sMT49UEBS1nZykZA/vl+TsraTfB9IPgGQ=
X-Received: by 2002:a05:6000:1543:b0:391:3cf6:95fd with SMTP id
 ffacd0b85a97d-3997f9144c4mr11349599f8f.30.1742827585756; 
 Mon, 24 Mar 2025 07:46:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1543:b0:391:3cf6:95fd with SMTP id
 ffacd0b85a97d-3997f9144c4mr11349576f8f.30.1742827585262; 
 Mon, 24 Mar 2025 07:46:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ab907da9asm8567283f8f.90.2025.03.24.07.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 07:46:24 -0700 (PDT)
Message-ID: <b0465153-3781-44e7-a012-a5994dcbbdae@redhat.com>
Date: Mon, 24 Mar 2025 15:46:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia>
 <11895c78-d6ab-40c8-a500-4abed1565234@redhat.com>
 <Z9r7dT/5E+YToqc9@Asurada-Nvidia>
 <c70fdb0c-ef56-4a52-8591-31df51ff0eec@redhat.com>
 <Z9sORySxEEL0VXMq@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z9sORySxEEL0VXMq@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mx3Dg_4y0X4m9nxZHy5K1OlwPRTmhq9097Ksd_o-QWE_1742827586
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: Xsm3Yzs8kAq7



On 3/19/25 7:34 PM, Nicolin Chen wrote:
> On Wed, Mar 19, 2025 at 07:09:33PM +0100, Eric Auger wrote:
>>> Option means something like this:
>>> 	-device smmuv3,accel=on
>>> instead of
>>> 	-device "smmuv3-accel"
>>> ?
>>>
>>> Yea, I think that's good.
>> Yeah actually that's a big debate for not much. From an implementation
>> pov that shall not change much. The only doubt I have is if we need to
>> conditionnaly expose the MSI RESV regions it is easier to do if we
>> detect we have a smmuv3-accel. what the option allows is the auto mode.
> Mind elaborating your doubt about the MSI RESV region?
>
> Do you mean how VMS code should tag "accel=on" option and generate
> RMR nodes in the IORT table?
yes that was my point. Earlier we detected whether a "nested-smmu" was
part of the object hierarchy. Now we do the same with smmu type and
check if accel=on. I guess we can retrieve the property value but this
is worth to test.
>
>>> We certainly can't do case (a): not all TLBI commands gives an "SID"
>>> field (so would have to broadcast, i.e. underlying SMMU HW would run
>>> commands that were supposed for emulated devices only); in case of
>>> vCMDQ, commands for emulated devices would be issued to real HW and
>> I am still confused about that. For instance if the guest sends an
>> NH_ASID, NH_VA invalidation and it happens both the emulated device and
>> VFIO-device share the same cd.asid (same guest iommu domain, which
>> practically should not happen) why shouldn't we propagate the
>> invalidation to the host. Does the problem come from the usage of vCMDQ
>> or would you foresee the same problem with a generic physical SMMU?
> Host (HW) would end up with executing commands that were issued for
> emulated devices, which impacts performance.
>
> With vCMDQ, QEMU cannot trap command queue because all invalidation
> commands will be issued to HW directly from the guest kernel driver.
> This includes TLBI and ATC_INV commands. It's probably okay to run
> TLBI commands with vCMDQ (again perf impact), while ATC_INV commands
> would result in "unkonwn SID" errors or directly ATC_INV timeouts.
OK understood. Thanks and sorry for the misunderstanding

Eric
>
> Thanks
> Nicolin
>

