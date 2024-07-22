Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1926962njc;
        Mon, 22 Jul 2024 06:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIN0QjU9utYJVIPx8/Hwxj7BNAI3B6QhyqRMNYdIrQzGRXu1UkqZhn4sSUN5LSA/IQd+v9vy/ZUmuhRRX4dKY5cEVRjB4z
X-Google-Smtp-Source: AGHT+IHP3h/InNAiVvlDcLTd4qb3naE3L6Z88W9YR2WjjrPbNNTp1wNtOzwUvzjq8ARzy55P4Xly
X-Received: by 2002:ad4:5c6f:0:b0:6b5:d0de:8ab5 with SMTP id 6a1803df08f44-6b9610a1e67mr119160286d6.30.1721656267486;
        Mon, 22 Jul 2024 06:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721656267; cv=none;
        d=google.com; s=arc-20160816;
        b=xSgeEY0ng7Obkgde16FpgBn4X3U5l4f9vK4V779aw5SMIUe88fsfP8O5ajcwmL+E0z
         MILb88xPGo4XxoaH7o3FJYPpWMpcTmhKbxUlm6dSxeZrheHR1tP/ul5AHhvAJrXwJ7Rh
         0GnqUDoCj7ihTod+cCcvje+3OHJu2mHJgkZ5qWVhZy6IGPWQfYQ4hUrhUoOiG4RUfreo
         hYRh4rYv8IsFvw72h1O1rn8jDjr2FmTN0FjEJrtIMW/oGvfayYhijK5oQ7nOs8mQ1EIz
         r1mHoK/LPO3IQYGShUTFZNiLQYGS30cCFrKzJSAyKrORlIgRM/2qxM3QTIvm92VGGUw7
         eBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bwkAQvs4w9+D8x+XrZ/OEsVc1RQqttmeOws4RPDEAFg=;
        fh=zIpIFtwKU8ueiAP6bDhqLH2TKh2/95Zu+KbbA5dI6Go=;
        b=x6N0Hg3bg93pc0L3yJu6Dx1cqeZBs+/XbLlxpFKuimHBd5RvEhzd3XQIpNui4uSYQ5
         yWIMd/7IRuyF7SiuJaf5yOMekoLRLa5Gg7iic2UUDcVw04lPcxW/Uo4wQgxTCtXQc9QE
         HUZWkxhJtiOZc1FPKY1qMo1/zx9F9PeiAOg3PCLPfkX8JGVRp2JuuxfySv0d0fX0mmSt
         ry9jTJxIzOmZgDvqS4ZyjQe5x4ZOp0M/V9qlWtFRBFtJu6FNc6qjlmqUT36W1KdQsG7J
         u3dWn8UJ6FUPAfgW2FN8BOJwgeB3CbQJjM4grhzlFY3taOyRfaGvXf+RFoUaIhGZdwLL
         vMkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxO7H8JI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acb0f241si73800106d6.529.2024.07.22.06.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 06:51:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxO7H8JI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVtRC-0001ZT-Bi; Mon, 22 Jul 2024 09:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVtR7-0001XF-CT
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 09:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVtR4-0006E4-KZ
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 09:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721656241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwkAQvs4w9+D8x+XrZ/OEsVc1RQqttmeOws4RPDEAFg=;
 b=OxO7H8JI+L4S2D+A14xrcCH+gKAEinMIAo8pAe7/GNbvY341mu5icz/eEsnZSgYQTp6+0I
 XuRif0tp2aH9QOVV+0dVG8uNoa1PlS/zPzqfMFVvOWpy16qOIo4lVn1HKnWlnIuTukiszA
 FWBmpsa5QZJxykDIvUgAOy1cf6mRaK8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-ZpENmF3jNj2i8PkUtnfcuQ-1; Mon, 22 Jul 2024 09:50:39 -0400
X-MC-Unique: ZpENmF3jNj2i8PkUtnfcuQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-79f1bf8ad5eso656945385a.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 06:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721656239; x=1722261039;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwkAQvs4w9+D8x+XrZ/OEsVc1RQqttmeOws4RPDEAFg=;
 b=wwtlC/DbphHBVfIEsXqQUp+/KRtSitOtrvIq++wNYnyxxwLRGZDaDuVNNo0rfc43Fq
 mAjZDegszk5IKvPoKq+aOJ+l24XvvqdwRa7TIFqk1UH3rbueiAyOL/HkTn8au1QWGie6
 LffQPupDqg+n83hpWjpYD/PLH86NBXCti4HfIu9b35CmcnIelAHNGQiWj+Jkcb873atM
 97Igt+ovZL83Sw9yHfEZnEuesMGd0XXpQbb7++w2aTux6OvZAL/ppR4aQ6sgXsTCZVWG
 /w6dSh0IgsAp5fr8LofbjXlJf6UkjkQgJiD5KKRyBGdlUuYEMfLouVKAOOlyWpXnrx15
 m7Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRJB71FV1qcTtY65A5B8AueBIAby1u3/YWE2piy6n0ZgSvVT/ekKYJkQGlRTIMMFQ/TYWN6FVlYmtT7Wrutxk1zU0d
X-Gm-Message-State: AOJu0Yw5w1cGhm3mA+uDCfTsosnNzJRbFtG1f0Ox2yZy1sGqo38chty2
 Zn5T5rNopl8NgJ0Oe1fk8YB+FNkqww7zbwCgOzd1IJ1OeAC0Vq2sWJKn/jlk4zQFUQdpjPOjWQv
 fc+dgv5Lks0Y2z0dMI6HEyJiOO8AqF0p/Ll8zfYH43Ybjypjong==
X-Received: by 2002:a05:620a:f02:b0:79f:504:3db with SMTP id
 af79cd13be357-7a1a13c5f29mr1115739585a.68.1721656239164; 
 Mon, 22 Jul 2024 06:50:39 -0700 (PDT)
X-Received: by 2002:a05:620a:f02:b0:79f:504:3db with SMTP id
 af79cd13be357-7a1a13c5f29mr1115736685a.68.1721656238803; 
 Mon, 22 Jul 2024 06:50:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:bed7:42c6:fb19:d12e?
 ([2a01:e0a:9e2:9000:bed7:42c6:fb19:d12e])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a19905ecf7sm360068785a.98.2024.07.22.06.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 06:50:38 -0700 (PDT)
Message-ID: <2cadf05b-fad9-40e6-9e1f-0c28cae75c2f@redhat.com>
Date: Mon, 22 Jul 2024 15:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/vfio/container: Fix SIGSEV on
 vfio_container_instance_finalize()
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhenzhong.duan@intel.com,
 alex.williamson@redhat.com
Cc: yanghliu@redhat.com
References: <20240719165011.1751831-1-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240719165011.1751831-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.133,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fB8a889+M3Q7

On 7/19/24 18:50, Eric Auger wrote:
> In vfio_connect_container's error path, the base container is
> removed twice form the VFIOAddressSpace QLIST: first on the
> listener_release_exit label and second, on free_container_exit
> label, through object_unref(container), which calls
> vfio_container_instance_finalize().
> 
> Let's remove the first instance.
> 
> Fixes: 938026053f4 ("vfio/container: Switch to QOM")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/vfio/container.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index 425db1a14c..d8b7c533af 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -657,7 +657,6 @@ static bool vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>       return true;
>   listener_release_exit:
>       QLIST_REMOVE(group, container_next);
> -    QLIST_REMOVE(bcontainer, next);
>       vfio_kvm_device_del_group(group);
>       memory_listener_unregister(&bcontainer->listener);
>       if (vioc->release) {


Applied to vfio-next.

Thanks,

C.


