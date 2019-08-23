Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp876302wrs;
        Fri, 23 Aug 2019 10:55:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3IlujARx4HRT5spyZyeWclgizzq0WbwA4+eR7b8CftIK1SA/dVq33bk2wfVnL5ma5tp+L
X-Received: by 2002:ac8:355d:: with SMTP id z29mr6029937qtb.366.1566582902918;
        Fri, 23 Aug 2019 10:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566582902; cv=none;
        d=google.com; s=arc-20160816;
        b=cauShN8/+hp1O/wAL9JdFp1AN4JLeRkrM0EgZNXrc7JdmlTM8GtFLuUwwLiVcMeqZH
         1E8R3GZi0XnASAWdQP5LzaDNkyVmBz/F0fVTBFkoVOFhvCBIkJlSYhdvzt7UhNfRaoCQ
         BAW2d6wEpgb/At4CYPcoNP9hMjHnqNJ9Zl7yF3D4RuauDUimrGO4uXBFI4m8eMSxASUt
         05rws29Gc2Kt9ub0p7QYok+J1qJiRJtV7Mgi0eZiWp7u0JcyVWPGXm/eyisKAl93exrg
         StOPXOaGmbCK7QcgyteMk4721eonk13c8jzLKjyI/ioLyZjVBC+pVwNYE3q0CH/+EXe7
         l+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTWQI2/bTW6uLdG6CZCLdY+s1uv1OxHm3gcyhTKtWs4=;
        b=Lr2uATPc2D88tZgmHseWv4lZMfhR3gvTfXH0JAcOkHKpdNYAKINi1GIwMP2Re+2y3t
         0L1TY6q3zQ7K0yKWEVh0yZ1QbdS5gghC+DbaBGWtuhufEmsJbRyrirQzkMrJLoW9T0pg
         UgUP58E8bEXJH0IARuSFvw3JPROp+DNv5fyVq9m2nuj8Crt8bisF3su4eLPvk5W05YNw
         tmVZYy9DtjBJvIsf6lDMsx17jT//iK1cFo+//L2tn6BoFM9zCNf/4KlMlvzMvU25bMll
         5SwvPHsN0xLLfC2XB6u8c4K3jzbW90jN/e/EkigDW5HchOa0d68a5iq/isacRhc5fvsl
         8fRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uvSPmK5c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k56si2774102qta.210.2019.08.23.10.55.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:55:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uvSPmK5c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DmA-00080L-Bw
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Dkr-0006uq-L1
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Dkq-0006rR-L5
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:53:41 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1Dkq-0006qm-Fc
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:53:40 -0400
Received: by mail-oi1-x244.google.com with SMTP id g128so7673954oib.1
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VTWQI2/bTW6uLdG6CZCLdY+s1uv1OxHm3gcyhTKtWs4=;
 b=uvSPmK5caUX6vLpGTGTPnGGpW/y6UKNkD91CweaIae7ph1Gd5Cf5vppP2bDEWnR4kp
 5028Vbxd+tmuF5GZWDwgoh0YJhcdJbmhTHVTNDyDUAU78EQmU3KUi9gDDZfT5fYKFDYh
 s559BBA2+lDuPwWbl7MgBnxd3CQMEOsQtIhee3B/BOTwHxKJQsPRhTmC37rT1sMx2VXn
 EB5gsjlB7pfUmagz4iNir4tFGc56xHry3QIuTvAVrVHQd4lJd8URPL4mumtRUxgxFVEZ
 GQYbZI84Vt3MHK4i3h8riOqKH68h78e8CxwxqSlR/H+mfjBHFZyUQJZpYNoh1lrvj84U
 UwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VTWQI2/bTW6uLdG6CZCLdY+s1uv1OxHm3gcyhTKtWs4=;
 b=YNxLrnwn/xVvG0pvPeloq2r8VXOUFSxBAVzjs2LkEH13RMM/s8e30q2kc7bS0EEVjw
 QaMyYUA6G+nvEoIRMuSfcAyjZH+oo95jrMzYVIVGUsNThDPpgzVWAeueawBQl+rIJ70i
 VNL0DtYz7h3NrhKgXUhTPoHqfKcRzPf0w5Yh7C7RjwgfOotrCxU5CWTscsnhWG2P7PPK
 dK5XuS3Y2XfT+K9JZXLhAJGaS57Fgh/wEQQXeZdE2HRGJqsWio6MSRARFqENpIVy9KTe
 CA25tUUdr1ZM2xIPBEfGct+zX9Cg5uTCPHy7h8ZvBNRawJRJ6cLasIc5D13AuxWk9cvZ
 DOew==
X-Gm-Message-State: APjAAAUE6yj1hGHmVULP+QDANYKTaGd2ngsi39hei94IGjlUkVESfMiL
 ktgtuBEwtjQLRw3lAzAG6k7Te/uZGme3gqzIzo0fnA==
X-Received: by 2002:aca:4b86:: with SMTP id y128mr4033788oia.163.1566582819479; 
 Fri, 23 Aug 2019 10:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-32-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:53:28 +0100
Message-ID: <CAFEAcA-Fbey3iz8Vev-hjRxmv0W61h+82BoVQfoo4k0gZikuMA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 31/68] target/arm: Convert B, BL,
 BLX (immediate)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y+e9e3aJHiLf

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c       | 133 +++++++++++++++--------------------
>  target/arm/a32-uncond.decode |   8 +++
>  target/arm/a32.decode        |   8 +++
>  target/arm/t32.decode        |  81 ++++++++++++---------
>  4 files changed, 123 insertions(+), 107 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
