Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp444742lfa;
        Thu, 29 Oct 2020 04:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmCgNzEl04eJbbxTUdII0OJiaYekRs2J93scYgle0jrlCNHC/2RHlxKFr8i7zCqiF78iWy
X-Received: by 2002:a05:6638:531:: with SMTP id j17mr3119556jar.69.1603970892655;
        Thu, 29 Oct 2020 04:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603970892; cv=none;
        d=google.com; s=arc-20160816;
        b=LvJcToRujj05ewij40UGeFx4gfmS4tS7wg93HZpe9IKxbHzaqNJXOu5Gd578UWnmin
         c6efl9trXgFD0FZA/cM+WfUq+Ecjjiax+zL9K3uf7WYnwa1hZ8kPffSOXnWwxIKq2QvU
         sy9D9XqDriRhfUteLIkIvsPfuwfiXajG4zoZ6l3gZlrGn9GSc7RaoT/MPDf1OYd+li66
         JXdZfimCMQ1pngp9/YMLJCP5anEnHG4iu97GbKQ45NuaoEGqo1Jsm6rtMJz+P3BglQjr
         H5zIDCmUUpijQ+DO9pUbNpBeom8MJAxzrzEkxc5cnFQkUpdiGrhGafFuI42Riy6ZwL8l
         Cl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QRAzfMrRGwRRUzvgOK+sY9TBoKY4vb5n/jLZfIZGS5M=;
        b=aCwb2xOAtRevWqA44BYqRK9D7rRt9cmUkanSqGkfz3Z6p+XYt7s6PC7q9hxLgn7DgT
         pPEXLX4t1Gl1jpExlexue1E4ZjA4nZ5TSplbqiDG1x6BL2+qnPijDcop+Fs0faGwwWFp
         jZ3k2zoQ4aGokgwzbzU0f58hFDmG0NmOnXq+ptLBk6LvdOkcZPr8x2UqaMBmh5IpFSJb
         nLlEQMrq8lixp3vTuNTfqHTWsX+65+65iM06E+Gz7UAHGuMCn5o9q2ZSbHUf3+QM7HsI
         IDWOoRxPphnJo7S0cHqfpf6ufQkiUs5yYx82ifSvXFnnqq+vIu1qe8J1kwzN0Goh9rVR
         ViTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Kp/esOVL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a61si2194094jai.52.2020.10.29.04.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 04:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Kp/esOVL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kY66G-00079L-0i
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 07:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kY651-0006WI-In
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 07:26:55 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:37931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kY64x-0005XL-6C
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 07:26:55 -0400
Received: by mail-ej1-x644.google.com with SMTP id za3so3306467ejb.5
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QRAzfMrRGwRRUzvgOK+sY9TBoKY4vb5n/jLZfIZGS5M=;
 b=Kp/esOVLxzC8hZV5EmW0iId5K2OLRxla57GwNICcIHExLz2Z0IYGGqJycjsMgKLnsQ
 mgl8eA9ockct9VNAcX2KdMrjyHG1uYVZ9qcC4SFrJ6RUlhykEGBmC/TnxSxFJNtKl3Eq
 5quuGzl2nouQtfguq5MCX39+OgjYYofga2XkJIg43xQRvlj6idj290pp42xKL9TNEyJo
 1kqs1ffvShu8itFVw+FWcWSNnkT8M38KJiYf9tLU3xvY0SKQ2xxoh+SsnmvLZOQh+9cQ
 Bh+bss6wuj2M3L3kvSnekCT3i/Gt0jcmZh5wmlYFq8F1XXF+D8g1F8xxKXrEyXJe6QGs
 8CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QRAzfMrRGwRRUzvgOK+sY9TBoKY4vb5n/jLZfIZGS5M=;
 b=KPx/jXUwywp/y5jyalmtXXLbcr+22PsC/4Lj3rwWYFoca4mdvM8c1eXPqtuWiIOksk
 7yYAkIQQupkfRkQ/eU6sprisAvkMnU9aRAVVTWnCPCCdYzkZ1LR+RaP3mGt24KTq7ezL
 vKmGbFlvy8bUeA1zk6IkE483eKnXMfPGPj9QYszHK1HO3D27B5o2sQHqXnn3kQTsWhAa
 Q+bnoRQU5W871ZB4BvG69MPXdyCS6uXqtM8hm+syWkZquYBwzdWaH3+os3Av3PR593cI
 OH8LwS1ZDUeXFUGWsRw799uwRbwTG4i3n51yfs66yZNFBCqvSOkPWN+sl/WwRSkPlpBE
 xOJg==
X-Gm-Message-State: AOAM5300B9hBOc/A3V+7cLql5o7clPjsVGObnvtz4dl6L5ExG3P56aMH
 ae+SDtbWAhbchet4pc1QpreCk2LYHfK8wy2LlCK/Dw==
X-Received: by 2002:a17:906:c7d9:: with SMTP id
 dc25mr3567421ejb.482.1603970805210; 
 Thu, 29 Oct 2020 04:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201028085918.14580-1-maxim.uvarov@linaro.org>
 <CAFEAcA8_1w=4qdE_AJxUP-uPoFL=Fsg9hy62Lw7bLDjKzL9Vvg@mail.gmail.com>
 <20201029111939.GI1664@vanye>
In-Reply-To: <20201029111939.GI1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2020 11:26:34 +0000
Message-ID: <CAFEAcA8etCVD9QkG8+VNezF_5rX-CMVRV1tSjqwBT04yDvdM_Q@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/virt: use sbsa-ec for reboot and poweroff in
 secure mode
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Graeme Gregory <graeme@nuviainc.com>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 QEMU Developers <qemu-devel@nongnu.org>, tf-a@lists.trustedfirmware.org,
 qemu-arm <qemu-arm@nongnu.org>, ard.biesheuvel@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tTUCVd4e3mzm

On Thu, 29 Oct 2020 at 11:19, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Hi Peter, (+Ard)
>
> Graeme is on holiday this week, and I would like his input.

Sure. There's no rush here, as QEMU has just entered freeze for
5.2, so at the very earliest patches for this feature wouldn't go
into master until mid-December.

> On Wed, Oct 28, 2020 at 20:31:41 +0000, Peter Maydell wrote:
> > A couple of notes on this patch if we do go down that route:
> >  * we would need to arrange to only add the new device for
> >    new versions of the virt board (that is, the "virt-5.0"
> >    machine must not have this device because it must look
> >    like the version of "virt" that shipped with QEMU 5.0)
> >  * the device needs to be mapped into the Secure address
> >    space only, because Secure firmware wants control over
> >    it and doesn't want to allow NS code to reboot the system
> >    without asking the firmware
> >  * it would need to be described in the DTB (and maybe also
> >    ACPI tables? I forget whether we need to describe Secure-only
> >   devices there)
>
> Would it? Could it be something that goes into the virt spec?
> We don't consume ACPI in firmware (but TF-A will of course have access
> to the DT regardless).

Well, for sbsa-ref it doesn't need to go into the DTB. For
virt we mandate that everything is described in the DTB
(and that secure firmware should consume the DTB to figure
out where things live), so whatever power-control device we
come up with would have to be described there. I'm less sure
about ACPI because I think that is used only for describing
the non-secure environment to the non-secure EL2/EL1 code
so it doesn't need to describe devices that aren't visible there.
But I'm not very familiar with ACPI, hence my uncertainty.

> For sbsa-ref, I would ideally like to move to emulating communicating
> with an SCP over time, as opposed to TF-A directly controlling the EC.
> I am unsure if that leaves much opportunity for code sharing with
> virt.

Yeah, that's the kind of complexity that we would want to avoid
in 'virt', I think.

thanks
-- PMM
