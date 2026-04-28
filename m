Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B32FF8868
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 14:29:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHjQg-0002QS-4V; Tue, 28 Apr 2026 10:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1wHjQe-0002Pu-MM
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 10:28:48 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1wHjQd-0005aT-52
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 10:28:48 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-66ba9dfe83bso14264432a12.3
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 07:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777386525; cv=none;
 d=google.com; s=arc-20240605;
 b=dsrQ/qA2FgocWnikF8qyD8FHx61pgM1efF41oQG+YJj6XZcltfjHwO8GRBvO0cfNg5
 R0750YL29l27ux490jc6g5DQk4eGnChxAjtzQB1qUGQtqiBlYnpQt7O9fevqaQgQAFb0
 bJp2engWHQ017Zab8pYPveKmZxmzaID8vAbwK1M7M7PCV2VohkTcvstO8cnRnbMSCwiX
 qrn2MjvSGWESwb5YgC8y4A/rOgbO0tmyXU0S/Mf6f/lfyA5hWWMfs5PZF1yN4zFaFOT0
 T0hEaWmJH+20fXa1ed/OxW4reAJm6mCYsAS/81AfJb8EcLdDcAhLlhNfcVGqdWodjgoy
 EyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RYOY/bLGnb4mWoU/OY7ZFCy2IKSSYa+HxyuO8c5Tzxw=;
 fh=LIfQmsxhU6Fa99VP0TebiKD2tfaANSC6B89ewFE0d+k=;
 b=PkOzX4O8YUCPEMmuWBDG89CnqQ/8QJYmUS5jT9N3bGSKJfLaRTJfLfminT6yhAUPqj
 F6M5e8dFEZp/RYQo7H9PBFsh3UlNuI4ebLns7BI8gWeLeR5p3LNuBh+2QqJ9qjO7TEh8
 TkN6u+57hl7M+EjCAy2Aw9HxiZIL5cg1eFnXyCqfXySI1fwjY78wlcigNH7zrFOXsGUp
 mt+evthHmrNhf3zNinItK8ccuhDBYRDfMTnspl5k94m2MRlzRhlJAUqdcTjx4t6Txzpl
 UlHLHjsev6k84ZXqJ7u8O2hqYgCDOgCyaN2vEhprf0dlG3xYQBFoLhs0dIt29CzsbEiw
 X71Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777386525; x=1777991325; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYOY/bLGnb4mWoU/OY7ZFCy2IKSSYa+HxyuO8c5Tzxw=;
 b=Hgcd0iSwOMAKLsOxd+6l+c/4sRioZLQKYLNEIRNS7L6zFH0pp7SlswpMKhpfJyyWVL
 UfNl4yewqWB450DWHR5JYLts0siI4JHOSPnS67q7fevMUCjPNwabzTG3ChjVC2Sws+D7
 73sWTqrNMHeagSix1tnTEL878tIgre3Kv6m5IsK+4n8RSvc3rSO2xZhrdiIW/QFet1+q
 mhpIWaNeXfmVaHfldu1RDFtH8Z+3jcuVGk9scqQwXpb+ObaWeylWuy94SkdoNfr6EK8Z
 hx4ALHlfMq93RJhT7FL5fvKirtUJNCH9RJbl3RADn36f++5VyBdteDW3lHPC0+6PZjDf
 TEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777386525; x=1777991325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RYOY/bLGnb4mWoU/OY7ZFCy2IKSSYa+HxyuO8c5Tzxw=;
 b=SLp1W8wex10n9T6PeUJG52XcLZQ6ScKbUI6xFMlg0LNvZrORsy/xWcNGLAwIkEnaU/
 Ucf+uuzQhJIRyoQUJaVM+kkrSmcKOKjmDM87feAFOyRw/xoGP5FyjmGYnDz/rMIKBsQU
 ZJgEG0gdU9R4LNAiHsGCevjEJUU9bD4VRepokohrD95c0hS61Pl/SIyj7d25oahOe/bx
 j+uk2nhDorcuaHEJLpwgTKlB7WA3ALetcDKgt73VRzEVAV5+T7Uc9M8FtvsM6v87TXrc
 7Fe19o1C4HS8/HzfSUKwFEjjIP6+Uidi9Pysg8aaY8LlKrNPSw+vVMbSm9pW9BVW1vZR
 aETg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mMA0Ul2rjf4rg/10yTshky3n79G+SGHKW/zS0YmdmZBy5wyuLDvASafOu4VA8wZ+LzDOQgLNjAQ==@nongnu.org
X-Gm-Message-State: AOJu0YyvyUBMrHZIh0VqHcwuTZIPyS1rK/e7/jhr3RZDLF4mx1EvzPQr
 QeJ7cxm7aBtLCKFUvuW/1JC7BCDHwHW9GxkGF7TQLPPri4SFHlP4B1EdCUJLolmLq8k9FDGR2vC
 hu+1kPSmlKsSEVrnsKNOOeaMNEaxZFRA=
X-Gm-Gg: AeBDieteoZn2etqhDEr6iS5N1pk/FIW4fcBl2QtLVzLDRHzuuA1op10KDy7IkkRxDGp
 auPHapleZaA+gAp0nfFbHfuajlj5Thfmrvz1G09zvQMUGdTNoN0oUx63MaRbGpLJMj7qbMb0sIn
 KDqcFBYzUatPvTSBvmAdMx2Xsph1c202JrK3cc6amC2b1zgCZLqCCVCXNghoUdO9KxsVwQHnWsp
 mvfjMzUzlgTexcv3AxXEyM5gAae7YPAT//P7v5TpCCa3L/KV8o2cu9SlQJHjfWsOE6IZ++JT0Vb
 sM2vyDGDhDeKJdYQvGxC7l6b3q/S2uu/YJzKVNzN+Uxpj/67I/5XIPkYeUQ=
X-Received: by 2002:a05:6402:1ed3:b0:672:5255:af77 with SMTP id
 4fb4d7f45d1cf-679bb07ee71mr1982304a12.13.1777386524494; Tue, 28 Apr 2026
 07:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260428081303.990973-1-marcandre.lureau@redhat.com>
 <20260428081303.990973-9-marcandre.lureau@redhat.com>
In-Reply-To: <20260428081303.990973-9-marcandre.lureau@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 28 Apr 2026 10:28:32 -0400
X-Gm-Features: AVHnY4Jmh-XBh9OrnMlY2iCW1hoL0ExMevskFSExN-SDnKJrlB8WX0t3_BRuqoI
Message-ID: <CAJSP0QUjFupVz1uXuxgxbvTrmf_gqzV6tSg1tmuq_Lp7qGVyjw@mail.gmail.com>
Subject: Re: [PULL 08/15] ui/console: return completion status from gfx_update
 callback
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Jan Kiszka <jan.kiszka@web.de>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Laurent Vivier <laurent@vivier.eu>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, BALATON Zoltan <balaton@eik.bme.hu>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Alex Williamson <alex@shazbot.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 "open list:Musicpal" <qemu-arm@nongnu.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Marc-Andr=C3=A9,
This patch changes the .gfx_update callback prototype and fails to
compile due to the following recently-merged commit:

commit 5ef60a3787e8e0dccf30dae3704d4f5249160e7d
Author: Yucai Liu <1486344514@qq.com>
Date:   Sun Apr 12 19:02:39 2026 +0800

    hw/display: Add i.MX6UL LCDIF device model

Please rebase on qemu.git/master, fix the build, and send another
revision of this pull request. Thanks!

Stefan

