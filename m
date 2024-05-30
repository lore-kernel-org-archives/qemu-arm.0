Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp305654ejk;
        Thu, 30 May 2024 08:35:17 -0700 (PDT)
X-Received: by 2002:a50:8ad8:0:b0:578:3335:f263 with SMTP id 4fb4d7f45d1cf-57a17691120mr1880516a12.0.1717083317141;
        Thu, 30 May 2024 08:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717083317; cv=none;
        d=google.com; s=arc-20160816;
        b=tYsl4LWlB1w91DRorlKSmcUx5y3ADBGmvKH2jHwoyOSB3U4u3jTGSyPJtxL+nM3Sjw
         eesYeR0kGpPevMBMKo8bU4a/Rlc5Xb7XnJ4h65yulN/EGiEBJFgVigYkrICdyojgjsgX
         U72vMg2mZ8H8p5WhTGMG5UsU2WJvYkpblCoAh5dXoLPvOahzjqDM/uF685LPQVar1qjJ
         4NzEJdhXIybGRTtLCI4Z+8STdoTCAFO3EsW3wsvt0Ah00RkzQXl4+wVD4Znp2fnKBMnk
         kKVKXK2ALg9Elt7arKOvoXcMGaLk9D08Iq3pQQuQP6jfUJLXJei00MeNoSOPAu2kypFr
         sFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kffCTfVIgcPiSuaIdP7/qK5AEnvqYRNQ5sLQm7P7bT0=;
        fh=lyYd5u/xP7MkSXnqR0B3Lug5GOOGoEqAPzvNtygcaUQ=;
        b=vI75OjWo4b7Kvd1Bq1gVr527Oa0ogqBq/vrYurivwVoIFns/AT57jshppqRnzE9ISy
         uS/k9iFTyjdt89Pxio2rv1viRQktdFMncYaQ3V/gtuH2mRGFRPZTQW2YUpimSmWXc8Kz
         JHdAgNByYe7L7UnQKdluL+Io/w7g7T8V8y+YqUmU7YfXCgbybsDTyNcwJGEljEZ+mPJC
         TR0AQ4bOB8o63sRLRVOp357l9YuhXmxb+9gFiRX+hP67o3Rp902CNgXjYpMTl63fX6P8
         x/5N8u6PJrkSwmJp8kxC5uFvKC7kSK91UDp7hsn7bF0vsnUcNsZ892ve/9JpUjB5rDRT
         +wmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J1LwHuyI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5785231b5basor3669745a12.0.2024.05.30.08.35.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 May 2024 08:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J1LwHuyI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717083317; x=1717688117; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kffCTfVIgcPiSuaIdP7/qK5AEnvqYRNQ5sLQm7P7bT0=;
        b=J1LwHuyIVQXoHDYFJC92rYNPY4T43jWDKB5U3UVDSEx/BiygHeFzVgtV3vPHuLhD72
         AZCo0bznRWzGrEZ333DmanHLja1liKeRnYr7LrcKCHVzxM94kBNa2f0Ebhswpazs4H85
         n1bv8evO6kW2l4JQD4fkgl0+qIE5eFNdHLTchHazyjFlak/3kUajRbJ3jbMSO1ZI1aym
         f0DvcjEV9dW2pwlXkEDf5WIyuo7QzSGnH/RURWgpjrHtOOYKDOLDGQttffnUCWU45m8e
         HOngAYS/RkC9rxHj5QF04Wu2zyn3kh31+4SHNrJfF1sAJFYHVG/rB1Ak9OnY+igpDZsP
         O1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717083317; x=1717688117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kffCTfVIgcPiSuaIdP7/qK5AEnvqYRNQ5sLQm7P7bT0=;
        b=r8yh3inptNVhN1gUSyF1HEsxeM1rffTWIOiQtRGWt0v/3mT4Fl7ZPQ5z/LTBsEk9O1
         ZVDDG+bW3gzmX9No7WItIj91EQAVPwKhWduq8LABIAlkpNBn63Gg1H1WEiwwXTAauIaL
         dG4Yh7N0r0hdaAyyR6FkmWoao6avgHEWQ91/zepIA57nzrWeaYFfoWqPYVMCx53TMdut
         LCoJidpzu5ydlV/7ydE0CjQ8XouSceZKpdzEd6oIGphisit795cDT7KA4oB0L6LRFi6h
         VwLwCX/km/5rUTkIrzZnSFSFQSbAbzMhoshSHtFmCSem30Lfvz4dprmniFtqAf3BlM7W
         dKxQ==
X-Gm-Message-State: AOJu0YyEbPYnCrhDQL06VuokKM+iXFCA2EQxYe3PfeAsM4Xs461NM/gR
	nLCjBekc/VTRwTYal/EWGwhcoW84Y4O/3wiUnfNW+LKy2sawQAolN1jkMRiIHUw9BEdqDgBjDJo
	BSLVgqgAThusc+mhYur6C/js236PmXg2EFW7MIh/BslS2DEiOjvQ=
X-Google-Smtp-Source: AGHT+IEh5+tuqY+EJbGGqXbb2dRfkVFLmNUC4HfeJG9MYsl/f8PIxaiWQD/iz6ameEuhm67qaa6udj0dvrcoxfvGRTw=
X-Received: by 2002:a50:9344:0:b0:578:56e1:7ba3 with SMTP id
 4fb4d7f45d1cf-57a1791a129mr1474266a12.38.1717083316581; Thu, 30 May 2024
 08:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
 <20240430140035.3889879-2-peter.maydell@linaro.org> <87ttji3h69.fsf@draig.linaro.org>
In-Reply-To: <87ttji3h69.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 16:35:05 +0100
Message-ID: <CAFEAcA_DiLYdH_x88KtjjOH=7pVJdERe2-X+tDpgvN5qbj-_ng@mail.gmail.com>
Subject: Re: [PATCH 1/2] accel/tcg: Make TCGCPUOps::cpu_exec_halt return bool
 for whether to halt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qYyxTGULzddJ

On Tue, 30 Apr 2024 at 18:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> The x86 version is essentially being called for side effects. Do we want
> to document this usage in the method?

I plan to take these two patches into target-arm.next, with
a slightly beefed up doc comment:

    /**
     * @cpu_exec_halt: Callback for handling halt in cpu_exec.
     *
     * The target CPU should do any special processing here that it needs
     * to do when the CPU is in the halted state.
     *
     * Return true to indicate that the CPU should now leave halt, false
     * if it should remain in the halted state.
     *
     * If this method is not provided, the default is to do nothing, and
     * to leave halt if cpu_has_work() returns true.
     */

which hopefully makes it a little clearer to the reader
that "do stuff you need to do when in halt" is the
primary purpose of the method.

I'll do the follow-on tidyup rth suggests once these
have made it into git.

thanks
-- PMM
