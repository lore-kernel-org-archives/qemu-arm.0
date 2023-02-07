Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5649155ejb;
        Tue, 7 Feb 2023 10:26:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/RJMT3IW16+am8pqlSpYfLMBz3ULVdy9E6QQRIIlbCfdNonErmKezUfWQ0bIkOtVTa1ruH
X-Received: by 2002:a05:6214:1250:b0:568:df06:5216 with SMTP id r16-20020a056214125000b00568df065216mr6983731qvv.24.1675794388982;
        Tue, 07 Feb 2023 10:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675794388; cv=none;
        d=google.com; s=arc-20160816;
        b=RqloEXDd6Ef9I2ZDawhNHFTxHv+5/wd8OFq1U4kcy4UrmG3Re8q07sZJKOJqPDcFDd
         bfmk34VUA62GgTOzR1HMZlafnqU6Zbj0MiS6y9rGHaVXuno1K5J6Q2LP+p9BVrNgESHk
         eQOKChJvY92NQlECnvq2g055AAH+HnkyLiPiglk8cBEgLON2RWeVWAucELHW/Bz32AM/
         YKaL+dZcWnZDBriQ82fo9MVmkWKhi9hm+/4XB0SZXfDtrU9Kh5kvT3Xj3ep9twwncVDT
         V7+EspkY0PdH8phZJqgAng9b+wsNkEqqNNIbqaIlYX8fExbLwbQC7aDBvhP59aq/auq7
         if7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=63BdvnsubKO91fl3EcM1zEK38XI9sfdR9VcA/LGDkNc=;
        b=Tq70x/njC6mNQ17otTJvXRRdSJI9+YIOy7unPJZF08w12rsyPW6G66axDha5SCjDP5
         VUn2Fz08a3YGWGGzvvhbhqCx4Bx+6d3g6HbClJ/0RhZ3qIlS0cvbHsD+I83spkEKzJvM
         lz5XL6cur6mwpLH0+1j8QAyCKwVtuuWyyHvHC5qm36zvQXZ+LEk99Cfg+Uoly+z2Y6y9
         BWZifbW3cRq87OPgHgxsVDeLcG05kgPkHhAUBbupEviuD5azgPmMS2QqOOCeTo1xhsT/
         dp7osrUop2F4yghgLCu/yaExO5f50y5gKkX07O/dwkklj6NJ2OIRhXldmEjy+qi/FNrA
         bxwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gbf98fWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05620a44ce00b0071ed688536esi13875920qkp.341.2023.02.07.10.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 10:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gbf98fWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPSfY-0002cp-J3; Tue, 07 Feb 2023 13:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSfU-0002Zh-56
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 13:26:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSfS-00059A-58
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 13:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675794368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63BdvnsubKO91fl3EcM1zEK38XI9sfdR9VcA/LGDkNc=;
 b=gbf98fWuOCcB1LQSDRIJkuOYm+ZgpxzlKBsbaAbuO929VM+2VpUwqZ0+x5Q+TkXTmofwfC
 gOMoyi7WnCxzuk5xktjWxhkgTn1cG9ZUa9M9CylRt9wMmoWTcZLU9Z525UvX2904N9CQ5t
 YVT3QqKZsioNKcHe3FdEbKbmKoufY34=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-0DKh8DSxNmqLgwsd06mbow-1; Tue, 07 Feb 2023 13:26:07 -0500
X-MC-Unique: 0DKh8DSxNmqLgwsd06mbow-1
Received: by mail-qk1-f200.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so10374499qkl.10
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 10:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=63BdvnsubKO91fl3EcM1zEK38XI9sfdR9VcA/LGDkNc=;
 b=gQsv9ZUFrrmAG19fTD6tPKfOtsuFY4YT+yHnlZ6QFS/Q+z/T8hIt4iIExURlVsd7sT
 xpmseNI6vQxN57LLh1f35mGUqPQs01orwcoU6eC+60UxZ6OD6d7NvHnVAjF7cMRY+8J/
 e6gXBCmyT0koo/GY7WRepPeoibMsZZN4esixUVY7eDkMvy/SjPXnGMFAco3fHQ130NEp
 GtR5AX/IlzoEliV0u/ytFfy1HiA5xX+JtX8uRVb+on66iBeaQGm0Qs3eE46BEyJ4sWlw
 mPjYm25iLz7VNDGUiQMEYTIrKWWKE4B1n+M5zCS5W+R1nBhmXTyy++kYnYlv4UD5NVLz
 je4Q==
X-Gm-Message-State: AO0yUKUKD4LqHuLhDMULwF4D7LYFfBXu2MCJ2ws2GusUrrS+sBG2fmYV
 0WZkjaqtnJ2WEjzspgW+w6JZTejjeOgz5vSH/kB2hzCfiFj3jIBPpLaNttvTnjywwXthFzWkzjz
 wRP5l63sqeLLn
X-Received: by 2002:a05:6214:1250:b0:568:df06:5216 with SMTP id
 r16-20020a056214125000b00568df065216mr6981501qvv.24.1675794366711; 
 Tue, 07 Feb 2023 10:26:06 -0800 (PST)
X-Received: by 2002:a05:6214:1250:b0:568:df06:5216 with SMTP id
 r16-20020a056214125000b00568df065216mr6981474qvv.24.1675794366450; 
 Tue, 07 Feb 2023 10:26:06 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 u63-20020ae9d842000000b006fa22f0494bsm9877864qkf.117.2023.02.07.10.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:26:05 -0800 (PST)
Message-ID: <461ba038-31bf-49c4-758b-94ece36f136f@redhat.com>
Date: Tue, 7 Feb 2023 19:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-7-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 06/10] hw/arm: Select VIRTIO_BLK for virt machine
In-Reply-To: <20230206140809.26028-7-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JtnA28R4KLnb

On 06/02/2023 15.08, Fabiano Rosas wrote:
> The virt machine has IF_VIRTIO as block_default_type, which causes the
> generic code to try to create a virtio-blk-pci device pair at
> configure_blockdev()/qemu_create_cli_devices().
> 
> Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
> when PCI_DEVICES=n (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
> qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
> 'virtio-blk-pci') is not a valid device model name
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8dcc08b7ec..296d4f5176 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -33,6 +33,7 @@ config ARM_VIRT
>       select ACPI_HMAT
>       select VIRTIO_PCI
>       select VIRTIO_NET
> +    select VIRTIO_BLK

I'm a little bit torn here ... while it makes sense for me to add VIRTIO_NET 
so that you can run "qemu-system-aarch64 -M virt" without any additional 
arguments, this is now about fixing additional (convenience) CLI options 
that are optional ...

I assume we need those for some qtests? What about checking for virtio-blk 
in those tests instead?

  Thomas

