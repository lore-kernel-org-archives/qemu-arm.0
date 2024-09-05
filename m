Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp481683njb;
        Thu, 5 Sep 2024 06:02:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJqpRmb7UgJICM6JQWIHVA2LkqkI+jeBP96PjV2rp3KqDfPAvH5xqLX5H0/gpJCMMgeinOEc37kIPOUw==@linaro.org
X-Received: by 2002:a2e:a990:0:b0:2ef:17f7:6e1d with SMTP id 38308e7fff4ca-2f610390897mr191519391fa.4.1725541373800;
        Thu, 05 Sep 2024 06:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725541373; cv=none;
        d=google.com; s=arc-20160816;
        b=aDay4OfUQxkDCS/VYIWm/3cHX/1bx7B7c8AnsO9fP3bn8TpUORe2xS8NNhjHZHQ0S5
         jDWHbyTVXBn99xtstcat5yQTsr6v61ndhcFr2unrHqMZ4l3XU4g5Y+pHmdSiE/tTBYEa
         5I7NunYcYY/i/P/BNXOBuGrXg/buXMq02LEGO8ZHgTNSu171essAO/NlLP+nchL3wQIC
         vVPiLkIT42gOEl+zqnLywuDGMRAyfjjGdyO345gOVvexRz4N1w8JNV7LY18oehuzMPBc
         OoXCpQg2ibPtp5Lzyx/PA5szPnmf6XV9Iilqd4lGhpUXLuI7FDut48HJfKoY13GddPos
         HSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cwnn1XgdkvGh9rrbYATl2uNkRA38AcvdqPQRMxn7g48=;
        fh=l2SFyxjvlGZbrxL4R+ZjmaFcU/rDMDgjE3ieq8vxXXM=;
        b=f7RT1rb2a4Z2Om54UzwEp+1TagwzONpi/i7D0G9eoiCEz5uSTtMotTnYqonk8Bamx9
         GQgE+gb42xlGZcUndcoZ8YyWvbEx4XivUNQR11pHNerzgajx8eVm64P8KO/YemDJUSfn
         uhhWUks1vKFZwEQ1BRhyrYePFfDU4Hig5QKYzDFzoKmfaqKjGJNLWo50uVdxx3fFyA4j
         vEqiKk5omsS1AGtoaAXs5038EjhM3znEJD/ipUlBtimp0Q6+NtyJwvEtlfVuibgFJd1F
         5ClAAZnbbMhaP1NYRZmICB8f2JDNBHRb40q1BbmEAqOypDtvJnzSmd4chB6Zn68se2XI
         SB7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RisiNVR9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c270a269e6sor1218970a12.1.2024.09.05.06.02.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Sep 2024 06:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RisiNVR9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725541373; x=1726146173; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwnn1XgdkvGh9rrbYATl2uNkRA38AcvdqPQRMxn7g48=;
        b=RisiNVR94+H/94BaqrEM8qlEq/oTqCvqYVClTUPuiCthcPfMYx8ZrTSXIGu0TxR3Hr
         5bin66uc4cNVbUMfZzixDHhR2eRHTgLATOjUkK5xsfCjNclSFaW6vlvW8oW9MzEd5nWh
         JsSrb5d1RFCIcHJj2GnmUZmKW7lGolxfnl1qE4Puem7OpouY4iZYwjp3eQCrrQ9KQhXd
         1j1B7BA15DrA+QNV9QCyup6qa94sq1QiSm3BpyZtoBZTxtVDKYjOF+5Zw4ZGMI6VOvhG
         2vj3RJTxzmu4jogxnWDvf7zghwqm8atZt0JElNovlMvq8+hzrjSZQ6yZ/25SxXaAqhQr
         aRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541373; x=1726146173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwnn1XgdkvGh9rrbYATl2uNkRA38AcvdqPQRMxn7g48=;
        b=OT02e3L7P/Ex96LD/oUO2dCPlSlrhD/MfytYwghbcBvsb9F378E1yb4Yyjiq/UZ69B
         GQybxxOu4rCuqrgG3HYYn05R7TD/Cxgb6qA5rBf+DUjA5E7dFzM8BJgG/nvenxo+DFuZ
         xw+tS5GCvUJyv3IS9pOLjVk4G4DPBSRboHUV2djosorpBIO93vNY0b5YSmZ1fRhJIBR3
         wU3XoZCM3MSBOEIIKNb60uvPLXBGeHsiZf6EUQ52JJuIMHxJii9jPZ8UQa7hqsucXWa0
         01Hm87K36HUAE4wtjZYUmm66lrdLmy2i0ifOk6HttQRVZTJ9SMtm1eHgk14IVYeXjqw7
         IkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxbLKacj4Rmz7sOQFxvbLeqWOizxJeCE/xCMCOW3CEi87gadLtXPFQS+gtaULH6qTIyUfJ9l82L0EAtQ==@linaro.org
X-Gm-Message-State: AOJu0YxCS8JSI7sMUyE50OgouJsYdpC6dyWZpoNTVqEay87+lGMiIGPN
	FAbSXVw+XMp/TGsGrZNYBK3eVxPAmk7UdgEH3k04xDoGu/TrJcMKZ0eZhbsP6jS3sM2tPcflP+O
	+AOUrKGmh0pmA35RVUa5f21fdjx2Ju1hvT9XnJ4F5
X-Google-Smtp-Source: AGHT+IHuk5vVn71M07bqWrqA5LQ4xwYNrAysM+fssQLHDk77ddSciZL9cQ0oxyggV7o0rjmlGJLhfVkO+BwZMpolwms=
X-Received: by 2002:a05:6402:1eca:b0:5c3:d8fd:9a3b with SMTP id
 4fb4d7f45d1cf-5c3d8fd9c58mr246637a12.28.1725541372714; Thu, 05 Sep 2024
 06:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240905073832.16222-1-shentey@gmail.com> <20240905073832.16222-4-shentey@gmail.com>
 <08360075-385e-4083-8dea-5e2275d02834@linaro.org>
In-Reply-To: <08360075-385e-4083-8dea-5e2275d02834@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Sep 2024 14:02:40 +0100
Message-ID: <CAFEAcA_x6zwG+V-E_Lzr_3njQ2W5PN5=BXVNnOT11K3jMxTC5w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/char: Extract serial-mm
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	Helge Deller <deller@gmx.de>, Song Gao <gaosong@loongson.cn>, Stafford Horne <shorne@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Joel Stanley <joel@jms.id.au>, Troy Lee <leetroy@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bmeng.cn@gmail.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Hao Wu <wuhaotsh@google.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Steven Lee <steven_lee@aspeedtech.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Beniamino Galvani <b.galvani@gmail.com>, 
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Tyrone Ting <kfting@nuvoton.com>, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
	Sergio Lopez <slp@redhat.com>, Jan Kiszka <jan.kiszka@web.de>, qemu-ppc@nongnu.org, 
	Eduardo Habkost <eduardo@habkost.net>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Jia Liu <proljc@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, Paul Burton <paulburton@kernel.org>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: max2WLY4kf8j

On Thu, 5 Sept 2024 at 12:13, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> Could we start recommend to also add SPDX tags for new files committed
> to the repository? They are clearer than mis-copy/pasted license with
> typos and can be parsed by tools.

This is probably worth a discussion in a separate thread, not
buried in a comment on a refactoring patchset :-)

-- PMM
