Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp4461661lfy;
        Sat, 1 Aug 2020 06:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQyJKjyYn950uNEMBmylDAvDawA6KVmWs2FojyLWhkexRkgDnDE062Sly7IIO3nl9MPifb
X-Received: by 2002:a25:d44c:: with SMTP id m73mr11455218ybf.486.1596289035263;
        Sat, 01 Aug 2020 06:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596289035; cv=none;
        d=google.com; s=arc-20160816;
        b=nQIIGU0NV3aQKF+h9PgeQSeTZ5JQdvIDQ772dUUP2boYfknouM8baFYeJdjq2e2ROW
         lM1x4ltgQ1BIZrIGnd9wMzIXdqM4Cdg4vNOZWamCPz1btA3fSGbRLnSklyrwAxx6kG+L
         IE9jO9Tf0/ZKFcYbBLmNuImq0BfKGocYWrPSrnzBzd/Hph64vL4lWOtSXf2/tEciw4DO
         /djfvBE54E23pa1uuHJ+YJ2eD/hMKcizuAeybHTuYlZ3PdlpBsLN5tMKqsnEELm72noO
         ysXKlwJwuftSceUVMKbwdEjELvG0jFB7IH0jmT9vB3mJWZzizWqX+RBPHkGuAhwExYzg
         2GxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=4zgxFQvTV9oYWms+3PiW7Zx1xSV4Q1Ea0Su0ytuzreA=;
        b=wXQt5iLfHUo/jyP3aWZ8nRgO2gAk++fPnM7rthly1zzaPtJU+EKJv1v2aqTO1WOmu8
         6kqhOC3Xexge7t0c8Ty3WbBfdrZnqRru6/KuE9ZkcT90D4O3DcLGzOkyKJTqxSGt8Zry
         7N1uiGXsky1K1YekqEVrrZwq3AGMMriKakjpSMXpOjxWcZi4bJaEnj1Xh6xqwsHtp9Ao
         n7v9TJXJ9buZuraOAb2HcRPHgzyXy+XxiQXUvx6gWxGqPaY02+hN4+yuRPC5aDRD/+rs
         sQDaKjMTmgp8ou6Z/tJ+1RaPVP3Yijw+070zhpKgf38b5rHrGS/DPsB7rOY129Gq/46q
         XiWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LiqnyBXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o63si10688337ybc.8.2020.08.01.06.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Aug 2020 06:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LiqnyBXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1rhK-0006Ik-Li
	for alex.bennee@linaro.org; Sat, 01 Aug 2020 09:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangmuhui@gmail.com>)
 id 1k1nwx-00006g-4p
 for qemu-arm@nongnu.org; Sat, 01 Aug 2020 05:37:07 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:41333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiangmuhui@gmail.com>)
 id 1k1nwv-0005ES-Ji
 for qemu-arm@nongnu.org; Sat, 01 Aug 2020 05:37:06 -0400
Received: by mail-io1-xd31.google.com with SMTP id g19so21943452ioh.8
 for <qemu-arm@nongnu.org>; Sat, 01 Aug 2020 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4zgxFQvTV9oYWms+3PiW7Zx1xSV4Q1Ea0Su0ytuzreA=;
 b=LiqnyBXstBYsmxbQTET2L4Fisqk0iar8GPraegjmH6YsaHj9Vx47zE4yB2xopc4IZC
 /Q07mbbrzcwevoE4rt4gPU11uqk7YFXISPtXpo3ihwWiOPHSWriL1DUX1NaRI5dwsHr0
 Fz15cmk4UuKl5C+cILEADBqNbdsdbwdEEyivbPhmG4nyH6xshf0GgzJXGHpy0Q/ZNSIk
 s8KthNJksJ290wI8aXvye41EzTjcnnxvTusl/n8TuT5FvDU6F1zj0D3E1qgFup/h25cy
 do8x7FecHhPjBReKAF3IoDI11tby3KZi16HfHArB/b2m4kGQrXov1bIfH2w8IyWLkAD0
 Y44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4zgxFQvTV9oYWms+3PiW7Zx1xSV4Q1Ea0Su0ytuzreA=;
 b=L21+TRyZRipn8X8Zgl7Wb+k2Czm/dej0jTrVPmWllz7CsqwaU2uGD7F553HfdLJYrZ
 Mpx9ONJQ4OddvMcWGVw/ltWMnz+cOJ3YmI5eB20bq5TuczROUheOKtekc73PPFvvaZET
 z/Vqo6Y1DWT4Gze0TCRxTMV1R+2Mt9nGwnI7glj34cxTG/0/iaTzefS7gXEC8Ow35Qjg
 HNr0OUaQL6SDb+tXCvcuvSI2oO56rFrxzgP5OvFeznr2W7rtX05gYwSK+YTozxuLvRSc
 BZHW1RkLD+TbcFNDjQClFydMFdl8jJWvBNh4Hb7Y3uHFdxlU4dw3hul3zkMkly2syHrb
 Y0pQ==
X-Gm-Message-State: AOAM531J3cnKB+wtg3ba57XHx1Ephs8MpcRLggLFZ3OamKgdlr3VH9eq
 vgPpYmlb2qPC/sCG8gGVQf/6xvIfbq0s5g8RM3ayMyt50seQkw==
X-Received: by 2002:a02:95ab:: with SMTP id b40mr9348264jai.14.1596274623529; 
 Sat, 01 Aug 2020 02:37:03 -0700 (PDT)
MIME-Version: 1.0
From: Muhui Jiang <jiangmuhui@gmail.com>
Date: Sat, 1 Aug 2020 17:36:52 +0800
Message-ID: <CAF_eCeq6s=ZbDQq_TXvw+6xBGEEkRePFYOYpzGi2qZNAJg6GPQ@mail.gmail.com>
Subject: QEMU emulate serial snps,dw-apb-uart
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e647fb05abcda5e6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=jiangmuhui@gmail.com; helo=mail-io1-xd31.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 01 Aug 2020 09:36:53 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WKtNXLNcd9TC

--000000000000e647fb05abcda5e6
Content-Type: text/plain; charset="UTF-8"

Hi

I refer to the serial snps,dw-apb-uart. It is a widely used serial. For
example, the mvebu-a9 board.

I was wondering whether QEMU supports this kinds of uART. I tried to use
the serial_mm_init, which supports ns16550. However, it does not work.

Does anyone have ideas? Many thanks

Regards
Muhui

--000000000000e647fb05abcda5e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>I refer to the serial=C2=A0snps,dw-a=
pb-uart. It is a widely used serial. For example, the mvebu-a9 board.=C2=A0=
</div><div><br></div><div>I was wondering whether QEMU supports this kinds =
of uART. I tried to use the serial_mm_init, which supports ns16550. However=
, it does not work.</div><div><br></div><div>Does anyone have ideas? Many=
=C2=A0thanks</div><div><br></div><div>Regards</div><div>Muhui</div></div>

--000000000000e647fb05abcda5e6--
