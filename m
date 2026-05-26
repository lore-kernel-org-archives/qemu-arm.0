Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F634CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 20:13:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRy8a-0002N0-HN; Tue, 26 May 2026 16:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRy8U-0002Ja-Ej
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:12:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRy8S-0004qF-Tm
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:12:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-44509921fbcso7048967f8f.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 13:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779826339; x=1780431139; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nyD8wheZIvqh25sa/tavUVwSj39qnoEY9Y5OoPgjPgE=;
 b=GMEVlWDiXblGldiAtl7Hcm2TjOhuyKNnPP29tIZjmaNTbtA8Y7Sm6Sxtwvq7aLtDsM
 bNkl94bwL+ddaY811ZRxAwcl1BRSHeiPPdwU46d5TCFHDIoD75QrtWV766g627rzmyTm
 TQ9ASigP2wtkzK6XGrBjgjDVgtCYD1qe9GrdkK85QuH1EPlOijlIFXzZeXM1Xcxwx0dF
 cukEVay/jUcovb2Y/cF0H1DbAOWkOBqKuE8taS6XvVWJG/hpfZLFs6dDT7IptFXlr8SD
 iAw3Pl5tZqFWTckE9N8NqQt+XvDbvpiZxDlJO/S2xR76HpZKvGVkffokOQCKhBc5PYmf
 PyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779826339; x=1780431139;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nyD8wheZIvqh25sa/tavUVwSj39qnoEY9Y5OoPgjPgE=;
 b=WJ5tBOCQpyP1xNu1h07p+ZEIx348THhqfl+Q0IVHZ7w5MFrYQWc5ilWC6z5J3utyC7
 eKlCwqxE/qWDEXkBl6yu7Mos/xHLNyHFDOr6HVCipD6wIyasDvPVVIy8TrILX0bW7Va5
 1K+GcAvxTEF8AIxf75S3WU5/1NDv/skRwIQoTB8rTNrHhCdUf4KICJOiryUQPZoP1KIw
 VEbTvSmn4a0l7z7mxhO8hpr0GU/TaeNLYWVP7/E7QuEtryackmXFAoYyDbwnu7OWXgYm
 Xl7ezWC8j5sC9vZ1iP1gKi/mFNa9vRa/ALHLi1lAe2p4lNyECtRBWWyXSDYjocrR9q/n
 p5HQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+sXS/KyVqCojSjKa3mvb+AOTNcyU9MrhdDMuvqbmfWXFtPPMLz1ID97npaODM7FrckqMKEd8bC/A==@nongnu.org
X-Gm-Message-State: AOJu0YziO3bNI+aBDeHyGR5WHYSq1xR6gWT2CD687Xk7PTcnqSHyJ24E
 x8tIk6oZoGl5Ck4fIUH5leC663PkBlVY0xk5rmN0mgkBGkSDgvJwiM3z5sHvutHHs8Y=
X-Gm-Gg: Acq92OG4X34irfrTmoPlu4n8smRLxmap6uHBFNtJF5kRH6RMuw/hsjbASKplm2Der8L
 MNR5tTgkNriH792KCC3tW6aiS3yiIs9GznYvptNYLxV2lY9U+JeLmUwWIaUQmDyj5MXvQjc3QX3
 ZOG++Gs4UhxnmDwSawIRcngZg76XRTu82bcEUz3hocgR05aKD+pujKPWAUIJICRm9MMIr3U5XUQ
 RP456x8Z7hG2O+5auQ9yppD17dWZWjY21iLTiP6vQLuN2UKsQ7zFSJdJrKivFWgxMP64dyzvuMB
 j6V1PNhQ1JjLXJ68b4+58+Pe0SwpmKD+wJKhtltQ5JUkSMLxMWCx8dQRUr6TkwZtTHgVX1qBndq
 UueG4O3Da1BcU2u5f+fXrHU+rm84LXyaLc9SOFqGnGcZYlEEcXaD7BiPjETpO1nOf8oIvh4IP/x
 cJI7Rf9Z8NwYw8J4rlpNyqxSM99b+4VqZtMF/I145DqyqWiRc+4m4t0EhDxhAd98a2/g==
X-Received: by 2002:a05:6000:98b:b0:44d:821:1a0b with SMTP id
 ffacd0b85a97d-45eb38a1692mr32270631f8f.29.1779826339030; 
 Tue, 26 May 2026 13:12:19 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5c44e4sm555745f8f.36.2026.05.26.13.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 13:12:18 -0700 (PDT)
Message-ID: <406516d7-7de5-4876-b40b-ebe188166cdd@linaro.org>
Date: Tue, 26 May 2026 22:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] single-binary: Make hw/arm/ common
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260519144553.91483-1-philmd@linaro.org>
 <CAFEAcA9_RB-VjLuy43p5kgkvXNJPa=WyADocKLxRxve1rFq-Ng@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9_RB-VjLuy43p5kgkvXNJPa=WyADocKLxRxve1rFq-Ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 26/5/26 17:55, Peter Maydell wrote:
> On Tue, 19 May 2026 at 15:46, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Series fully reviewed.
> 
> Since it's all reviewed, if you want to take it via
> a single-binary pullreq you can have my
> Acked-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

> 
> Otherwise I can take it in my next arm pullreq, but
> that might be a while as I've just sent one.

Unfortunately an aspeed pull request got merged today which
also updates hw/arm/meson.build, so I need to respin another time.

