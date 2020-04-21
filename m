Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4837179lfm;
        Tue, 21 Apr 2020 01:50:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypKbbgdDB2e2pv5b16ynaTgBTbD7E3YuEsIRA8SJfM6lXBmyHz23sKJiNB3wpKhh89mBiSSL
X-Received: by 2002:ac8:7309:: with SMTP id x9mr20727489qto.68.1587459047638;
        Tue, 21 Apr 2020 01:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587459047; cv=none;
        d=google.com; s=arc-20160816;
        b=WR35DfeE/Chh8jIEtdtFmvpOOWnj+XYKnLAHNhjA9zEl3U3Xe/l0RcdwAFgjQIAYbx
         8I9gqctR92AR5A51ny9YYsSgJ0Df5H/cZtj1hD76kTu7LhWquMUga6Ers3i8hcmVXWvn
         6zD/GVbytIczfMD1hEc1beECOpfZd0FhZsUQ9UhNUOQJntk7GZf5HMPxlMshBFIH6nvp
         q08ftuXvNFNKQZvnPn2DPsz6bAjvPL2ZaijLTHVPhQIiebf/bC9rf7a6oXD6jmkyTMdY
         lb3PeYk5IlhLTf/Dg+mqJOuJFl6oBopdMKYuG6QLtHipZxArfNKEIun7/DxPf7A0OytX
         GG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkKS5mxEUyNUQ/UWF5Jwi+aCUCM7nLh10h+Dr7G6SXU=;
        b=VJ6HEwAhHdRxL1gvpHFMfj6Qx/CCVpKF9G6pJQgL6EZVhU2KnIGUzQxSuljmOgGbQd
         HvuCtmizgD/xc+KZusdl6gXwskL47zB80XqTG8w0wv0tfjhBnpv9eE73YqB4IX4whSCR
         WYDlnNqFwoVacndu8UB73ZN1ZfoMOWdcYhsX/Vea2kNIC84DAdvNEcYFXyPRtMoxDy/u
         fPQPOpaT3T7ZrG8WOVHenoiz8jNf0gQH/IaqTqSg9jXp/Hzz7YpBCPI7b2lAD5VTrp6q
         FC7BeV+ZFhCM8rTrU7Y0VkzOzfhkpCoeCSwfnshVrW1TAki9qEI/RbqiJ4NJxH5Ilkmu
         VSfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GzTIjz8z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w23si1134874qtn.98.2020.04.21.01.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 01:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GzTIjz8z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQocB-0003DN-3M
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 04:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQoar-0001l8-Bd
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 04:49:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQoaq-0002h4-B1
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 04:49:25 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQoap-0002fB-U4
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 04:49:23 -0400
Received: by mail-io1-xd43.google.com with SMTP id 19so14161062ioz.10
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KkKS5mxEUyNUQ/UWF5Jwi+aCUCM7nLh10h+Dr7G6SXU=;
 b=GzTIjz8zoJFVvPYtvvxqWDhHHfKCbAkC9FSRDM9/tVEfctLpTCqvCCtJkqDxvayHf/
 ZL1EsC6K15t1YMtFK3t9d/srxuU+spu01BqUEJOgs4ERSGDcmIQn5/gYckYFBguKcbAV
 OCs+TFRQoWB2WXLEPFbQFo+KEspE6+6+8JwmS8g67HgrxisTBQ581bnURDz3JaukkUXx
 dWEB/Z14l5hpHzMvnNQDUEKzcObyo0iIR21htMO7xZ0ZoqWGu5Rk3LCxnuiAedFcgeDl
 HpSivTw/QL29pOc/UkdBlribn7hgHPRAKMTWtxn8t6as6k/QTmk7Z9Eujo8YHLIaggNB
 jBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkKS5mxEUyNUQ/UWF5Jwi+aCUCM7nLh10h+Dr7G6SXU=;
 b=GMQUcQaJLP78IQ3jGoFNcyTh8mmitj/TPzPib4MFGMDgsbBmmLutriIV4tQvMeajI9
 3MZ0mtCrb0FLgsnWZ3HIBFDkW1U6R2qhTNTddEla2zGSlnUoYck0kcQN1Ihzq+0f/MXL
 BwSjtqllA7AQrdkod0oexQUeQMM+4Sn02hjSQW+wjbOKiEY4qMxZfEjlyzBOB3OyTbpd
 YfMCzM9qTD/aGLKVfLgT4CPS9MlH6eEm3Ys6dp+TC226VFaYN5MvBljUxQos1eVaQrGd
 P8V5sgtV5wElXWjaJ6RH0fSvqK6e12VzdvbhFXFrmjcn/ClM+BDz11y0Oi6PUhH0imXR
 02Og==
X-Gm-Message-State: AGi0PuaFHaBU4sm/irTuavbCovaWL1ZXkX6zq9D6nRrEKfs7/YnI1Ozq
 VmftJcB9wuKX7XWGQGU/djlq9pOGhBHow9rFQGTk/A==
X-Received: by 2002:a5d:8d0e:: with SMTP id p14mr19909898ioj.0.1587458962835; 
 Tue, 21 Apr 2020 01:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200420212206.12776-1-peter.maydell@linaro.org>
 <20200420212206.12776-4-peter.maydell@linaro.org> <20200421074400.GE2669@toto>
In-Reply-To: <20200421074400.GE2669@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Apr 2020 09:49:11 +0100
Message-ID: <CAFEAcA85vOwzaLr7jwfqk=NELhn+Smkrm+vQD4BP6TE+khMbXw@mail.gmail.com>
Subject: Re: [PATCH 3/4] linux-user/arm: Handle invalid arm-specific syscalls
 correctly
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=peter.maydell@linaro.org; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d43
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
Cc: omerg681@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
 Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oPsQltgmZSEP

On Tue, 21 Apr 2020 at 08:42, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Mon, Apr 20, 2020 at 10:22:05PM +0100, Peter Maydell wrote:
> > +                                if (env->thumb) {
> > +                                    info._sifields._sigfault._addr -= 2;
> > +                                } else {
> > +                                    info._sifields._sigfault._addr -= 2;
> > +                                }
>
>
> Am I missing some detail or are both branches of the if-else doing the
> same thing?

Oops, yes: cut-n-paste error; as Philippe says, the not-thumb branch
should be "-= 4".

thanks
-- PMM
