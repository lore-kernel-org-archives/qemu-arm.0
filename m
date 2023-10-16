Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3303513ejc;
        Mon, 16 Oct 2023 09:28:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMpKTRivxwDBtMzGALcjmHheMUUcEwVD7KB7C8E1NLeu24Y2nON0rEC8IuxyMk/4mgCgVU
X-Received: by 2002:a81:6203:0:b0:59b:bd55:8452 with SMTP id w3-20020a816203000000b0059bbd558452mr39595773ywb.36.1697473682350;
        Mon, 16 Oct 2023 09:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697473682; cv=none;
        d=google.com; s=arc-20160816;
        b=a+GYzJ6gnUOE8uesvJ2P+OsQn9w0adUilosfO1ZjR3z21642pfEDLjfWRP2SI+1CAF
         7I+I5tria70tODJkdsSYB7zCNMGSeAcfnCX+HSAqmgCPpgdh9xpv2tqq+XF1Stkn9llM
         qaraN0+/rcyjmX3Dvd35DuzOtVQawsLJswu1ErXbXCHnu/+GlEO5Dy3M5pFer7YyhMR5
         /wUBhOdiiMjIG7I1l67OewpE4VuX0oueSSxs06pTZ0TdbzSIajxFoRd8/KE5pR+AWCxy
         /S0YmnFzM8i1BWKGHQNeC73straJed/1gzJiPJii6bov7nrCIeC9zFxj5ao9WG89K8o3
         yBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ouPSUVk/mNllUEfivAvbWhFZguVw/WaZ5s7O8qT9liU=;
        fh=RuFfgV8co/uWxq4Sf7FCi0NBfIBFRjq7As6wgZ6ipc0=;
        b=0PvvaW/lbo0aCvrf7bBi6r4Ko1TYkKRnrBh23eqbSyMkRThAir0yY6pLPcpxy7zFLu
         XYXMr8sBoBWs+Fc1K26GX+b84VBoT5/YYVjrsyIu8W0PNOFrnelagMzo5qE1D+LeJa5c
         U3S0RPiQbrujN+xK/oF+w8k5HGvI6ozDTO13xYn5vAZV5qLvcxqA76rFSiHP6GNxucWk
         kGiAizBD7Wu3qaF8lky3yXUQlbTsQ4/+U1mQ9/fhdllbXxJRL2RjbYKuzd+cXF7Lxp+c
         22WyZBRrGODVyMBWOX2s0FxO1yxv3RwPE9yYdEBnOK87IGjZh4/rLfbzjw6NCju61kUb
         D3IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hw88Alx0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sn23-20020a05620a949700b0076eed2a7335si5411701qkn.57.2023.10.16.09.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 09:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hw88Alx0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsQRX-0001wp-3G; Mon, 16 Oct 2023 12:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQRU-0001vz-A0
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:27:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQRS-0000Oe-P8
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:27:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40684f53ef3so50862275e9.3
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 09:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697473661; x=1698078461; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ouPSUVk/mNllUEfivAvbWhFZguVw/WaZ5s7O8qT9liU=;
 b=hw88Alx0PGDmRK4UCpJ7Cnu8YiHn63b90yA2pTBIk+AKV+zTO3IhZ1S3PoOt7kq1DR
 oKOW0B60ORIEdHVJScuQdiNUaV2w/ajs/od+NPE051hZYPF534csd/7bWSMRD//FGkVM
 rGqJ50IB5yyFleEqOlUxw+QpbiYy1HP87SMeK+ykXxcz7EAnsQ9QEqRueAlZ4EJQgPff
 N8r/tvla8dbPvUGCyv/29PnHqWvQeKB/1qxXOq8r/L3Sron9wybJdwCh3Tb4UlNa6sxl
 r9OqNvtC88UEalvHRAcVO51do8hQdTAejb7Czz5rReVHOf4921J+4ltVYhZYXHNwb6Du
 Ilwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473661; x=1698078461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ouPSUVk/mNllUEfivAvbWhFZguVw/WaZ5s7O8qT9liU=;
 b=MWJJi9wNb8jYJlRRutx+M+Fx0afqpEa5G9eNHk0l8ldgr9KKLHorNpTZTtoZX2Rd7W
 i/izDCi0VJUlcbl2yKm88Z77udAsfmD+jUti4M8NUWHCH9D/LZFlPvsQCr//Ca1mkvRM
 Q+ub/H5NOowVQmctyZmVnlP5xazVjG5HgfHturisCPwT5R6eae5rvJEV9ggtTIQQBECB
 SHSM1oPgYEfWpqLXMfa0UZa5138UDZnrHyr1vssoAvGf3m3Bcd45s3CKVv8cp5R3tRpW
 i0icfJbDloQ9w2MLqFPM6hWUIc2LM35BsW0YGtJJnIF87zwlScJD9Xma4icO7fnVPKam
 cfCw==
X-Gm-Message-State: AOJu0YzSPmNZNMlbsZJN+4W4YrBm0VsQkZb+KMFe2Au7cOxkAvCka3QY
 8MCreUyhclsUbboc9lxF+nb6U4aeTryuHNABmQzIJA==
X-Received: by 2002:a5d:4a43:0:b0:32d:9e13:1bca with SMTP id
 v3-20020a5d4a43000000b0032d9e131bcamr7442804wrs.27.1697473660678; Mon, 16 Oct
 2023 09:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231013130214.95742-1-philmd@linaro.org>
In-Reply-To: <20231013130214.95742-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:27:29 +0100
Message-ID: <CAFEAcA8e3tcajbfH9vy5jbLQnJuirfFUDNpFLMaLhbwVXRwMkQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/exynos4210: Get arm_boot_info declaration from
 'hw/arm/boot.h'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: jhxzdS1XRT+J

On Fri, 13 Oct 2023 at 14:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> struct arm_boot_info is declared in "hw/arm/boot.h".
> By including the correct header we don't need to declare
> it again in "target/arm/cpu-qom.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Applied to target-arm.next, thanks.

-- PMM
