Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2634774lfh;
        Mon, 30 May 2022 02:36:24 -0700 (PDT)
X-Received: by 2002:a81:18d1:0:b0:30c:200d:3abf with SMTP id 200-20020a8118d1000000b0030c200d3abfmr9677305ywy.462.1653903384361;
        Mon, 30 May 2022 02:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653903384; cv=none;
        d=google.com; s=arc-20160816;
        b=XMAlyLnGjP9pVw9uwUiYGaNVa3+bK8pHOFQTDWGps3iM30Ms09cBtpnG5rHkLZakIG
         Vy4Y9g6x5gjAemPj1SJLE9AaAxPxAmdCitG9HN3xt0JrGhwppgNSrvNGmwOTveQJi4La
         gXS/AkUPHzGzPcB9+NRn0FEFEVbnCOuI+J83+7ZUcxVG8NJO58J+zyEYi0Ph037dFeVu
         k4tRBJb6ZjJtdpb+lxX7CTMReyM/DKlr30Xkjf49uswYumEtGS0jPAIWuUA8siZIfOHP
         aytdERv2NCu9L+p7De3HBa3OYys+Hh/QtVEd3+XITH85i4htietu66fiW2JLbvLlzTZt
         8rDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fokwcmOkaG3PZymgpDcbv2T+l3kkUhPgHBsJOE6liqo=;
        b=nUI7ovwrYvUn3dnxgUp4Zj2SzUGPB5Wjohti7goLSUSZrcdLzqvZ8n1mWFMxsytlZj
         giYiTNW5MtIuVQ2QKxvdMvmhnu/xZ1nHF1MngZTFnbc40xHbCxkp16PFZ++yXAvPob2U
         5TnwZZX1LcgjgtLkNzfDISNPkks2XXrTIU9oKHPgZUlyOzpt8JJdOvLnhXLCinScCw+m
         km0OYZCwvlKhTs0a1PzxdDd/U8272RPfOzb9xuGKKc2PdPvHTuI5Kd99wbNOMI5zBr/U
         hnBpNM6tqnh4qXpC2yHnYCgOXcKgtvsgtPqUH+t/hhm2vdOGRr+8REqvPrksME80Xt4M
         bLEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VH5NXWFO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i3-20020a5b0c83000000b006555e284587sor3640920ybq.156.2022.05.30.02.36.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 May 2022 02:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VH5NXWFO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fokwcmOkaG3PZymgpDcbv2T+l3kkUhPgHBsJOE6liqo=;
        b=VH5NXWFODsKPh4CC0mqkMI7yx7bnnpyWe7PVIMP43QUBwZMfAGPh5NUZd6wkXZ9JRk
         XoO2QtEPOiimG4liYvDCesbqQ/Y+ODgeSMqBInxYXHQcig41MpUArBkbqK7PMNOomtPV
         qmIOYgRsKASI6B0pqT+UNS3JG08xtnFYTDs6NXpyh5h8D0QKXoGIeGtAyj5cZU00Rd9h
         f9vSmtD4hfy3iiEvlDYVLBy5c5h+SoytwWt1IsHpcfxj3ZYbhQ9U52/AJIx6uz50bH6N
         VLTi5D6nYUJsmT5q28p2igAiMEbIV0aGza2BYzKUf5in69zjeyASmTjjWZCfTwOKY3LB
         IJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fokwcmOkaG3PZymgpDcbv2T+l3kkUhPgHBsJOE6liqo=;
        b=UPVi9lnwwjachBa6Y0itJZ9rvNzmSdWpen+2ku+AyzwYWsLAXgKW5et6pTHZkma3+o
         C4Abkk1d73tNIMuFAVdTSSWLVO7Gy7JpZqfDwVZ4z3neCyPjpNJs05iHlataot08QS6Q
         Lp1cTrXclKnAAZEJNEJjXIhhnm0UJTCz5hhlsXP4AVXvhAvfDOHmln08nY1TxznJLsai
         3jYQjYlMMKphHF8xLur/gin1QWenhhX6Hdl7WeDgPBeWGt9EEva0sBOr+GOt3yOSkyIv
         /kaiWtVCb469Oa2BXmyLb24dUkHTEed9P7TRz6K1jrKwvjqG7/eDmW8jls88TljE4VIx
         xc+A==
X-Gm-Message-State: AOAM533h4flICMKB/5H6b1T72XDyPV179b2Oq7c9CCzAzkLvDlH8rJ4G
	VnbzPS7Z6VeBi6HzrBtyk401wJpAO5Gl1opTda3x88ft
X-Google-Smtp-Source: ABdhPJzNElStC+9b0JNHfN8eqKH4cnjNVU10BgaISHznb8NIYLT8N0uaYXPK4HbQIzwSdftLS1nVgMxOfr42M9awHk0=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr52520937ybq.67.1653903383993; Mon, 30
 May 2022 02:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220525161926.34233-1-philmd@fungible.com>
In-Reply-To: <20220525161926.34233-1-philmd@fungible.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 10:36:13 +0100
Message-ID: <CAFEAcA9cxo+uyb-hXGi0m2+8bcKakmq2U7reG=e2fHtwyppw2Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: Include missing "cpregs.h"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@fungible.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alexander Graf <agraf@csgraf.de>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Duncan Bayne <duncan@bayne.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Gt7NxkiFseea

On Wed, 25 May 2022 at 17:19, Philippe Mathieu-Daud=C3=A9
<philmd@fungible.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Fix when building HVF on macOS Aarch64:
>



Applied to target-arm.next, thanks.

-- PMM
