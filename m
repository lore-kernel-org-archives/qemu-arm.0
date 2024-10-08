Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp213065njl;
        Tue, 8 Oct 2024 07:04:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrdNwT4r3RN32l7U4z2xREzAgs2MFp475CHFjXCRrgeycZo1Vepvl47Qvm3IJkHpX3xbeRR4GoEkz0fw==@linaro.org
X-Received: by 2002:a05:6512:2210:b0:539:9ff9:5c9d with SMTP id 2adb3069b0e04-539ab9ec57bmr9133337e87.52.1728396290512;
        Tue, 08 Oct 2024 07:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728396290; cv=none;
        d=google.com; s=arc-20240605;
        b=ZWxrF/deXlKpc8TPd2HfVoV+yt8R8FX+bVYKy7Qz0dymuQP6Ey3yzdJaX2SNFcbxEB
         eernUFefm1bomYjcrS7zK4y11zlGcFb/GLcVnN8yafiZSorEb0EsO5tnPEruNfVx4lk0
         FHbAK5EX++jZoDDa4eanIvvZp4ule/FyUgHGeC0Rnuew5bwtmdhgIGsbYshn+aMCAa06
         7RzzsD/LADw5fJ5oCzZnSjvrfEW81wZzYSJGZq679K5TZ4HfDQwQb0pHomq9sIni/rH3
         ehjHrMCXwmFQ9HoFj3WHS7oV+xhxs/e4kEQjDI54ZvEYyUqhvf2AHfb9IxrpmbmQsO+s
         Yb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qlZ7kynNNkwRnX79N2/XULKM6T4JjrNnGdfb2QLSUeM=;
        fh=poi+hRbcVibnPy3u+VzXEyEhPtXlj2dj5L6PS3K3MBU=;
        b=WAhCctgwNDSYaH+xPfX5g3rd7lqMTX9o7Ivl9ga4HOXlQ0ppgSlN44+jkVnc99Qt5O
         nya6wolbMMqOkEccF99Z0ZC3aDjolem2Fr3DrYqyoP9Mo5bAFFM8eRVIPRwC8E08pF3C
         SB+zcRN+1URTO4eDkAVTFgH92DP9m0O8QcSph3oe7mmGkvsUuUbNdzpWvx1+HxqcbbxW
         eyvYkDexrMVRVyrOD8xUfj7h1ZmujWb74WkI2lMEb9ninV3Xsn59tqpvq9oamMSG9aea
         I2EVxS1STW0aquphOh7p944c4Eqfkw2eA6vbuM0EKrwHHV1Y2T6DtkvVHWVoivez3vYF
         4TuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ta1QYdWz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-539aff1e800sor1915759e87.22.2024.10.08.07.04.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ta1QYdWz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396290; x=1729001090; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qlZ7kynNNkwRnX79N2/XULKM6T4JjrNnGdfb2QLSUeM=;
        b=Ta1QYdWz3hPJ10HFWFd3SRAeKuIhHKxhxbFUzh2MTkM7+sXoQgtKk/SppCcU019CuB
         zzm0I8dfvvfWVq2WBUUfxsJXhF6a3X/Ea7jAJG/s/nIAN+lLBFL8dTGtsM5YG4fsP8ER
         7+pcDdtMnm0vToZGRtcxyihngULFfaA/3sUNIy2GBPpWtlPjZ9sZ0nbAWzgSg2qeRgrv
         QEHRqgDfDkhwFy0KgW0G6oGQyrpSc7nYSVFXmlghs0DuReSViMKkpgWB3OMeFzqsngnq
         Cwckyt5/oEabr5gFUyiiTqQvVgzEmQMKHjv1N152jynWws0tqih/fGpnErER7alvBwAg
         IJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396290; x=1729001090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlZ7kynNNkwRnX79N2/XULKM6T4JjrNnGdfb2QLSUeM=;
        b=mK1nhHK1fOGi7L0L/3SukYdUM8Hl24fIiofmASJCrvLWPOQE5AJfQvHsUzHhWWpFgd
         /tfjbFGVTx7C8XGgN4bnA6wloOkkAAagi1JnP4VAP+45GuAZVg0er72K3Idc5WLlC/XO
         mS8eLlUSjnolaNd/S0+SS4c0aBHeUQmf2ywoZFtXkObtZjpJos3rMN8b1Mbpb/BFFsTI
         E44BecX3t/Mozc7gODQiLjE0NF3cDh4fTAVsZHzSbjO9DXOW8s/Zchif1FckxfNg4f8o
         ktFLWm4ahcUEJ+EVvm+O5Q5dfY3dpXjnPqInKxvs53HTpq45TrFe1Qi9RCLkQy62SQE1
         8eXg==
X-Forwarded-Encrypted: i=1; AJvYcCXyjt9fn/0rnOKvKTroVxYQfxnS3WVPSYPOSIQUZ75HFl8BCpyyizoZnThf+TYXTNSR7gee/VRXF24RoQ==@linaro.org
X-Gm-Message-State: AOJu0YytWuBobE6exoAbDckn+WssbjwfyTgjZ1hp9SIushdxCZiBVUur
	BShf0Am0rtqv17tf/X4pwumr8o3UtCrNjTHODlLZy7q2uCJx5t7cvLvVISKpb2cD1LjHYt2UlhQ
	rtvjc/a1bnqJdJSCisJswzDwNj8TvJbSLwohyPe5M
X-Google-Smtp-Source: AGHT+IG5RlYXNeodhVLGDi/7fTEdmhf55OOWgTnAe+5B6xjOHVP5BpVmse45R1Lu4UuYqVvHbs+dftA15Kb4+IdNUoo=
X-Received: by 2002:a2e:a584:0:b0:2fa:fc3f:d606 with SMTP id
 38308e7fff4ca-2fafc3fd7b4mr57722201fa.22.1728396289753; Tue, 08 Oct 2024
 07:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-3-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:04:38 +0100
Message-ID: <CAFEAcA-RP3ap-ofbxFZbLuy0CXeDJQPYSvv2SAkJ-1LvtAQEWw@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] accel/tcg: Expand tlb_fill for 3 callers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: NGHl+kd03TJq

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 33 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
