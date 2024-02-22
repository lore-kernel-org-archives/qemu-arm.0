Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp43012ejf;
        Thu, 22 Feb 2024 08:22:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXm2nHv/XBZId0wnK7mKMDJXgTTA8OvwwR/57Tx7JanG+A1O+/3d7QFbE0cAXOZ8f4FjbjJby02uQM/3HWgN3USL5sHJns6
X-Google-Smtp-Source: AGHT+IEUN36y8nMGiNM0VE+zj+gA3o/Fw4WHN/zMOyHjcX1H9NteDMvnzSu32KXdbVPrf/wX7dPK
X-Received: by 2002:a05:620a:610f:b0:787:4e6a:4ed0 with SMTP id oq15-20020a05620a610f00b007874e6a4ed0mr17230216qkn.2.1708618976663;
        Thu, 22 Feb 2024 08:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708618976; cv=none;
        d=google.com; s=arc-20160816;
        b=zkDDk4dIZUL0/Tu09ugtNqxwOJmvSnez5/VZq3MWAOZ0VLNek9NovgASXBTVkG/W0J
         881ByGfYlF6+Fn3a/wlOpOjKgGqzKyBwrxFxgUBGtD6Vind5oFIAnac+qp1eb2SJxZTu
         avpaur+wdg1k1AEUpTRFBz1ZYPWCA1dAY0BtaIlQf0b01r7wZw9t+Npo1/uwUIh60+Eq
         Xl8bF8HfW49TuPsbVoSmfO/+2qRg19nEeIsas6oE+CdCfwXWWL/bemlAeH8ihNOxoFLu
         18qD5pNkCVni/Ij61xhXEyhRDkSZropxtR8cOe4AKUExP/5GMK0rXn0/4CdUc/QZDdO7
         wM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8pBG7l/XuxDSAATZdauPDIwLeX6LrNnMLPODy+LAl0Q=;
        fh=jrXTaT3sPoFNeobz2cPYY0sa9MRMSqgcuVn1lEh5BqI=;
        b=zAYorc/WanLAlUPgcobDvZ40V0KrX1R00PzsGqjzNG1DoMEEXDzr3TJzvU9rRed6Ez
         1TYAd8k8GcsHm/0Kl1estO9JxX91NywWT5dfRYMIuk0n0cTHAsRMZhjlbZW/HSTdXyYS
         YwR+Q+3NDNEWC/vutSLp5PgUgDo7sRhI/g2mDVuFWUuhnGYCNlP4kblIt7TogWBQn5/G
         EgtaxcEQsnxOLm+zy034W0uYOZhLLV3TP4gcCm6aU/4g0rKE1wA2IRf8EnleVr0UJLS+
         vA3BjF3lnO38+CNLjZ8l76qeNFu5MMDuuI2tezS8Ku9GSVryW2SG7eYgKr/R6QDvuJZe
         knpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eyF0wyaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de40-20020a05620a372800b00787a63f79d5si962372qkb.657.2024.02.22.08.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 08:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eyF0wyaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdBq2-0008BS-H2; Thu, 22 Feb 2024 11:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdBq1-0008Ah-6f
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 11:22:21 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdBpz-0006Iq-LY
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 11:22:20 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5645960cd56so6669088a12.1
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 08:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708618936; x=1709223736; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8pBG7l/XuxDSAATZdauPDIwLeX6LrNnMLPODy+LAl0Q=;
 b=eyF0wyajQKzxLGTe+G7fMgUZXXxIhMx5y/VkSIUciAvbDoJThv+e2bCk+J8N+PyGKJ
 ZO7kDkZLWNI8xJrXqdiBYw2m6CULH7cXp/cOI7zOoJMDgd+7wjyYYXmXztekdTzc/b8Q
 +iDv/3Qb3JWgyeiD0wUScmm4LlzlOLj++CbJy2svN2U9YaXcStLdEqNDPpHgcvJFR7gK
 dBwasF56nsleEYQBZ1S+SV74MmYXptjvFlWInk3iKgFKmwdNieGq0f+9L7VzJQ9lz/0G
 u640NYRt1eKl5Gu6PxRiUqGxGnvLdY5DWmBUuTHN61Dyd4Wwt3D5K7eVchEm/02HMWYe
 O6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708618936; x=1709223736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pBG7l/XuxDSAATZdauPDIwLeX6LrNnMLPODy+LAl0Q=;
 b=tBC+NQKPp5Oy5zOb3UbRIQdBnWetAoSRqDQAlHbPely2sXXpDAQCqYI+A27RhSMagX
 i3rag8iOBCEte+gGqIeG8CfO8X0p/13SwuPXdZFiao/KIgfZirss3wtuY7SsgD/0IlFr
 7TqsZDxFP8mavj4+zUo1vKaBnroDz3IPeBgeLGeghq65hLaZqOtJ41vseLSOqNxYQntM
 qnoZwbyuevUxhsdAeivPdVn4CVPdzpkVJeyUHT2qbi4W3zJbf8dti7X922vJKOtSquvv
 CZZ7fJ8A2dPnMKxf5d7OFdQY2gPnQeBLlndQ5RtfbxoLH0SlRzHEl+pCDHppwxFOh367
 YY2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw6J+9nJFBlfHf63T97+NXuCR5TefDG6c11h58VCpMYU0BSgR3MRycTTWyg78enpygZ+j7dlE2cA3XLjrtO1rdFXyw
X-Gm-Message-State: AOJu0Yw0w+ukvAnREjd3rwGscLikSFxu/TC6cEIBPsguXNCCMmJt8n1u
 KbMv7ys3oFCvo4CYWNJggPaseHJJtxU8dZ4dDKVusZj6f3hccmKHPk+9v4sbpNBEtyO9TNhmiMa
 zweYjq9e9t2DoSATiDqFNFTCjmmYdbo2FqsuKQw==
X-Received: by 2002:a50:ed03:0:b0:564:7350:cac8 with SMTP id
 j3-20020a50ed03000000b005647350cac8mr8126183eds.15.1708618936163; Thu, 22 Feb
 2024 08:22:16 -0800 (PST)
MIME-Version: 1.0
References: <20240222000341.1562443-1-jrtc27@jrtc27.com>
In-Reply-To: <20240222000341.1562443-1-jrtc27@jrtc27.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 16:22:04 +0000
Message-ID: <CAFEAcA-yJyfHdp9OPTG+iSduoQC6nAmWMbTgzcHvxD7pewAdqg@mail.gmail.com>
Subject: Re: [PATCH] pl031: Update last RTCLR value on write in case it's read
 back
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RxcnRjkLdLgf

On Thu, 22 Feb 2024 at 00:04, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> The PL031 allows you to read RTCLR, which is meant to give you the last
> value written. PL031State has an lr field which is used when reading
> from RTCLR, and is present in the VM migration state, but we never
> actually update it, so it always reads as its initial 0 value.
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---

Thanks for the patch -- looks like this bug has been present since
the first version of the pl031 emulation was added back in 2007...
Applied to target-arm.next.

-- PMM
