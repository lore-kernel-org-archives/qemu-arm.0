Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3794299ejx;
        Tue, 15 Nov 2022 09:10:20 -0800 (PST)
X-Received: by 2002:a17:902:6a82:b0:180:e685:2db5 with SMTP id n2-20020a1709026a8200b00180e6852db5mr4995273plk.112.1668532220373;
        Tue, 15 Nov 2022 09:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668532220; cv=none;
        d=google.com; s=arc-20160816;
        b=h0SMYeLUv7PRbeXsLc6KE3PL8lqjlK6WT9SV1qxJsrWHaSY13dQPAklRFo37sRjXy6
         21sOcu+MbIjlYVHVfOOn8RVD8pxth/niHJAWCcpbHzm9X5UISXuUYDgCn9KJJfv8gYMi
         0/KNw7h78/kNcufPun4ZkCoxMhDHV7iwjJg3PepV3hrB1e27YMz8Cw7s9nRTK43n9l/C
         TyY4IRu5XLqOHZET8gsqxl8iBOjw9d52TuLsIglwSUyeYE5VY8Iz0pI5Vj6sV81YuiLW
         OdMXmQ2KqrdTRLkyREt1mAFYfRdK4nKl8DcMHKQOtZcfoPeqKkFk2WJ84Ek9eg969li3
         vxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OwHe2ohijQZ8rCnNbznkizKr7Ph/UqFQzGAowq/nMA0=;
        b=lpNOLHPofG8n8NmCIQynPZuGz91LbfQVNr7QdBhbxkLoTiu0gzi6aEd5G8yevCx/M3
         +2nRgQAqz8x8bL2g1iGV1FgRx75bnSqmVFNZjO8hxdgQqHeuATRp2p3occnRU6pzDTmc
         RgEVWBvKbVO7zEDNiYu/JZcxhpHXes5FLe7rWFVaWdBVySukhOjB1xYpGI0B6zCBvTvu
         zska6HgYppqWU8xGtUPz8yfwatbAnnzgShvJzMx8ZJ1+uSDee/4xlyIo/UXgG2XPcHRj
         T/JvLHZ27hnwyFYVEeSFtzoruZFOxp2yte0uJSe0rSrIF0GQxdO6Biixco4tWXiItinX
         6aWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kxzDPckD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bd4-20020a170902830400b0018199308aa5sor5157069plb.186.2022.11.15.09.10.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Nov 2022 09:10:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kxzDPckD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwHe2ohijQZ8rCnNbznkizKr7Ph/UqFQzGAowq/nMA0=;
        b=kxzDPckDRm4ObVe05GpphB95GXf4v3fwVouEwmEj37MiLPhP+fhKrGEGMbF9clU8Bk
         ma17M9cl40SuhtmZFfcbKi25gMd4dq/HKDooWDqcMkj/2V8+7bB0ekDBB3yKYhEx2AOJ
         BthSMmv0kBZy7SLpEcKS/J76g8Qw+czyz+qSbkOxx5tfrjSVaowL7AqGMZ7gs/wlXHqW
         +Z6p5ubJiHXOb7s3fnS58EvZPbm9+w/axvjoJR8Iqs9gPt3cJorChKSvyoCWpcTxQvCs
         +Em9CQlzvzx/bTbr/Aqlj8ApGVFfHz44XqOONrPx4ewDjRTBY85aP6HpZA0+2zIg/kym
         8PUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwHe2ohijQZ8rCnNbznkizKr7Ph/UqFQzGAowq/nMA0=;
        b=VHlMmf/IU+IwtAiHzC289mcUhRapr7DfzrSwwzvPNhnnCOsZM4gRxPAUbHsQ9wFccT
         108i9CQOOe319h0C6z7nMssL6XdIPvFqdj13nTuo3g7mqvhwi/xxwDWFgvXej1LY2GLw
         pgZQxaFirvPLNbuRXxCSPmWNNytNFXIsMAPmn3tS7cTP8cAaS8ePxqWxfuBWxE7fVLuj
         uqAA1imIb0FZflyL6gcb+SyKkd1FO7jx5pt84mGjLKMv+cKZceswi/YnBisuNqpNhelK
         C8oOMp9MadVKRUEXLRMoWF4NJUJWxk1WCmlYR8BHFowB+EDJ2fKgecEEyDUaG129PQWq
         wTRQ==
X-Gm-Message-State: ANoB5pk/nkwjBr5n1i0u1ERSEXkdChAoi3R209Fu2tOjlgSfoTLlZUq9
	9kmsCDZJa6MX3WHg/pKsT+lP/qGXNJc1GbMqfzVTfbdiBYuHJA==
X-Google-Smtp-Source: AA0mqf7a2ztZDz9fE55D9Ijxe4pH+PCaGGDgFGRjn+CQvkGeVSdlcwBypxnHXwjmmmefEuhfMZCqQBTBUznjAbtM7XA=
X-Received: by 2002:a17:902:9303:b0:188:5240:50ec with SMTP id
 bc3-20020a170902930300b00188524050ecmr4882155plb.168.1668532219946; Tue, 15
 Nov 2022 09:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
In-Reply-To: <20221115161736.2425584-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 17:10:08 +0000
Message-ID: <CAFEAcA9dY-1iCqF3f9ME8dqGEY3o=JFVPOc-zsQcWOMnKezgdQ@mail.gmail.com>
Subject: Re: [PATCH for 7.2? v2 0/2] Arm GICv2 fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: MHmvW2n+88+9

On Tue, 15 Nov 2022 at 16:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Hi Peter,
>
> These are the 2 GICv2 patches as you suggested in the last review -
> this time with an updated commit message for the second patch. I don't
> know if they qualify for 7.2 but here they are if you want them.
>
> Alex Benn=C3=A9e (2):
>   hw/intc: clean-up access to GIC multi-byte registers
>   hw/intc: add implementation of GICD_IIDR to Arm GIC


Applied to target-arm.next, thanks.

-- PMM
