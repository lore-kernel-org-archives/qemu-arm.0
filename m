Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp269031ejb;
        Thu, 5 Jan 2023 04:29:58 -0800 (PST)
X-Received: by 2002:a05:6a00:438c:b0:582:9f43:2c7b with SMTP id bt12-20020a056a00438c00b005829f432c7bmr12574651pfb.17.1672921798506;
        Thu, 05 Jan 2023 04:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672921798; cv=none;
        d=google.com; s=arc-20160816;
        b=TMo6ArIPOJmuB4GR8LivYlYELKEby1KGaZySxNS8rH0KjmuLtF0FnZrjKtquoP0Stj
         yP/w8GJ0+ID2hMIhI94ZRad7NCSTRWJ5/oAy+ig/pQ0ytLTpPQ8uTv82c/KdLYFFKZJm
         H1RnJuB8KtoPgEBjsv2bOUNO5ywNuAdoR3uFY4Nna3kp0/u7sRL9QM3DPyqTQHvwgdL+
         jprGFgurBsns52L/NbznSeJtTneWAg8xMPu8z4ArUP/G4KWM071LeuHmgzK+jNX1YqlY
         FqjHl63GWED2fMPt6xLg33FIOPZygvLImXyqjcKQH3JncHGSGR+6yxcZ1fAboG3KJOK2
         XLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EreA2E/z+iNbcLiJuBiYI5z02CYKhjitAuCuUOBCEoc=;
        b=c+x0WKWE01YhDcybP1d+VKACqSKPrCDAOZfkXmXBRwJAVNIV/mh6KP80kB8OtERZR7
         uhApq7hajgeuKP+P1sDkjd9aeXiuq+HY5kyi1s2/sFpMoXewubFmNXud+9OVdh8EXf+I
         9spoKjIS9pEmOvdpUbe7HQK6kUUW2kd9Cwufdm6nZ3jkzed1clJaVkrbroqHkyhpLSNT
         EJ9urhqq0jUcWEGIn5OvF40ayTOeI8S8uVUNKVw4Mo4fej8hHakt7fysokNxKcckkMAo
         QNsRU/dmvWkYZaEtQNnw+Rc3y35Zs4ydUKTyrb03LF5Dk60lyxXvlt5u+Rm6vtIuoTJW
         W6yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rkhi/D+N";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s9-20020aa78d49000000b00582ffd6c9cfsor1975669pfe.42.2023.01.05.04.29.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 04:29:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rkhi/D+N";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EreA2E/z+iNbcLiJuBiYI5z02CYKhjitAuCuUOBCEoc=;
        b=Rkhi/D+N0XlDMIaTTtJ/r/7/0uOw36pXp/xPVas6irST/XlDCBl6y0W5ti866BQAq6
         x1p/QsDzo2bkwcN6Oj77ij2bDbnU3h9V5n7e5QiVve0WVKifahRv6l2jxLt0nvFDZ5kS
         ihhFoIEQIUHVi6IMk84Peuwe+Vmxm2JKbulMWxsKNzSg5an24QA5TpbYLDFTNwq3wtDr
         02umXJ+fTmTPq5SmoDu7qcpym/LOJbZ+3k44Ar3OQev3hwYiJZwot+iVlQKf0m6Irw40
         1CiMr9NHBeDdxB/EZpRck42aIWbXoUyDnQM3/hnLquvfA+lX2tWlOV0J1XoWxy567ujV
         zXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EreA2E/z+iNbcLiJuBiYI5z02CYKhjitAuCuUOBCEoc=;
        b=WEB5uDae+H9NIWPK0zUGkJj8ymTt8ROKSoVE1aHyXW6em+zOlvdI+3G6ztvnvyM8US
         LKYH6LwOdWSqJnzq1rtIQ66ysOe7m+gbqEd0JrkUndKiVcaHUr0cVvWVsorHjnOy6BaG
         CUQzHNyexPdCYWOkGxCAhxO0a3tp4vzUARTqZReb4zkF2SwtIbeksfAfEf4fGGCwo2S5
         63Pv/70PwlJ1SjB5OrlysxOQgLi3NUKMch0jjL3IQ6asWXDAO/qpJgTcn7r9iJzq0RlN
         XxuY0NK4rvHadRG2z24awdrh5QOBVSM12EQc4PhaebDXISj2mY8aixsMCPILKpE+avBm
         V9fQ==
X-Gm-Message-State: AFqh2koGkME2DbMVAFDtgHRU0H0DEllkZCGpiojgsD4go0GJpqGZ7SYh
	k/4ZC7PezioZ/UcorTVVBcN9eD5ZCbqfV728QPks8wNt
X-Google-Smtp-Source: AMrXdXtEKTgfBdzU8RnBLqlHx2o9Qtt4gNVzNkCpSRuUzxgiff8Xptq47MFnPNDlF7JlVDbLGBAo2Ykg/c/oJOQRRIQ=
X-Received: by 2002:a62:3245:0:b0:582:a212:d922 with SMTP id
 y66-20020a623245000000b00582a212d922mr736731pfy.3.1672921798084; Thu, 05 Jan
 2023 04:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20221213190537.511-1-farosas@suse.de>
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:29:46 +0000
Message-ID: <CAFEAcA-uYuaSfVBbcc2KNO_7PLOOSL5oTVOqYAe_kvTo6wJwUg@mail.gmail.com>
Subject: Re: [PATCH 0/6] target/arm: general cleanups
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
	Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: yWfYAeuR2fr2

On Tue, 13 Dec 2022 at 19:08, Fabiano Rosas <farosas@suse.de> wrote:
>
> Hi folks,
>
> I'm splitting this big series from Claudio from last year into more
> manageable chunks (at least for me):
>
> https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de
>
> This is the first chunk with only the most trivial patches that make
> sense even without the kvm/tcg and sysemu/user splits.



Applied to target-arm.next, thanks.

-- PMM
