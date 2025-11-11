Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D277CD1297
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 18:13:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIsrW-0001sm-1Y; Tue, 11 Nov 2025 13:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vIsq6-0000lV-74
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 13:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vIsq4-0004nU-Qo
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 13:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762884686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TiMa4k140u3cGmFCtj6qdZarrmwEcQGAOitHCjnEHGs=;
 b=Ox9dpUjNs8b7AbRmEBtz6/F01AxTlTp3sWuPQgcQjaJ9vItKBg1s7nxxl9a0muftXtXwc9
 IQcSGqPBRbT4RQo8c9I3yjrcsNYH+VeYV2om6P4Rrz9uQ8Ljk9mFBDZLzxQVgLwzsRlWQS
 5R87+nLZq9heWDOm+WJxKZDQVYAKNxs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-566xjWB3O4iWb6WIBaPhww-1; Tue, 11 Nov 2025 13:11:23 -0500
X-MC-Unique: 566xjWB3O4iWb6WIBaPhww-1
X-Mimecast-MFC-AGG-ID: 566xjWB3O4iWb6WIBaPhww_1762884682
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4775f51ce36so150455e9.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 10:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762884682; x=1763489482;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TiMa4k140u3cGmFCtj6qdZarrmwEcQGAOitHCjnEHGs=;
 b=qm2YJnLn01z9ixbf/Df+PZNTKyGmTI7m8whlphvrZKz/NYtzs3N3ChTYMsBq2Z19XB
 duN5GvBi16dvFjbhHUaRLWcU1GSrB0nfPj2QIQPWtc2w8WCzagnncTLJdjGZhA4/UUJU
 q1odV6ooZt2LPuyTaJPezV6arJ7ZKWx7aaO8iQ2DM5s9rjvYuoevEUp679cW44PyKwn1
 KB3znkeMZjKuyW4ZKou4XCQ4FapogQ+VTgrHzHiBTQw3+SHZfugmX00HG5RAhMFL4paa
 oSRw78EVQb9EDLPl6sK7yjNSBghliKrTHthsYCyYQ3onK6Z1qMpSTE+7/racR23dCE70
 gxeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbeKlyDTmUj8yklJnPXdrQrftrn+J34XERz/Tof5/0ESiiALDH1go2Nxb4HYeFsS0zUyqoX86a7w==@nongnu.org
X-Gm-Message-State: AOJu0YxOei96X00GDC9uNUGHKo10/EeR1/GcVKUGJpF6KXmnBLZO7G9L
 s/t3p5FiUgggGHtGtF3OTsCBIaQX60KtT9RrzO7yawTTxsqtUsBZH9hRMIogA1DdjZKOOAoiOBy
 8sLqqtmJ4CqX5pixSCmlQepwHp/o2mAOMPoIAGIH3HVdsYVNibSIF7g==
X-Gm-Gg: ASbGncu/Z3THu/KWD2jeaM920CbT9v4K0Jbqo6/vFcOdWUuGcxHl5OzBbjzE6+hDr2K
 3rVmlTww9FQ3J4+j72qLogrYm+LXHAwTOMz1yn1bhJhe+GZxQ472p5RYiU5hawzSSoOOuzaaVyR
 Fkt8rSJ+i/W/h+YLCqxKlCjqvbYX7PybVKDsX4qDMqoIgum2BJjA3Zowj97jtMl6gJEVST8Hn3M
 rQj5esbvqgIviCjM3MZWycebjT9ha/JzIs6CBjkfq5YMRWNp5YmdUi6dQCpm70ShdEL04IhXZAz
 PAZiDazCA4pz8fao7kzkrgzjmX8dQa/sdi4zpq8EAx/bOZwKOf2WG/kj7RKcgvV7mvEs7OE=
X-Received: by 2002:a05:600c:4706:b0:477:3e07:217a with SMTP id
 5b1f17b1804b1-477870be036mr3108535e9.36.1762884682309; 
 Tue, 11 Nov 2025 10:11:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHu6jE6Hs2I+kOlDIe38T3qVw2Smz7NUTRAeN2KbdV1zdvJfst63QQOsUcXg8BBcCm4u0VFg==
X-Received: by 2002:a05:600c:4706:b0:477:3e07:217a with SMTP id
 5b1f17b1804b1-477870be036mr3108255e9.36.1762884681881; 
 Tue, 11 Nov 2025 10:11:21 -0800 (PST)
Received: from [192.168.0.7] ([47.64.113.41]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47781d5d2f1sm24380255e9.6.2025.11.11.10.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 10:11:21 -0800 (PST)
Message-ID: <1b30dbbb-ea0d-4240-9604-2046ceef7f3d@redhat.com>
Date: Tue, 11 Nov 2025 19:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] tests: move test_kvm_xen to share.linaro.org
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-stable@nongnu.org
References: <20251111171724.78201-1-alex.bennee@linaro.org>
 <20251111171724.78201-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251111171724.78201-11-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NMes_4PheVcY0QrJDamCg20h7E-HPdzjvbLapxM7vBY_1762884682
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/11/2025 18.17, Alex Bennée wrote:
> Linaro are migrating file-hosting from the old NextCloud instance to
> another sharing site.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>   tests/functional/x86_64/test_kvm_xen.py | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/functional/x86_64/test_kvm_xen.py b/tests/functional/x86_64/test_kvm_xen.py
> index a5d445023c9..424d4b20010 100755
> --- a/tests/functional/x86_64/test_kvm_xen.py
> +++ b/tests/functional/x86_64/test_kvm_xen.py
> @@ -23,18 +23,11 @@ class KVMXenGuest(QemuSystemTest):
>       kernel_path = None
>       kernel_params = None
>   
> -    # Fetch assets from the kvm-xen-guest subdir of my shared test
> -    # images directory on fileserver.linaro.org where you can find
> -    # build instructions for how they where assembled.
> -    ASSET_KERNEL = Asset(
> -        ('https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/download?'
> -         'path=%2Fkvm-xen-guest&files=bzImage'),
> -        'ec0ad7bb8c33c5982baee0a75505fe7dbf29d3ff5d44258204d6307c6fe0132a')
> -
> -    ASSET_ROOTFS = Asset(
> -        ('https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/download?'
> -         'path=%2Fkvm-xen-guest&files=rootfs.ext4'),
> -        'b11045d649006c649c184e93339aaa41a8fe20a1a86620af70323252eb29e40b')
> +    ASSET_KERNEL = Asset('https://share.linaro.org/downloadFile?id=UG0V8dzzHrrHb9X',
> +                         'ec0ad7bb8c33c5982baee0a75505fe7dbf29d3ff5d44258204d6307c6fe0132a')
> +
> +    ASSET_ROOTFS = Asset('https://share.linaro.org/downloadFile?id=VwLRKDXKFl6oKti',
> +                         'b11045d649006c649c184e93339aaa41a8fe20a1a86620af70323252eb29e40b')

Reviewed-by: Thomas Huth <thuth@redhat.com>


