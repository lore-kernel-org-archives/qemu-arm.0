Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp841194lfg;
        Wed, 10 Mar 2021 12:17:33 -0800 (PST)
X-Received: by 2002:a17:906:dfcc:: with SMTP id jt12mr181998ejc.31.1615407452947;
        Wed, 10 Mar 2021 12:17:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615407452; cv=none;
        d=google.com; s=arc-20160816;
        b=vIHmfUpeEpGEQ7LsxzsovsooYf5UBXTJyCa1vQ2Q1RWm1xl9HRkKoBh9m9cvsEOBXI
         7iz2416YEQz3f53L3rrgx2uCJaEF5zbVx/vAzib+UovHHw2ecVVEI5C3VkvQUnYCd1s5
         tpa3eZvTgl+APex9eVIhr/4uqovTXVMEbuiv5Q9f/7WzpxP7ooLZPH7eWafoRPMnMSk1
         q+hnicP/A9V/TXZznXMpeYu4XcXl2AYKzc0CPYGo8yNNgJUd6B7E2uz+NPaPLqAiMrm/
         WsplozSxTHbNwbz1fOYHEb/JgjUWbwWETEAymt3GZPZlszuXIdTnZAuJp9JW9+h0TC2b
         gJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Et6g2EknvSpnTHDTUjefAvf0e8/zcWUVVOPwgYez+04=;
        b=A+vO88FaWiYkySv1dGVlB1w2zw+4WctYVw1vhAwu+epO27LyJPQviHjU+M3F03P+ZK
         Tw2+FtfI2Aq9je6lOB8AYLGxf+Q8TvEFxxl0vQBPFHUsDHr8GZVdTUrel1yHNnJmrVgc
         1kyiKSULxgy2oAknVZOuF3KiZ7Hv/F+fNoXcGXR/pv/5hVN2jtnCdZidYzLiosgZhGvm
         SIg8Pr/Qzpc3G8ibR3cxEH9O7PPubi99lXMH+eHK1YNgT+IgthBHpT6Ci52HgcaWtuaX
         xE7mVHlkeIrEchh+AANKpnGcnErgnFkwjLysd4eivgoGu5LDCbdf22+KkiLkBEPZAoqo
         Xsmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Plh7gBYz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j9sor298413ejx.53.2021.03.10.12.17.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Mar 2021 12:17:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Plh7gBYz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Et6g2EknvSpnTHDTUjefAvf0e8/zcWUVVOPwgYez+04=;
        b=Plh7gBYzyYVEBWoL+FEZxa8Mekt1YtHRVZOS2X5hWbNUAhMtXEnp31GPZe0BBDn30K
         V5dqtn8Hgx2Be0o3eNjjCp9Vdn5o5G/8DmQkY94sTDo++QWslJ2aq5GT6SWvNmZYXihM
         OQcMT4ZxoL5pzjVZ745JhBEnR/B+g0HPpXomSJuozgZEpcTyyA4S3qDmD1cV/+tfMQjH
         Fzyul24YIrz/iZkpyx8T21wrmeCajIVhTGoYNCon4zPrDEfTr+XGNF124SCBcrqGDOY3
         EtCcuzW76jFbAG142rlCHKNErqKNZX/dl/R8uFwP6uNg9/vBUafWAO/uAkS/r9B0UKHv
         10Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Et6g2EknvSpnTHDTUjefAvf0e8/zcWUVVOPwgYez+04=;
        b=QNPFCPwDGHXnsPx8NZTeO6ge1+30/KpN0FTRvUph9IOcUijhIzVk9MzHOMxNt0ifJ8
         MUc3WKBoTYOTScH8OPj3mEwLjMSaWHhMsmY8ymYm0TBhf6p+6AteZrgBd1zc1/5qJstp
         zKpHi/5npXbE2dcaMtzA6JU20EDrxhvBtelN3evR0gZ+0T+IRra4lwlqLy2pmPqdY33R
         eE1vzbeuWGRLoUVNAPPEkaHS2ttK/pPWqZ5rZAMzjLgz/Hb9xKGyQh2mh6W5hl7Du1sQ
         S/kd1pNcOGkdKRohPMTncFIfiixt8yBvUBnbk53FX65FEtUgJjLo2Awlh7Mknd0VYI68
         vMUA==
X-Gm-Message-State: AOAM531LkvCT0P3Ut8Qubw/Gh52JXZjLeVWzxB+Vf3Jv8hkyMosBminv
	5IsY4Vtx00cuueJiGMa+Fr7yyxKGqkVk6JRfB8MzdBND
X-Google-Smtp-Source: ABdhPJwHJ2Zg+fvb3FPqRfPe/TMMnXuW+uxACDaxX8pdRJh8aIPFi071X2vp+7R8/lzh/MfjkBTEdiwsFydaRvjKD/c=
X-Received: by 2002:a05:6402:19a:: with SMTP id r26mr5153090edv.44.1615407452682;
 Wed, 10 Mar 2021 12:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20210309162041.23124-1-richard.henderson@linaro.org>
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 20:17:14 +0000
Message-ID: <CAFEAcA_36F6onzaBfG8WKF5ViZ4UrxXyB9fbeVbMah1CGiuPDQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/78] target/arm: Implement SVE2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 3SL/h0U2Zma/

On Tue, 9 Mar 2021 at 16:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> After a 6-month hiatus, sve2 is back.  This time, with RISU
> testing vs FVP 11.13.36.
>
> Based-on: 20210309155305.11301-1-richard.henderson@linaro.org
> ("target/arm: sve1 fixes")

Are you hoping to squeeze this into 6.0, or can I delay
review of it in favour of for-6.0 stuff ?

thanks
-- PMM
