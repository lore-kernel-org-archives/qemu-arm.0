Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1059938lfa;
        Mon, 12 Oct 2020 06:44:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWfWn1vN6gD3WPID1fnvB1SHFquxHB4nBQx1zFTpd3iWmdYntnFQinZaHIrWOXpomKREM6
X-Received: by 2002:a25:ef4a:: with SMTP id w10mr30979744ybm.487.1602510245970;
        Mon, 12 Oct 2020 06:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602510245; cv=none;
        d=google.com; s=arc-20160816;
        b=eG1Bu9AyczAH7urcbBu9zp6+ETqbX/r2UrpaFxF9hyuauZEdpCiS6IEOi9y/J7tF3M
         nQ7870/fkejApvrhRzShrI9GIDzHFCcaoCV2YW0yKX2jc6kjwaka6xk186FD+zZAsMYr
         yEX7LFovuVAvw3jMM/XgCBzQSvNF/dvRPHta+xVF5A5JPBRbOplfhdM3c7jmjE3tycpv
         bmxOJLnMXUruIZjXXaZiykY9L+zZag5wwvPNo5EnSd31zREp0w/BRtahUimAqWSlVS+w
         wdi7YfE8USOvQRapuWu65rplmdRSiLJkN6EDqil8rWTlWSjZ1XDxirqf0/nW+70j+oQy
         Jm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=s0bN5sJuFOp9u6T3ynvKwBCLRMeAQ1tWBzQTPfoDhkM=;
        b=F8JB6qH6q31Ty3KjGhQ8Qf9JzimaZ4ZH00ysBOHnWYoJxtvW3dCkqLtDFKAyhdQY9N
         47RSeUy9E0hx1MJedXWVyvB5VcvvtNd2ek47lUHk8121SVgx8DWUsF8hc6KPYLuo7FVi
         Oj6mcH0NOJYVLouvPjf8N+CPXh6/7O2vS/VRhML7852x612Ekn5ivVXt091briaZRpjb
         5RHSeMLqAGf9+8Aps6Gn0GGD7S1vRGtZCavcSJSPn4MjtLqMT+0qD6bEt2pmVkZSEiQN
         nCGL10EndkSnRhFvCp9rxMlojbvssNuz7rt5JfrLniMLemSiU8dwFNOqaoSU5i78nl5X
         wZ4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=upGvzAnQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si13811474ybc.448.2020.10.12.06.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 06:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=upGvzAnQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRy7R-0004qj-CB
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 09:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRy7I-0004ow-L8
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 09:43:56 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:40568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRy7G-0008Qy-Mg
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 09:43:56 -0400
Received: by mail-ed1-x542.google.com with SMTP id p13so16988907edi.7
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s0bN5sJuFOp9u6T3ynvKwBCLRMeAQ1tWBzQTPfoDhkM=;
 b=upGvzAnQ68nAdVyQ1fJqtgTN+PzWX4kKSDR0osI4UwsdXIj+OUoXX5rXwtZEf6hWW9
 sTQ9QtOTooDFvaApWEzkpw8e75A1HmA4isMDJlrvi13Fw1qyMkU7LEQac1gQFt1pH+Li
 3GRM9B8nPuej3gE/zlLMirpa00z1azPpMejXRzDeqG8tqR5xmYbXRvKCMI2fhidjLqXM
 WVi3oFnrKjHeusIebXStgIi4VaRurzRT+LmVLDkqTxgnI6a8n4DlYvCoiLj/71BqRx8G
 KOpy2MaTcBHpDQeC4I9HayShZfFSA88kWpFEbU4eays6ffbbhZK1XJ/S/bkDcduDeif1
 D+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s0bN5sJuFOp9u6T3ynvKwBCLRMeAQ1tWBzQTPfoDhkM=;
 b=aA91TnerzLBH08gs2TSgy6zJ2T/u4TcFpsyyg/U2qmZ54BykPHSTJJTNa4APZ5wl4y
 f0cadhTFbFPSLFXu/hI0fkG8jRUOYgnCeCrhvaug5BnFty3k4bSF+AMvQTrVP+hKB9KP
 HtOH9u75mNB607D28SuD26duDodqVoBWYyf5p9Mhffy7lfm1U6GPiiLEN6aUjXrHlvxK
 l6HQQq/uKkV6/srjF6vDyihl95nPKgAr8eGJdf066H6gXi6KPsA3VKfQzsz88AiO5c6X
 3aaWsD49/rk3Vb2jlGJURmZFhONqOt73EWh0Wb3R/MviPmvDoGWB0hlyQmqEztD5TttE
 SK5A==
X-Gm-Message-State: AOAM533vxXVTNmlCRlgFK1IS/4G/Hbp3ph5t6s09b4d7Hq3J73q+fE1t
 4NKda58QnsslsPq/mIDTk7FMs5lUlA2Qn54EZUgzbA==
X-Received: by 2002:aa7:d79a:: with SMTP id s26mr3068255edq.251.1602510232845; 
 Mon, 12 Oct 2020 06:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201012132017.3423954-1-f4bug@amsat.org>
 <20201012132017.3423954-4-f4bug@amsat.org>
In-Reply-To: <20201012132017.3423954-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2020 14:43:41 +0100
Message-ID: <CAFEAcA--bNZGyYyHMJr+yCAtXYepf6x641Xr7VuhCcjBF14tCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] hw/pci-host/versatile: Add the MEMORY_WINDOW_COUNT
 definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: icgbUQwR4OMb

On Mon, 12 Oct 2020 at 14:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Note from Peter Maydell:
>
>  The versatile/realview PCI controller has:
>    * three memory windows in the system address space
>      - those are represented by the pci_mem_window[] array
>      - mem_win_size[] holds the size of each window
>        (which is fixed but varies between the different
>        implementations of this controller on different boards)
>      - the device IMAPn registers allow the guest to
>        configure the mapping from "a CPU access to an
>        address in window n" to "a PCI address on the PCI bus,
>        and our imap[] array holds those register values
>
> Use self-explicit MEMORY_WINDOW_COUNT definition instead of
> a magic value.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
