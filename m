Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp138839lfg;
        Fri, 30 Apr 2021 06:59:57 -0700 (PDT)
X-Received: by 2002:a50:fe04:: with SMTP id f4mr6072650edt.29.1619791197367;
        Fri, 30 Apr 2021 06:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619791197; cv=none;
        d=google.com; s=arc-20160816;
        b=IrVsKONqyg8Cx+53lJdR1z44kirqti/RIVh1Fb3HylfMQKgCu/fGbx3loFB7seVHYn
         opLp6ldwrVlX4Sll7LVhOf6/xS/7323MZbU6BM1cvqUqS9UFERDwhnkptWNoHoM1eSs1
         J58XnCdeW98UkhPNxIkh0ylDdOxGLOnlkOahbd2IvPX0JcP60FDkzfwTccqazDc4ZynQ
         XQLnmMqaRvQ3U3r2X0Ifo9JnaWLzFNn7NAIdlvbrc33egVy6/bjyWrwAsN0kSHQ8E6wi
         OpHxBhiYvD0B2UGMvD0/WOfjA3yvgzsN57jBkn72llL3fWGTOdkyHVJyf2Q+ab2KSmLf
         MVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yh3myPI4YDfab4Kis5sDPDizWZ/yk+kn8pttN6/sTk4=;
        b=xo3JZ5jIuMjRB8fwH2ImrSgkSNjPz5jnHlT/v5JfoT5daUPOvgLL+kf9whjB+uGzQX
         GPzFvHjUBJqLhu8QOXEfYcELsaCiS9v6AqNLSxvi0ptuG8U4GA65KetS+WZG/ueMaa7c
         gyF46EWFawegvjK/VyUA61vEspXh5BgH6P76FAywPfHRk+XcBsqdMVvX3n5XpMUJHyX3
         YFIae0kPkolbm5/zz24NnfzMzQo0pg4DaOS9GqaxTRNeRC2FmCp0cyGjeEhb0nFzc5wD
         e/MY5OL2rkoFKVJ3q786SQh5+L8EwVb4RpDWbQNU2Awrmb4NGXlpcuSOSFcCdbKHVHeD
         ZV3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0Oosvuc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s8sor946482ejf.72.2021.04.30.06.59.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 30 Apr 2021 06:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0Oosvuc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Yh3myPI4YDfab4Kis5sDPDizWZ/yk+kn8pttN6/sTk4=;
        b=b0OosvuccrJE4nLv/FDDjd49qqyZ1bFKReVN/YpMzkh4vEWBh7BNQaQYIyM4xueKTS
         I3YRL+LfzL/y8OdkugCJGMFfXF2szQHr7DVVKiiQIWYrhTVUEAYZVXSUVTIjEH5HN6vW
         SVaR1aaElD/VtTDXo17WlUqHQtDvoEWRzMh+GgCtJ88Y3PkaHEoZQtOmMZvbPeK/KR3N
         ksMvQmDqPiKIpAjiVgL3uGqBHz8OktpUREJMKciLoUTpmKVRwFzI/vRhiNic2XkisDG5
         RGSP6//3eTlXVGl3cqsCEvf9UM4gNizjfo1TFKpmjy8sy+XnUN+ltX6EiofIuMVwiKQH
         UdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Yh3myPI4YDfab4Kis5sDPDizWZ/yk+kn8pttN6/sTk4=;
        b=et3wQXQOYNqxAr/+duB7IQ2qYXEMEth8eTdBUJJkUfJbNYq0YY3lP3JbOdeaM9DdTu
         akonhZBAt6V4dRXgov9RcoZ0lrKemiwNsB34U3m8JRhElrs/8CW8n/p3JbeDanz9GaeM
         9nkW7nLSVFhbNAMUapfOFlM5zLQwQ86io3s7yXWvFoEVCXAHI8pobvwxQuoyOX8XukOT
         cRzlyHZqhK9nM47yufuP8BpoeYw4364rkL9u/yprqxwS2z/Psvopr/yACljlafkyctx1
         zK/5YrGPA+JU1fGdpfFZnb+e7ke3fIKDnt3tIIwzz8oLRrOQApncZBG1rVkL7LdV++Zn
         llgg==
X-Gm-Message-State: AOAM531IC840zd9klOQ5R85JTgnv6gm2aQrcjT2ELLRcfr3dsK0MKNaA
	El/tHJx8uWJLp1lmcN/dwY5b9LKFsBvU6etswqTP9yyixSc4cw==
X-Google-Smtp-Source: ABdhPJxIayfhM47dZC1GoBPe2BTb1uKMvAnQ8kUI8ClIQ8k5Ihg5raA2hsiLL9pjgQUKUU0JCokkuU/94dWyVZybeu4=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr6141025edt.36.1619791197142;
 Fri, 30 Apr 2021 06:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210428131316.31390-1-alex.bennee@linaro.org>
In-Reply-To: <20210428131316.31390-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 14:58:55 +0100
Message-ID: <CAFEAcA-BRMzKG28c=4auWFV7A9-se=dw39n-Jtn1wY21jqWdyQ@mail.gmail.com>
Subject: Re: [PATCH] docs: fix link in sbsa description
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>, 
	Leif Lindholm <leif@nuviainc.com>, "open list:SBSA-REF" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: uTeIFwFrmEFu

On Wed, 28 Apr 2021 at 14:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> A trailing _ makes all the difference to the rendered link.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/system/arm/sbsa.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
