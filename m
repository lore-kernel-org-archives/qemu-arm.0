Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1302243ejv;
        Fri, 22 Mar 2024 09:40:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLmxycNH5R1HeOgrZi8IrjyM6o53zEkRvjFpY4plJ0RNHMLiJZ2JrLlcmkRap50Upt34voSQr1wmxazAvs4Q4zV6Bslawk
X-Google-Smtp-Source: AGHT+IHxgnfcfN1Bz8jYPPr2qi7NlyQswH8NqrMq60Aym6/C9/OEs9pY7uPY+0JFCvqHHOmdMVzc
X-Received: by 2002:a05:6122:3904:b0:4cb:56c5:580e with SMTP id ep4-20020a056122390400b004cb56c5580emr191913vkb.11.1711125622016;
        Fri, 22 Mar 2024 09:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711125621; cv=none;
        d=google.com; s=arc-20160816;
        b=MbcuQqUHx1gm/HJdlJXlHyYfjok7VWcDiee4OUAG6O6DOC2gA/vvrRi57R5aIeF/9h
         9yB3QJQ1sVgZLU1gABSg+WOB+l8WYIr88odJ3flowLwmVH23hjRXeSHrenOXaHbuFslA
         2aX+WX1djoUbaqkAKPmIE4Q4nRU+ztN+5cNL6zc29Ct02Fo4p5Fykk1KxBVzZYcg6yob
         5/YHgxYDtAUKvwmzt/e6d1/CUX0ro2PP1WUAhGleRKk2a0AFm4baPAOiEy7q6pwlCRRV
         HGb0kAvJUdK0LzYn+BFnsD+2gX7psPwHC+FsCer9em76pf1QbCP25Ld2iOo3Fy6kgjv6
         R3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uNeR5/Qku60sNPGCrf+nb2u/H4CBa2VUeW8ba0w9GpY=;
        fh=UaHKk5gOoIKGM222hKVwlHskBXLefmk9C3Vb+rcoSho=;
        b=s/ajkegx8ZKopy6iQwyqQ1SWhatDcFU+DRSOEpVmYXj0TqcBMKiVZxAroqqzF3Ah+v
         eAd1m9zUkqEGZ7nRCRFhip5p+xRsu9xhNNaYFW0uh7m/9k8Pu4u/DvcXYsfFLWCy18kh
         8xhujVBXrpFG7vMut10EnTjYGdcasOTP129aavcPkkYFd8YpGNzAK5wo78SQNcuE0AlO
         a0qlQHV2jfwkV0KPfrCi2Qx1L4t9Emk6+q/WppglCuid5tK4psqhr6hdd96cIZPf3NiU
         6DsWtTK0wQwhVYwuDT1R+SKkPOZCmGajsAclawBfmxBOfnh820VwOs+oOx1EC892w9eQ
         sHgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgCqLlML;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a0562141d2200b0068fe8554c3csi2352416qvd.86.2024.03.22.09.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 09:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgCqLlML;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnhwG-0007Ed-Nu; Fri, 22 Mar 2024 12:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnhwF-0007EA-1u
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 12:40:15 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnhwD-0005oF-Il
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 12:40:14 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56b0af675deso2945609a12.1
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 09:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711125612; x=1711730412; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNeR5/Qku60sNPGCrf+nb2u/H4CBa2VUeW8ba0w9GpY=;
 b=tgCqLlMLXxTL5IxQBIX/YuhC0Fs8Jq7AZwck6KivrMwWeSycE0RqdG8DDgL+6ef2zE
 33bmMvNIQQRckHdfJCDNw26FuZ4/jsHfDf4PFszCBpRI48pPtnVTOsOHu7xdYi5wyugQ
 HxEbNT0eNqBNV7luWgK9Q686+R26DmsMXl8J5C97zB/ci+H3BIGghlO4VG7LwAWEzUVF
 GJO/6mKqW8GZqY1OhOe43o5SChiW3w2KMqkEHknKUXhsNd+yyuCOwU8Rnr425QZ9jsMS
 YiiOl9oii8iFPgx0aZDAX54ebEKWQwpUIKNQ8p56VzvkKuC8IblDvlPH7T9FHZ9AKvcE
 ckjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711125612; x=1711730412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNeR5/Qku60sNPGCrf+nb2u/H4CBa2VUeW8ba0w9GpY=;
 b=tToW74qJcvqSb11J4cyEC6Ul6WnPI1vpJy6DlScuqFYIV73Ucy2Ae3uESNrcYmdGpb
 Uh5l41HUHeGvYYDjFByAl+ewXWob4HAy2ojjzkJEfyiPPq352137GjIOaRomc6BPrjhH
 tLX+Tte90uQZSrrNhGEcCR4gMQSh3gs2f6f6PuQaBp+H3ox+h+NEHaoYpEomx6Mm+9Ac
 EJcf7cZBSLAFKOyQXqUOinSTqUNBKqJInSs2weCMM8n3SOQwMyDqUKrkJq3qFKJO6rVu
 LNCdLZcCnqqd96X+OKNX2oi8LDCba8L05kK73r3yFa14PyqrfXD8Vdu5cp0MQav3dz7E
 CjXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdf7z1fu3Jb7875yAubHMjJXEaNhZgZvP/wXlGRvJ8X5vNwKdvRFJiZXWZNnVsYGu4Wvw+BsHEeWnGWTmBizN/m7VY
X-Gm-Message-State: AOJu0YxmX6pCafzzu00yeFFKH47/W9b5dp1YVv5PppcmROeIPfPl4fTD
 ckOvzY9KvA34VQZ8D/oL7Sq/pZV+Oo4HhFLFvmlRVldpfJFdyq1nk5/ph8Vn9TDFC1CKPAVD5fS
 aWWIKDFv/MidqTjTF7K39lvbg8fETrHLWfuGhyA==
X-Received: by 2002:a50:9ec2:0:b0:56b:afe0:3070 with SMTP id
 a60-20020a509ec2000000b0056bafe03070mr38680edf.19.1711125611880; Fri, 22 Mar
 2024 09:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240322155810.5733-1-philmd@linaro.org>
 <20240322155810.5733-2-philmd@linaro.org>
In-Reply-To: <20240322155810.5733-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2024 16:40:00 +0000
Message-ID: <CAFEAcA8eES_5aeEp0vDs-nMdsbZ7JPodfTG-cBhtc_+a9rL+Uw@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 1/2] hw/clock: Let clock_set_mul_div() return
 boolean value
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Luc Michel <luc@lmichel.fr>,
 Luc Michel <luc.michel@amd.com>, Damien Hedde <damien.hedde@dahe.fr>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: v8uiaheiPdmU

On Fri, 22 Mar 2024 at 15:58, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Let clock_set_mul_div() return a boolean value whether the
> clock has been updated or not, similarly to clock_set().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/clock.h | 4 +++-
>  hw/core/clock.c    | 8 +++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)


I guess this makes sense, especially since you often would like to know
this to decide whether to call clock_propagate().

We should also update the docs/devel/clocks.rst to mention this.

thanks
-- PMM
