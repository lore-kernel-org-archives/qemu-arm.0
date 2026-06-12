Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76751CD98CE
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 17:47:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wY5yF-0001yu-37; Fri, 12 Jun 2026 13:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wY5yA-0001yU-8b
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 13:47:02 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wY5y8-000740-OO
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 13:47:02 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-7ddd3d67084so14615457b3.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 10:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781286419; cv=none;
 d=google.com; s=arc-20240605;
 b=EJ5M4Y7DePFHjEVxl8qZPYIzVZX8eb9fSX6h6Ev+d0bkmabmzaxv5aRvN9jzLKu0nV
 g2eJLPfJtVX/86gWbKkD8VZtl6pftoIKHeNfmEuYoeqUTnikh3tDQMpEYdsqOTVVm11E
 ir2QfnA3lIO/qgbQOvxB+KdIAlheUFveNHJJWZj6RxerjCPTVqH2VNIunGe8TBNR+to9
 HZwyvD+m84iZ9IZO1NQbtkFgREkE3hOvl7Kv18ZNDhvVMb6cE5VdocdUnKEsH4/3wdrx
 bOOKdzxFBspLf7cytZYUkm3rDJ5n+yevTmZYxXDG6TGWmXYIvMmaWfQzPdOlovz3G0Gu
 Bqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6NYLGsou+SrQn1Uo3K1b+FXzLLeRzUniiiOLWmx22qQ=;
 fh=Zhj5I8f0EqzCxfWepo9CigbaV8ympRvRQbrEbQdv41o=;
 b=GAhX12Vs4sprVC4q98mh+HN663WPELQQvBH2np56thCQCnjftMIcpCVtwiCNNznqhO
 BFEObrqgFhY1ylzUKRcXGUVhnXNOBuRl5rjpWeUp95B69B1ks2znpwkICtQnO9FdvHdG
 GAR6l8/sh6w6zvukBQQONwwPsedSvdZ6o2zHxQpk+bQHUJDTlOZZg7l8JLJkhMFDRSmB
 remAzt+dsBC8fknv0oTWM0iYaAnaA/rQfsEYw+yhI2MopsSutY6OHT2M90kebdPMsX7r
 Jiroo6YL1XrTa1eX22S+HjctGHXXt8JODBNF4Ui5tCv4kMpd+Sif/ksIyS7efoeGjPGh
 39fg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781286419; x=1781891219; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NYLGsou+SrQn1Uo3K1b+FXzLLeRzUniiiOLWmx22qQ=;
 b=TnAiUDYVIT7N8eZEQbjzC6GRnJU8UoMs4h4UioG3w00x0ikvJ8pne3sNnb7YSsdcFM
 RmoL3iZwB+VUQq8vbNj/Kr8i3OehPEBBkHJtQO00KvcGjhx2eaFsb/3W8+SI2gyw4taB
 L7gJOrePFthuqAwKC8lutKrMEEBYpZ6FYWu8yTBpgxVsW1Fhykk6rXYKDwd2ZFJkr40E
 GCdKDQenfNyjnUr1Tu4EUiwuSWYEDYCcXnDTrUd5HjBATXlRDu7Mej1qKBilb+1oJccl
 O9idX1cho0ZjaPsog884JuEqVxLu5FYIkbRzX32BMBRJamoFeuVpLmjntM7VRl+JMp8Q
 edjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781286419; x=1781891219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6NYLGsou+SrQn1Uo3K1b+FXzLLeRzUniiiOLWmx22qQ=;
 b=c9OUQ6r8lVF2asf5RXAJXghRo3VaHIY05FbBigy1v6kcA85DbA9p6RDYIDxEPJm7c9
 w/ZpAwEesgaTctEPSovx4ESG7UaAloalvI/6RWMZdVXS76MmjwUUo1MOrl6QDRseknLv
 cV+w2UlZtkqv3+ebkRnq8z5VARKdz1WrjneeIGA2R0dtOANCs4PxBxg02O8+AmS7QVv1
 3/F6E2X1z9Ny7qmK/1Sxt9iXTWbeWYmdIuOyS1NKCfNMoZsgJlK7ZC+FhUOWfyEisn//
 bPi/a+WvEIT9rFsxnq/dzof5VwJAw/8xQpy5JKrDV7XZmKOGoS0QSY9pGtfUU5n5ze8m
 XLgA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9wh+0bak8DNi0bRK4j+ZzCgmQHGuDBWo8JOmFtU9ivzs4AF33sJDYmu+4BuNUpDpUVIzVVR3ytzQ==@nongnu.org
X-Gm-Message-State: AOJu0YzvHB9JhoFiOeHUGJSjvmzEiddbsnctdY4JSZgPbFTEfbXyFX9s
 FpdXma5axPbuaRUwr8y+Qp7+3E/RCB8FKJE9c4lAovTytfr/Ms8oguHWU+/dYZS2NchofEfT2Ib
 MXbFwgZe/xxLW3ztrTOzMuOx32fpYqfuJiD0Ut3NRxA==
X-Gm-Gg: Acq92OG56faHsoxdJcx9MMFe4i0CGlvZKihRzJc7jtWEV8iwfryL29bRHXqawaVBYxN
 ee/NbhJk2Xo+/GFGbp9sxManJlyLyAGBjCxzoV3smIX8Yl9DeuC3guTgvZ+TVnXSdie7zDhylOx
 RS+YhcrR/gza4Jlml6aDhlfdwODs02jFw3CsCtKtYtC90mdl5mHNLCgioMCKeu7wlP9S82gFTa/
 F1hneVuI8n/+rUWuh302I18g0iXSuBP2kHNoZeRRwVozOPmLHLdd0VWXGiJI6CjPTBoKsqJFjo+
 zu111yKy8wRGoY9jmWEmSI/H4YAZoa1rt3Hk5F2nzYqqJ9n4b+ytMlGvirK80x4KejE=
X-Received: by 2002:a05:690e:b82:b0:660:1a82:223b with SMTP id
 956f58d0204a3-662780081f5mr3382004d50.29.1781286419274; Fri, 12 Jun 2026
 10:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260529082948.363931-1-alex.bennee@linaro.org>
 <CAFEAcA94+mh_pigFDi+tEPRJ416fSWfxsQ1Lj8Byemug9kBp6w@mail.gmail.com>
 <87h5n7ekxw.fsf@draig.linaro.org>
In-Reply-To: <87h5n7ekxw.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jun 2026 18:46:48 +0100
X-Gm-Features: AVVi8Cfx4_sZkUhwcX_oNU5Emb8YeLHTOGRvGVAOZ3vEMDeOVNiiOkvDqj4FcZg
Message-ID: <CAFEAcA8yNGiKeMpN_wgWtc5EnfjsnxSvG6an4-UjBf6XG+4Yvw@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] target/arm: fully model WFxT instructions for
 A-profile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 12 Jun 2026 at 18:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 29 May 2026 at 09:29, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> This series fully models the behaviour of WFxT instructions. We
> >> already had support for WFE for M-profile but we left off A-profile as
> >> it has more potential sources of wake-ups. The main one is the event
> >> stream which includes events from significant bits of the timer
> >> ticking over.
> >>
> >> The refactoring from the previous iterations of the patch have now
> >> been merged.
> >>
> >> I've dropped trying to fully model the global monitor in favour of
> >> taking advantage of the architectural flexibility to have an IMPDEF
> >> event wake up for any reason. We treat the setting of exclusive_addr
> >> as such a reason because it indicates the current vCPU is in a ldstx
> >> exclusive region and we don't want the guest to deadlock. This does me=
an
> >> the system won't sleep on WFE enabled locks but people shouldn't be
> >> relying on QEMU to model real world sleep patterns anyway given the
> >> efficiency of emulation compared to real HW.
> >>
> >> I've written a test case using kvm-unit-tests:
> >>
> >>   Message-ID: <20260527111822.1563679-1-alex.bennee@linaro.org>
> >>   Date: Wed, 27 May 2026 12:18:21 +0100
> >>   Subject: [kvm-unit-tests PATCH v2] arm: add wfx test case
> >>   From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.o=
rg>
> >>
> >> All patches are now reviewed.
> >
> >
> >
> > Applied to target-arm.next, thanks.
>
> Is it too late to drop them? I've a fix for 2/8:

That change is already in upstream git, so you'll need to
send the fix as a standalone patch, I'm afraid.

-- PMM

