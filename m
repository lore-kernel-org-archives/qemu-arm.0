Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp554353ejc;
        Fri, 1 Sep 2023 04:32:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6gE0Lr66FizISKN5rm5rI0a6B0ZFq1k+wHzO5jctfek/HXsbsUb+eAbacPj4lxI2PFnaU
X-Received: by 2002:a0c:ca06:0:b0:651:5d5f:787c with SMTP id c6-20020a0cca06000000b006515d5f787cmr2097530qvk.44.1693567921781;
        Fri, 01 Sep 2023 04:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693567921; cv=none;
        d=google.com; s=arc-20160816;
        b=Uercoy84aDBCqQfsEWcXCf7ew9u39NoAYx1vS6mEo5jMv7hO4Q+TkE3Edn3dAuWG2C
         +mabJ49Ff9nnoYJUdRlbcOha+OaWpS7JhFsAf2pH45eRX/kDG3JgUhmJaOIg/Z1I5EUk
         7AXcj3HR+RSiqPexfEBmwFcQ5JQDysMsN54F/JHEYiPCShfPxSVuBDjjmI3/GiPJDmmP
         ptlmumMTY3wChdnxavg+SBHR244KEtwCZWPKKPIXUkxk3p1+hP7WGYqZWxUXxofBwsta
         RGVxq2K+vuieM4zH3IVBpiTOpm3ZmX90sspCPRuW6GsHXa8FvSZ4S7X/m3PBMU05vGCN
         xUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vweUuZA9Wa7LLnw3i29gbze6FJcaN4nWKQpFD/lg9sE=;
        fh=dJ63aBJIV3ZJHiYAGy8QXwxzzsHaqFocLuG+4gdKrg0=;
        b=AxGLkbJ8ybF1bcSJc8jWzSAuhhNufzfV6f84wHNJatdsW+V8lfViQ3SvFUgkVx/msn
         DBjYg7afzv8Ef65oHkI5qXCbPxb+Jt5PwcMyPZq9+X+rS9Gst2nMgvEA+75mWSNPMNQJ
         rfBibsgT5uldeeRI0veu89yMOqQ+q/vi8Wayvr3i9XisNS9z7kMzjYObO3+IYqSvUawq
         d8bjT0wfGRaaL1d0oxT0nFg2RYIyLLO6ArWsvEKD78EXp7A7aaAV7Sgops4sv10qaj7R
         5bsYKFBq7srPj+9uTasVHNdEpExUwXa8ODvc8RjFCh8KieDN+V5vKcSTFKPf4Sw48PAV
         PL0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxUjmolk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a0ce052000000b0063d0771aeccsi2250099qvk.569.2023.09.01.04.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 04:32:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxUjmolk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qc2NH-0005DM-ST; Fri, 01 Sep 2023 07:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc2NE-0005Cd-RA
 for qemu-devel@nongnu.org; Fri, 01 Sep 2023 07:31:37 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc2NC-0004Wa-JK
 for qemu-devel@nongnu.org; Fri, 01 Sep 2023 07:31:36 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4bdso2546525a12.3
 for <qemu-devel@nongnu.org>; Fri, 01 Sep 2023 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693567893; x=1694172693; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vweUuZA9Wa7LLnw3i29gbze6FJcaN4nWKQpFD/lg9sE=;
 b=RxUjmolkvcsZ0wykk7TCKM4dk9GxMaPQeBCov3gBHXG2kS7mrngtOxG407bAX1e5S2
 hYxfZtFfiXQ1ZwOQ9c6CpMgdMmXSV7+NSxsspnNbg7lPfdbrcw5je1PnrXdiau+qxUqA
 5kOymn6r7pJPl8BvP4APA+PoBa3r4+U2/IXf4eYajTU4pAbmENUjPL4b/nz259fIYgT5
 lbkmnn1CWOAG7l5G/T+zpsoX3IClT8J5DisXbD3gnhUN7b+PsEbt6bKkd20o5ML6ShJG
 BrGiVOozwphzvnOWO/fE9yf/ntd98ydH+D8ytCDYKab/OXBLmPPhumyUW666XdnFSqgc
 X+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693567893; x=1694172693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vweUuZA9Wa7LLnw3i29gbze6FJcaN4nWKQpFD/lg9sE=;
 b=A47inswTtxeShFuO8qFq0y8bpxQvcl0Doz3VMceWwEBmhZzm7UlyMM8uCuqShe6Zou
 J3ShVn/iLYtjEs/mn3Qo7F/+QXjoTl5dvbo6pcJKcrixl0HBEM4wjrq9RDFUmisUU9Sq
 cVcIf5p/xxP38wzLX2+7E1UUXPIodNqMwO/YME/8S5P8ginf5iwsbh6VOWV5J/OfEJVX
 5vp3z95vEFXtqiqE83IsczblRQaJPyOQOePqHH1/8AUb+BSKOzKAFTFfJaTDPW7k0vZg
 xVUDtxWcIMTO9ckP2uBGJJ9jDnnCnr9HEP0nmszOGYvW5kZiveciMDJ3LWroR1K4L7Eq
 D64w==
X-Gm-Message-State: AOJu0Yw12Om2d6t2h4JoXX0PUnM0QCz42yP1vAcTDWf+b9dB9sl5Ak+D
 JbOaJ3AF4NowrRs8Ty/fxR+F4mKhkU0WFoH+Gpbw0Q==
X-Received: by 2002:a05:6402:2027:b0:522:b112:6254 with SMTP id
 ay7-20020a056402202700b00522b1126254mr1613046edb.4.1693567893155; Fri, 01 Sep
 2023 04:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-5-philmd@linaro.org>
In-Reply-To: <20230831225607.30829-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Sep 2023 12:31:22 +0100
Message-ID: <CAFEAcA_bE01tiv8pk_+U1P_eJKoi77TCc-D=y+qK10ZgykOP=Q@mail.gmail.com>
Subject: Re: [PATCH 04/11] target/m68k: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: K5kF2gEGe9AS

On Thu, 31 Aug 2023 at 23:58, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   target/m68k/translate.c:828:18: error: declaration shadows a local vari=
able [-Werror,-Wshadow]
>             TCGv tmp =3D tcg_temp_new();
>                  ^
>   target/m68k/translate.c:801:15: note: previous declaration is here
>     TCGv reg, tmp, result;
>               ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/m68k/translate.c | 2 +-

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
