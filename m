Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp538083lfm;
        Sun, 16 May 2021 09:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRmTUh3RshMCZkIemfOJF/xfCLNjhpqIlFKk16j3XT0hL1isE1cTbJwrdsl6qwm7xB8AC0
X-Received: by 2002:a67:ebcd:: with SMTP id y13mr46651330vso.9.1621181398062;
        Sun, 16 May 2021 09:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621181398; cv=none;
        d=google.com; s=arc-20160816;
        b=0P8t2EN8mScGBABH/xgcynO9tO8MiiEif2loz8SDz51/ZiT8jqx7dmNWqt1UyEICS3
         PVMdtSMOkDBg2ALevlyK4aWTClZ9EiSA/ZLgOhw7NmzHZW9rb07asfOv/rljVSkcquJk
         EKlps/SnOGyJfrHWveo/Y20ig87DeuqP5RfhZ3jM6v9WtTal8PK3DzGfLC0DNJOlVkR2
         Gp/e5OcDyZSLCbXKLgn/jfOPG0d/e9tvQQG2uI2JR3bRZHmMNbMIHajIfjfhtjuF1S7u
         JO0eYa4+gjQQ7P+NtuGbgjGytqZCQB/OEAVsb00FQq18K5xGml9j5/+bNkW6WmLERWY6
         vauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ToUVxt88aH6dinD8va+eg6VECoFY59T9VHIDw/tiqus=;
        b=Cex8+Uy2hCxqYvcbOK7qj+ac0qzAGq/4JHDCPD4b8C8Yl4bDuBJsfcw5IGZMdZgz0h
         gGR1pxifer3c4G1jxeaqdLOJxSe6ajD+XBdXsiZ6ojqpCxKhGU7jNHmAtAhOwiVf0Lo2
         bI1zt3HEh0NNNV/A3HR04IEqLnnC2WNp4v+I1Tj5bVVGOeqGgK0zLlyE/iY2unVoNiYb
         ghCgHQOmKSR3oq12C7YkpjYKMuhDVzpQrEFRuRPy9zgO6L+ee0oXACJgAzJPsaAUWsDL
         Aks/xYa0F1VaDTNPx0GpOoPs+ROabAs6/shJ94N7Ha4skcjp5kX/Hxzjk4Gvc1abAqPi
         X9+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qDo+0kII;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si6395384vsh.377.2021.05.16.09.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 09:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qDo+0kII;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liJL3-0005mC-Cd
	for alex.bennee@linaro.org; Sun, 16 May 2021 12:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJKr-0005i6-T9
 for qemu-arm@nongnu.org; Sun, 16 May 2021 12:09:45 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJKq-0002hj-1r
 for qemu-arm@nongnu.org; Sun, 16 May 2021 12:09:45 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u21so5543628ejo.13
 for <qemu-arm@nongnu.org>; Sun, 16 May 2021 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ToUVxt88aH6dinD8va+eg6VECoFY59T9VHIDw/tiqus=;
 b=qDo+0kIIkLJB5c/yX3HmvooXxn+4epz5LtYhnuA29Bhx4oxu625HeBEagL2xEnWw+Y
 AHMNveE5iUj4Ia0SWO4uYEtrPVPZL+UKkKYyQ1mZNcYBev6fvA16MaOPKiRgK6lcEB8P
 OQoxys76IO7Q3XRGSIDLNIlCJZCoRhEzLlkC+L+164bMG3YeI8xkqolyNGXrDGqVVZoa
 eR1/fMm5zjW8JAQXerPh2Xdanxgyog4MI8UqOJqXu2olF2N0fpvQqKi6ZI6adUPRej0E
 QVnx4oe6V1IHfBoOpnErN+fbjkJpvnlp6RYtKAMegLUWTsq/BRjmc4RgdfK0y6GMC+X1
 KF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ToUVxt88aH6dinD8va+eg6VECoFY59T9VHIDw/tiqus=;
 b=fpyb24UKS01jLgmeEmQBO2Uq2pdfo8+2TMFGKHSfLISOm3WxHIQ9y7AAsjTJYA9sD8
 tradp9KqL8x2in08noERJJbSN67E3edlV7VRhUi5UC0LCI2D4x++hh9OctS9uM0YkW57
 ZRtyCoegklLxtD0wxcINaTpl+2D4qkCfQeTZwfePFp8BAlvmkoaCUqI3yxb0/uzbO9pu
 qwy075onK7cnWxLHFYO2e3vYi6+OQKGn/Srgk4fwsLzhTw9p2Npc1Cg/FFG4wLGj73L4
 fUWDGy3TneutmXkRt7xfaAVIy4TBxCPsUHIxVV6jOWaIF+/bwO5f48YlmeXQGfotw0zL
 Njdw==
X-Gm-Message-State: AOAM5317uTQ7Y+A/kYG6/b9btPWiHIeHYAXB33Ws00/UdvAE5+VYmdoA
 s255IlJWHK5uqFR0qFh0KVFjZVLOWGitwMvcc1VOTw==
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr35943175ejb.56.1621181382352; 
 Sun, 16 May 2021 09:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-78-richard.henderson@linaro.org>
 <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
 <47db40f0-52c4-f282-ecf9-eab2bdb7f1d1@linaro.org>
In-Reply-To: <47db40f0-52c4-f282-ecf9-eab2bdb7f1d1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 May 2021 17:09:27 +0100
Message-ID: <CAFEAcA8gYB+SWaUERkC+PbkqWwri3mx_E1TCgV184yX8YBvA6Q@mail.gmail.com>
Subject: Re: [PATCH v6 77/82] target/arm: Fix decode for VDOT (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: avlACSkbBQCC

On Sat, 15 May 2021 at 18:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/13/21 2:25 PM, Peter Maydell wrote:
> >> -VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
> >> -               vm=%vm_dp vn=%vn_dp vd=%vd_dp
> >> +VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
> >> +               vn=%vn_dp vd=%vd_dp
> >
> > Is it possible to make this kind of bug a decodetree error?
> > It seems unlikely that there's a use for having a bit which is
> > decoded both by a %foo field specification and also in some
> > other way...
>
> That's not what's happening here.  This has separate fields "rm" and "vm"
> decoded in different ways.

But they overlap: rm:4 in the pattern itself is using bits [3:0],
and "vm=%vm_dp" is also using [3:0] because the %vm_dp field
specifier is defined as "5:1 0:4". I'm suggesting that if the
pattern uses a field specifier we should check that none of the
bits in that field specifier are used in the pattern for some
other purpose (here 'u' and 'rm').

thanks
-- PMM
