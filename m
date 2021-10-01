Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1098932lfp;
        Fri, 1 Oct 2021 02:39:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxVWOpeGKl4rkMcIyldulJx9TP9VHJCOqyH0g+tC1bk7Od1kjxFsaS94bWzA/w6vLpEvQC
X-Received: by 2002:a02:aa8e:: with SMTP id u14mr9045445jai.24.1633081151823;
        Fri, 01 Oct 2021 02:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633081151; cv=none;
        d=google.com; s=arc-20160816;
        b=CdaAZNdYta70MeosvbwiXOln6bB5jCOL3a++a4IYmfezc43Zus9bgtfgZFCjTui8gH
         E0Xke588fHSfX8XpnBRuoOH4Vl/dlWlHc40yDiwyElxD0jfO+r4cRB2yqngP5Y/qvNO5
         K4JG2MjX4mLB66gGeyeMXD2dcEwneC44RtyltLnZJkiF73q7yKGi/DJ3X9SBxjEDrvAp
         ne/MzWC3y/noFG3o5CQn/2zUjSTy5KMyoz6fhMYpci/v7BQrzigPSegimlZltNFVG7X6
         mdD9zS6YKScmIF1a99JsgsakRD6bYx1SiAfeHOL3hZlGu1+9XP8OUErP6jQ7T0X9RWkR
         e9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yZ66l2QrH5ZiOnf5A72YJoQXai+xIQh218TZs6Uwy/I=;
        b=aCK7uPi1m15HpBeONB3Nwgb0sCRMgAVHT5TP4nxHyQO3MbM+3GNNoWfA0dGju4guOn
         r4zzhf2K2SoYc0l5sS9n5qIyCUu3bNsp29RITGLRJduI1G5xfPTcMxP+OG42G5QbEc78
         eNzyh55+K0msx+xz0I42XOuH5JQU+hCi8Fv2ZscjEsSfcG9wJXuncV0bWi+oxI1Aiqj/
         u/vCSSaSQ1dcqV7M5iPu9DcL+RMWFk2LNuqhrDjeMb8dLnZL5y/rb1x6aFhUrqtx7jGl
         qp2za9a4ocP/e4xN2kah2X5OVoZkL6NKxtU/TMSJW0DtslRjUmA+l3Mpjvr3m2UR3Zw6
         oGZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w8kGMrS2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si5191443jaf.96.2021.10.01.02.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 02:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w8kGMrS2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWF0Z-0008BW-4q
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 05:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWF0D-0008BC-03
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:38:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWF0A-00037X-VX
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:38:48 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d6so14428038wrc.11
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yZ66l2QrH5ZiOnf5A72YJoQXai+xIQh218TZs6Uwy/I=;
 b=w8kGMrS2UIov33UsuaSQRL/gxS7X+R0KBBA17BOjFjey7WyS8+wFlF0iMz4Ls4rZcg
 OZBlR+CVOnqDTRdxtyKWsAPD7zcS8bICtJy9u5N6U0u/6V2oM0KNgCfmDuTem6AyAVYj
 5PRgGwILysjIZwyQG4i2PHU5xPRGNH0imFkeepjkWuA5g2IhixXIZvO7ArgQjLui+3PP
 Anxw7zIp8VZDu+D9F43r/fosUUSOHxH/zPhyKpMUYd/3HLNuFE830ipwsqUkYXbwEooB
 Y5cQBW9IXPXFl3sZ1WqMTbiSArJf5it8yKH/U0ncU3CtRTYLj/i4m7va4FCqSaM1X6O5
 ZgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yZ66l2QrH5ZiOnf5A72YJoQXai+xIQh218TZs6Uwy/I=;
 b=Rgm2sAG2L4HhiStc/luKTUICRq0nITOcvbTv+88mvYYyNZsSTqU+zUf3bZrl8nawxc
 bBv6EyaEHzD6vM/CXAZw/O7xZqvcDHmgNY+AbOjMZpgA77UM/iZkjKVsbdvCxjEiYNlU
 UVpzN9wsHCpvYdrdCJzL8GBK3xF2vh/1XRAbB3Y9SKel2dThAgDjMqC+spaXCbgdCWqW
 4p2PnjNjjv64UI+ev/k0IgwUJATeO91VYFYtwp/1nkE3C+DgEu4NI01jMBykV60lnFDn
 +aw+Rnvr596diGt9CB1xBOSIdpWm3dncHeYmtBvfLaK2x0XnTANqzbcnGKox4wjKM5Xz
 +jog==
X-Gm-Message-State: AOAM530wnwYiySVQPWXO164svV5jspKN8xpqMWLnXHPK3fNyPGShkYT0
 WaT/vbAmqUPLYRRH1ZGpuev8rVhPM/qp4Ju9xQOgww==
X-Received: by 2002:adf:ab02:: with SMTP id q2mr441130wrc.263.1633081125264;
 Fri, 01 Oct 2021 02:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
In-Reply-To: <YVbQERWD9fY0kxxW@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:37:51 +0100
Message-ID: <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lfPeHqjujy5g

On Fri, 1 Oct 2021 at 10:10, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
> > On 27/08/2021 14.09, Thomas Huth wrote:
> > > The dtc submodule is currently pointing to non-release commit. It's n=
icer
> > > if submodules point to release versions instead and since dtc 1.6.1 i=
s
> > > available now, let's update to that version.

> Most of our supported platforms don't have version 1.6.1 available.
>
> As a general goal IMHO we should be seeking to eliminate bundling of
> 3rd party modules that are commonly available in distros. We've
> carried dtc for a hell of a long time, and if we keep updating our
> submodule we'll keep relyin on new features, and never be able to
> drop it because it will always be newer than what's in the distros.
>
> So personally I think we should never again update dtc and capstone
> modules. If we want to take adbantage of new features, then do that
> through conditional compilation, as we do for any of the other 3rd
> party libraries consumed.

I agree in general, but (per the commit message here) our dtc
submodule is currently pointing at some random not-a-release
commit in upstream dtc. We should at least move forward to
whatever the next released dtc after that is, before we say
"no more dtc updates".

-- PMM
