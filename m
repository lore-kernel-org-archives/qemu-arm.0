Received: by 10.25.77.65 with SMTP id a62csp273446lfb;
        Fri, 17 Feb 2017 09:18:22 -0800 (PST)
X-Received: by 10.157.56.27 with SMTP id i27mr5387304otc.160.1487351902418;
        Fri, 17 Feb 2017 09:18:22 -0800 (PST)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-ot0-x22e.google.com (mail-ot0-x22e.google.com. [2607:f8b0:4003:c0f::22e])
        by mx.google.com with ESMTPS id c198si5096376oib.31.2017.02.17.09.18.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2017 09:18:22 -0800 (PST)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4003:c0f::22e as permitted sender) client-ip=2607:f8b0:4003:c0f::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4003:c0f::22e as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-ot0-x22e.google.com with SMTP id 45so35536277otd.2;
        Fri, 17 Feb 2017 09:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8Fd6oLR5dPINpf+WF/wgRtG/FpwhCwufCEscwR+Rx5Y=;
        b=WZVaQF2Q/QYE1fg5oD8n5UpZhYJDXhy8x/oD+Sxt67uj/xeoaqN8Ea38Tq+mWKCR/W
         xjB9359G1R3YhENLAG5jwZwYdN1rSnbDlH6GitPCtSbEK7UHGzf2QACWPzF30a7SMnKK
         7+kLymvC/RiMwKy1dmZdJ3NTfxjqO9dhjgDQGdXkSC1/mvTGIBth72/AY1ClNiYl220R
         hAgCpXlzOvfXvSDu4SC+nybqjx6U/tw7ohXhM567+5DJMt13UK4n7Yawr3OrV3Sgz9dy
         2VGclV+EVFNnDkAc9D7cWULhVjNW48AOe7I1up4lowemv0JzPsTvgHgKvjzK5RnLdse1
         DZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8Fd6oLR5dPINpf+WF/wgRtG/FpwhCwufCEscwR+Rx5Y=;
        b=gnxNjRVJpy2jJMOw0ExSYhXaf9BD/NOzMG1pqfV6cSzUARKSqQhCzLJ7RtMyQgB0EL
         au5XYuJZPrBh+Yz7G3au8oJYDtAfVtTUAv8dOlyUBBr3lJbqAzWcBZ1NejW9EMKZkhyr
         GQi3mTo1J8P7be1qQ45uLTVloYU/AlBsRNtgBeQ1L184ZrkBrxYyZ4sCSCYMQgGh094j
         dD6OZieI08qcboxTmx8jzKBPBspqy/BWJb5NFBG4MKZQdN+wQO6OJpfoFqIayb13JXqI
         8VgScxIgcn2fy+g0Vu/oAk4dybYwnIgSaxwT2Ehn53TXvQJtEvVuJVcv/SEnSgICspHi
         ryYQ==
X-Gm-Message-State: AMke39lUF4MITRIiWOeZ5MByCfzcNo+r8heXO0dTV7em4XH65uL1Eg8DlqEDHHGKTEBokoUdySS/qPfr7Ylahg==
X-Received: by 10.157.6.170 with SMTP id 39mr4533691otx.210.1487351901806;
 Fri, 17 Feb 2017 09:18:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.2.70 with HTTP; Fri, 17 Feb 2017 09:17:51 -0800 (PST)
In-Reply-To: <20170213121017.12907-22-alex.bennee@linaro.org>
References: <20170213121017.12907-1-alex.bennee@linaro.org> <20170213121017.12907-22-alex.bennee@linaro.org>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Fri, 17 Feb 2017 12:17:51 -0500
Message-ID: <CAJhHMCCcxJgtfC98ox69cNiaPwyKPNZ9pYcm1qz1+5MNcEx7AQ@mail.gmail.com>
Subject: Re: [PATCH v12 21/24] target-arm: don't generate WFE/YIELD calls for MTTCG
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson <rth@twiddle.net>, 
	MTTCG Devel <mttcg@listserver.greensocs.com>, qemu-devel <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	alvise rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	nikunj@linux.vnet.ibm.com, Mark Burton <mark.burton@greensocs.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: P9y4wJGIfsRW

On Mon, Feb 13, 2017 at 7:10 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> The WFE and YIELD instructions are really only hints and in TCG's case
> they were useful to move the scheduling on from one vCPU to the next. In
> the parallel context (MTTCG) this just causes an unnecessary cpu_exit
> and contention of the BQL.
>

I think something similar needs to be done for 'pause' on x86.

--=20
Pranith
