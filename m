Received: by 10.28.4.212 with SMTP id 203csp1260278wme;
        Thu, 10 May 2018 10:02:46 -0700 (PDT)
X-Received: by 2002:a9d:14e:: with SMTP id 72-v6mr1436470otu.365.1525971766600;
        Thu, 10 May 2018 10:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525971766; cv=none;
        d=google.com; s=arc-20160816;
        b=agdHwELhZKVMRWBC2AnzEgfbvxj3qsSTvYPtiTRBMyiOBcpYIYUIeygnrQwi7ODlar
         4yvdkxy5ziVX9QYqwapYxWd8Txj47eBmK3ZxMCdyMfy/Gp+v4fBNpx7q8nP4FPPfaHjI
         Jdche+K3jou9c5DSY/4KUBhQvGf33Cx4iK7Y/mpevX/HiB/Z0KITPg8OtcoPvTF5mt/R
         tmKCt+PC3XEg4iO9+IX7VhWY9gdjSFVYKs5ffqmnUo7V0nAoQQM7SOtyA7ELr2jFnvzZ
         oABO2/GUFKG8RfYSqTh6chdlFLRqehF3E4kw/O1tHK3wrWgnKuo+fA3k9gZkvuEZmdj3
         yR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=syxnbJ6Ee+0kQbVgF4FVxAbONeptA9UWXqsd1lJROgY=;
        b=EfW/p+HcfMb+896P8tH+WhT3d3jLCvtiH7MkQSvkS4gftt3sHUpBdLTfFycnkAmT9E
         8ATebhaBneDyzyBarZsLIz4LrqJ8yjMvJ8rNEtNky5ZkiXrdMFLJJ5HdtpGgI8d0d0MH
         nUCps6dAPV/mOxd31lSg8EjiuFmwDTQatBVdb50lA+2L78j+3sH4dkgjJIOAPiZ2ftO8
         uYLOZBrg4z7kszMDvhLjXXVFSVM7yo39LfTUq+jk3NG021b9O5ordVzmne97rr8q9okG
         IjXWZSV6XWQKEehalvtkhPTRm/srwXk3tylTLxhlagccssAKdUo/TGGV63wx3/dauUWa
         e7Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wp2rZt1V;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r96-v6sor561876ota.33.2018.05.10.10.02.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 May 2018 10:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wp2rZt1V;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=syxnbJ6Ee+0kQbVgF4FVxAbONeptA9UWXqsd1lJROgY=;
        b=Wp2rZt1VKoASRUKl5ab4NLjp3Lc48+B+xxNcf4OWKDYRItk/k13Lz8QAoTEXkdy7HH
         /q0E5dVRl112ZsAmVOt5ysvSK2x26FkhY/mpqh4CTKSMacYzVhuwAcwNPGB7t7vZh4Vp
         EO7NQQnJ2J26xER1peivyFYkLUCGE3BvSJEw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=syxnbJ6Ee+0kQbVgF4FVxAbONeptA9UWXqsd1lJROgY=;
        b=duGdMRiXadvkjzA8//cT1qu81/qdBlT9MSGotxDmnRkRH+80ARdQ1Izqk5N67HvsyI
         hxgf8W/3Ju23pTnonpOneYkZxxsVnlPHhaDkoxgtRjfejMBfr8N5xumSxtRuF21o8t0h
         LCYz0MUCFWvt/AFj0iTDWvoi2E5hrIF+5+osvjWnhRcNfCQVieMyrXGyUt/thVNo/mKh
         FDLNGFTcmixfov7T6Z3Gadg0YZOYfIoLw/UMcCpD4whvh1Vm3v4CU9LPwEw5KDByYrGD
         4adOAHfS3aQGnnoX04SyqqEUWtph7QYaMbSoTCjFQeScIRB/R67Z+AOgHPiOIXIN24jp
         NWIA==
X-Gm-Message-State: ALKqPwcxwg86aj/0JyywPxp0wIuIJZ1m1/uA+FcolwoHrW6oFZPv2kJP
	pf+p2zJ99onGqUtJTqI8xtGDsMB7tvpxEzGRnqQq06SG
X-Google-Smtp-Source: AB8JxZoekHZ8RqFjaiJWaJoZhsH7sLnghSeHbOhxGY35zYN4htS7UV0mCdqiuolSswgPpONaM2+SFZcM1KpErljUlo8=
X-Received: by 2002:a9d:2842:: with SMTP id h2-v6mr1618062otd.210.1525971766300;
 Thu, 10 May 2018 10:02:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 10:02:25
 -0700 (PDT)
In-Reply-To: <20180502221552.3873-14-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org> <20180502221552.3873-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 18:02:25 +0100
Message-ID: <CAFEAcA_v5kVGLKwdX-U6AA1qEkU9KTJBCdh-ZRGMJqSMqjna8g@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] target/arm: Implement FMOV (immediate) for fp16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: AVKjiO7uFbns

On 2 May 2018 at 23:15, Richard Henderson <richard.henderson@linaro.org> wr=
ote:
> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> All the hard work is already done by vfp_expand_imm, we just need to
> make sure we pick up the correct size.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> [rth: Merge unallocated_encoding check with TCGMemOp conversion.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
