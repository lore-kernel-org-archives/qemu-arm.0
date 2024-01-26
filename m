Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp962213ejc;
        Fri, 26 Jan 2024 07:56:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN/tX2qKxtimXIDMReUwegPXYqNNix7LdEk+KeDH9SoKRn62LHIYvLjENOf4z1ifp2xpB9
X-Received: by 2002:a05:6214:301e:b0:686:aa71:1a86 with SMTP id ke30-20020a056214301e00b00686aa711a86mr55797qvb.47.1706284589647;
        Fri, 26 Jan 2024 07:56:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706284589; cv=none;
        d=google.com; s=arc-20160816;
        b=pW8j/ISgM0yVaLUZD5CfyeI6IwLOuFL9KX/tn5jYTcUhIYIEJ2BP+d/dbZGO/TDyW0
         Feuj9iHTbvHwT2QM6imUeICnK/GPG3mswkBn2trfwq9AHslZdq8Q86vCLHmRP6ixKsLR
         JQPj7Lj1Rllf/K0w4FzHQP0ErC9Hm8/2KzfjM6FhtlRAh3uU9walOw07n1ZEMraKypgF
         kzsc9evf0rKWl9nees71sFE/r91NN8X6A8Pngia0aCTp1iLLY2Qvsd3DhOQlz3vSd2Nl
         I+1qL4gEEala+5zse7xpmYw5Q3x+CAmhtiquuVtyPaa/zOoV4oqnueqFLNgkw8Lg1P8k
         nd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GpvuW6VklVVM7eW1BtYVkaHnC0A1XyBpz9Sgh8jHrHY=;
        fh=0HMtea8luuAdS4zSG2fLRt1HDJ6RwgBaS2f9YpjyZkc=;
        b=0o8gcT7twq5hpP8gVL3tqvOaz5e2S/O+IRFuiGSjGP0ajMFxOyV3cYtoYkglHWsxT6
         GLn2WgMCJ55uzCn99yCkmeKHFrnUPHBksZ/NOIKf0DPniTpKhankNAb96qMlIdFjYMT2
         g8FOmdtWG4mkYzNQZXO6RNgDy7xyRSPnWWchPC8Ht/eitHKyzTBAomSCfyW7oJThwNRX
         Y58VXUysrLcAQHVZbCH3bZJzjma0/JNKOtImyS0i/Mp7lOJUZJv5A7nYXlylIzJmExZ1
         XSl3yvuGKYq+1JMY3d7e0v6tDIdtJm7zIonDTQcHqgx5QTJYBgd091x9Cj1sKoC+WcZ+
         WWYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0T+bHqQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11-20020a056214040b00b0068c36bf29ecsi494132qvx.308.2024.01.26.07.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 07:56:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0T+bHqQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTOZ4-0006fg-I5; Fri, 26 Jan 2024 10:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTOZ1-0006ex-PM
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:56:19 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTOYy-0003K6-IW
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:56:19 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so496374a12.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706284575; x=1706889375; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpvuW6VklVVM7eW1BtYVkaHnC0A1XyBpz9Sgh8jHrHY=;
 b=G0T+bHqQ8/kv101KNULr7w1SyYGDYtj9lqy9bw8L8t9VFF6q4OMVvtFRmbLQXhDmVL
 ji/dwcN31Uqc/LNRhWWQ5i6xStvACa3rVy29EDxn5jTRozciVIk3JzBTTOhPOwCi7S8Y
 RLnRr8mAmEW/mqPx9xyl9m6pVqIaDoC6jppjQvHvblD4bVgn2GALyud1aCbW0fFTOnSY
 omhrmyuyO0dvMVw0Urm1ZiPCM5sJVF1sjz1L+z5b3sDnT0TWr2nrVfcBjBJKNsAyQ0+O
 N55gy2tIs8xZBe1pdvCiuL9nul9cyPOg5l2kq0wcLCMlysNkzA1vTXrhrHIgQxFw9UII
 DrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706284575; x=1706889375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GpvuW6VklVVM7eW1BtYVkaHnC0A1XyBpz9Sgh8jHrHY=;
 b=GPT5JLBfuWwz181lWKmAwJH6ZOkloY2pOFKyYeCD6PCWJSuzP6DrHrKoFI7fCqj7tM
 JG66rzC8Ne9qGHhoKXVpUrkluthTJLyRQit2ZriYsyBbOWfJIVhRZB65ml5wOa/35x+A
 gp5BTfvbbl1rlYnCE0bsKtrXunLVN94UW3Ci7Cdwh+f0vOYaGQ6PJU40F23wjjNKpJYg
 XzJXrtr71IxtgBB0YXsW2T0Vn9MIRa9NNZUypmmigOG+3N79FRFtAf+h5IgsoTSxxDZS
 rj26lRYsF48HqenSGI830fwmDtD0gJQgBQtZbRULQa7YaLdeKzAqxG/nXezzQksz16fE
 h+1g==
X-Gm-Message-State: AOJu0YzxZN/Ot/eQPuAQpf7xmcRddee0ilvLMXNfcWebTO2VsFqhVhjZ
 oFITN7f06GI2qTNEa6HuEXvpROtTkelX9xUeY3yiXJYY27aUTJhPFfer+lQ28vOoGDy7OQ8fu1V
 VO55ejq5mvHFYjT6pcHibVyRRoE7RgfX/Mxyt3Q==
X-Received: by 2002:aa7:c611:0:b0:55c:7ab7:d357 with SMTP id
 h17-20020aa7c611000000b0055c7ab7d357mr1023716edq.14.1706284574871; Fri, 26
 Jan 2024 07:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20240126133217.996306-1-clg@kaod.org>
In-Reply-To: <20240126133217.996306-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2024 15:56:03 +0000
Message-ID: <CAFEAcA8Q66Qw7spMOcBju0v-=C=x10hz1rwPWxjCzYWhdkX8Ww@mail.gmail.com>
Subject: Re: [PULL 00/17] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: kCAZy572GYIH

On Fri, 26 Jan 2024 at 13:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit e029fe22caad9b75c7ab69bd4e84853c11fb71=
e0:
>
>   Merge tag 'pull-qapi-2024-01-26' of https://repo.or.cz/qemu/armbru into=
 staging (2024-01-26 10:21:27 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20240126
>
> for you to fetch changes up to b40769f4b49d15485ffaaa7acade3e3593ee6daa:
>
>   hw/fsi: Update MAINTAINER list (2024-01-26 14:22:08 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Update of buildroot images to 2023.11 (6.6.3 kernel)
> * Check of the valid CPU type supported by aspeed machines
> * Simplified models for the IBM's FSI bus and the Aspeed
>   controller bridge
>
> ----------------------------------------------------------------

Looks like you have an endianness bug, either in the device
or in the test. From the s390 runner:

https://gitlab.com/qemu-project/qemu/-/jobs/6029422595

232/847 qemu:qtest+qtest-arm / qtest-arm/aspeed-fsi-test ERROR 0.38s
killed by signal 6 SIGABRT
>>> PYTHON=3D/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/=
pyvenv/bin/python3 QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu=
-storage-daemon QTEST_QEMU_BINARY=3D./qemu-system-arm G_TEST_DBUS_DAEMON=3D=
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/tests/dbus-vmstate-=
daemon.sh MALLOC_PERTURB_=3D82 QTEST_QEMU_IMG=3D./qemu-img /home/gitlab-run=
ner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/aspeed-fsi-test -=
-tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
**
ERROR:../tests/qtest/aspeed-fsi-test.c:152:test_fsi0_getcfam_addr0:
assertion failed (curval =3D=3D 0x152d02c0): (3221368085 =3D=3D 355271360)
(test program exited with status code -6)

where 3221368085 is 0xC0022D15, and 355271360 is 0x152D02C0...

thanks
-- PMM
