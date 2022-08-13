Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp359734ejf;
        Sat, 13 Aug 2022 10:54:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Ls4n2FIUJoFs7wkpSgQujwaS61/CdR6T+JMzfilNX/RqEQtuLClzzgSFg1p5kLmX+SnWY
X-Received: by 2002:a05:622a:1e12:b0:344:54ee:6865 with SMTP id br18-20020a05622a1e1200b0034454ee6865mr1636240qtb.200.1660413277157;
        Sat, 13 Aug 2022 10:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660413277; cv=none;
        d=google.com; s=arc-20160816;
        b=Mylm+mDKJfHqIPOetuGNn0oyhI/7TlB8kgt0iq/FBwn5JFoJZ6heDqJiXCFbkktgGh
         cbkyaCg5Kx/J6Cgmx254NleMgmXJfd3ZNJMd1//9fy7AbhVg7AGW4QPKgJSlHP7finiH
         nIlCYWdSxrXy77gKc54tLB7jhlce+cNUo/+yugsGRvKa/ttzEOQowMDgNMK5EBKZFrbg
         1f+6uyM1bPOdgdo6xBwmuJhREPSI5x4jWltYVQdDZaMy6XA3mTHLcdj87Kwsh8bR1kTu
         EL4HN5BuOPdMB8Ge7dF987eIud8N1XUkQsEQfDgb7CGW1YAFF4b50rBasYtBMbMqaIA1
         U0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:mime-version:dkim-signature;
        bh=d6+WqawZ6bYb/eT0yzkwDBNoVUw3EGLEc13+cWpGXLQ=;
        b=QYPgauZ1iTyhTImlpRX1i9OF+FKc/bbX/xyM2rhFIC/Q/2P9aBTkybNod12s+5yFzj
         GvFu3nH/TCE+EJFU2xPHfdCRtWTVTJ9RbDXjVYeekPzksTws27kxxGs51eQYi9ErQO1O
         X4wHnVaWEjKI6CSU906fJw1BgWn8HCPBeKpn40P4pszLXQKuUBj5zl6wWuvoF5P8dFsi
         /qNRDRC/WIK6LTTEioHhoo+ZAIOzn341xAX5JijY4dwZqVDBy7WJbBf/mGY+WLwuHCHM
         hpq1fdOzrV/sbIR0JkX8G2/6nHZrInoX41nWfcGl4oHQLsXmrAufh3O8QRgPgdsMPjN0
         5zGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KAYC0xNy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac85516000000b0034216c65bfasi2691638qtq.232.2022.08.13.10.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Aug 2022 10:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KAYC0xNy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMvLI-0007R9-NI
	for alex.bennee@linaro.org; Sat, 13 Aug 2022 13:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oMub7-0000MD-Px; Sat, 13 Aug 2022 13:06:53 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oMub6-0002UU-8G; Sat, 13 Aug 2022 13:06:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so3453228pjf.5; 
 Sat, 13 Aug 2022 10:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=d6+WqawZ6bYb/eT0yzkwDBNoVUw3EGLEc13+cWpGXLQ=;
 b=KAYC0xNyrOaKh9jCG9lrXY0n+ZkVjpnCWGwqjFfW1SUOW8H6BmMU1YsMbS/R3VmXxG
 7YZt+FAPxhc4SqjyWljN41y8fa0asa/c5JgPUMxA8wqzBIny2jSngPIrlewx30Z9owKe
 9FGtkCtoJy+0m2hsYfbftuuLZauFgaU/r1NxQKPQObNcraucAiu71ctxwtGQ50hDyjkX
 mXlI5l7Nblmac/Iyc2jE/+ss4k8nGVXmAZoJE8Vg3yEz1+8ksIiyxpET93uJd4mF95To
 6KDnnFQap3tD1Btgu3XnYuRc6zvnlO6JVKXYnSLlR2XbTCFJBCTrTZOYFbGMMZ8wl2sy
 Wn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=d6+WqawZ6bYb/eT0yzkwDBNoVUw3EGLEc13+cWpGXLQ=;
 b=MqrDMLjslkCY8OlJggFHSVjg4KqPzJA7KotiRFO7G/PvkAMwKv6SOhwcWVrxLFjl+T
 iol++FdGxi/98RVVlFPgb/CrGHvq1X17hu1NAhvmxsVQJ8A1oIQD0VE9quRN7G5OLT9b
 Y98SZxxwfy4Y8h4TiYGeyj3C0hQEqld6pvX+hRS5nPd7MukNS0x53cjwoCe97L7tBT8s
 SVgjmkxB3HhoBBqz8Zyvz1k2H5lfDpKWd2tmCSbTWNqGoqiW0rPSteu6gTK0NjTsGqrg
 X5+jy87JQ3ztEq+5zpXlQ6p521/4jjImDS4/yjHPvIx2zLnmTtkgpUxcezdCPjpppAn1
 Ci9g==
X-Gm-Message-State: ACgBeo2slKEr6hjC9HRa4CbDOjeLHyl2u6wj5t2GRgmAl0PAI94eyAfV
 0Xz0RD410oEv11r6FnoqreLdhnVgDZKUvWNJetcOHtaOKOU=
X-Received: by 2002:a17:902:c408:b0:16d:c48d:978e with SMTP id
 k8-20020a170902c40800b0016dc48d978emr9321178plk.70.1660410409803; Sat, 13 Aug
 2022 10:06:49 -0700 (PDT)
MIME-Version: 1.0
From: Shiny Saana <shinysaana@gmail.com>
Date: Sat, 13 Aug 2022 19:06:39 +0200
Message-ID: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
Subject: Teensy 4.1 Implementation
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a8661305e6226cef"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=shinysaana@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 13 Aug 2022 13:54:17 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RrQ4LEjrDOjZ

--000000000000a8661305e6226cef
Content-Type: text/plain; charset="UTF-8"

Hello!

I'd like to implement support for emulating the teensy 4.1 board (
https://www.pjrc.com/store/teensy41.html) to QEMU.

I'm honestly quite lost as to where to start at the moment, since I can't
really find any emulated Cortex-M7 that would be close to that board
already implemented.

I asked around on IRC, and I was redirected to those two mailing lists, for
guidance, and also as writing code without maintainers approval would be
pointless.

Thank you!

--000000000000a8661305e6226cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!<div><br></div><div dir=3D"auto">I&#39;d like to implement support fo=
r emulating the teensy 4.1 board (<div dir=3D"auto"><a href=3D"https://www.=
pjrc.com/store/teensy41.html">https://www.pjrc.com/store/teensy41.html</a>)=
 to QEMU.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m honest=
ly quite lost as to where to start at the moment, since I can&#39;t really =
find any emulated Cortex-M7 that would be close to that board already imple=
mented.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I asked around o=
n IRC, and I was redirected to those two mailing lists, for guidance, and a=
lso as writing code without maintainers approval would be pointless.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Thank you!</div><div dir=3D"au=
to"><br></div></div>

--000000000000a8661305e6226cef--
