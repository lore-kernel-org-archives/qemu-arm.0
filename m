Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1157042njx;
        Fri, 25 Oct 2024 08:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlIJlighOhu2A7KJZ8pYi0DFQYEX4YBArciBQ7sMhkGTXSXSx2x4i68L8wnhWVkWgQHZJ0ykZtoOFBiA==@linaro.org
X-Received: by 2002:a17:902:d4cb:b0:20c:d18c:1704 with SMTP id d9443c01a7336-20fb99ac232mr86237685ad.23.1729871691271;
        Fri, 25 Oct 2024 08:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729871691; cv=none;
        d=google.com; s=arc-20240605;
        b=kb1l8bPZ+GrV9g30ZEYOQ7jLKgEcx36EDtdTFoA8I4yGUZyZCxsITSOkxoRVcX+AO2
         FA7pVDjLgTerzDHn+pkbcF+HDQie+mH4RDqHdoxwkhiItJh379Ln1gVgc//UtyXlvWis
         HVXgAm2722TFw9mAPZniw+/4ptSonAO3EJ/DbisnPqVPU8nyzoIAGfazyOjmX3ufGHml
         2t5EwiaXHGWvK2kB8czoFa7RiDTG1SI/o8okgNhbYEoBtpguXLIj4oY5EpvMhvOM2CNh
         KMO5yQL/+vkwFGQ6oj7BAMk0H5QVDuoM1kDk5WjjVpcONbX2wkhwN1/8fy6b+n5DGOHm
         KKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmNitsDmnY1x5cCTcNSoGI3ApEz86Deu5rvkm83X2t0=;
        fh=7a64mEELufwHM0xF2AVaDUrp7yGHInymTwrzpUfd8lw=;
        b=QnWDubdB79pYh0jWS1peLcA59LO49GqjW5cvqTOgynUIgJ6dV8qLQDbnQ123EGRQ9m
         8a8pjp+eugrc6NpsDUdqjXr1+ZPNCpK8EUufQwnK6Qz8RPr9k5tV1gXstgS2XQpkdbuQ
         Y0fYBo4LDV++m6qb52V9bA2/f/ge3UbiQhZcQMINQka4yKsWAGTR45l6oDWlIGY0jl8d
         0uRnHo67jJkoEBIxrYVB1jt3d593cxXcdQGBSn/TAWKQnavK15GBaaJPwUCk0Ttn3lyN
         yWDdeBJX5jB9pokDVMZ4TpbxqMxd9NU6KDECIrYrl/6KtM+Mbhlixhr+lc6TgZUWOOpW
         HNLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnro7UOn;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <jcmvbkbc@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bbf6bcb4sor8629015ad.10.2024.10.25.08.54.51
        (Google Transport Security);
        Fri, 25 Oct 2024 08:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnro7UOn;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729871690; x=1730476490; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmNitsDmnY1x5cCTcNSoGI3ApEz86Deu5rvkm83X2t0=;
        b=jnro7UOnRbEt+RvOBDt2mJazOl7FTj8ulzclmGs0BlC81BhVs9us8ReaZWD7EpQNTe
         WQj7V6To1q9xdlbWM9+H5crhvnvbp/Qx70ol/SGZ0N6a4VERAmpE89Y6Rv1xmiQLmFaA
         XzSVGOnGYJJ3/Z7641hY/wM5RDUQJZhCHzStXzsGOi4M01fmA4EZmCbBXWjbSUC53J+g
         fM7Bl+FpmkwnAXzQKEt+jtkQHG0pkfEDc2vvyqNJUwepjiSSIUJrfY2iTMzT9NVVbf1+
         hbosgR7r+utMeJFet8GeiBsf5ji17xlQ2iBz4sOi+PH138sc6ddEdiMw3w9NQUWJJpoL
         0VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871690; x=1730476490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmNitsDmnY1x5cCTcNSoGI3ApEz86Deu5rvkm83X2t0=;
        b=hs7O456w0ixIB6YVgMxy438GYJXEEu2kppZNbSscEXcZy0C6IMHw+jcY2wRrru2mkA
         wYVQ1xjv3eXo11QtGy0OJg37UWFUVMiwdAaT4MZfkRqmw1m2Cyx/8tTmK3wk+uC0ry1K
         ybOi5fKK6gyl85cQqka1KauAJeTOkfeHcpfZ46YGeLeM54qvTlEvB9PhC8ovXg99ZFfm
         xKhFB/GEPTE1SolrS9wOYEzgMSbQpMonw3yIUaGszu5Xjr8IQqZENVQhEQ7MQUMOJ3np
         MlohnVUrmizKwmvbr97Ue9HdG3A5IOUp5timRo1rGH1H8CI7Di4Kw4nMgbvG8+lFPflg
         +EeA==
X-Forwarded-Encrypted: i=1; AJvYcCUk8J1+CKoRboqoHpJdLH2nUCIzJ/07kmfjK/kXYIKEvg+SZPdrq+CqhJoKgvKViQhtRC7pqgUdZwoeEA==@linaro.org, AJvYcCX8yqjUM9anp017OdaQf7to4HATf0n8rLC1XCvD2Cd5/ekPDjFIvhcMiYuqNdyPOdSgiyQRSuxxM01CPI63FPjMy5A=@linaro.org, AJvYcCXiXI60zOEfo19URegkPF6byrhTLVda8L7UjgFmXIERA0S1BrH/vNE24TI8gpxmPjFM0Z10Eobn@linaro.org
X-Gm-Message-State: AOJu0Yznk3Bxw2t0zUQVcHlgOD+HPUEYyOjAP7tFcp6nitJmf4bfAyOa
	viD1R7ZOC05EWcioJfgHZ64kh7kpZVXAH9tnXUfXpF1W2d2HkSFXZDdup5EyFtPqDBqvoK4GVlr
	j+nH0k3QZvolVijuODiJFgX9oGEkBp+0Z5ZY=
X-Google-Smtp-Source: AGHT+IGmgu91ap8rnjy5z32bZYwPYzaTfW/kM34EqlqKrDdWiIg1yZPUxZYNjDPDBtvD0kjJnVbBMIcsPBNNcTN0mRY=
X-Received: by 2002:a17:90b:110d:b0:2e2:d5fc:2847 with SMTP id
 98e67ed59e1d1-2e77f710f93mr6733204a91.30.1729871690074; Fri, 25 Oct 2024
 08:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241025141254.2141506-1-peter.maydell@linaro.org> <20241025141254.2141506-15-peter.maydell@linaro.org>
In-Reply-To: <20241025141254.2141506-15-peter.maydell@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 25 Oct 2024 08:54:40 -0700
Message-ID: <CAMo8BfJT82ztbZfHwT8UkpJpaK-4H60MwOk2T_F_tptnLg907A@mail.gmail.com>
Subject: Re: [PATCH 14/21] target/xtensa: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand <david@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, qemu-ppc@nongnu.org, 
	qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: U57bqHnsEREC

On Fri, Oct 25, 2024 at 7:13=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> Set the NaN propagation rule explicitly in xtensa_use_first_nan().
>
> (When we convert the softfloat pickNaNMulAdd routine to also
> select a NaN propagation rule at runtime, we will be able to
> remove the use_first_nan flag because the propagation rules
> will handle everything.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/xtensa/fpu_helper.c     |  2 ++
>  fpu/softfloat-specialize.c.inc | 12 +-----------
>  2 files changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
