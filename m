Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp76512lfi;
        Mon, 18 Nov 2019 06:02:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxqdGRegyTrXjToKgyucjm4WEcJ5nbPBtKMbcX8e8UIwChp8eJj1zpsMJi/NVADOJA/M/vE
X-Received: by 2002:a37:9d0:: with SMTP id 199mr24573107qkj.356.1574085722116;
        Mon, 18 Nov 2019 06:02:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574085722; cv=none;
        d=google.com; s=arc-20160816;
        b=q9kqH7Nz5qKGiL7j/LCFJXyslQIJivk7oYxso0F8VAoytsX838//djFAyP10sS/3mG
         3fPp32KvrR/f8ohxyw8dgfFHwLpN+YcgAZd9gxq7KgZS0Rn1DRDl6yzrlq1NkwjONOKr
         f51KAnHVo0j6yA4ENIbRRLcRLGbWdqveMiu0iim5CyDZnWdi5SmIkTqr5/R/MPgMw5hh
         TTxMqEBw2SLRYRbqCAUtKsxkTGFERHSTcvXc+ES2p2wc//WtwAkPn7xq7xYRp0NUXCE/
         sxB5slidzfl7B4SCUovoecj4vULVWBWRd7ti2qrjIvNo2AwIue3sHZ+r6iVKZ3Ywh+3D
         cO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=WhTJ+1f501vkUHUKKPATnM7Xp5Jofmh8PwlYt2xJv04=;
        b=0S8dbte/aWm3eS7BLzCas57qBrfBZZxsWuM7+hNH5E2O8NLb2ScP4YQZxr7gfcApI8
         SLrIU10D+XZVXSXYuA6Lhy2FtrhAPbKwzoOF0oQ3sMqnMA+SS1MmHFidoHwSq7GFlbk4
         7KUus5yKi4Hkj7YMD9/X1Jlaxwy6dO71Ecv+IPfCoqJvozrOgC0Abae8Bs65T/r6YyOE
         hzIl5BV+bB0VL+6Q4XM08FzOGJX1KwD9ybkX6GhSecqUbEtifEEpZ4grrBNn2vJbfRhH
         q5G9aPBG6JF8FtQRxI7ntyHXFTibs8eQNpXYHswsrHo+yeY8IY9lxrmFdl2cnAU9lx6W
         SUbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=czZYA1o+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k21si11583449qtc.334.2019.11.18.06.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:02:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=czZYA1o+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWhbN-0007gS-HQ
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhaz-0007fc-Gv
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:01:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhay-00036o-92
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:01:37 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWhay-00035d-2O
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:01:36 -0500
Received: by mail-ot1-x343.google.com with SMTP id m15so14557661otq.7
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 06:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WhTJ+1f501vkUHUKKPATnM7Xp5Jofmh8PwlYt2xJv04=;
 b=czZYA1o+/tXtCZsPfFRxRlnAC8tk0E4LRhadp7zcBnSjx1/WLCUIHb2UU96/SPKu7t
 SFnmBhstG/ShVi3YogsViVEe8FSzAStDpCpSDc9SUJWfGlATY+CAMAVJHbD7tVbwRC0k
 6qZ7VbT6jMh28+P5AI36CiCXQJW3R3Mb0n7AVK0VMgu9HypeHGU+KpViqPQgXC4zuDU6
 roW/AzhMd2+zLhiGBmcFgfkYviXEHjDAY/JZ5pOE3rWB3oqlHX9PFM83KVkmvBbGU4Td
 0EPmqn++9ygbhjTxypSZsPk76nSXDQjVmqqAH9rHKZdb/Cxsvvlf527gP4DZSO2n8lZA
 FeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WhTJ+1f501vkUHUKKPATnM7Xp5Jofmh8PwlYt2xJv04=;
 b=k/0iX6tjjcX/8ug8V6gGZFPacTQKDrPUCBWoKMaUyrzXQDrjIfvhk8Ntp3gOmTHeLg
 RCqVFltrfsrCMGY/n13/q98MDQLY6cYUFYvqVakJgiR1dSaMunEcSwY5z/m7wlvMBXck
 7tfkXGSkx0Q5XiegkzoSjK6hCh0jNygenKcailaU4szoJ+TiMPpwJ79EoDM0Ym3rKGVA
 fjkD6ETnRomy0qIfUwq6NqrIezbcRKRr0xMSilHq4x1tnmPkOEaiNlXHqSRhC0In+4LN
 LSFJ65Kz8XsLcPaXLBFGrHrcFdEabftfYLhBssb607ZmOB9gM7SxI+9jugL3YdtSk43z
 CTog==
X-Gm-Message-State: APjAAAWmuuFtY2tNwwx0de7F8DivkwG5lg9k1dsYdEiCDQ8pIUqM88z/
 f21Xz8I7/OyMWAuy/DkrN5wSZIEAhGa61qRKt7fl7g==
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr22636654otn.135.1574085690697; 
 Mon, 18 Nov 2019 06:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-2-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-2-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:01:16 +0000
Message-ID: <CAFEAcA_k9TqzRJZ4=Q1jQP46SajiaMLEciSHZ83_CicMv__oiA@mail.gmail.com>
Subject: Re: [PATCH v3 01/33] qdev: remove unused qdev_prop_int64
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tc7909YqZav7

On Wed, 23 Oct 2019 at 18:32, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/core/qdev-properties.c    | 32 --------------------------------
>  include/hw/qdev-properties.h |  3 ---
>  2 files changed, 35 deletions(-)

I think I'd rather keep this. It's weird to not have a symmetric
set of properties for the common integer types, and annoying
for whoever next runs into a need for an int64 property to
have to reinstate the deleted code. (Yes, I know we don't
currently have int8 or int16.)

thanks
-- PMM
