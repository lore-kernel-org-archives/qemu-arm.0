Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2161097ejf;
        Mon, 26 Feb 2024 08:25:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSwuAEoYL55ZFx+4/WuByajiUyy4hj3mW6oCp+tlhdlZL7tB29pNrYyO2kJGgly1A/x4HOoXTQXX7UBjIoC1qM8DGtDSR7
X-Google-Smtp-Source: AGHT+IHr+DO9Urn0R+UtYtooirh4RZFhUZUefAcsf5E9k2NFgTl+y1BL58n1IA4I+BJGPvow9C4R
X-Received: by 2002:a25:b499:0:b0:dc7:4806:4fb with SMTP id o25-20020a25b499000000b00dc7480604fbmr5434407ybj.8.1708964718477;
        Mon, 26 Feb 2024 08:25:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964718; cv=none;
        d=google.com; s=arc-20160816;
        b=RQH1MoX6VMDqrgC4TRIIUZtxIq/ozdn0tKSAmOnwZk5wekxBHZpXEyl47vh7/Y+B1F
         vlMtYofKIQwfAEYMcEoBzmwXbdlGMH20yElz8tRAMSryGSC6O76oMg75XSwtzAK0PQyp
         1Oc+wLmaQ8TfwzOyGOwIiBsMoh7VNbmMwTOdM3vMxzHQmhy9gGr7lgXla7Eo9PCBujQR
         AxhVvVLeBBnCZWTO8FL2y7KASe8HqVee0FiBis2+2aMJw139T7oUpY0ET/mJA0EJHX0F
         86+oFzGEwfFJJAjYujoTc3Y1lgRk1Uu2h2P6jeSwANo4eGeH9UoaMFs9qrNNL3RaJs2l
         K+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=k7GJMaif4C8touOdi6/5ipo4KREU60REdl/IFOMu7UI=;
        fh=YLcR8yD/230YPTaayCJUUI5HGfEcCo6nLNRnXCp2a20=;
        b=l5QkdMbmFtG7ChHXiq8y5goIX/R7CpD3qKqyNJyateEl9Q/8uefwGwIlzCOGmx2mgJ
         Tlza0qpMK8e9W5gLh9KqhpsVzb64SGW7Jrq+AWRC81NvFcjxvluHZrRqBFIf6bqsd+kq
         /9oPxgjq7zceGa6EgMPVne6rzOJ6WVZpJq5Rzw4cE8PcpcSLomZalSbb/ncQ6Zm06KaE
         wR+ITmd476UMqP8zjV6Q4KJiEbz575luNc/AdJqeBWpTJ11qERV/edUNO0W6LNbhoINR
         h8mOWaUPBdbB0TpcL/0b8UCJqt77kN9ak0bk/h5TmwvWZNdKJ7gSOeAT1hmb7rAL/Pqh
         1RKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWm41z8w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22-20020a05622a145600b0042e7c95c759si4013667qtx.333.2024.02.26.08.25.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:25:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWm41z8w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1redmz-0004OU-Nt; Mon, 26 Feb 2024 11:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redmx-0004F3-O1
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 11:25:11 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redmw-0001V2-6N
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 11:25:11 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5655c7dd3b1so5167162a12.0
 for <qemu-devel@nongnu.org>; Mon, 26 Feb 2024 08:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964708; x=1709569508; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k7GJMaif4C8touOdi6/5ipo4KREU60REdl/IFOMu7UI=;
 b=oWm41z8wW2N2hNu9wI2SBu1Ty0Lj6edA6ygzbAFYJ1+i6YODIN9Jh88O7DnF0ZaURt
 ILvNCdqs/B5xDIs7K1BhvP4Tok8uaFpbutqUZnCl31wxym3DEfrtAjUlee8kVjNJFZrM
 enoYripUemFK2rWxfddYYNnqkn6EowNIAIm7mLfYETSX2DoXHrwopqBhJjoZFRUbD+bt
 Qnq1lVRlUOfV+SthtPk2R8m1uEmNGsOO1LP6Wu5Dvl747a3EkY9jLjqvg6HDH++JDOkP
 R4DBE0bzXz5HpeVPxEUmGJ3eSM6crV2fVOYW0RcgF9v0s0CitF7jiuiVqXRbtI2Tl77a
 WYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964708; x=1709569508;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k7GJMaif4C8touOdi6/5ipo4KREU60REdl/IFOMu7UI=;
 b=S1WM/ywdtQxj/jKeOkrnA8d9Q8BQT58NHozQaFO8zpP2+P64omFBZNIgEObtdulwf6
 gkywnKdTcseWjbAxAua3LxGj4kWMSPzXXK/mK7jDKGt7ZKjXE+VZxYGLCtNdVvS3N4C7
 GIfUulHkIRC6IWWkVHBfvLm+S49DBTwj64hYmHfAu7Z87woA15TB7/lTuAoJVYxKsBIE
 2eAGvmrXjvEyvY2HqwzQGAgrxBlunRq1hIvs5ef7+oT91B9xU8CZ6HUBQI7Qyp1ePUUe
 HqP+OTkCUdfwfoBZXGlhMMJkleqMtxqe1ETxNjIQjSudTCyuFenmi5rqtnKkWsPucv3V
 tS+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRnKUw/DeSxTI4IVxO2k7wT7eMJMcaD7nTHkCzWXszS2As//bmrT54XAZTIIMuE4pwk/xUslnnq6fBcg3JpwgQryuKIh8=
X-Gm-Message-State: AOJu0YwMivqKxPgXC3wz52xadD2sfKGHiirKgk6TivFD7FlJRO15zspD
 mSxY5bQjuw881O5Lftx+wWRY4lEk6MEBdwuQ+IbBAkUi2l39evc/Q5qlcxKay4sFVZUm6VQ1FUk
 sECgjNQTEp2Ku3F49nkdDpPtaVSFcKRX5vScN0Q==
X-Received: by 2002:a05:6402:5249:b0:566:2be1:b0e0 with SMTP id
 t9-20020a056402524900b005662be1b0e0mr52634edd.9.1708964708725; Mon, 26 Feb
 2024 08:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-39-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-39-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:24:58 +0000
Message-ID: <CAFEAcA8tVARcCph9dN=+ZYz0=-0tO3WAcbTGhc=+MuqFhomkOw@mail.gmail.com>
Subject: Re: [PATCH v6 38/41] Add mailbox property tests. Part 3
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: YpkdndfvP79J

On Mon, 26 Feb 2024 at 00:07, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mbox-property-test.c | 213 ++++++++++++++++++++++-
>  1 file changed, 212 insertions(+), 1 deletion(-);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
