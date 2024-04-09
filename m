Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1921148ejh;
        Tue, 9 Apr 2024 06:56:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIyB/W/WvGv19QkI4bgN4RVYZ871ptdYv7xi7mZDybGGT1F6j40EgaYLTfo6xVXJWc+THivKurhWyBYaayk0MNGHQ1KuEF
X-Google-Smtp-Source: AGHT+IE/bMC1AeNo60RNmsD9AMCgXShK4e8IySqsN3dOJy9QrD91Rxcwg/tB/Y4TgdkTOU4dZlDI
X-Received: by 2002:a05:622a:15ca:b0:434:66fe:f4ff with SMTP id d10-20020a05622a15ca00b0043466fef4ffmr13143380qty.49.1712670994378;
        Tue, 09 Apr 2024 06:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712670994; cv=none;
        d=google.com; s=arc-20160816;
        b=AKKOIEoa8SHZmNllvkU9Wluuz1F/5HmWRmX6ZxXgaPT5XKkoReDotY4yZdIY0T2iJ4
         QjZdFnegcLE3kgfISwDo4WLMissuvCr4TkwNiEnK2hsqCMhghji6qU5aHwuf7UqPZZuc
         uDLhRANFFgewNjapWxjq1SM+ffTodMBUgtgzEHMGJsxG9C35+5xI0GV1E8mtGsCVUObO
         0Bm5nMOWOtRoq52pQ9dJpvTr0zwuLospGOh5BFlSf+yicT4jbYFeejCWtuuh1thJ+2id
         O2Js8djJlLGXw41eqbAr6AYeFa5eoONg5qDVKCdmTCrNpS/wYqNgnxfdwaZvPmePkZVU
         Qy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cHPCBsDcTz30tRDtJBIJn02BAhV6REqcdmkmIsHcGYs=;
        fh=gWFThC93PQt0bBIlQtp0lshfwS8Ms20R5x7I9TMeBqA=;
        b=thw6hc9mnbY5QesRGV6y9HoCjdPXbQYgC95pDE0qDRQ4zagu8sBlctcnWeA/dhJ9mt
         +KITKj6cEqcx6YHFp8aVsrEI3sotoxtG2msPKfTMuCsqqczPclX703exP9OKcc4ic8e2
         1Lbz31EIfWEqcCSMgc1wq8wzavVXtWJ4Zb+14R/NQIAOruGy1DSgBTcdh1GwZyqzYMbS
         nwnVlPLUXZoWfTxb1L6tP62iEH7psXt+RLcClt4Mvq0DNNMhI/9YqbhLt/lPy8UHkTuV
         x1QaES05Wd8vViNtvgHNWmlQuh2YkXyo5GQJtBc+jIkgArcnzPgFx/P8uebNM/TLyWx+
         toQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g1/rDMBg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020ac87dd1000000b00434ca1c4552si2256830qte.713.2024.04.09.06.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g1/rDMBg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruBxI-0004ma-V8; Tue, 09 Apr 2024 09:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruBxH-0004kd-4A
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:56:07 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruBxD-0003ra-BJ
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:56:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e6acb39d4so2230950a12.1
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712670961; x=1713275761; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHPCBsDcTz30tRDtJBIJn02BAhV6REqcdmkmIsHcGYs=;
 b=g1/rDMBge4N6l/hVpPNoOky2Mv2AN6G0DzMasvmXdbAOHL0obstFqoRjLXDgUQAjQ2
 pD/8BVPzhdA5bIGGfhQmNWT5xAXGUQ2SmGVXNdXJ8QAsOvImNLHGtd7kqH2cJMgAEztJ
 6WrVfK4j7h1lSRzlW4PDgQeowBM9e5IlWw0SB0/TKMSqJbLiEFaqhi3/1CngoYqG4+xb
 e+wY0eWN5ncHjV/3xOmBpstKLLEnFeUWeAUnDidw1C1Wxakm/iFlYAPQYX2jt3m5dBWl
 Fmls5e2QZDRJyd14R9xnzLs3ACvDK/oVW4rEdvfa2GMpSDbfECqJzZ8EN3SlWGBD1Jeo
 lKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670961; x=1713275761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cHPCBsDcTz30tRDtJBIJn02BAhV6REqcdmkmIsHcGYs=;
 b=Tz8SUxuX5pUZXbru7Fmp5FFWYF93ZkrwX8LrwbsE1I/NbKRHxBkNslqmahArDLfi6b
 3MTkkHGYSaf1gvUAZIE3bu6N8FFuIbZCaW5/VKTmoHntW5I7vAXksZc/+fZ/eLudC/Av
 TY/qjVrkl/BgltLErUKoqdYI/FCeT8ULI+o6PeSaKruurn7HWeElJgVM2VXbI8dX0247
 GfteFwJh/iGeqZmQXaNdUA3J+J4T3s4LkDthj7qMQwsVMCGQcLuI7AdiObit3zsydcLR
 EQAZr607x2K3XJti+yKQ3oxaffSN59fyqoOm08FvXjBMlflfQiD0NtfCd0SmNjC21XM+
 JMhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7uW4KAMMhGOhO3a06CncJXfmG02wSvM2S+YXkiFEXTI15eGQrzDw4iU2AWlWH6jKPXncfyyO46vT+YzkAVghdGfNL
X-Gm-Message-State: AOJu0YyZ/fFyD+UsvcjO8h5y52TrhLmrkqhWee0GX5Fodtvux677WmSA
 /ycNB9RMOC/OzZC7qvMztUrx1dafJGqrUSOMETqm44HHcFyG1gekfq58lRvYNHz1/KIV4Kv9reM
 1+s1rgX6E9VZ0gCYRwGx8Y1emV070lyxwOmXzrQ==
X-Received: by 2002:a50:c016:0:b0:56e:de1:f427 with SMTP id
 r22-20020a50c016000000b0056e0de1f427mr7869546edb.25.1712670961247; Tue, 09
 Apr 2024 06:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240409133801.23503-1-philmd@linaro.org>
 <20240409133801.23503-8-philmd@linaro.org>
In-Reply-To: <20240409133801.23503-8-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2024 14:55:50 +0100
Message-ID: <CAFEAcA-qas2Qb1d6mZtWfrYFeXrcOE6rwsYMOHdQYF_Zr-yzqQ@mail.gmail.com>
Subject: Re: [PATCH-for-9.1 v2 07/11] hw/net/lan9118: Rename tx_fifo_size ->
 tx_fifo_bytes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Chuhong Yuan <hslester96@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SlxsO110XQym

On Tue, 9 Apr 2024 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> tx_fifo_size is a byte count, rename it to avoid confusion.

But we don't consistently use it as a byte count.
In tx_fifo_push():

    if (s->txp->fifo_used =3D=3D s->tx_fifo_size) {
        s->int_sts |=3D TDFO_INT;
        return;
    }

where fifo_used is incremented for every word handled by the
tx_fifo, not for every byte.

thanks
-- PMM
