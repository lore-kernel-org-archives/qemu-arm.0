Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A72B606A338
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PyUaZZnl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJXhX-0000vS-V8; Wed, 21 Oct 2026 10:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJXh0-0000ne-96
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:53:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJXgy-000519-Is
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:53:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a16af2a232so5095175e9.1
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792594402; x=1793199202; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7EnR/xdw+2rpt9p2GEJ7njqFf17QViPNRxh1tNDqVWY=;
 b=PyUaZZnlVnuXvf+DhqPNaMntTjcR4YGzvpniKOciS+gVUydRcSjrePTCbQTKbCbmlS
 68QlqO6piwl/sn2BowBR8LXKG2QNZRBbLe0juq8CdHbOM/iMWB4jmTpD4HcNqC4JXfeC
 v9/pPOZ5TuAYzLRjbrt6uQKimbl8N9DB4ugJuClZBlh8BOwMijqw6l9WFwofSz9DJoiE
 /DzIqf3mvzTgabAeglosP+wDgO/sYVM2Zje3hnuocyHNxWBOARU7KyNd7GaHTEwVuwem
 WWpCQrTDREgUcOW7EVGo+4VPfyGw90HiJL0syzjl9Jco0bwwfgZ6X7Xbs0pIf8MOsi27
 GwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792594402; x=1793199202;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=7EnR/xdw+2rpt9p2GEJ7njqFf17QViPNRxh1tNDqVWY=;
 b=2fIjOKuRoMUBTSjyFuX0ekgGrzn/BUd8ZjjGYs2/HVoOn2AojrLPJzzi1XLhtzIRDB
 zXl5IkRBHE8pR7n7v5z5w0jAqUl3NP3DVfJkHepWDVhx/qC+Q65TfnVkiRybM0XMMIdt
 mqCk9GAQ71wJJbit49Y0IeToWRKrsPnBPMJ0Mcglzq8rbavDE1kT7Ta6dVIG3vyHfpIw
 IxKIHp9/F9lvnuF2FZXmc+K7CGSI5F9MATHNs19U1icQDMj7EemzOf7ja1BlY2sDr4MD
 yf66di8SM5t28iQDHlkbnKIXS4xaINKJtaoZI5KTIvd1cErURPqyKvHOhMymoI/zZro5
 RFiw==
X-Forwarded-Encrypted: i=1;
 AKwUvByezov62qNkkEwWd6/vS8hKHAg+w2IB1XklGv0NLFiYqJKgPJDzNrfzvvzWe9ocZwDJUQ20Gfb85Q==@nongnu.org
X-Gm-Message-State: AFq9FYKrBBQBufWGke9q1rFb5LGn8ubAkpbN1aTS6k83JGtn5AIn1LHj
 eTDlD2Ziv7+EQBiXWEEdsmIVP5CoIBoJ/DlyaCxybgpYV4thc9+Ch+WokanjUOreHHI=
X-Gm-Gg: AYBFou1WjUO/539pKsX2CRVOblDdXwfnjtN3zNe8BiOTz7mKeEBbAm5N5fqDK4SkOOM
 ygtYTiJtdrVL+gBbCgG43nClmBzy3YN7Qlr9PodJRhZgYynAndAU+HF+lUgyTaGgT8VJFKbAX4B
 ELzxV2y9QgSOeJ5mDHRPxN6Uf+5MjBg5Zmyjxvx/SupJBY+UbhKhcz1x1/EBNzHbI9aih4Be+u/
 BAUpsns9ZZZYOO8JAxDri/nay9ApP8LS3masEvYtxvCxi41VguAn1AmqeS4MEPXn3dvprV6mOiR
 t3ZYWQKyrSIufvKv4z+0IT2j6dw0Ig3d7NXDWN8GdKKHNRI3EcJpIjrkZKKCepbmSp60d/509uq
 20r0FWCVj5zGeE/e1FkeV2WdSHj/MNKmeLlU0QbvqpMv6hUIF5WkODss++KzKtLMu2MeoJjrMMy
 koMClWKTzK5Hevc42DtLcinuDV08CI3K/uyfp5eH0Ls/VOcSGRMe58rK2Ix4Wu8do0WPspzryFn
 F07dJVZP0AW4aS3d7QBpd2aQMOb0jwgVAqNcC/K0KmyfP+7NJo3PQagp7EIfd70JF0fzI0csum6
 0Qb2Yjy1RLq4bobFJHbWxIdOotg=
X-Received: by 2002:a05:600c:34c4:b0:49f:ce78:3562 with SMTP id
 5b1f17b1804b1-4a1fdd37971mr54147835e9.19.1792594401947; 
 Wed, 21 Oct 2026 07:53:21 -0700 (PDT)
Received: from [192.168.2.121] (pd95f64ec.dip0.t-ipconnect.de.
 [217.95.100.236]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fcd13891sm39281105e9.2.2026.10.21.07.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 07:53:21 -0700 (PDT)
Message-ID: <76978043-aa2c-4bda-bf4e-551b958f0606@linaro.org>
Date: Wed, 21 Oct 2026 16:53:19 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID
 state
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260914160020.327787-1-peter.maydell@linaro.org>
 <20260914160020.327787-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260914160020.327787-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/14/26 18:00, Peter Maydell wrote:
> When the guest writes to IRS_IST_BASER we effectively cache the value
> of the VALID bit in the GICv5ISTConfig valid field entry.  In a few
> places we check whether the IST is valid by doing a bit extract on
> the register value; switch those to look at cfg->structure instead.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

