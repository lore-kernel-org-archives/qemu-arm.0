Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3646519ejx;
        Tue, 15 Nov 2022 06:04:34 -0800 (PST)
X-Received: by 2002:a17:903:2789:b0:179:c436:4528 with SMTP id jw9-20020a170903278900b00179c4364528mr4253851plb.102.1668521074704;
        Tue, 15 Nov 2022 06:04:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668521074; cv=none;
        d=google.com; s=arc-20160816;
        b=ivutcl7NmSXZ0UDiHiI3Q7DUSpG3yABGtL8q0LVfv1hV46HzTyHHyamg/l6vPXMCYs
         cHnCUjNJU4unDcN5FdhFSprqYyQElxdQSg21q5m83d4Jnem1MkiJjiLtM2Z0/usRS07K
         Ny+PrntgywJdp779PTeRM1aRHJYZ9YNkUR9A7pXhngHMj970nXbax0REKfjq+w6PLo/J
         FSzxCG9GEsb1GbfaU/uEIZJpsDn08AvvEFraaMNms3gEQnEVWEGCZub6ZCgAoAF3E0h6
         x6Ajc0XhA3lGDcCWSgXZmkUl6g7cMaUv5tewxeqmpcOy7pWTKiPNHheToelS7ZoM/eMv
         B9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4vw0jWL1UY59JxLi28pCqqiElu56mQCm09t30sAn/ZM=;
        b=MaySCJUk5EwF884TBcFF+we3dM53Mc/HBvL86wWiZpVL9aRFBP0dcuTvgKmCs96bMO
         LuihrAbyMgB8p/H7Xh+DJgGRDqlHo88CzJuoWwzwpzThC9ed3SIi8fEVUSLoXehC6UMZ
         /SZP9amIQmHFwnKeQMCaXXeeXl/bhk0pOtl/1f88og1UHurBSlsUD6nMvE58rtCk+tU1
         tHgFkDIEjzFuA90h/+dFcv5AjfcKHf6dUutDBOz2z3EBHx/1pkfHuJnV044NMUplH/DM
         lHD7iC+nu7BblXd8dYtGiFUW8+w3ViOmCZqsHue7244RCOe1TM1eq4HYPVx8zHpBIRFc
         KLfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrsNf4dF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 12-20020a630d4c000000b004703a3950c9sor3057490pgn.70.2022.11.15.06.04.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Nov 2022 06:04:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrsNf4dF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vw0jWL1UY59JxLi28pCqqiElu56mQCm09t30sAn/ZM=;
        b=SrsNf4dFX4YGdqrq2RTAgzGZ44zQ/EJ6DU2J55sykOHfm25zOUUG/tlH+bJtxCpaYY
         TToC++quRtrCPuIOmT00/iZex40eiqrjm3USxtgtK3O3Byn+tcCMjCTOJvro+ssOVMzT
         83ebh/Y/fDxFoFoYw3/GUNvL2jfP4+pG1WlmADVHM3TQdw9lQjDMtrY6qhHvmG8RpOQw
         CK5S6gPTBA9c1al8NXqQCT0ObkdYOVoQqob+WVUrOkzHWcvdmCpQy5mfqYvCGwlTDGxM
         fgjHoXZ+j5X7C9B4l8ttXymEITW6IfNalGfX8EHdWj5sAjS++hDloN9yrb6bvgIi2HnE
         kleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vw0jWL1UY59JxLi28pCqqiElu56mQCm09t30sAn/ZM=;
        b=Nl6ktYZdgtuEP/9kkSoQdICxYkqpC7Tt9HJA94G+HP67FObUwrJEQftEvsch6++1hs
         liUVLHpl61S4PTfaKQrqCPjWdlvKsoEotCVMuKQvBWczimP9orHXsjEhVL5WIPU3jfN+
         DidIiP5O6p+3YfdFiizNFUA9RlflVPDV8mhzwwEzBffLuz+/g+jACbigMdOiPKEKboBX
         BypoIIvJHvzrIwUvUCtUcFHJu+3T7T+9smx4XmadugPqNXh2Z5lanruPvOxcTJ9oJ858
         qdkuJNOvczhM/NoJcKtmQl96YSrAOC/mS6v5Xovi4/XatgD/FdY19zC9qNI7LoH/qCcs
         4GLg==
X-Gm-Message-State: ANoB5pkZQ+mcWza83vSCvBq0WuOV3bkYzgOjqRg/MFLlA3OzhTtb2m7S
	ob/ZD01mko/ORtJxx8N3T8ucy/TaAA0aacMZ/KEjJH8C7ONTIQ==
X-Google-Smtp-Source: AA0mqf65/14kGha/JvK4McwqbI9jQsfD+IZCEq9Y5FPrN98q/JBkZCdQ/Vr6zOYSjGp8TF5O7Ug/ytpbv/Di9odUE7U=
X-Received: by 2002:a63:1665:0:b0:426:9c23:9f94 with SMTP id
 37-20020a631665000000b004269c239f94mr15986791pgw.105.1668521074287; Tue, 15
 Nov 2022 06:04:34 -0800 (PST)
MIME-Version: 1.0
References: <20221115134048.2352715-1-alex.bennee@linaro.org> <20221115134048.2352715-3-alex.bennee@linaro.org>
In-Reply-To: <20221115134048.2352715-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 14:04:22 +0000
Message-ID: <CAFEAcA-fehcRRAEO2ukN5bcgZKqbXxOWrGn8-8Ez=Wwxy9VndA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WiqxwXLsA2MU

On Tue, 15 Nov 2022 at 13:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
> this for the CPU interface register. The fact we don't implement it
> shows up when running Xen with -d guest_error which is definitely
> wrong because the guest is perfectly entitled to read it.
>
> Lightly re-factor this region of registers and also add a comment to
> the function in case anyway was under the illusion we only return
> bytes from a function called readb.

This bit of the commit message hasn't been updated since v1 :-)

-- PMM
