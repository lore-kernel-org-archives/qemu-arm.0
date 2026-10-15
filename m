Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A14CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 14:56:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHMsK-00021Q-FN; Thu, 15 Oct 2026 10:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xHMsG-00020g-DH
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:56:04 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xHMsE-0008Vv-6z
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:56:04 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6af9a90e4bbso5807350a12.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792076160; x=1792680960; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=g32trlGyDzah+dddiDX4dEQov5de09hHHaVwMj9ZkK0=;
 b=h9neFD+Og7tyVzBEigp8Z3spBvHtStPBrpVBwKmEaGjU7N32rZ772u7wdOp+7sVcYA
 flE810hJsk/8BsW9VSVQsaKfcslTSp7R4kgc3Z8r3goOujj5baaISnjSa1B9nZcLAChZ
 us+vFBt6Dkp2syw/ki7IA5eGd6KwCSa0YomPQMnTePIVSAdegEVwvzhtk35l7n/4I2lY
 Zc0+AILtgswIdVMoerRmth2A7/0h2x+roonnpNkAL6m1wy5391kQuIWLzHwoYKyKk6yS
 nP7Asx8coAVJHIcBgynuAfQ56gx6To/oeDALbKZe35vxSmy4oDYwhS5oRjHA/WTiJHtv
 DVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792076160; x=1792680960;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=g32trlGyDzah+dddiDX4dEQov5de09hHHaVwMj9ZkK0=;
 b=VYzT4DW1+aG9BpoDTkIb9yF68Ha7wu7V0g5dVjqgjvEWFCyA43j3MhGeVSiUvJlQ0x
 EPbXsODKQAF1bjlP0As9HMkW7ywbK4UN3wLuSpaMWVD+qx+aOfcURb+Kn4oO3KdIWN/P
 l2v04uz3VDzTJgsb+3fn7lUBnQr1pDbf6xARftPpP88FkV4zMz/9xIG0CNuEvP3mXQjo
 BqfEKHgPi12ftmF1ped4Jhl2USanWO6sshwUtIeh01dIsH1dq5QSoi2yf9iIskN/T34G
 3duvwb+jNWI/noarMUG/ZcgwKOBQ2ElXo4iLrkGAM2T/SmysrJkfkPFL7bfIdTVumcKT
 To+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwmiumcDcdvF0DzG2xnK07rMiCW8urwzPoO8u5q7XamSvK6Iwm/IhY9wUGuWvdraMNvlLfgZs1TSA==@nongnu.org
X-Gm-Message-State: AFq9FYIqjR8oNPtiLlKFhA3ieFnk7pguxjwzbLko072xkcCpvS+R/KOQ
 pycJ0hE1hpLSQ1h0+Kd+NjBC3Dysv+K5JH3TiAv1pA4yW7jM9qwWRRHKlKy/o3BojI8bwatMTLh
 3AX1koBw=
X-Gm-Gg: AYBFou1TSzhG02JrEaFtON4oSoamfXpl/0BVovjXHUA7eHpRrQftCz1jPOG2MzL8U4L
 RFqDjx6bLTd4+WFEozqfFAKhYcnYPr4Dxx3yh7kcuLGvxFbDcc9kQ4AYjrgBe4BHxd83PoTmnx0
 J/6RqjjI95SgHTDlCdKzzc6BwTH0JuUue4VGRpW5yqxNeCIlI5sr5PXzl5fQJ2bUockSTJMCDgM
 KC4R74ydADiDodNn2blwil4WjSemuWob6k4u5kIeNOnPHiChn9Q5WeoxSZD+5FvS4KZxEldXYWl
 OzW90FnZ8zjTZMoadS/feBKW2xok14T2tkJWNCH6PIk5HiDxI9Qbf/FYUOCYalde1Q+m816h89e
 zgeQmpjYZ18yopOYjhH0A7KU1S2vSo7+/aUQXPx6O+Q50lct8V/aY0b8fzaKfOPE9lsGS9u31uR
 jZR5P9BOdNwefc8tXeZ86eTpb64PoD+0AV6pD8i1yWk84xwoJ8Mo0dn08T53k7Heg8xPOPBTjFV
 Z3MBt3PMnowR6HjW2RyML1NN0yvVuXZ51nE3gObFZ3RxOz6eIgOhTC9YFBZxD4f/bQdVMzt2m/W
 7V/Lot/ejM9+PcVBO8OvTG0nW6B4WQj+P0xJNJE8ItQ=
X-Received: by 2002:a05:6402:320e:b0:6b1:d841:deaf with SMTP id
 4fb4d7f45d1cf-6b1d841e0e1mr11391427a12.24.1792076160471; 
 Thu, 15 Oct 2026 07:56:00 -0700 (PDT)
Received: from ?IPV6:2003:ca:3f0f:8b00:6e0e:d1a6:87ab:6860?
 (p200300ca3f0f8b006e0ed1a687ab6860.dip0.t-ipconnect.de.
 [2003:ca:3f0f:8b00:6e0e:d1a6:87ab:6860])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b20386327csm2514421a12.18.2026.10.15.07.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 07:55:59 -0700 (PDT)
Message-ID: <727d00d4-c3a9-4e09-89b1-98f3bbfbf93d@linaro.org>
Date: Thu, 15 Oct 2026 16:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/21] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261015122151.889017-1-clg@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261015122151.889017-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
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

On 10/15/26 14:21, Cédric Le Goater wrote:
> The following changes since commit d5b5083cb783c447001e862c2b525e59f48ad78c:
> 
>    Merge tag 'block-pull-request' ofhttps://gitlab.com/stefanha/qemu into staging (2026-10-15 11:53:41 +0200)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20261015
> 
> for you to fetch changes up to 4cf1f0e37d9491eb8b0c8be8dd9dab9260b8fa36:
> 
>    tests/functional: give the set_machine probe VM the test workdir (2026-10-15 13:14:09 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Fix OOB read in HACE has_padding() when padding_size is zero
> * Allocate ACRY RSA qtest SRAM buffers on the heap to reduce stack usage
> * Consolidate OTP layout definitions between aspeed_otp and aspeed_sbc
> * Derive ABR and secure boot state from OTP config straps, removing
>    the "emmc-abr" and "signing-settings" machine properties
> * Sort device IDs alphabetically
> * Add I2C test for IO expander 1 on the AST2700A2
> * Update ASPEED BMCs reviewer list
> * Add a create_unimplemented_devices() helper and convert all Aspeed
>    SoCs and coprocessors to table-driven unimplemented devices
> * Fix the set_machine probe VM to use the test workdir

Applied, thanks.

r~

