Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1236845lfg;
        Mon, 16 Aug 2021 03:46:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh5R63WVPulBEmJXtZjmAKk+Su+2PEFaMLek+0tv02lbyJ6ihyo/NO16kWamF16vK3Y7+8
X-Received: by 2002:a0c:c245:: with SMTP id w5mr15646495qvh.30.1629110760918;
        Mon, 16 Aug 2021 03:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629110760; cv=none;
        d=google.com; s=arc-20160816;
        b=UIwPCvYH+7xPo3CnWm41n+1Z+/zh4Usw+0j+WEzYd5VXMTyhVkvk8UMqPcIQlYpd3K
         KOU2zu5xQjVhGV4xoKWtRHVYl1SEIisXSV7H/zYUSHDT1bGXG0fjD1xd9kAkEledtO3h
         hBY8gv/T8Xh4vZtcFKdybz3+dHC+XI+mcpv7zGrjvhYdV11COM5VTx1ImvX3SXvesP6o
         CTdY+DZMK+yj6SgjeOhE7sSEYa2r7Ujkdj9TQOjJ0pgdPe+1Bk3bGzIGmnGjJSgmGu3E
         I04ZpxiLxWGh1Qn6+fQuDwfPemigNICfVunbxWYy4nnRlVKctLmvZrjjdSB+DPMhuHvv
         vgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ho1DLMyaJWl7WIJIh3nj7x+9iAXJ5+KyqaYhyvJxFFE=;
        b=sURSvNJqn+fmuyLwztv8NtLiL2P9XKHLifmDw3rQ6EeISNoZFrURFWtFVdzk9eNynF
         og1CuR6h/eWMNeF87gTf5MBCL+RSXMtswNXd9hc5WOxa4Y2TsXFJeVhFelUAUKl3T9ai
         ZtQ23hMf24qRwwB1X+kpQlrNovoRn3a9LxXdy6VxC9lzzNVxhrIYTTJZ3qe3ODsjFNM7
         m2FYxKdxoQHNPvbRyEB44OCH+jThlMSh7E45kihQwSfeQkIItIUdnS89w2h4ZHhZTvFt
         sRBFKZQi8WwjUT60BzHIiwcXKfc+9f6hzm8POaoY435lFGucQuO35kf2bnxuIddLEGfj
         71Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nJYuOk6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si4735873qtp.350.2021.08.16.03.46.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 03:46:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nJYuOk6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFa7y-0005FX-L3
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 06:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFa6d-0003PF-LH
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 06:44:35 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFa6c-0002rA-AM
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 06:44:35 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b7so25739070edu.3
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ho1DLMyaJWl7WIJIh3nj7x+9iAXJ5+KyqaYhyvJxFFE=;
 b=nJYuOk6V4fHouxPHp5raf1GYHHtVwNtxyE3uENWAep9y8d0qUf6L/WlJbhmstHVkyZ
 hCz8k+Nb6Bw56enb5KReSnUzEvL/V2g1yWSj6DLtbnF/cg3Tcz8B/ALjOGi5WWCA6N37
 U2vrxr3wroxx49acyagDglQus8lQTxvHdgfiXDLQM3kOlF0lfs3+yD0uabZYrKyVy7Wy
 piBAad9JxYQERTJep0a3Jw+B8EGVs52OKWdSn6Bp8q4pNhIjOKjk1MFul0L4WHqNxN19
 hFmOnIdfGYz3/+IU4A+nWCbB2FroXeRfMdVXMeplruHrVTfmoSqAd0ib3E2ePVze8Mm2
 rr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ho1DLMyaJWl7WIJIh3nj7x+9iAXJ5+KyqaYhyvJxFFE=;
 b=L4IwwFPGUK+5cB4pRHgzonk8LATa5hh0oOakTneIDf+87SBr3KlGmQmDH/DBrf42gE
 eIOsthXjtr7Al+M9MEgmAfh1XoCIiV5wJUkrUdljke8ZQVK2Nd73pko5ibeavfkbqW6w
 0VO/I62j1Q3Pgf1Z+wwTORf4hmoKz6RhGF2T753pPHKu4nqVPoP2plRc/Br0YKkRTBi/
 1x4T0eGe9a2rlI86H34sTWlLLqmDYl3FQEaMaozpRqVITrEiPh2s/IocrMCTA5jHWhzb
 iCsQ45YJZhVWZw7xDVMh8LK/Z35nn4Ccv+Su8JEBTwp8kObccdCY32opkOw0r9NmRJkY
 hbbQ==
X-Gm-Message-State: AOAM53374fZRO1PClzfWOcP5yH27nuomJfko4mAtm03CLMmH03Ko8YxT
 WNehJGWE2RozdG1725AkIAT2LXkcwxi3jS7TtD1C3g==
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr19088479edr.251.1629110672492; 
 Mon, 16 Aug 2021 03:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <4C23C17B8E87E74E906A25A3254A03F4FA1FC8CE@SHASXM03.verisilicon.com>
 <74c133ba-d318-4e27-76d3-11af5d72a214@amsat.org>
In-Reply-To: <74c133ba-d318-4e27-76d3-11af5d72a214@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 11:43:46 +0100
Message-ID: <CAFEAcA97tnmxZOQQWdkkCCe6UL_AwfBdohKXJzpjWye8ENra9A@mail.gmail.com>
Subject: Re: [PATCH v3] hw/dma/pl330: Add memory region to replace default
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HqRQrrQXBYF2

On Mon, 16 Aug 2021 at 11:41, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:

> So when multiple controllers are created, this makes the 'info mtree'
> output longer, all AS named similarly:

I think this is a problem with 'info mtree' to some extent -- it
was designed on the assumption that there's really only one or two
interesting address spaces, and with more recent developments that's
just not the case any more.

-- PMM
