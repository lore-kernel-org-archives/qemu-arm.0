Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp99061ejb;
        Mon, 13 Feb 2023 02:58:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+t7PyO8mUakeooW+fRHc2KUvjcFIxx8lgEJ+9GUbe8iEkPIFjaKlwccOHskzV6bD0hAiRl
X-Received: by 2002:ad4:5ca9:0:b0:56e:9dd8:4803 with SMTP id q9-20020ad45ca9000000b0056e9dd84803mr15527965qvh.7.1676285899041;
        Mon, 13 Feb 2023 02:58:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676285899; cv=none;
        d=google.com; s=arc-20160816;
        b=aozdeOGniW+UpDfqv27NDdWkIe70ujlmLlavfimjubmSuhsqbpsXJWj/JgeV1l/CBv
         OjxdcpblWxmMfMh0laEKXauO7MykLngIA1CwPZrzCLph/oey8yOE9937Ibguf3X12X8F
         9OaIu5iX6x2Dg2ys8BpdvnPJ2J3L+g0ElUOZwmSHhzV/1JlzRtKJsjoUICS3MRcBqdrA
         rFNBq5xM01k6HzlxZ2Fk93GA1ocbK6nd3UGKCkVyywOj26zMhTa3Qu6oPDZGUjl60BUa
         wVOFTsakJomaPLXKwg73DO/SNguuDQw1Rp07qHU6wBA85T5M+MD2p2g5SMNW0neZVJ4/
         GNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tRDWDjmG7UqYnK4/S3DiaKX/55SL64JbhGOEM/5Ri00=;
        b=MDPtHQfUKNrmYUDbpLrHQxinPdZJl0KjAReFSmOYV/oDm/Ub+MpY9/6PNCy1aWZqFE
         Tf+DHkJgHzq7tppogS68mXuahBq1CjBUiNDNKRBDHb1Lemv0lf3x11ZrvJDVz/1sIyg2
         IlRz8t6jAYCyZNjPVGjkxON5YYa/2uMbEtSXEWBraSenjq81He4+78pzHTEoQ/epw4KK
         z78ujJG/wSiApLi+kcrx9sAfcVR3LhNsMtXcL164pc/5KqOthavHuZINGuPzOafgQEEX
         ti3b/zhWsudUW/QHmCduOxBzY9rBzPBrIpn2ol7yeGN6aOORKNwowHPVSx5XtWha6ZGT
         WNzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GV2jFpiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05622a164e00b003b62fcc1cf8si10209100qtj.699.2023.02.13.02.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Feb 2023 02:58:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GV2jFpiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRWX5-0001gf-Tl; Mon, 13 Feb 2023 05:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRWX4-0001fb-FC
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 05:58:02 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRWX2-0003vO-Ub
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 05:58:02 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gd1so756873pjb.1
 for <qemu-arm@nongnu.org>; Mon, 13 Feb 2023 02:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tRDWDjmG7UqYnK4/S3DiaKX/55SL64JbhGOEM/5Ri00=;
 b=GV2jFpiUF7/Sf7lBaEvH0+vNdjjJ3LpPwGm4aQnmFdrtb/a9WEQhx4Fu2+mBXCvtgT
 KD9oYQoycG0k8o4JOSRZfAOZ6g1846ZWwzSMR/Ts7IgS6a8dSnmjsPRSK0z68gR1xDb7
 l17WzJHb3jhOiIkMQgQ8ul1QloJGPkDp97jNlrVNsItpgfcL24FHtK87KEGiM+STk+0b
 UOFX/MrtvH5A6adk0eRJUdqcIm3Y9+wg+NkQ967RFgWEb4nuqz0lYnJkm/rLOuBB6gP1
 SF3kSVZ1iyTGbbFMzWGaAn6Y/JWEvgjjCXih9QOsi/14ceiGHWgVSuABT4EkvSvRfGeP
 Y+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tRDWDjmG7UqYnK4/S3DiaKX/55SL64JbhGOEM/5Ri00=;
 b=2JroPSOrzk86qsTa//I5t4wk+m+CeaQLaWYNujYNrTztNUarBmJf0t7nQck/gF7axJ
 sDkkTL2FPhc7JZxEhWo/Ov8S21G3+F0/8X2gLb81b/b1Tje/fgP2zP2ydmqEYpI4Wxjd
 6dMiqYMXQ3b38I9jd0aZWKuHLVmLMGssW36RsRHVkehmad4AoAe03lKdMl2Wb15xP78e
 BoQqQSHgf85rM1LZH7FOyQpdCsl34gZfSY5d5BNkBK9Yq9dvFEqD4bfo8FTY/Ubz+lQQ
 qVG3ri+tCwkAdUGqELaKo3NCTFg9x4ncBNXE9eqpYx5F2NW95SAcxuJFlUP1dsv6uS+y
 0h/w==
X-Gm-Message-State: AO0yUKVBUiPzN3dLn/pTmvXdfADgMyG+PWPlr2ZvIGFxUNTVTMhHZzXf
 njIegKczrvy0GoC0WoZ3smjrgbyKjcfF3WziUHkTbQ==
X-Received: by 2002:a17:90a:108:b0:233:cee2:343 with SMTP id
 b8-20020a17090a010800b00233cee20343mr1326094pjb.53.1676285878929; Mon, 13 Feb
 2023 02:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20230210221951.1298668-1-smostafa@google.com>
 <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
In-Reply-To: <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 10:57:47 +0000
Message-ID: <CAFEAcA9iBui4zHCo+4b6o6rTXgQ=VpNzWUUTZmv_CR=cxWV3gw@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, eric.auger@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WJEyCOlG37Bc

On Sat, 11 Feb 2023 at 23:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/10/23 12:19, Mostafa Saleh wrote:
> > @@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
> >
> >           VMSTATE_END_OF_LIST(),
> >       },
> > +    .subsections = (const VMStateDescription * []) {
> > +        &vmstate_gbpa,
> > +        NULL
> > +    }
>
> Actually, I suspect that you need a pre_load hook that resets gbpa, which will then be
> overwritten if and only if the saved value != reset value.

VM loads are guaranteed to start from a VM state which is freshly
reset, so the device's reset method is sufficient for this.

thanks
-- PMM
