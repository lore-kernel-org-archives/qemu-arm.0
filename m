Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp582238lfc;
        Thu, 27 Aug 2020 06:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2w4QAbz9QWPXou/YlXTc9BpZi8LkUkzKzdH7vW+vLWISneGKD7glkqdZXMo7WuEpp2Q6V
X-Received: by 2002:a25:6cd6:: with SMTP id h205mr28314987ybc.250.1598536242133;
        Thu, 27 Aug 2020 06:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598536242; cv=none;
        d=google.com; s=arc-20160816;
        b=cRNjRXs09PQ57Xo1PncvgDS8azbRBQt/g9VlcpYgax7Fl5CHSk//mGxU/123kUr0Rf
         taHB29XaMcUnArVa59dZLXv2DMdqA2jA9972GsRhKVIvAd/jXvNGlqZROHxe+2q1FOXz
         FxP6cWDePj0Y6oBcSx18n+XX+YIleqVqYVUtQ7AvPP/7UMn+n8wcnAXflPeoUbtD9Rbx
         wwEWjfKMiAlv+dm2e5aUfahxa6S1oQaPp0Q21pxBH3nevTRkaqn480+cM26+kX0TXeWB
         cAPCxPyMnj+x2gZEVEWv9MqQNmc+heBDH1wve6dbCKtkKGkypDbw2PN/QeF4S6kaHxLn
         MOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CGrK+0iK2Y0NicqMq1swc/EaOXpiNI5JBP4oBAovEyE=;
        b=1CVRGTaMTk6uNZHD5qRxhUwv7oU6B8Sqgp3zuCVqywFEeXRV6xMVItA+Pc1ccW5/tk
         1jdl+Aag1EMyCbPriCPSIW6x1wbUeXnTdQqtl5BLjF2dz/ghFKS1d1e67jfhty71nF9e
         ZSqxC0UyWhy0Ab82aNCekFiBJuBvjMnv4mEoO2t/vz/C2zJ6G9ZoueTqFq4huVJXwEjk
         Rle45v+PiegOYt53Qhc+zjgw1AG8jsxXCaWaEVtXKcXeuRsGohnj53Jnmo7WHIlFvaGP
         8uc0tm0Nc+xnICQ0b5a+b/SOFuYiUMXd7l3CY5qftpYJfKBH7HlV1qzmnCuNrJXktboK
         JJdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUxvfzU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h36si2580671ybj.61.2020.08.27.06.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 06:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUxvfzU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBIIb-0005qf-GO
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 09:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBIEL-0002ob-RS
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 09:46:17 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBIEJ-0007Br-To
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 09:46:17 -0400
Received: by mail-ej1-x641.google.com with SMTP id e23so6961133ejb.4
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2020 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGrK+0iK2Y0NicqMq1swc/EaOXpiNI5JBP4oBAovEyE=;
 b=eUxvfzU1ksZ/JbgmCJdEly6dyqTpBu3R9NIZhv9DJFDgzzDMWP4GYwQcI/NfQf7T3d
 tFE+a1tCO/Ks+xznjZzepbcdsEf/BfxjHBoieD0Ihhb8i6saee+ekDlNt1N0aQnie4/T
 wkxAmiIeLfxXjUUwf/wpZmqsn9tExWeJumajde0c3LUSMwDIftu6A3kAzy2GC9GJASdn
 k2yErzCfGWFTNDnBeDd2rPkNulNrgLS0iMpXrJTFjGfUA4ATutERK9P9tJ/SL5t3al28
 Qcw545Bhbi6Xg9hFEXmZzih7k1JOQNVyBfiK2CBRaUJro3xYYahH+wVA4ac/xHX8ESxi
 6qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGrK+0iK2Y0NicqMq1swc/EaOXpiNI5JBP4oBAovEyE=;
 b=gRiu/tcUL+FSeopFrGFLptf/MK6BKlyhIQkRmNoORbiqu6PuEc6lQJm/AllBCDWRdb
 75g/7SB9F3BTOhSMEBO7ucMjGOpglQhkptAm5h02KY4ccHCHVab8vKwmNUvNypgicOYU
 3mRdMeg8xLgxndN8JnN1iFEBSDhVYa8HmRGHpuEz3b5Q+yIDYKnqgOqSSHRgklDu9Xsy
 k1mFrqTbfnxmd7eR5GRE70X+2mRvFu/fVoSLsADuyxnPDM2qto+T3/hw6d9VZMx2Y+hp
 xTw1ief8+Uqcu6KgFrH7UaVkdkkxDBcsZPxSKLeJ9/0KhQRVDR6pUsBybz207vFH7lqq
 7FpA==
X-Gm-Message-State: AOAM5337fCUbJjXrZiFGxC27pdpsHuyupj/dX02jV4IOQz27c/tJgP91
 kCpFYx7yffoviP9v/cAAimGsqvTNd+8SzB8q0VDHjA==
X-Received: by 2002:a17:906:2b0b:: with SMTP id
 a11mr11143697ejg.250.1598535974136; 
 Thu, 27 Aug 2020 06:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-3-peter.maydell@linaro.org>
 <0a7f9574-2d82-9c32-ca37-e5fad0e9bb42@linaro.org>
In-Reply-To: <0a7f9574-2d82-9c32-ca37-e5fad0e9bb42@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 14:46:03 +0100
Message-ID: <CAFEAcA9Nau4wOJBORF_=OYV+_3Wzq6Vcw4yoDz=WRtLWxbQhXg@mail.gmail.com>
Subject: Re: [PATCH 02/22] target/arm: Use correct ID register check for
 aa32_fp16_arith
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wKzhtKbwhX2e

On Tue, 25 Aug 2020 at 19:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/24/20 7:29 AM, Peter Maydell wrote:
> > The aa32_fp16_arith feature check function currently looks at the
> > AArch64 ID_AA64PFR0 register. This is (as the comment notes) not
> > correct. The bogus check was put in mostly to allow testing of the
> > fp16 variants of the VCMLA instructions and it was something of
> > a mistake that we allowed them to exist in master.
> >
> > Switch the feature check function to testing VMFR1.FPHP, which is
> > what it ought to be.
> >
> > This will remove emulation of the VCMLA and VCADD insns from
> > AArch32 code running on an AArch64 '-cpu max' using system emulation.
> > (They were never enabled for aarch32 linux-user and system-emulation.)
> > Since we weren't advertising their existence via the AArch32 ID
> > register, well-behaved guests wouldn't have been using them anyway.
> >
> > Once we have implemented all the AArch32 support for the FP16 extension
> > we will advertise it in the MVFR1 ID register field, which will reenable
> > these insns along with all the others.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > I don't expect that any guests will have been using these insns,
> > but in any case the fp16 work will be all done before the next
> > QEMU release and the insns re-enabled...
> > ---
> >  target/arm/cpu.h | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
>
> Cc qemu-stable, for the bug fix?
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I'd rather not put this in -stable, because it is removing
insns that previously worked. (In master the insns will also
be removed, of course, but there they will come back again
once the fp16 VFP and Neon patchset is all done and we can
set the MVFR1 value correctly.)

thanks
-- PMM
