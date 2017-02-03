Received: by 10.25.77.65 with SMTP id a62csp539400lfb;
        Fri, 3 Feb 2017 02:10:13 -0800 (PST)
X-Received: by 10.28.98.2 with SMTP id w2mr722760wmb.66.1486116613347;
        Fri, 03 Feb 2017 02:10:13 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id x197si1710067wmf.0.2017.02.03.02.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 02:10:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id c85so20853702wmi.1
        for <alex.bennee@linaro.org>; Fri, 03 Feb 2017 02:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7Ywq6SWj4/Q6/rLdInA4Hnva3Kl03QFreGRoiVnMOZo=;
        b=aVXM1K5MXgmfok51zdjMtM20ZyVDlCKbagjdpM43Tpd8apqZc+4FCzUdVAi4XieVgN
         Ba9X7B/LNyYjQrfDvwd5OziqO8vDGR8UXY3SawDCt7eZugQOSS7F7EfjbCC3Vubs7zO+
         KwpJCiVdDVXy4lqlFLyN0d0NxmfJRb8ZBv97o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7Ywq6SWj4/Q6/rLdInA4Hnva3Kl03QFreGRoiVnMOZo=;
        b=BV0Bu/Ltc6/czLJWx0f18bKPUMLqmyt5Pe1+Y+0MQF1/C2rJv5PSr+6oo70DudfZhf
         pJ0WyzBmCCuaPLHiW/PFkC3idQYTNmx0w9FKswySoP0F/Uk//Ke3rUzPTYTXKQWBUy+C
         FtO/KnP0BDsvwq8AYpORpDZO1bvnDecZweqBosHDYwG9G5Y3eP7lbdeLT+PHCCD0/l7A
         KyuiVYIlkkLi+fqAlQfBB/3tz7DzT7pzxwGx4QtJ8eGmhJjdevPJiUl+YpTayRXemLqQ
         muVPEVjkxcSdaGAQGfxQr0wPelkg2RA/zm5YQ+heOAEv1frRD6gbZUfw2tWs6hKkYmHe
         YJbw==
X-Gm-Message-State: AIkVDXIN/eT5C17ifyWLLs6YVmGRB/nvA5Og4jmccio7kM204zrhX8NYMjDTtJq0mnKeA03X3L+z6PmvIWCBgLSWxvM=
X-Received: by 10.223.142.131 with SMTP id q3mr11258776wrb.195.1486116612917;
 Fri, 03 Feb 2017 02:10:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 02:09:52 -0800 (PST)
In-Reply-To: <20170201150553.9381-9-alex.bennee@linaro.org>
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-9-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 10:09:52 +0000
Message-ID: <CAFEAcA95nduxcHy=Rxszqe3ONaO2pV69NesxJSWDLRLqujA23Q@mail.gmail.com>
Subject: Re: [PATCH v9 08/25] tcg: drop global lock during TCG code execution
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Alexander Graf <agraf@suse.de>, "open list:ARM cores" <qemu-arm@nongnu.org>, 
	"open list:PowerPC" <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IaTLTIs+n7Qe

On 1 February 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> This finally allows TCG to benefit from the iothread introduction: Drop
> the global mutex while running pure TCG CPU code. Reacquire the lock
> when entering MMIO or PIO emulation, or when leaving the TCG loop.
>
> We have to revert a few optimization for the current TCG threading
> model, namely kicking the TCG thread in qemu_mutex_lock_iothread and not
> kicking it in qemu_cpu_kick. We also need to disable RAM block
> reordering until we have a more efficient locking mechanism at hand.
>
> Still, a Linux x86 UP guest and my Musicpal ARM model boot fine here.
> These numbers demonstrate where we gain something:
>
> 20338 jan       20   0  331m  75m 6904 R   99  0.9   0:50.95 qemu-system-=
arm
> 20337 jan       20   0  331m  75m 6904 S   20  0.9   0:26.50 qemu-system-=
arm
>
> The guest CPU was fully loaded, but the iothread could still run mostly
> independent on a second core. Without the patch we don't get beyond
>
> 32206 jan       20   0  330m  73m 7036 R   82  0.9   1:06.00 qemu-system-=
arm
> 32204 jan       20   0  330m  73m 7036 S   21  0.9   0:17.03 qemu-system-=
arm
>
> We don't benefit significantly, though, when the guest is not fully
> loading a host CPU.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Message-Id: <1439220437-23957-10-git-send-email-fred.konrad@greensocs.com=
>
> [FK: Rebase, fix qemu_devices_reset deadlock, rm address_space_* mutex]
> Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
> [EGC: fixed iothread lock for cpu-exec IRQ handling]
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> [AJB: -smp single-threaded fix, clean commit msg, BQL fixes]
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> Reviewed-by: Pranith Kumar <bobby.prani@gmail.com>

target/arm changes:
Acked-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
