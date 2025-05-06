Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3092401njj;
        Tue, 6 May 2025 05:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVJ6ozWNHmL9ChBJXF8gcT11O90A5ySFyKtnrOtiaN3epH0ZjsgbQJK/XOOR5cveshr66ZHJ+u07XIsA==@linaro.org
X-Google-Smtp-Source: AGHT+IGcD0KQdPiG+hyjqc6lyw2J2ycZtXB/hvpD5aQPEAJ8Xmo6y80D58+kPEAW+SfUVna0D/TS
X-Received: by 2002:a05:620a:3951:b0:7c5:4c6d:7fa9 with SMTP id af79cd13be357-7caf09d78b6mr525414485a.49.1746536079067;
        Tue, 06 May 2025 05:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746536079; cv=none;
        d=google.com; s=arc-20240605;
        b=Rj5RAR5SIyez5vqnv3HdwDowmzR+YCb4RfFb83JGiU2Ftop2z4fUTBcAyelJ78HVRQ
         p+N+UZ80GIcuqhRhYXIvMn2gW5KK9gQkPEXm07FsDJ/QcWidX880rYHgQdAQhLzFMeRb
         tt9IQuvFMe1SbDAGU6JcEZopWHfL+5Axx2JNWT66Q35PWzXF5PY+cK+HOKnxRz5MutyL
         YOT7mJIuFvdRcJU/znNBeIYkCJkDInsIXzlTbY7rmYffWk/IjcLpicrzP68obty5Tpvk
         kF4ZFiAF/E6fBUNMsKOx2PW7L1ASlVozMhRjal2SPMXlkl0bQvr8LiGE6OzMrMEjECNc
         /6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ALvgerSZUNXUKPQczYhVZ1boHHltAdoW2Wo+YUbpVLM=;
        fh=BlPCnzMwXmIq0y6eKAudD3x3f5DdDx9DjTdao9v+dEA=;
        b=Dd88qQcD6dB0j10n9TGlhtn1XEJ9oWFiYtolUquxL1jNQK785a9x09Z/M5sG92xgxo
         sH/kC3M+gxsX8IiBEohwGhkEeoNVaKd4fkeBe2ZoBBtNNN/5ITPlQlyBvKAk5+hYJj/M
         2bNxGfV1AuaOB07NSY5NE4q29hBTFvOzUfpxg+lNs/gwAMcXN5RAf4CTBAUZPZ79mdWz
         xZnC09oboXeHYRORf4Q9ztoQC4YD4eWzKtzgKkw9YoukKpfsP8vJrKF4beSbzVr5+dL0
         +tI5U9hFchPI7pj9+d9iBFjVDJgA40Pwui7X/uzGIJLSPfb9eQG2QZo1cm2geb3Uvokd
         w5ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P96Gujff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad23ba7ecsi1119129785a.77.2025.05.06.05.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 05:54:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P96Gujff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCHoN-0001yN-Ga; Tue, 06 May 2025 08:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCHoL-0001xw-KF
 for qemu-arm@nongnu.org; Tue, 06 May 2025 08:54:13 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCHoH-0003TV-PV
 for qemu-arm@nongnu.org; Tue, 06 May 2025 08:54:13 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e733e25bfc7so5248437276.3
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746536048; x=1747140848; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ALvgerSZUNXUKPQczYhVZ1boHHltAdoW2Wo+YUbpVLM=;
 b=P96GujffA4+bl2ci1jgm6KiDK2hh+QcuXbzSmq1V9OOamE/gjhp1SmeBiClK26cDwV
 4+seB+ZMPjUwfQ95tcQVdJnpeJYw9Qt1C1Jz8njtsf3llR+Vsfaac3VELOcX/TcAXC7b
 D0b7hd3UXcaK9/HAAJdNZ06C0L1B5oq3n5cXqSgzs0M7KIfjuHp0dWDmNLh33+A5snGy
 nF59YLFqkH7ZROw16LAdPvqFsvce9QSmNfoRz/jjtygI2aCagZgakcsze1NCQ/JgeIlj
 rzz7XqdIIUlIv2fcK+JE1d7j6zxYLoejJ3a2tclSdAtEclf4DPfS5aA3PGBpoyoi8y1A
 pglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746536048; x=1747140848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ALvgerSZUNXUKPQczYhVZ1boHHltAdoW2Wo+YUbpVLM=;
 b=QFvSQQoFemd68q6Fghjeblzu5EU39yB1eEUEGL9sY1TWekunt00m9+r1qk29UM4kYI
 nyRPKy3fq1vVPvJSMdb4ubQCzNX3duT6JJ4ZfCaX4oU6Akf9U9Fw3CXQEsf7BODVwzxS
 ofK/Kwm1LU9nXq9nGrX6K7GLpDozqUX1uM9scFyPP9kKwhz1TSD1E3T6ewyoyGE8Mg1y
 854nL7GWa/fHTZE0Pe6beYnH7V1JTMDO/3G+xRotneJ9IR6Txm7gLGCRcbhUBGlMnzOc
 4Wz0pF2C0+WB1mzKu7byuKOjuNTAmciC8mj2n8NXWpnBH8RAb385bBdvMxffnBIllZKC
 001A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWNz3s1QqW/qCNRpYpNjTaF/4kcVu3hdF29Ddn1t++kkebBsMRWJGYPpcwrYSgliDuZlUxJxY3lw==@nongnu.org
X-Gm-Message-State: AOJu0Yyd1ZuwyUqJYBO+sjYSEZCU6jL2jO13XXukWAFerplW4J2OJnwh
 bCbK5nvY+zB1FoLCfh8wEkoBn+o8DTDum8LMs65MaaOLIilQ07x5eX42FW8p1jYmITOlrSQKQ/u
 406ckG1XR87LAbT0gR5K/+x+xxQCVo1tSpYCmxQ==
X-Gm-Gg: ASbGnctT+Fl5THi802/27HpI1uyBtsnaaZtP+NWRGZziWjdDBXlBeA26pza5t7dpo8v
 v84IfP/h8QrHupugtnmbzpsqgRcnCPtSYtsnjNoeIMi2siFxwNQq4fg7UhNXwwuDNXlsnQN8Brd
 MX9ExZ5nQBcSGNomPx8hmsBUE=
X-Received: by 2002:a05:6902:2512:b0:e72:e170:cb78 with SMTP id
 3f1490d57ef6-e75bf479517mr4528402276.0.1746536048282; Tue, 06 May 2025
 05:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250414020629.1867106-1-timlee660101@gmail.com>
In-Reply-To: <20250414020629.1867106-1-timlee660101@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 May 2025 13:53:57 +0100
X-Gm-Features: ATxdqUHG-3n6uetnsoUu9gYr8nH7UJrcwK88I9L6a8hzvlsluzADwXWScDjKif4
Message-ID: <CAFEAcA8L4KzJZ+Ew-n+XNjHB3RmYnM1noq5nXo0=xzpMSBsrXw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Attach PSPI module to NPCM8XX SoC
To: Tim Lee <timlee660101@gmail.com>
Cc: wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9udY1cMeLpT5

On Mon, 14 Apr 2025 at 03:07, Tim Lee <timlee660101@gmail.com> wrote:
>
> Nuvoton's PSPI is a general purpose SPI module which enables
> connections to SPI-based peripheral devices. Attach it to the NPCM8XX.
>
> Tested:
> NPCM8XX PSPI driver probed successfully from dmesg log.
>
> Signed-off-by: Tim Lee <timlee660101@gmail.com>

Applied to target-arm.next; thanks to everybody who reviewed this.

-- PMM
