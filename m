Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4BFFDEE45
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 19:01:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFzIm-0004RK-Aj; Thu, 23 Apr 2026 15:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wFzIj-0004Qt-CV
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 15:01:27 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wFzIW-0002uW-IJ
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 15:01:14 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-6501547d7edso6491698d50.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 12:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776970871; cv=none;
 d=google.com; s=arc-20240605;
 b=h7AKeFxGcoqGI7R+00zjw4oboaFOiXRYT9oI2ZILNVJrSOYKQFVBcB4h/piQ4VQSC7
 JXlkKau3LxG2IEhlwrtCUTW2NCwqc1Tb+i33rq5vKaXKHphPqgmbIZzpicdZAavh3E6R
 BRFDIIMBp3/cFeN3sT8EB3UiurRo4AUGHZAY73hpurumKQr4V+0JfH3fV5VcxiIrSumN
 gv5K/+7BKk/WFxi7q9q3z//V0lBVpNsuLJRvXZwV7Nc1k7m86p7eD1hc1aHbY7i29NO6
 nT13tWtvn4DtzqbQAtH6ScQ1u/tn2fYKwF1Gw/fQ+Hbjqvm7rFMJ67qQ7QVxuxqZcIYB
 expQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=M9HZqcM7NPebMy1NK9QiRhtV6VngaRi3FKGJMv8/iHQ=;
 fh=VZbZkXl6Gq11YXtS3t3xQNob5KuHNCNBYyH4I2ezVyg=;
 b=SAdO9CPrsJ6pLv1WGfdPbgiBuEHE4TEejE1ST0dcfhawU9phC1kBfXcrHlWJey3w/Q
 wULL75cPT7jnTkGj69Fvx9oed0rKbgHTr68/r9pVnP6ZkW6Xi4mSKOT3sfJBSruwMnDw
 qiwCwMZROIbSb+3uESeIfybzWQs2EEvg4dFq/7MOzjvz4YEzxzTwH55ahV2x3nIpWK81
 nUIP5gTgoPI/zypQW3XzHuErEVMXY6oyseS2f7UMxpC6jqqIBYWEIdFuQgSW+/CU8qRo
 tVGCkX+u6IvZD/f+m+L3UflA6gq4/89GMDkWChaecaHgJIXumqCsGMnOwVKNgbIa0afd
 kjFQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776970871; x=1777575671; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M9HZqcM7NPebMy1NK9QiRhtV6VngaRi3FKGJMv8/iHQ=;
 b=wjPWIego1k0S9joTYedx5Nv2+alnMFUhJOrOu7I2CFTZT7avn3JO4R5MEs0hY3QgY7
 hE5VmJ/nWtQqePUcY6NXljNM8tIMLjmeGy4pYLOQnhh4M2jzGqWTu/vyGkTNZt722zZz
 +h00qqndy2s+apH2qLaPzptFUPXvP2DpMS0uTa9J9LlPWlQusH7UM7YdZIOnxPn/mbTk
 5RioZE0Wz2xkEJA4rcq06OzsJoBTNnSPU9KfS952JEwAVeb5WW2CkKEQoolY3Ebj8sJn
 Kj7es/Rz81KsCcF9tuuN7yd7qjc1LW1BRo61RK24YeHcNSgC/DtA1NZinD2V26Nc91Ln
 stvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776970871; x=1777575671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M9HZqcM7NPebMy1NK9QiRhtV6VngaRi3FKGJMv8/iHQ=;
 b=FIeu4dh96T2LOuKLZE1SZHNhh7ceBP53FQ98laQndm/qE6YMCqkYhkKaivqO2LVNPr
 4uqjcP394CgnKMY0F64eIbEe0Wtd/9F4LU8qpSuJNg0r8VM8I9nCaa8OiRZDBbghU7+q
 h2tZUpNysrvZNJAMyBGNwKV/kk5vcxoQy1yq1RTB4aoXxEJd4+DXTPEsjZ94KXxkJXx0
 jWPtEzSXB40EZWs4qR9VYV/QmcQ6sYeUz3oPNKCx51vORIcGNCnUpjKfQJlBZ7QgqodV
 XS5Ozgi4tbrkM4AXJGooGgYn/nRJWrENQmejmIzdJHVsHXudFTX1KVsYEDM+Y58mUfQS
 uwBA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+VndSnxXPsg3/eyodfyUKBdQivvqv3dnXzlZiO+PE63CJSx2o3uUktCLYCbjzF5LXxhAgeSplKwQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzy7HreT4ordHa5HhqFbrcR0mfU1ge5Xx2O+T5yUH1qEFfiK1c2
 Omn5ox4s85/a5/vwqLbCylowj+ZKCH6wAwdym7Mroa120UQX+7QUPH4/1PQZEslELygfeajsO6a
 /9FGGBUI/l/bgkUudqSlnEfPXYnQ/WwF4pD5vEuoOL3eS5fs7WI7K
X-Gm-Gg: AeBDievQvY7G26Xb9tMePCK8zX6PRZp1j53jRhSVXWyaw4zIRAmysxrnFeGV/6/JLP4
 tPtH+bYI56rAw/AtruzJjczJW1GzrxRCOuTQ6YtL4hE4cYfoOLB4JlnLZdz3Z6k/Gt1kV5hSaY7
 yy6RqOkvs+DenG9fM5fVsSc0xHO6zicA+Njlhw4JQ2GaNvLk0lmkvDZsvhUHw2+LdLz5a9oNJv7
 E5v4oy/eMqs2gA0fTJ9B99JOtI71dCY1NuEnO7qfIp/HC/6rDMrk7IJTIupMqzkPiG+j/zX48gr
 o6YLmQLzc7fhI3qMDHsDXzQEoOmExbTzps9Z6MYSWcAPK4z+PYhtc8lW/PbtSJQGxsGYd696s2Z
 3lg==
X-Received: by 2002:a53:e1ea:0:b0:650:36e6:2ace with SMTP id
 956f58d0204a3-65310a27873mr21409542d50.31.1776970870954; Thu, 23 Apr 2026
 12:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260409220614.65558-1-lucaaamaral@gmail.com>
 <20260423180304.53789-1-lucaaamaral@gmail.com>
In-Reply-To: <20260423180304.53789-1-lucaaamaral@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Apr 2026 20:00:59 +0100
X-Gm-Features: AQROBzDtHEqsh78UYKKiqHGSESaDbY8oTWcsFIy_auUaZqkVLk9Ba7s5Qh9ZFJE
Message-ID: <CAFEAcA-mqtqcgMVeNgMawjN+RJF9DsfXvnLw5ncB9fRvTo2iJA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] target/arm: ISV=0 data abort emulation library
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de, 
 mohamed@unpredictable.fr, alex.bennee@linaro.org, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 23 Apr 2026 at 19:03, Lucas Amaral <lucaaamaral@gmail.com> wrote:
>
> Ping. This series has Reviewed-by from Mohamed Mediouni on all 6
> patches and addresses all v5 review feedback from Richard Henderson.
> Patches still apply cleanly on current master.
>
> https://patchew.org/QEMU/20260409220614.65558-1-lucaaamaral@gmail.com/

Yep, it's on my list to look at (along with 27 other series...):
I'm just waiting for my current pullreq to land before I start
assembling the next one.

thanks
-- PMM

