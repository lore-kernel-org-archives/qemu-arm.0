Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2001335lfc;
        Fri, 13 Mar 2020 04:26:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtsdNVUumSKjZXzyRMKEcJ3aT3qRB4O/DKqbemPfXnWmLMDMQgRrssexJMtpcVmi7BmoX6+
X-Received: by 2002:ac8:1198:: with SMTP id d24mr11906563qtj.105.1584098781147;
        Fri, 13 Mar 2020 04:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584098781; cv=none;
        d=google.com; s=arc-20160816;
        b=nBi/xK/gid4rb9IEkQFbVKxUY///DG3eIkv4DYTWAt343ncOmpPZUXKMBF9Kg8aKKX
         cRMvQV/DHOPEONuChpz+PAkr6tylmoe7cV00ghumKNLDUQBegqPHvGXUcsuQ/JIhyCuO
         tpmwx9rwxaoZJT2xNSg4hqXnrClMqU1wVXNgWtjyuAtOllufuO3hhKG++9zvHNaskcqX
         X6PSO6jUYx5wVYjPr1JugaT1rNDZ7SlRt+lr+zCvfHjXYTpeEV334+inPgZ1oS3cVSO/
         bvdu7yFZ0N4ji6wHpXFTdb2BuoY1XOxTB0Vu+ptmID0a5WTtr29sTqaFBxfSDWaP90zW
         k5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LEggssMrNWfgVXP5KOHtpbYiHSEuQvKakj/NOBYQm+Y=;
        b=r6ZCwopxIaMzTDrHKP7Rf1e2Cny7yIifpdiQIocQH9Bbv7K5G6GwGOm0lLzWJalbFG
         e6kpvxciQrmE8fMDa1tkySv2wC0o9AacqNRgBDZTJJJm/WIjrn3ZWWq2ANcaBKkMUWgC
         WPXnS+MoG906eqgAd92vQPjD/segUcxmdGle8ic9u5sO0Vco5jllftlll9pPdpi2Ci/s
         KrOz9inSwYqYb8Q2RWjvrqFtE5lkm2hnGRPRavzOt14Mh6Nn1WlBzoi2s/jjeYW8lYmd
         GXliGO6yh+Rn6lob1CC1TCFcDypfnZ5JpedGdpo9wLVxIiTJtklOKLo8DUKsk/2b1LLD
         g73Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KxdtSifU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si4772570qke.348.2020.03.13.04.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 04:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KxdtSifU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCiSK-0005xv-J6
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 07:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCiSA-0005xO-5i
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 07:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCiS8-0004D9-U9
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 07:26:09 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45707)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCiS8-00047s-Pr
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 07:26:08 -0400
Received: by mail-ot1-x344.google.com with SMTP id e9so2465820otr.12
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2020 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LEggssMrNWfgVXP5KOHtpbYiHSEuQvKakj/NOBYQm+Y=;
 b=KxdtSifUuM+kpkjK0R4tgQypAEMlmBEh3lj52KdCqneFD6/O57tx6IsFHuaReDxaQA
 svfQBxzu4MjxY6VEC1PNcT4tjQ2rB9iL3fDAGahviouPqZPzVxzMZy6dT+8k7VP5qf5f
 /ovzpihLXiopypNIMaomkWnsb6HBsJX7T3dRlmzeugz6Uks8+jrrvK/DQaJ+5l7eY/La
 4URMlo3L9hGWaFNuLYmEGMCNrrVLIv2jJJeJS7r7t8yu3EGP3rslB6875+dNmD/1W1qO
 HexdKf13knrLX+T+4N4hxgwTbgxoGOVPS4gzDw+UEmvzXUrcUOLE5hB56TgVaNrGdVro
 /FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LEggssMrNWfgVXP5KOHtpbYiHSEuQvKakj/NOBYQm+Y=;
 b=p7rxE6svdiWbbJhZDXb7kZ5ggSwovuXsNsOQF81MrpIeZONHmfR4j/W8qznclj7u3F
 qR2ZLg8mLit+4YFMoB3cros4Ida5mL4LvPGISGW4fnuLynndhAOz2RmRGUM4k0Tzftrs
 lMRRhfTa+ydEnN+r7OKhhj/S1+kTIrSrT2IIysD665mVIxWBXT5JWftr21YkEBb95G9Z
 parFlKD47cksH9++IRjf7yT+ydxtFPxYrsb5FPr5GAsRLgwNlEJG1KBOA5QXS8AjBCHR
 T++TeFXBWwLf3ns3MDuDE1Nj8qF6TBmRxBfVRUSzs4bbfC56KQJiWQ/ZPNxCRxtqQM+n
 diMA==
X-Gm-Message-State: ANhLgQ3In1tM3ic7YjgLXzYpj4TRZUHUw+dsR5QWxfNs89nP+nurGUUM
 1OHKjjAVlwbb0MLSqOm6pjL852e/XDEEPXPQsXkN/w==
X-Received: by 2002:a05:6830:19e2:: with SMTP id
 t2mr9946162ott.97.1584098767568; 
 Fri, 13 Mar 2020 04:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200313014551.12554-1-linux@roeck-us.net>
In-Reply-To: <20200313014551.12554-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2020 11:25:56 +0000
Message-ID: <CAFEAcA8boUtXByYcgpo-gUnf1SEe2XiVNBbwLvjjijwj1jNxeg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Wire up USB controllers in i.MX6 emulations
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /blp1T502Ant

On Fri, 13 Mar 2020 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> This patch series wires up the USB controllers on fsl-imx6 and fsl-imx6ul
> emulations.
>
> The first patch provides a basic implementation of the USB PHY controller
> used in i.MX28 and later chips. Only reset bit handling in the control
> register is actually implemented. Basic USB PHY support is needed to make
> the USB ports operational in Linux.
>
> The second patch fixes USB and USB PHY interrupt numbers for i.MX6UL.
>
> The third patch instantiates unimplemented pwm and can devices. This patch
> is necessary to avoid crashes in Linux when it tries to access those
> devices. The crashes are observed when trying to boot Linux v4.21 or later.
>
> The final two patches instantiate the USB controllers for i.mMX6 and
> i.MX6UL.
>
> v3:
> - Minor cleanup in patch 1/5 (see details in patch)
> - Added patch to fix USB and USB PHY interrupt numbers for fsl-imx6ul.
> - Added patch to instantiate unimplemented pwm and CAN devices.
> - Instantiate USB and USB PHY separately. They are logically different,
>   and the number of instances is not always the same.
>
> v2:
> - Implement and instantiate basic USB PHY implementation
>   instead of emulating a single USB PHY register



Applied to target-arm.next, thanks.

-- PMM
