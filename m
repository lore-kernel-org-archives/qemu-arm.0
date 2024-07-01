Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1427432njm;
        Mon, 1 Jul 2024 08:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPf4VXz6zxF3t05SkvQXl/MM2lJ1uW+QiL+sruMPxjfu/vprx+wYMz/VvUHjIN5oKWc+EZLzOHubU9HwxZD0yxn1XIyUm3
X-Google-Smtp-Source: AGHT+IGMAafZSryVblkQCbknB6DeqChyJwCmmEDVCbOYNmfu4C437gTi/EeTVQl92PoZj8A8FF7D
X-Received: by 2002:a05:6512:318e:b0:52e:6ff9:1957 with SMTP id 2adb3069b0e04-52e8273f50amr3984661e87.60.1719846956710;
        Mon, 01 Jul 2024 08:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719846956; cv=none;
        d=google.com; s=arc-20160816;
        b=KNpHD+kMLGtnBMp0raz/cZjl+sXquXJEiBAQPAnc8QNj9GP9oU7b0Owdow+90RxgCE
         IgnHX54HFJYnK3KRyWEaalHTs7DXY2b4f90S61UKxzVcs6FLF4I9gGTe/oJs/4o7lNQR
         nBej3Ggz4UAJb2yK5GNu+1wKevemH2UuouN+wRa/KdFejyokAM8E7sxX8THMR0f7lV00
         TeFON/utdGfbTZIWhdsEd1nSvZA3dC05PSPOnNqKuocxjiHTrWIxzLm5J0iuPOBE2/lt
         jVcFGfDHY+ouwSNsyGZc6wO+j1rhwekvoBXRsfsCw10raVE2wzawniXM6YoItcXL982B
         mlOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8Lnkl6kmtvAckHZq5GeTFigb3gwTP1kFw3VWYGdb+Ec=;
        fh=dF6k51LaNlHwHQOXhrxic6J8xHIn9Da9ThREkIcfCQ8=;
        b=gtTdDw//urUv6GIdg1fpWcYPBdX3mbeViGO+vdSPglJ0ERGKv1M39sVSoII9MlrTH1
         km9DtZj0b5Sp44tmO3nAR0Xp+G/7DirTK2a4WN8VbXp3n0cy0epaOMT0tS7RhEtiQ9Sx
         dVJeNTlEwjY95Hg0BSCXYQKzCgj8IdxsLAqTtsnL5hdpCzHDMnPfSTyFe3FIyLCbUPxc
         T/2ZX+p8rUXMKVvtDPydeDs/5VjWLZb4rBJFY7d2MeqW0SkEY7D0zEMa6P5W2MqpPVUq
         JfLhjhi+7FehkwTjnrnBEpG9JrXppzMWV3uN/tIRqmokiCNz1J8oZ9dj8TYPcv5FkXd9
         P+Vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGvhjJ3p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4256b0efd8bsi45994375e9.180.2024.07.01.08.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 08:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGvhjJ3p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOIkg-0008PV-Sp; Mon, 01 Jul 2024 11:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOIkY-0008HD-R5
 for qemu-devel@nongnu.org; Mon, 01 Jul 2024 11:15:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOIkW-0008BW-Re
 for qemu-devel@nongnu.org; Mon, 01 Jul 2024 11:15:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-364cdfdaf91so1797080f8f.1
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2024 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719846922; x=1720451722; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Lnkl6kmtvAckHZq5GeTFigb3gwTP1kFw3VWYGdb+Ec=;
 b=mGvhjJ3pZXORlV3Yygq6C+9s0loUT3yZPTV9na7mFpeYfIHzMmoC72kSB7Cs5moJ9K
 CA4e78/+Cngu0oBImnmioYQ6XRc5zZqs/V2Q72ov/ign8t5nH4Rtzx5WFwD4D+RbtV4v
 Wn0lrMKAQwuh5G2lkMVkSHgaz0rNjHyB3lfM+eN/ZewMVIWqWJBQOYUHmeLTviiiwjAE
 4ML14Ofy0pr8noHZJsZxi1eMrGZvq3e1B1RHwl5XE/kvN0WfyRgYaLdgnxgYbQv3T661
 /Br5s646eG82XqlMJoE51PeJpUJY1w5Mr3yzzbn2tda8lncvV5duSp2IAyRK0YtTMwbY
 keIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719846922; x=1720451722;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Lnkl6kmtvAckHZq5GeTFigb3gwTP1kFw3VWYGdb+Ec=;
 b=QP6CDYngEbY5NCUvbNoTPQouNaFPaTZVbZ89FhaZTs0ueL6rvVYkrkmktxr+wccU+e
 HGPIk4rPYArhAan9LJG5z4p8efKWv/ifls0Y2vfQIdxGgV3mTPFxVgCiGgXLvFxMzB9L
 ATANve8WQDS4TcL7Lo2LIxCKyI6MKWmSM5VDqCEJRUFOLUYOt8srnjFoyxVjtFQLaVnC
 pUZkOdEXYeA/AbUbEo+4kvBcK4bIHHi6+PVeRDMEDK+CNVEj3Tux6VouFzHDQrY2iNL8
 7H6dxmNz0nB06QTdrdEr57t2ZZkIfJqdEeoEfBydxOoM4Ddw3sWeN+shq/e2lS8rQ65M
 /BMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ6AyiwqVzL4A8UQWqIWUs8IlkR9t92t6wxA1EPfHlLFNedEKLlvGMgZC97fEnZLh/WZS4dlCnzV2YH6Vn+qjVFRV/T8A=
X-Gm-Message-State: AOJu0Yw6A4kMlzxAA7dEMFr6trQ7s0zvDwJe39bkOVam2NtaOj4unTiy
 u13c3UCJcio0sgrd03Skzs3iGz14/3UTX58xna2/nJyZsTOg6ZdXREMONuW5L/k=
X-Received: by 2002:a5d:6483:0:b0:366:ebd2:662f with SMTP id
 ffacd0b85a97d-367756c6f0fmr4178268f8f.30.1719846922232; 
 Mon, 01 Jul 2024 08:15:22 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e146bsm10276862f8f.57.2024.07.01.08.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 08:15:21 -0700 (PDT)
Message-ID: <53558d9c-2f0d-4c5f-ba5b-06ba8b49b626@linaro.org>
Date: Mon, 1 Jul 2024 17:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] docs: document special exception for machine
 type deprecation & removal
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org
References: <20240620165742.1711389-1-berrange@redhat.com>
 <20240620165742.1711389-15-berrange@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620165742.1711389-15-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2+DR+CAI+Ka+

On 20/6/24 18:57, Daniel P. Berrangé wrote:
> This extends the deprecation policy to indicate that versioned machine
> types will be marked deprecated after 3 years, and then subject to
> removal after a further 3 years has passed.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/about/deprecated.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

