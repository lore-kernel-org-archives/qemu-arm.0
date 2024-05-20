Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1425508ejb;
        Mon, 20 May 2024 06:02:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBRWyZfjH/8ZRhKj0YlHTDri6CmCoZhTOmZBx0KaRuywB3Qiq9LuL06gJpN0LsuUvtuViLG0I2jLixE1LEzcK54f8twjmq
X-Google-Smtp-Source: AGHT+IFMdDGFDoiV71yQNnIS73f0/bYMnvXMUUG59gMhEX2zpdv9WRPYkGALPkSraDRPkdpgooK8
X-Received: by 2002:aca:1104:0:b0:3c8:6418:4cf3 with SMTP id 5614622812f47-3c9970b1147mr29693847b6e.38.1716210163407;
        Mon, 20 May 2024 06:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716210163; cv=none;
        d=google.com; s=arc-20160816;
        b=CpTjNiK3qaJimeFblHn7VjBL5I+eXLfx8Ed8g6j68x/CVpj4Rp6g21r0A9VoDA7S3p
         YjE7dXktP8oJ3HGimW/kZhUdxFJ0uQ6tcH0icEeZidi2vf1u1SF7Arvks1ZcjMJtWv8y
         ADg7kQ0KwqNtIXfrtSVNVJKcj1BM5i4X2ScTgKdmm6KI/NgWwQNBmUhxpW4I1s2DORtk
         cckeDGoC9wRq7LfgUjYM4H8fE/5Uf4gtpduH9NRulOx1T8HbXTHdtFUVDYpkbT2bMMNv
         otdaRbflv1gz7wNKeU389y7NChciiFduw7Q6UbjIVQ3vIDXvp712cUtH+ESeyNoLwHaX
         n8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=49yh7TWaV+z2ejbCoK5yq+N6NGqpKcGM35vvJ9nMAFQ=;
        fh=2w/bso+a3QZ9ChMsAQFosc3ITKuBtF++tm9Pvi+m0IQ=;
        b=XBgD6L7wnGWgoNZ8aiHv4Qi0wKu65zU/AAX2mhtNk4cp40qHQiq/3m7Zb8iXbQNhuL
         mGC/JLU59sn3jS/ukWQvUugl1Fxt8r5QRVhrJzyRIHt8XCp3+BGtlvb3ZTVhWO8EMFql
         tU9betaVvWiSBTGdRCyxKAND9Uqo5ige55amp+ypyaYth2viM0Uq0Zu0isfwBeb04q92
         5zmsws2ZABtMDdbDpFFXAD1Qs1OzPAuSuYoqFSvw+M/y/2awCb3GHssDbNwnKFgfSp88
         DQmZsilTikfkatTHl2I5bAKNuViiPY2AzzzE0i4koI48etsyEm4agt3qC09F7TEIlbIL
         uuWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/ghHjy7";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-7f8ff9ebc5dsi4711514241.40.2024.05.20.06.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 06:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/ghHjy7";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s92ew-0001BL-Ay; Mon, 20 May 2024 09:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s92es-000156-IJ
 for qemu-devel@nongnu.org; Mon, 20 May 2024 09:02:30 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s92el-0006OG-Si
 for qemu-devel@nongnu.org; Mon, 20 May 2024 09:02:29 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5725cfa2434so2377492a12.2
 for <qemu-devel@nongnu.org>; Mon, 20 May 2024 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716210142; x=1716814942; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=49yh7TWaV+z2ejbCoK5yq+N6NGqpKcGM35vvJ9nMAFQ=;
 b=r/ghHjy7zb9xZL/W4XgaRVDxF+OBxlg/9Aa9KckaAVcr4kqkT3Km+1Fb+xrWcBqWpQ
 bjFol/3BwBkRZsKBwiTIDcigIUCA1M0ZjZQBrjr5SeMs4Zs8hLOyQMkYXGyEQ6QwBwrZ
 8jjnOI01KpURh+DFGhYObsPx1ZGuW0cd539a7jEWksHruXSXhuzSqjuYF1BV2ss5h5Qe
 1VMCEeP01kByy4L3+RndlEhtdwsk6oms7iGuDzRzWdnJhyiBAMAdVNwa4QS5g+czTjZH
 rLjho5hIXbiynbOybbxXasH9wCWDjWW1pJM+b8ua/D6zO3J+v4VyUEESIm9DEVk0xqHJ
 ulXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716210142; x=1716814942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=49yh7TWaV+z2ejbCoK5yq+N6NGqpKcGM35vvJ9nMAFQ=;
 b=oBCLeCkL1yqHJvcp8iqr8N4WLdyhywSuOob7lGFhk6ofC0W9Vr6jFF6mf4yhA4fCDM
 Naq4SsHXmOs0FFEooCDYSuybt+58Gn1cmNLq8cVn6DBjU/Xxnpf0ZYyt4dPpQxqmEfG7
 x080JzgluSlU9W3d5x7V6GR4sIxETr479RdAJB4mlK0Fp5tLWm3d8i72mcENpXIfcEs2
 ymj73jH1k+eldlUCO/uQOPR2qp1jM3wl6P7+4oAn37RdFLS9jw53c3tb+u+OitBINJCB
 sZiXBbUtm31pfVtFeXy7H6HcEotiWPlt5GfN4fzQa+DK5k3W6VUACLpuUdfv1ay4H5bd
 9kSw==
X-Gm-Message-State: AOJu0Ywu9mJAIrST1VQDHw0t6qppttZYOZdPuW0TqSc6a1T173DccH5p
 nUuU7d0RPdKWLiSBk0WxwXCUx48JG3bpz15xnUfsYkqhlrb+B13k/PZTmgkviNlAmz9mvyxbJZ+
 B7gdFuYESD9eYXrOF1y+w+krjAmzzr/3PUTfjQw==
X-Received: by 2002:a50:9506:0:b0:572:5630:d8d6 with SMTP id
 4fb4d7f45d1cf-5734d5ceb38mr25411725a12.22.1716210142151; Mon, 20 May 2024
 06:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240508081502.88375-1-tanmaynpatil105@gmail.com>
In-Reply-To: <20240508081502.88375-1-tanmaynpatil105@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 14:02:10 +0100
Message-ID: <CAFEAcA_867TphLCF8NeG5OaH9cKwUQjMqXcT9ewgr1QSV57QNQ@mail.gmail.com>
Subject: Re: [PATCH] Fixes: Indentation using spaces instead of TABS and
 improve formatting
To: Tanmay Patil <tanmaynpatil105@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sMJNbv3iN0Zq

On Wed, 8 May 2024 at 09:15, Tanmay Patil <tanmaynpatil105@gmail.com> wrote:
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/373
>
> Files changed:
>         - hw/arm/boot.c
>         - hw/char/omap_uart.c
>         - hw/gpio/zaurus.c
>         - hw/input/tsc2005.c
>
> Signed-off-by: Tanmay Patil <tanmaynpatil105@gmail.com>

Thanks for this patch; I've applied it to my target-arm.next
queue and it will get upstream within the next week or so.
(I tweaked the commit message format a bit.)

-- PMM
