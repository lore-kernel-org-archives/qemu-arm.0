Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1061731lfa;
        Mon, 12 Oct 2020 06:46:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydJ7PvEaF8vEtEsBCJIP69XeUX4nC34kT6huLKTH90BIcYkoHzpjWv4Gvym+6UNbH/yvlx
X-Received: by 2002:a25:8750:: with SMTP id e16mr15556923ybn.145.1602510371264;
        Mon, 12 Oct 2020 06:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602510371; cv=none;
        d=google.com; s=arc-20160816;
        b=B/hjS3e5owaeWuxK5Y61YmV5LCYfx47H7k5HsE0VA8AuXHYRe/f7Q8evaI1n64OV/u
         IT83GO5iIaFonDqt9E+S/9DHdhJ9sVMkAnGE/zkWOofPLcXvLZ6zik1cWkDawQDkfLQY
         q1btAA/z8mHLueH7SC6z+nb319tpnkAn1CG0hqFo2TduDp5ht9yDeClyz3kprNwpyIND
         /TouTdQlEW9tdDgP/e5n2tftumpjNCHYdak/gBIjmpDMqhTiRUm4ivSx/pyv8Hh6SzTc
         XlcmvzkjM+AvwKCjKsNDERkDjwZj4mI0P3NwX5cIhmxIRF0RfFtdipcgTOSjJNN8Ier/
         hC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VVKKx+irzSrHwI2CV2LmswnFVT60gRM+m6nXIjpyTxQ=;
        b=UUqAMVhDt4GjCUQby2SBcFIX9M4cb+3EII2fWaGvuNymp7cwOd3+QpTUrRpmU0uPxw
         nkJ/Bc88zEPGkEHa0HPPjhcNLkGOQ1rnAOEikeDGLHs+Dpu1qfnWvB0cU8+qIIdIIMxq
         QPc4sDNaxYRxzYXCVDiXGXp2j7pwS4uNAdjRq/fPquQlu2YjIdoj9yIx+43gd5IdmZ/M
         r7itcx4tJhftfc2z9P7gZGXRV8qj7otFQq68x7E0wlz+IGNX9kkGtUa16bZ8p4X6wrcZ
         AgCg7C1V66r3FXGdnxPgDczC7TIdZf9m1Z2dv5u5Re+zlRxSLMB6DNoR8RQVc8/TpG01
         cbyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IQvXeZnY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e72si13679191ybb.437.2020.10.12.06.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 06:46:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IQvXeZnY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRy9S-0006jO-LS
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 09:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRy7z-0005bL-Bk
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 09:44:39 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRy7v-0008Ui-HC
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 09:44:37 -0400
Received: by mail-ej1-x641.google.com with SMTP id e22so23277979ejr.4
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VVKKx+irzSrHwI2CV2LmswnFVT60gRM+m6nXIjpyTxQ=;
 b=IQvXeZnYSOETe5wgWWZrTDtL60uDaF2dR/twiYRFFe5weImJeCwZ1SImgMJKQaJ+VF
 bJPRyhhIy9nFP9rfPL43KEz9cjf6URV1gI+epwDWE89XFIbAWQ7JM91ahrBbukFuhqGd
 0IqebvjTyAtNjqUj8GwkBQg4eEZlg4i7qT3+zEyH0GnjrLZqG/7RNoYFIGW7bttXnCZ3
 syY1ZjsBFKeY8o9bU2R/Ajn0Okb2OoCbjxhLMr+R8mpNiY46fTKb2NKHKWU0b+h0dOPh
 cNUDdjtWf1yUay06AmHIlMuyvIYJX3b7srUkxvJ7aY/qNOdwxNh0jSAPK8TE0kudQTA1
 kHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VVKKx+irzSrHwI2CV2LmswnFVT60gRM+m6nXIjpyTxQ=;
 b=X9TLzy7y29HCSnFHtb2PrWSSw/p4urBqMUfIc5RAMIvKRJtg1f+4vGWjnRB0g68ACS
 AWz0jDhjvDUp1FWp1s72/4tvY0PHYGexwN85NYQVvHIlAVQFUtx37ivrhpr50V+WKYwh
 1YDuBTlH0bQZshqh+KXufWtRcl/cuJfJF4mXJ/w5loyjURDM8cp/M0UruSGBqq70V/JZ
 MGbzhl2jjkNE/f3V7CH4UzZeeZ0Y5UsVQsWrVxxOY1PUzgg5VUhhpaEe/G4wourEagtM
 MmF+8D3PTXal7yzCcqMWf5a3Nm2NaXY5QxA0oQ2ztth3YAyYC/mnHdetl+fJnbEf4V5j
 G1qQ==
X-Gm-Message-State: AOAM533fpneNPGyT+PvYBZJ+ovUS+5BB9HURPX8EO9RLy6N3prb1XnuZ
 oJQ01LW0ARZFkrZ4386KonYfVVhmDTzvSfDOxMP0MQ==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr27643606ejk.407.1602510272309; 
 Mon, 12 Oct 2020 06:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201012132017.3423954-1-f4bug@amsat.org>
 <20201012132017.3423954-5-f4bug@amsat.org>
In-Reply-To: <20201012132017.3423954-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2020 14:44:21 +0100
Message-ID: <CAFEAcA_rSR4_EB2jqyaYJ5i6twgCMO84t=Ozo9hFx5JQm-1uZg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] hw/pci-host/versatile: Add the PCI_BAR_COUNT
 definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E6ami3t70T46

On Mon, 12 Oct 2020 at 14:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Note from Peter Maydell:
>
>  The versatile/realview PCI controller has:
>    * three PCI BARs which represent memory windows on the
>        PCI bus which bus-master PCI devices can use to
>        write back into the system address space
>      - the device SMAPn registers allow the guest to configure
>        the mapping from "a bus-master access to an address
>        on the PCI bus wherever the guest mapped BAR n"
>        to "a system address", and the smap[] array holds
>        those register values
>
> Use self-explicit PCI_BAR_COUNT definition instead of a magic
> value, and rename some misnamed variables indexing the smap[]
> array from 'win' to 'bar'.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
