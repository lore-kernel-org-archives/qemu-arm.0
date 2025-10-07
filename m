Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB70CCA472
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 12:08:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v66Uo-00059S-6s; Tue, 07 Oct 2025 08:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v66Ui-00058j-1n
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 08:08:42 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v66UZ-0002gs-OT
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 08:08:39 -0400
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso4643504f8f.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759838904; x=1760443704; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ps4oI9QLttSKbrWOR7WKh22YqmsuJTATZazy/mpBS98=;
 b=Sg2buhcCeIydnjhKPbgu+L+ZYK9wRX1JCsfVjTG5da3UCQjY6vP6vjItmsr7AyFJu8
 GlOFehviFIF7ji/VHwpmsHE54qJ5DawQbiNamImg0/2WZb+01+spOPagy4f9qHyKCdoy
 NSRlycY461ra1Op4EKOtps80nFymCAbuFfOJcCBTV4LHBaKNtz5+UBfJPR0oU6O36jL4
 +ifQtK3p5W5LE1ZER+hV3ck6syTQfQAQ/ZEvoKTdItGvLNuJHTSG4juTJIdLjn2yyLoT
 E+ycHWBBkwA5nEbBfOjLhKpJNJH3j5wODm/DT+pjv30sf5bAKWQvmPZibrOiXO+XvlMQ
 a3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759838904; x=1760443704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ps4oI9QLttSKbrWOR7WKh22YqmsuJTATZazy/mpBS98=;
 b=L7TQiHLgXeB9x6f7EnjPZ65fe2L0l9nTVmQQ0tFMlj4bU7bF4WiUYDhSwhA17IpcbJ
 v89D1NjgL4kZtDxaOgPez0fn4yt/z6TrxWs8mVIt9bz8V1HYEtN+LcAaisWxKFghErUK
 rur14O6FfPTUzwxSZU5BR6liwKvlzXJObTY/N2V4Xqc6uj1F2YYk1nMoH3pqDGzf5p/p
 09w6vHvqOGe1RLo9tkSFhIb9VVUcEfHFC0AWoAGFFMpxGSyhYL7OqKSFsPqWy2ylmG2S
 q28rrS/JSfBpdMt/k9JZEvo8o3DG9Nj87qlw9hntqNZtl3tf/vbZYYez5d1ywjM1XkP4
 9Oxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR+KEnrEpd6iez7H+IaQzHHtbmNtjJy7SrRh8sm75Xq2NxHeP3XCrR9qxebceOyyYzucgDoLmqiw==@nongnu.org
X-Gm-Message-State: AOJu0YxQDQw911FjJRDScWoGS8U1msQbfnnvWms8ULn6/0LSmzmqxPVy
 ZEQuE0BkXlgrx3QzYGUBix8klBcItQ5wmjQUmSrru2ynnZBB2nRgPb2ZtdSGIHDk6aDOkXdL7sZ
 vnlREJgg0+cYQ
X-Gm-Gg: ASbGnctt9vL9iuYfhg9QQBcqzRdSSLjD5KqNHGmNdv946xFiqCg3S5VTjATJqN/CTWQ
 iNoADvRvHYtGX17vWihF2M3zAzsZ6eC08/SGrWz50R5j03O1wiBNqrfksfQVM8P/+45bLN+QF30
 mHADTQfXuIYog5AtuVOGkjM9Q4vJxSHX99/UGreMdXpjDcBvhhI7YnOxmRTbwA6/+/n5+vasTMa
 o4UZknOGVmM0ksegZzCzs7kuwnUicJ9mxtDr42WexyivFbQlqj1OspP2Pg21Xb0nWr5AEg5KcdQ
 TeK4J/sQl/aHg/j61X8bTEZBfoJ0iJZynwAdYv+1Gl4tq49bBu96w+lcQjVXaIt7PTftfc3/Dzy
 nd0bazEduAtgrC94Nh6Klo973HuK4KpU0sgX+uNkZ64Lo3DnZhnKWIw8lUpkHvn1wQheiShTwe6
 T18WPtWuSM6Rq5/0Bn72Xy4Et7/yFW
X-Google-Smtp-Source: AGHT+IHjfhBg1As87QHvEfugCYUDS5WMnJKQR35fIrrruJ/++xevR3CvRqVpQHrJ/58ErE9R8ZonSA==
X-Received: by 2002:a05:6000:4009:b0:425:86d1:bcc7 with SMTP id
 ffacd0b85a97d-42586d1c0cdmr949114f8f.23.1759838904510; 
 Tue, 07 Oct 2025 05:08:24 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f01a0sm25028853f8f.48.2025.10.07.05.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 05:08:24 -0700 (PDT)
Message-ID: <affa8c22-b555-4e46-b3eb-442eac0e1401@linaro.org>
Date: Tue, 7 Oct 2025 14:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] aspeed: Don't set 'auto_create_sdcard'
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20251003103024.1863551-1-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251003103024.1863551-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 3/10/25 12:30, Cédric Le Goater wrote:
> The Aspeed machines inherited from a 'no_sdcard' attribute when first
> introduced in QEMU. This attribute was later renamed to
> 'auto_create_sdcard' by commit cdc8d7cadaac ("hw/boards: Rename
> no_sdcard -> auto_create_sdcard") and set to 'true'. This has the
> indesirable efect to automatically create SD cards at init time.
> 
> Remove 'auto_create_sdcard' to avoid creating a SD card device.
> 
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Link: https://lore.kernel.org/qemu-devel/20250930142448.1030476-1-clg@redhat.com
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/aspeed.c | 22 ----------------------
>   1 file changed, 22 deletions(-)

Patch queued, thanks!

