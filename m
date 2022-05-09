Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp3683191lfj;
        Mon, 9 May 2022 07:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCVhwIRvKD47LD2Xid00RPFU/N9E8RZJChn3sGexUbPridenHrQwGfh5v2dfvuY3byFkso
X-Received: by 2002:a05:622a:353:b0:2f3:d23f:f703 with SMTP id r19-20020a05622a035300b002f3d23ff703mr9160386qtw.623.1652106844089;
        Mon, 09 May 2022 07:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652106844; cv=none;
        d=google.com; s=arc-20160816;
        b=cHvxfn00/D/3p0VoOWuxK3UND2/n0E0TwGz/KoRTnOha3996L1qKnVp+AEzJTBc5H4
         lCC5WHoEd2n1pW1+JFYWW6zEFWhI7Vj4ox+kWzxTyFEyeRjgaJ0CLjX5uu0vS7R5ek+g
         tfiHpTHlxLynQhErrLmPwv3tLo0zf9+3AVLaeyc3IsWsdsxHyshAQpvgaHaGLen4aAXt
         vHMcC6YC6IjNJi4GMpQgMxaVgELn9Heu8QElrXyshafkunZ8SZmgROlcuNSeYqOL+K3h
         abwKxvHv0mT4mPKOBRbFA08Sfu3OJCA/ir5YJ34uFzJrtY65pQNIYHezQNtebNpnVfxe
         krng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=jAIIaw3Pd3n4E6KzpCgv97nWsVvS6ET2UpJK/GZ64a8=;
        b=hrPuTFT0ydkBORYYbpf3G/mDKZl4uyAfjlvuCqrfSAHYFoCfI851bnpJfYBBAgyS1E
         RIYqDapK86uYeK35PhUQ+mRVnxFwHlb9P4tctsa1qqOFQc0Ty52idQlGuYViM4U7kFzK
         8BvIFyhrSerYH4dmKM+Cur+t+Z7zksjnnzWrUJN0q9wOnr4Yid7zvw+kQkWkKQr56PQX
         N8H3bqYFHH7pCs5FPPiSGT1G9IYNlxRZDfUz+NkJitF2bm2HNA2bzH/CSecaDL6hCIAJ
         tEEMK4KPLJJ/dFENjvjoJf2jxIXTBm7HZgzRSF0AwnW+fcfyWxVRJ5S+0mo+pSvzOMjb
         qriw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=St0CrPxk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t10-20020a37ea0a000000b0069ed8329236si7453529qkj.117.2022.05.09.07.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 May 2022 07:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=St0CrPxk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652106843;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAIIaw3Pd3n4E6KzpCgv97nWsVvS6ET2UpJK/GZ64a8=;
	b=St0CrPxkk0fxeNXc1spthV+ONmsaCyJ8xodO/Wdx1Gq4ttfCAwlxFr6FtDApKyBYhwvA51
	Np6iZIsKkzr8TEGEF2Qm+0Mz5ItnZRigwanuVmWkYsH1SUPvnYKHuwNyLh5sw6IIpIWtfH
	6QER6n/uvf2GDmtdqfARx/IiAfOdhBc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-sTeboWAmP0eAugGjAwEznw-1; Mon, 09 May 2022 10:34:02 -0400
X-MC-Unique: sTeboWAmP0eAugGjAwEznw-1
Received: by mail-qk1-f199.google.com with SMTP id v14-20020a05620a0f0e00b00699f4ea852cso8740773qkl.9
        for <alex.bennee@linaro.org>; Mon, 09 May 2022 07:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jAIIaw3Pd3n4E6KzpCgv97nWsVvS6ET2UpJK/GZ64a8=;
        b=uU2+N9ODYPyig8BOTNj8t7VoNSYlEIy2UvqMS1dvXgAOd+czGhalLSwuZH0shvZFKY
         sbK+ZNmZ38XU3vmgejv0dXX5lPxDLqb3UvSVoWdfv8lNKtghIA9tRol9XT36TFJZn1OY
         FauEsaXvTC093gmyHTceON5ElC7IAhV9ht0SRJ0VNvKH72E6kAo15Q3gER7o4Sx8/sa/
         yTzB5AaOQbqLIbZp0ADmPahvjuB7POzTW6EETC5qo0k69m7whYtgm3y0oF2LOviDiSyp
         Y6BGzAtkKX1vv718rYta6KevyWLZXhBuE/Km3l74ErRHkjl7Juueiqr8MhVJKzaDQoN4
         2QNQ==
X-Gm-Message-State: AOAM532fi2qHDq2IWAGSL3V/hM6TG7wHOybjXXhxsKwMFi310O5AE/hm
	YdDTujMeeGpHLzlx4vp9NUwfkuAV2q6/Rafr6FuOtuBhJEaTct8NTGvkASvRboxGB0Wpegmqun/
	cYbgSpfAVbr8Mt52S3QZx1c/wScqCnS4AjBmrzhixz5agzUidvf7u0Bj3ItrnTdfrs77Q9TU=
X-Received: by 2002:ac8:5e4c:0:b0:2f3:c50e:53a6 with SMTP id i12-20020ac85e4c000000b002f3c50e53a6mr14868175qtx.499.1652106841682;
        Mon, 09 May 2022 07:34:01 -0700 (PDT)
X-Received: by 2002:ac8:5e4c:0:b0:2f3:c50e:53a6 with SMTP id i12-20020ac85e4c000000b002f3c50e53a6mr14868142qtx.499.1652106841386;
        Mon, 09 May 2022 07:34:01 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id z11-20020ac8454b000000b002f39b99f6aasm7664032qtn.68.2022.05.09.07.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 07:34:00 -0700 (PDT)
Message-ID: <763c598d-b01a-32eb-2bd5-0d2537f0e6e6@redhat.com>
Date: Mon, 9 May 2022 16:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v6 3/3] tests/qtest/libqos: Add generic pci host bridge in
 arm-virt machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com, stefanha@redhat.com,
 jean-philippe@linaro.org
References: <20220504152025.1785704-1-eric.auger@redhat.com>
 <20220504152025.1785704-4-eric.auger@redhat.com> <87bkw6u7np.fsf@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87bkw6u7np.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qLxRry7JRZ/U

Hi Alex,

On 5/9/22 15:59, Alex Bennée wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> Up to now the virt-machine node contains a virtio-mmio node.
>> However no driver produces any PCI interface node. Hence, PCI
>> tests cannot be run with aarch64 binary.
>>
>> Add a GPEX driver node that produces a pci interface node. This latter
>> then can be consumed by all the pci tests. One of the first motivation
>> was to be able to run the virtio-iommu-pci tests.
>>
>> We still face an issue with pci hotplug tests as hotplug cannot happen
>> on the pcie root bus and require a generic root port. This will be
>> addressed later on.
>>
>> We force cpu=max along with aarch64/virt machine as some PCI tests
>> require high MMIO regions to be available.
> Where would I be able to force disable-legacy=off for the PCI device
in libqos/vhost-user-gpio-pci.c qos_node_consumes("vhost-user-blk-pci",
"pci-bus", &opts);
I think you can use opts to force disable-legacy to off.

see vhost-user-blk.c.
> from? Building on this for GPIO I run into the following:
>
>   subprocess_run_one_test: /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess
>   vhost_user_test_setup: -M virt, -cpu max -device vhost-user-gpio-pci,id=gpio0,addr=04.0,chardev=chr-vhost-user-test
>   vu_gpio_get_protocol_features: 0x202
>   qemu-system-aarch64: -device vhost-user-gpio-pci,id=gpio0,addr=04.0,chardev=chr-vhost-user-test: Device doesn't support modern mode, and legacy mode is disabled
>   Set disable-legacy to off
>   Broken pipe
>
> and I think this needs to be applied to the root bus device?
you mean the disable-legacy? I guess it should be applied to your device?

Eric
>
> Anyway otherwise it looks OK to me:
>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>
