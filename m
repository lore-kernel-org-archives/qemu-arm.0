Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9394313lfc;
        Fri, 29 Nov 2019 10:48:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzTvf/sltCu/nze4x5XzCAUkZGICsQxSfwA/SPFRYn2hCQtibvfLreKIlmdBNkmY5pWl8kV
X-Received: by 2002:a17:906:3793:: with SMTP id n19mr15382101ejc.85.1575053283860;
        Fri, 29 Nov 2019 10:48:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575053283; cv=none;
        d=google.com; s=arc-20160816;
        b=UzQTxJjXmH6+l5Ghv4UNGmMfmBbKJEeQj+b8TIXpOUzh7TpxXm1hLSWziHu688mugW
         LspVV7vwBSlks8dzqAYW6yQS6nvGNq2NKYnYXOlDKBlX825anqRxfeFWv6h3If8sgjfk
         Cn5eAxRQlrizxEjFoHspJg401nnIFk5dbc5Zn0j9kBZSAmXmX/2jO2nUmT9+yMUEW1Rg
         e/pD+EsuRvS3EVAXjO5BsD+pgZXw4NCmvnYj8f7SLvOCg+nRQQd9c0FMHXJwc/AlnjEr
         kTpBIYRmUnSC5SaI4iGLbCeAsJ4xvefeUO2I2zUAmMCMdjP4M69RjiT8R4lw0ZnR4RcN
         i3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hir47yhQPKRg9uBcGPhzpCqfbh2WTx7BBtpOVbhG8cY=;
        b=WCuRiUKesMWo+nZSNKLc58KEmyYIKzhZYrg98uwBRpUJCCl1qghnamVLdS3xwO6WBF
         4Qxjk9ONOA5IsL0aN3rMKj8CoWKMaTPBAel73gwGn0oUkWpEtqGSb4NH89xU0AV579H4
         zGgZmmNtJ6YEESszcvk2231v7OlcLTb5xHqjLt8EqllCeqAaN9VTAEz/veFrnBsA+m5t
         OZ+5WFH8YLCs6DbyE62S/up9e+aPWS+Z6m+qL/Kn17lPwmpHZRewoEdAz5HMXTYslvuB
         qIq2okx9wuMo/2LJUBNCHQvgMrTmu3y3tXGAq56CRlzkI6c71qVEb+a9TAkWamisdrUM
         +3NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GxP5Bnpf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si15463514edq.31.2019.11.29.10.48.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 10:48:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GxP5Bnpf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ialJB-0008CU-Or
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 13:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ialEK-000633-Io
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 13:43:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ialEE-0004as-WD
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 13:42:57 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33419)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ialED-0004Fj-MH
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 13:42:54 -0500
Received: by mail-oi1-x244.google.com with SMTP id x21so19730968oic.0
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 10:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hir47yhQPKRg9uBcGPhzpCqfbh2WTx7BBtpOVbhG8cY=;
 b=GxP5Bnpf9WlXqOpFyh9MPZZVj1aSQKym71N2kswkkfpBIqLm2NCLh+A7W3svvaF/pI
 uZDsfVDfwjBpslELCZlT9miubNos2lLopDWppZ8UJb0bGEkN2BJrZoNs70+XvAHyAvm+
 Qyu+doUA42/TTmkLQl7QdL0AVT/H23wPwysd7a5ZlnoU/ocpdX+rJINdky5XUcyAcKnK
 fKXj7srWJ0KnWtCuRevOKWS/OL6LuSCZzAZi77naGRK7RO0uHc2h23FMCxR4pg82p2EQ
 6FbHA2Chv3usMP1/tpEAEaQLvL72epbtwI4oU3vdU6T3HcMyEs0e+4SbT4AZTx6sJgl2
 6/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hir47yhQPKRg9uBcGPhzpCqfbh2WTx7BBtpOVbhG8cY=;
 b=iM8/m3ggbcrK4bjDLlEDqoic7IvtLVR3cyVmmAZeVt78syn0nnn+KYGlGi9YEwJY53
 A8RS11SKI2MpZNtw/skvoQ4EWA0HU9YtVnr/xFzDRYcdof7R8i63IMS9SuaqYWoT0S1o
 tXcW3lmWyEIXwE5yKwxTReeiAsNwjoFAobQvfqwEkHU7agX92CJ8G9BXDfceWCSMjVJI
 kXqDTjlRDKhy17ar1sskbSbk60Fnwm+ipBECQXymX4IIpRJaL+sSX5sb8OyAXzBChYjO
 ya40FYNPCDxvLnHOhXDbfbDH2/Jt/369Y6PenyXgUkNywFSM18DC5w1BWoTktWy6/HZg
 0t5g==
X-Gm-Message-State: APjAAAXTGtEzTj6HvOsb4E/iX0z/MZ5CKAfzTpw7RqTtwgJFf6HkBSKe
 tW0rNctGy3OJ1ssFBBQ7d77vYIwhNYoX0lwivOx7LA==
X-Received: by 2002:aca:1a0a:: with SMTP id a10mr11120249oia.146.1575052969960; 
 Fri, 29 Nov 2019 10:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-9-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-9-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 18:42:39 +0000
Message-ID: <CAFEAcA9D7UUkNJyWAiO_EM6OQ8JPH3J1Ko+6q8C+3ZKNg-SuxQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] hw/core: deprecate old reset functions and
 introduce new ones
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uUi062/i6hkW

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Deprecate device_legacy_reset(), qdev_reset_all() and
> qbus_reset_all() to be replaced by new functions
> device_cold_reset() and bus_cold_reset() which uses resettable API.
>
> Also introduce resettable_cold_reset_fn() which may be used as a
> replacement for qdev_reset_all_fn and qbus_reset_all_fn().
>
> Following patches will be needed to look at legacy reset call sites
> and switch to resettable api. The legacy functions will be removed
> when unused.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> I've removed the general helpers
> + device_reset(DeviceState *dev, ResetType type)
> + bus_reset(BusState *dev, ResetType type)
> because with several reset types, all devices and buses will not
> implement all of them. I think it is preferable to define a
> type-specific helper every time it is needed for base classes
> implementing the reset type (eg a device_pci_reset(PciDev*) for the
> pci reset type if add that).
>
> So device_reset()/bus_reset() symbol names are not taken anymore. I
> don't have a strong opinion of what names should have the
> device_cold_reset() and bus_cold_reset() function added in this
> patch. It could be device/bus_hard_reset() (the current
> qbus_reset_all() comment mention we do a "hard" reset) or simply
> device/bus_reset() or anything else.
> What do you think ? Any better idea ? It should be consistent with
> the reset type name but we can change it also if cold is not what we
> want.
>
> Note that if we don't settle for device/bus_reset(). We can drop
> the first patch that renames device_reset() to device_legacy_reset()

I think we're good the way you have things in this patchset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
