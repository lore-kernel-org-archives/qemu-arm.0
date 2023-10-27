Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp127951ejc;
        Fri, 27 Oct 2023 04:43:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7ECXAXcWDGndtSGsl0NtiOIyDdZv0xip3ee59nOTsbLpDFggUTD4yoob9YDN9BJrTEcCf
X-Received: by 2002:a54:4690:0:b0:3a8:432a:ea13 with SMTP id k16-20020a544690000000b003a8432aea13mr2607523oic.46.1698406995688;
        Fri, 27 Oct 2023 04:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698406995; cv=none;
        d=google.com; s=arc-20160816;
        b=IAvdSLHcuThgDXqBr65I4WwfPVqQzsSAqJAhzCA218XuQHxWdBiHBEK54u9rvfMa/l
         gYvjeLkM9CWK//kpPbN1lj6k0E94fx8CpCkw9CNKlL2Qfi2UqHHn4XfS8bZvch2hK1vX
         dZ7tXnHYkNQ2Oxru6+AMsDywxoZHT0d61Fo4jYczrOqq7s+BJUVOKk52L5KVUmx6gAj6
         RQ9sQKZfBAJOtNqIPmHbKdOGxXp8MApXuCiW+/FteoH8uhzTEolSU5JiXH6h9/ON1nwW
         OyDb8U+wbHSAblWKGZ1AwZtXTBcmerpvv1v1Py1w7kQPdNLqCaYf7q0WZstUC81s5EB2
         NkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jaInLbtt3UdnV88j9B6N+5VHWdNSaACQFHJiHwvJN3g=;
        fh=IXUqOalDAM6LY5PfdiaVULrrEfXNoPPIoHrDc2pqZ1Q=;
        b=cI4vd1EARXT42q9NHzp3vZUmup2B826L/5KiJwPjtbc/F/KN00MGajq8WcO6pZgibe
         Dn4aNnDqxeBNhlfXryHdz27KYvMduoWTCev11ag2LD/xe1I4xfpeCJYKqHbOjsYQlLKj
         zcRcZxM31yQUC4/IWqRksLU1EdeiTAbHSJUNuEb80o1GaJhXUlUP7k+KvcTssUEChPNo
         KSh2TuqUjvzeQO0GyWJEVDjhUmYrsYXRvHQj2LFlWajDzEg3NkaNJWkEgWfbO6zvvIm8
         FcTiMS5CehPuXk3ue25O+fgW6mHFZxxmWf16TS2X2sXKCN5mXn1SuZyyucACSRcf9pbt
         XOUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aXVPDgM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s79-20020a257752000000b00d9a54fb8e8fsi2503871ybc.600.2023.10.27.04.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 04:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aXVPDgM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwLEj-0007XI-Tf; Fri, 27 Oct 2023 07:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLEh-0007WW-AH
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 07:42:43 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLEf-00057y-CK
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 07:42:42 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so3339958a12.1
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698406957; x=1699011757; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaInLbtt3UdnV88j9B6N+5VHWdNSaACQFHJiHwvJN3g=;
 b=aXVPDgM3iV3qdywKAYhck7mDA2QDDMbO2WE79hmdGCC1OrgG7XkO27VSeMYzC+aQjl
 +8QlkS6u/2uj/JqvY94zJYoJ6sDESTuF+sKIOEhRjF4vzua/Eu7QMoRgyVbDbGa3RiQA
 ZKQhcnFvFt0TakoRbu4rCFeBfODpw9YgYchjTcOCfHvAW0gMlTEoc2y93EwQZtyXxEsp
 WWvohCZB64EATD2ln92M0+KSeueqWUHSNYJ7TjVuVIvYYfPr1CSMGdMz50rN1h8pPdPr
 Jha7Vf92DiP+WWF2w9ML/eY3dk0xrvsN3N5mXnaD8WIwkEs+eNuRtcEUItytK6Yt0aE9
 gWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698406957; x=1699011757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaInLbtt3UdnV88j9B6N+5VHWdNSaACQFHJiHwvJN3g=;
 b=HFCUvqQCfvFfQxm7XCjDXu92RcjknAzWObE2nJf8LWhTxtpTnR9CsNO/X/I0p1BaoM
 kvYjnZ0U76k4h2HfW1LrJaGo0hNzYrAJTEzChUxOchFHtaRprX6r7sYEgcFTg5KJg7BZ
 Qbple0Ug4Tct+fm0rrhG1bvLaooVYekDmTWaYgU9huYbVmQB7uE208XpZ5C0vrAEr/RH
 7QGHlNzMM62In2bYKpXsqXyMXq5qIpkguug1TPTNAxIsZMObUvnv7aIg9yo1U5bPZh7g
 W71qBcfmNtSSh2B6YhXkr1d3OL4jMnWpDtBlVnqtxklMKWQPn5NpPeY4SjJI1WRw7d72
 qI/A==
X-Gm-Message-State: AOJu0Yyh3ryH3VvndjxUB5gmGZvP7mCE95G0ALHjOe/QEOG/wHtm2ykL
 nIzezlnvcKr8LeTT+H39BO39rZoy9cye6dcx2XshlQ==
X-Received: by 2002:a50:9994:0:b0:53f:bab5:1949 with SMTP id
 m20-20020a509994000000b0053fbab51949mr2062090edb.12.1698406957329; Fri, 27
 Oct 2023 04:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231025065316.56817-1-philmd@linaro.org>
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 12:42:25 +0100
Message-ID: <CAFEAcA_fBMV=X7Fs38YAtZWmN_s9LKwN-06BW6Gn_DXD3u1chw@mail.gmail.com>
Subject: Re: [PATCH 00/10] hw/arm: Move 'hw/arm/boot.h' from header to source
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: jGWIUcsmSBCX

On Wed, 25 Oct 2023 at 07:54, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Almost no ARM board header requires "hw/arm/boot.h".
> Move this header inclusion to the source.
>
> Philippe Mathieu-Daud=C3=A9 (10):
>   hw/arm/allwinner-a10: Remove 'hw/arm/boot.h' from header
>   hw/arm/allwinner-h3: Remove 'hw/arm/boot.h' from header
>   hw/arm/allwinner-r40: Remove 'hw/arm/boot.h' from header
>   hw/arm/fsl-imx25: Remove 'hw/arm/boot.h' from header
>   hw/arm/fsl-imx31: Remove 'hw/arm/boot.h' from header
>   hw/arm/fsl-imx6: Remove 'hw/arm/boot.h' from header
>   hw/arm/fsl-imx6ul: Remove 'hw/arm/boot.h' from header
>   hw/arm/fsl-imx7: Remove 'hw/arm/boot.h' from header
>   hw/arm/xlnx-versal: Remove 'hw/arm/boot.h' from header
>   hw/arm/xlnx-zynqmp: Remove 'hw/arm/boot.h' from header



Applied to target-arm.next, thanks.

-- PMM
