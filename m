Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp591588njb;
        Fri, 4 Oct 2024 10:19:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkpkD2OiWNJmVKzDa5LoZ8J+ZdUPWHMsFXSE6Z/kAL8XkoxKK3THLCd/5hgaZ+L2HkYqZ/AHRwPDrmvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFaV5x+PFhpa8dVZJvcH3wCOZiJ1D8wBvLKPC5NG1YxP7qXtXhkLXRuhnw5tzpASCA7lKX8
X-Received: by 2002:a05:6102:2911:b0:4a3:c8ab:d350 with SMTP id ada2fe7eead31-4a405908f46mr3069457137.27.1728062369824;
        Fri, 04 Oct 2024 10:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728062369; cv=none;
        d=google.com; s=arc-20240605;
        b=f9r6iNDM0YjADSWD9Hg5e0vSH4wbiYrjucwaz12z5a3Vw7Z4JPCUX0qBTm5VQGRrPt
         glijdfDDfOPddy+c1UjkoPiDwpDZaFIXddocJb6wx2S/7GIoMKnMV50QE5IwU2+sQtzt
         kdphoBX0/ZIS66ALBDkFB+5qQ1/OAGYPB6+Z3P1S//TWbLOw0R/KSyau1RKgcLQfiTzI
         AKa8izgZnP3bwGSjaV1jIdjlle311toywXEZa0Sk4QOHkR7K0aofyo7UCzANYFd5xNiW
         8aEHnOkmotrWsjf5GsYnXpK4FVE/TkNLrwYoOGako5NMfNCSszbngi2nlKSFTNbfFGpv
         MaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cRRtFUUt1Nwga/XyzX7IsYAsDRqRcwBi6s4hI5EmbYs=;
        fh=lj/l/qAx1vKsK/hXgvGe18ASSx3gsZXImv9fRB34P/c=;
        b=hgYcbdTpiw86iiws8lbxSAX08VGyz71o5+rsvm4srNZb7Kc6/J4bekTjxZ3o4ZFTbf
         4wuZznFblqt8kF3dtZ94Kv7PrnV65DBm/Ext9W3Em2SptXWaxeeTjPkz8Qbgw0OerXWH
         mRY2dGz8Bxvlq+1ViDsn8Q7jty8tzpA42Ojpgej8Y5PT6fcdcgJTAQyq74pTTKw1ta35
         gmeAHPEyT3gqXvv9ElvtsN+6ht7VxM+v3TDF2D8LLuhTuDFgYZe9eS6tenfPjDTcmE5J
         RRxkBzTXHg7nEfybSkQSudkszhvMjgEvRueTH3EQDtk1n5M1WYImK/PFAWoK3fdvohNz
         YCsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nxymdMAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a412e8f6casi77798137.261.2024.10.04.10.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 10:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nxymdMAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swlxS-0000kV-1C; Fri, 04 Oct 2024 13:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swlxN-0000jT-92
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 13:19:10 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swlxL-0002Zr-BH
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 13:19:08 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406e29so2939284a12.2
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 10:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728062344; x=1728667144; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRRtFUUt1Nwga/XyzX7IsYAsDRqRcwBi6s4hI5EmbYs=;
 b=nxymdMAD4eg2LOzx1UHX38sfwm16d2eUSbYXpy2GbL77hbgmMoUUDUH0czbyvmB2lk
 uvIhsf/ubRXPlsA0agRGCB4k3/VafZnOiR9JRSG9NpmTGWzriNgw/nKtoP17NPiY7CiS
 9hNhsBurB/fw/VlfiTOvaB4+5cWG5l4JDKLZlNEtmKUQi3BvXcaktHNNxnuh+W3ijGbB
 SmlKXMr+h11H45GBCfjc1WL0mW+fQ3Bk+lveU6oIB3CFVbRSBhggoPogGdNOnMARjFZ8
 xmQFugEW5v8qbFvC9aHTSmIKCK5hg2YwjP9suOu440k8Mlkwp9h7aYUo0BQi8W7IM0zx
 EKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728062344; x=1728667144;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRRtFUUt1Nwga/XyzX7IsYAsDRqRcwBi6s4hI5EmbYs=;
 b=Uyba150mbkqge9AKseipaq5j89MR8LZS2WROPhtol1qKVjv+jlJxWuRajjWl5MRJ1g
 +A0mDdxzY6dWRZR+D617bVRQdOK/wsplia8KalL132EQwPkWdPeLkRd27H84tQidymw5
 pfWm64/boJeX70Vadp/IPFqF1OWOAceYh3xatlFH3yxPATUSa0u9jpH32ieKAaiOe8aw
 zsxtHL3eFTdo9OSPZFrJujYbsnUl6R9X6lh6VbyjX9ndfyUkiweNBDStEm+FSVeb+NtJ
 fqHMdo0oXSz0y4/MLPsHgJEChHEbV4QgXf+mBQpooTAnEXtXG94cEhfkiDvdgRRWzw/V
 LzOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtGJz0AMoC+ysQazS45OjRvIROdeTm9uVxD/Y+n6ZvG1OoxOg4KTUFuF3mbu3IN9EucPoJaoAcYQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy42+v2x6JRLiBT9IWdtgaqLvH9AnyNISacRbKHT3Q4Uc8xaWbt
 FH1LnIsgVrOgHaZnQEJGoMF9z/0fizeRwav5KeYa08arvVRt1ylJ+XzLXi516gFilb4vH7UcNH8
 ZRN4xPI/G7lo4Y830xXhhU+mAiDButLaWN1N9BQ==
X-Received: by 2002:a05:6402:4312:b0:5c8:bb09:ae49 with SMTP id
 4fb4d7f45d1cf-5c8d2e24f38mr2838620a12.8.1728062343780; Fri, 04 Oct 2024
 10:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240903215309.32111-1-philmd@linaro.org>
In-Reply-To: <20240903215309.32111-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 18:18:52 +0100
Message-ID: <CAFEAcA8LVx03N8bp05oymus7_ZnvXn5i=dR7H=CA10n8nQCv=A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/omap1: Remove unused omap_uwire_attach() method
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: qI/3IxEWJysr

On Tue, 3 Sept 2024 at 22:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The recently removed 'cheetah' machine was the single user
> of the omap_uwire_attach() method. Remove it altogether with
> the uWireSlave structure. Replace the send/receive callbacks
> by Unimplemented logging.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> Based-on: <20240903160751.4100218-1-peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
