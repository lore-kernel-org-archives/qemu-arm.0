Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp203715njc;
        Fri, 21 Jun 2024 08:29:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTTQoN5yAxQ4WV6GfgFxtdY5uS6AobQ3viVaKw3R3LiwtiNaapoCsj4OpVnH+cCiDCHxYMa+pnqRyLvtBz98MWLffkwqqE
X-Google-Smtp-Source: AGHT+IG9HKsKJNiZMBZQdTtgz+7uQV24va9PzkBnD61pOJa31Y6s5wGDTBEXd+Io0ZU4xbqev21D
X-Received: by 2002:a05:6870:a54b:b0:25c:c73a:dce6 with SMTP id 586e51a60fabf-25cc73ae05cmr4499473fac.47.1718983786622;
        Fri, 21 Jun 2024 08:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718983786; cv=none;
        d=google.com; s=arc-20160816;
        b=kOz7ZorlA5yCMfqlc276O0Gqm22rRXGqEDfYCuRpe8fIBjo5FMMCeJaQi0XPCw/92q
         IfLZriY21YyR9eTXtEmhnnt88cfxhLf8hyaXuFeB+/7YjeoZ0JAaLt7XZqzupn4JHraU
         6DH6G6CnxB/94fBHvfwycrChW+hD61yPY+NiVjsJMdFeVuIA/gdq9VVa4FeBPv4hkeDB
         Fv1NIuXi8IeCGDaSO6IoUi7vd3Nl3Qq6+e2jd3IHiuP0jzBTX4Na1qABGD7LYRz2SlUv
         IEA0OPMbWAH0AwOvFANIEVng4QiLuZVvP4kQUacJ55k28T1StTPtJ2q5YJJ37JHY1B6Z
         sIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fK45Tgn7t9B001rhEjJTjEdSoKL81n2m9smFzmhqBJA=;
        fh=sPNB+wMByEmOmv0NA5LZ0sZcEjWhHctCq8XojzuPPiI=;
        b=bEA6sJvdcREPu8DIkY5rl8044wBFyNE+tPTdjbclmVGRVJXUbV4V+C37sWUYRpQ/0F
         qF/Vz0Uc4DKdZMfMGr60C4NaEt188OXYy33aqck9dgKtWnDPWveGiTUYSr0aSpAAKJXO
         LiSVvKtwMWDi/01CnldmH9Hpg7W2dbUw2SeVyomK+iulg5Ce/Rzwe1FE9tDXqu0TnTqK
         bLq+5veeyO+Fjdw55e78i6XjBUem32eenSIRqv19mhs35EmiPP5HZXDodhoothFk62FB
         AmuLDHBWdQOqRYMlNOan9k0o3zIZIjFI02+4IrGhxoJV1tOeh4ea+6Z24g20lCW3Kgcc
         z9Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2CgUMTX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce941351si204741285a.607.2024.06.21.08.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 08:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2CgUMTX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKgCR-0003Bm-6Q; Fri, 21 Jun 2024 11:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKgCP-0003BL-TA
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:29:14 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKgCO-0001bV-9E
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:29:13 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57d06101d76so2286202a12.3
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718983751; x=1719588551; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fK45Tgn7t9B001rhEjJTjEdSoKL81n2m9smFzmhqBJA=;
 b=f2CgUMTXv9vgIkUExfXUtdVgoEIn6+zOLjaeKi/T1rHktO0FGq5HHr++eY0hW1ZT9J
 9dvVHmcaHGC0wYjmkna+dnxqSljIugyG8vtRTpaL1FcKGjeX6l8ZsBUXoCQH3lIImzxk
 2+iLDn/j2exe90b7kwP6iHitkHJFim90yc39Elc2LRFxBmw55AZUpaEcgTPVhvfjGLEt
 zTl5iK8FmkE8kWcDrsRUkcDBALHyJii7muXsVOh0cT6NLBVET/xuWMyjs0vxtliqfJI7
 vRA3KDS6EQN70bYIyRKiVuoHyXTj+IP5Ogv83c1HLcrwKcYccyJQtMhRoATvnyxshzGs
 Xb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983751; x=1719588551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fK45Tgn7t9B001rhEjJTjEdSoKL81n2m9smFzmhqBJA=;
 b=tnhWN/fpeiaVQzh8E/N7x01zhJGCgfF5xx7tk9AMxfjQyZP/+bk7smsNS/iE1/bl1N
 xE2F+gDJFB1idpAwuEizesBNug2vEwOJlnDrWwM3sB81V974EkWmLvAgrLEVfo5RRkEg
 /yYAJxelr+dHQhGuqC6cBdDDflMWWXL5G/yxk1ns7O/yWyLtDknRrhfhKUXtvUqEEX8w
 bPbI1RYqup7mV2wAlvYz0rKeLrBJnYPcNLkPeXo34JsFEsL83oiW3WlKQZpvldxXHRxV
 YtnlVjA8vDfRk92ZC5B1UDZ40kEUvQyYlNdIXqmekQqWWvsWN5Llo3bwgMJtBtxPCJ2P
 xyCg==
X-Gm-Message-State: AOJu0YyltrZP0I+BKVaa2nvTx95rci0pON2pM575kihl8/F5c1ogHzNq
 rNItDfOAPrFZ+Ikvk4aguuNixU1lu4LXFIgkjcuUxg54puRWp9FTkBkIZ3Zh/NEsGFLPNr2Hj1n
 Ipq/czlZSKcTiouQ5ckTz4GP+8LkUaQpETL5BjQ==
X-Received: by 2002:a50:cd85:0:b0:57a:322c:b1a5 with SMTP id
 4fb4d7f45d1cf-57d07ede1demr5571580a12.38.1718983750664; Fri, 21 Jun 2024
 08:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240614093026.328271-1-sai.pavan.boddu@amd.com>
In-Reply-To: <20240614093026.328271-1-sai.pavan.boddu@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 16:28:59 +0100
Message-ID: <CAFEAcA-YXi5EK5opz6pPX_70REcciWXoX3reDqRDRtiz4DaqZg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] Add DCC uart console support
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SmkhX125ntqk

On Fri, 14 Jun 2024 at 10:30, Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>
> This patch series attaches a chardev to  arm Debug Communication channel registers,
> As each cpu has it own DBGDTRTX/RX register just tried to hook each cpu
> with chardev iff we find a chardev with id "dcc<cpu-id>".
>
> ex:
>     Below chardev switch would be connected to A53-0.
>
>     ./qemu-system-aarch64 -M xlnx-zcu102 -kernel u-boot-dtb.bin
>       -dtb zynqmp-zcu102-rev1.1.d -display none -m 2G
>       -chardev stdio,id=dcc0

This is neat -- I've thought before that it would be nice to be able
to use the DCC as a chardev destination, given that Linux has support
for earlycon-over-DCC. The thing that put me off was the question
of what the command-line syntax for setting it up ought to be, though.
I'm not sure we want "look for the chardev with a particular ID string"
but I don't know what existing in-tree precedent we have for this
kind of thing.

thanks
-- PMM
