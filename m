Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1538411lfg;
        Tue, 25 Feb 2020 03:13:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyE72fMte5T3huTQUDufFTdUUvrf9i/i80QKJFLOBkXxzLgajtyGpgrYA6THm3AWN7xiooh
X-Received: by 2002:a05:620a:1464:: with SMTP id j4mr20080138qkl.29.1582629181893;
        Tue, 25 Feb 2020 03:13:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582629181; cv=none;
        d=google.com; s=arc-20160816;
        b=LytBYFpLwv2QhZEDHC6piZP/E2CNdhqw3YlAUXW0ciMiNz2X+TF75NegNbLvQ3uxDi
         INIU7yiqasU24Y2IEqZNzwb36VY3SVQsD8XOOmg9WTV5oRZyKpvHY0YYEolODY7Csbtu
         Sbf1pG2J+zgNgECSKsEqBTQp0+YOA1ABIFSg6EBKDCF94/XcZZAFRdcorbtdLOUiAG0G
         MHOOrupYqPvK7FcLa1VPFBTe0l7Lp8mCzI1dsMyR6THEy26Xj85tU2DaA6SgoC7BJQNN
         Gg0o05B2s9aHBKNBV5OggrFUd8jVW9tv68aGP0txPcs9LKFWNN6a8g831G4VCQCnenf6
         O3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=L/GN5mShHBdnMRsP6mdQ//WBZsXiUqXKixKlNorJjQE=;
        b=YewYqpP44D3Z+ohLUPcfQQ99zcVlN2N6dWqlSWOkrGvK8Qn8TfV1zAv6gsQBkJpcm5
         EHxztpSudtR/+sBemuHMndGtRFZBJMYXQwBWI62EMaZvdaa1BjR349dgqnq5lPipi4Ea
         mPPCHEmAAiu06q3HW99NjRRPSlRPL/WAcQOiII+4HdXyBf+oMqkfaBo3Fy6xE81kBy1K
         nK032YF+R1ltwR5Icgvj8mcdnInd+TxE/xbgcHDFsimuF913x/FhYlD/6ChxvpFgPT1f
         N3rwJf+/QpcCvQGal86N/vtRJ91yN6aoWaTqyw7/MH5620NAh7JxX6ggtMs/De9mlLJv
         mcHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zuGh9yAI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si160434qkh.304.2020.02.25.03.13.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 03:13:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zuGh9yAI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Y96-0004Pk-Hd
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 06:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40323)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Y8n-0004OO-K8
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:12:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Y8j-0001wU-RZ
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:12:41 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Y8j-0001sx-LD
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:12:37 -0500
Received: by mail-ot1-x342.google.com with SMTP id w6so11742616otk.0
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 03:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L/GN5mShHBdnMRsP6mdQ//WBZsXiUqXKixKlNorJjQE=;
 b=zuGh9yAIv9G+F8cH8ykqjiNbtXb5RYe6zff/EI2qlsqNxe9t5iNk7KE+aKI/dDGHsg
 G2JVu72xV9ZcvhCsCyxohw74kQyxUUKW3J4N4SCZ5ip48iJcsu4Lutxm76zlp68QebN5
 2XHwYnyXLi3w97OoYC8QgnGl1QxkAZUiw6rfYs1dGGK8fnwUqrjckCwMJrQ8batj7AZV
 v8wNQ8ZV9HMJn8MCFim4Xs4g5zqLhJippEAwYY2Znk8V+ycHgOkhJFqQu0CuHU170Vg1
 PVeYbfHd+Ck0T9n/2Rv51uSstkKo0rt2+fBcVn4kIPF8/G+2SzROcPkFygqm+gpu12FY
 iMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L/GN5mShHBdnMRsP6mdQ//WBZsXiUqXKixKlNorJjQE=;
 b=WvOGw2vtSErFucondvYMNxM7oo4oVb31Hdb9zU6YOmmNNPhZxL37dPC6lLwT17CIvY
 ajBuN2ktyqequcsApxddp901W85wglac8yMzl1ajszNaD4nrVnwyTRTF4Hz/r5+cwAQb
 rIIYSf4VwQeFRAtWKkIyQR7W7T21iAzXp/8fM2umN3ySZDSqCPSIlu7pqDbkUvUuKFpa
 fRB6qwsJe8pk2J65fa7uAqypnsZG7gMmQLtmPt9z7AdS0Gmb5op97ueWE1jF49VZsp4W
 bMMCV49GnDlgIk5HSh922FUsriy6wf4rTNLG5ReHMp762mObSS3X4zI7/xz8d01ygnAN
 plaw==
X-Gm-Message-State: APjAAAXQcUB8kJWlpF6tUqIda5Fra3URkS9Rf5nB3Y2ssdJ9kwIkWphi
 VPPc+fdHhCzY3wNIM8J+eDWLdbNciZHQ9i7gDOxFmQ==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr41230319otq.97.1582629156559; 
 Tue, 25 Feb 2020 03:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20200223231044.8003-1-philmd@redhat.com>
 <20200223231044.8003-2-philmd@redhat.com>
In-Reply-To: <20200223231044.8003-2-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:12:25 +0000
Message-ID: <CAFEAcA_H7aWjtoky=o2uKpNjZnebuskn-fFUMXbq=Gja5vyaBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/gumstix: Simplify since the machines are
 little-endian only
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gn7YlrCRhFIb

On Sun, 23 Feb 2020 at 23:10, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> As the Connex and Verdex machines only boot in little-endian,
> we can simplify the code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

>  static void gumstix_machine_init(void)
>  {
> +    if (target_words_bigendian()) {
> +        return;
> +    }

I don't think we really need to do this, do we? We don't
in any of the other arm boards that just assume little-endian.
I think TARGET_WORDS_BIGENDIAN will only be true on Arm for
the BE linux-user targets, never for softmmu.

Also, there's a warning comment in the header file for
the declaration of target_words_bigendian() that says
you probably don't want to use it...

If you drop this, then otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
