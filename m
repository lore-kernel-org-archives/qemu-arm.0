Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5384508wrp;
        Tue, 17 Sep 2019 08:25:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxB3Hrjqdq1iJjSlUIorLAdEVNr21QK3Po0KLKxX2SN3niQ9rwtTFgQm0EChle8Pw1RX++T
X-Received: by 2002:a05:6214:2b0:: with SMTP id m16mr3672478qvv.45.1568733908460;
        Tue, 17 Sep 2019 08:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568733908; cv=none;
        d=google.com; s=arc-20160816;
        b=CfN23BHMPXeKzXWMEe35lG3sSYclWghr83GC1A/qItbfAzgKzcuzAkRm4huL68qo69
         9/RGHttqSJmqivVnjayExvIfsegLqRzPc0W3RCHbWbAadrJHSXfJ56B4yJDyFmTBMpz0
         p8I9UtKTEHKJeVXEGGevSLsL8KqQ/njGTqebebUAnkibI/fwFn0PbWyYOyLljWOu0NjK
         DcEhSuPrwWD4Tfzusi/Gf0bKZO7b80dUkaTBkYj3LLbtM+k09S2cSrGorDscMBu1YMCu
         5hp7mhZkB+5a/4l7d7T5k34IxpV7mEmDhGQ02xYZhzimH5qqTsPYgHnB6c+d1Q0yAw8r
         fnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=84lIvWS/UBsMxXislbD2ODOZlrUK175JaQEXmaCSesM=;
        b=OyqwXxz7bGSqEU72tnpnWOPHUe4jFcjYkMPTqpSJ6ZYLOtSCAziK6iSUvUyiQxYVDA
         P463evbnUTFtzaOlAUiNXGzZmY2ZYQLlVVsUQWte83Xd4jFXlAG/Cz7d81wGXX1Gy0y0
         YhJ6ZcT/QlhC+dbYqOFCTWIl0RunG9AMxmRkGv4FboIlOE8SxmnfPqsFNV252bZ9+LLP
         /xXUW+jA/qUfzoHbXN3G14oI19cLaD43+NOq7f+yVAFS1+yBmBYnd31yu/GLYCwcQjBG
         JENUMGHVdQ1uRog4zCv+bhGutQMZaGU5BePSMVul/nB8Jhv6vOkCutAAcMz7wrx1CBiE
         Knag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VyuxBYCJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c205si1696231qke.54.2019.09.17.08.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 08:25:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VyuxBYCJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAFLn-0005jV-Rg
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 11:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iAFKm-0005h2-BQ
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 11:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iAFKl-00060A-5Q
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 11:24:04 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iAFKk-0005zp-Vd
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 11:24:03 -0400
Received: by mail-oi1-x243.google.com with SMTP id k20so3221978oih.3
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=84lIvWS/UBsMxXislbD2ODOZlrUK175JaQEXmaCSesM=;
 b=VyuxBYCJ2KNwV12/uG4HZD/u5uLeUGxkr74DYW9oM9d0oDr0wSnqaVN1cActBVuytv
 vz+KFySUqUs0D49dzeWULto7cLPiqN6m3x+/Gc0kHuMUWjgaao+HHYhMzLFzWNMhpQNF
 i7+plUpRbQmWPNacm4W0QjL03DAOVqJ6hA/XIm8Wn7rnc4x+lnhSUhazZX562L/T5L3z
 P8UHrp5ArgxwzMvW445P8qGOc9prH/y/qtsYrBhvbLXKmYdkaioRZWp5yb3x2meUiZOz
 HDMYAAg2LKVFibJqI2DkqthQvWVo932rNHwXBv/o0bqjSM+Al9loNKJ7PeMAst1Pr+/A
 TEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=84lIvWS/UBsMxXislbD2ODOZlrUK175JaQEXmaCSesM=;
 b=XV/dhf7W3myMNmn9yVxwkqOSsaHdNv5CrD4/jYQHx2tbeIUDybOBH9Ei5a0B5axAel
 C/w5U007tejhe4Z9cb9Y0ey+74TilmpoGYPfbIwKuXZ0XZNBFmWipG8uAyj6ueqjpjGT
 Oo1hrQd+ZCE2/q06mcHsy+q8fK+rKrawIfZlASIcfhVvev6JnVBSfUuSmr9qjU4GRTK9
 Lb6cN1NbzrF/x4gPNAiNKsqR8Jwhd/0hMFb+ZpM5Q+T0mnkf88+ej+3FgkK8OFBnBYcg
 uHrCG25CEBpOCzR2Oz0v6TtV6BEIMaLGoKQbCfObkODjcVI6/wvNMe4k43+g91nRLqNY
 TakA==
X-Gm-Message-State: APjAAAVjGRtDgweo0c+Sa/GTbWTixMEceNvstiEOftonDYWiQR3ycMd9
 eO11JN9uFIDYtp3/WRkSkiI6g1i1lA/7oGaD+vKNDw==
X-Received: by 2002:aca:f54d:: with SMTP id t74mr4288531oih.170.1568733841674; 
 Tue, 17 Sep 2019 08:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-11-shameerali.kolothum.thodi@huawei.com>
 <CAFEAcA8sEhgOXnj-DGo04pSnpTObO+EeC94yrdGEikKq0=2QeA@mail.gmail.com>
 <20190911155015.3627b072@redhat.com>
 <20190911095332-mutt-send-email-mst@kernel.org>
 <20190917111100-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190917111100-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2019 16:23:49 +0100
Message-ID: <CAFEAcA8S0SE9MtjwmErAfjLACbc8p3sXFPeFLwfOW9czTwDM9g@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v10 10/11] tests: add dummy ACPI
 tables for arm/virt board
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
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 sebastien.boeuf@intel.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PBmLUdTNSX28

On Tue, 17 Sep 2019 at 16:11, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 11, 2019 at 09:55:34AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Sep 11, 2019 at 03:50:15PM +0200, Igor Mammedov wrote:
> > > On Wed, 11 Sep 2019 13:57:06 +0100
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > Do the tests pass with this patch and without the
> > > > patch that adds the tests? (That is, can we keep the
> > > > two patches separate without breaking bisection, or
> > > > do we need to squash them together?)
> > > >
> > > > I'll leave it to somebody who understands the ACPI
> > > > tests stuff to answer whether there's a better way to
> > > I'd squash this patch into 11/11 test case,
> >
> >
> > Pls don't - the way to add this is to add the files in question to
> > tests/bios-tables-test-allowed-diff.h.
> >
> > Maintainer will create a separate commit updating
> > the binaries and removing them from the whitelist.

Who is "maintainer" in this part of the process? Why
can't the submitter just create the patches and send them?

> > This way things like rebase work seemlessly.
>
>
> OK?
>
> Can you post v11 like this? I'll ack then.

thanks
-- PMM
