Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp695822wrw;
        Tue, 6 Nov 2018 02:16:20 -0800 (PST)
X-Received: by 2002:a25:220a:: with SMTP id i10-v6mr24412184ybi.185.1541499380119;
        Tue, 06 Nov 2018 02:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541499380; cv=none;
        d=google.com; s=arc-20160816;
        b=Pg3Cy8/pJdaL3iMpCmvCbec+mkbA/WWo7P0iXvWylTaJB2ZaiiSmA1UZeC76dPA5Ca
         3r8FF9YGs21QTxoktzyUt4B2DT773ZNeDAnCiasTdTx1cL0EjWJAd7HahochW1Ro9DfE
         2u0brKaFiO3xYtNwI5Tb22LnTa1/gaik9Jzg9Zi60ugCJF7obqi4RlgCuFPPEyAEs05d
         mRk3fU99EpahYy9wKPqeByAA83XAeAH0Ti8p6Rnm9Tw4kvJAsYOo0qc4GSVi+ARZ8pe1
         uZ9MmiPsaqYzuz1iJalaxutRezV4+pS6QN+DAsRj5Nokf6uSHMvNWO43ZA9wy4e6RQQQ
         zt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=9UHwy01ndqGiz4mtm+mkejOXuqVRB1S2aTKGbXJTc2k=;
        b=WZqWPs1puSfIOJe4D4ShjNylOYCAe5tOp9vonAPEPSeeTkko9hz9UH/qG1ivCfyrMM
         9enc5YYl4isiodPRT54BMoho9BUY6p17Z5bRMuodPwSvXUnUqie6q1vY47sEnF6xjCeW
         9Sz0uo93l52topsfejdtOK365wF5SLt9sIbg9/yw+8Llp7NGy5g1K00TR3jCkhpkj8+3
         ccl74oUjxig74Yk+o0TgZy/WJKqkh2V+WKYDXDAqv1mJX5W8gxecDJ9xmMziMbSsuGuM
         BzqbO9viWitF4Z+ZEREcOtrgAxnmIYGLccmdk3NZxcdb00F0/KFxETNAdFxIuFkg++9h
         kBfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ap7ldsGd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b5-v6sor23191553ybq.112.2018.11.06.02.16.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Nov 2018 02:16:20 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ap7ldsGd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=9UHwy01ndqGiz4mtm+mkejOXuqVRB1S2aTKGbXJTc2k=;
        b=ap7ldsGdh6S8hGnqmkykjFgz5eBasB3etnHZvBAp54f5tCvKt4yPHglzdwe7YjFK8v
         Z3Zi18QgJc0c/BzMGI+rlFox296MXs7UKsSfVsBd1ufNR9E7BdQA1j7chrwACzTh3L2N
         1nLC1Ux+Kq5BfhlewlbrtFSG9oF2RqQSalNNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=9UHwy01ndqGiz4mtm+mkejOXuqVRB1S2aTKGbXJTc2k=;
        b=e7Sv1OiWT76NFmmT4KEpE5VPKMu7UPQQvG3/mPI2mjafwtWVT1uWO46uxlz8sRVNWF
         qKvkfKPpNpRYR9fxlgpG4cbOGESX9skTsjY/oJN0s+nUOHFh7G+mxpQl9RCh27FaaDeT
         qbyeQkm4ld22FsVC8yRdFVztkZxj77qs9Qp/D7LU6eA2bqcp2J3zGv5O91mKwigFSxzN
         07ODK1VlP+n8YvfH+7S4DcZwQW3ze6l13LH+7g/sQXpMPjneubnrOqmYgvAhlhJqowib
         JgW+IjpZbw1IK99fofFofhqhAxgCOgWTyae0PwWowb+Dhcc+Wgsasy2Y+08cxvOe4ndy
         f1TQ==
X-Gm-Message-State: AGRZ1gJcOVRjGm9E2qmJXTtCf8QTGLfaXNbOF4+0vUnZk3UJXAOaUsw0
	CQEpPpNkU6AimlgTara7fR56/78l9fv2KGZ4dPB/rzK9eVCRyP+q
X-Google-Smtp-Source: AJdET5fixBd5QhuTK0WTr2k+4+3okFAZe2khrgeXJv4yQp6JtPesE7yg1mP0sp7YRYEne/HKKYA2ZinrxZRxLsqGX3k=
X-Received: by 2002:a25:5443:: with SMTP id i64-v6mr26041206ybb.287.1541499379790;
 Tue, 06 Nov 2018 02:16:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:428f:0:0:0:0:0 with HTTP; Tue, 6 Nov 2018 02:16:19 -0800 (PST)
In-Reply-To: <CAFEAcA8hB=+YKNc8WSxrdmqigtErOsPJSAhYnq0Ha8_Ey=NaMg@mail.gmail.com>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA8hB=+YKNc8WSxrdmqigtErOsPJSAhYnq0Ha8_Ey=NaMg@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Tue, 6 Nov 2018 18:16:19 +0800
Message-ID: <CAHmQWvBOo=g_ZB0RMxuL-fBRzxPZ89u9cmtTLgx_CdnqZgjQUg@mail.gmail.com>
Subject: Re: [PATCH v4] Add arm SBSA reference machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: gYh1llVlJUFP

On 6 November 2018 at 00:31, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 October 2018 at 09:55, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> run on KVM and execute virtualization workloads, but we need an
>> environment as faithful as possible to physical hardware,  to support
>> firmware and OS development for pysical Aarch64 machines.
>>
>> See the patch commit comments for the features description.
>>
>> V4 changes:
>>  - rebased to v3.0.0
>>  - removed timer, uart, rtc, *hci device tree nodes
>>    (others were removerd in v3)
>>  - other minore codes clean up, mainly unsed header files, comments etc.
>>
>> V3 changes:
>>  - rename the platform 'sbsa-ref'
>>  - move all the codes to a separate file sbsa-ref.c
>>  - remove paravirtualized fw_cfg device
>>  - do not supply ACPI tables, since firmware will do it
>>  - supply only necessary DT nodes
>>  - and other minor code clean up
>
> Hi; just a note that this series isn't going to make it into
> the 3.1 release. It is still on my to-review queue for 4.0,
> but I may not get to reviewing it for a little bit while I
> deal with for-3.1 work.
>
Get it, thanks.

> thanks
> -- PMM
