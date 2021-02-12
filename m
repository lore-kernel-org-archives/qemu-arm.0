Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3267734lfc;
        Fri, 12 Feb 2021 06:52:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2KZzE/wvgrNt7VEAnGBy/zpWoZEndvQGXs3iaKkpKqj/M4rqLkaGAx45RD+armZabBIVC
X-Received: by 2002:a25:888f:: with SMTP id d15mr4650644ybl.12.1613141575476;
        Fri, 12 Feb 2021 06:52:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613141575; cv=none;
        d=google.com; s=arc-20160816;
        b=R5pQ+GsgS0IvVObks9jKBNQCb6gAXYTc0+3vh7a5EcSNNOeoRr5AtuGJgnBGDlmwXl
         RXwMwsLws3fPFtG6szSd9CbDvqf8MDTAz1g0mUIRWXMDxq/yfpDByACxXaxcHNOTZ4fV
         DYnF5GK++tp82L1dO7fpo/+x6vQuoYW9ndH/mtfQNQMQfsTgullK9pMc5vXwJkCspWY4
         AN6yq17u5+KD/pbWj+4qZxG+kFoBNR+3cUFgstyTdhAN6O6ZscoF/cdfcQ2VdlEE6fLt
         CXIuqQ3yG5VQfT+6bx34l1+89yq04kvqKGYCkQIfrcBQ4fOyNUq5qh/5wAurxKiNh9/1
         dQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbP3yM0YcO4nZFTX7Qs/Q7+TlKZBoEjilcf3Xsl+S2s=;
        b=oqGCrtJ7c/TO39D7QbQ+45fQAzqv6u5xkbR78gdAeqtXj/Hk1PsVgQtqMA+mqXcogK
         Ku45zm0UeXgmpQbSm67TRNZNNv+FwZKw+Bu6RFMDOQ5jXcSw0M7uFYk4HpuPbFbXfefn
         BibGkWS0/sn91zabNWlxreS/J6x93EgefvYdTip+dkcFTh76lKCml1zxb6EKJkQY9AUi
         4iI3JzcwktoZ2Yl1Jk1jHE7QLF1iMeskUNy17BYX3H36SzKPY9NEFu8FlvMEJ5q3i9bR
         VR/Ka3fZJtbAUPlPj2B0Fdgl3r1wsKZ6pDi/wY7muUlzoF5U/oIvbmRWzeHSpScon+1G
         lyMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KhmBIVuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si8236722ybk.194.2021.02.12.06.52.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Feb 2021 06:52:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KhmBIVuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAZoU-0001xz-TK
	for alex.bennee@linaro.org; Fri, 12 Feb 2021 09:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAZnp-0001xG-FQ
 for qemu-arm@nongnu.org; Fri, 12 Feb 2021 09:52:14 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAZnn-0007DU-1k
 for qemu-arm@nongnu.org; Fri, 12 Feb 2021 09:52:13 -0500
Received: by mail-ej1-x62d.google.com with SMTP id i8so16077573ejc.7
 for <qemu-arm@nongnu.org>; Fri, 12 Feb 2021 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qbP3yM0YcO4nZFTX7Qs/Q7+TlKZBoEjilcf3Xsl+S2s=;
 b=KhmBIVuNJ5B8eFtgQrPzdUIl8gp1ykocEfsml59cVOn4KvKquGbLQ9UZIFmn8qN14j
 XrjfRVZi0fFDb64H+78L67JYBFCf5A5E65i6usS5D/qNdjgrOLk3qVfPq9VSj00dXyPB
 H9gPrwqiDBykdiuQ+fD8hvZTBRgZ+LkOTw3bbPuZNDjeL5paxqIQuJIvfxqKFdRGlvLo
 +9j4SR1yAz6Z0ier7bXcZ/rC7lIKrW4zRtsvt2mCcdqc4OiLFBBrI34RJs5rdxihbsaP
 qprIxxG3Gb0BXfdyuV0IeYZa37AqXCtNEEmIIfIBZyBZKShS/E5SwV376lo0qeggqJUX
 20ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qbP3yM0YcO4nZFTX7Qs/Q7+TlKZBoEjilcf3Xsl+S2s=;
 b=Hw+0xWH/EWsIdK7CmKwCeTPet7IAbguMnMQMu/ajEAO6KJB2y0U3GZHQzAw5HEBK7+
 7OklfRtWH9Iw0+7g+xI8ccYC58NWABIKIiUsiOcB/BGf62g3gHRm8DRomw99KSMkS/gO
 z34ve3Y6WxxOcn+Dxsy+eEi7DOV1FhrbvwyW5bVdJc5aZe7ftw4JLsVzxzRBmsSg4q6n
 Do8CIm9C1Vbkg9UWSqtH155kwqK0z3Knl9IFUyLmXe8ahe6tfOjbql8zbi4IKb+QU3nD
 e3raE7EX5erCEQeFaVS1nfzBuFRumAd8MYGq137ducJWN9lQOPk/Z3V8rhtsLQnsS3WS
 c64A==
X-Gm-Message-State: AOAM5321PTOIESMJn297IoHG8UKdD0Q7MNky8gKntOa+40FkB0cMQK+V
 UFodTERvqqjhUjNi0qksRb1r5FezjzvKQNZ8t9wCH7NAGn1F9A==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3523127ejd.250.1613141528287; 
 Fri, 12 Feb 2021 06:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-21-peter.maydell@linaro.org>
In-Reply-To: <20210205170019.25319-21-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 14:51:57 +0000
Message-ID: <CAFEAcA-JdkHbobhVy6sPVs+juDS=dHrA4=WmSrD0KxkayM361Q@mail.gmail.com>
Subject: Re: [PATCH 20/24] hw/arm/mps2-tz: Add new mps3-an524 board
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JFiS8MhZsdFl

On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Add support for the mps3-an524 board; this is an SSE-200 based FPGA
> image, like the existing mps2-an521.  It has a usefully larger amount
> of RAM, and a PL031 RTC, as well as some more minor differences.
>
> In real hardware this image runs on a newer generation of the FPGA
> board, the MPS3 rather than the older MPS2.  Architecturally the two
> boards are similar, so we implement the MPS3 boards in the mps2-tz.c
> file as variations of the existing MPS2 boards.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> +static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
> +
> +    mc->desc = "ARM MPS3 with AN524 FPGA image for dual Cortex-M33";
> +    mc->default_cpus = 2;
> +    mc->min_cpus = mc->default_cpus;
> +    mc->max_cpus = mc->default_cpus;
> +    mmc->fpga_type = FPGA_AN524;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
> +    mmc->scc_id = 0x41045240;
> +    mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
> +    mmc->oscclk = an524_oscclk;
> +    mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
> +    mmc->numirq = 95;
> +    mmc->raminfo = an524_raminfo;
> +    mmc->armsse_type = TYPE_SSE200;
> +    mps2tz_set_default_ram_info(mmc);
> +}

Oops, this is missing a couple of initialisations for
the FPGAIO config:

--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1016,6 +1016,8 @@ static void mps3tz_an524_class_init(ObjectClass
*oc, void *data)
     mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
     mmc->oscclk = an524_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
+    mmc->fpgaio_num_leds = 10;
+    mmc->fpgaio_has_switches = true;
     mmc->numirq = 95;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;

thanks
-- PMM
