Received: by 10.25.44.15 with SMTP id s15csp364775lfs;
        Fri, 7 Jul 2017 10:38:45 -0700 (PDT)
X-Received: by 10.55.160.12 with SMTP id j12mr64024343qke.87.1499449125152;
        Fri, 07 Jul 2017 10:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499449125; cv=none;
        d=google.com; s=arc-20160816;
        b=aT1T0xxK/YaJmRSdPxOBx2Ybvc0zu1zxugxM1XKjO0RMAJg85hDTH8X/v1rmdadS6F
         T4PSRYy3tCdsYI3OfMAk2APhwrcs4iKh8DhFbvK8x3McPHwQSqYkpY1syVp9SI2ntld2
         t5/tur+gAwhYULkxRC0QM25hN4J+X6y9pOY2I0w5V5Fd/eRBJWcoVVFR+fGwnQLrw2VF
         NwuyWYue6AtWEHNR3TShHno2QUJFpUf0+ydz6th9tkQvyt1OAa+fY/CSDI5Bc/aSzAh/
         SjFcV1gbfgXmTl3WGUCXmQ0Gw27HjIXJ8e3VMTi2yxl4FrZY9eX2oPZOc70Q2/Q/ggcz
         Q51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=SwQ86m9WTr3GILnnM3uYnVwGt/1ptFSIw/1z6Rm+jKA=;
        b=ZrdFbvzEJffffAQDmdkRuiB0EVjuSVBS9pjd8DcdxzUwYBnWfzy+4slnH90FoZ/EnV
         JnPtK1xYNXgZtNtcCcRRIDXwd/xjbYQT9egFsreCDdcVMpoDWF+nPj4EXYv4heUm5ses
         XhCwHI2nTPTmlpPjuu8qtvcoBGTvo2tF9VYBHrEHK5X4oAyc6Q6Gkfv4Snzij2bxwtdQ
         TYI0l+2JAanBx9GKH7LEnoD514x/ZMTNW+vGZTAq7c3FKyVKVC53dQLy8vmeI/fp6ech
         fP9CT5y8e2XwE/sZ/92vc9F/xzc5BehKArq0FhU4QSaWFocxVkVQyoaYI1/jiwiTW4EE
         NJ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=MggxrzPB;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id s78si3649775qki.35.2017.07.07.10.38.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=MggxrzPB;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id 16so5154059qkg.2;
        Fri, 07 Jul 2017 10:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SwQ86m9WTr3GILnnM3uYnVwGt/1ptFSIw/1z6Rm+jKA=;
        b=MggxrzPBZRN6YNqPiFUOZOi8ONCO5tVDNqCEpH2vqdDoKo1rHm+ffOhBCsAnyKmZ3N
         Bb2fUNhkwsn79umcXfi3FhgLwDObjmM314dby7WfZbohnEnHvhGjPKWsyaMu6mV39Doj
         qppYrRNweyuF9OdYPHzHsfEx5yPzs9sdWuFwarV3DQsmmwsW1ybv3EEy2f/txHiQVb/3
         j6+RKUmjkGB06tKWfN6xgvjil9QpKujtd3sR2rnN7znd7NdJCsfAc5ri4Kq4jkM3n6LO
         YwU2v0lggOXTdSmC+e0zjFupsysbJjiuttBd4jIsbZV/o7/miO+OwTiRKSYqA0a0Zilh
         7XKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SwQ86m9WTr3GILnnM3uYnVwGt/1ptFSIw/1z6Rm+jKA=;
        b=ZKDlAvGwnpsu9bZTxj9/lJELcQeXzNUNxDwkIZE7rJv8ZgdxCKBVysSvP620E+GC3k
         7pkBR98UVg/46PYIdqQ8hHp4xaiCD7YddXc7wiJQcVcNu3M2ZN6omOxOIQsLQKAttf9I
         MOlXC3wwyiHuqMHENfm7uorzZaDfR7NG+U53x397txbkAZlyqU1SWeuwPiIEFk7scI4Z
         SNdv++PyWlzpP6O6CJfF7SwM0k3vLn17nLqNhZG+vY+c/ZjvsGurIhywHxxuBR9psVsq
         6JmY5H2azM/GTgQuApZS5m4G2TNcCDTuA1XS8+wfQ0uFfeKwRdsW+HsQfJjAcbxRDgDM
         7z0g==
X-Gm-Message-State: AKS2vOzK1tJB56HLzSN8rjj8L8R5/RA1KuP/jbzxMIlIFNyNXO8SN6IR
	iaZWM5EHWGekWO3ikIE=
X-Received: by 10.55.150.134 with SMTP id y128mr65548351qkd.29.1499449124559;
        Fri, 07 Jul 2017 10:38:44 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-66-91-136-156.west.biz.rr.com. [66.91.136.156])
        by smtp.googlemail.com with ESMTPSA id w72sm2827742qka.63.2017.07.07.10.38.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:38:43 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 23/29] target/arm: [tcg] Port to
 translate_insn
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865776960.17063.4875279139522061160.stgit@frigg.lan>
 <2bfdb883-f19b-7fcf-c28b-7ce39115937e@twiddle.net> <87podcebyi.fsf@frigg.lan>
 <3745ae02-3fb0-1503-9c99-98dce369f697@twiddle.net> <87lgo0cgij.fsf@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <260addd5-45fe-ad10-5208-35906fd3f197@twiddle.net>
Date: Fri, 7 Jul 2017 07:38:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87lgo0cgij.fsf@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hnMzREliUyxL

On 07/07/2017 07:18 AM, Lluís Vilanova wrote:
> There was no code being generated after this specific case, but I haven't
> checked if DISAS_EXC is set in any other place that is not immediately followed
> by a "goto done_generating".

Typically we haven't actually done a goto, but simply exit the loop and emit 
nothing within the final cleanup (tb_stop?).

> Does this mean DISAS_EXC should be on the generic code and do a "goto
> done_generating" whenever it is found? And if so, what are the correct places to
> check for this? After ops->insn_start, ops->translate_insn, ops->tb_stop?

Yes, this should be handled generically, since all targets need it.

That said, I would prefer a better name like DISAS_NORETURN, which does not 
imply that an actual exception has been raised, but explicitly says that all 
following code is dead.


r~
