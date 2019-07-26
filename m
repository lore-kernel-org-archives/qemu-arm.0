Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11705975wrv;
        Fri, 26 Jul 2019 03:03:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydbbBP+gcR5Twssdrgx+G7LhlciCU0ZbGWNAk4Z66i//s04woV/cpE3z63RmHQN2wAdm29
X-Received: by 2002:a50:b6e6:: with SMTP id f35mr81434806ede.82.1564135415844;
        Fri, 26 Jul 2019 03:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564135415; cv=none;
        d=google.com; s=arc-20160816;
        b=cSaLeSSHCXQxHyHQmqRkvOSC+IUZm2RbPLuM1nz6Vy0aR5e4YHfcV30uJY0R4gSmg/
         eoJUDhibnJ2TGx7oSdNjkPD75q4LYia2XAQUWYYt0bVSX0X617DUWYLm+mJj9ZsS6pnv
         rOI/e0uBJKQDGDoy0dEOIjiv5LLn/KTG1CbD4EsSLT46/X9T4tYU2njlMBb8ZmNjtVRo
         cjaKMn4kk9eXAxXZV5ew2urJ+nBrE5kbwxsF72N8bmF4X6YVt/ifj17bsF3oI9kgJJGa
         6m/eE70LUkvIEP288sWHQdGgkqir47nOzepbktpMW1UI90hH1kdOQPFhCJMVo/5QD64n
         fpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P20WdgtHqqVlbO2NgdaGAJ5MUr3dVLCfw72U5U/80Qc=;
        b=HXIsnILj8JsMbrUS0T0UkgStVaPSkQdQPF+2+GhffArcKQdbQQNZ+qGe6ftCsadkM4
         wEJqBZB+FBoJeAE6fXdN1A63MdVIqFlZJpBSoSPZquRnlHbwRDfGKyP/QfW9SvXB741L
         ehG6/8DS+0D4CijLyAlsUlTyEkjuOJMT6L1epKkWRDGqGF9JUzjbMpQY+VkT88m5rVxm
         KHWC+OwtOFhB0bYp8mM585m6/1YXXnz8byuKwDWlsGv++bk4dxTQBlEUP9dvkqoi/VPe
         gF2gR9k65ItH6tMLKgAtkgdg/WSucD/6UgPYauEgrpoaACOH4nrL7fTIuYHsQXhGS+bM
         lprw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o54X3Jik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si11261714ejf.196.2019.07.26.03.03.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 03:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o54X3Jik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqx4V-0006pV-0a
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 06:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60995)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqx4S-0006p7-F5
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:03:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqx4Q-0001id-9U
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:03:28 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43593)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqx4Q-0001Nl-49
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:03:26 -0400
Received: by mail-ot1-x344.google.com with SMTP id j11so30513824otp.10
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 03:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P20WdgtHqqVlbO2NgdaGAJ5MUr3dVLCfw72U5U/80Qc=;
 b=o54X3JikoqUHgr43FlQkaH2ThCcspqj5yOvvrCczmpnhfWmdn9MabfQhBtGzslD97M
 MySjNX3S1v8Uh7NR1Z8v6n4FA4a8NxmrQvxqEEqnVTGTNz07grVyiHbrIpmsMrc/Cmx2
 hSRmHk6nZCQ3wg1IaurAiJiduhPZYpcQnDxcxMzsEz3HxP7chsx0/2zxrnK8D4G2XXOO
 qQi+1CC5tEI5Y6uIODRC0OA6HeptSSlZ+lM9AYRw2zck0NVXgd7T0XzBbGDbgZzUuW43
 7IM84JK3ymu0kPAAj8jgAbM1ijpWeXuGT+juiEQDyt7m+PhvpOWqpj1iM0j24ODmoZVX
 GKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P20WdgtHqqVlbO2NgdaGAJ5MUr3dVLCfw72U5U/80Qc=;
 b=azHOFa+y3dGm2F+p6OMFoxV4m/OvqtGBR+zlHWeLF9Qm38Z62h13e8dnX0PzNv09gl
 7/vv0dRvpd4ibKxLJBHAAqRCSMuFrgwCtl2ZX+zySxPOgSs1QWNfGFguuHng3ORI03Ag
 4N3lgE40aWWsWyCzUiN+NRPpl6LfL7+vbPG5jc4Zgf0ZsksB1xIMKDycH6ToU2sj4s5H
 dPD1YCmrpIXAaFb0lfehfNXsTucooXHhP98kztqOE0NuSIW+TRhj617TvzbkRVSDzPIt
 Srn+NroHJ7znM4E1mDGCQjm8u9Gn1XxiKrK6ZZRagv5oNWCwBMzs4kTyXO8Z6QRu1f2Y
 UCZg==
X-Gm-Message-State: APjAAAW10IYB5JNPypmMwRrUGtBVQWdcV2czpR2EGIjm/LgKpFqJzeHs
 /K9BmumSQ5EeexpVXJ9Cs3yZLAsOMGpxQObb1tvE+g==
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr21085506otk.221.1564135402023; 
 Fri, 26 Jul 2019 03:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
 <20190725170228.GL2656@work-vm>
 <c5a0799e-2ebe-5a79-915a-af52d471a589@redhat.com>
 <CAFEAcA8PROpFeKfxXFdVvVoZaus-MsX_EHGxw+yEUty_mnQdMQ@mail.gmail.com>
 <20190726095925.GF2657@work-vm>
In-Reply-To: <20190726095925.GF2657@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 11:03:10 +0100
Message-ID: <CAFEAcA_Rtv8sCk+JKBUWKYYg7drqj_8CTkCfxjjCzKz3rPuQzA@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1? 1/2] stellaris_input:
 Fix vmstate description of buttons field
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GF2x7wJN59en

On Fri, 26 Jul 2019 at 10:59, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> Don't worry; you can always change the int to a uint later without
> bumping the version again.  Unless someone somewhere has a device with
> -ve buttons it'll be fine.

The number of buttons is a constant set up when the device is
created (it would be a QOM property if this device had been
converted to QOM; as it is it's an argument to the
stellaris_gamepad_init() function) and the num_buttons field itself
is not migrated. As it happens the one caller of this function
passes the constant value "5"...

thanks
-- PMM
