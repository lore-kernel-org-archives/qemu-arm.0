Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp206039lfb;
        Tue, 1 Dec 2020 06:27:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDRT3A0+2+uy3IIF9N3IetD5GLe0fxf/mMEK00c6yseZJ921AGIFI7iplz/Lw+H0CHgON2
X-Received: by 2002:a25:abf2:: with SMTP id v105mr4439213ybi.55.1606832854559;
        Tue, 01 Dec 2020 06:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606832854; cv=none;
        d=google.com; s=arc-20160816;
        b=WcR02mTHprcsReVP68edI6L5irXlo6oG7ASNeRNfA6Dqaubitk8XRC2uEZG8CBemdJ
         bNyYgeqWdDHasN30ZDWdwBmXwkGN/re+lSnCMBk2HTeb2wJYYUUEr4AiAVhpe9cUzl/8
         OV/ZT8CXYZIRr/ChhV1SH+bp3yJ+u23GzjCAU/9XTVLvv50But5nm7LDLm2fqYOFPfbo
         YPbRt6VBeU5mQdwPqUSlrJy5xu26vTyudrqohLdq6+hyQ8k/5tT+1zGDHk339ziPd/pl
         AT3EisXx3a11+qaJa0YXaO5cwQR3rFuGmHOuoxrFo1ImVgvoHbzP/0zTjrnoYbWM4mSn
         yMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ddtKXTohIZxj7TGzGY77nRr+I1wv/ffqfGAyhdo35/Y=;
        b=EiBBaqNNfYz+Nnjyn8+NvHSJGHgncVJyDe+VR1ziXIpgljBlDWTChUWrueVl41JfFy
         jepbBLGr2dUwTb+/WLdNyCvlBtUIMO6YtWLycsdldZFsdWdSQ4MtpeXBeuS47bSk9u+h
         6yHcqc52V//Mn8Xay6LrG40/gkEOwCtfiCmlRPnQjlul/rsrSXhvKQ2UCdrtV4oCYRMr
         52bO4GM+P/W6Fp52xeRmJxqKJDkZWkXEyUVsFAQqWjsytztCIBzkd5Gh0PUsY/5zlBYn
         hn3umPkwoat/c8amrD14EjUMY+oWSkTnghCkNIeEwJn8FMnY/m/mU/nPr/iOqL5q//nP
         aVkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZgmpCTC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si1607693ybg.241.2020.12.01.06.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZgmpCTC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6cv-0006pZ-V0
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6cn-0006oe-6c
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:27:25 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:39425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6ck-000240-Ra
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:27:24 -0500
Received: by mail-ed1-x544.google.com with SMTP id c7so3494518edv.6
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 06:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ddtKXTohIZxj7TGzGY77nRr+I1wv/ffqfGAyhdo35/Y=;
 b=ZgmpCTC6Qw+Mc3HvgsQ3+cKelGTUjMexkw9cFnPbbVVQVozWK6RerAuGQ7+z8fazh0
 UScZanzr1Yi8XMw8CgIw2ye4MfSa11XNQU2rkIUpr4qby51j32Ut8ZYNhF5r3rb/1JlX
 ZTGZQsf6F0QVSaE0W6Z0SAMdfJJVnPJuiwAemEy531Ey9pYq3XQJ3GwRRptw9uEgkseE
 58oJC/TcXioMjrP4LkODgNT28QIpAfZPJblfQcMTSo0fffNy95ZoQYIYR9WqNSkZxmuk
 860OYYqI//gb9A5/78etxfNFl44FgxIVPV8YSLFijFeXTtaprM/4goure2ZYoPTFsWQS
 fklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ddtKXTohIZxj7TGzGY77nRr+I1wv/ffqfGAyhdo35/Y=;
 b=lkD/v2qqostWyovqBQNZ+5gBPIByXTA59l/fCeYj+vBPyhhx8VpI+Km2a7gk0dJbL7
 A8th3fS2/KbljUk2ITWHAI5GL2CrOqe1JSoIQpJ++ZE3Eg7qYXwa2fCt04ZlCgbELixk
 fa4pzoIJFeLBU4tV/ZSHlsssZ2OcYmPvfOfHZEUAB4ggCgo5lNu5jMujV23222EQBxD4
 exeQwgGWuX+sYFE3qGND1ayGzDn48eRmtgh0dU9eqPy+9VQO4IkvNa9U4dhpWt3Zo7Ce
 O4WR/W6V3KDpKIKS9J1unLdHgDwoaQMx12f1pcdwosX6ONOmZjaEGXTYsQ1He86hpzgT
 HwHw==
X-Gm-Message-State: AOAM533F3aaniNI6EhRpyfpEClpzYBVJGVPhbb7ARg/QX6IXf+GSEn99
 emfTGwyhFACv4WVc2rYm9aERRbe5NoTxENd17vRlpQ==
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2848901eds.146.1606832840820; 
 Tue, 01 Dec 2020 06:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 14:27:08 +0000
Message-ID: <CAFEAcA_0=iTLma9KgmW3jDhP=JYDaT9rVHZO5h3yaFDm8KUAnw@mail.gmail.com>
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qUhcw38DJH6E

On Wed, 25 Nov 2020 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
> As reported in https://bugs.launchpad.net/bugs/1905356
>
> Not implementing SCTLR.A, but all of the other required
> alignment for SCTLR.A=0 in Table A3-1.

Any particular reason not to also support SCTLR.A ?

Also not implementing the old v5 unaligned access behaviour,
but we never have done that...

Whole series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
