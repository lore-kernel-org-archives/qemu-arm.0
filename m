Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5096786lfb;
        Tue, 10 Nov 2020 17:11:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT6EovXYZhHyORd4joXd5PPCUP1n2QF12g1i/ed06d07DmAQ4v8zz72FvXRb4M7u5kpTfW
X-Received: by 2002:a5b:551:: with SMTP id r17mr6979172ybp.309.1605057115215;
        Tue, 10 Nov 2020 17:11:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605057115; cv=none;
        d=google.com; s=arc-20160816;
        b=r8Vf+zxq/zX9WiQx5nJWPnCn20Qj4Q+QyIDAFEqXbpgOv11CDckyEXVo5xls5hCFu+
         S3Y7e81pS1vQKYbRl6Ak778wELwyU2m3FXG/j4tqkIQHWT/eZhxBh6IrT1HuAqZhJrwW
         2eK9ia2cIs+Eu5E8uN+4kMBZJacwPTRieA9JJ19MfGgrnQzotB4/OwAsykLFHkSTo2bD
         W98A9P3WYSs8vszIu8WJViHNZ9HtEh1rZNqrJmkyrEvZyHt7QarUwJVHWKbuEUCihDOj
         uBgKAIwD8ZGliigkYUtVdJPOfDQMJ1wMwM7h9+mgPEqXn4ZfBNladlsr2IZPLh+4PLAx
         wy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=vDp4NZGN+kINhI6KNQpj16siCCqpOq4IPm2V1RY1YbA=;
        b=mCnKnwObEHBxkWVzc9IPNQq1bHYxFepFlnfUX7xPBDPCSeS5Tw17Yu9fOavAlAvxn2
         s4B7bMFcMHJ7A44SEUHT093SLdciXvgLQf8yXrDAl/+mdOn9TiWQkOJU2H0sYZPYPr6/
         kEiCSH/SMLmf+vW5vE/iy8J+apVxOlhQDomuiRy6DGf9sUYKAX2qze14YKgi81dURcMd
         CA+I22sveAR4TpqgR9ucsr6KkalK9O7TRP2jJ/z5oeVl5JFWJC2pKO7AKitCf1Io6AJq
         1Y1B2yUL0gXuKBcqoldfLPMxFthI7hh87JW/qL8IWzP4OI8K3oEmO+ytBpwmOUj22Mkr
         sTGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sMX0XIO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a128si399913ybb.65.2020.11.10.17.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 17:11:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sMX0XIO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcefy-0002as-GJ
	for alex.bennee@linaro.org; Tue, 10 Nov 2020 20:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbsingh1983@gmail.com>)
 id 1kceef-0001bf-N3
 for qemu-arm@nongnu.org; Tue, 10 Nov 2020 20:10:34 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:41342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbsingh1983@gmail.com>)
 id 1kceec-00084v-Qh
 for qemu-arm@nongnu.org; Tue, 10 Nov 2020 20:10:33 -0500
Received: by mail-lf1-x130.google.com with SMTP id w142so855664lff.8
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2020 17:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vDp4NZGN+kINhI6KNQpj16siCCqpOq4IPm2V1RY1YbA=;
 b=sMX0XIO3ZFEVb3NFVXhrOkbKcARNBPKUlxG2Saw3LzSSYY4a1cnpTK/GGnaDn9d19x
 2RXwLca4iWq2lAXibEXBKSTNINRthcRDf0+WaPD7xnRRUaVb7NqckK3560xXYo+Ok5K1
 fYxlHvxTPB4v4Q1UwrpbzBwr6A3FGM8T7VYcj2qUVTu83nzrIxH9/ioZJLZtzq/SBZOA
 /f6lSZ7PDu26EVWMBI1McEp8EkJP6eaLCIzpHq9qz42URduz1Y6OY+75uqHMHb8maiUI
 QRS5tjZsFlo5USebJMdHaqP13qxQi1cIpURXbrofkCmP5rMr8nVdaAwCsGWo/mESx8Ur
 qAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vDp4NZGN+kINhI6KNQpj16siCCqpOq4IPm2V1RY1YbA=;
 b=I0M8JT5i5pNllQgn+4u6ex99+QYdZXOGb0nhJo3YE31bon6VWa1kTATZODG/hmdwIB
 kpQt9PjCZvaLuSQGwvAANoQY/h9sPoowaU/CxlnO9gzWFDjUX+XupHcaBefpsWs4kU3x
 t/Cca5FkxV6tR8x9o0nW2gcXexGI+8G75iylLU2Veq2xRDWQ+jo0lSPX1HooCvjLSV+i
 gzq517u2GUFCDvieJqjhAl3eMkzEFOTNq0excd/JEKZ9rVTuWhTD+Y5AE7sbTTd5GrQK
 QUa3dJxN5A3jil090BKKieDEYMWTc/vn4WWmopYbed4E4tAIEIoPRppJQz72Ap4vhIkS
 oqbg==
X-Gm-Message-State: AOAM53315CA8kw8GSON0yL/hkWk9Hrp0x/xQH+FmkCHkjgI27cWYJeLH
 6PhsRj/KLqWHOqEpmzB/rmVHg/BoBogXruaZpSeaVCdFAAVkNA==
X-Received: by 2002:a19:6551:: with SMTP id c17mr4308287lfj.46.1605057018263; 
 Tue, 10 Nov 2020 17:10:18 -0800 (PST)
MIME-Version: 1.0
From: Rajan Singh <rbsingh1983@gmail.com>
Date: Tue, 10 Nov 2020 20:10:06 -0500
Message-ID: <CAB+VpJkthrifUseJdx667T_UL=579ySZ=v6+aW8bWYBcsg08Wg@mail.gmail.com>
Subject: Error while configuring Qemu
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006afbbf05b3ca75e4"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=rbsingh1983@gmail.com; helo=mail-lf1-x130.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BqOr3BaIXzIQ

--0000000000006afbbf05b3ca75e4
Content-Type: text/plain; charset="UTF-8"

Hello,
I am using Ubuntu16.4
When I am trying to configure Quemu by below command-
./configure --target-list=arm-softmmu,arm-linux-user --disable-vnc
--enable-sdl --prefix=$PWD/sysroot

Then I am getting this error-


*Using './build' as the directory for build outputERROR: Cannot find Ninja*

Could you please help me how I can fix this issue.

*Thanks*
*RB*

--0000000000006afbbf05b3ca75e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>I am using Ubuntu16.4</div><div>When I am tryin=
g to configure Quemu by below command-</div><div>./configure --target-list=
=3Darm-softmmu,arm-linux-user --disable-vnc --enable-sdl --prefix=3D$PWD/sy=
sroot<br></div><div><br></div><div>Then I am getting this error-</div><div>=
<b>Using &#39;./build&#39; as the directory for build output<br><br>ERROR: =
Cannot find Ninja</b><br></div><div><b><br></b></div><div>Could you please =
help me how I can fix this issue.</div><div><b><br></b></div><div><b>Thanks=
</b></div><div><b>RB</b></div></div>

--0000000000006afbbf05b3ca75e4--
