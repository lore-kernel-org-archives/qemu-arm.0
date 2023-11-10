Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1116411ejq;
        Fri, 10 Nov 2023 03:19:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHust7BbyFSSCWNPnLoKkokAiQNlgZ051iazuXp28gTArslAU8wt+ag0ZBlHn7yHXm++/Kk
X-Received: by 2002:a25:aaa4:0:b0:da0:5997:5fcf with SMTP id t33-20020a25aaa4000000b00da059975fcfmr7386003ybi.51.1699615174379;
        Fri, 10 Nov 2023 03:19:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699615174; cv=none;
        d=google.com; s=arc-20160816;
        b=qpCa2Ekcj3/U32SqUYLmB43TjidhcYzK+dMlSCPX6VVRYtAZriYLHYVDMktfpvnuqV
         yFAXKb3DzbsPzEcl6glb6p9aHBJkYIBVd1BJTCoK6+cleJl9s4xjiAVJdll0f3F1I8ZQ
         sEORzP6WV8jsdA6AW8wSR2zuVfMPwEVTQi7pX1BKj0bVLhUvwWmIMN6OWAQZ7jF9rkk+
         JrHL7dJWeysAgLeTfRno7WsZwvrfeLhxgfn46ReAV/VfLy19J1rbMf/GMX6kkBnINB3m
         Bl64i8g5zJPx9L4+mcUUSbHo9kIZeBPTxsicU19J7bi8nUZy0R/kIvEao+Pqz6kg7c9j
         7sMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BCR61QE4ydIgYeiOrwA+nOrMj2JOoVhgp8U+Sjs5I1s=;
        fh=VLHr41bVuucypDOC8O9wAlC2CSngBrg4brtk9Cx9o+8=;
        b=MoA3rAlA94qJqTGzl4WZU6bU0eHovek4bKBQuDo8FoNKakmFTynaZMa3/9Szkl3Y3J
         ozemKa4uIvj8x5rI8wfwoviafmA0NHoR46sWcdEtKhK303oG59ZOrLHWdUDm2DKSTkp7
         Hm3KjppiPDwcFVzNXcaFlN2YS40dv/Gjz9xo3dDBKddayAY5VNV711aa6UVt2T1gbGZ4
         QhDdlZ8/hrWoWf6ELsPb6bCgEko+3RqSJUWBiI41U0j4QmazWs1r1iH7yIq6OZGVFAPj
         2VWhSYGLpl2l0E6oixAR+npMGvtOGBX7ID/iYFanjY77l7XpHpb47hQoiKe/jqnec7qO
         pPvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lVBtbGLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020a0562140b2900b0065b31197992si4181308qvj.49.2023.11.10.03.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 03:19:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lVBtbGLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1PXL-0006mo-FH; Fri, 10 Nov 2023 06:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1PXJ-0006mH-TL
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:18:53 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1PXI-0003lT-8s
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:18:53 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so3089946a12.0
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 03:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699615131; x=1700219931; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BCR61QE4ydIgYeiOrwA+nOrMj2JOoVhgp8U+Sjs5I1s=;
 b=lVBtbGLVYzpN5R7wZDdmbqBRJp9GFeJIo4V5ozGTMHsqUfPtCWqCCzeDW+Y2jVGEew
 i47VN6EEPmW20FIwtqAyUl8AMVuFwvIWU/MpKCbPHzMJuS3xWVdp1rTsHEGafd4gxLF2
 bOzgKOnch5zUIALTpOx8JFnBEm9l2eDtIKsdu+39Z4/zAppfjIIqyWhRZz3MbYRU5buF
 1MQWO1TIOMQaSDZ0kxbBpgXllriEYGIgdtQ04lx3HnDhR3VPXJGyNgW3msotlQPRB+W+
 CYcZxiKsYlQGhoXsBCovV6He6VIJxOi4FuFreJzIE63OsRyNXhyRdNe8pT3hoPwNi9tI
 K4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699615131; x=1700219931;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BCR61QE4ydIgYeiOrwA+nOrMj2JOoVhgp8U+Sjs5I1s=;
 b=V5vA5zQ7LBLbbRDQDwC2dB4rgZjTubjjcnbkvmYRDB3TneLjNg/H+1iKKVdPLtKZ8O
 T7NDePisdalaJNLfWva9Tcl3gCJpdsR4IrS/s7o+/jrd0A83gxOcnDWb4PXE4H01IaPV
 7aNhhcUVvtylopj0GBozBgjknr+n6c4K8A1esZIXgznTmXyUDJr0SjLd1WqBtwxaIzdo
 T0C8F71m+GXcdxu9RY9/RpqTu6zvI2CR5UL5gw1Rwwqu8NwgduOe5csIrRscxf/Sb11J
 Y7RDEhLk1TgVLkfYcozJIDlWURjQFuT4reSIk1HUXPdvr7Ts74Iggv+zKZPD4Ybv2D6P
 G5Gg==
X-Gm-Message-State: AOJu0YwvNfpxi9w+PAa5okW3Zep8AksJnJovAxodPvSzN3MhHiTWYtqT
 sX+MrHC+reshVc6cCTn6pukmof6S/4BtJYZsn5LVEQ==
X-Received: by 2002:a50:aadd:0:b0:53b:9948:cc1f with SMTP id
 r29-20020a50aadd000000b0053b9948cc1fmr6710655edc.12.1699615130691; Fri, 10
 Nov 2023 03:18:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
 <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
 <3wmne.fhuf28sb5yfg@linaro.org>
In-Reply-To: <3wmne.fhuf28sb5yfg@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Nov 2023 11:18:39 +0000
Message-ID: <CAFEAcA-mSBgLuGLp4Tzaq0L78PtsxF19CVfmkJwaM8pHfwv7wg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xJhJA/ajEoVT

On Fri, 10 Nov 2023 at 11:02, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> On Fri, 10 Nov 2023 12:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> >This kind of thing is why Coverity's unused-result warning has a
> >lot of false positives. We shouldn't introduce extra code like
> >this to work around the fact that the tooling doesn't understand
> >our error-handling convention (i.e. error_fatal, and the way
> >that some functions report errors both via the return value and
> >also via the Error** argument).
>
> I respect that :). But I personally believe that clinging to C's
> inadequacies, instead of preventing bugs statically just because it adds
> some lines of code, is misguided. Proper code should strive to make bugs
> impossible in the first place.

I generally agree. The problem here really is that we've ended
up with this odd API convention that reports errors in two
ways. In an ideal world we'd tidy up our APIs to report errors
exactly in one way (presumably via the Error).

-- PMM
