Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp675186njb;
        Thu, 4 Jul 2024 08:14:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUB28tQOGkXyfYIhTvWUL+FVbZtAqEgnj4x+4xEMbBjfYM3ggUu8B6go8Bxvq//snfIG5/rbcr26jj7WAe/tWPe/rl21XRS
X-Google-Smtp-Source: AGHT+IHzU4FzaNbtZoZcooEL+FCbxQcGMRalElAoeigfP89qctfN1NQy0SPI3BT5CvG5CHkyJDht
X-Received: by 2002:a05:6214:d4a:b0:6b0:74cf:6779 with SMTP id 6a1803df08f44-6b5ecf9d6e5mr27495336d6.8.1720106072680;
        Thu, 04 Jul 2024 08:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720106072; cv=none;
        d=google.com; s=arc-20160816;
        b=asZa40qUgC199xsWpHfXwm+m0obOZ8ZjZMY1Jn3/L15lVFSUarC4K0Ll13wOKfsAOr
         6QY/PNzpaVi9xtx3HoLyk7Pb92SeKgtmLO4ctwKTJexRAk2w96d0H5aj16Z8/pvWSxg8
         Sy7bJkpOqyM4r7UU6BU1TovhY/hr3THPlWQ/j4ns0BZkIfD4RDU1AjQn/A1rnS6CWHuW
         GVdXNdyJf+E99uoPD9T8hM7iBB3Y9Mr1oiWHGotMIxVmw3BtHnhcNZUzSEyziNy+TvOc
         dfubHoMaz1ogHUmCfN8BB5GozpswHHRbjs9W1F9lleA0jXrF0SymK8tHorbRnTzfuaH4
         eqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hX2WwmzVNzhxTT7b+SDkAoJmUOsIEXI/igO2mroUR9A=;
        fh=4J94V2fAfBZ07pUes8Z1Kir3trfHlJW3kW1D7oFJ4rQ=;
        b=O+ZAO4kLAJzAmR+rbX3NstUUEiLv1XUhWMJMYBhEXyIjeK3FfTn3CyzPmNAbTOrZNl
         ncuElAsnYG/g16hEV3P4KgxwKwphoTvzTCiDJwAdmSFZ3AKS6pu3BOgD3sWryqVj/hAl
         2midVheswjyfDuSIHSBpV9rOcUlOsW50zT+0L5CNTKSqlecxcteRDXFVxf8lTaKMzWLc
         5OKMdqyl4exirKxU1uGMnP9V7foVGQqksDIvch+w5dB+o2tu81K8tf3MoKrQU2CJ75Kc
         A3DxsJbrsTq9sIaala6r/BvwPOWU7LGDCKz+In0H35AuVXwf7OTjJoUSYW9fVs+7DQRn
         GK0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckQDqUvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5aea88si151036246d6.212.2024.07.04.08.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 08:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckQDqUvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPOAD-0000Nu-9y; Thu, 04 Jul 2024 11:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPOAB-0000My-Gy
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:14:23 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPOA9-0003A4-N0
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:14:23 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso1006300a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720106059; x=1720710859; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hX2WwmzVNzhxTT7b+SDkAoJmUOsIEXI/igO2mroUR9A=;
 b=ckQDqUvfStgXx2gZp1KmtsLdgHrb5nyJ1Xbgem4C3mqmB2Y5iY1qFeoHR3GUGG2JE+
 U6wBBWbFXUGb8T96F1+Zo0nCbQ7nyj2gxV4wUu9jsm4SYMBFOaHx0b2U9bSZtRpd7ai9
 uQCoXHzb6ueGT2TqTO2zOsfGqvEblpalHYphdnuASmN3fbzhe3Gkp2PPlhmcFAIV0MXx
 H9llnlhhdM3ruPzILUFC2p/YcuJR4DLEwh2MPkHeabDmmFiAbB+bQmRggX93qqlvAbF5
 zfKiePVBncqsEPfymITn1drWQW5gaWjRHnZnLXGOV+/eRe1gHt8F1dqoamG3AeUfjLiC
 n8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720106059; x=1720710859;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hX2WwmzVNzhxTT7b+SDkAoJmUOsIEXI/igO2mroUR9A=;
 b=mbgXWqeFxNa8IZGSIIMZ+FLfbOrASM+vYsP1MthT45fa7UEeDNCz91NYNvtfmniCIH
 qyS4RonUgpt/w/kMysh+HqVNbhnWO6ikZENieeT0nW7U/SxDDzl+ZIRxnowRqo4DiHjt
 JDViih66dDYQwxMMq53D/KAIcETTheVIwEw6j7JJQtjxBcSXwEgM1jR0HvWbTO+ou1D3
 MSe4IW7o/D36AQ2x1PUVFELFChwhA+LTlyZ5/MzoLtE29sPK+9Llmw6MbSTN/DxiTh84
 XEnyS3H1CoHUGfYd15EBFqRbIUJaGwJ8Sz+fveANcdzwE6Ib4utWC2Ua9sxmoZ0bUnT6
 9bxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXACyMVKc2gYrJ2tEKrCZHCTAMC34tiDu3K2405w90prTajSTqU3USjo1WfhIcpxWHi2EcgC7H72+xNAFOzUaGJU+jU
X-Gm-Message-State: AOJu0YxroS6kCujyFr4LvCht4YrAPLrOfmCPQO6grkiOA8Ag4hzd1XVe
 d9UL/i1lS/h0QDJMzpmZk9GQeZ774RN0xIsZUGRlNIsHO7oxBezXBkk9UtznCdDAeMq82rvSwf3
 nJOPClrVD/dCp4n0CCsZ/K1BcmyziuN+13DCQ1w==
X-Received: by 2002:a05:6402:5255:b0:58c:7c2f:5c0b with SMTP id
 4fb4d7f45d1cf-58e5b4ae20dmr1284314a12.25.1720106058133; Thu, 04 Jul 2024
 08:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240702154042.3018932-1-zheyuma97@gmail.com>
In-Reply-To: <20240702154042.3018932-1-zheyuma97@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2024 16:14:07 +0100
Message-ID: <CAFEAcA_FkMAmmGnKkpAHokmvfXscxWQyGmnKAU-rM3+RyHSNsg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc/bcm2835_thermal: Fix access size handling in
 bcm2835_thermal_ops
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: 3b26+L6HWzGx

On Tue, 2 Jul 2024 at 16:41, Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> The current implementation of bcm2835_thermal_ops sets
> impl.max_access_size and valid.min_access_size to 4, but leaves
> impl.min_access_size and valid.max_access_size unset, defaulting to 1.
> This causes issues when the memory system is presented with an access
> of size 2 at an offset of 3, leading to an attempt to synthesize it as
> a pair of byte accesses at offsets 3 and 4, which trips an assert.
>
> Additionally, the lack of valid.max_access_size setting causes another
> issue: the memory system tries to synthesize a read using a 4-byte
> access at offset 3 even though the device doesn't allow unaligned
> accesses.
>
> This patch addresses these issues by explicitly setting both
> impl.min_access_size and valid.max_access_size to 4, ensuring proper
> handling of access sizes.
>
> Error log:
> ERROR:hw/misc/bcm2835_thermal.c:55:bcm2835_thermal_read: code should not be reached
> Bail out! ERROR:hw/misc/bcm2835_thermal.c:55:bcm2835_thermal_read: code should not be reached
> Aborted
>
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display \
> none -machine accel=qtest, -m 512M -machine raspi3b -m 1G -qtest stdio
> readw 0x3f212003
> EOF
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
