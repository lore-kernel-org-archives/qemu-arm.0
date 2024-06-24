Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp488310njc;
        Mon, 24 Jun 2024 10:37:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURT0lRThvw1fq4pxNHWDtm+GwHFXOvPtVvEfEizwGpZCzSQDdUAciB7HHLrfJkKRaXgmpVtAzMLCcyUzZdfBFDM+wm33Gs
X-Google-Smtp-Source: AGHT+IGV4hh+f9EggrrRdx5zq3AKejpwjFPZev6VzkpTAfOu6Smok7SZx1f5Eh/sbTu32xkywKM3
X-Received: by 2002:a67:f4d3:0:b0:48f:49f0:194f with SMTP id ada2fe7eead31-48f68ffb0aemr1220521137.8.1719250643315;
        Mon, 24 Jun 2024 10:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719250643; cv=none;
        d=google.com; s=arc-20160816;
        b=VpX/1DEEysEijpzEPR2LhvOW03w0OU98CNvjALMWCUGDwVX1V9OkioJY4ThURm82dT
         ikFFl0ewThE3bknBVL8eNs0tFh2Hod5t3qul8jkog58gfDgsBNa/GtQyHnxGBgIwtcih
         gKZ3qXLhBUQr2ND9UqAsYCu07B3gPViwmu4Cp38NlVmpfGDhr6h858KOjp29loing/oz
         s7O/Xk5KU+jiZYSQMg6AhzvM/EWCnHonyAakdSlrsflTPMKtaBIkOzyOBb3bfPOfwGRB
         2ayIQaGSu4kslF7RjTLm2O3p9J7m7BZDyrh655i/F/ohHw9//lfw66Qaw9L0YT6r7rro
         /P6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6IzOjt0t41WcaxP7cLu3545DN9yYiEI3hqF9omzqUzU=;
        fh=dJ7PGuUUgwbXf2W/64wf6wAGRc22v021PFjfSBQMm7U=;
        b=SIZAlAIMoWmPNpLdc+ry8HBlJAE9ln5lRCYQoZw6KjsMDNfKxgUBimSN6y3CWfPpJo
         14nGvyERj57AzyDv9XpN59F8dLXiiF1luz5XgT+Ljv/UpYpcyt2C8AnmRwWMTOWhHTml
         O/J4V89GgKR4o6AeS8dTu0/iJG3zjZk4TJKpchFYkROV9Ep9Aq7jG1olXbbTwLnNdKYZ
         9E3GkA/egvENFkPXfuDQJ/QL1sfbB2v6IZsgaYbb9/hAiyV7yglT5KViUG2+t2qxb5/r
         iub3Blw2cn/RMJTAhU0nA1ZuitpzXuwCdBUev2uB30bkqHLvjvUwGWttdUIz7rqwSdFG
         eWQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="MVXRDH/Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48f4211964fsi1000467137.706.2024.06.24.10.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 10:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="MVXRDH/Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLncd-00059C-Lf; Mon, 24 Jun 2024 13:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1sLncY-00058O-FH; Mon, 24 Jun 2024 13:36:51 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1sLncT-0008Gf-Cl; Mon, 24 Jun 2024 13:36:50 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6f8ffe1b65dso2109920a34.0; 
 Mon, 24 Jun 2024 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719250604; x=1719855404; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IzOjt0t41WcaxP7cLu3545DN9yYiEI3hqF9omzqUzU=;
 b=MVXRDH/QA1ZJPf/PT7cYyS+vHhAYmktk4K9m0sqksrJQQp2HUXq6Wqx8iyJQHp6CKV
 SWVzpJ1RVVdItJ7iLXPTHX3XbUMNyY0qF3IFT6iiJqrTAI6A2n2KwL9QLk7q4+ZbbDtU
 IADtpSgMF9e8mL48ixUV41oG8MjV2buDvH1Ze/VeWIoz9QSGet/wkVK93LQ0JpHysykw
 hAtlFvl376N4AeZ0BhjSNcBckg3xs90vdFb4ZC5/F6P9NHFHvL+nf5kgl+4CGS+gQCld
 BlB0QAI3GXuxX2jpK5SLgSHAkYOJ5REIrDr5UJMLUvOAoBxVB4htvDTyjuzqNFnoDQo4
 VHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719250604; x=1719855404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6IzOjt0t41WcaxP7cLu3545DN9yYiEI3hqF9omzqUzU=;
 b=mgY3AvTaipPmj0jx/NdL0Uyy59rtLtxS9aAgFn6ITgCyDSQrhlVP6Pl+nWPtIT7kfa
 7ZWy5Ty6a0KZNm3eJ5JDKsA4mXAwpllORS0GlC5SgcZ9QAr2Xw7GI/ueBr0LzwOnOt2e
 lqxJwi2+MJ/5ErfKYhom/aavS1A2FFHd4aKX540s8cxNaEomTOd/4vfOJwlAW2X0v/pE
 bGorbZmoTo6+Ll+nDxVOhEXs1gdylWJMPA9vQAiXfT8KqhlB0APbNt2GK/PgiRWA3HZC
 jblEwBccxN4qzGGOUTZwQfEAXJ8Ae1VniCmnIz77xDEcT2KN1XudFoVdmAMmPyUaJ4g1
 gzqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9sKHAogaf3OgsMVIUxp745KRHgF1WGly+46+6ymlxQ/nflWL3V8qt8icTUIJmSLHzNAxC+e+78E9DkYyhdsVw0cfD
X-Gm-Message-State: AOJu0YyaSMU+1B8EGgGqkYVMymLEOKS3Lj/u7aG0xZn7DTWLFYkhbLQD
 YnnUtoV4UXG8ZTBQlq8pip77us7GEWIMHFeVFVMFNuWE+yySDZUDhf3t55SeR05uWWMEc+v18vv
 TSWsIuX+lw7r6NO94N+yirPO4YzI=
X-Received: by 2002:a05:6830:16c8:b0:6fb:ab18:c3b3 with SMTP id
 46e09a7af769-700c392a133mr515751a34.11.1719250603602; Mon, 24 Jun 2024
 10:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240519094106.2142896-1-rayhan.faizel@gmail.com>
 <CAFEAcA_zBhe+HxOqtAzWSCbzApEhknr+NeheA1uLj641EXMM5w@mail.gmail.com>
 <CAKUh+QfrT3SjxHA0Y5fERwnTnqKKbJg9SFb=5J5pfbci0asjLQ@mail.gmail.com>
 <CAFEAcA82+-=piy0skykKk7pSKU58FmXqiv2hTWv8-sXDB_qEmw@mail.gmail.com>
In-Reply-To: <CAFEAcA82+-=piy0skykKk7pSKU58FmXqiv2hTWv8-sXDB_qEmw@mail.gmail.com>
From: Rayhan Faizel <rayhan.faizel@gmail.com>
Date: Mon, 24 Jun 2024 23:06:32 +0530
Message-ID: <CAKUh+Qe4tvg+pDqODc+wdzXPpB_FN6EQO1EvQq_5Q1FawuZdNg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Initial support for One-Time Programmable Memory
 (OTP) in BCM2835
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m8Q1k2kHXYcX

No worries, and thanks!

On Mon, Jun 24, 2024 at 3:52=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Mon, 24 Jun 2024 at 10:12, Rayhan Faizel <rayhan.faizel@gmail.com> wro=
te:
> >
> > Hi,
> >
> > The patch series is still not merged.
>
> Oops, sorry about that -- not sure how it got lost. I have
> applied it to target-arm.next for real this time...
>
> -- PMM



--=20
Rayhan Faizel
