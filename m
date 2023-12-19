Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1755868eji;
        Tue, 19 Dec 2023 12:48:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8o3P1DYqJx/X2kSsolIZyXxJJwf0ENsIKJliDNCz7xD286YLyLIUv4AklJRXJbzm/2K7D
X-Received: by 2002:a05:622a:409:b0:425:4043:29cf with SMTP id n9-20020a05622a040900b00425404329cfmr21902258qtx.74.1703018896509;
        Tue, 19 Dec 2023 12:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703018896; cv=none;
        d=google.com; s=arc-20160816;
        b=HLS1ixCINrpsRuvW3rhEQB+JYmv6EIxRLzMFkt+YEck9+xIJP3U0QoUhIWO+RBPdZX
         1r0dA4pzIw215jpjHZLHXfNXeUeiERferzCJxLt1GiwG0itn1XpXt9mVAI6YlXG0wC76
         H6bmllSyTVRmU2yaF8KWfsfp5Eowh/K+yYa/3M0cmhZwzWdDMvNeK55Je3BhPBITqr/R
         /MhhPbmBhr2xZpnhiCDkKSucGHVirkX5GASHTyRKLIGONRR2uHg0WcKRNZI+TdD0/Not
         hEfSvtmMSR95mhGEHFR9PSoqG/CZb1U4fqqrnUbpmkt7qu8tidTVFsX2qhIXxjEspHlj
         0tuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wJCYvBT3HH8I8yaFEH2rGcknZmAfs5te3ASrXLL7BA0=;
        fh=2WHa1aBydZHOwlLWGyq1MgG017vpq3PjtKc+e48RhbQ=;
        b=ZHZRzdh3N32uv0X7NCre52moHD5etjuZzyD8oMQWS3wSci33jdI2N6l/wvcXL51n2N
         nmFH1U4KucMzm897sosziFbK3ZYHRQGUDQGQqquZkHx18FtqLNzTPM5MH5aXPUud5Nnn
         ucJiZQOui77v+y5W4KuCTD9HnDphyMVtSUN94JavdNQGh0g4HpCgRr0vFYQOMfNMvcv2
         qaack8LxryyiZskwRVY4dTtFTI4aE1xeZ74vL8uzti3nNIX0EdnLR6L7/4mt3VRZHKYD
         wltpGtQr5cyT/nyISRKRzq9/B2Wm5HDbzvqE6odgjDIfOam0vhdxB9tF6ezWRc2slg2+
         LjYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYQD0XFe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a05622a199100b00423a1af3626si17126518qtc.597.2023.12.19.12.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 12:48:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYQD0XFe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFh0C-0006CA-Kt; Tue, 19 Dec 2023 15:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFh0A-0006BH-Q8
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 15:47:42 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFh08-0000zo-RB
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 15:47:42 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54c70c70952so6257400a12.3
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 12:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703018858; x=1703623658; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wJCYvBT3HH8I8yaFEH2rGcknZmAfs5te3ASrXLL7BA0=;
 b=BYQD0XFeevMxGlX7cJSCqVE49tkTvVXbkOXPQhRtjSF/pSOi5Q7YVSlh3cog+YzCFS
 fKyBHn/ptDe6FHEBFEtMwUaHZms1gZy/Z+255MeQe7zoJ79XBE9Vnwjm9hewsUgrukpF
 idqUXTSKZ6xqmwdAdAQZ38Dunqe+WbAEPXRYqfUjjuwxa+Fxp844lf6nCVfYko/cf3mF
 NcW9QrQq7zYwUv71hpbke5z2vl1c4t8bI7Ay2cKxBHSL6y+nFPo3JJc31KfutBJ4AyDN
 AdFQT4f5BXlnc/xXous4DNo/o9X656F20h1icAjlWuvZi59O9LG3TmryzeOy+pqG03Pj
 jeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703018858; x=1703623658;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wJCYvBT3HH8I8yaFEH2rGcknZmAfs5te3ASrXLL7BA0=;
 b=PT+7qLsanAhu7wbSHMT2h07gi8GSeSDinnsRwFcyyY2dQDF19ShYeGf8fuXl1qjbuZ
 +Uk3WJRw69alkrvNd8Kmaz01grrn4LWD6RWp6oAyIX2/0sHh0d3f1BCX/+nkkq49NPOS
 BIaTRV5vELH5zSvNj6KDhHS80IlMbX1e2HOe6nbZfYl3C3KI7QhOxk5+IALcbemTZoMD
 WIEJjt6Lc4yWlUTfhZyHUrDJJzv3Vdxx1OJFsiM06qUp4pW0qEQAiM9e+n7oMT1cXIVI
 ZQqPSeFhwJP5tjth1/91SnpN572kqvBherl8BJEjGYncnXiB74EyVdOJMD4D1PNoHP/d
 l7tg==
X-Gm-Message-State: AOJu0YzwZzAbOjG4J+WlHfl/ZC1jkcWrA4Iyn7xXu+VBuMGIb9kMkxhj
 73jtOg9w5Qj+/qD/ZEExHxKIOdHIEBSPUrG5MU8wBQ==
X-Received: by 2002:a50:cb8b:0:b0:54a:f8d9:8026 with SMTP id
 k11-20020a50cb8b000000b0054af8d98026mr7034234edi.12.1703018857640; Tue, 19
 Dec 2023 12:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20231216182740.3305724-1-sam@rfc1149.net>
 <878r5tqnyu.fsf@rfc1149.net>
 <CAFEAcA8sTLZSQdqZmNGSv4yp3TZvq86kwbhU8gFmK2=j8vVZhQ@mail.gmail.com>
 <87wmtaxaub.fsf@rfc1149.net>
In-Reply-To: <87wmtaxaub.fsf@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Dec 2023 20:46:59 +0000
Message-ID: <CAFEAcA_Y-0mUrjapFPqigpfLhzKDf+G8_H9LVNBDS7Ne5UfUAQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add "num-prio-bits" property for Cortex-M devices
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 qemu-arm@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: wCNJlQLUjOUm

On Tue, 19 Dec 2023 at 19:15, Samuel Tardieu <sam@rfc1149.net> wrote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> >> Any idea to why patchew fails to apply thoses patches? The mbox
> >> at
> >> <https://patchew.org/QEMU/20231216182740.3305724-1-sam@rfc1149.net/>
> >> applies cleanly on master AFAICS.
> >
> > This is because you put a Based-on: tag in the cover letter.
> > Based-on: means "please apply this other patch first before this
> > series, because there is a dependency" (we use it for things
> > like "this patchset has to sit on top of some other cleanup
> > patchset I sent last week and which hasn't got into git yet").
> > So patchew applied Anton's original patch from 2022, and then
> > tried
> > to apply your three patches on top of that, which caused a
> > conflict.
>
> Thanks for the explanation. I thought "Based-on:" was just a
> polite way of attributing credit to past discussions. I'll keep
> that in mind. Do you want me to resubmit it as a v2 without the
> "Based-on:" tag so that patchew gets it right?

No, you don't need to do that. I can review it, and if it's
OK I can apply it to my target-arm tree, based on what we
have now.

thanks
-- PMM
