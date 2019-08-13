Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1005476wrs;
        Tue, 13 Aug 2019 07:04:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsW88jMcCju9hm3MP524kN02iJ41PLrvKf3RmBYxD0Fkmv+FTW+ZFycSXwpPOzCmu5lW4a
X-Received: by 2002:ac8:6c48:: with SMTP id z8mr23117074qtu.58.1565705076762;
        Tue, 13 Aug 2019 07:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565705076; cv=none;
        d=google.com; s=arc-20160816;
        b=i7Z1XsHvg5heOZhGreQhM2/kf4ONVKX0eCoxO6iz1B3uweQ61jU9FbUpkd5FwgM0yV
         7nJXA9NXfk5x/wtmAfYtzykeHT2rslnOEq7bP3AppHOFDwc5WtQHoZmeyqed/jkte8SE
         Fv2qOI+43gLz/oRR3sm6FiEoNpI7zksY9DOuud56wqZoZA9Awa3FfaTEtyxnsW6zpVdQ
         ZwBnkZzbxPIHuAdgF/W31ffocQhKc0ZM5UiasqqZa5t5Aj1RhOTL0oamJMoDUNdFNFip
         7v6NHKRqUFljGnD5sLQLZkDTLv2GAoSQaJSOsIiH+GluATzSqqZdh6oLeCe/g0T69+UE
         XO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Gqno2bwVp3LtKwfLy2Hjl9itq2o/QczhQjLnU8vsBL4=;
        b=WZGu+Yqmmgv6cG+tOzopvlXZ32OhJtG8sizPxkqVdScInKxholJTp5BORUVDiB/e3I
         bkiXeDm9XdjRoivsL2ZPyDU+M6Ik8tXXC6IV4sHPvGrQ3YCwhfQJ2HXc7hucvjsn6125
         /A7O7Hkl1OPBPocqjnhgfP5IU8scsTA41hlx7NugGp8lNkqAD6IuBjTcffdJNMoh6/x5
         rHPSMTB7ZPsRSx3F/kip4AEda11YZaZAjZlgfQ2alYUjOCPeMeu7nh577msWuh44LW0m
         tufqWsqi69Il6wJ/dzgfLKtdiqzwkcLvS9ooOejQX/u0hJiPDvPD2j2xdk7ysuiaNEh6
         Egsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OOeToIIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y31si550373qtb.206.2019.08.13.07.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 07:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OOeToIIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxXPg-0006cX-8q
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 10:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36130)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hxXPZ-0006cM-UR
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 10:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hxXPY-00047u-PF
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 10:04:29 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45081)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hxXPY-00046G-Id
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 10:04:28 -0400
Received: by mail-ot1-x341.google.com with SMTP id m24so19845185otp.12
 for <qemu-arm@nongnu.org>; Tue, 13 Aug 2019 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gqno2bwVp3LtKwfLy2Hjl9itq2o/QczhQjLnU8vsBL4=;
 b=OOeToIIHeBbpiiqqt8GAHSf4H3bezWYdmDJIlSdu5SnqzPLQZVT+PsAHOHeOGROi7B
 HM15ostnMv3vM+W274qnl+X7nkODsVPDYCZRD8S8Xz5t/vZKDjFnWhuGsOptf/KaRK8U
 Rsb3JDFKB2+vdpHfrHx/ocYys7iOqbM0qWoNc3m9tOF4WH7OICDDtn6ciMF6k1My4MEt
 jzVvHRz4B1Nfv9TYSL4euXRA7CgAUiOa0/Ptm8ysXclnklZ5xZealoEtGbxwp771VoZp
 o6eHQUFvrL/RX89lC2qz4D/xeQjTa9SYivuBTLSHMJMG/twMY/e/8YBi5ymqHH5BvqQd
 8New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gqno2bwVp3LtKwfLy2Hjl9itq2o/QczhQjLnU8vsBL4=;
 b=hopZJim6ab2zimpZW+apaHFMMPOsTmELsKFB3yWOqKpLr2YUTBYiJmgqwhkeFT8RF7
 L+ufJdzKeMM3fIJrc7g51odeWt5xNejgMhMRWkgGCsWHGHabvmmrtoet8HIFkS9aFdHG
 ZbodvMN6NBSj4qrZzRNvNk8yAOQRCSUYMzdxwvRguhQWHj8dcQSSxJX+yPy8pWlMCbk+
 08Uwp/znjeXAbU2HV+N2WoWkjF+keUitm7geoNvskqU6SiVY5SgafPN4fakE2Ae3u7hF
 gLsvli4K8y0wNgyLAIskGjJdetSxV3oyIPnnxSawoo2QNlf3OypmZNyBgLed1i7HJmdy
 K45w==
X-Gm-Message-State: APjAAAXC0KVRbzXIDUbXQdRD+vjPv0mIa31cLv+baRemYcsQlBs6yEb1
 q9GGzMgUn30Fm9R7XBhN9boNn+kztzSPKOJ4MKsl5Q==
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr5199874otc.135.1565705067547; 
 Tue, 13 Aug 2019 07:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190712133928.21394-1-philmd@redhat.com>
 <421f2fb2-6e8d-7579-029a-e8de726c6a5e@redhat.com>
 <56d102b4-3f55-7070-c012-56ad65138873@redhat.com>
In-Reply-To: <56d102b4-3f55-7070-c012-56ad65138873@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Aug 2019 15:04:16 +0100
Message-ID: <CAFEAcA8axpVeXjWV+2cz8PL-gR_6GvU=i0BMt01pYhff_1LOwQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH-for-4.1? 0/7] vl: Allow building with
 CONFIG_BLUETOOTH disabled
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XFxY4T/3EITb

On Tue, 13 Aug 2019 at 15:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/15/19 3:13 PM, Thomas Huth wrote:
> > On 12/07/2019 15.39, Philippe Mathieu-Daud=C3=A9 wrote:
> >> A series of obvious patches to build without the deprecated
> >> bluetooth devices. Still worth for 4.1 or too late?
> >> It is clearly not a bugfix.
> >
> > I wonder whether this series is worth the effort right now, or whether
> > we should simply nuke the bluetooth code after 4.1 has been released?
>
> Well, perfect is the enemy of good :)
>
> This series is already done and is an improvement to what we have.
>
> Regarding nuking it, it depends on the Nokia N-series boards, they might
> become useless without BT support.

Er, they're not useless at all without BT support. The BT
hardware is a really tiny part that I doubt many users of
the board models ever used. As long as we retain a "simulate
doing nothing much" model of the BT device to show the guest
I don't care whether the BT backend code disappears.

thanks
-- PMM
