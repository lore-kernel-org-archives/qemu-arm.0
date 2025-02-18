Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp594967njb;
        Tue, 18 Feb 2025 02:34:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoTkVA5f1GlQmr3hsf1DdMInPNkl6OAjiHxlxLrgKk9N54DYxVQuS6PiDgBUtlE77gkzPADzW2WRX1RA==@linaro.org
X-Google-Smtp-Source: AGHT+IEE0P8+E0S8E9eCG5EQ8IIxidb1T/3BcsOgS0H9JaYc6A3LCMpDK6+I12Lki94YewfxYoGf
X-Received: by 2002:a05:6214:29cb:b0:6e4:2ef4:2a01 with SMTP id 6a1803df08f44-6e66ccccc72mr193435226d6.22.1739874883643;
        Tue, 18 Feb 2025 02:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739874883; cv=none;
        d=google.com; s=arc-20240605;
        b=XXMwyhehxvGeBMr1EDux0P+RdH9f4a1mIyEKqL5oeNtEy5I5aA68GfNfNP0o87Ro0I
         xBRVvBMTK1zYGnX/Jfi7q81xSVetSQcmV29AcZHW+IOjpn3WFWVe957WV2F6gxi3aTaf
         3CbQoBhAlXohDHW+EIZGz3UPUIXxSPNzxv5Q51JNid3augLmGIZrHivrlI3bZ2Auv4NY
         FfdBl/kTVpCSKv2wSbdzv8LTs/g1jUhIbJbeszLYvEdQCxnTEFEverCGFSX5JNTPylGL
         KIwYrFC3+13K2Qka03QP5W7VvEfs0TDYZb/dfw8BHYL449+savh6LVY+Bwa8yT1I1hbS
         uD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3ZMBmVs5XRmd0x+E9pD+oKiYoHw6RL9O2OW6WpxeJPY=;
        fh=slyLyflB3zhh15feRyXiu18/txdXokVriuEkTWo3SaM=;
        b=Ouh1OqOUd5hqYFBX5JK83gOsRIyol++U7C8PdgYvWXASUf8ke1eXINENHCxEhpUDTz
         4jBTRlgfZ6lx+s3q1h2X4N2wLQMNiic74Z7JeqFfb62NrAwwTYcNHu5Pglc6DzkQgBeo
         BnLpN2k0VF3U6ptdp7pZ6AcENRAS3QrQL/U4VzqZzFfIvI+30MEKX82qDIQWT5Cm30hT
         M8DNETCynZ0Dn8tLlnU2WGPVZ4Z86w3x9ZWU3PJb2anX0VuT4lIYoaPzgfjbPsXdxgL8
         Fk9heoTntMxLATZyDSwT5G7VGmRLYbbMKxUIFK/hpW0IxLz5PcdooHFtnPljtWwG6/HJ
         9SKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yshFPwnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9a2136si104766836d6.192.2025.02.18.02.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 02:34:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yshFPwnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkKvA-0001ru-Ql; Tue, 18 Feb 2025 05:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tkKv8-0001r2-AL
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 05:33:42 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tkKv5-0000pW-Dd
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 05:33:41 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-6f678a27787so45135157b3.1
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2025 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739874817; x=1740479617; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ZMBmVs5XRmd0x+E9pD+oKiYoHw6RL9O2OW6WpxeJPY=;
 b=yshFPwnH3EkShN4pUPzJCHsSjBEX6YrjsKhzcGEvWAcoy3jyVTyraPtk+7Avnc+VuE
 sxC6IK7QoMPXfKSb2kuV4k2TEz21esDySriPRdvanw0QkZpwfKH0wT05mAxjJxrNWIZB
 iSb3jHhuUsOXdMcfbvFXQZqI0UN5M3eF30luq0gVBKUOQcBaxovulgqUowMWvQi3LI/U
 LDOnmx/wVLFkwpxJ884GHYv42HgyYOK6Q6FVQaOgTLyVnIp8f77TOdZmgKoQZHxRlyLu
 /xFMqzXds9y3K+wn7TJf86iLPNEStiDO/PtHiBbGrNK19IZ5/p6jt2p+BTDGHSI8WC/K
 WhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739874817; x=1740479617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ZMBmVs5XRmd0x+E9pD+oKiYoHw6RL9O2OW6WpxeJPY=;
 b=dKo5VXjZFcPgtNPHAjpi96JcucKao+4eh4qOmg/w2o/CVwbDbF+u4l1hAorb0GSS96
 pmKGhAJUaOktmbAEOldRaIwP0tkEMIMg4udmMWrIF8276jfvqQnF2/yer6z7n+EAXczy
 mB0vHsoQWW9cmG6SMIwxigp9fC5/sQn3y52o5/7G1i6V/ICE+3iOWHvVS2zFuarAe597
 Vhe+4L/wIBl/6/5rMSJu/cmjpBKg3iH7dnDMT5/xWUgrf8JGahojb6pNw2F/+KzltaIu
 xjVtTxhe1H4fkSZkEG/S1VlQnI3xDk50kfJVyjUnDkSi0Io2bAKg+EIPegaG074fKl8n
 LHqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTpCBC+MwzUstz1G1NpDMmwq851XClXsb2H57eXGmkFvflep5Wthy/otUFg0ufv3PinKx2vRBb+g==@nongnu.org
X-Gm-Message-State: AOJu0YynZD7z+1ofjU5DuYuVJ7nYcjJR7eHk1VcpK/hFICipLtt5qbdS
 sYq+1UktHib9XazJfbrwwAQXAAjDMxH5ngzF0LaaP45Ksrf0lmXcUckzwuKahKKgm77yqaBJwCU
 dytH5FXR2qFnxxayTFjKg0C8cjZy19bgv4mel5Q==
X-Gm-Gg: ASbGnctFSGECdlNl4I9NZkHfax91kfx8Goc8H0Wt+vYzxtQLM8exm5eQunEevRjKqqL
 Fv0PlKkG9fPnIKRIiScKzSEtM3o8b6Glf3o3+Nt49NT8i/ywPwX4WEusCg563IEC2hz9exCg4RQ
 ==
X-Received: by 2002:a05:6902:2582:b0:e57:f8cd:f0a4 with SMTP id
 3f1490d57ef6-e5dc91dcaa6mr8628872276.34.1739874817456; Tue, 18 Feb 2025
 02:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-4-shentey@gmail.com>
 <CAFEAcA8yayMSe+64VDV8TwSMi7u0_wLM+y9-TKsnaZS5seNKZA@mail.gmail.com>
 <18125593-7729-40FA-9FC1-7DC912287503@gmail.com>
In-Reply-To: <18125593-7729-40FA-9FC1-7DC912287503@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2025 10:33:26 +0000
X-Gm-Features: AWEUYZlsppH-2icB6RCfvtouUYvl1m3E3sPeDA__8q4ovSspImO-7xZxHurUO9Q
Message-ID: <CAFEAcA_4ONvJB0xSSGKo4RXVfjBxck8N3mD6G=n=DKbfK4r41g@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] hw/gpio/pca955*: Move Kconfig switches next to
 implementations
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-TUID: JNj5HSGcgMRX

On Mon, 17 Feb 2025 at 20:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 17. Februar 2025 13:35:04 UTC schrieb Peter Maydell <peter.maydell@lin=
aro.org>:
> >On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >> While at it and since they are user-creatable, build them when
> >> CONFIG_I2C_DEVICES is set.
> >
> >The patch subject says this is just a rearrangement
> >of the Kconfig stanzas with no behaviour change, but then the
> >commit message body includes one.
> >
> >If you want to build these when CONFIG_I2C_DEVICES is set,
> >that should be its own patch that does that.
> >
> >(The move of the Kconfig bits to hw/gpio is fixing a bug
> >in 6328d8ffa6cb9d ("misc/pca955*: Move models under hw/gpio"),
> >which moved the code but forgot to move the Kconfig sections.)
>
> Okay, I'll split the patch and use above commit message.
>
> >
> >Separately, it's unclear to me how worthwhile it is to add
> >these to CONFIG_I2C_DEVICES, because they're GPIO devices,
> >which means there's not much you can do with them as a user:
> >as far as I know you can't wire the output/input GPIO lines
> >up to anything. We have the device models mainly for boards
> >which provide them, so that guest code that expects to see
> >them doesn't fall over on bootup, and because the board
> >model code does have the APIs to wire up the GPIO lines.
>
> It's basically to satisfy Linux which will clog the i2c bus if such a GPI=
O expander is configured in the DTB but missing in the emulation (it will d=
efer probing which will never make progress). Once it is its own patch we c=
an decide separately how to proceed with it, e.g. dropping.

If Linux wants to see it because it's in the dtb for the
hardware it sounds like the right answer is that we
should create it in the board code, which we can do
without adding it to CONFIG_I2C_DEVICES, because we
can make the board code's Kconfig do "select PCA9552",
like the aspeed board does already.

thanks
-- PMM
