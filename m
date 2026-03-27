Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1104410A88E5
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:11:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w67u1-00080X-5p; Fri, 27 Mar 2026 10:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67tz-0007zV-Ku
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:11:07 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67tw-00065b-Va
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:11:07 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64e9f9226a7so2367031d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774620664; cv=none;
 d=google.com; s=arc-20240605;
 b=SXxxKDH+opoHoI8JP+PCMb6Pg1rtY/jI6+wlG6aRpLv/zMv2cnXrYCmqgbhcw7AnYH
 LvEq89feuq3gdVTe1d8R5fATiMBXUxrMUyW+eaEov81UbZsbUbKr7eb8IrXKh7u7oDoS
 nArASoqeC6viwGRwWBtdyiUiqOECeNGWU3sMRN2pHzdI15Yz/8pqwXnnME4PYxqyo0PY
 vWJZ0+J9T66fq6YtD+YyWmtsG4PzLxGJ/dTfM9t1We6RJczVWIceFP9vq+CNCcgxtA+F
 h8lvOkh6l64q0sFb7POhtkrbqwT7zBwRQp4gR8ZfyI8O6ct4vSTYIHGjViIln1j2KmQK
 xBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=yWerNXa55FoGg8UqFfKxYXxndTZQ6MD9X0nThJk+MDU=;
 fh=38ePKlGWNzfpQ3h6coge6n3HCPOM63SkDmEa1/TfKno=;
 b=dXCV2L+Khw6DTsTg1XJGLeJlw6BggJIl+voowKMCv/DGq1snaGXSI/WcrjQO+oRvRV
 0oTkMdTSq5X/ZuzmubbB7AiZKSmHAMkFjBefxD1KflkOBKVBIh5LS9sOiLlrhbYY8ArE
 mKl0IrZUtOMrLIrfFrJTQRYkN00TQxVm+SlztxWl3Rapqpwi4iNUlkVL+fAI8BdBK46Y
 9mTOW1yo+jsNYlLLMO24k9Wa7sNMbfYEASPUArHyWNzSeBPp6dCjkY4aBQbfOI10t3fu
 GAbDJOYT9193rfJoxqMG+qfqZ0y29ui7AzLkxUjE0vQUcP2239zMQ7li7vv59dgWHkSj
 zBbg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774620664; x=1775225464; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yWerNXa55FoGg8UqFfKxYXxndTZQ6MD9X0nThJk+MDU=;
 b=b5/dHR128P29i8dF1fnQPGn9Ua/IT23mS+JvxUGN6F1bnjtV9cO7fQVqGHLkg3/f+5
 Pa+8OoUrzLuGyE77U1cu8eXzKu7lvYGti2PSHBebudcrqj8xPaUyxeyHLEQuLQ0BV4xQ
 BYEvlnBgeExII2AW6/hXj+N7q/wc2IQWrToWqdx+F7tQ8fF2uvTxxs0nC3uD2UdAu0w6
 XVaUSVeA0Psn6qMmgQR38BbquTcbW2ImPx7x0e4cQlGVS4SldSrCwB32DKADfmlqogOo
 CXJ7z+Mn9knkBzYRrLJtsCBdr4V73B4bw8gPaKUsa9wv0Gp9mJR7YBBCiwDr5Ochaqjp
 YYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774620664; x=1775225464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWerNXa55FoGg8UqFfKxYXxndTZQ6MD9X0nThJk+MDU=;
 b=hb2R51m+V6faZRmSlIKGREUoAryAXCHnoNoSHGgnuBBxJhoU/kQ/5QZGO4QNyDikSA
 7tscdaFTNS7S427vJAin2iGlNEJA6oXCexw0oeq6u/hZS59+GoLVEQRm9U1xBW4SvmZe
 sU8lsyKOfWURw1W+T8YfBkAosmnBFS9pofBl/C+6NINZwInztXBfsNs1gCgBPqHoYZbo
 qTCJsrw208adymepWRVm63uH6BOV6teO+g96ArhwBjAtutIUJ0Uihsntw9DcJ28rAZhe
 DT7gfeODC7efQ2BPBZBLBstcFDX4kTy40FtXsRb5759Jtou4p+ztpznwZ5n764JDSpmP
 So7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfoO6qwH/PdMsHa93ukuk1hqAIx9BBU9Tu3TT592wA6gog8g1E/NA+P3u9xzfZ22raUWz+5O4C2g==@nongnu.org
X-Gm-Message-State: AOJu0YyKw9GQ0qDrOV5yEMZ+uwdypGBWRae6EBUzESGs63hmrOBJN/Ay
 OagSTKtHig5RBi0IbqebS4LMMSimPCIT9T/5a5NPEtBFVJDccs+dbpyDH0Djs3qm94LFRTfxZw8
 xcCY03/cly2pSygUK8kX5xJOzaeUX11m4nlTHn2tjRw==
X-Gm-Gg: ATEYQzxVdv38h3x8WLUtcr/t1Bg++2N163iADaou/vFJWpjL5l+EvyHuV996w4GUHBL
 y0OgJyRUBfr1vYNxp4hmE+fOPrdK3GDfNZTcDn89iwVo1TD3O716/UE99QV3pFBUv31uiHIXT0i
 q9cZPlDT2O8pe/MNFh7FE0b/85BrPfJgjCqJphf/mGW6rWu/Pz1B35jgtUTCvyeygpnKRA2Cind
 /D/ayHhaOWtwR/MQjFl7T31wOFR+q/O10to29Ddbmya8H4ElYQuxTH0aF6Lv93qA7aCBnsbGnrl
 DS8y1fs/KaXXK9E8lRkaCeCFxat/twZWNzcm2DJQ9Q85MHoyeozZ8IWpi4vhqmJB8uY=
X-Received: by 2002:a53:a50f:0:b0:63f:b9b3:9c3 with SMTP id
 956f58d0204a3-64ff720f08fmr1735404d50.31.1774620663398; Fri, 27 Mar 2026
 07:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-2-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-2-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:10:51 +0000
X-Gm-Features: AQROBzCjIUjSFHkDPFtUrdZVMFUY3sr0ofDX50lkRJBlZpHp2XQmoCuXEF0Cnk0
Message-ID: <CAFEAcA8--YTs5rbeQSUZ3N-uGTcWjeOU2wNe8BY63tk_PmRv2Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] meson: Use stddef.h instead of unistd.h
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Fri, 27 Mar 2026 at 13:44, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> POSIX says stddef.h provides size_t, which is the only thing
> we care about here. unistd.h can be missing in non-POSIX runtimes,
> so include stddef.h instead.
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

