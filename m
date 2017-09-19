Received: by 10.223.172.38 with SMTP id v35csp4697967wrc;
        Tue, 19 Sep 2017 02:05:10 -0700 (PDT)
X-Received: by 10.28.26.15 with SMTP id a15mr474785wma.16.1505811910458;
        Tue, 19 Sep 2017 02:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505811910; cv=none;
        d=google.com; s=arc-20160816;
        b=KesXhlbeDXSuPvZY09WKy+7kKjqqEmQkvFRe/abRzHtqzFLqkW/s1mSiB1FmP+CPTS
         yZ0E7ZUh5xlr9r8IHkFOsaaMAVx0KGqoOaXgxFNVTNx0W98mx4rlAFDjKm2QnZnDn1mx
         15MaLPHV7EuQbnL9h00GnetbpnW1iN6DwipXU1n/nqK23BUwUOQh4wZzAPH11+Hqyjp2
         oZcndFt7swakIMWBpqeHz/kIibtGCs80QEdqm5nn3NRUe9zlYxJXhKrzYEbvDDQAZumj
         QrXdWLNp52xp2sMpb9NB34gNwKwhtHojCTO8LRT4UbZ4CvMWUFPQby3GZZj2BoymMH7C
         /TBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=y/Mo9RvjZxtfVf16LH4KUX9EYazASbuV985t9ef4fP0=;
        b=M7R/DMoAG6Gr5LQrN4kAj5HgMF/4ssEIeHdY+2iL1tjA8vPem0i14h5tNIZkkUVgyJ
         ci7NwFr+VEYSeLOgsJKAtmwT60OTDmBScwc/Ob6KFnYpkt2KsZW6Sk1SLvK1bIPipnGP
         +p8bwxKdf8VnIdTAi6uKKO/mO89gDzXh7BfK6AT2FMwDwhGeQNJBoN8CZFe2/9Cr1h52
         blXBFT6re94K48ceh1e6StXiTXFujv3msKoN7rYwFBwOB3z+OuIVZcTBhHsDLDsv/jHv
         DORmRQPgFI9QI7i3YZLq6NAmVzw6XUhiflcxJfhC9c+IRu54Er95+x5Pl3n2DNUsF3Jd
         Jl5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgxPyfGZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u140sor305552wmd.0.2017.09.19.02.05.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Sep 2017 02:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgxPyfGZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=y/Mo9RvjZxtfVf16LH4KUX9EYazASbuV985t9ef4fP0=;
        b=QgxPyfGZmlMznCKQ7BVwV/5OD/8UTqhbuI9myqAVUWWy8VDhj3aM+K/UpXCrpskI0j
         mCZ9+etLPpdgKZxmxkZ2R8EUFwHbTxL1gTL9HB2h5TZFsLsnZgFBil3GfT775ycXM27e
         U/YEi8TR9ueFpsYJnHLRegkM3jk3ft+2OGvAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=y/Mo9RvjZxtfVf16LH4KUX9EYazASbuV985t9ef4fP0=;
        b=aKxVzRR+sSMdxEa7c2xaXldYx0AGJImDGJTwq14kyFEbAvYkRdic78omvLpGXqheYV
         Ipt8cTGVQrspzLeZbcNQaq++9GKd4Ke1JT9pgwBMabQ9PU/vj2+JMhm5mlf+Jd9B8su7
         MMOW4ehuPwNMZLWOYtmf1sOxYHA1TmARCULTPrL5Jh/OVoS3iiQr7SJ0Ql/IH5STtSW3
         p82XVklXckcdd6DKHHvOm4035mEtcmLFs/Oo1s5jDw4aoly0DZww7GArWi/noIPglLkk
         SoWfv8MLvyv4Pva8TzJbNMHVowVDMn3mJf2COCUKmz25clYwbLX34iSQQqaH04k5dsye
         J9HA==
X-Gm-Message-State: AHPjjUhdgkXnsHb8oiiRtdAL6VCyThfO+JRr4x9vBJ0hL7gI3nh1TdKd
	d5gTk+bEdP7eZfT2JYr/GJsC7GVNV1hEg3xOFGM3JvFy
X-Google-Smtp-Source: AOwi7QDf/gAH+XQZslsE7HgkVE9rNEKGHciWU+JlEvsa/3xTFfK2qm8OVkqORf3ugn9nyD9wOP7nsT6rkKjALlrVNns=
X-Received: by 10.28.22.66 with SMTP id 63mr426074wmw.11.1505811910212; Tue,
 19 Sep 2017 02:05:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 19 Sep 2017 02:04:49 -0700 (PDT)
In-Reply-To: <20170919044346.GA32572@toto>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
 <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
 <20170711100334.GA25504@toto> <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
 <20170711103859.GC25504@toto> <CAFEAcA9wn_ozBCHBZqxqARB5eD4wX1snyGfM0JW1Yk103CTytQ@mail.gmail.com>
 <20170919044346.GA32572@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Sep 2017 10:04:49 +0100
Message-ID: <CAFEAcA-hNHaDkgAYtJFsSa7=eNAh+usUcEkOcf0rcdGRFV7UqQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: IDKUh1vjtyqx

On 19 September 2017 at 05:43, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> On Mon, Sep 18, 2017 at 04:50:23PM +0100, Peter Maydell wrote:
>> I'm currently running into a similar issue with M profile,
>> where at the moment we stuff the information about what
>> kind of fault the MPU generates into a v7PMSA format
>> FSR value and reinterpret it into M profile exception
>> types and fault status register bits later. This works
>> OK, but for v8M we want to start reporting kinds of fault
>> (like SecureFault) that don't have equivalents in v7PMSA
>> at all, and maybe it would be better to clean this up rather
>> than assigning arbitrary bogus fsr values for internal use...
>
> I see, yes that sounds like a similar issue.
> If you'd like to take over this, that'd be great :-)

For the moment I've taken the easy approach of using dummy
FSR values. We'll see if that gets through code review :-)

thanks
-- PMM
