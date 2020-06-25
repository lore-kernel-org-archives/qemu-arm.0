Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1079561lfm;
        Thu, 25 Jun 2020 01:46:12 -0700 (PDT)
X-Received: by 2002:aca:df04:: with SMTP id w4mr1309958oig.27.1593074772190;
        Thu, 25 Jun 2020 01:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593074772; cv=none;
        d=google.com; s=arc-20160816;
        b=qUsIcA1sH1C5nlWtMHYLf87sGwgsN7Pj1Q3suun2WzNddZTkLX5f75yXi7muOx7PKI
         1mhQbQOur3TLtLezhVBWdChtjGRXDdl+in7FbQztZKQel42pBM+5Fi7OJg+MTYzMLq8V
         Nfpw4bCGa0s2sHUd9IvBus64U45sYZ4IQ/CjzicYU4UUtUJFC1RWmlBqa2NzCqoeAGRQ
         tEjsKQhI+Ub4cyGDg5Fm/QejFFGE96tcJJo2cAD2e1+uR3U5RseK313jvCC+iJojFyFv
         /rb/y+PJAz8lnT5xx5U8JMJnhgOmd8pbHgVDcB73Tc3Vr9v0Avm+6cC5ETSAH413PACt
         wKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ms+2a8flYirElfd/qv/br15GSDM4Vowsz6z6M8SOmHE=;
        b=PUn95AHrOnsMVt49Pds1x55m6zmTgrQNagoRVJmMDTD7rMTWH+K7gtOhDDqMVIs29n
         zyUPTr3Z9PqH2uDbpdV/LSQsqb0ei+c52WYXyRf9emMqjXe1rhiW4I72NdB5/Q8XVo9U
         RMd7hhmyM+JQnA8Pf+m+J8AUhSDx3oC7SwZnrqjv0snwMHFilt1XddlnVrJkFr2rVuws
         EC6wyO1mVeAXlrbOXKoPZ3G+RmHQ+/eH+ZaZw6xcpd3OnfKqePpf3ph1XK3whyhk0KMK
         BHDkqIROzlPf3fN0sRkiZSO8GjH/Z9xHkGkbWmMhi1Jm4Rssfqg5GoSy90+nOH9pcM92
         TxVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTENfk9a;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j10sor951495oou.18.2020.06.25.01.46.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 Jun 2020 01:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTENfk9a;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ms+2a8flYirElfd/qv/br15GSDM4Vowsz6z6M8SOmHE=;
        b=bTENfk9acMP46R6m430uY3AoErPpeQbuNzL0gVIZhHMP2rRhEvJ0WcEZRbUbpxJYNm
         /oXX78TrV36tiRrNyiwSmypUvUVpjXAJZ6LhsEcBADxbC8pPaM1kz/ZlDUKNOeEKbXy4
         jgCpCfb1zEtRfaQKG95F9RT0DRnh2Ji5P5fKE2tkHFsKMohbWMt/JsHc+6N+5lvERHAd
         Uw4VwP56+6s2le/sMC7iKIwsS8v3a1JkPxcnUGS3onkvZX7c2nw13RuwD2WRtU3+8K76
         w9TqrjqJTWKERvYZ3nYtdCiiWPb8JzT8FoNgF0PNjK0l84PSTM3JA4tQvtZmVf8wSVeg
         CfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ms+2a8flYirElfd/qv/br15GSDM4Vowsz6z6M8SOmHE=;
        b=uMAokY9U+uL3Q3eYhhvTgk5WVogSon5s5icsmPRd5epG18n+hrHjUqyX2RHeAX6OVQ
         WPxcq8o8oVafffCIOTM/JCEEHe6uJjuAI/rkZnw3yzWl7/bLNDlLLFXQGryhovieadLX
         YwQHqVP6H0SJRvS9/YfIpKOUqw/W2TPvkUcPKN4WqOUto9aHQJ2838V6RN53HRfsCyD8
         RBYBGpL/s6lx2dbY8KUBbzxkvJiHdxzwt7rvClTGPp+9tkUEL3emqwwNj0ynJ1DfLfhX
         Xn8tBMX9NLoS3jv3cH/RyFrB5cIp8VZAqmUgUQrlePVJ6gxkNMqxyEEFwIsuGpqGBbWZ
         IQDw==
X-Gm-Message-State: AOAM53021jENw8ao8bfFZ0zKpxotJkDTJdEGWqgvXDASvuYlZ0fP+2sb
	0AM41KCmlkyf/xQJTWQuPTyMPeVjpF8Zc1bmQauzxEPZ9f4D5Q==
X-Google-Smtp-Source: ABdhPJyIatQH+0RPw4k76kTP8liqNtS2vBaY097McIgNtAw2tPXReYvpZWaVWiSDyIrHm01Z+PgFuODbf6U3gCC+FXY=
X-Received: by 2002:a4a:2f15:: with SMTP id p21mr15520154oop.20.1593074771697;
 Thu, 25 Jun 2020 01:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru> <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
 <87o8pba35w.fsf@linaro.org> <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org>
 <56ffc60e-f458-e9d4-d89e-4ca70b1ed4e2@trusted-objects.com>
 <CAFEAcA8G3ngwUXMSCEN6UVEJ6Na5sBpHqYv1qh7PEn5uMAhGqQ@mail.gmail.com>
 <e9ad4bb6-e8c9-55f5-565a-01c3f35aea92@trusted-objects.com>
 <CAFEAcA9RAXmMeHFWX0La8yLL3M4mjC+mpsW6AvJFfsP8aGnfqQ@mail.gmail.com>
 <be9893b6-f3c2-2e6c-d00e-9d8ce803b946@trusted-objects.com>
 <87mu4s7oth.fsf@linaro.org> <bee6e254-6f69-109e-2571-4e4370768930@trusted-objects.com>
In-Reply-To: <bee6e254-6f69-109e-2571-4e4370768930@trusted-objects.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 09:46:00 +0100
Message-ID: <CAFEAcA_8hdB8=NFfOoyB0pqV1Yf1DJxUKDzXFSc45+58623PcQ@mail.gmail.com>
Subject: Re: Role of qemu-arm
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: GvApBaQ/9SO6

On Thu, 25 Jun 2020 at 07:52, vincent Dupaquis
<v.dupaquis@trusted-objects.com> wrote:
> Regading the priviledged instructions, I do not understand the question,
> we only use available core instructions (I do not remember about
> priviledged instructions in Cortex-Mx.

For Cortex-M, privileged instructions are those which are
only accessible when execution is privileged, ie when
the CPU is either (a) in Handler mode or (b) in Thread
mode with CONTROL.nPRIV=0. Examples of insns only
available to privileged code are CPS, MRS access to
some special registers, and access to most of the
memory-mapped system registers.

thanks
-- PMM
