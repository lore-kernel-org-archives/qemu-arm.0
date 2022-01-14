Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp582700lfj;
        Fri, 14 Jan 2022 00:57:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZG4fSvixQaXRUF24PCQaOExGNwkWXw2fi+A4Hz9W8wbPqeL5Lq+GoGxKU0dL3o7YwXroi
X-Received: by 2002:a25:3ac1:: with SMTP id h184mr11021216yba.734.1642150661810;
        Fri, 14 Jan 2022 00:57:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642150661; cv=none;
        d=google.com; s=arc-20160816;
        b=RFYfL/WxSlOq9Z5AjYjn4NWpi6C4EDhvSodKZVtELTiU6X4FfzIHa1yLPMZeTbr+wA
         TST2VRbhE2bV7maG6kOeQN//d2ZvfhNr+CgycMTeEtXW4X0izt9Eit3cV3IbahT35oqw
         GV6cmfoNByETZDjyjVth4MOd5elkB23ebFuura6YVR/Fy34xWxzOs5IwE11/3NQDCPY4
         2axMgXtd5PeDXwidWrD8XTt3VZdnduFzyhfZS11SjT+eNTOgrSUc0DiMul8E/zSdYauH
         EFX6TYmMrXjcVFoiRfJSOoXSFnZPz5+eYI6Wmcsbn/Zfax/ghEVH+Ll6CP+8laJfEkgY
         KFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xc1r2+mAmNKMz834tct/RAdtqugVn0my1bFIICtY1sA=;
        b=au8TZDHAzBaqGvboMUYzZ3PGPCJ12P0sC27m75f2RshS47onw9YfH/xpZb7GOiJCCG
         MK+1bDL6T/Fmw4VaJdZFy5/f651OTArULPRZivRIVfA1uQ+OzPPtTwuK4rbVgEIsgjcv
         faLikkyfsa2I5td2KXJfavDP3bFCyOfnFah9J2kEqKHLMLeiMhXKFuLDGFknyPowWR6c
         nHT0kR5TacU58D0NNJ2exrqaLdczYYCFOyd5oZ7AfuTmJdkILrhc3MxIOvk8D+gGj7Hd
         CoizLRHWHU+IK0oiCfnaZLVv+b0NPrzDQjC8aFMWboKs+HVGjzWgoA3tDTNd4DkWhrUN
         Mqfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AJunxsEB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si5294908ybu.408.2022.01.14.00.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jan 2022 00:57:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AJunxsEB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8IOz-00052H-8e
	for alex.bennee@linaro.org; Fri, 14 Jan 2022 03:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IOT-0004zJ-PH
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 03:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IOS-0000cq-1s
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 03:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642150626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xc1r2+mAmNKMz834tct/RAdtqugVn0my1bFIICtY1sA=;
 b=AJunxsEBaTHaGPUV9Y5n6LqdY7BKiTkea/vUzvQ0ZGjMJzjJulQlXoRq8cKlgTXkD5ZavH
 P7k/FqJumVKemH73GzkG9jrE3WPbTMKrTTahrBs1hwtgTEwtAlwI05AVRiWSywrCIj+PnT
 6cU3/B7X3xx5X7uTyfLhud8AkodhSl4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-veuyA3yCM8uZne2Wgq84yw-1; Fri, 14 Jan 2022 03:57:05 -0500
X-MC-Unique: veuyA3yCM8uZne2Wgq84yw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so7628381wme.1
 for <qemu-arm@nongnu.org>; Fri, 14 Jan 2022 00:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xc1r2+mAmNKMz834tct/RAdtqugVn0my1bFIICtY1sA=;
 b=rJVByFxkToEPzwYOoFS36791O6dpeic/4IYzCD3he3+hmfu6oob/OYuGvO8C1ITCjC
 iYpBsURWllEUnZdd9oujpL7kEXtqMeUBtJz0bK+2w/SGVFk17XllLFKSKjYTrjUVWBgk
 oF7f3xUJm8JPxvzUKmzoWVMcxl5ByXBltLXUtaK62EG8usSNjEY9Z0UE+qwnN7eN9aw0
 1zZJDbogpiylMeqvbUzrc5+jQx7Wi+l75lKjFkMKE8zPNx8l3zFeZLwK7JFwjE/7C0be
 JShUyrwd+2DzffQvI2AQeJxn4OcY123EuTcueGoX1sz6DkFyI/8QLNxYIgXGfsvoE8Mp
 pj0w==
X-Gm-Message-State: AOAM531ciJv0+wkSHZGPBlwvKVcmWuJS74DWRoRhr8s07hY0PiCFbhES
 tKr+qy6Jn/FFjdRzOLCFbTzYTT6q8oOvS2oppK3WMzPXukiMSwpDM2hN6fyu3Ej83/bl+uHOML7
 A+IetT6BJyqow
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr1819128wms.96.1642150624443; 
 Fri, 14 Jan 2022 00:57:04 -0800 (PST)
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr1819112wms.96.1642150624263; 
 Fri, 14 Jan 2022 00:57:04 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u16sm4651877wrn.24.2022.01.14.00.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:57:03 -0800 (PST)
Message-ID: <4cbc788f-7935-9d1f-9d56-0cebeda7a5bb@redhat.com>
Date: Fri, 14 Jan 2022 09:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/6] tests/qtest/libqos: Skip hotplug tests if pci root
 bus is not hotpluggable
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-4-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-4-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W0c3K09N7Lt0

On 10/01/2022 22.19, Eric Auger wrote:
> ARM does not not support hotplug on pcie.0. Add a flag on the bus
> which tells if devices can be hotplugged and skip hotplug tests
> if the bus cannot be hotplugged. This is a temporary solution to
> enable the other pci tests on aarch64.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/e1000e-test.c         |  6 ++++++
>   tests/qtest/libqos/pci.h          |  1 +
>   tests/qtest/vhost-user-blk-test.c | 10 ++++++++++
>   tests/qtest/virtio-blk-test.c     |  5 +++++
>   tests/qtest/virtio-net-test.c     |  5 +++++
>   tests/qtest/virtio-rng-test.c     |  5 +++++
>   6 files changed, 32 insertions(+)
> 
> diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
> index 0273fe4c156..0d656d3af63 100644
> --- a/tests/qtest/e1000e-test.c
> +++ b/tests/qtest/e1000e-test.c
> @@ -235,6 +235,12 @@ static void test_e1000e_multiple_transfers(void *obj, void *data,
>   static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
>   {
>       QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
> +    QE1000E_PCI *dev = obj;
> +
> +    if (dev->pci_dev.bus->not_hotpluggable) {
> +        g_test_skip("bus pci.0 does not support hotplug");

I'd maybe rather say "pci bus does not support hotplug", i.e. avoid "pci.0" 
here, in case this is ever used for another port, too.

Apart from that:
Acked-by: Thomas Huth <thuth@redhat.com>


> +        return;
> +    }

