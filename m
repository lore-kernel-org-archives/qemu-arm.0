Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3984218lfa;
        Mon, 19 Oct 2020 08:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGMvzXk3M0QMjhLj8XEsATQJbwpgI2r/ExCvvHczes+ukYC70hUAL0XL+f4fBWGzxIcRH2
X-Received: by 2002:a25:3303:: with SMTP id z3mr400317ybz.9.1603122460783;
        Mon, 19 Oct 2020 08:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603122460; cv=none;
        d=google.com; s=arc-20160816;
        b=0aP7bEjzUCRC7DslQhtlxEJ0un7v02L4vMSHH7t2bt/YpzhAByar+xNlYHFATxtpZy
         4Q5s33um0HGsCdpZ6EqCiVjTA4mOCMz25nbX+c3FyJx0TClykHpA53X/F6TDfrA3cVec
         IkevppSbGjAX/Hl4TOmHkyxHuYVal40YBIpfbwJcgHnr3rMLXAIIimywiCWUr5hXWA2A
         +gPkWLXcuWGhCRgdtaO2udeZuei83i+ILBb2coOiXwli/JEfYzpLvNDh6UWC71+11mOB
         QacG8qDgPmM9vUdH9uRRgZ4oVTZRGPlrd62S3GBzdZGRowyAXEbDO9lCgIjWx6Yq2d+v
         Maig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dLwOr1pJHfoZPQ4z0yK4dGfS0b5vrWlpNreL4DO3jS8=;
        b=vhBWihBW3EGJ/TMG5fo9LmiON1PP1KcIn1F6FLPSoiU5s9PJWT4tegI69rYAZS4omf
         ybBBpcQJG31yitInUF/t0KBBWkqq5QqURj4hmps/Frd20V/gz8SXngFrs8ukL5aJKL+q
         yywFUotjnbcslqBy/c3o4ZTaLTEADX4Y5bJimYxrK18yglGPz4LHIh/CMQuBv+nGuVZ0
         MRUn5TssVYwiqXRrJA4ASFbsnihwSmoU7dfi/r0Yec37dUus0ZeRyJaIqcQivCYiHj2j
         0Sn3adO2ga1+pw1rm2XMiRjkdgyIvVI9bpOhAznoQwR5cOgMxJwvAa1g+1U9ANBS6+3r
         5/6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u+J23zUD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q26si284536ybj.395.2020.10.19.08.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u+J23zUD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXNs-0005mk-49
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXNg-0005la-1f
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:47:28 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:33836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXNe-0007Wv-38
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:47:27 -0400
Received: by mail-ed1-x544.google.com with SMTP id x1so10779943eds.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dLwOr1pJHfoZPQ4z0yK4dGfS0b5vrWlpNreL4DO3jS8=;
 b=u+J23zUDFOTE3DIKZzIQDuGppmouhLGqYJMTFxq55tV73tBG5L1/SrpV/JZfG0idlB
 3xrAiFQnV8h01aZijuVCV/EsDQc8He8duzsvcM1Prv+y4nPxvdYHLNpp8rq2BjT3xfNx
 UOaenGaatXDQRGIHtRgGNtreo30G/6sODgKjSyiRtWfhVcC81Oli9a51YydALlACpyC2
 SOujavjTexbKb+A4YPHkFT4rlQFsPRtKuYzp9/uy1A5e5BPcT8zC+a8NyUxaVW0N2MKU
 kL1o9PmRU+XOxyFyYbISkdmV28/HL3/wutrsYOiJx+ABUxYaqy3G0onPtEtq5apeh20Y
 IjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dLwOr1pJHfoZPQ4z0yK4dGfS0b5vrWlpNreL4DO3jS8=;
 b=tViTdY4KjkRSLTVRs08nSNVfi50M29MdK8fNlHflCdz75fUvtCtdXQW7yw+AYze7W4
 MMpbibFRHYtkS9OTvymw0K33L2UhCW/xprj7tOx4zGsZlva00zGdf5ofJpavNXQ+fPah
 PDFEpY7gjEPbHySE4DVn5RtG4EY0afW2x/gu1fo3ujAPBXNOtlKcGQ5YK58otgfPJxfl
 mDEJ+X8ZQDMptMvmyWShRUTbwYGD4Zcf9WDtGexN9G3u9SlX4wOWkw18hga0IqLj/YSM
 yhIzYuTJ9wZdW9xUjuUNknLtoqFVqPZrtM/9JddteatHEbNRm+Yy9kibORk1eVOv2hlz
 Jk9A==
X-Gm-Message-State: AOAM533zPjHK7APquKJ9/XFQss3XKdY4IdshMo1LFKdxkGPFzW4VMpmG
 dkWikKFCBa6ztpCYGEYACfcQfKaT+UcO3zsh3JM+4w==
X-Received: by 2002:a05:6402:3133:: with SMTP id
 dd19mr473536edb.100.1603122444568; 
 Mon, 19 Oct 2020 08:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201010203709.3116542-1-f4bug@amsat.org>
In-Reply-To: <20201010203709.3116542-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:47:13 +0100
Message-ID: <CAFEAcA8EDw2Usgya3kZamqOwi0OaUT=C_1mv37tftBBt_TX_+A@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] hw/arm/raspi: Fix SYS_timer to unbrick Linux
 kernels v3.7+
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uVNPl9C6a89g

On Sat, 10 Oct 2020 at 21:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> In this series we implement the COMPARE registers of the
> SYS_timer, since they are used by Linux.
>
> This fixes the hang reported by Niek here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg682090.html
>


Applied to target-arm.next, thanks.

-- PMM
