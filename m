Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp94742ejb;
        Wed, 31 May 2023 09:50:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7hQQaFr1XoSrHntV2XlszoAKOszBcjGB3D4J1Y/DL99lWcwrREStd1UUpcwE2hRuRcNEXb
X-Received: by 2002:a05:620a:2cc5:b0:75b:23a0:d9d6 with SMTP id tc5-20020a05620a2cc500b0075b23a0d9d6mr5577716qkn.44.1685551821752;
        Wed, 31 May 2023 09:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685551821; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPi5JprevAHneSG/K7JvCBrsyQa3Y8ctuXrDAQ3oASt+dvdnermdWHsen+uK+9St4J
         YSHLymJ+cF2YY9i1QujvVPCdEz7ycqmYbwYUAsc5zidQ0+fOraHFxQcnfofChK4j2irC
         FilGL8eTsaDm++7sv5fIPSDMnmykKViV+MOU53NBrbHkUzkEQN/ZWgAYoAdL78vvTpTS
         uyUzvFSWvcieNKRlf1C850SrmrWWCinH0fmzbXK95mMx/9185bMvejDSLDPVIkqzKM0X
         pL5YfSlO3j2Dov2dzEzZcIl+Fl8Ev9GabRRlRDzWVtXL9irZTMJMPji05SjwA0Xq/qN1
         WvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qeVUxHhJUoMvN//JSF/0qLTCfXgdwXXHdn6/R9WVoAk=;
        b=i3gckv9+KjsyHsugy/CM8vd9jhJK9QTOPsgMNK1+fqUVT8gR9eaVFH4UYjaRm6xgOI
         GdyLRs7FddF5LyuwzweOeDPgYXP9d1JYKFTL7Tsiie/5+33JDtWYG28FofvNlVnP+qph
         BoiEIpp3gmJUb+1aCa5V/3i4XUmS2IP8YDmHEfolwAkCi9iLyl6W21mq2GEyZtQ/d4Pv
         XEuOsRsDUFW4O5X4rYFhOPC7NpVnxPz5ux/QyvWD1AvwBNvb669bEuRYjYP47Hi9Vs1L
         XEBb8r63woRvnkZ7qwx1JNumxEAsqmO2jBQMIR4sYNbG+T7B56TINrtFk2AOfHO6iX0B
         zcFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EiuupOFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a05620a164500b0075785c1637bsi5361045qko.565.2023.05.31.09.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 09:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EiuupOFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4P1e-0004Py-UR; Wed, 31 May 2023 12:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4P1J-0004Hb-NQ
 for qemu-arm@nongnu.org; Wed, 31 May 2023 12:49:59 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4P1I-0001KU-5n
 for qemu-arm@nongnu.org; Wed, 31 May 2023 12:49:57 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2af2c7f2883so65915181fa.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 09:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685551794; x=1688143794;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qeVUxHhJUoMvN//JSF/0qLTCfXgdwXXHdn6/R9WVoAk=;
 b=EiuupOFQKC2aQ/Je8RyRN9OmA6OqAKyfo+FJ92VBYOUt/hETzwVEvAvKRv2kisrUQL
 SqVLr86zEKLX15MuYgyMSonA13zoxQdwLegnM63q0ZdPqQ2v5CxWeer8wQb0W5MbOL7O
 79rqnZJv0zW+9Di+Jii6+i1/JlD8Gg2wuWgEFkqJDJTiJevI3eXcBLlvMT8O9xIDDYSv
 qIyt/EPQ9ERmAbv9QnIRrwGF1NgGM6x3Qc8cMpmZkfEQ+APleKlYpMFWEEUZYkAfn8fz
 pjdoH47+Q9WgWhkbIezasXDiNqUGHMFrRwQAK9qQXSkI6l7/AK+MN7aOTc/AJc0KB+vL
 YAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685551794; x=1688143794;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qeVUxHhJUoMvN//JSF/0qLTCfXgdwXXHdn6/R9WVoAk=;
 b=CETSpeH/RXOYs6ueTPk8XgkGTgcokZiCoPzZlFB2jkbOLblZ902VHo/udHubI8zFQg
 j5VlgDg5HSZiviFJwFw3nYLBzPE/Egim/QTFrqW2eGFJTCAWo0Fug/udAlpqy71yasns
 yVj5cQqvbVu9536T7X9Pfj7X4LrYRmNjtpqhPH702dNmGpiFWr7a6fSp0MZmm4pbUcye
 cbvmlC/uqEeFepTF3tn7F0WJIyUQigKztyik0Cx22izxvGvOuC/c+1k77mZUioTE/Ttx
 3RDyB4zrXSYMVocF1IMBQJFWx5Igul4FNXl8zr7XSwMviNzXDMp7RSkcB3UmNx5Njk4a
 Ozjg==
X-Gm-Message-State: AC+VfDwQlb8issTpL4jIoPJBc8FJDXYXNn92yv4OLh2dk1q81EG7X8u5
 7v/NhGmP3QP4Qr6gWpj//5rZQHNRVlPe88LJCwQ5PQ==
X-Received: by 2002:a2e:9614:0:b0:2b0:626e:e90 with SMTP id
 v20-20020a2e9614000000b002b0626e0e90mr2932525ljh.36.1685551794212; Wed, 31
 May 2023 09:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230524191438.172019-1-sergey.kambalin@auriga.com>
 <CAFEAcA_PH8yAT28s3p7_0rqK9NodJ6gTXxv63J+98XoMQ_nJTg@mail.gmail.com>
 <15c444063e114814807551c36ea3389b@auriga.com>
 <29192acf-0876-e14e-1331-45260cb179c3@linaro.org>
 <49b0ba578bfb45f1be23f7608845d823@auriga.com>
In-Reply-To: <49b0ba578bfb45f1be23f7608845d823@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 May 2023 17:49:23 +0100
Message-ID: <CAFEAcA9NkQ_nTEaxiFfKHpV_Td7TQrPc50ysd8g-u=0m7J9Smw@mail.gmail.com>
Subject: Re: [PATCH] Prepare bcm properties for videocore 4
To: "Kambalin, Sergey" <sergey.kambalin@auriga.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hDucoT2bCaIR

On Wed, 31 May 2023 at 16:47, Kambalin, Sergey
<sergey.kambalin@auriga.com> wrote:
>
> Hello!
>
> Thank you guys for clarifications!
>
>
> > Are the VC4 properties supposed to be present on
> > all our existing raspi models? (i.e. is this a bug
> > fix for our existing models rather than stuff we only
> > want on the new raspi4b?)
>
>
> Yes, they're needed to support RPI4 work. And I think cannot be considered as a bug fix.
>
> So I'm going to send one patch to replace the magic values with named constants.
>
> And then I'm going to spend some time to slice the entire rpi4 machine to series of small patches.
>
> Am I understand it right that each patch in the set must pass all the tests?

Yes, that's right -- every patch has to compile and pass
'make check'. The usual way to arrange this is "put the new
tests last".

thanks
-- PMM
