Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1256212lfp;
        Thu, 7 Oct 2021 03:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz43Pyp6ZtFIsUy7Q3h+yy+89wo9z/ij53+Le2do1H0y7YRTb01q5DPP63TBSYTynM2KIeQ
X-Received: by 2002:a25:9a81:: with SMTP id s1mr3998710ybo.230.1633604259943;
        Thu, 07 Oct 2021 03:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633604259; cv=none;
        d=google.com; s=arc-20160816;
        b=yGqaM6Y8zKCROd8zSlpQ93Nn8W6IeYr3CxmDQFmARGvRV4x1iD2TOjQGltc+dD+q2A
         QpNpmoP5pYIIo89fVMqBn0bRrCf6ii/emN6IPvMyUuG+guyiZokl5AyN9c25WCpleJV1
         EE2JzK0n8LvNA0PU6Rqu7uJ8QcNqcC7wiMuKYEMmT0P4npAZnkbqeOMM7023KlR/NZ41
         5/0zag6pH2SW4Hew0yVH0b4S/xuf2cKSRzhaChKjAWrjXsAyuXrZvXAxoBYOkpDNEc/A
         O6Aq8wuF6PahQa9YasUtA1L7cqOwUF3qAjPeS8g9GX0zni+jKWloPwopYKOBoOrjuX9W
         /rLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=cGwhCZyxDesgr/j48GlHIIzggGA7HC0wIddp39vv9vI=;
        b=uFLa8kneZA0F8V7cTSi6W1caTnmHtta9rfXR2TVXx3jTAbWi2xatBeBGNBwP96jgyb
         QxerBLJy3qTxyCPNEQfb+giuhuIoIL/RH4CtjtAC7BQ/BLbutMeBJvtgbLn3NH/nh/4b
         D6kw0TXalco9OHMOhJSpTBko39MMWfj9TbZQ/+7VjVUfTe3rHVD7uswlzalwcsNp+ORM
         bp54U73634OR8sv7pIfGRFo8ZX2hWzXAsxH18IMviS1IdfNg+FwvSpDZ7CUsWt7wu1Zf
         A6SDHuks5DduzykvokfJhSSq5h0jgRLs7WKwLpnmM8gYBRaXrf/Efpu6Y4FLxf+NIvdj
         aSLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ed8dL/B/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i127si21083629ybb.371.2021.10.07.03.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 03:57:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ed8dL/B/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYR5n-0006aQ-97
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 06:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYR5I-0006P0-2E
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 06:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYR59-0007a9-Qd
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 06:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633604219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGwhCZyxDesgr/j48GlHIIzggGA7HC0wIddp39vv9vI=;
 b=Ed8dL/B/UA+KiTjffopmTr2cLjiRr4wOXwayf+V2gwapcezLy2jOWB2+DrcaFkEsXW9Ew2
 tfNE2JiBAotpWcvPiJLObAdoBEFzLv21Qx7W+2hfLJyV18E9dac39ZUczyskoIfno3hUHL
 53DaAfMqV6IT/lxFcZySR9Ace+FXFOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-xEhzAOGFOgKoJC6mUZxn-A-1; Thu, 07 Oct 2021 06:56:49 -0400
X-MC-Unique: xEhzAOGFOgKoJC6mUZxn-A-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso4360845wra.13
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cGwhCZyxDesgr/j48GlHIIzggGA7HC0wIddp39vv9vI=;
 b=nEjEKGhrfhJvYoK51xOOa5cWkBOe6dqbj0gFm32+ob2Gp0fNzMHsL75Nk8pIIKVgBY
 gSZD8AplR6ekBxIy2n+ehgn5hQYXtgJvHQ9X/l9AAMETraKjsfgOvS6HZhio9mQhRkq0
 dQdiviCgBz2RVV3Ux4RFd7Hpxv3g70NqVn6AgY8XBbuUlogOb42MyMXzkTYEnOxuxF3J
 rgi3GAezShCctcebaXpBBfgJrsTrLZ75ZfK5o0veLGHBs+YAQYAUFgm9r1XttZwpxULM
 94DR8HBu5aFrK004hrm12URS7NfOHv7uDjb3XgBjH4BnKvajFRygB40f1MP/o7S1KR1K
 gyzA==
X-Gm-Message-State: AOAM531DEMeFOustva/nSknt5t4uPegaNJlb1LDkv5+x6M2BAH5R1kgt
 YYCJzf0SHA5AvcCgBdasBNI0cNwIHnyB4Gu7TqMHRJ6npODfx03JujEyImrtlCc/+Fs32FCKR16
 5wlmwL9RKshxC
X-Received: by 2002:adf:97cd:: with SMTP id t13mr4512224wrb.312.1633604208087; 
 Thu, 07 Oct 2021 03:56:48 -0700 (PDT)
X-Received: by 2002:adf:97cd:: with SMTP id t13mr4512207wrb.312.1633604207938; 
 Thu, 07 Oct 2021 03:56:47 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z133sm9092929wmc.45.2021.10.07.03.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:56:47 -0700 (PDT)
Message-ID: <d3d54856-060b-03de-a1ff-8beb1df568b2@redhat.com>
Date: Thu, 7 Oct 2021 12:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] tests: qtest: Add virtio-iommu test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211007093438.657198-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211007093438.657198-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8GOHDAUAidV1

On 10/7/21 11:34, Eric Auger wrote:
> Add the framework to test the virtio-iommu-pci device
> and tests exercising the attach/detach, map/unmap API.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---

> +static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtioIOMMU *v_iommu = obj;
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    uint64_t input_range_start = qvirtio_config_readq(dev, 8);
> +    uint64_t input_range_end = qvirtio_config_readq(dev, 16);
> +    uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
> +    uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
> +
> +    g_assert_cmpint(input_range_start, ==, 0);
> +    g_assert_cmphex(input_range_end, ==, 0xFFFFFFFFFFFFFFFF);

Maybe explicit ull suffix for for 32-bit hosts?

> +    g_assert_cmpint(domain_range_start, ==, 0);
> +    g_assert_cmpint(domain_range_end, ==, 32);
> +}

