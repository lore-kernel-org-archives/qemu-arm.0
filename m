Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2845514njh;
        Mon, 2 Jun 2025 08:51:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjDeeDXLj0VdjdXRnX3/aubUZoPRuD6fGB/2PMYCLuzck9+0oV8m1SqE6Av+3P5yiObvQrvDEIzaeqyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGqmcftsUosX4W/bWl7CgCVKELyl62l0eQilA4yWG2JF4+65Brdpj96laG1RkWIHI3j3x8A
X-Received: by 2002:a05:622a:598e:b0:494:b8d0:7d99 with SMTP id d75a77b69052e-4a4323780cdmr360806161cf.26.1748879492912;
        Mon, 02 Jun 2025 08:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748879492; cv=none;
        d=google.com; s=arc-20240605;
        b=B2uFipFKw332vfNuXLSsY3s9v9HVWphuxsET1LQVilZC2clbhj5RPqnDw7fHfjGNIL
         9gdPCkB7aXRHqGkPhdmcZg8FBlxTNBOnWOulV3JN1hRxaHZbuP5Vwv3HYOJ2Z8Fe8imj
         LndL8nx2d2nXRRs0zSJLgrO/TvRSbv5icl72O0muhJVr8WrEJHbQftiDGpqoG4H+zNlK
         Gj67RJ2HP8bWHfATwXtsZu7gLvNzrliAXMEK+mxO+eND79bHx8W3ZVxtQAg2nrQDvgXT
         4cdr5m3a/rT7GZ3zevWrJY5f7XLMrJmOozxvXatHXaGPAEjHi7cWZkxtfSgPE/ki3KC8
         IFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=axmal6ATX2PJQugNB8vvmc0gslsa+RSWT01c45nE8Io=;
        fh=LGpRaMrmQySFDuU2wMC5t5LTpruzFGssTk1jq6/NjFg=;
        b=ih5lPVwfHTEUxuWzSorlcm7XWuKnd4CSpNcVIXC8pwUJ3adJXAcwYoij2GWVBb44n/
         dx3CVPSBYy0wPKeSDCGCqcIdOGXdhuBd2e5VYwjbvygq6hjjcuPclk4dbMzTRikVb1+S
         5ChayV/1ZqX3EMJt5cBcQkqDgPv/QhNAevptLLP5/7ADwkz+qu6n6ahc8N30DpuwR+aq
         xeJOCxQVHeAIRLXz6BDK/x3SwgB5NEv/T1XMG4kKAKt3VaAyo54IXl84o/K7RFbxOCcV
         XHHULGEwwnTWAr2uDBvHjk3At9HHRZC46HqgyYx7L2DmGZMQhL7d1BVQq4N5WhtsnClb
         fZSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=HPjwlcrz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a435a933b4si106029421cf.590.2025.06.02.08.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 08:51:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=HPjwlcrz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uM7Rd-0002Uv-QL; Mon, 02 Jun 2025 11:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1uM7Rc-0002U6-4z
 for qemu-arm@nongnu.org; Mon, 02 Jun 2025 11:51:24 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1uM7Ra-0004ve-Ef
 for qemu-arm@nongnu.org; Mon, 02 Jun 2025 11:51:23 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b2c4476d381so3712347a12.0
 for <qemu-arm@nongnu.org>; Mon, 02 Jun 2025 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1748879480; x=1749484280;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axmal6ATX2PJQugNB8vvmc0gslsa+RSWT01c45nE8Io=;
 b=HPjwlcrzNPnf7XjRLv3ims8aGRsdscHcN2SzHMx1YPyLEAV5Nw8ivgCO4lVbUwiYgl
 ozcGTqqRI3uR+7foqWKG2NAS9GjPaIA46cYsUEvbPApSa2/3tbvQTCby/jxpqaZO6m2T
 jFhcTNMyqtA8sDDB0CG/6TbtPEHr0ja0y12jEVOK7mII9tehksRtb+589K3DTLWgnROX
 vs1GcnHm2t34QOhAy3Y8FT+n8l6j5R0Y5SqVuwBzIS7pwir/stmobE7mCo7DufVkBBi0
 5ZSGT7I2OnbbRFu3Rj5lOR6gEjxXwPXlcZqZGUH114aC2YyDXe2trHxTZPOEteEDzFDL
 sU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748879480; x=1749484280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axmal6ATX2PJQugNB8vvmc0gslsa+RSWT01c45nE8Io=;
 b=Xl4O5NRV540v7+mu4NxGVSzfScNbQ967GaIJ4cwrr7BZpLqXjfIo+N2sPjpJflAubH
 yreW5LSQj4UPJlGhSlfBA/zVyQsiHmXzF/d06wwCTAoLUyVidB2fpzbzL+lD4QiDR0GP
 K+UojmFbwC1wd26ov6LJgg09W+By5GbFM9lh7RAflBzaueUmkrrArZJnWoRbbTV+/3rl
 BTAA1+IXLO1rJtKfKmTONl2FX4z4vV5FZBnGXS+ptwMqg9YzWtYxv+HFKKoxcwPf9xoL
 iyAxuxm7xE4xzQrLOWzTxEFqRLclayXKgRpjtEZGTrdgyzW9t9rIa/dj3tury1gviGRS
 DjJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdJWxxPZR1rorYLoCQiev1josZnh90J8nAOAl5hf5DWk/6kEQGFv+/lY3HpaE31R8dPoofQZCY4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz6ij9rBshRZtxGpYWpder4o+11Bq0wCQTbUEkFuZUvVzeb2B7d
 mK1kwhvLmxxrExum+QaPXMYK47S5yYd9/AjaS11Ee//l5YydXMQZ8Rv0DcPs3njwfdjFQNKKTZc
 Z+HoqW5sfj5gBWIEEflc4KpQ99DLRilbI0bK1myOLYw==
X-Gm-Gg: ASbGncsit6XO7jAJjZ5aQzg1XNnl71dm2qGUdUE+M/TdCM73lRzra1R/ZlDxs44UwVK
 EfymR/yahs0DSwax5gvv8UnuPExfs7yq6U75levtyYSEcvLeriAaBzmAFR4C2lrIDax4x147vDd
 ZfbjPTHdbEFiNSv4biMgGBGorrQwNmOw2H
X-Received: by 2002:a17:90b:538e:b0:311:a5ab:3d47 with SMTP id
 98e67ed59e1d1-31245cce4a3mr20426567a91.1.1748879479852; Mon, 02 Jun 2025
 08:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <7aae8238-f7f4-4f3a-9a7e-e9afc99d1d0c@redhat.com>
In-Reply-To: <7aae8238-f7f4-4f3a-9a7e-e9afc99d1d0c@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 2 Jun 2025 09:51:08 -0600
X-Gm-Features: AX0GCFvOxGyh8BreulI_guA0Ugn3eU0WMnsh-psDKwyZMhs6WkkLafpqk1of94w
Message-ID: <CANCZdfqnGfMOk8FPSjfRbS9uUFohdO4ySQT=7i0+x0AZts7xiw@mail.gmail.com>
Subject: Re: Is anybody still using the "highbank" or "midway" QEMU machines?
To: Thomas Huth <thuth@redhat.com>
Cc: Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=wlosh@bsdimp.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: Hihozt6tWWNA

On Fri, May 30, 2025 at 8:24=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrot=
e:
> I was trying to create a functional test for the "highbank" and "midway" =
arm
> machines of QEMU, and only succeeded after lots of trial and error to boo=
t
> something on the "highbank" machine. Peter mentioned on IRC that he also
> does not test these machines by default, so we started wondering whether
> anybody is still using these machines? If not, we should maybe start the
> deprecation process for those instead?


FreeBSD never used these for our CI testing, and we're not going to even th=
ink
about it, even if it wasn't in the deprecation path. This hardware is
too old and
too niche for us to care about (I think we even lack the proper drivers for=
 that
platform anyway).

We do use QEMU for a number of other things, we just don't use this model,
nor do we document it in any of the docs that talk about FreeBSD running un=
der
qemu.

Warner
