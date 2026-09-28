Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815E3CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 12:16:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBAHZ-0007hb-7I; Mon, 28 Sep 2026 08:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAHV-0007hH-Qc
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:16:29 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAHU-0007Bl-9I
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:16:29 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 956f58d0204a3-67453dc240fso1589487d50.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 05:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597787; cv=none;
 d=google.com; s=arc-20260327;
 b=JQuz48QnW0Ah+fzNd8IdlpnCh8VA/Zkk3Ep6+i24O8DqUMuEbX+O+TgQpyYrJOXmID
 vSVBKzsZujzjxyl7wJMX2m8W5hRpopMupEZQIp1wuCIvQv0NtLDbMVOz/lCGLtrFKskv
 /8wc+T87gPy5GH36TPeYAiL3mno2o2SMxJwCWVgleoL3jZ8cHZqXYHwr2pFTf7GAqXsU
 /O+8E5oLVxwiwg2gQm/Yn8C0PGlbqsPQAcYap9VRgnTTIdt9PI4Pmm7M8cPtUQ7IOlve
 z2WPy2C2b6Ddtuo+nwOUrR7QRS0HQWnXdrjbNwbqkU+FF6QacMrQPKxBOaq/BYAeOi0r
 Yb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kNAr3nXN656vcUu+O2UeZX8j8adB5wy8ChCv+YwWyEY=;
 fh=hELKeDKw4tp2+RUEfhA1Iy8S5mPo58Fg6csbVfZqFmw=;
 b=dikY0yJ2OtRJlNJJIaqFHEkHqZwFb+BvkQ/Yy+e1XrKMKJLcrMWfRY1Z2NBmaOhhZ3
 ktqg63qsN+wtRIoIojvoswzetNC4hcO3+U090CAH/Ml+KeRs/AZtJtSIIRef97IRk001
 NIOhwPQhl5akCt95RjVEA3b7DazI9Od6uZwh/IrGJV3yB3CfX1nByDR6P95zy66dC7+z
 f6AXQHARpM8ZSl7Pkr2zz1IxX5Yx5/pMWVILr6U05HR2bAC5Xv0WXAf7vGdOSsqZrX1n
 KUXaTDbmXhv7cX2v9Z8Q+XjxalWm/rT0EjdhmfeFlS5fUGZj0QG6ZQMmNwCLs0xCGmhk
 kbDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790597787; x=1791202587; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kNAr3nXN656vcUu+O2UeZX8j8adB5wy8ChCv+YwWyEY=;
 b=l756n9tHXaDl6Akx4P3aMGsoeLZdLa/jqRtPyyuMuBsbtBzIz4GGxYzxGNPEOLAkZq
 UEhb8lS0e3Zsg+TW5H5Pvo1TbLwqs+F6q+vDgt3KZlcwDpUllhalLTdNjTrAa1BtsM9R
 XV4ALWZukca0I85GVCKftR+U3xE9wStgrHTmJfKJZyrL/x+wOjAUktkX5CBbOea6kG0J
 8giyWHY9I5rVElOjKZaW4wQgEJrPq88NB6eg0ds2VJl6lf8CZyMvSrpCNB6hVizRmXYi
 ncSSJD5Uk8DAvLDE9QXOvQU7d2zgTgkAcyVgm10LTU9Hc7ZHn0SBsCuamzGRqmOiCAFO
 mHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790597787; x=1791202587;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kNAr3nXN656vcUu+O2UeZX8j8adB5wy8ChCv+YwWyEY=;
 b=pgXOXIh9Gm43HE1vEJmVFpSAnJit7vD6YBK961dCgej2sHBitnMKHrk2ThrTzfYWHc
 DW+BDQHDWassurcZDDurqGZV+AYG8vY6CQ0E0mfohCMAzOE1iNTc4glmQX8SptCZWoKm
 2kKj2a3OnSB+YPl6SK6pyrC/p70B6PaCEzb5rbtCVejIf3YmWtT/E8BnyH8RrprmJWL/
 QZeGiGuLthcYRH5WFaAUrovnZzGERFfiKkdP9M0gv/rIMi3DZUB47AMA/N96BzOeLuGF
 hDIPRw/eF62JXabjthc8xOLa8/y3y5raITCULFJrKf9t330jCv/TThgSsr+j1MqJqs1h
 T45A==
X-Forwarded-Encrypted: i=1;
 AKwUvBy+1GLfTNfmrDUlwdp8kXqlgG5VpqVb1lHA50nlHsn+ZvmzLuj4a/iT9d6+v4M5wJG2XK1N7VY2bQ==@nongnu.org
X-Gm-Message-State: AFq9FYIZc6iBZdXBx87S0CqqZ73cNI3jPHffrGGiXDkBc9UiG99g00lh
 r89swql0E+/zWVLZEcW5bo3XYVyZxYFxsg+0jgf5dJ+gAg9tvQjGE0tNinUZWSiMCiCReD0RrUj
 eBgj4VTDkgzt/omaXKT6EJGTPWaMqqCm80gHwsy7y4A==
X-Gm-Gg: AYBFou3L4wW07BYKVxNq3lH2B9qtioZK5ohjX/WOCH4ucIuOHv1ankgaFsRfUI8FIio
 4g/6lU+lofnjm90l1NxWnwsO0nV/GGMtO4bBPZBVN6PzPLCkYZ+j+HovyOeTXypJutioy1/AptP
 0tHJToJRTCtUgT62S4Y0AKf9V1KFnoqKTubd6GYyTI8zVayqxj/keLclTLU8J6X5neMBRdMCraK
 fb9rnyt7CxWuZts5ByZXnpQywk8PUpr6W7QroBstKEubTf8wHzXz+umBzSmgkhh36bKeiSc68HN
 QpNA7pDw9D8bHTfldQPZnOeWIwyDElZ8tDvJAPmHVOTPsTPhTm4wA3DnAjM5/S8vOXLprI0GinO
 PFLrkXwmag9HH1sheHcXg4fRQujDCa+M6as4/dYI=
X-Received: by 2002:a05:690e:16a1:b0:675:2fda:6336 with SMTP id
 956f58d0204a3-6752fda69ecmr2458796d50.91.1790597786829; Mon, 28 Sep 2026
 05:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260926175634.2034094-1-satur9nine@gmail.com>
 <cdac79f2-13c3-4964-96a9-9def889c8eb6@oss.qualcomm.com>
In-Reply-To: <cdac79f2-13c3-4964-96a9-9def889c8eb6@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 13:16:12 +0100
X-Gm-Features: AclHuK86Icw2J8ca62bk7z-0PgqR8KUCqDPgSR5KoyQWy5idIMLkUFVjbo0l5Ns
Message-ID: <CAFEAcA8rpvvEfGx43Nj+usXib_HNHt=u+_xTF-Migb2vQ+xPKw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/char/stm32l4x5_usart.c: Support 16-bit writes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Jacob Whitaker Abrams <jwhitakera@gmail.com>, qemu-devel@nongnu.org, 
 Jacob Whitaker Abrams <satur9nine@gmail.com>, Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>,
 "open list:STM32L4x5 SoC Family" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, 28 Sept 2026 at 10:31, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 26/9/26 19:56, Jacob Whitaker Abrams wrote:
> > Official STM32CubeL4 drivers use and require support for 16-bit writes =
to
> > UART registers for proper function despite datasheet claims.
> >
> > Signed-off-by: Jacob Whitaker Abrams <satur9nine@gmail.com>
> > ---
> > v3:
> >   - Add suggested comment and set only valid.min_access_size to 4
> > v2:
> >   - Remove all changes other than supporting 16-bit writes UART regs
> >
> >   hw/char/stm32l4x5_usart.c          |  7 ++++++-
> >   tests/qtest/stm32l4x5_usart-test.c | 22 +++++++++++++++++++++-
> >   2 files changed, 27 insertions(+), 2 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Applied to target-arm.next, thanks. I expanded the commit message
slightly, to add:

"As the only 16 bit accesses we need to handle are ones to a
register's base address for registers that have no defined fields in
their top 16 bits, the emulation of 16-bit accesses provided by the
memory system core is good enough, and we can implement this by
updating .valid.min_access_size."

-- PMM

