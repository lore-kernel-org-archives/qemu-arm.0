Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2566949wru;
        Mon, 1 Jul 2019 04:56:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjPT0evT5NekEf2gIvYSwIIbdf0uNKLoVitvryyNnnsoOkgFRxG0zLhAAeRkJXvAHRML+W
X-Received: by 2002:a50:b7a7:: with SMTP id h36mr28605683ede.234.1561982185980;
        Mon, 01 Jul 2019 04:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561982185; cv=none;
        d=google.com; s=arc-20160816;
        b=uFRk95BHNQvUOTp+Fnd0zbANHqHHCfT5EtZXMAmocsCQDaYS3zLky6nPdYv15cdS+K
         bhI/zeRWLV9RJK+vJMoGMynOQjKeOMEYLozxu4HNqpjIJNDpISE59UCzuorO3OAj2oi6
         vwDw5MKmhyFcA+uT+iabNxg+0GxKR5xhGJ1oQFR5CHGMIjdvZOjcJvvEvfDdgVsuP+lZ
         MPPpHi228fLiZ5PNGuugFPXS/SmXCYoC3gs2IzS41TQWZZXkpIoXWbSAW64nPnL8Yq13
         +dhGdD6tjxbsBCPt4QXqKaz4yafzZopzOSjlFfC4W7LiS/MI2NMxGvrteR/NvimZ0geU
         8FUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5nEZI+hxb+H44y17IXUNqKuOh3W4xbgrH7vKYCJ5qs=;
        b=JAu5Cgm7ir5DCu7CEpI4yv2VtdwfP40/5H3irg+YSiHSh+SRTVd31jQFxRB+vm+qOn
         VT4CyHjkGILM3JVsNUl+5Rz7UxarKh+cuOzE1IL2dOtHBnvS/ejOvXZ25EoIqzi5WKPN
         bB9n6GJM86E9v0vBg8lycsDsqHN3itvBnfax545xNFzyjmMxxpGFFzX+UOYa8FCiMtno
         us3qwWZUjVYEXCoEcR5fYL7TUEnCwCklcDCzVg8Bxkyloog+1rK3NJ0OF7tJ5UcAV6rU
         CryN6/p784vjsG8Dp019gLQDKtew+wduluD+62sM9AQhnDSxwZQ//8xYZb0TYmnxVPSZ
         L/CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c8XZ50Vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24si8835084edg.100.2019.07.01.04.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 04:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c8XZ50Vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhuv3-0004k2-2f
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 07:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50757)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuuv-0004jn-SI
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:56:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuuu-0003Wu-Rt
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:56:17 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33180)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhuuu-0003Vg-Kh
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:56:16 -0400
Received: by mail-ot1-x342.google.com with SMTP id q20so13177886otl.0
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 04:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D5nEZI+hxb+H44y17IXUNqKuOh3W4xbgrH7vKYCJ5qs=;
 b=c8XZ50VqDWVZ5XOskKo3UJkr0SIUt+zFAj7uQBVRamDXZkXIN5dzsFPxeVTox9wBkG
 kjMM/dSrh7ih071+uzrB6IqBTDXOTeMQr+odGUVgudX6vEYd/lWdhVoh/BKq3Cv7o+CI
 YnHmRxWBMO5YW8/pKmruNmKoFfjg5hRCfADhfKZXJrPMbtkwyMyJIrY1bUHny/j8nw9s
 HNsHR8g2JR1iJCkvQ+nRA4mjcEyWlemqDVi6lFGwn3NL3mqHXqBiqTOxcGMZyqwBZEIF
 Qb6LJECD5l3aIaRbMjx1LHFMQu4vzW7HSqk2540ViputxGnZsqQ4rc284zV0NvgS3UBE
 m7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D5nEZI+hxb+H44y17IXUNqKuOh3W4xbgrH7vKYCJ5qs=;
 b=B9OjUcpw+YkOxF0wpe8Yy9nPVnAEAJR6Vg15qCNW6enX4kyoTspg9+2F0gLkK+4plN
 n0pD3k+lTWDRuIbCVoooEIdcq3OwgIiSK4NySFuhBrtUNdHbf5iqMTKiFuikJiABIGho
 N8f1mO0tUBiQz82+n8eKzM/tTzfSQikD/KGICCk5Z1NDnbUqBsLQ1eGUbLJsVs9a2IVB
 ogH4f1CK4GO5GG+AbQ9mDwNIiFHgFZxEz10nnImy+58y9qZ8x593rU6vdBPPm84Q9kYe
 vqsRHulUEah0hteOdigZ9Ztc7Q1k0T8JGPpf7iENp22xYNqo0yNm1DQ8rR0qZzSXDJ/W
 bMvA==
X-Gm-Message-State: APjAAAVtU8rK4RSvm0ic/WEtk5fr5YX5RcSyCJDKgIUfIsI09C20bQWi
 tHXZ/EYFpY1j43CCtb7P7Xd5Z4jHrJBhV9tTu8w9hw==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr19975476oti.91.1561982175236; 
 Mon, 01 Jul 2019 04:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-4-andrew.smirnov@gmail.com>
In-Reply-To: <20190416013902.4941-4-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 12:56:04 +0100
Message-ID: <CAFEAcA_=HpkXDriPRvnKRA=XKaK0Vpi8isZH5B8eETVVAr6=mw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 3/5] pci: designware: Update MSI mapping
 unconditionally
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DnUY+M0y0q7Q

On Tue, 16 Apr 2019 at 02:39, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> Expression to calculate update_msi_mapping in code handling writes to
> DESIGNWARE_PCIE_MSI_INTR0_ENABLE is missing an ! operator and should
> be:
>
>     !!root->msi.intr[0].enable ^ !!val;
>
> so that MSI mapping is updated when enabled transitions from either
> "none" -> "any" or "any" -> "none". Since that register shouldn't be
> written to very often, change the code to update MSI mapping
> unconditionally instead of trying to fix the update_msi_mapping logic.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
