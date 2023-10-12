Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1073046ejc;
        Thu, 12 Oct 2023 13:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESotW9W9ge3yCcT2WL6z9B46sawa8nyrYNHlSjpsAU0sauoT1OttXV4D89q9i1DCjIU8R1
X-Received: by 2002:a1f:c746:0:b0:495:3d9d:535c with SMTP id x67-20020a1fc746000000b004953d9d535cmr14923780vkf.4.1697143629899;
        Thu, 12 Oct 2023 13:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697143629; cv=none;
        d=google.com; s=arc-20160816;
        b=LBHAEV7fpT4tr81ePNLTSnvwdfxW/dqQtun0O55Q5nbrYrXKIeY/j/L+o8j/5sdfBw
         F2Jh6wDyOHVa7PMnOG7e+okEevf6qULe00/vYnShp2ox0IBKGBpsz20lYPAvk+xOj4tW
         WwzhoPDV1+j1fINK8TW2/LAnL7kIJPzYNx1IJzyL3JzY2CQY6UsQZXyEUSIu2XW4JfmF
         TbYhKCb03bMFYMjhVAJtvP75dZ08vRHtj0F3PRVZxaK8/0zXQLKCN/C0TvOzOrNJPSbW
         DoxD7/2LcT4aK9IvMlp0biE03/r7ekWLP09CXzYcvl4SlpopF8qRtOTKDFyBMvw0NFxx
         sF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zWgRwgFvgYeKfEkwumJc+ZtHHrpydy58L7NM3LRa9LA=;
        fh=ng5vUcoiHnHp7SoA4gH/t1W7f1IBczZcVrHWPHZ5a2U=;
        b=O5mDpXzoVZgBX84VsMnTsyzOET3eqk7lqB3LJ4zV7tjAXM3Zv0+RWwdMhbbV6dJa2g
         eZXgFSofQZg4MOQIqqEKtxI9iGQez4ZJ+wRDm7Rz/RaeeT7De0ZfznSQXjyvhVK5zbbP
         gxr4DiPFQEWHFTabEEZWMS6LfvN8svqJXpIeZK1gSYSaRjLbCY0kluDFvYvXKdmti47N
         3ZvwzrGvD/aB7QnYhpEkTZjWveG8IQUYVyCYB6b+VguO1NL09JZ1UiRbeMW2iTQYSG6l
         Xj/C6ogChIfTNuJRD4CTWFnY2rMXfczVwExAjMDce5R9Gbx8eDDdWFfnskgeMUXLGKDZ
         MStA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ua2OTPKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020ac87f4b000000b004181a080726si167117qtk.659.2023.10.12.13.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 13:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ua2OTPKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qr2Zs-0008NP-6Y; Thu, 12 Oct 2023 16:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qr2Zi-0008Kh-EX
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 16:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qr2Zg-0005hK-SN
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 16:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697143587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWgRwgFvgYeKfEkwumJc+ZtHHrpydy58L7NM3LRa9LA=;
 b=Ua2OTPKCoq2zrroMp3cfP2OVsOb2aB45CgNc9fjgP1LjJLbglnvI1VuzZz8uYkiXBLRed/
 poYy+HALycl/7psahSxS5gdwM5vOZ/QgUC+d30h4A7IEP6rUCULMTYwM6YW8XPo8gQZJpk
 bUZ1VykfLQUhy3UVdpfWI3+XUUqee70=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-7jVsL0EoOGC-7dOuhI_Ppg-1; Thu, 12 Oct 2023 16:46:26 -0400
X-MC-Unique: 7jVsL0EoOGC-7dOuhI_Ppg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1e990f0629cso1868054fac.2
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 13:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697143585; x=1697748385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWgRwgFvgYeKfEkwumJc+ZtHHrpydy58L7NM3LRa9LA=;
 b=anKnHxRoh/Jk5bbbLWsHrPIpaBtsjfxzYzlQ64vpFdAv+WZt8lh/ze8LZZ656EKCGW
 KEEClyohsBJ80CgDuCd/yBgrTht9u1/5CPlrSH6F2H0vOqKSerD2pU/yioQeMn+a71IT
 CvZrV2h+KeH8Pm5Y9laGCh/fzamN8Lzmczb5PEk2asaeLUVDlVPWEcFNrnADtl/yazmS
 CkcP+b+7bT7QpwrlOLOxLbXFCrf3q4M8CG08QmVIbbBZqWPWevMhgcQLyGcdEqzh/8GK
 Pc4ysQVZNbqj93zwWIMidtad1IwNR9TdLbA5paadqMCGZklHcvZ+eparUGT/6jvXVAM+
 lSeQ==
X-Gm-Message-State: AOJu0YzlQEBVUt/KVCLaO1vSL9S3Sm05Ey3qlC1FiV4ElZ0l07+b1cnL
 lkgZTb9eYd9m4L6c405TUZMfaniH4cBvr+F/vqpdImcLuJ7/NCh3gp1mtTsMgAoF64LXlVoRmp4
 8YUwzGotKVZzuyvpI9tKWOGvoRx7Q
X-Received: by 2002:a05:6870:14c1:b0:1b0:89e0:114f with SMTP id
 l1-20020a05687014c100b001b089e0114fmr30863613oab.31.1697143585582; 
 Thu, 12 Oct 2023 13:46:25 -0700 (PDT)
X-Received: by 2002:a05:6870:14c1:b0:1b0:89e0:114f with SMTP id
 l1-20020a05687014c100b001b089e0114fmr30863592oab.31.1697143585374; Thu, 12
 Oct 2023 13:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231009100251.56019-1-philmd@linaro.org>
 <20231009100251.56019-5-philmd@linaro.org>
In-Reply-To: <20231009100251.56019-5-philmd@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 12 Oct 2023 16:46:14 -0400
Message-ID: <CAFn=p-Z4mWJXewXk7acmhMwuJ8jdso6h7x=bFUJm1Mce+C4_Og@mail.gmail.com>
Subject: Re: [PATCH 04/10] tests/cdrom-test: Clean up global variable
 shadowing in prepare_image()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Alberto Garcia <berto@igalia.com>, Hao Wu <wuhaotsh@google.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Tyrone Ting <kfting@nuvoton.com>, Markus Armbruster <armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GHC4Oi/rIUIE

On Mon, Oct 9, 2023 at 6:03=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Rename the variable to fix:
>
>   tests/qtest/cdrom-test.c:40:50: error: declaration shadows a variable i=
n the global scope [-Werror,-Wshadow]
>   static int prepare_image(const char *arch, char *isoimage)
>                                                    ^
>   tests/qtest/cdrom-test.c:18:13: note: previous declaration is here
>   static char isoimage[] =3D "cdrom-boot-iso-XXXXXX";
>               ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  tests/qtest/cdrom-test.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index f2a8d91929..0945383789 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -37,17 +37,17 @@ static int exec_xorrisofs(const char **args)
>      return exit_status;
>  }
>
> -static int prepare_image(const char *arch, char *isoimage)
> +static int prepare_image(const char *arch, char *isoimagepath)
>  {
>      char srcdir[] =3D "cdrom-test-dir-XXXXXX";
>      char *codefile =3D NULL;
>      int ifh, ret =3D -1;
>      const char *args[] =3D {
>          "xorrisofs", "-quiet", "-l", "-no-emul-boot",
> -        "-b", NULL, "-o", isoimage, srcdir, NULL
> +        "-b", NULL, "-o", isoimagepath, srcdir, NULL
>      };
>
> -    ifh =3D mkstemp(isoimage);
> +    ifh =3D mkstemp(isoimagepath);
>      if (ifh < 0) {
>          perror("Error creating temporary iso image file");
>          return -1;
> --
> 2.41.0
>

