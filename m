Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp189331lfp;
        Wed, 29 Sep 2021 02:19:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz66OBOErT1DqZjxTl4pI6LKoGfGwSfs9nu+/Ku7Gn2pGuUDQd8ajGzTr8DKm9EjKBwXs3+
X-Received: by 2002:a37:a60f:: with SMTP id p15mr4183901qke.114.1632907145423;
        Wed, 29 Sep 2021 02:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632907145; cv=none;
        d=google.com; s=arc-20160816;
        b=wgalSuLm9EsczaOAZbd2B9hzPaoNW53sPUnhmj29z9EZyl0Q+b6DWSPpxQOZVoXDLj
         H+yRVW6OhhwhK8wQj7lo3vTd9LHoj4s1jIs4EgmqCEWg14SMD9IDWXeYnk3s7UHlsi16
         Z1P2v+hlrKbPLCndj+UYHhlcz4hXF0mxQfYQH6mKOaoj7k+qqoAIRkIju/gnVo0bWEKz
         Od/QLmxwwpMJ6VutWlSK8goL4O74ZbBaRwHCb33sSaxQFi12JwZ5RoBD6W3o8Ly7R5yb
         Z7QrlPdP9JvQfs4WPRxqtIH7h+U7OLHpbG0CpcHrrVRaek85eOS4Or2rZ1eP3dUMr4uU
         OhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=S4Vzg/lQG/E/1TPkR1gAKaRWBkCUcowRuyd7xbArqzs=;
        b=GyL4wBFURXMuWzOHyZAujHcRq/anBA+/BHkvnidUMbcUdbhrtUCC6R/JnanMG36Pku
         mA5mFdc3mKqILZdq9tyCYnnt3nt7E44EPXYP+dVLogARozI3VIvI/xs8MSItccO2UjKN
         HywQnbMGFsAuG5BilpAedLjPf4EoxGejqeeaRsXoaxot/bzROCK0j1EcZJ0kECQSe4RK
         7C7v3qzpUKCzvthJktedNiwRGy4przFBFQVZUwD//3gDVdsXOKzTEV/QvYy3TY1Uf6n/
         c5CPA3tqgEB0VRihQvDc/gXfjlPULbhX8oWJ5RGRooAFLRqes4N3McZ507ky0Q7yHCoQ
         mDCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B/6H4p0P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si1517140qko.260.2021.09.29.02.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 02:19:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B/6H4p0P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVVk0-00040X-P1
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 05:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVVjk-0003yv-U1
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 05:18:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVVji-0005PV-08
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 05:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632907124;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4Vzg/lQG/E/1TPkR1gAKaRWBkCUcowRuyd7xbArqzs=;
 b=B/6H4p0PnNZyiF6c6c8H7/Ft+j4nAdzyXr9+VQtu5BxuZCJDa9cOykRjn9I5rZqVelZsnm
 j1HZnCIlSOZJL+tA7Ds9RRGcT45+BME4OvtUUhbR8VN21zvUZweDIRrQBngA4wX9tET21M
 X1mjEcbrEXrRxyoX+v1KR41tQ9XC1QE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-gri4y4rcM0iW92Tl6ENbkg-1; Wed, 29 Sep 2021 05:18:44 -0400
X-MC-Unique: gri4y4rcM0iW92Tl6ENbkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 y23-20020a05600c365700b003015b277f98so606251wmq.2
 for <qemu-arm@nongnu.org>; Wed, 29 Sep 2021 02:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=S4Vzg/lQG/E/1TPkR1gAKaRWBkCUcowRuyd7xbArqzs=;
 b=Q11x9X74vp2gwlgzn2/Cs/oL1pzyynMpPAxL8v5+jkiwG04BLrEdw9g5axpaSktbAT
 nLY3kpqdyCmlC4WWw1/hK6fepvRAglTyI/Yi/kpQ4dML7rSm318pQp1iOG1/3SYQr0q8
 ogP57n14A05sfHnYFrxrC196N6c+JKpYVsrUh5xB6nDBvru3I1pwNeF4eG2c5iqwpybR
 K6uhM+rMZH3/xIvT1iqdgFt1B+BX8RoazeqQAZRk2jv6lizCh7i4FsdyR51VmGyd2fgk
 4AoDcT195Pa5UDrkz3RbUGnHl/wBduK/62w/FO+uNZv+v/XqI+oa6MUWmGpFaJpf4kgb
 RZiA==
X-Gm-Message-State: AOAM530aM+5sQWHY3IX/7fqB5B7WOkXUjNCw+AkHGHxWFawvexKnbQHq
 /biMOYQHtjeT6XpKQZ3Mzm8zWYo3nGvormxl8Ja+tn9lVXRyDjrCm3+YKLARD/0fwLRu9h+CmR0
 eZ0C0FTsX+S6WSyuHwimmxBRxURSJNSjIewl/idVogD2pL1Gn6yWZGQf/aq60duuKZsY=
X-Received: by 2002:a5d:4571:: with SMTP id a17mr5379451wrc.290.1632907122269; 
 Wed, 29 Sep 2021 02:18:42 -0700 (PDT)
X-Received: by 2002:a5d:4571:: with SMTP id a17mr5379418wrc.290.1632907122026; 
 Wed, 29 Sep 2021 02:18:42 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n14sm974344wmc.38.2021.09.29.02.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 02:18:41 -0700 (PDT)
Subject: Re: [PATCH 0/6] virtio-iommu: Add ACPI support
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <808699d8-d2cf-bd66-c53d-8ae8c2fdbb9b@redhat.com> <YSjo7hZ9ptMH9JSx@larix>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0b61d1e3-095e-b830-e160-4f56dd5ff171@redhat.com>
Date: Wed, 29 Sep 2021 11:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YSjo7hZ9ptMH9JSx@larix>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MzqCbzAQB9nD

Hi Jean,

On 8/27/21 3:30 PM, Jean-Philippe Brucker wrote:
> Hi Eric,
>
> On Tue, Aug 17, 2021 at 04:58:01PM +0200, Eric Auger wrote:
>> Hi Jean,
>>
>> On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
>>> Allow instantiating a virtio-iommu device on ACPI systems by adding a
>>> Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.
>> Don't you need your other patch
>> "virtio-iommu: Default to bypass during boot"?
>>
>> Without this latter, for me the guest fails to boot.
> Good point, I think I've been lucky during my testing. My bootloader and
> kernel are on virtio-blk-pci devices and as I wasn't explicitly enabling
> the "iommu_platform" parameter, they would bypass the IOMMU. When enabling
> the parameter, boot hangs since the IOMMU isn't enabled when the
> bootloader needs to fetch the kernel, and DMA faults. That parameter is
> specific to virtio devices. Using another storage for bootloader and
> kernel will result in failure to boot.
>
> I've been postponing the boot-bypass patch since it requires a
> specification change to be done right, but it's next on my list.
The boot-bypass feature seems a critical feature to overcome the current
v3 limitation. Are there big spec changes required? Maybe we shall work
on this in parallel of this series because, to me, it will delay the
integration of virtio-iommu in libvirt for instance.

Thanks

Eric
>
> Thanks,
> Jean
>

