Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AFBC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woius-0007VM-8C; Tue, 28 Jul 2026 10:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1woiuq-0007Tc-EX
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:36:20 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1woiup-0000Or-3H
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:36:20 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2ce98cb8165so12567475ad.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785249377; x=1785854177; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=z1fKNYQj1ESEyhFzjEyP+RS+IHrXPrXc7PmA/uE2UU0=;
 b=wv5/jzeSse2EUQy4G6RIvAothhtFqEKS3Bc960503I4+rneWEgrA6+4/FRKLx6fStN
 rseOxwPGOnu3s4yEvwCyzfF7znvs70vL8Ck+xIduqGIfQTszUGQ3PMn4TIvEcR0vf6RE
 udxXWCp9nsA+MChG8VmyvcpySp/8WQhbfuGUpZDvoXr7cQ4OgS8Su6qKtUxg98GBw5kl
 yrThs+xT7jL7H//HMZXhJzqEDhNl6ky+AmhoTTI3fNPPVoSl0I6BRV+bctEOLvfDAe2H
 VmaEi2TgMVn8AN2XA7HJXGVmO6lM3nmCtRj4GvHn6md9TuzgoKlhq8ooOrujD7ehF8xP
 CGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785249377; x=1785854177;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z1fKNYQj1ESEyhFzjEyP+RS+IHrXPrXc7PmA/uE2UU0=;
 b=DL5Dtcv5ZaHHCEATzqXDfLQ25y41gC30m2fzgGiGu6bTMcVSCEFn2G6EUav3ycKmGT
 qpmOfNubSxRz0vppcKF9qS9rblz70R3oCddN5K3PIdpa/YNU+V9jLWZxLy61TQoD7Xj/
 8lKYU95PhmgV/DYB2TVou5QglqniVaDygzhGHdmsoMwORvTMrpn37zSE+KvJAkjs8z14
 0LQ84Un2UWbyGDGT9CydR7rY78xKWAk5PjP8Mf4CaKZNoIEkLoyP77BmuA5i6j1NdN2+
 A48nMZrYJDnSURPK01dNdx6KaYIOXosw0kL6yiRLE7pRYOuH91Vg5t//zoIiKOxCwZW6
 Ip4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrxLcsMVqeCRACYG89pDvfTE3cm66rvb/YQwVAI5t+Nai9cbXEsD+DVo9hyTkP3so0q/IBidvqzGg==@nongnu.org
X-Gm-Message-State: AOJu0Yz/rZH2vEAsmTktWt8yRiIE84s2excIydFgiqZFRzfHIlEERNjM
 M0eEXUJarSmhXFiAszXj3hOgcN2XvBo4hGrsYmEmjNRLCv5rvk+LnPQg4xvazio1QEU=
X-Gm-Gg: AR+sD13lDGKBs2BB9WMyn+I4rKOPV6KRk7B2yQyh+rfk0XFx9U3YHftrCyYcipvMkIr
 4VB3zNygfDyDTvT+nlPfHc1RccXA24Sc1FldBSSKJFi8vOd2DwpnnpU34/5w6zMOgOBSiD4Q66l
 J/61mINERZnfUHOcjL1Ncw/CHSfD/mKK8+ip3CbvJiTUEiE9OqGaB2rKQYW7IEvUUe5tm5gznDn
 t3wLTN4bypAI4aDaoJJTqScldbpr4XjgL0sdt08rUZvRhi64DZssyBhDLcQKsv+jUkxZqiZ4MrT
 a0c6aKN87x8G8XtORIJxcgfGf3fKZltQrf3qA543S13OAhMbMzxnG9UJXfqfhKckDMmfeob3S9t
 wZG1++JRTXMmgvZWsoRB+aSZ+s5cDZdjOu6//RvXfGT8rIZ9voZW3dobYcItOJX4DHTiEhuXPWL
 dhWuQmYEnDZ57snm7trw21waQi19gYP9K1/Qkm8QCxEw==
X-Received: by 2002:a17:903:184d:b0:2c9:994c:9a5 with SMTP id
 d9443c01a7336-2d015f2d2fcmr28985275ad.30.1785249377559; 
 Tue, 28 Jul 2026 07:36:17 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde7bc47asm53359105ad.41.2026.07.28.07.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:36:17 -0700 (PDT)
Message-ID: <97a1e33a-27e1-4b0f-a880-19358bcfa7d1@linaro.org>
Date: Tue, 28 Jul 2026 07:36:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.1 3/3] target/arm: Remove stale comment about
 WFE/SEV implementation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260728111629.1705308-1-peter.maydell@linaro.org>
 <20260728111629.1705308-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260728111629.1705308-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 7/28/26 04:16, Peter Maydell wrote:
> We forgot to remove a comment about WFE/SEV only being implemented
> for M-profile when we added the A-profile support for this; delete
> the stale text.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

