Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736BBCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 13:59:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBCtS-0001g6-7p; Tue, 21 Oct 2025 09:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vBCt4-00016P-9M
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 09:58:54 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vBCsz-00086i-OT
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 09:58:52 -0400
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-7ea50f94045so96040056d6.1
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761055127; x=1761659927; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9xo5iRU2UaVqUYhP+NOFPTLpT/CvAzz5jgCqB0Tc9s=;
 b=V09KEVzFH/JLjHjrr3hAe2Ds3Ja+Zo4bxx1nMXVdZq/XeWH2VnX5B78bypF4Nlb9Mo
 ssM+4pSDjNfaG1oECgXbGknUjnXcNx+3I+v1MR39jwpeWjci6Hpp4NaRS+LE2rF1D72U
 qNMSYd4T/v4BEEp88PqFBivRHJppr43Vx4D+XIizGKVa2fOdVeiRx0T/+zt/KDCtScin
 foowNE4090YQCWpjIwdMcxxx66c05WSz7zJpCaZyvX//yhwLjMLzBuqg1dOwbFKH9DvB
 L9w+89QmFLo7D2Wua2ifEvcH3AO9nMOgtQjSEi9KajizLwWQAsLdCUEzYACIvhMYIMbd
 Y/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761055127; x=1761659927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9xo5iRU2UaVqUYhP+NOFPTLpT/CvAzz5jgCqB0Tc9s=;
 b=gAwkGp5pdqcXOPeaj/S+3HAmDrjY9RxElQT9DgYNVD+j92kAyJXg3njrZm6RH1v81M
 b3eV6H6yGjQ/kz3ocXf/bI2in+Bf5l3i0LK1Rmo5239eoD2wnLEcrnW/9cs73yghNDwW
 if89ccz1Kuj45gHC7QkN8g/i8IPA4AYJmO45SHJezR/fxziHFjlGoWMfyH8Max62B6B+
 A89gaQn/zeUqdwIMGawLzueKTgeqSYRomUYd6Kc46N+H62jvA89v9eUIYxk884Nct2JY
 sptxq+0KQgN3jFnai+guq+pCLs5DkD9gz5yMUsf1X+TiGWnGVADfKEYX767yNNyhGDBj
 2hDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCVErCJn/rrEpc7nCHMNk9Nd1QPMbYFQ+F0RI6mVugBznaAVAa1siRK0lLWk804noIIUpPIRH9EA==@nongnu.org
X-Gm-Message-State: AOJu0YyW6VR0SrHN9cEQRCmoL/rJTo+BGmgZBFFOG0nAXVKD0IIh5do0
 jpmqjDs2TAQ/TY+Wpjv9hBxNJAvd/ap7U9SvCq3rsSBzEQ17a85MRGATEWi5xwShYgwNxIz58mm
 8abekVNnIz0O5i4h+4HKUkWqP+rdY16A=
X-Gm-Gg: ASbGncvoaQkySvpkPYC46HfPUl9yUy1VbtMn3Rzdp8Vop0m3UcYPgYbRTH1YldmqjVe
 UOHSwPb7vE82rtr5hFneAxz5M8i5ygvl2tnucemWTZCykPZDRUipoC0oLe+xlSH1LL9EwoUgWX0
 rBdnd6GeNmAqxPLYAxPkJe6eU4aKYCQP06IXpMavL48HVp339EBWXhiBdsMbbIVox/pwPERB6bi
 b7fExQTB3VQV4OQx31yDXVaMi/rCXh9b0n/NVVyOwAvj36gn+/GRhCWG0GGNtNjRZlU/4rqAUq7
 AD/qK2bb5UJ+Cwxg2VdLbgs0pQA=
X-Google-Smtp-Source: AGHT+IEASm5PEMuHtKd5e+Rzj4N98EYCKZGb9xbtNELXIkGVXPi9KMyBQu4pgO6iWCx6Ob5On+OEkhJoPBQQfEnXOkg=
X-Received: by 2002:ac8:6692:0:b0:4e8:9151:b743 with SMTP id
 d75a77b69052e-4e89151baaemr171529791cf.10.1761055127377; Tue, 21 Oct 2025
 06:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251021122533.721467-1-marcandre.lureau@redhat.com>
 <CAFEAcA-jPE_onLYLMxgcAOB7dWRXOLJrWcGPnR0NUdjYytPDVA@mail.gmail.com>
 <aPePcTKl6s4FoLCL@gallifrey>
In-Reply-To: <aPePcTKl6s4FoLCL@gallifrey>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Oct 2025 17:58:34 +0400
X-Gm-Features: AS18NWDhwyu6RSAqqb6h7ri3_0htqQRas44BMuTIvGK_fnZ9NOk0aSqeN68Q1lo
Message-ID: <CAJ+F1C+bGKtY6nf3LCXrwhZ2aEdu2npXJ9FapmsqgX0uLL5TUw@mail.gmail.com>
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Alberto Garcia <berto@igalia.com>, 
 Thomas Huth <huth@tuxfamily.org>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, 
 Yoshinori Sato <yoshinori.sato@nifty.com>, Magnus Damm <magnus.damm@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L. Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Corey Minyard <minyard@acm.org>, 
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 Vijai Kumar K <vijai@behindbytes.com>, Samuel Tardieu <sam@rfc1149.net>, 
 Gustavo Romero <gustavo.romero@linaro.org>,
 Raphael Norwitz <raphael@enfabrica.net>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer:vhost-user-scmi" <mzamazal@redhat.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <zhangckid@gmail.com>, 
 Li Zhijian <lizhijian@fujitsu.com>, Jason Wang <jasowang@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>, 
 "open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtiofs" <virtio-fs@lists.linux.dev>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi

On Tue, Oct 21, 2025 at 5:52=E2=80=AFPM Dr. David Alan Gilbert <dave@trebli=
g.org> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
> > > The actual backend is "Chardev", CharBackend is the frontend side of =
it,
> > > let's rename it for readability.
> >
> > I always thought the "frontend" was the device the guest
> > saw (the 16650 UART or whatever). invocation.html has bits
> > talking about "virtio hvc console frontend device" which
> > seem like they also use that terminology.
> >
> > If we want to clean up the naming it might be helpful to have
> > a comment somewhere documenting the different components and
> > what names we give them and how they fit together (or even
> > better, something in docs/devel/...)
>
> Or something more descriptive like 'CharGuestSide'

If we are talking about the Chardev frontend or user, that's too
restrictive. We have generic stream handling code (think
mux/hub/tests/client/server etc) that do not fit that usage naming.


--=20
Marc-Andr=C3=A9 Lureau

