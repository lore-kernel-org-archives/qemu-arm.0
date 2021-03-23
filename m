Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4412892lfg;
        Tue, 23 Mar 2021 03:55:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyciaHHhmxBobI1kkLUOcawNykpUDWZ6jd6/W/1O6ZqZ7AYGBVofDeHc3DKBytoYdcSRZJ9
X-Received: by 2002:a05:6638:f11:: with SMTP id h17mr3867823jas.67.1616496924301;
        Tue, 23 Mar 2021 03:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616496924; cv=none;
        d=google.com; s=arc-20160816;
        b=PmaGwMM5yUbP+9wSsJIiFC1j0g4uASTg+oDzCWSi4nuqJ+KSZgGvBE5YMBT7g3xWpj
         m3KcvlBCr04mVXwYEOvI5S7rK+7gmy46bkRuLN9XtEujwXCPlHFQlpekvWGccRGY5ZTS
         UVwQ9XMQxu0616N9ik7rO2+7frXUKupM0LzyuSg9B2ysVE002tvRQYtQZE0mTiyID+rq
         TJpCj4UaGFmQ+mPiK2ANneaNQhkl4WRgI1+W2gf2wfTzZU/115mSVshyikbmFBtxyi0d
         UxpwFBqjQ+crOJ/SfU/79BZkYNGTUm1iyjSV3ZZjyOxKaZ88+nf8mKbjybJhLtNnNM0t
         plPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PlQ1M49uwiBqU7zJK9Oe0O7XmS+lsIGXoNikxB4ENiE=;
        b=aBhqmd7qwvF7AO3uK+mrzu0KW40mpR/JdOGBEP+IxIUMOjOo+6ptq6cE7l4wmsxiN3
         Kk8PgvlLa0273Of4BOewLgmrrZ6ViqMnKouT8LlzfwislamBlSA+aSTqA2BmW2gxotqZ
         NeHLT0xUrddvcQOVDet5GjiAvWi1bIxwFgHgmPg88xibSJIZBv08CvsHxySTs/qOqN1M
         j87UnfHu0PWdNPzjGaBLp1DYfs3khWq87vpEdIcsd/nsht5doGwJHWvRizS6EG7JDcwK
         KgQRRdz9mw2fQLT5K7DvAFdzMgmusPpHCYGCgrmsOHssfuG3UP4MHNr4VDUCqgzaVcbp
         RV0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aIzl71VE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si11052055jan.5.2021.03.23.03.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Mar 2021 03:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aIzl71VE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOeh1-00005b-KG
	for alex.bennee@linaro.org; Tue, 23 Mar 2021 06:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOegp-00005H-9v
 for qemu-arm@nongnu.org; Tue, 23 Mar 2021 06:55:11 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOegm-000440-Dv
 for qemu-arm@nongnu.org; Tue, 23 Mar 2021 06:55:11 -0400
Received: by mail-ej1-x629.google.com with SMTP id ce10so26312587ejb.6
 for <qemu-arm@nongnu.org>; Tue, 23 Mar 2021 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PlQ1M49uwiBqU7zJK9Oe0O7XmS+lsIGXoNikxB4ENiE=;
 b=aIzl71VE0wJsfa+7IuYWxc3qG5K+RR/zuQtqlNsj6r3oOIghAvES3UbEa+DbS8EM69
 RsGyJyJYvKaLVMJYq2zc5s2srIiSN5qa0K0F3zO85ffwIRu+lzirAg9ind8SjxDI1XcZ
 SUOlGAYyEbo783OT04DkDPpBPMSukd3otDdwxc7HVfiBfmabVss3GK/k8uHjFoYGy2ye
 YOrpceSmaQM0lCHxC5bQU/a/9HoR3ODpAYl2Jb6epGO/Mxt+yRBQcCoZAFFWHAJ5doG0
 Jo6igH7KDg5XgppNkL059srfWaEoTUNv0uQ2oiLC1NtS+RpOIM59W0toOmRnkX7s8ZW9
 E7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlQ1M49uwiBqU7zJK9Oe0O7XmS+lsIGXoNikxB4ENiE=;
 b=l0lCtEnIf7fZgN/YnJDsyohffSAEpUI8wp0lM3YeVOzp3kSgTudxmEf2K8sJUFZepN
 6z+OZ43Q7la9hrkUcyPo4d6djNQNi3MKwAbahgdPTRXeAnQMGixsKuZaaMJZCBZtWs5n
 7//DPk0dN2N/6GTa7l1ixvXWTI6+Hm/9RB2MqoHwh6RaSvDZCIKXw3MPEcYQ8pq0uwbN
 tNcEXVhi0bNIy10p7BM1jlIrtsBBdgx9Sjqv+X+QDfXL2Amh5EaUYeAepMcZTHTMEcLv
 BX5RKEiq8f6V4KEEHAflMk2OBbigi4LVCtofRvL4Nam+Sz/F3xofnTLD0lXsDtACchBK
 VQeg==
X-Gm-Message-State: AOAM530XqiyaVf6vXDjBPA+/aMDjdBdDZ1a3zO2EC/rGW4zDca4dmKhQ
 9hu71v0F1QVTF2vPon4w9RxNjVR7nZt3fNExzE1u2g==
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr4205769ejz.382.1616496906251; 
 Tue, 23 Mar 2021 03:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210322201336.9539-1-peter.maydell@linaro.org>
 <20210322183320-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210322183320-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 10:54:37 +0000
Message-ID: <CAFEAcA9zUxUQN5CnJMx+P2gKOPwLwend17XWotKMZPSrhrBYbw@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host/gpex: Don't fault for unmapped parts of MMIO
 and PIO windows
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Arnd Bergmann <arnd@arndb.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zpdtnJtQtAyf

On Mon, 22 Mar 2021 at 22:35, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Mar 22, 2021 at 08:13:36PM +0000, Peter Maydell wrote:
> > Currently the gpex PCI controller implements no special behaviour for
> > guest accesses to areas of the PIO and MMIO where it has not mapped
> > any PCI devices, which means that for Arm you end up with a CPU
> > exception due to a data abort.
> >
> > Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> > like this return -1 for reads and ignore writes.  In the interests of
> > not being surprising, make host CPU accesses to these windows behave
> > as -1/discard where there's no mapped PCI device.
> >
> > Reported-by: Dmitry Vyukov <dvyukov@google.com>
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> BTW it looks like launchpad butchered the lore.kernel.org
> link so one can't find out what was the guest issue this is
> fixing. Want to include a bit more data in the commit log
> instead?

The link in the LP report works for me, I can just click
straight through.
https://lore.kernel.org/lkml/CAK8P3a0HVu+x0T6+K3d0v1bvU-Pes0F0CSjqm5x=bxFgv5Y3mA@mail.gmail.com/

It's a syzkaller report that the kernel falls over if userspace
tries to access a non-existent 8250 UART, because it doesn't
expect the external abort.

> > Do we need to have the property machinery so that old
> > virt-5.2 etc retain the previous behaviour ?

Musing on this after sending the patch, I'm leaning towards
adding the property stuff, just to be on the safe side.

thanks
-- PMM
