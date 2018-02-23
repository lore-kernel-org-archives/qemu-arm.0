Received: by 10.28.71.27 with SMTP id u27csp906896wma;
        Fri, 23 Feb 2018 10:23:35 -0800 (PST)
X-Received: by 10.99.63.139 with SMTP id m133mr2097564pga.174.1519410215587;
        Fri, 23 Feb 2018 10:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519410215; cv=none;
        d=google.com; s=arc-20160816;
        b=Gdkc1LzTEKAjC2d9ab4RZ9KZrvLBtlWJ2Z96FwX25mTIQYGYp9F+/Hf22IgkhIXkzF
         jupv0zdQoIi1AtKG46wdCeNCsUHsLkEBrJTm7MdeZ6XStWeCfozYF9kTKbguyJUMIttL
         OkPNUDYbKPrxaVf1Pg15uz2NU+69iLbq1c8Um9VzfEuljMV+ntfftONA91rwQGUEpNeG
         SOD661A55UO6KwDor9yTZCkQEN1qkiSYziI/Eg+r45kCV7FVlHRPUpiaYM37YeebQKCA
         SWjwfLBFxNBm12P0niSt7Meff3DNQ73dJ+El+ktJka1/TEV9nWmv7CDaZbqcwKFWm+SC
         2kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tTm3DfiFSk7w8l7tGI3EUgzIXPPwZ68A0ez0JGXcOhM=;
        b=pR6qPoF0eGmhoQk0pBG2VATePlepMoWPJtqN1jzjUvB/Om24iOQyl/mhJxDSW2Bta3
         dp0sXdSN6fqoW2rviIugU1wHyx+Gbzt0S6MVwYtD4c0UnxG/XOKz3CogckJICMKIYIjw
         +Q4WKahJXgkUOpmyIoiT2mtoW00epWcy5E3hygsrzi8To74fjyWpGuHjh9owttVpwuW/
         Si8M+WgkBIXRWgQG8161pq8SYPtIqL0vozhHUx1f9MHhT4YA2pgp67D21Q8/VvNvYBQ8
         6+bh9cyEKGncJDS6ixYAgWA1DUqZQ51zq1yAObJtGcb9JO0VV2t7MyvNOCjV12FbGer1
         Lc0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FQcHPlBK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c2-v6sor743087plo.52.2018.02.23.10.23.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 10:23:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FQcHPlBK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tTm3DfiFSk7w8l7tGI3EUgzIXPPwZ68A0ez0JGXcOhM=;
        b=FQcHPlBKYR61res8WzY6klRuU6ZSj9xzvLG5YlX+dBIfyDRd+6mT3jqXW2xGI18n3z
         oMs38HQtIkyAHIGW0kpWCLUY3Tk1okeCBJf1aherv8MtpssoxOkQKGAsfC4++EeUwgvn
         ko9H6HtAbnmtpSK3T2a7IlDyMhAPuAJp9pGP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tTm3DfiFSk7w8l7tGI3EUgzIXPPwZ68A0ez0JGXcOhM=;
        b=EgJHUhydQYhMDWRAet8DjSKE107mC0kMRwRVo7miRBTglvgF3glojZDgXeI1/3QlME
         U/bc0vP0mp+NWe9qcDBR3oo62BkjXB/VcU9KWCJtnsRl5EDRua1TyULIPQLk0TqayyU4
         3VUvT4rdITuK+Vc+Q15gYVaolsyAgBy9eYGXBWapLyyo3W27M2RXhWNa184niq6MfkW2
         dg2S7mq1N/rTKIYUYUZ2Nr6tE/51oNZLle5H3w/v3Ed4BKVPZUHPgOEbJCJIYawpOk04
         6TAK5kOgVkgvIa/fmEqM9t34hcVdLIVm+gvytyLU0SeGeyqehRDiTapqvFkhCW8LQs4T
         tWrA==
X-Gm-Message-State: APf1xPDojVmGFTilhasqGTzFwR4tlRlfPYGEDZ+BH2nP0v12AqcYY4Xs
	4MZKt25OycNqG5NqS0CEfKs5LpWP/zJUap2S5vjEelibTEM=
X-Google-Smtp-Source: AH8x224dYtvbValYc8spBuml+MXgvLWMxaZy3o4v1BnPV/fk2IsBiSPX0ES1vwvDYmLR2j6l5B9SnTWeb6hZ4loyhA8=
X-Received: by 2002:a17:902:bc41:: with SMTP id t1-v6mr2558293plz.436.1519410215145;
 Fri, 23 Feb 2018 10:23:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 10:23:14 -0800 (PST)
In-Reply-To: <20180223154613.2096-1-alex.bennee@linaro.org>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 18:23:14 +0000
Message-ID: <CAFEAcA8-D=f-kAKMB+cj91ffUW2MD0wDQt0XA_3gVec=YDBfkg@mail.gmail.com>
Subject: Re: [PATCH REPOST v1 0/8] Group support and random clean-ups
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: MrONKO0L7jOB

On 23 February 2018 at 15:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Hi,
>
> This is essentially a re-post but with a wider distribution. There is
> one extra patch which adds the FP16 1 source data processing. This is for
> discussion on how best to represent all the different architectural
> versions by using the second field in the aarch64.risu file.
>
> Alex Benn=C3=A9e (8):
>   risugen: support @GroupName in risu files
>   aarch64.risu: clean-up and annotate with groups
>   aarch64.risu: add cryptographic extensions for v8.2
>   new contrib/generate_all.sh: batch risugen script
>   contrib/run_risu.sh: allow appending of QEMU_FLAGS
>   contrib/run_risu.sh: don't set -e
>   contrib/run_risu.sh: add a visual cue for a clean-run
>   aarch64.risu: update Floating-point data-processing (1 source)

I've pushed all but 3 and 5 to risu master. I don't actually
object to patch 5 and will probably push that too, but I figure we
could have the conversation first :-)

-- PMM
