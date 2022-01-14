Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp585186lfj;
        Fri, 14 Jan 2022 01:02:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf607czJD6ojp3JnOTfKFLEK0PsI+YpG7uGli+2KrF4IaB0XfZSkBpLW1q/2sMEqgLJoGU
X-Received: by 2002:a25:d305:: with SMTP id e5mr3239913ybf.182.1642150946234;
        Fri, 14 Jan 2022 01:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642150946; cv=none;
        d=google.com; s=arc-20160816;
        b=i4BJgQwhagB0jwHW3O+ju6K/R/6lcLtGLlhWD+SQ7nMPCOETjGfQ91BzSgcbYS8lfQ
         4OhE0WH3J2P0hTZ5hSIFQYP67LJm6o0xkPS2aPPfoLFxw+q6HW2elKYYQWbhXzd/HoyF
         gKyl2sfGk/VNFqqxXUxpgjIHYsSA5sWgaHhOoMkz7Gu9IcFju+sA8xrY3b919d9Uv9jN
         NBhD25Z/0q9aC31IbQKcw6SboABoTu0Zgcv89c7mfiaznpE2KIOm7Ys9mLA4zz9Y4lu3
         2gdeYQbxyGIasjiqDvxWyH9d1rEj+bNLxzFKw3h7g3pM47weJEmetP4KAs6/5/OxB9am
         fWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=mMKHAoHd5bj6VaKNeKLiXYoaq30S7MPU0P4Z5Cnyhk0=;
        b=XBoNo0S09TgBWqCIKWAPYxs3WvNfZSnhWq3k7DcnCjAjlqtKLapGbkMTD48dzshREk
         rhVm6Wwpo1WO27fZDeI9Y+OqGPZYLVI7YZ9FUDkMmu43z6e+bvMuMP8t/EfvV5PNE5AV
         Prfcx8BrDhtFZnDDhJ5iOuU3WWutrI6kfyYQcQb1ryoy0Irh1EsubIdawixr6uFxVTid
         R6gaWfFSVIwpt7sbUiijQ6JpfNpoBHm12CEJk4ipAuRlkZ2mhJsQnBbATFQZ60FxK8x2
         TsQjuBGuB9a0mkwbcaEZ06dKx74Wh4LgJpKmm/dm9OJlbLpxap18wiE9GMy/1EcW93ih
         LXxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P0LlPico;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si4653959ybk.300.2022.01.14.01.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jan 2022 01:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P0LlPico;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8ITZ-0001tW-4F
	for alex.bennee@linaro.org; Fri, 14 Jan 2022 04:02:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8ISd-0001oV-OK
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 04:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8ISc-0001IM-13
 for qemu-arm@nongnu.org; Fri, 14 Jan 2022 04:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642150885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMKHAoHd5bj6VaKNeKLiXYoaq30S7MPU0P4Z5Cnyhk0=;
 b=P0LlPicooOvns5YojqQE3PLgIlPCFoH5tZF8okJRRzPJGd4K2AGK7h3J8+b6hgHtmyrwbB
 2ygpxrnfxnhWSwQeaSWD6kjDD56BS3BDnKmajWHbYrl1LeyYUQ5fKt2hHQqRWJQK2FHaSa
 4pbsKCQ1FaD5RqC3VbMVwulyCstlPJY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-hNgrOxVlPZC6ghOuYtn_fg-1; Fri, 14 Jan 2022 04:01:24 -0500
X-MC-Unique: hNgrOxVlPZC6ghOuYtn_fg-1
Received: by mail-wr1-f71.google.com with SMTP id
 t13-20020adfa2cd000000b001d09443ee4fso754487wra.3
 for <qemu-arm@nongnu.org>; Fri, 14 Jan 2022 01:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mMKHAoHd5bj6VaKNeKLiXYoaq30S7MPU0P4Z5Cnyhk0=;
 b=VkRA3eBpzViSPnpGfHKAQ2e/1BiIhMZDtItxBgiIKqI6N0UdBj3LCYVGCGYX07FxoO
 JQ4XoBXJI+kwfGTggH9bEjXmAT9wcngmPmbwbnHAlCgRfYrStXqwyHikralnLA7QU/pd
 n6EIi8W3divZvG2kxjv5jZ/7zDfSlG0CMR/XYXF5/3UmEucs9SL5TiciOqbWs7IvI9n5
 KRTxo5nEAS8ElyayYU5y3lBdG7bHi7kfyyIa8vtWbystKSD08sZEX+1Q71ScG1atmVKP
 UlUHmo957/feSITK1bgpMDK2sXfuda+hAr6fNOsttKQS+8jnTdKJEYWSYMevXRIypIpg
 7azQ==
X-Gm-Message-State: AOAM5304ad574eE0kOc/Lbn+PTjrBnwQBTxgAXQXLr+HvdGBkwzUrXhh
 EwNWuDnieQjkdMirEe4fpv7HFaU2gjC6LFkFazjOj3/Xlnye63ucer5wta2QZ69cZF/vQ9oxnwJ
 8MdOwE0kP1KhG
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr7248348wrr.559.1642150883171; 
 Fri, 14 Jan 2022 01:01:23 -0800 (PST)
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr7248307wrr.559.1642150882808; 
 Fri, 14 Jan 2022 01:01:22 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o11sm10348219wmq.15.2022.01.14.01.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:01:22 -0800 (PST)
Message-ID: <9be87573-34e5-c11d-9bbf-5a61610e3c5e@redhat.com>
Date: Fri, 14 Jan 2022 10:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/6] tests/qtest/vhost-user-blk-test: Factorize vq setup
 code
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-6-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-6-eric.auger@redhat.com>
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
X-TUID: +xPshl0hf0sC

On 10/01/2022 22.19, Eric Auger wrote:
> The vq setup code is repeated several times and can be
> easily factorized.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/vhost-user-blk-test.c | 33 +++++++++++++++----------------
>   1 file changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

