Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp591215lfd;
        Mon, 25 Jan 2021 07:59:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0+HLsn7bkB3PmyECemv3J2WaLb3ci+Ext0ei7lmTaxIgOOqpd3ZNCH1At78c0zroIZc9D
X-Received: by 2002:a25:ce8e:: with SMTP id x136mr1691382ybe.173.1611590398678;
        Mon, 25 Jan 2021 07:59:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611590398; cv=none;
        d=google.com; s=arc-20160816;
        b=nzn49wUTlWUjWrhM/Y7IExnEU5EBUJ/WK/l2oWOgnkkLqsW6saUS/a4zCon7pr9tq8
         qOerdiyO+8LYPRLZDNk70X3D1gLir3sNjzIsqdWf//R8Im+HohSnJLjQL3LKeBhuZY+G
         mqdK/TPFs+VTYpNU5bqZbOFHAb6v1rgd9BvAb8yOZlGBPbQl3Uvt1T3/9Ualt6F8KLNm
         xPVBDpge8/lSuT0nUQ6waPw2ptlgJcK8SA0ISNUqvURi59Er3N0vFKy2wxGXcT0J7gA7
         jc98Q7D1SRQfmtwQzSp+Rr1yGFbp5ncf8kSJszM9k1FNZrNAJcAB/QwdPF/qMhrv9lpg
         d9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hB06iBXWfdKSRbIxnh8gRXNg4Z/CV1FQ8+9uIrzX4dY=;
        b=UHJhDqPalBLyVDPnUKukq1YNiVcuLwCMF7lT8HEVlFlS59ndwAMTjBWvcVNxpQCKw5
         kMPSBAkXPcU1DATJXJ/9yTOUEm11IZfXSkGnbbc5SsfWLYqj8TyzRklPyFxFfNU7MrOU
         DCgJ/8b/38Jy2fWNuiWQdCNVYvYlnv6a3KaBPn0hdy/HJ1QB8JipViD16AcBHvI7QMPv
         ZLT0WS1/vdPabozeFcZgvdNXsG1qDNw2JSqwb5LS2F7pxoK1WvmzoeV5WmyyWzCJd8DK
         DksSTZUpjkp1npKEPuyJRpKTXKk6nd7z1LWPqaDzgWaJQZ2Ca6FCwgu0DQPJzpG+/CNF
         ixbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CYcSHC/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s130si21237927ybc.53.2021.01.25.07.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 07:59:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CYcSHC/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l44HW-0002N0-3o
	for alex.bennee@linaro.org; Mon, 25 Jan 2021 10:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l44HP-0002Mh-O8
 for qemu-arm@nongnu.org; Mon, 25 Jan 2021 10:59:51 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l44HO-0002qE-BL
 for qemu-arm@nongnu.org; Mon, 25 Jan 2021 10:59:51 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g1so15997599edu.4
 for <qemu-arm@nongnu.org>; Mon, 25 Jan 2021 07:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hB06iBXWfdKSRbIxnh8gRXNg4Z/CV1FQ8+9uIrzX4dY=;
 b=CYcSHC/JoZz5zdvAbJBWtuE7ON2Cfw3W+WN98RdVF/KBLUr1wkI4dZWaRWxHjQbsQK
 msjDBqfm/ULHuxWuscHsXLcsR25GFcpW7vZBBJ7GfGGi+MAPfbK0EvoEjOsT6N8wbXPf
 MSC1EGGVfikOwpeSlN+/iqcMt4Y8+ZqkHXamZTyXmiwnKK9NANaXWsD3+/Az2TW2HDzU
 DYIP+5FDQBU/4twGfkRUn8G+518+KHiTZLA7QdLeROm4wfdzieIRtfzhUckqqrBtEnQk
 vx5tRPYgsErdQDZh8agAbtTRoLuUpk0Gvr0lXxNUS2Hqrywx2iiGNBiK2w9+VKf4ReLU
 6yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hB06iBXWfdKSRbIxnh8gRXNg4Z/CV1FQ8+9uIrzX4dY=;
 b=iQcw/jxU+4g+alG08GWjbUSWhIt2y4iYsJrcEWqHeD4g2wxiSu5E4KwuEogyqe8Q6w
 XzJP5L2gfsgqOFccJKYBU1l0ZKqX9YbNB8iLfnBU6+TV41txTlhDm9VWq6GrEV9JXpZM
 IbYOAhU7U1tGzn4d5xcx2rgPgEPm5oRhcmq3HN0CHouRPgChL+wl0vBDrMoh/j5qhg3j
 ZTNWYc7By3Db9MtGZaPVDBiLh0oHl4Nc01pZ0SZIJ5ubYpicm4YrnHsavItefEPatrca
 fZctaUmt14cDb+RvQ/k02vEHwJDFamZunACjWwITYDHWq23Hia7+OJK65sBhlaxVh1V0
 AjPA==
X-Gm-Message-State: AOAM533w7QbPqfaFkyK7cJYakH2Sa9AyBCxjlF1vMST/zUx9qR2l4Y0K
 Vdm/eQdEK5k3yul3UZzVzuJj/kptznknQxogoFQo/A==
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr1041374edv.36.1611590388415; 
 Mon, 25 Jan 2021 07:59:48 -0800 (PST)
MIME-Version: 1.0
References: <CAOS2wR_7b5hjr6WSWZ0KqXjEFT=cR_TAEiW6fgAs_a4HnZtz9Q@mail.gmail.com>
In-Reply-To: <CAOS2wR_7b5hjr6WSWZ0KqXjEFT=cR_TAEiW6fgAs_a4HnZtz9Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2021 15:59:37 +0000
Message-ID: <CAFEAcA-P4q9FckgcmAXezCqSvW0=yFG6ZnReA_TASXg7tHk9WQ@mail.gmail.com>
Subject: Re: question about qemu user static
To: =?UTF-8?B?2KfZhNin2K3Yqtix2KfZgdmK2Kkgw4Y=?= <po99h6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tsb/nYUJoIYB

=E2=80=AAOn Mon, 25 Jan 2021 at 15:28, =E2=80=AB=D8=A7=D9=84=D8=A7=D8=AD=D8=
=AA=D8=B1=D8=A7=D9=81=D9=8A=D8=A9 =C3=86=E2=80=AC=E2=80=8E <po99h6@gmail.co=
m> wrote:=E2=80=AC
> why is qemu-x86_64 user emulation is 64bit only

Because the user-emulator binaries are specifically
"implement this kernel ABI", which includes not just
the general CPU architecture but also whether it is 64
bit or 32 bit. You can see this also on other architectures
like qemu-arm and qemu-aarch64. It's also why there are
lots of mips user-mode emulators: qemu-mips, qemu-mipsel,
qemu-mipsn32, qemu-mipsn32el, qemu-mips64, etc, etc:
these all represent different and incompatible ABIs.

> like if I wanted to install wine and wine has 32bit libraries
> or if I want to run a program that has 32bit libraries

If you want to run a guest program built for the 32-bit
x86 ABI, use qemu-i386.

thanks
-- PMM
