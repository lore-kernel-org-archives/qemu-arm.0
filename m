Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2139749njb;
        Mon, 16 Dec 2024 04:46:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVb9bce5Z/DSO5nVQ/9r22wn5UbjWH2BQzmDTsZmC6C4koYNJ4Bp/rBko3GmZZHSUmtlKGbysvCfSw1w==@linaro.org
X-Google-Smtp-Source: AGHT+IGXPbNSkHd0eeZjyZ5HckXLkkZcN58l5fl47+ky9dekcbLrLBeNwnE+wrQp2/nTBfEPpezX
X-Received: by 2002:ac8:5811:0:b0:467:6c95:19ef with SMTP id d75a77b69052e-467a5720ec8mr205015431cf.1.1734353213191;
        Mon, 16 Dec 2024 04:46:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734353213; cv=none;
        d=google.com; s=arc-20240605;
        b=D4Lbg0szFgcB0YqJKt/SpESVOTrqZR8QzlFRmJzB9ztt78BDHV5lzw2uuyvxoqYEJS
         qoTFptncVr9GYMPlfM+/C+udmSYuFgmDkIXv5bjQDx9yojTjBPo9I8qhmHFmk+ckYddQ
         D9HqP0XkWGcfwkQQA2YPfyDhshPRXrwuvB+oxupgYZU0K6rUKxf9pffZc/Dl47UZaZF3
         BVmDjQj3o1jmkJKKE7Yzh+MPVml0TK+KQL/VxuMiLT8Rokb/jXhm6vlTtks0TdQCcSpO
         J1ZGLWWhjut5Ts/HrgRaVtk2MkVAj6V2pxcXmnlYFjDvsk6S/eFtxnp8kQG7fgk9Bcgp
         Htqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1xLdKG4gHq8hDCHct6DjZowF0Q68x0RTHZzstAf6M8w=;
        fh=UbqNIbC6kubikV3erCNN1iofQhl1frSlb4AZJdXNHCI=;
        b=avxH4J/F7Ocjgs0XyizWhGT6bO8sU7o36XKOesRGAhta/S2uEmibP/2FSyz31pXbT9
         WyxP10UJx+U914vZ8WyPKT2gnG1/EQwGg0SUuTbd8eG9Ug2U7i6dtY7lnpotI0JdyTWS
         lBDmBGZVrzzGCEo51sP0TsToGIgZB2ChfkzjXcwaAsjjKaLMKAKwiPuvCIyhXhsCVPyn
         PU+Y3K0ziTsCs/5wAsO0bPWhB+I6Niyz4gZVCz5XjumnplGL2mM1Tq8MEnrUPtRmKjQH
         XDhMtIQ65+qfqoxvLcG6LVS4cCMgf1wBIO5g/rW45AlyGCrzj5AnXChgaL+W6WaAVRfM
         JI7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fJfwCg6Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2f1b0a3si69014001cf.606.2024.12.16.04.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 04:46:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fJfwCg6Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tNAUi-0004ee-H4; Mon, 16 Dec 2024 07:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNAUW-0004cX-Et
 for qemu-devel@nongnu.org; Mon, 16 Dec 2024 07:46:29 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNAUU-000466-2H
 for qemu-devel@nongnu.org; Mon, 16 Dec 2024 07:46:27 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6efc58fae20so34630807b3.0
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2024 04:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734353184; x=1734957984; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1xLdKG4gHq8hDCHct6DjZowF0Q68x0RTHZzstAf6M8w=;
 b=fJfwCg6ZHI2xJadxeGQhbfCviyfjc6r9V8NdNUPBk5d3R0MJZb138GzP84I/3TOE8J
 t0hB7MBh5H+s7OM2AV8AKChsPcH7teVL5WaxfYFIjtlYlEIgOnjyPkaECGmT3joDzQeh
 Ba/fnUfYCnYA61ZV3Sl9XEPZeDumMjYA0QZXgX6JQYMdkPJtwIVqVQiNMjWfHV6wJWqS
 9X9KLKmziVhnzkYirj9quMTwVhjc/t2TbqetWLHJCvY/Ms8i2vNCd3OOHYA5nV5Wbzsw
 PzVcHuj8ADgapHfS2rJmbe4/TLTXWMwvFuinKCazjl1Y33UJ9pa2q/jdHI4j38Ad8toa
 fXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734353184; x=1734957984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1xLdKG4gHq8hDCHct6DjZowF0Q68x0RTHZzstAf6M8w=;
 b=p2GlGdVkyGQoyKUxvFFUcZ6zaKmZ96p2WyDYgKnMHcM+D64vLxnJxpyGplnC/RKCxZ
 5huW0J8/O+mQ8pjYCof6q+pWxjujaUTh/7Db/L1wbBHTgt7wdsy6gcbN4tCOSrfnoLbo
 qAM5cqXELYDsfREv0yA+kSsJfV+aLAVBmZDk+6gGR5E6XErQtIEM+70KTApy0QEXPLG5
 uF4Bn8u7IhN2R3kh8RNtNkqUAwkKcXGtU7EiY+DAc/59B/o1/UyFj52gnG+WKnconcO6
 LHul+40LwHPcnLFopsWvNwiq+/xPkCb0FWr9QGYdwUpuCOv40E5qqdlFG11056+hW2Rp
 0hww==
X-Gm-Message-State: AOJu0YznPiTZZbB6jTcbtxgCeieC4hX5NMACzoWqKezrEfguY4ajJcba
 WnasXor1xlED+VqZ9keENz8M/vVV0pj1hITEdGXksNAhYMxSIrBkVML283i0d6bTreDRrc43N17
 Ic2D0+KcQE31F/k0wchMoEMopUEW5vhrcWC6usQ==
X-Gm-Gg: ASbGncswrV/JggYyKaZigRPkpoTNbXXv3DiDnYq9xrCcyKCSMwkpyc0/tdK61nQde1P
 2p4pUK0Ez+YBBiQxKe69ayeAya1l4o9x22KXvvqA=
X-Received: by 2002:a05:690c:6489:b0:6ec:b10a:22a4 with SMTP id
 00721157ae682-6f279b409f7mr93512787b3.25.1734353184027; Mon, 16 Dec 2024
 04:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20241125125448.185504-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-V3PGF7vst8QFjh+bWVx5EGDt_B9ZCe1OryNV8e39N4w@mail.gmail.com>
In-Reply-To: <CAFEAcA-V3PGF7vst8QFjh+bWVx5EGDt_B9ZCe1OryNV8e39N4w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2024 12:46:12 +0000
Message-ID: <CAFEAcA_SRU5UtttB=G2=L2YSK2D1U7Rumbc6eafioxR3yfnYUQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/avocado: update sbsa-ref firmware
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zJRFaLx1hII6

On Mon, 25 Nov 2024 at 13:25, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 25 Nov 2024 at 12:54, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
> >
> > Firmware is built using Debian 'bookworm' cross toolchain (gcc 12.2.0).
> >
> > Used versions:
> >
> > - Trusted Firmware v2.12.0
> > - Tianocore EDK2 stable202411
> > - Tianocore EDK2 Platforms code commit 4b3530d
> >
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>
> Hi; what's the benefit to taking this update? Would it be better
> postponed until the 9.2 release is complete?

We're now past the 9.2 release, but it would still be good
to know what the benefit to updating the firmware images
for this test is.

thanks
-- PMM
