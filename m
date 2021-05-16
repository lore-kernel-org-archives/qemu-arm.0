Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp480109lfm;
        Sun, 16 May 2021 07:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6ZsLByhtzKeZDm6E5LhWIYAcFRtIzHSDaaapfJRBvfFBTRk8vsyP+RZjIv5oNsYRgIcpX
X-Received: by 2002:a67:fe0d:: with SMTP id l13mr48441874vsr.0.1621175165527;
        Sun, 16 May 2021 07:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621175165; cv=none;
        d=google.com; s=arc-20160816;
        b=HXF5WPnnab83phCuk9wb3jcEhLWOGpIGk4rcjU3E/+ozi5miv4rdm/8vXGlBfMAnyD
         jP0g0OZ0XfSFFCEj+O319GOtpVgwQYg2G9nW+d3GKx4tdmFy+chaJCVxWNt3jXkVovUK
         ryttT+j4CJG4AB2hdUDUUHoR/KiYbzwUCn+zVZQ3ozLKAneffGAbdQhcEeaJvXgvYaYR
         T9I5LofVU4BY83xsUNj6tyGGCm+Ax2HgfvfT8diB99pV2hb5cU80foegNcz6VPorcTh0
         c4cXMZA7qRMdWS+smhoykrsODfY+DdrXkx1bTeF72Ku7VnyBI/hI4+yC9E4OnsdSdA/i
         kPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5ZYiEOfGW24Qqcp7Pn+n50TyvqNThO36M4ZWicK9dT8=;
        b=wlKRwwX1nQhbMx21nDfDXY8sbH94T/70XofER3jLoyNkNxQQ4Q392FQs/w4gv35tol
         4GJHTJE6YOtth0Z0cyM0c7yNv+QKUT7cQMpsNHhoUOMpdYS1qk8EGMS5vb61CgDuHfQf
         opSIB7bTk/f0ZiOA9vdb3UJQW7C+5OGUQ1RPZaIEM1vB0203qc14rkG2gRoAKq+PNfoc
         a52BKn+dFWyVEhjHgD7AZfxiDhAlD9FDITpmhGfo0SWSm5zu8GgU2vOibf+ZLXVDSjei
         Pc1KkPU8ZuTbN7ie/J46Rk+P7bYMhneb5EI7/TVFi3tocHLtqsyFhk7yw1P51keO/qkm
         F1WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlQGvpBK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si6417836uad.5.2021.05.16.07.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 07:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlQGvpBK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liHiW-0002X7-UB
	for alex.bennee@linaro.org; Sun, 16 May 2021 10:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liHYE-0000oH-Sq; Sun, 16 May 2021 10:15:29 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liHY8-00022W-WE; Sun, 16 May 2021 10:15:26 -0400
Received: by mail-yb1-xb31.google.com with SMTP id l7so5149023ybf.8;
 Sun, 16 May 2021 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5ZYiEOfGW24Qqcp7Pn+n50TyvqNThO36M4ZWicK9dT8=;
 b=hlQGvpBKiYVZPtrMHgvDQ2eghBbVXByr+gYpMj0FIw37gNZ2fJ7ioTlmuZSK4nAU0u
 nSRPpABcj3cm3nyIrJVTpFj3KFQZ+0vZHMUpqNm36oTRp8uhd1x8y56AUvN+Oo5H95T2
 8ejWWMu6LFjqNUPrBf9avHDNz8uUWw2J3lFu2uD24D95b4+4A3BD17vDJSGC6NcHfAa9
 VS+IRVe6+fsNKq6xR68F4rSPMILjDZ+f1LIX68/kXkiqTj9dcK5H6WEhSWIRprH4n7NI
 ak0pAI5GPh2mEK2yK+K7390LTk5fwlWOmD28ztCBso6/LweFuxE/EAKoYYJls9O1hbRj
 YNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5ZYiEOfGW24Qqcp7Pn+n50TyvqNThO36M4ZWicK9dT8=;
 b=Ht6TjIGOav7fV2poG7T2Vt9fT0v3odrLuoafjnmq4ncXr1pJcVU/AX6du6LiOtj4XI
 4f+ohxqjbncX4lFyHRWgaaVI5/a7/BPkWDQHGS06XRBh6B5v3aHDDd+sP25vrQT/0llB
 jxCx21TYHtJsrMlyqsfCLtUAtnKtVcB0hC3dNUnpqTVgXyGE9hsaIOiJ1Ry8P+2gBBD1
 Y3JiRgFBgdAMuQ/1yxlsiLXKcnQOcNgSYOclVSWH2rNwF1rJbfrdaokn2o0TSMJICn+p
 GhInozUJHxzfABg72RQf/0rIf9cdnrxKb+wpEBS1l0IjZ1b/CZhn+NzVp2j+72jjnMRb
 tpgA==
X-Gm-Message-State: AOAM530PaYN/FgNj1/Gv74Ygq94bEh/LHaDU5gEnzfGxkHzGxGAcm5Ll
 ex0OdsUeocTt97bHafSY3gJSqF315kXIvL9u++U=
X-Received: by 2002:a25:afcb:: with SMTP id d11mr10388809ybj.306.1621174519069; 
 Sun, 16 May 2021 07:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-2-philmd@redhat.com>
 <CAEUhbmW0h+kvTyrDjum8pVmm9sjn9mkTf-bLRRJqf-ocs1mgqg@mail.gmail.com>
 <25881435-7f61-1b3d-f25c-33fc07d4ed71@redhat.com>
 <CAEUhbmXr4-0XC+mnV65ktq=pPPYLEbt970yC5ZSjwFqbRkEpiw@mail.gmail.com>
 <8ba9aa4f-2204-da31-8bd4-cb0e08e4c5dc@redhat.com>
In-Reply-To: <8ba9aa4f-2204-da31-8bd4-cb0e08e4c5dc@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 16 May 2021 22:15:07 +0800
Message-ID: <CAEUhbmUJ+3OWZ8LUP5RCdpgYfs1tzNQ5BdqspG8zy9ZsiSB_=g@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uo8aAJy8u4jM

On Sun, May 16, 2021 at 8:42 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 5/16/21 2:50 AM, Bin Meng wrote:
> > On Sun, May 16, 2021 at 1:33 AM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> >>
> >> On 5/14/21 5:02 AM, Bin Meng wrote:
> >>> On Fri, May 14, 2021 at 12:53 AM Philippe Mathieu-Daud=C3=A9
> >>> <philmd@redhat.com> wrote:
> >>>>
> >>>> Per the kconfig.rst:
> >>>>
> >>>>   A device should be listed [...] ``imply`` if (depending on
> >>>>   the QEMU command line) the board may or  may not be started
> >>>>   without it.
> >>>>
> >>>> This is the case with the NVDIMM device (it is certainly possible
> >>>> to start a machine without NVDIMM) , so use the 'imply' weak
> >>>> reverse dependency to select the symbol.
> >>>>
> >>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>>> ---
> >>>>  default-configs/devices/ppc64-softmmu.mak | 1 -
> >>>>  hw/arm/Kconfig                            | 1 +
> >>>>  hw/i386/Kconfig                           | 1 +
> >>>>  hw/mem/Kconfig                            | 2 --
> >>>>  hw/ppc/Kconfig                            | 1 +
> >>>>  5 files changed, 3 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-con=
figs/devices/ppc64-softmmu.mak
> >>>> index ae0841fa3a1..cca52665d90 100644
> >>>> --- a/default-configs/devices/ppc64-softmmu.mak
> >>>> +++ b/default-configs/devices/ppc64-softmmu.mak
> >>>> @@ -8,4 +8,3 @@ CONFIG_POWERNV=3Dy
> >>>>
> >>>>  # For pSeries
> >>>>  CONFIG_PSERIES=3Dy
> >>>> -CONFIG_NVDIMM=3Dy
> >>>
> >>> I think only removing this one makes sense. I fail to see any
> >>> difference of other changes in this patch.
> >>
> >> See below "depends on (PC || PSERIES || ARM_VIRT)"
> >
> > Yes, I saw that. This change does not make any difference compared to
> > "depends on"
>
> No, there is no logical change indeed. Simply IIUC the documentation
> "imply" is the preferred form.

Okay, per the documentation "imply" is the preferred way over "default
y && depends on".

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
