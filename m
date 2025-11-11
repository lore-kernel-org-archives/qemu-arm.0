Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005BACCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 11:56:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vImz6-0006v5-UK; Tue, 11 Nov 2025 06:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vImyB-0004QG-Cx
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 06:55:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vImy9-0005LI-Dm
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 06:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762862127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGgiowmDCPt5pBZQwvd890N8BsFgh9ETxA9LPRZN7Vs=;
 b=BEkP56SjWdsfQKwq0VSfw961iAB7XssMwGT3Y7iJ8ynDOB+VG0+M9Pf4n+T33J+rEt6Pys
 4K1YN87id3xRJOWTQJEaN7NgRaqk23dto6QNvABydkbNV8EkYUk94oZoqL0uEgMqaR5Wej
 jgOhaOapEjKoPQREW1Cf8NzeMJhXEZg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-17PWSxNZNX6fxZ6CI4sJyQ-1; Tue, 11 Nov 2025 06:55:26 -0500
X-MC-Unique: 17PWSxNZNX6fxZ6CI4sJyQ-1
X-Mimecast-MFC-AGG-ID: 17PWSxNZNX6fxZ6CI4sJyQ_1762862125
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2982b47ce35so21286535ad.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 03:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762862125; x=1763466925;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yGgiowmDCPt5pBZQwvd890N8BsFgh9ETxA9LPRZN7Vs=;
 b=Kkh90dqHChrR5JaqF3I+PV5WRnADrgTGqCKjFWZKjRbFG9/zSsRUSzDX5/A91oaA6D
 WL81wGjqoEGRY3OvKnQlVcyDdgquZJBATfgrUZDZ8+Ow9ERaHmvv0YvEhEaVbrtIAFZz
 L7WLlt5JTn7TiP4QQssU7cnftlXl8fQ6r6XfzZJ/FH01S7k2PYSrHAG7Ktz4xVufROjO
 XZisO0OhApuRmWr2b/WkSD+5JVYbaKB0bhSSGkgNAmO/iAC2TNIjpFEEY131qck72WJ3
 QYghm6Xuhq953zWcTImRZ2SY0TopE4AJ8ksn6+bHrZBSsaej0TizIDMHfvP5sRXqZ3WE
 4H9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc+SGPw0pQUAZWL0clP4jfLvsBz9LyWGEhQHnwa3b4vYT07xTBq24n4uKha5b1873F5hG7Az1zvA==@nongnu.org
X-Gm-Message-State: AOJu0YwFP3ok3ovjoYc9CUuOKjod6T+kDzCwcyyPBuKDYu5aitc1WQUO
 gc4E8vtJoTm2Ig95+fUFCoM7LS8mIrwDhZOvkoaB7suDnq9hPEHzUhmgxlAtGhAd8tYAPf3+04W
 0XJjpJ4oMHmCtxjanNBjU/5sO0ibSKeKlle6yjBe2m+woAQXzsjzgZw==
X-Gm-Gg: ASbGncuPxNtw9AFJtiE+2+eYgJphN6wAsi9pdevv1nHXVXH4kWxrl24S8gT3U4WWJDi
 7HI4SQyh3gXyiKta1G6Xknt6NN8h349v+P8soma+VnH40dydw1G0NgNYh2xZKyMO8wzk3xdL3Wr
 wS95NeoDTh9H5dmooxAVm26T1F8RxYHaYbhEQpxn9tlX283R4yje7yq6I/7EJqVRuZwmjtS/L5j
 +2U1Yd0SFA5m9nbJcn0DMCodyFKowU5bO+f7+uPG4mTlNVESXO+HDx1jJyD3BUDS/E06ARNfHLO
 /IRv57bwktPSlFXIuKvqEbPdJ1cmq3HTaUr2I1PM6cdSIQD00G5eB3CEitRn3z4cKA6pZmTjcNC
 vhV0blPGr39u4tP5N1QFy/o6NNPZtN1WYNWuLV4k=
X-Received: by 2002:a17:903:1c7:b0:24c:7b94:2f53 with SMTP id
 d9443c01a7336-297e5411a12mr151114875ad.6.1762862125405; 
 Tue, 11 Nov 2025 03:55:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw8jKEgfrtBGTp+Bz7jmjeTDKyqWvqu+8Yp+vqNaPLtJtxSIaTsSYdhfBfPWvvsz171jIJMg==
X-Received: by 2002:a17:903:1c7:b0:24c:7b94:2f53 with SMTP id
 d9443c01a7336-297e5411a12mr151114695ad.6.1762862125063; 
 Tue, 11 Nov 2025 03:55:25 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2965096b90asm178283755ad.23.2025.11.11.03.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 03:55:24 -0800 (PST)
Message-ID: <7fe42ed3-4247-4406-b728-c6ad37a28545@redhat.com>
Date: Tue, 11 Nov 2025 21:55:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm/cpu64: remove duplicate include
To: Osama Abdelkader <osama.abdelkader@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20251110161552.700333-1-osama.abdelkader@gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251110161552.700333-1-osama.abdelkader@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tY5EF7n5L5Fk6P73LpdAICJMu1R5SHe5AJJklxXVIxk_1762862125
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/11/25 2:15 AM, Osama Abdelkader wrote:
> cpregs.h is included twice.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>   target/arm/cpu64.c | 1 -
>   1 file changed, 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


