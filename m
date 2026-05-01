Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A37FF885A
	for <qemu-arm@archiver.kernel.org>; Fri,  1 May 2026 08:28:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIjEI-00029x-LY; Fri, 01 May 2026 04:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIjEG-00029G-R0
 for qemu-arm@nongnu.org; Fri, 01 May 2026 04:28:08 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIjEF-0007og-B2
 for qemu-arm@nongnu.org; Fri, 01 May 2026 04:28:08 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-79a60975dc5so20234967b3.0
 for <qemu-arm@nongnu.org>; Fri, 01 May 2026 01:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777624086; cv=none;
 d=google.com; s=arc-20240605;
 b=cFFSUhxDUZX75RInPT8PYSwdihOCPMw2sg9NP8EOLnKuLnC9QTySmp1zo9C6CEJm4q
 CCQYlAHSHgCFM8aaX2A8UIhtpyiUDVciNf+yVVxR1H9De7v8RQau0gDc89TFDwOS1Xop
 7HyT5XXmb6xLvRT0kToOfde93cBcCykf0ibbVagLuR1GbZSvbhvla2iAVop/HqzWyCrB
 egK0if5MfoPDPIluWf3g8KgpXk+8h2mM8iDhlDa9GRiE95fmLybX2B0A0jGRQpbdAAct
 VHdjF+ov92J8qnCmC2Dm2vgUzR1Gg9Zubukt4Awc05rYCLxPlj7y+mnmRNo4jE5UYRxz
 V12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zdQB4DaMRDeYxlRocZwZMiI/ETSV0ATJmp7CBqXalRg=;
 fh=iL7j6mnNyQkgLzXqO+OEV99GV8ED8XR6WkfNpZMZMeU=;
 b=TfYoehvcMyc+uDK8InPddz0XeK1DjGqMJ9mjM4o+SIjQHJMAUDdlqHlhc2t7c4RnOP
 6zbkh+F56ffV77i7cTORHAelQLa4nq1yGaRBGgHpBp62uDNGmw7XzsDRbxQT/FYTQLbR
 yvfO/i7es6crNND7Qsz0oduifFmLCdBa6P30uj33XNCgD+lGjUG0TmdN5mzI+wRj0dzd
 Yhmohjj54PfieNec1isEVtlBZ6ByiwumhlvR1dGb8/x14z1Ny2C31HY/HZZV6Tw9TATh
 gtxf5v0Sx0N1tQfy2TYD+DAGI5fojk+iIJbmzV/98PEZbGXmRlpZkjDWoGNhB0yULuXp
 nmgQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777624086; x=1778228886; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zdQB4DaMRDeYxlRocZwZMiI/ETSV0ATJmp7CBqXalRg=;
 b=JDvOfX3Kd4dy6Lfhwe0ZDkPJMAun4hyYRANkzkrrnLUQKf4kD+NjBOt9482JN5JJDK
 sUhicMT5WGbor2B3quD/TLFyoVRUrYlAhfxv566Bs315rb3T7oP5SLTgC7/CFOvjWknZ
 /uRkGumc2hwbQjYx2aJsmB+pUsS1euaxmg+gVoCS8fHuIexc6jspQSY+GiV+ZIC7yfff
 jPR+CLejTlumpYGPCSgjFdtTwJGA11D8DwqBoRqhawvvOw53Sywtl9B2YvT56gSNXsv0
 9zYtdfqLiNlZcGGhvMRNkG0all03fzSn/Lgvc56sXqTexSaa0pQ7msCqzHN87idolwyF
 9wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777624086; x=1778228886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdQB4DaMRDeYxlRocZwZMiI/ETSV0ATJmp7CBqXalRg=;
 b=M5p8ANYAAX29TVfjWMRBpS37sxZRtUpRwOa2Ynyj2o9iHhYmZSD2uIb2ASiXLzGeOx
 q5bf+RzTTttIDYfT+4V0qbHmU8tGzas6gT4QVj+15BwurJ54+JwvlygiPPo8sr3BFPME
 Ca00OoLjRv+TshwGW/N38z3WswScZyEHDny2C/HH7na7vqn7WtNjG0gtvIN0T0ACDiKA
 3sIexLm0yDUFS6lme2PxtM23yt3fiVHo+2eUjPuuKSo0vNH5FFcJ3G/B7RXwTLmKNetS
 upCWETRH9pA6JjS73dxz7PNNaVIc9CPoLyrs0vib9bskW1XiQSpuGLwTSu6jH89MeoEv
 6goA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ExRXdB6lTIz8MdG0B4wlL59Ni/FE/gozEMLSGUt1y/wJucytN/pgecldSkHYFzVgmaF9viNU8EA==@nongnu.org
X-Gm-Message-State: AOJu0YxMEclYvzSuGvBwt2gcPJD8iFsnH3OMjT8O700GNZro3Iv3NBW+
 YRpYf4PauFgMQi3Nep1tqU/oRXk0n4Z40VooCXI9G46sqLgiLI/hMehGE9TX27/DqafUWdKDQVB
 hHbBJQUkFnBD6HVpybkiyjajGGnliJ9tEF5ht5wqHMg==
X-Gm-Gg: AeBDieuNLLqz583qfqBO1Abyr9PV9uQFRIyesETiuw2p2Ha6lwXqEe7yvu0pjwTobxE
 R5UHEmvrQMuXWj+1GR526niCYwp0puvYNCFRwrClqMhKQlGLGeuIBBbxs25y5UToMEk6i23za8b
 8aXvzaogarPZhkhlRpdQbIqQP4NYqaygAi3ExVEqY8a9ewwZHLrEqRKVknP+F2Jub6ARCpVk/w0
 cvumtIXRL3JotqqRYLu5ghW9JEOf35M0zltfTAxY0hPECM2GWaXf8SFIQIzgrkrqJBlLEubEEgG
 PM8+y946nmyWUJ6rjeYj51+znRd4zRb+2mBywKDE2bjNE8ADPvZG6HXsz/3wkvXJpenaUPTv485
 Rig==
X-Received: by 2002:a05:690c:93:b0:7bd:6432:dab with SMTP id
 00721157ae682-7bd643214a6mr30724147b3.43.1777624086066; Fri, 01 May 2026
 01:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260429190532.26538-1-mohamed@unpredictable.fr>
 <20260429190532.26538-14-mohamed@unpredictable.fr>
In-Reply-To: <20260429190532.26538-14-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2026 09:27:54 +0100
X-Gm-Features: AVHnY4LD9doMrkdvVfXyBUewM98Q9OeB9-W6KyQfg_-jN2Yig-EndN3N3AkaTdA
Message-ID: <CAFEAcA-f21a7hHcGNrAAA=2x_AUtQDOs7jUkmv=gxnLSM39c5A@mail.gmail.com>
Subject: Re: [PATCH v21 13/15] hvf: arm: physical timer emulation
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alexander Graf <agraf@csgraf.de>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Wed, 29 Apr 2026 at 20:06, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Enable this through leveraging TCG's physical timer emulation.
> This allows nested virtualisation to work with a kernel-irqchip=off + GICv2.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)

The TCG emulation code looks like it ought to be OK called
from an hvf context, though we do seem to be gradually
extending the set of TCG sysreg implementations that are
now silently required to work with HVF too...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

