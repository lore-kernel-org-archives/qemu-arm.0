Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD1606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cgMlw9cb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSoz-0001WV-Ru; Thu, 29 Oct 2026 12:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMSoq-0001Gg-DP
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:17:38 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMSon-000158-L7
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:17:36 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-85ac281604dso1245082a34.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290652; x=1793895452; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=P5X4qZfnVS/TY2lC2As6mqHNcdxtEQ3uCFZzF8qH/Rw=;
 b=cgMlw9cbRgHBTxBTuOCxJcC873n4pF7vlnEhuCi+1IgZ7RuXkUCE9TOqQ6ur4ICHK1
 znagQUrgp/gOBdngzB2hoGwtutdgND5v+8c/Zoyxf6pYJ+spePEV8WC9L4Cj/ydudNEf
 sgR9r0ypAvdpD9migruMw+J3t+tDKVmEk8zNotcpMftx3Lw6QmQWMD4NUMOyMxPURf+x
 BYNCxbK9vdmuz4QYHj4tbz/r1LdZSzcdyV+IEHvu9BUIS4fyzGSXOXd/PoZjQfpzLgQ3
 YDX660y9rc57tr9szZlUYPlf9Yuw3GE5g460i0zHmXvKjUVe9TCKiDqdDGPxjKA2xkBG
 RbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290652; x=1793895452;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P5X4qZfnVS/TY2lC2As6mqHNcdxtEQ3uCFZzF8qH/Rw=;
 b=GZJw1/tSD2rYQE5a5pbveLMMbGW1MHHYgDuOvTCJfnDpojm86TvFKfD3f8Dj+6ckHa
 tOuf2vcoYpf+JxqeKkCOTXc81r/iuABN0yGPEPnf7GvxfPeudIi++S2OjGHXENbe74Rk
 7MsLyCnkSa5xkTZchBUH6VpDia4gc/nuy/DscngBD8MpmoXEF7LwAnJXiDVNyqH4359G
 oJrJBQxOOP4LW3WY6Cv6YNoAvfi/qd0xlKkaj8UEWRSYIrFn4iJGm/DYuvejoLV0Zim8
 k/SYZen59fc9Uf0SEr+06mwylGk3rh91G4A5IVitzF4l38UDIXffHM7fv20fwz2qFcmf
 +NaQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9OpBKnNDId06oz2+PD5An+tUbFpHpbdxHX8mYBYFgYi9v3YH26YvzFnUuZVDOQf+DLKwylSjC5Q==@nongnu.org
X-Gm-Message-State: AFq9FYIR7yA/U8//Jp+zsfD09OGlk6Jona+5HawwMqFkJLCxj4XeBXCG
 g9nou1HFDpwI22JXcgrPp1EwiQv6lMOQ9+x2cHU61gyyvjGTPTLtE9B8cTCviM5bEC8=
X-Gm-Gg: AYBFou1SreHMSMv+fvp+CzJ5UfLt1k4//xutsJz0HeRoFlfdDS50WoLde0AOt2BvQZm
 tkH93bv/oEbvvXBq+D9ECuAnl4fymWKwT1nDI945bunZUjEVDj8qyKmHyVUgwAHB2Nka9VJO7+9
 73llT7vK2BLDPbZuvNBbTD6AR62HKBWoV7wzgnnEe01fw5bfl7v+RgFGIMy9JoNvFcaDuzMenF6
 3s+DxekYmXifoUOgtYcD4X/CwK4dqWdaI505ImZOl2+vp7C4mirkFtwSkl4sPYTqXsWjdH/Ul9H
 Bu6n9To3QgWuVW8XXmdMYbQhZvl9zf4dIPmvHIAoTiCxXuxaQ16HJK3PT8ob7QOQLpZhq7b2fNT
 6Hc2cxaQ02MoRgq8MHtsaRMA2I7Z72lUByaFqBWfNqpm8VN4wJt04TjJ9n4WFCVUAmNSpkx5m49
 ZDbotpmEka+3qtkMI88mnM+9+w/2bTRba+PkX7qJarSBT2n4ktylZYAK4EwVLaoV3LEGiutjZ2F
 0IBUsV5bGJ/JUD1gvF8QUMH1kWgmZPQLCUcH+oo3dlWsYLBfnSqVlL44pBf4aegdKCX4IPzWQmz
 iJ8WxC9rB3LMUaOzuwfxAV2IYSeKAqpTI69quqwITYeX
X-Received: by 2002:a05:6830:4ac5:b0:824:e29:e00e with SMTP id
 46e09a7af769-85ab929b937mr5764081a34.20.1793290651815; 
 Thu, 29 Oct 2026 09:17:31 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d33e3696dsm303074a34.1.2026.10.29.09.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 09:17:31 -0700 (PDT)
Message-ID: <5418c6dc-9de0-400a-bb0e-528d00ccb21f@linaro.org>
Date: Thu, 29 Oct 2026 11:17:29 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] target/arm: don't pass env to the sev helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261029161310.2065290-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 11:13, Alex Bennée wrote:
> It was pointed out during reviewing a recent fix that cs is only
> needed as a loop variable for CPU_FOREACH so passing env is just
> wasteful.
> 
> Fixes: d238858bff60 ("target/arm: Implement WFE, SEV and SEVONPEND for Cortex-M")
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/helper-defs.h   | 2 +-
>   target/arm/tcg/op_helper.c     | 2 +-
>   target/arm/tcg/translate-a64.c | 2 +-
>   target/arm/tcg/translate.c     | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

