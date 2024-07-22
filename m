Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1788782njc;
        Mon, 22 Jul 2024 02:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8A9RCmepyyDNOHKQKExRJkw5IgABNJnrVed5UWmjjL0byfxN8mlhonb+hix6QMeI/HMJ5UwxOMnw30oY3uXcDslbdQAVa
X-Google-Smtp-Source: AGHT+IHss07yCcOX8A5Oy3sjq5WRf8c4WBUJXQ+xtsspVu/T4r/jOt+4mGAD0/5/yjm/wPzJLNJc
X-Received: by 2002:a05:6102:3412:b0:48f:420e:b684 with SMTP id ada2fe7eead31-4928ba78a71mr4580308137.27.1721639125823;
        Mon, 22 Jul 2024 02:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721639125; cv=none;
        d=google.com; s=arc-20160816;
        b=c6fzotm6MaQbQW5tN7a1z0jhZM2xv4jV289G3ScGp9SqfiF0vsFAPO00kc9pdup+La
         g0Fkt0Qiq1J/fuURQkq3DjE/BQFvEsv+kZmgDrovJxVEGwKLhGO6o+pK6rnmRA7r3vg+
         9NPVCwSNRWHrdt5TsnZzpsm7OKdihUk5VeT2Br9wssobpNxNpiv1NbXyGbN+MKwl7l6m
         Z8B5YVdH0PHH18ArJlB0C8rxNhLJAAwU6wLgyElCpUH3aTBeB0Y7tJjena/L/uqnf69v
         PTu0JYphHIJulVeWXNeMafeLl2G3U+LlywfZ0pOkUuG8aj8GE0jCtW0mWjoVTcYpUUVE
         2YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=1ZWWfs/4xcwqyhRgNNQX+couFito8bLBLj8rmW5gMGU=;
        fh=ojGmTzHhW0SuukqBSPl2mO9rmGT8hNx7nyolSKUiF2k=;
        b=wNPtSBQ55V9VZoTM6zpP5WCHoDlBorG75Oay1n1ZoB5cOxBP8qDljMQfWvARVMhkPC
         dLrMQErfnPewQyckFby2gCUP8F5d1lTHlPiK/O/o5Hl1VnV7sBS8OCfMtpFhi6u0VGxL
         /NmafFMXVQs6cRg1pnoWyP2hOCauWlGvUO1+nm3KgWMmWN0pMuRDfTZ/ugIxRXxDitb3
         zSxPU4QCoKOjuyZzlMqbmMfS6Xjavn4ljOnZz7icGWQcmyWHbgm6aOHHB3K5D7GdKlnf
         fFeU9qkpNkaYmBJHVoys8H4o5NrKg4pG00j7Q5bmFdo9nFo8afMBGHKoCCs6Ed6AKx02
         pFDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AhLpVV8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a19904a617si740654285a.272.2024.07.22.02.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 02:05:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AhLpVV8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVoyj-00060w-Bq; Mon, 22 Jul 2024 05:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sVoyh-0005vF-CL
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 05:05:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sVoyf-0004u2-SP
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 05:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721639104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ZWWfs/4xcwqyhRgNNQX+couFito8bLBLj8rmW5gMGU=;
 b=AhLpVV8UuQdmQSm/cXEAu3YvRAH3lFyEjKXFFnRy+eWMWuvBF5giAjqssZlWP9xbVAbcQT
 jFWSCoZk1PEMQ1dRmN0pnHbP60+25IDquV6A6bBEbE7tSx44eYWpwBj4HJGVqAfAwsLxXN
 NxJm3qRhZvJXOuuzGMmDuuumeM5vtKg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-Iyxc2CMzNyKlZKZxb5DfnA-1; Mon, 22 Jul 2024 05:05:02 -0400
X-MC-Unique: Iyxc2CMzNyKlZKZxb5DfnA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ef2abc51b9so10715031fa.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 02:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721639101; x=1722243901;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ZWWfs/4xcwqyhRgNNQX+couFito8bLBLj8rmW5gMGU=;
 b=u39lvx8UwGS/phXJ/DhozPrrXFZ4c1KWQc8yaa/UJbOJ335xumdsOgvfAV/U4PMvbd
 jjR1BVrp11e3gJXVXXlgaiJRANFRTGyRSqawlzxMgsXTHbCkKWNzRt2m4lsMMbEBX5IB
 g3VHrPosKZ9uzTwo+fjTBs3OCpAOrB+MAQoA5Lm3B1YyugK6ITaeR4/VHAkO2Sl1LRHi
 dKP71qBHByeeXo8kdZjIjhfPI9XBk2FFgehkq0rEj/tjCJ5wQht+ZNSwHNQWwtf5M013
 lQ42fcLVQv819kBm56LO02EmNTgCMx/FyMPKXVc9x+rnt9H7jZD7IQ9afCynwm6MOCxg
 IUCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXecp1+UuW3DsCeEdd0cm8in9Xu7JZrM8t5wbLQ3kCC8xPFZj+5NIMaLt/h5q6kbUu4ATY00u0dpjNI3SIS6Vj1ZCkx
X-Gm-Message-State: AOJu0YyqRPENRc4NIyFH0Hol1WB/k7qi8ZUf3Bpv8bgV9KgZndjOL8Cf
 Z6KBapR28AmG/A3LFP6mtrF2SrrSeu7CYuPh5Pgbj4QAFJQK/oQhknQSOqRA4Rqrse2aXs02Clt
 a9XTjyvUlbU40iX4/rVM08DfsazBHFS0I7Vbr93YgGxmUmaZ+IQ==
X-Received: by 2002:a05:651c:a05:b0:2ef:32bb:5375 with SMTP id
 38308e7fff4ca-2ef32bb58a6mr16287981fa.12.1721639100649; 
 Mon, 22 Jul 2024 02:05:00 -0700 (PDT)
X-Received: by 2002:a05:651c:a05:b0:2ef:32bb:5375 with SMTP id
 38308e7fff4ca-2ef32bb58a6mr16287711fa.12.1721639099843; 
 Mon, 22 Jul 2024 02:04:59 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-177-101.web.vodafone.de.
 [109.43.177.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a7f6d0sm89597055e9.1.2024.07.22.02.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 02:04:59 -0700 (PDT)
Message-ID: <50197ffd-f725-4f5e-a105-b8787df34a8c@redhat.com>
Date: Mon, 22 Jul 2024 11:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Increase timeout for TPM
 test
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240722085547.90650-1-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240722085547.90650-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: hgMsCg8dUI5Z

On 22/07/2024 10.55, Cédric Le Goater wrote:
> On some runners, test_arm_ast2600_evb_buildroot_tpm can take longer
> than 90s to complete. Increase timeout for these.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/avocado/machine_aspeed.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index 29e6b388a9fd..f8e263d37ea9 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -87,7 +87,7 @@ def test_ast1030_zephyros_1_07(self):
>   
>   class AST2x00Machine(QemuSystemTest):
>   
> -    timeout = 90
> +    timeout = 180
>   
>       def wait_for_console_pattern(self, success_message, vm=None):
>           wait_for_console_pattern(self, success_message,

Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, I'll queue it!

