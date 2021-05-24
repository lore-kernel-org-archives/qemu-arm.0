Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3740940lfm;
        Mon, 24 May 2021 10:17:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzsRP6hPootuEKJ5mZWe4ZMjV6WuywIhON8uO0FXvNrIUlPyPIJLZuDT1/cPHEfSON+zP7
X-Received: by 2002:ab0:23d8:: with SMTP id c24mr23124935uan.77.1621876677211;
        Mon, 24 May 2021 10:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621876677; cv=none;
        d=google.com; s=arc-20160816;
        b=koSMRobp4p0oZ4HlxfNqKkiWaZkdMm0b/wnFrmy6ai9EbM5VE8+1s/AjGV6+sJkAAm
         /5u64w+oKmjBjVQwt3sknpvpjpsQb0UHGtkX8k3/IsyNaziFvSvfCv+6dTbmVidgCJqr
         BPACWW4LQC5Q7ZQ8gcidGVx60j/Vsb//j0N6wcRYJc9Ub+tKLwnw9UmJoziLh49DQUAj
         5/zRfAWSiZ+Efr4WT7N8V+NHrRDDt8FcrdE5GVBeLCdhLsl2iaogHD7F9Z0uVDQJOGyv
         xVEjACUAVEPiE9yNHFVVq8btv7FcwHW5YTA+0iUEvjEgViPp7hHV5J/mvBAnxLYeEk5v
         TnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NRZ2lJLGVwsTq60JF9ixCxISriWyDA34H/1+cYHr9+0=;
        b=zbhSZzxsxGGY+4nfQQZV9+z+SSE+Q1ily4IjEwLh0pDW5XinvB6gYM532kwgeziWai
         8wXInSNn27DGnV0/XMfrExx3L++mfRrQwzUA4qAClCDtjEbTQABg5Jp6Cr4DzMdd6MdI
         5/N69wAZ5dPBGHoschVHnxFOT/ho0yrdRpdwV7r6tG0ny8N7SkvfimrWnIySDDfOPOSb
         GfnuY7DZajDzq2j9wHoOSVzJZM7zDgDQPBjHDPAlbD+lNPlyhDs8fHSXqc++rfEYE4Ti
         5RyPfDGdq5ZCUgW0KIOrjPsxqSyaZXpcWC6G+EPYU8kFh/87vuv+wZMovA+pE10Ga6lA
         79ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nf5VBR+C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si2807848vkl.2.2021.05.24.10.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 10:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nf5VBR+C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llEDE-000688-EF
	for alex.bennee@linaro.org; Mon, 24 May 2021 13:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llE1f-0003UW-K7
 for qemu-arm@nongnu.org; Mon, 24 May 2021 13:05:59 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llE1b-0004Tt-1Q
 for qemu-arm@nongnu.org; Mon, 24 May 2021 13:05:58 -0400
Received: by mail-ej1-x630.google.com with SMTP id k14so39457347eji.2
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NRZ2lJLGVwsTq60JF9ixCxISriWyDA34H/1+cYHr9+0=;
 b=nf5VBR+CqvCB/G1HKSWF/MGkqG102mRB1KQaM2BTZuI7b3q+aydLv6dbiDlVLkP/si
 qXwK1Dqs3QcR3xcS7uOyc7gw9k3Kpxkl/9H0ep1p8Iqz/sxopa++Q0mL34u+VGF5LHai
 jTCYpdIIEXNhPeZMcD65EZhpJPMdPGtvm3OgtxJebcrd09NfSnk+LDQ7lUCkuBToLCx3
 kfyH+BdCDVdX4zeEBVBukDjPJuhb13IIuqReipec+xGeJYAi9t3F52DpXD/j0V2hoT+H
 9aU63DdAv/kKtxn/8ioKTgxwgZMnhIqxrz3xsjcJEvJCv2VyH1MNvyyx+0EMmZ716dfZ
 3kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NRZ2lJLGVwsTq60JF9ixCxISriWyDA34H/1+cYHr9+0=;
 b=VRot+JycjL2iyWZJMWzbj2C96TBOU0na9v7my0usDpnOYCizYQvhfMi97OYX3gk0Il
 K0ocoOVLxTDKtVDelAMkdgcsF6aglUSDfZUNj1jNnq0fs3qZ9evX5u6qXFXi19npAwLG
 3nlbtMved6HkTo98vBrErPjUvAjo5sDrHNf5aXLtM6qERHx0eMX6x6spza7Ztie1LSjR
 a051jsbn6LS5qpYHZjZets6FZnwzrCd6K3DuKZYtxVZa47EVOhET3z4h/PLnh6N5tY1B
 y4GhegNITL+DcwiCg2o+UgaPusFiqQ8i5GVSsi7ETm8W8gSWLrqIEA3u21WPUN8H4H2Y
 2OAg==
X-Gm-Message-State: AOAM5319MUsrfZ6Tm8xzu6yjX2LfVysA+ip/PBKWYIaOLnTdvy+X6M+b
 T5G07Rg+/OF5rUXYwYxGGMkfvIW27JJax7Wu4Oj9Ug==
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr24470754ejb.56.1621875953313; 
 Mon, 24 May 2021 10:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210503105747.703149-1-f4bug@amsat.org>
 <e8ed8f29-ba55-0325-6916-faf0e3bcc67d@amsat.org>
 <CAFEAcA87HWGd9Kuqzq9pzNNyF+tQ7E8buCSZkqA7k-6d=GOPgg@mail.gmail.com>
In-Reply-To: <CAFEAcA87HWGd9Kuqzq9pzNNyF+tQ7E8buCSZkqA7k-6d=GOPgg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 18:05:30 +0100
Message-ID: <CAFEAcA_wJm9n14a6SO_WGUo1nRtd5yrj+voHtmjF0x7DrsFciQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Libvirt <libvir-list@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u12q9Fb+uDi/

On Thu, 20 May 2021 at 13:07, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 11 May 2021 at 04:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> >
> > Hi Peter,
> >
> > Can this patch go via your qemu-arm tree (it is reviewed)?
>
> Sure.
>
> Applied to target-arm.next, thanks.

This breaks 'make check' because some bits of the test suite are still
using the old machine names. The error message is a bit opaque:

MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=3D./qemu-img
G_TEST_DBUS_DAEMON=3D/home/petmay01/linaro/qemu-from-laptop/qemu/tests/dbus=
-vmstate-daemon.sh
QTEST_QEMU_BINARY=3D./qemu-system-arm
QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon
tests/qtest/boot-serial-test --tap -k
qemu-system-arm: -bios /tmp/qtest-boot-serial-c3pthL6: unsupported machine =
type
Use -machine help to list supported machines
socket_accept failed: Resource temporarily unavailable
**
ERROR:../../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
ERROR qtest-arm/boot-serial-test - Bail out!
ERROR:../../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
Makefile.mtest:80: recipe for target 'run-test-8' failed
make: *** [run-test-8] Error 1
make: Leaving directory
'/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'

"git grep raspi[23] tests" suggests there may be other uses beyond just
the boot-serial-test one.

Dropped.

thanks
-- PMM
