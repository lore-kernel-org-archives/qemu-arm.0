Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp144864njc;
        Fri, 13 Jun 2025 03:06:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/vlB5k4vcucXaE9djsglVU+VdnAVY/8cH6N/3fDp+ME/3UJ6mNTix1YYN9a6vrL/EcxPBltJwoD51WA==@linaro.org
X-Google-Smtp-Source: AGHT+IHvyNIp4MpixuCw6vqFU1VcvGacrCQIJ0BXKSzgz3LNBLsYYkKFKnbT9p0uQzi7FDzVci+C
X-Received: by 2002:ac8:5c8a:0:b0:494:aca0:1116 with SMTP id d75a77b69052e-4a72ff15f49mr45632571cf.38.1749809161421;
        Fri, 13 Jun 2025 03:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749809161; cv=none;
        d=google.com; s=arc-20240605;
        b=dosJBQZOqWhzOK5lmOOnCD1Gs00MJchcTZ+hZi6HDToe/55R2s6Jzbkiz3O2Yltitm
         xMjtsRWht1AZ0pGPKxNbmp4kFUGUZSsQB70ksAAo8ksCaXfy4Jh7/NyVuVSx32VSFeYZ
         9OiOR++zp7L+bU43PTHwVeq8bKO4Ln35eU0L2bMhVOdVfRjonKVfZO+TIbeIGagZ8HzY
         AWISmm8L2O4qr8y6ZNxrVqHJmfCdjfuEioYuAixzY0+6xCa5hFysmzg0i7JkrX1TJkH6
         HAfD/7XmAVjcyAA0zMJIXLvFR8r/Tf9BAx5Re9kM70I+DV12L+PHQXMhi1KEop65TnYG
         XPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ASLjwtRAxStQtF93rw6d34LHCm0nYZsuFqAZ+YyWvew=;
        fh=Q6jZhfXCkCvtbyn2Wq0TIqJqckULhdPB+23LTKdWb6I=;
        b=C5vNM6HadsIff2n0R2Y2OmEumSNp2nEk8MQH9zNgdkW4naDkvc1zlvrCVTTUnIHSXy
         s8FFhCpn36/FEFwch3SuqoRkWGDtawdSVdsTG0ixLwbSYbFTwv4LaoTJHZLAEJf/bGdD
         7q9Is8A591YI0+ecd4wkd3oGyKEMnoZM8E1d+aesWzIA6MzeHob+KdiNFHHad1UEqsBZ
         AuT/8CjuLa0brHGKKhuA5uF2feCDUr3ie1+nwHC/T+lvh8/VxIGVjaQdp9+cTksriBq9
         TVSZ0Yb4yz3FnLB1wyh0hK3OziSTpMdoU2OFAm7PtfHtuyeUz1fu7Fk/XuhN2x0BAEGv
         DYOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QiuRuYy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b9ff8si27478211cf.68.2025.06.13.03.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 03:06:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QiuRuYy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ1Hk-0005qI-9x; Fri, 13 Jun 2025 06:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ1Hj-0005ox-0E
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 06:05:19 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ1Hg-00041N-9s
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 06:05:18 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-70e5e6ab7b8so15990857b3.1
 for <qemu-arm@nongnu.org>; Fri, 13 Jun 2025 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749809115; x=1750413915; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ASLjwtRAxStQtF93rw6d34LHCm0nYZsuFqAZ+YyWvew=;
 b=QiuRuYy/AdFvKtvBBZJIBC7QI/eCi316N8JVPFLQZAJGWeFs1llouI6SCY428une74
 MfiX2UlOeYSBOL4WV5b6rEpj5mKU1jR5Cy0Kv6IdlisNCVnohHjQ/Sv5fa9AUAPEK+wc
 XHj3+kgNycuLzVFTqFJ6+SFYgyK6/lf5fZ4hRyI/L623Dts4rfllwJuEKqz+HDaeS7a+
 0C+BLuMu1GZkVKzX+0/eq92JkNpEOefx0JjGwR9zZf0m6R0WVkn+ysqpxumH6+inl7cj
 kkaeTzQsxfaziuQ84Fjr74XEHFNcJAxz8qiFdzEMTmY4OF/TaknhjB72ptYy0ekL+a2/
 SRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749809115; x=1750413915;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASLjwtRAxStQtF93rw6d34LHCm0nYZsuFqAZ+YyWvew=;
 b=Xtpdvfcdg1Q3WwYqySW7749+zVaDTM7MwdCpEAfW82Jujd3mEN+BYCg5gesx4sPSNb
 SoTQbf10eW9Cjf7ixi8YClpTg3IqAck7zjeEWu5LYD9pTSV7iKgWVUjapdcDu7goHvDv
 lM4vlL0dVdIXVzkFJgI8ttsNl/3AvvBtDKbZdqnDytcnAvBivtS1+ZeM4ooa9zPmwIFs
 tcJOLdFAn52v2DPo1bsmcMduNyfXV8Wxe4ZyYZQSTw/Yjr6/Bp4QJuG/psuoe2tiaqCb
 w0CIMplmxKu62C4dTxZv1V/Tgq8ZDav3pEREvA/qOa1EPk4oZdYx+NSXR6KvDqxFcy/x
 Nr5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNM3Kr17QKonXR4OFU7oQPio1VUyfX+IhYReysCxm1ya353VO3LrnTKQLE8n0r0+S/3qyJLm5dHQ==@nongnu.org
X-Gm-Message-State: AOJu0YwtkOuVOjhDnxuzQfzpwATTyO3tWzBMj8+XgG9Sr/gOKoADILP6
 mmwsvEb0qZ8C4yTbyVHqSlA4tYVgnUUKjI5rFDUzQ48Nvnt+YPapLz+FWIaizO9FmfcMNYr13PI
 z2JCRehqkDlwdA5ASRVmngMhRstDX0iadPq5hZgNgM5EScxgXqwyn
X-Gm-Gg: ASbGncsgAFypsANSDd/F/1uPTM65WgP5LXe/feLkaXs2m5X+ogT4iPJ6LuapbaVZ3xW
 iq3jcP4tnHWblNGmABfxtJFa5Gdj8PM88r3/qAuNzDBsdoWt2sEmQoQzYy4nQZ+lGrvtZPRWIjq
 jAAJk1DgJGaCdU4ZH1oURDmmKMENNfZM32AGcfhGVVgbp6yU8Ojclxpkk=
X-Received: by 2002:a05:690c:688f:b0:70e:719e:754 with SMTP id
 00721157ae682-7116373c02fmr36974647b3.12.1749809114927; Fri, 13 Jun 2025
 03:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250531-clr-v3-1-377f9bf1746d@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250531-clr-v3-1-377f9bf1746d@rsg.ci.i.u-tokyo.ac.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 11:05:03 +0100
X-Gm-Features: AX0GCFstQPogjqmGJNYjMdQCAK7CTApNPVQ5FToff6E_PxhfhErvGKtQYSTTm4M
Message-ID: <CAFEAcA9nrW7N0=FUqXJ9x_+kxC4Qt4QtPf2n4QY8Wh6S84QXBA@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Define raw write for PMU CLR registers
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
X-TUID: lQ9fIUeeERVi

On Sat, 31 May 2025 at 13:11, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Raw writes to PMCNTENCLR and PMCNTENCLR_EL0 incorrectly used their
> default write function, which clears written bits instead of writes the
> raw value.
>
> PMINTENCLR and PMINTENCLR_EL1 are similar registers, but they instead
> had ARM_CP_NO_RAW. Commit 7a0e58fa6487 ("target-arm: Split NO_MIGRATE
> into ALIAS and NO_RAW") sugguests ARM_CP_ALIAS should be used instead of
> ARM_CP_NO_RAW in such a case:
>
> > We currently mark ARM coprocessor/system register definitions with
> > the flag ARM_CP_NO_MIGRATE for two different reasons:
> > 1) register is an alias on to state that's also visible via
> >    some other register, and that other register is the one
> >    responsible for migrating the state
> > 2) register is not actually state at all (for instance the TLB
> >    or cache maintenance operation "registers") and it makes no
> >    sense to attempt to migrate it or otherwise access the raw state
> >
> > This works fine for identifying which registers should be ignored
> > when performing migration, but we also use the same functions for
> > synchronizing system register state between QEMU and the kernel
> > when using KVM. In this case we don't want to try to sync state
> > into registers in category 2, but we do want to sync into registers
> > in category 1, because the kernel might have picked a different
> > one of the aliases as its choice for which one to expose for
> > migration.
>
> These registers fall in category 1 (ARM_CP_ALIAS), not category 2
> (ARM_CP_NO_RAW).
>
> ARM_CP_NO_RAW also has another undesired side effect that hides
> registers from GDB.
>
> Properly set raw write functions and drop the ARM_CP_NO_RAW flag from
> PMINTENCLR and PMINTENCLR_EL1; this fixes GDB/KVM state synchronization
> of PMCNTENCLR and PMCNTENCLR_EL0, and exposes all these four registers
> to GDB.
>
> It is not necessary to add ARM_CP_ALIAS to these registers because the
> flag is already set.
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>



Applied to target-arm.next, thanks.

-- PMM
