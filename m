Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp293193lfo;
        Thu, 28 Jan 2021 07:01:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuERpCw/yoaW6VnJKuXAbFQRsepd0OmnmeUQ3uBuqgMr9h7C8Uv/DeNDJTcFjh4JBsynRI
X-Received: by 2002:a25:ad41:: with SMTP id l1mr23908832ybe.98.1611846087462;
        Thu, 28 Jan 2021 07:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611846087; cv=none;
        d=google.com; s=arc-20160816;
        b=DgPIJXjKx05x9rXFcs0wAkLbPP/OE3kBPvcN/ctPeoP1p+MB2uWMChfaOPD8lkYFdO
         pubSIQpFIEyiRKcaqAPocGs0BzVjHWMpiVDceOQDSnTzlsICXdFb2yN1xMRip1WO5mJu
         XDXSNyxhu5G8M+1U2bJ1ggTI9i9xAP6JyJoRRggbu5V3lxpUQ21COSnB6G5hID+A8PuP
         /Oo2wnZnIEmfnnnDflbSb5LytKXozsNaWzTiBMtgkyHRhASACWNMppklwzCmyvj5CgP1
         HuKjVccTexrEWe1c/kcE9GFtYjT2ecK+2XnHQHOHcdf9/4fmDVd5WIhipFPnzb5hSsqd
         YGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2BQSxln3svi2n+JcH2fO7IYmtxAF9oG3oZ57LVMvl9I=;
        b=JcBDjJuvMGnFix5bVFP4ZyKunJu+AErUYgR9aebAuYmndfYRoaPXkvvfJO8ifast9m
         c3aIde30ewdCzrMguw5l0JwPC4jTG8V8h3LSzT/ax6JL/Qt8IBkKtsfS0Yv9Wiaof5no
         mK/WfpG9xdKV2zWcfV55JQb5RQd0adPYxLgVB/IMatXkz+ArtYdh5GGyJ3/9VBkTEm75
         OFsOafNixqmswdnEMr50yPb6IwxGPR/0iuoDqW6GgkmE34M95Ajfmyfn4gjCIqSOZUP+
         S1SwotC5IjNiZyTv8fOPzkvNpjOMwGHDTsJs8ikjzVXlUX+ehPYb9fyt0mrcdELxRssi
         BfNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="plWmR/5d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si5533150ybk.139.2021.01.28.07.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 07:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="plWmR/5d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l58nW-0006VG-Qs
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 10:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l58mq-0006U0-JD; Thu, 28 Jan 2021 10:00:44 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:43504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l58mj-0005v2-K7; Thu, 28 Jan 2021 10:00:44 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id y128so5691794ybf.10;
 Thu, 28 Jan 2021 07:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2BQSxln3svi2n+JcH2fO7IYmtxAF9oG3oZ57LVMvl9I=;
 b=plWmR/5dKChfrjWAEz/Ubkrb1RRyEgkkqfgcKVas4zgsMh6CMz6oVssSv1L9EAYU5A
 0Eb28qWHJt0eGW2+mfiVURugLq823X58V/30ERltrXwfKrgcXPoWr+g+Ed8iQsyNCrTV
 wowz1qBUU5P8EdDua768qiODiM8D8AsmCGmapp1vj9tPRj77rAJmOKIfuHe+OU9PuMai
 RZSgnp2PvtX0yaKp0q0E1goC5O7lc9RCyST+v0CwZWkY8VPrg+7CxRoCgaxk4aCH2bXs
 ka/OtRN3w5QnBprFE8q558uOWz31Esex3iVXIiUWGLRXztaoOKmmmyVezQpDK45qqg6y
 P4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2BQSxln3svi2n+JcH2fO7IYmtxAF9oG3oZ57LVMvl9I=;
 b=jHlMCfY6pk6Xbx3nVPjjKd/gnoYTnjbcbU+vRJq59/AJ1CaQjcCUOtA3gaHVxpuj6L
 vYcSMs/U5iLIRAGA3m1+EeyQ3RdEfXUwz4gGtmhxoP8Zlw+et1zj7HLkyb495AIvNRfU
 LAn5/dnqEaW333oMUh0jmMBMbT04kmUpZwYQeookYvJQyB6VlEk//4RuwA5p2Otb0YnL
 RG48bJV7K7i+C8UHQXKvGdTaAKMU/CgU9sOcmXD/2f7d0yfeTru8qMINgUeiMA0/IqLr
 avtu9BAoi8YJCv5cmhmaIeGH3OWeVKYGyfBUCN90peqS5+IEWrVrIskRfmvHPWkdOkcl
 J6rw==
X-Gm-Message-State: AOAM531125g7rzVo7BNQqh3kuMc4wg8j1LNet2wowjlDlK7P9igvcYfh
 biZHsxPFRu6jAjEx/NAS3Cj6BO8kKICNEpCD0bk=
X-Received: by 2002:a25:cc3:: with SMTP id 186mr4089880ybm.306.1611846028388; 
 Thu, 28 Jan 2021 07:00:28 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
 <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
 <CAFEAcA8=t6pxsvSt3FrPbAPXKT6y4t4hqjU8CXfbsw=RbbXK_w@mail.gmail.com>
 <9a8312d7-d3b3-b896-a669-8ce8efc66bf0@amsat.org>
 <CAFEAcA9LbKUZPhDfqQjHGfF9s-Se2drWYmKkn6pHY3gQit=BcA@mail.gmail.com>
 <26b80ae5-f1e0-f438-a1e5-9922686be128@amsat.org>
In-Reply-To: <26b80ae5-f1e0-f438-a1e5-9922686be128@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 Jan 2021 23:00:16 +0800
Message-ID: <CAEUhbmX53xMDfYO6oUFJxqVHkZ9Hwr9ypB-Ztq5TcxTCVEEZvw@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: atGoVf6f3+o1

On Thu, Jan 28, 2021 at 10:49 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 1/28/21 3:41 PM, Peter Maydell wrote:
> > On Thu, 28 Jan 2021 at 14:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >> Oh I totally missed that :S
> >>
> >> Bin, I'd correct this as:
> >>
> >> - extract imx_spi_soft_reset(IMXSPIState *s) from imx_spi_reset()
> >> - zero-initialize CONREG in imx_spi_reset().
> >>
> >> static void imx_spi_soft_reset(IMXSPIState *s)
> >> {
> >>  ...
> >> }
> >>
> >> static void imx_spi_reset(DeviceState *dev)
> >> {
> >>     IMXSPIState *s =3D IMX_SPI(dev);
> >>
> >>     s->regs[ECSPI_CONREG] =3D 0;
> >>     imx_spi_soft_reset(s);
> >> }
> >>
> >> What do you think?
> >
> > That doesn't give you anywhere to put the imx_spi_update_irq()
> > call, which must happen only on soft reset and not on DeviceState
> > reset. You could do one of:
> >  * have a 'common reset' function that does most of this,
> >    plus an imx_spi_reset which clears CONREG and calls
> >    common reset and an imx_spi_soft_reset which calls
> >    common reset and imx_spi_update_irq()
> >  * have imx_spi_soft_reset save the old CONREG in a local
> >    variable before calling imx_spi_reset and then restore it
> >    to s->regs
>
> Long term maintenance I'd prefer the 'common reset' approach
> (but this is probably subjective to my view on the hardware,
> since this is software, the 2nd approach is also valid but
> harder to represent thinking of hardware).
>
> Bin, can you send a v9? (using the approach you prefer)
>

Yes, I will send a v9.

Thanks Peter for the explanation on the QOM device reset scenarios.

Regards,
Bin
