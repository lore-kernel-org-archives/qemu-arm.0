Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05767CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 09:54:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3tUK-0005ZJ-Q3; Wed, 01 Oct 2025 05:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v3tUI-0005YN-Mk
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 05:51:06 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v3tU7-0005y3-Ad
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 05:51:05 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-71d603acc23so69260437b3.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759312243; x=1759917043; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxES0pfI3HKwE+3of0zLPi5rklnQ2/Ap40KbdY26wr8=;
 b=I8i9R02LFuNGbXIrseaEcDoyNccLHMXiARut0XRvuJKiNB91Tk79VCmCiaBqsWmFaI
 a6INARgoEuC5h0t3v3j/fRQbT3re+9zTO9k+jO6Qz9tgZbjvEIOKInuLz7qEm4eQb+Lt
 fRPxtH+lyelv3K9Sr6MLSV/2X2KzAR+1FXZTi+zvp/An3sigTitP8Vz2vJTK3Tl3DMND
 DlyQ9w39py9zI5Zr0LZ6D9a6jFcOjTFUvCGtS8SJzd5apu13dNbyY+xmFzZXZ1mkSkLK
 NXtWCgNJpp/QdcI5Cl99AU+BSHhGf5IglPBmywU6SccdA0/zEotUbB8I8RyvJcv9UqbJ
 rOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759312243; x=1759917043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxES0pfI3HKwE+3of0zLPi5rklnQ2/Ap40KbdY26wr8=;
 b=h4m7F7qYTKOrjU6iT9QtrF597TkPvas3DSAUmXImm/0nlSVwQqgY1BJePK80TarnYI
 /MWojijzM7IWb/k5pkIQHk1LnMTm56/OdqooCqBumg0Ja/LCWWmLFtw2KxgfUj/cUYUn
 EtKrGxk0VUzEmFidCCU50a9nyOCc+7M65Q33wFzMZMYe5xXbwjuefus9pd5Ra0U0DfcM
 qpJIYNiZGM9OrcLbcCTEFcfEtc3F27swpO5YCZhsJ60rTOHWJD0aw0o2l1m8FDcuuWnH
 /V1qrz5LtOxs2ZG7MPTn1/LYH9Vt6DSxUS0svRZIHQH/eh+juENEZvpic3dQiJUPFBdh
 fINA==
X-Gm-Message-State: AOJu0Yx5lCZy0BpmPOBIWHNe8mw0XqKrofUUQlbM+sv/FGHAWei78a7t
 Oc5SG/g4AZBtaCeLJzVG519yaMegA/ilAZ6GfHoRM+a4Gsx1/WtwEEc/sKbp7m3TiTiMEn/NIgd
 LJY8/zMfTav9KrEY6ibJvICbjkJtXWWb3jRcr5Ms0XA==
X-Gm-Gg: ASbGncuEuR5ljDJJh8Ef/GCAXslxJTC6K4RyJL6jFhn4LVlZIzolmJcEzQGwTvvVmo/
 rdrirzJ8wJp7w4JTpny05qdERCQInDPxRMzv0iSuQreXqUUsAHfLrDSxAMSCZWFLddoQRiTr6Wr
 lKiy4b6fvurm4d6bSbsH+G1FS0iG2BSRJJa+E+madAiWmNm6XkcoYl1bkAmAwiTmWkmEnFXrj+j
 qmJ5OGQ2WMgM2hiCOvmP+S2zbltV8LD
X-Google-Smtp-Source: AGHT+IGoTT2hGX0cT8ZRmvu/PArcEeVl6Y2NlXRuEGSIhm920DMiLD6pNN+aZdku9kFkFOaBgfX8PUG13IHVasfkDeM=
X-Received: by 2002:a05:690e:2490:b0:635:4ed0:5730 with SMTP id
 956f58d0204a3-63b700cfb19mr3000791d50.52.1759312242626; Wed, 01 Oct 2025
 02:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ307Eg67ri0=-ocEr-q=Y9+OY-9XKGFb5AYh59-X8szH+3Ryg@mail.gmail.com>
In-Reply-To: <CAJ307Eg67ri0=-ocEr-q=Y9+OY-9XKGFb5AYh59-X8szH+3Ryg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Oct 2025 10:50:30 +0100
X-Gm-Features: AS18NWAFJPmxPV8ov0rLfCjyNtFatv2hM8pKUv0tQG4IGJ0X0eTY_9pUeGZedtg
Message-ID: <CAFEAcA8MBFd45meJ5baOAacRTwnb+9VAUB_tMYsg3OQvXKcBgw@mail.gmail.com>
Subject: Re: [QUESTION] aarch64=off with TCG
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-arm@nongnu.org, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Wed, 1 Oct 2025 at 09:55, Cl=C3=A9ment Chigot <chigot@adacore.com> wrote=
:
> I'm wondering if the check [1] preventing "aarch64=3Doff" without KMV is
> still valid nowadays and if yes, if anyone has ideas about what are
> the remaining blockers ?

I did have a look at this a while back. A lot of it was "audit
the code to make sure it's not relying on an assumption we will
now be breaking", which I think I did most of. Some of the
preliminary patches I already upstreamed (e.g. the elimination of
the TYPE_AARCH64_CPU subclass). My TODO list from my notes is
down to basically enforcing that the user doesn't select invalid
option combinations:

 * forbid weird prop configs like aarch64=3Doff,sve=3Don if we don't alread=
y
 * forbid -cpu max,aarch64=3Doff for usermode
 * forbid -cpu whatever,aarch64=3Doff when it doesn't implement AArch32
   at the relevant EL

so my "allow aarch64=3Doff" patch is a bit more complicated than
just removing the check because it tries to enforce at least
some of those.

I also have some local patches which make an AArch64 CPU with
aarch64=3Doff manually zero out all the aa64_ ID reg values, so
that feature checks on an aa64_foo feature don't pass. This
lets us avoid having to go through and manually add extra
"if AARCH64 && ..." clauses to all those feature checks.
I need to rebase those and look at whether they're ready to
send out.

Other than that, I think it's mostly testing.

I'll see if I can do that rebase and at least send it out as
an RFC patchset.

thanks
-- PMM

