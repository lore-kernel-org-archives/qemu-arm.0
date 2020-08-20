Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp946793lfy;
        Wed, 19 Aug 2020 18:53:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt655k47TPiG2hrM1ec4ZXivcs9geoaXur+hhtFastUDNsHJDY4ydRmTF7XEYBn/6Sm5bL
X-Received: by 2002:a25:328e:: with SMTP id y136mr1661666yby.281.1597888405854;
        Wed, 19 Aug 2020 18:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597888405; cv=none;
        d=google.com; s=arc-20160816;
        b=yQlxszXdQ4Z/un3Mq+SwazZaKwatYR9D1WtNEs9dCT6tcbGfMPpSiLGzY14ZqPOG0O
         pRDOHe02DM5BqTy+OMnVDoSvsRotoz55km4h+ry19mObFSi1eNSFZaPzm4wfsoFDq2Bc
         TtU1wqTCzriS1CpsbP1/MY3lKZ+t6NGEZyAI6pq9DLSXH24c53eYOaBzH/8KHcTztqXF
         yZRlSvm09y4rW9hYVqn26cNFtFQzDzr/WdKc3jOkGnUPao3aUboFAmkY++X0udYBXuAN
         xY6DSk9ji6/VBpn+qQTB6CeqHKPeOovbnFgTnGUD99n1TlKI9VEy+88/cR03Nc9cI6Oq
         rh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5fY6uLENvIP8/O+yKASXa5VJ8j7ZSDVEkteHFxVGL1s=;
        b=jysxrN3eJmqHI34uUsSWLxRrw1Ef3uNF/263GJBw+l61Ra+bOFYKuxd3nYhSeuXF1Q
         povuXpNYqzjLlAyJpscCTynHJzgn0GIferb2ovGPrVgug5vYwPy/vS0rrXR+TIf6b20X
         X1/djwPYcHhE8WFlWc/AAdYV9TK/lmNcaAIMJou2NrALTRt6P+w7loQVKBptf4SP7GaI
         UplU8StOTMrATlgL76OZY+J03g6IWucPvnICpMPagLF/S1P86sCzStk0idYiBWq7LR/F
         FY8fbduO82hECVy3tbQqlaDR8aRcpRDEERx81ot3894MWfp4eNQuLGAt4O107YiJM+w6
         9UKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=wSXEA457;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a36si652060ybi.17.2020.08.19.18.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 18:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=wSXEA457;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8Zld-0002HM-9G
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 21:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1k8ZlV-0002Fi-O2
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 21:53:17 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:41892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1k8ZlT-0004wR-3z
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 21:53:17 -0400
Received: by mail-vs1-xe42.google.com with SMTP id y8so348296vsq.8
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 18:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5fY6uLENvIP8/O+yKASXa5VJ8j7ZSDVEkteHFxVGL1s=;
 b=wSXEA457EIkl+roCtRKkpd5BMbWUrS0lIfL4L4HsrhJQmkFwslBvB42Tfutci54nDn
 1hCnYEqg50EBptOdeBNeJOuh7Sul/pW9uroKUYP3TyFMd5LEUQm/Nkm8d/NWKZpAi3xr
 GfWjrQ1nl2qlY7fPcq7t/6KFUc/6osBaOMlbUiAikTjEZv4JsNCUxpXvBXHm31VK2grw
 ioYyfACdQNrUl8veuxxcbbd+PDawU40bonKJb6BsGVTa4/toGh8VUCujEhcGOWxj4WV8
 FFW+qtZ8NWuvLhxofhLfE4CN9TFZtD8XyAViteHDHjdIdzSMwAcokKRsILrBNPInmcGM
 QTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5fY6uLENvIP8/O+yKASXa5VJ8j7ZSDVEkteHFxVGL1s=;
 b=rHUw0CTqM8n2yH9E00ro5LtnsO2xg+0YuhVkKZ+IzQT7wYWF2IQXdVXIwaSFjqbL+N
 XJeu0iL/SIXP5M1bDjbsYpGg4CqLWrjvqzqP9bOP7ciCPducT2PeSzpmi/o37NXr8TeF
 aKGPEoFvLzOTu00bI12Uv2OIsEx7ZZnYbxf/vp/FGSRkC/PJygctehNCbTIsNcMYBeyk
 oXFsl/2vNBiyMr/HAFMLEA0sbRKx4hN21Zb78KM0NzidcHHtf5gpN9D8X5607a+TKvEa
 BxJvwYq2RzRqI371f0g36vCvMqzxOhHNciZldj84unzejz8MZ5O0UzlaobTM79guzLwK
 E2Pg==
X-Gm-Message-State: AOAM533Gh6a9lY6EchtnzlvmaDUv5vwPcEcImUak58gN81OSkhrkDgGQ
 XxE+2JeUFyBdD7QowwoBILQoWl56uyR62o+yOOdnSg==
X-Received: by 2002:a67:7d50:: with SMTP id y77mr665080vsc.207.1597888392435; 
 Wed, 19 Aug 2020 18:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200811004607.2133149-1-hskinnemoen@google.com>
 <20200811004607.2133149-14-hskinnemoen@google.com>
 <64f8cd56-306e-4961-488b-36c666894a54@amsat.org>
 <CAFQmdRbvSKYJ00tE_79Eh+gW_ge8kEco=1gqFtvMcoJGraozdw@mail.gmail.com>
In-Reply-To: <CAFQmdRbvSKYJ00tE_79Eh+gW_ge8kEco=1gqFtvMcoJGraozdw@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 19 Aug 2020 18:53:01 -0700
Message-ID: <CAFQmdRZCk5Rqb1C2TRCEUMaKmF608g2_Or8mLCTSG03nCQ1Ygg@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] tests/acceptance: console boot tests for
 quanta-gsj
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e42;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 8S6NREOfh4O8

On Tue, Aug 11, 2020 at 8:26 PM Havard Skinnemoen
<hskinnemoen@google.com> wrote:
>
> On Tue, Aug 11, 2020 at 1:48 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> > INTERRUPTED: Test interrupted by SIGTERM
> > Runner error occurred: Timeout reached
> > (240.45 s)
> >
> > Is that expected?
>
> I'm not sure why it only happens when running direct kernel boot with
> unoptimized qemu, but it seems a little happier if I enable a few more
> peripherals that I have queued up (sd, ehci, ohci and rng), though not
> enough.
>
> It still stalls for an awfully long time on "console: Run /init as
> init process" though. I'm not sure what it's doing there. With -O2 it
> only takes a couple of seconds to move on.

So it turns out that the kernel gets _really_ sluggish when skipping
the clock initialization normally done by the boot loader.

I changed the reset value of CLKSEL like this:

diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 21ab4200d1..5e9849410f 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -67,7 +67,7 @@ enum NPCM7xxCLKRegisters {
  */
 static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] =3D {
     [NPCM7XX_CLK_CLKEN1]        =3D 0xffffffff,
-    [NPCM7XX_CLK_CLKSEL]        =3D 0x004aaaaa,
+    [NPCM7XX_CLK_CLKSEL]        =3D 0x004aaba9,
     [NPCM7XX_CLK_CLKDIV1]       =3D 0x5413f855,
     [NPCM7XX_CLK_PLLCON0]       =3D 0x00222101 | PLLCON_LOKI,
     [NPCM7XX_CLK_PLLCON1]       =3D 0x00202101 | PLLCON_LOKI,

which switches the CPU core and UART to run from PLL2 instead of
CLKREF (25 MHz).

With this change, the test passes without optimization:

 (02/19) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_q=
uanta_gsj_initrd:
PASS (39.62 s)

It doesn't look like this change hurts booting from the bootrom (IIUC
the nuvoton bootblock overwrites CLKSEL anyway), but it's not super
clean.

Perhaps I should make it conditional on kernel_filename being set? Or
would it be better to provide a write_board_setup hook for this?
