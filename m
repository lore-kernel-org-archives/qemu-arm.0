Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2453540njb;
        Sun, 7 Jul 2024 20:17:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrpixYgVkX4nt/1GZOLkVoxCSRlt2ymxzcO5BQm95N+QnpwvWqAEID3RIQiEpR2/lVlQoipZYIwuLPkVEn6S/FelmWvUpl
X-Google-Smtp-Source: AGHT+IEdiA53zafV3zZEN2O7WIy/TQwHc/AU4pGXSVibyvpcM9BjJPPDMLR0hXJDzS5mrcyQzk2L
X-Received: by 2002:a05:620a:1908:b0:79f:718:778e with SMTP id af79cd13be357-79f07187831mr611772785a.36.1720408663092;
        Sun, 07 Jul 2024 20:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720408663; cv=none;
        d=google.com; s=arc-20160816;
        b=KInKnZryqVqAqWsgT3mLh5l07uSyuTOUZ4cHPK7ZvWramGS8QJtmmbA7r6WXlSO1ro
         76WAUDp/vuUGfarVQxODkuoPDfB6MZbaTjnwl+x+y/DU4sD4OHEhuyTmkTYeP2NZY0zi
         90s2qapP4YuaBnTiVJ1OT/+Kx1d4IDYHGRvF3TDxcx9LXwfv36MrajrqXlBVTDE4cY+8
         A6V0vzjqMXdGWtyjGWxoPBL6lwdUR1I9xadsjC7c3wxfVHmiEOT27GRln+boQcxcXkvC
         HlnYka5qEsQVOvMqPPBxurp3CeQRLaRXmbYIehpWIQHCA/gAlVD49naooPTZd4ZLAab0
         b3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OLUHX74qql1u+dDTjd1B0fMj/MKSrRFuVXzGKtExiZk=;
        fh=8PcGU5LTry/vgXMCrNsqVYEOvOPHreFqDIhAallxkZo=;
        b=U4bOrL3dUH9cFuyB7+SeZCzAF9oHTjZC7ROUkojFwwsB2aJQ/VUGpAfPY1QM/R3/Ik
         teSZ5CNkkf39WatOwolN84Jja+3Y9p2rwxbm/WGFXW8U912r012uSDd+qP6FW5jmXunQ
         SRit8DVpfh5sB41YtQA/Y4wn/LUZ+XyPpo79/+2Ie9tiG4+Q/ZtIeyB6W/IjSFgN3uo7
         lOV2XJaoU/l7GndpwSmxJ73wSxrVQUwRhotO1rsdNjqcevgjpLfBTBS3BIDP6ZD+I2mB
         x2RakaREt4i+5w/uBod7iHscukq3k1u0btVEJxfUxHVUH3eBN4p1xQD/S5zFBwQBOr6Q
         w+ZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Y/LEop9c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6933a2f5si2334266285a.638.2024.07.07.20.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jul 2024 20:17:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Y/LEop9c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sQesV-0000tO-5x; Sun, 07 Jul 2024 23:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sQesS-0000rQ-6L; Sun, 07 Jul 2024 23:17:20 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sQesQ-0004Xe-Ic; Sun, 07 Jul 2024 23:17:19 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4f2fcaa2a3aso1011998e0c.0; 
 Sun, 07 Jul 2024 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720408636; x=1721013436; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OLUHX74qql1u+dDTjd1B0fMj/MKSrRFuVXzGKtExiZk=;
 b=Y/LEop9ckSljAPHtal6ART9nK4A+Pc6pFOrc65UnbS0yLSyDym31kLne4N1eSmiu61
 trM4noYiKODcN3P3BibJCOmZJjxUwozoEuPNQvCgDgMDzot2wXcQR2Nktw80+Om/1lu4
 gs2cw2DRUAuqtmUW71AymBqL0KhuFYXMe5QO/CLVqueyjOOX3vo076vCwmi6lnJM7RYV
 4kLKtLTojmUayA8hWeM+o6+dOLvZduYXDOE7n2nEPLyO8P0mM3fqRv9j3dMC57vwEc08
 e+iHbbNXSCQnf3hPnikzxxfQpq40gnCOFu2AuMhHMxIC3JT11nBcWSVXHKO5/lvEiwcI
 2jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720408636; x=1721013436;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OLUHX74qql1u+dDTjd1B0fMj/MKSrRFuVXzGKtExiZk=;
 b=US1z957w2SBXvAMV9wEp/JygoR8x1HkUb93VeA8lKHzmOYxNlhsS48wPaO4wGaae3d
 F7BWdAdKARHDz5sXtBAQmuYt4MLNHvM2SUrDCb8okmQ4M7S713EfJbOXDrh9mtdw+eS1
 CxnyPfh/JGKwe3KWEiRmpRw4pdtiBcATLbt3A4KM4X7cLjIbLx1ANth6fY0GsRMoXppn
 e8IpPHeOtGVXDg8xnBiZWTdTQ+zppFb5tvxodwdbZ5NV+i02EYk9uC88FcGsReVb5fvf
 XLOXMV+OoFcpgPWAVfzDtF9jXXWAuN3UaoUP18OFhhqDlZKQd8qIylBpwmxdaNRC5XIB
 G95A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZMjl2Hm5bpMRrLFwo9ayA6RmQnmrNHCzdq5lnfA45bJ/yNWd6V6sVPd/nGWu7cFFk8jO9CVzMrNe4UJ1l4k+kpnfBL9Tgh7ouA5yxcdtRqLxCkCyU4UCfPviArAyH539l2Q4Qd78PlLXUfa2h9zElEQ==
X-Gm-Message-State: AOJu0YwI84pMfcYMqOo+wjwHiY0to4OzG/yqvCwBqaluddKlH2rfjVe5
 gc2TjnM4GJMW8JwmeZ6clgzHOj/sHgLWHlcziY8jT6d1CJLTD15vu5alHj5qRxpWePvah7ZxL6+
 mvzlIunJgtTyVBZ+rg7Ytg0HX75A=
X-Received: by 2002:a05:6122:d1a:b0:4ec:f9ad:d21a with SMTP id
 71dfb90a1353d-4f2f3fd1102mr13069015e0c.10.1720408636058; Sun, 07 Jul 2024
 20:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
 <20240625150839.1358279-17-sunilvl@ventanamicro.com>
 <20240627141803.42cd46c1@imammedo.users.ipa.redhat.com>
 <20240701170330-mutt-send-email-mst@kernel.org>
 <20240702150236.000042eb@Huawei.com>
 <ZoUmf2zn51RWU0o0@sunil-laptop> <ZoVmwFgIRlziF/v4@sunil-laptop>
In-Reply-To: <ZoVmwFgIRlziF/v4@sunil-laptop>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Jul 2024 13:16:49 +1000
Message-ID: <CAKmqyKPMW0WMJQn7=2ebuqf0c=ow87LCtPd1bOdiWVP_xjoTJA@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] tests/qtest/bios-tables-test: Add expected ACPI
 data files for RISC-V
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <anisinha@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T32l8tJ2m56I

On Thu, Jul 4, 2024 at 12:57=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> On Wed, Jul 03, 2024 at 03:53:08PM +0530, Sunil V L wrote:
> > On Tue, Jul 02, 2024 at 03:02:36PM +0100, Jonathan Cameron wrote:
> > > On Mon, 1 Jul 2024 17:03:43 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >
> > > > On Thu, Jun 27, 2024 at 02:18:03PM +0200, Igor Mammedov wrote:
> > > > > On Tue, 25 Jun 2024 20:38:39 +0530
> > > > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > >
> > > > > > As per the step 5 in the process documented in bios-tables-test=
.c,
> > > > > > generate the expected ACPI AML data files for RISC-V using the
> > > > > > rebuild-expected-aml.sh script and update the
> > > > > > bios-tables-test-allowed-diff.h.
> > > > > >
> > > > > > These are all new files being added for the first time. Hence, =
iASL diff
> > > > > > output is not added.
> > > > > >
> > > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > > > >
> > > > > Michael,
> > > > > can it go via risc-v tree or
> > > > > do you plan to merge it via your tree?
> > > >
> > > > given patch 1 is merged, I took the rest.
> > >
> > > Looks like your CI runs are catching this as well but
> > > RHCT here is failing.  I rebased the GI/GP set on top of this
> > > and ignored that failure by skipping riscv64 tests.
> > >
> > > Jonathan
> > >
> > Hi Jonathan, Michael,
> >
> > Looks like a recent RISC-V PR updated the rva22s64 ISA string affecting
> > the RHCT I had in my series. I see that Michael dropped those 3 RISC-V
> > patches from the PR. So, let me update the expected RHCT AML file in a
> > new series. I will also include Igor's feedback to remove fallback path
> > in that series.
> >
> Hi Alistair,
>
> This issue is because, below 3 extensions are present in the ISA string
> for rva22s64 profile cpu after recent RISC-V PR.
>
> zmmul_zaamo_zalrsc

zmmul (multiply) is implied by M (multiply and divide). The other two
are similar.

>
> However, IIUC, they are not mentioned in the RVA22S64 profile spec. Becau=
se of
> this change, my AML files are having a difference and failing CI. The
> question is, is this correct behavior? If so, I can update the AML files
> and resubmit the patches. Let me know.

This does feel correct. Is software only needed zmmul for multiplying
then reporting zmmul when we support M feels like the right thing to
do.

I can't find a spec that says either way though. So unless anyone else
knows of one I think this current approach is correct

Alistair
