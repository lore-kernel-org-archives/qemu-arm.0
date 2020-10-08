Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1460640lfq;
        Thu, 8 Oct 2020 08:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwrqm7L8Rvi1q56K2koPeTMbf30koHcqnsT54HxCCGqVM878bDC8BxH5crSivmSgeUOguK
X-Received: by 2002:a25:e785:: with SMTP id e127mr12433555ybh.447.1602172206750;
        Thu, 08 Oct 2020 08:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602172206; cv=none;
        d=google.com; s=arc-20160816;
        b=VkMMZOTA1y7NtHm+UZnF2jGjyQZREtGqXY+mo72x5UEO4KmeEZKHXe8hnanIBXybHH
         T9ietC8yK5TJH5h937xxhL+BP/Tl9HEBs+0fbYRjLNeErp6BiGXHTlxPdGw3FXnLu/pX
         oweZ9EJuN67bsD0MVsd/wd50SwiqgE3BdCI1M04/7uvepPviAWp+itXl2ufc7TO1hrq4
         Hfzx344Zkk6mA/2yxL8v5TpnMb1SKLDPod7bLY2SZbI7zGlD+FNHt0wlpJ1p946mmivh
         e1ioAl70uCQfAAlg8HibXlbx4dcoNJ0/PiLkZJY+OPk9trSZ0GSvX8pG2+aWgheata2D
         3C0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r64ZZx9bjWtXBdUUIcYa87604w1d3wlv8wpaQqXSNBs=;
        b=H8QVPMgn8BmkspvqdhzAaGxjf6lg2gLEFDKyO1xgv2kYDlhvVyFHTYZnLvBCTwj/QJ
         Nq2WRJl+RbHdh9A44OAMua3gjRR1eAzzR9FLdhdVN2e+I35SGx7ScM/4QH/OyaBOh2Uy
         8yy3Xj6LHHGzOmGA3s6VsKdHbNjRGqBc/y8GjUmrcssulXI67Jm5gP/Ic4X2R6SFhUps
         ROgLUIqMAmDEGYoLyRthEZikHvmsV1S5D4SuydBMv8YEuhxBdBYt5EmWyNtB6mwvQZ0T
         stmLeUVDIzgCFVPTEt2+yXAHXArgUiKMZcJUdRqkGb8qoB93r2dSalKO6guQPMtOebZk
         Agkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NEDom/NU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si4717789ybc.238.2020.10.08.08.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 08:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NEDom/NU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQYBC-0005xW-4h
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 11:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQY3G-00081N-OR
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 11:41:55 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQY3C-0001TD-Hw
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 11:41:54 -0400
Received: by mail-ed1-x536.google.com with SMTP id v19so6304882edx.9
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 08:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r64ZZx9bjWtXBdUUIcYa87604w1d3wlv8wpaQqXSNBs=;
 b=NEDom/NUNRHB0eufjsiezHXHVVl45V0GGbwJhWvFJMChVLUzwWm0LdtQyUx/2kLUW2
 3mjJUN5twjjA3D2j5hFMD//sTd69aSj9rYgGf02FsR8q+GXyPPAdXWly5nyDm2ZRLPV/
 Hdq6MulXotThxagrGzZ9KWlnhTCDCv+ylinS/ZuK718DmBMcCyrhQ4XxTWz4CcV+riFS
 EeZMUrKrcPEWoGjr6lf5J5bo98Af/6WKffzgUSYvUc3jMcyrGJJ7GMbW8rd8s7p8HV/6
 ShVo7y+ADjpjynyEnuDDKSgCGA8ezToXcjg5WH9lZk6Xskoz767JIHj2xOQwLvnDWEze
 O2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r64ZZx9bjWtXBdUUIcYa87604w1d3wlv8wpaQqXSNBs=;
 b=d4vV69cKo2FGZR5FTWNBuKjyVMvVJRue9JNLZtfWslS9cZjYbg6DV43Uo+omM2gh6x
 rTp1i++Esz8BuZZW5NMdzHbLDgzR9cTMXLfMqeJIEMpgcHuAmomNXdoy+vNlLwsoX7SZ
 Sqo2uEpL+JAf3Nqe+N2+2V//GKKFVZCBLar+sSb5qakfWFaYMzu35BW1B/k5TepJK6RQ
 BnzCMp8jj1zgHkYkjsWgRcfde3Lm/N6ZJMJchwvJVmMwUrCurb+Jquc5p1pVU0bMKahc
 1M+R4XCDxA00OzwUVCfjzWaQ/fCNyBFY6m3Drk0vWTNmOgsIMBxsYH9RG5zJpTjbA3O6
 6/8Q==
X-Gm-Message-State: AOAM532GO2XOYkzPwGHj+6DLV2WtcmobK3wsQnYRv7VD11D0nCESH/YC
 05CNt3unDVKWGQyDZKskp2m2fh6k2vI4o6aiH5k9zw==
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr9421777edw.251.1602171708747; 
 Thu, 08 Oct 2020 08:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201006220647.GR7303@habkost.net>
 <CAFEAcA_se7jErv9AFM2D7UdDMurB9Lb6W9aAXD6648spQ6idKg@mail.gmail.com>
 <87mu0xyrtn.fsf@dusky.pond.sub.org> <20201008151521.GB7303@habkost.net>
In-Reply-To: <20201008151521.GB7303@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 16:41:37 +0100
Message-ID: <CAFEAcA_=uScLjGR6vHbjsQK0-jgNuwNK+jcNf-u1yAh-863+2A@mail.gmail.com>
Subject: Re: Purpose of QOM properties registered at realize time?
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V8FSA017obzB

On Thu, 8 Oct 2020 at 16:15, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Thu, Oct 08, 2020 at 11:45:08AM +0200, Markus Armbruster wrote:
> > A first class static array property, where the size of the array is part
> > of the value could perhaps cover this case.
>
> This is an interesting idea, I think we should explore that.
>
> qdev_pass_gpios() would become unnecessary and could be replaced
> by a single (static) alias property.

At least in the current implementation, aliasing properties
is not the only thing qdev_pass_gpios() does -- it also
updates the NamedGPIOList data structures. It might be
possible to reimplement it so that we really are just
aliasing properties, though.

thanks
-- PMM
