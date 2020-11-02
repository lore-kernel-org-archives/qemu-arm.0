Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3852008lfa;
        Mon, 2 Nov 2020 03:43:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKLwpDEILyKiWOu9hGRS3u3E2RgsIDIFyzHpC+qE8+Xz2etQxrXs7PqQF0w8benrwkWKtX
X-Received: by 2002:a05:6214:16c5:: with SMTP id d5mr20472439qvz.42.1604317419487;
        Mon, 02 Nov 2020 03:43:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604317419; cv=none;
        d=google.com; s=arc-20160816;
        b=Wnydizr9FzkcLfyyBQdcuCXhjk9D6xlwBEZ5pG8VBLz6tO0K+PFeMEyxgdiR899Gv1
         /EBeg6yLWNZFWqOGXqKCot699XZp+dXzaXftVS2J1GunBxI7Tvc3FvgfZbjeCQ+M3ngS
         W5015G915iVVdZR2YM0Q5RGc+xnATuiGuoTFOWmZLhpb0NAfWT8zbmNa3oU5MhUOtQ5+
         sn/CRj9c2voAklnHpJxMP6nltFjlGcFUR61VSyMpu9yxOK45VZa+G1AM5rmPI5qPRFVU
         L0yuZzwlKgVrzGLWrqY90ghv7YIfP1KuQIfa3EcqFKZyQozL4JBxYI+gxFE/w51sA96N
         Ul/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Lh4FMiC0ZDtG1v8r5aV0+yTQMHhtss4uQt29DivgaMY=;
        b=C2rYPBanQlskXn8BYUQ+8LRONfnnrr0Btx+PHq9DX/lLBDKhwX1j4chYg0XLK4ovEA
         qrHgnSjFVmKf9HfNiOklgwA+UrcDGJq6q6Noh9UhL/y/NrTMqbV120iTZrBREPCajJ66
         lu7/k3CCobMOFS2hyJvA9VJZ+YbDjqYOc2qShg9DVLDnRntJ5UJfiX1Okip/kUlF/qB3
         CAeD9jM2npRyaqRaMcbBucuAIfTiAlLno6HQfDDqWMXAAFT2LvnsRzrlkZcaszIsAnPv
         370sGZDB6hH5JUJsWEtAnmVrXCjv07HHVwAaus+Igst2vUnthd0ZDGSswyCwM9nPGAwm
         R4tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZNcw2MDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v63si8779947qki.187.2020.11.02.03.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:43:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZNcw2MDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZYFO-00071C-V9
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZYFE-0006yo-6I
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 06:43:28 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:45143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZYFB-0006a2-By
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 06:43:27 -0500
Received: by mail-ej1-x643.google.com with SMTP id dk16so17874824ejb.12
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 03:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lh4FMiC0ZDtG1v8r5aV0+yTQMHhtss4uQt29DivgaMY=;
 b=ZNcw2MDfvqc7h8uM7BDfegQi4eMuETaw5Hxr5izY87P0McVmFPjADW5IcGeVFGEgbg
 L/61EnYnMiKm/3DqjHhFDHHJob6X94M0aHDfvc5uaL3LtdjEStZ7zu/qxxHQcDoLkOl4
 UB1J99gExCXZeUjaveofmxnttVQc526lHX/xXQhytNa/RuEH+wAs2rsz8LKVmrEa8mms
 bsP2vkNiPyBZhOMOi+vCd+2Ys3kYmP92hIzc3r0EQuoGz5xAQXboW384kYMSVDuhSnta
 SXIJhsURZmTwPEtp1AjeI1Nhk6ztVRVsmyBK4qgt+3HM3Y4mrc0r7XuvhX2+OeOTXKKV
 XXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lh4FMiC0ZDtG1v8r5aV0+yTQMHhtss4uQt29DivgaMY=;
 b=ua6/gQHKytF4M4n7AWwGu7annjmjuIjDQ40HIYG2WLEnA1Z0ibpJU2HQYgNVwA6IBz
 BOZ+K0Ejs0h0qoHxpLCarsc5H3zA5kXSdKo0oXbF+rDfUUxBgWuOQXEXoDUoXAyIX57h
 O93avqWAUIypb/5J8iv/9XmEjneZW7TbGyEdL4Ff81CFnNsyN6LZiwbzRx6eXtHt97Ma
 1IysiUilqsVEXNW3UhbFFeg+ElwndsgrHCDx9wiQcKref3AD+fz7aJ01MDGrRy9JCFZR
 ey3j8Zpb5y3UAVtr5qIizBt9w7OSW8FM9ki3Pb0fh4Qsb3usZ71GOAlPoir5Z9z3WQQR
 ZObw==
X-Gm-Message-State: AOAM533zsb8Wt7qipDafCUt/NPHjLOOlY7mY3jH356PP27cpKDcpj+P0
 bkCk9ka0jAtg8cnXIo9mJW6ud6ne3JTL0P9xnNQaMA==
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr14391848ejb.85.1604317403905; 
 Mon, 02 Nov 2020 03:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20201030151541.11976-1-remi@remlab.net>
 <e6066544-a259-9739-3acd-2d9abc2d7455@linaro.org>
In-Reply-To: <e6066544-a259-9739-3acd-2d9abc2d7455@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 11:43:12 +0000
Message-ID: <CAFEAcA8wCQrg9zST1eM3Wsa0LPVkG1D=NFjRu__GPYLpssr1ag@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: fix SVE for EL3 direct kernel boot
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jm+ahHUJtMNl

On Fri, 30 Oct 2020 at 18:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/30/20 8:15 AM, remi@remlab.net wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >
> > When booting a CPU with EL3 using the -kernel flag, set up CPTR_EL3 so
> > that SVE will not trap to EL3.
> >
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com=
>
> > ---
> >  hw/arm/boot.c | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
