Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3865252wrq;
        Fri, 25 Oct 2019 07:10:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzE3/9CWYMVPfB0Kdsky0wY0SFRECnOXXoJpHHLg54nUzHJzF84XF/MA7gAabr57wQpRSdo
X-Received: by 2002:a50:9269:: with SMTP id j38mr4143235eda.5.1572012622845;
        Fri, 25 Oct 2019 07:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572012622; cv=none;
        d=google.com; s=arc-20160816;
        b=Ql9T+KAEML6TupfvXKuj1BT7WpqUU9WYTgRJurOMU34sPlHz1ehEQ2cvlPXAUnmIAD
         hs63aPPaZ1cU1AXaxV/alZkxaQgmg2VncawfMf3SLEjpjGLuVDlW0TjEIl7i4CP4jqBB
         5JDTVD0CIXkFwg36RsaTImDqThb+0ZHWG0wfPLcycJn7+iYHNLze31jnk4R0H4fLKODU
         F7TPHFmZBnyp0F4jHFjMcQlM/rSBj5e99EidFpu66ujLcGkW/ZUyBM0dTI8f7AuEvTbI
         jaH2mvSmS+j+cxH0UF5TImAdChi3tt5c4Bc2O2ikd/Cv1TMjZ9ZEhbVOVt/HMeWOP7At
         ZOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r09A2sIU1Rg57fAoyBzrREbrJ7KGvvru3Z8K3pZMeHs=;
        b=o4KQLsY/GZgWkg7vd7wMtzzXa3e1r518K9028iF7quFtFBcCQu9z7WpGvcOrTeCui4
         2VfuGCYPK+/8kqiY8K8TFWJ7FDaaXazrP2f4roNuuINAvLwUwoERcH3fZa+uyTpJkTQ5
         XiXXzOLPBLXqLwn0KgvTffmoSeh6TBgrEJx6+aUrGu/jnivnBWq96UDuHoYlEPPw3nl4
         t3qQh2ryUHyH7Rj/njhH0a5pdc/DThHAzEEkqi5g8kZ66Hdv5cDi9t1jon3DhCxGlxuQ
         Spm0s4sjJn7O9sdmLzdiycp3uiLybw5DTbqixlGhmq4GP2RsfYrRMNHTaz1sVGfgaDQc
         H37A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l6TtjN2Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21si1411629edi.123.2019.10.25.07.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 07:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l6TtjN2Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iO0IH-0000qX-PL
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 10:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iO08C-0006ll-Aa
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iO08A-00061G-A5
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:59:56 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41682)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iO08A-00060G-3M
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:59:54 -0400
Received: by mail-ot1-x336.google.com with SMTP id 94so2121839oty.8
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r09A2sIU1Rg57fAoyBzrREbrJ7KGvvru3Z8K3pZMeHs=;
 b=l6TtjN2Z9lI/qRj25Wn+gZEW7Wy0qKnVIgJscQv3eLrk8wRRL1UNBg+WT/ucjMRJkE
 bBkPg0fuN0l5hYhj7tOAwnh4DL0EYJyHDNduzTmzHEBDdR8eqSboLw9oyCb3SUPAcjrr
 jeYYXWGq+3aTKxJzGtiaZFOZ/lSlTNBQaqWDa/FiHMLRu9vCGdB3gRb1P/U61BKB83KS
 GkzrZdw1igGNVPVmRQbyqmsXBdao0lPK+fiCoCFqK55BC2zpOqoU40tBxMk+rKVUjYwQ
 QeNUFV4oHGRu3nwbNtGa9qb2UqFVyCKki/JOcbyR4ppuo//wEMp3z+NHAYd9zFiFPD05
 SYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r09A2sIU1Rg57fAoyBzrREbrJ7KGvvru3Z8K3pZMeHs=;
 b=m/9MSu+LKFifVjrZ1xyue10DLFfge+50Ez9gyRJXTAChqxWTVHjwzI0SFpJJZo0WUV
 R8qcD73tusv6KEzUfMDOdMvI3EwmHHlXEZVmwsgEJ5zo0IC0uHOTqcfjSj/y5uQEqlUU
 xtH0tDh8Yxv9j6d69hWgSR9gPOypbXNaKNKmeOabN6teuOT0LnD1MJmQ2ohzPFvm77mL
 lmWhAM39OTBE2LCzysFihy/nReSENboUWrKtjUkLi46gkgelxMCBMuWFkpfs/yle/Du8
 lL6Zd3lTC68d7fUOAJzSF9YShLFAp+H4T3+U2utyhJJrPynhgumU/K9leq9LpbAO7J25
 ViHg==
X-Gm-Message-State: APjAAAVRYsnSvCj9nCIglZUgsj87cbIo59Wvulo/3fDPAflMNCgxOUsC
 o8yilZCiQv9AZlCabV9mJ4NtUd4cqPKH8Lo3P6eYLg==
X-Received: by 2002:a05:6830:4c1:: with SMTP id s1mr77890otd.232.1572011991639; 
 Fri, 25 Oct 2019 06:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191025083511.11463-1-laurent@vivier.eu>
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 14:59:40 +0100
Message-ID: <CAFEAcA9XFKc01mOKMFEwHKfWupLq+yc9KeR1g76v6bbggKgkkw@mail.gmail.com>
Subject: Re: [PULL 00/19] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::336
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MBlpXVojNm09

On Fri, 25 Oct 2019 at 09:35, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 58560ad254fbda71d4daa6622d71683190070ee2:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.2-20191024' into staging (2019-10-24 16:22:58 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to fabb862f76f093cdd1610571de9ba714d3333c1c:
>
>   hw/rtc/aspeed_rtc: Remove unused includes (2019-10-24 20:35:28 +0200)
>
> ----------------------------------------------------------------
> Fix typos and docs, trivial changes and RTC devices split
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM
