Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE93CA1005
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 10:46:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utOWp-0007wK-Si; Tue, 02 Sep 2025 06:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utOWm-0007ui-Jf
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:46:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utOWj-0002ff-BY
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:46:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ce4ed7a73fso2684845f8f.1
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 03:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756809971; x=1757414771; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iab97hHWv8xpfJlO3erGvCKUUMmB9+2YZ7Z87SmK3Tw=;
 b=JhGID8KVJoho4LrpEexYExFkzozxVtamrO8naAVIhJFb9b9kO/NZiLW9OJw+RBQkHS
 F+vfieP3dCYhu6J7j6kgXiWrqQuW+tSPT8pV6zd+cA0zT7fZvc4n3Ovr4Ij1femlPmIU
 7QUFqUebXSScPC6vz7CfzqMWqvuCUhNFS3Cbsmm1rg9Fi2d93w/syjgDDHq7QNsqog8h
 /0VMufj2tjzywfAGhZrCXDPzublHHGBNv/1thWLt4CVc+yLRBAXu3qkxiQO9ubmXDAaB
 OPV88UJ3vTr8bYL3pZxvuwUk3SgwYEPhozb4XbfpqNfKLU5s3wUZWYPR5ZANLR0cYRve
 XfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756809971; x=1757414771;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iab97hHWv8xpfJlO3erGvCKUUMmB9+2YZ7Z87SmK3Tw=;
 b=B5Dc44EboqSf5f+BKqw8XieaeFb1rSqc3vornH7dLIwwzWI9fLChN6143jEKb/kyjw
 +b6EcWr0MNPHkOLF6oihA8BeHFgwCKevEUEcTXOvExG1Usap7Jmjydb8GCvEZxz7EFuE
 qbfKFDKXXJEx/AEsuEZbd+b+noPLm8W+/elAM7C8jidE3KysK9dZWywybIG2GTgQoM7d
 ZeniNauHmZCyiA/+R6SrANaiN4KNjSq8wIc9gX1WTkMSwMZ7UEanOQ4fQKULJBEjstAP
 oyIdBfZHt+dC8aAPGS1ZjWa27o9fJFeB2A4KrNa+gLiPpXqNaMvuNpIz8vPuwcTW7FzE
 wQiQ==
X-Gm-Message-State: AOJu0Yw/rGpZXpO1oPujPT3M2H0CzvF34TUpE1xefBBNyD+kI2Ex0uSD
 rZYh+l7bK8+qIxxSE5ndY/6XCdVek28A5Rfv5sxVnq170PRXIQl2l8HJiyc8rENUm/E=
X-Gm-Gg: ASbGncthnA9yvoi8SSXxQU5EgErCNHX2z3O4weH9s9sRMUMXgMIoqjZ4tEAPtaar5xu
 Z5IDBHl1qWL8Wh3gM89Qh+9MRRfWZTwqsoZYNbzMNZGLO3xrXL/0qJPpWPMOt1Ls4/j1LJRIRW1
 mTUi8HNKpUx/TgyXziy50XsYfXms71AyVZzOln9L1HS1HHqK0X30w0qrFc5GMKFk42XtsBXMQ/4
 fRvMT3U42+MNaEt3oqktnr8LKeZyzhyK7Ch7ha2AlsOz9drivOZh8+AJocpCrbShxykuhRncUcj
 W760A9wB+i+2VABhsm1UIHcUSNDxQDyglGykgd5x9RL6+DkLg3gGXS33Nh131QvmljC0xqqoWPY
 GKWnJcwC/pUPCpxvdrmnJimrXtwmILGWNkuSdhKziU5MrUrwbfLQzodnMk6p1fy7kBK4M2+rU4E
 Djd8CAmet8d+s=
X-Google-Smtp-Source: AGHT+IEbSSgjmlCO/6rslcaxmvz/u0PG8yWZs/h1xIiBK2jl4/6orHqILMHw7GDbUuG24E3ke2uZUQ==
X-Received: by 2002:a05:6000:288b:b0:3b7:96e8:7596 with SMTP id
 ffacd0b85a97d-3d1e05b9583mr6601653f8f.57.1756809970701; 
 Tue, 02 Sep 2025 03:46:10 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7d1319sm206965445e9.5.2025.09.02.03.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:46:10 -0700 (PDT)
Message-ID: <80694477-6baa-4ded-bbe2-48a12cb18398@linaro.org>
Date: Tue, 2 Sep 2025 12:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] hw/isa/superio: Include 'system/system.h'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250901064631.530723-1-clg@redhat.com>
 <20250901064631.530723-3-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250901064631.530723-3-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/9/25 08:46, Cédric Le Goater wrote:
> Files using serial_hd() should include 'system/system.h'. Fix that.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/isa/isa-superio.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

