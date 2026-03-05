Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B007BF513E2
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:16:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGzn-0000YN-O2; Thu, 05 Mar 2026 17:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyGzi-0000X9-1F
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:16:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyGzg-0003Q3-JW
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:16:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439afc58ac7so5563515f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772748989; x=1773353789; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ebZOB/cgjse70HqkBuSh7UhPJC61LIbOScMXnZGf/78=;
 b=bN7JXtqsE+siV0pCKzGuFSzUjBysAJ+OQXkCbvEQxYqD50SGS8siMIhkBgoj6gBmbA
 mG4skZWmRQZxV9LBDXKtzfDZRYmlS/rVvBSFwWfkwbUlY37J7UApm2j9nv6i2+O9tbZq
 OnWhZa8eCUoY8Vv0d5NxiCVHoE5d+bh2DZQmtzl+z5Oa/4CIVrZkWFP4VpH9oMWSHl6P
 aYs0lxXFQWhGJFFUtz333VoE1oevHd3iV2fJxNOVztLgzY3Fc0KGun4gV3ghqfEy5mUM
 9dd/ugLedpgQ34Ar9v8hF2dxrleLXRLsnyknlP4x2Z1tmFkdDrwKM1/iz6mH7r4WzLwi
 eeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748989; x=1773353789;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ebZOB/cgjse70HqkBuSh7UhPJC61LIbOScMXnZGf/78=;
 b=h8f8R9tXUxCibdRNTEQcKAV0FGQ9UrjObOo9FIPBVBc25rwSAEsPzb+gX3ejjSQSqn
 8STZLpMWMR9n1eqCMaU+ma+To1cs47VPBpB+1TYgCh21iwdv3Ghy2ucPC9EfBKSJf/GX
 h5SsArWH7BsKerB6iUDoCuvTEVWSi2AcKIL6vMIc745hZA/TG1W5AhDWyTx7FENcCQBX
 Nq9Vp2XhyXOlHE/9gzTma+LTe71Z+0BbTK2rkv+lzmgup87xBgW+Ums8fKYLhCUC5/aE
 Q8r6jc4M1KQbanw9ejb/2pDBttHoSyDqnnQI0p3xETAeiIuXU1Kf2HW2hM2+0LcQWUWa
 ERXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEDdB+mObyqH9VRza3auaEtdUjvV+0RwNEwYa57UxZIbD4fJL4ZPRZmQ9NoUYSQjQTVB0lGDZfdQ==@nongnu.org
X-Gm-Message-State: AOJu0YweRYPMNXy/IbE+2GAOJxkkolLqePqELTq3dmUvb2OVtV2ezF+j
 llbrksQjp3Y+4cx7V72BRcGakTkqmUQbIccRXNtKpguUeHX1uhs1FYSwrLIzgsd+Zxs=
X-Gm-Gg: ATEYQzws7yiQpcUlu6v5F52cJZsitg5NnaDCDZmCU6FEwCpeBxnIOFMmcl6fSIpoGkr
 GPvmVym1y0Cf2uuofcY9JVn4xtZkvWhf6Nzg7SpZTwiSyXdclmg57KXqmCUQ/nYBm6axU8zoqn3
 j5K0aILC9ckLslpuaA3NANuoXIPt1WxygEoECD6km6tBUxnRFSema8rqYqodNKTFBkZG52rqC+L
 LlJbaRnJ00hC5S7KW3dS+1Qpmqs73vPG4Gz3OExoriX20S8e7UicVzDu3qFJgSzaiRcayUMOzDR
 s/uzGVlnr0C6lxvPi+Nu1sXBOXM/dPRDXNixDD/FVmxER6BDQOwcGpiu6JA434UrPeQBQpNR0lQ
 +p5PuCNazI8gdJ0SFoBhFFNQiVcLv2z821+u43A4Racw8k81z5WXPagHG4K/I/hDJDks8mBXMAy
 Q9Gka68ufRO1vkb9XviT6iNIfSA2yhDFKeasT0xcg6dWuywassKq/vpm8rtOiuhSMP2A==
X-Received: by 2002:a5d:5f50:0:b0:439:c157:2577 with SMTP id
 ffacd0b85a97d-439d7247e84mr2620092f8f.34.1772748989115; 
 Thu, 05 Mar 2026 14:16:29 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abdf5430sm42495137f8f.5.2026.03.05.14.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 14:16:28 -0800 (PST)
Message-ID: <e864dcac-2b91-45a2-937b-8762620937ba@linaro.org>
Date: Thu, 5 Mar 2026 23:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] util/fifo8: Make all read-only methods
 const-correct
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, Troy Lee
 <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, Helge Deller <deller@gmx.de>
References: <20260305220911.131508-1-shentey@gmail.com>
 <20260305220911.131508-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260305220911.131508-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/3/26 23:09, Bernhard Beschow wrote:
> Allows these methods to be used in const contexts, i.e. where the parent
> of the fifo itself is const. This is in particular useful for Rust code.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/qemu/fifo8.h | 10 +++++-----
>   util/fifo8.c         | 10 +++++-----
>   2 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

