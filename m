Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2825023njb;
        Tue, 18 Mar 2025 03:32:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQvDhGtiITe6yp5P69mtYsg6Q/fcu5nkazuWXu8Ex8/hf7/l95s+8RCvupmzmZkgd9zxDRUn5CGYkIBg==@linaro.org
X-Google-Smtp-Source: AGHT+IFbyEAhtN95tBTFIGxKkdZQDFZNvgRVXeE+K4DeEB456D8NEMTTjHP+YKoCSCcbqv2l8hfT
X-Received: by 2002:a05:6214:21a1:b0:6e8:9e9c:d212 with SMTP id 6a1803df08f44-6eaea7022d1mr202926656d6.0.1742293973064;
        Tue, 18 Mar 2025 03:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742293973; cv=none;
        d=google.com; s=arc-20240605;
        b=e70S0rp0uS1yzu4yc8hQ7/XuUtJQ6VoNDB7UnzdxJxvvRFDG0KqJtG084e+rtbY5ec
         I+QM3a2POs0cIpdk9Nlkky+XRSbaAxDq61OPozN+sFJxieUPYzisuE6G/TVI/QhWNyJ0
         P1/xLWM08GyVemw8n5x1Y0gq+m0k+tgXygzZ7lwn4+7nCFUQ2rCxqts5ceYIkhbLraXw
         g+VHAFfvlv1iWFtnbLFw1LIg19XCbkw//Sabku2Z9XKXTNEXggqbeLSTPuFZqWZX+t97
         UefFe2xpAvpgY4/cDIoCrq+0/ioEx1IgFrZj2TfFPWlMXm0o62YnhJ2lr3ofRrdC15+5
         DnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=w9e/0qq1rE0bHzPkXA6OeA4qlhMl3ekhtHEyQQmXZOg=;
        fh=Sl7RCTOPUnswpIGKC98tOn6pYvT2HvPDZdRdR8tmdlQ=;
        b=GBYgD0wii1OzRMqUwKnDTSW98qaTguaV2aqmrgyCC+MRF2jlhXrLGcDyoynndI0ASW
         Kokg76HZzW7JUQ4AAmNd+hgzNTp4bF+pAL7TyN/ZEobSFMMzNFWTwxGhg4xek1mlz2am
         dYrEosuXlwQ75kijuIC5aOdE0C0cX0MMs4XG75ldClY2XurWdRdzUp6xbcGrAhnCMLO3
         aHTZbum2D9gr13e8XjFwS6XJEV4iCiKiyq4TGtSygeASLppdC5y7u7Az3uy5tt7p/wy/
         sw7pBuuJjvPyS49T0fohgZW84VPhhTZv1G7zhQtLpxRDX66m2IIWWJRXPgLG4mU6r6mP
         xJLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iDaXoFfe;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade33c81asi117886286d6.209.2025.03.18.03.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 03:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iDaXoFfe;
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1tuUFU-0001uc-Ec; Tue, 18 Mar 2025 06:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuUFL-0001sG-40
 for qemu-rust@nongnu.org; Tue, 18 Mar 2025 06:32:34 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuUFF-00055r-EM
 for qemu-rust@nongnu.org; Tue, 18 Mar 2025 06:32:29 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e455bf1f4d3so4132823276.2
 for <qemu-rust@nongnu.org>; Tue, 18 Mar 2025 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742293943; x=1742898743; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w9e/0qq1rE0bHzPkXA6OeA4qlhMl3ekhtHEyQQmXZOg=;
 b=iDaXoFfeVEtpdgf/yFHlddUGvGkihEkvOmVEoMvIJWLZqOzH4BzA8Rznlx/7zO2vaH
 Q4JkYyKdkY0hrpp9zXni7TeIx6Z4ehHLuRmTxZauOg7NW9pAhhn0q+SC8fD9ov/qF+LG
 ulSokjTPqiK14T+Ts4G0Sw8EXX0ldtfM9+JMBB0DfEGvpjYBVNCNSHbY8kUBjshvVTUj
 WU6CkK+6FQzg7VyCt5ur2nfj8bMpuqjYa7NVRiPBWDmALm49WSXtu7/LP6YH0EOGm/US
 HpxYPllgoYJLuda5vJ4REyf66FG51fx4o2bEBozL73S914sKZ8agimpXeH1uRMiRinP5
 ciaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742293943; x=1742898743;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w9e/0qq1rE0bHzPkXA6OeA4qlhMl3ekhtHEyQQmXZOg=;
 b=Ww1S6ajhXt+4I7GbKJ7+KGWy9AIZBQwUvtrtX3l24Yc22glmr/Mig8RlC1/o5GLqlI
 E9CdoVhaWnnf0DVDHbj4J8+edgGHz5YsdxRZssw8OgqDXcRtr8JZTDOLWMstUij61nKt
 hykPVysKkWZjefYq3PdvZA/+Axm75k2Lym2Z4yK3lmQxkj5Ihqd+GJyA2K2GcuhKhp6w
 vbwkT6v1JAiYcujI9QvdbxletuwfjkqZRLPC0AOoCS4T5tBtYJ0g++TOc7rohLE0ziV6
 REkrTkskJzU/Am2PKdJ9kj8dddIuFVRzSsOeZxsTxUJNTgrZ9eAJMC0r9pin5bsxP/PG
 GoaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUejUd8ZCWRadgWrPJGUaF6GVDt71TMd1hBGKKs0I59jBh7hyYISMmyLrx+sXanXNA7aB4VM+oZ1qs=@nongnu.org
X-Gm-Message-State: AOJu0YxJiGjqjybD/U5LZ7ATC5FIKtzpgpLS9rfyTIBzGGIOByICsWrl
 8BjISukjPY5hRnrGMZqMSWEVu2TkEReiJT3MvZRlN+thr/VTiuSz74xSWMHzjOs3GruPEq60RRj
 r94hsV3EoVV2wHTZSEYtWQLbxE+7o/YMn4N2srQ==
X-Gm-Gg: ASbGncuI9sYfGSp+gChfK4Heu5O0M8hk6tpGsVruMn/U9A2fcI4yck7V1qKCUDRZcjL
 NAkbj7L+b1YMBNd8mYb1bUqZ6+LJFdGlwfnWuSuubrCVANG71JhgQ+Fo2sf7EqGhAFwsgj9KCnA
 icrhuOB3q343xHVFWaW9LYNo+iBUw=
X-Received: by 2002:a05:6902:1b84:b0:e58:8e82:5345 with SMTP id
 3f1490d57ef6-e63f64d8d2cmr18386868276.4.1742293943421; Tue, 18 Mar 2025
 03:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250317173239.941034-1-peter.maydell@linaro.org>
 <Z9hxJZhDO17SjYPS@redhat.com>
In-Reply-To: <Z9hxJZhDO17SjYPS@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 10:32:12 +0000
X-Gm-Features: AQ5f1JoXYHtI8-aJlw5h0IIfsc_nYTs7Xmh2c9JNJeH95gI8vPCv6AVo9k-2iE8
Message-ID: <CAFEAcA9-a9MFTXew6c-UDSzpprTCmPtkNHmssvV19aTE201C9g@mail.gmail.com>
Subject: Re: [PATCH] rust: pl011: Cut down amount of text quoted from PL011 TRM
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5+tQeOPnu29v

On Mon, 17 Mar 2025 at 18:59, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Mar 17, 2025 at 05:32:39PM +0000, Peter Maydell wrote:
> > Currently the comments in the Rust pl011 register.rs file include
> > large amounts of text from the PL011 TRM.  This is much more
> > commentary than we typically quote from a device reference manual,
> > and much of it is not relevant to QEMU.  Compress and rephrase the
> > comments so that we are not quoting such a large volume of TRM text.
>
> Is there any significant amount of quoted text remaining after
> this patch ?

No.

-- PMM
