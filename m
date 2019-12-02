Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp89214lfc;
        Mon, 2 Dec 2019 07:35:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/qw3eHyh6FcSHPn33UIQANMZpKacBomIJ3u8bd4fg5dOLsamyaY33/ZhGNSJ+DnYLe/q/
X-Received: by 2002:adf:ef10:: with SMTP id e16mr6834447wro.336.1575300899956;
        Mon, 02 Dec 2019 07:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575300899; cv=none;
        d=google.com; s=arc-20160816;
        b=driiMPwzFX9J/5iAOttKyJfGZ4+og/KAhZ27ujiSvYLd1/+PknwlSzCPXusFbjiCt/
         cphhz9WOA3u9/rH3a8tAEYEG44988ABPhKe69T1GMND2hzd9xDedLAl6a5SivZmgszF9
         Y2IcTfAsiHqs3Sp+xm0MSRJYydB0Bq0/FytGLQUoX9TpJKdcAXObVRw07aWFVgLh4QIE
         SFz3wDB2kxF39V+eq7GxoiXvnMMMX296zUDreZCIWfl2biWaui5/LubjbYqZa0pM/CnU
         nrAoiUvFy6Uyq6dMgRwfdjH2s7NOiV92A/SzmIXAkTrDxxbH63RW6JT8mPmIbvKlTH7C
         M3kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yWx/sBpLVO3XZKtiD0Otn7MVG0ze2/ppcE5uUV2W2Ns=;
        b=S2ndMbUf7KMBtdUN2He6duj4nOsmlvoQ1Sh4cpE/PLTfr7e7nByzctB+qTtelsak7a
         aKmyyurWnFLF5KKfaTMMz1ZVHbgkJ3eKSCNSvpYZGUbDcQMYH3Mt/IkW3Mf/gwdOXzf0
         alT5YggZlZoAld+8ezgXQzH8YRESX2A0FfVcHnnp11f7FtQVdskA9GFCk3viHvcj533m
         7PE/flGWJtCB7LnZbMq4eVZvDfJYc0VC/VdtShXUUrLBHkgkO2vekMGeOmHOu6DCy3EH
         qQ178hWFDVFdIBWrPt42Tni1I8vpDtHA1qlfQksPDmTqbo/V25wyKv9AKeZ4aozaWGqM
         zeSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u1qvsYpy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19si378118edq.415.2019.12.02.07.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 07:34:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u1qvsYpy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibnj0-0004wI-Kz
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 10:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibniQ-0004s3-Ly
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:34:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibniP-0005c2-Et
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:34:22 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:44362)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibniP-0005b7-7M
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:34:21 -0500
Received: by mail-il1-x144.google.com with SMTP id z12so24345078iln.11
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 07:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yWx/sBpLVO3XZKtiD0Otn7MVG0ze2/ppcE5uUV2W2Ns=;
 b=u1qvsYpyp4OZju2Gl0iBTjdd38gaBQNK971DlKXb0RifqrI5Mxeycmn9xvIZECeF0E
 KVRSlnCe66vW7su6GM6qAR0XURQqecrxBMhab8RH9accCeGcngdWcskXvAQ6URUPPK25
 bnBoHkZXlXoGi5fLZlptTeDYCk880OxIL1+t1udfWKILGOZiyClzN3ChiQxvhkXGXMIG
 0+TzhH8lEnK+qsqmyGKhP3rUY15tCU7pGrsu05V6D3ikQMLbWlu+1jf/j24UdLShsclR
 cjQgacQtX9A3z+BBOLwJmwpuMM5jKSaHXbm6MuHW/GuaPRUykQ0Qmb1o98TKq38BIsuM
 Aayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yWx/sBpLVO3XZKtiD0Otn7MVG0ze2/ppcE5uUV2W2Ns=;
 b=D0pj5i9m8QFnlnlhAJyMRTkJIGJh+uXtxtkHj+MOCpC/RbUI0dZZ8fUBuBqHNkTrkP
 he+rfXdwq4+ehnjK9gl5vbJ9OEEwVMIMB83uSbci9mM7wRZoHHopp8g32pmcABAD8iXt
 mQJY9fB+9WlVXdIYfswC6q9XxxwlXsTYHJz7n87gBgKv5S6ZVQB02zJPPM0zLyLarj0s
 yvGW0MNotVkKPHviCTQPiElwQRtt0UhzJvokcgVMxq2DrD2mlHbaIYk7OPhQKy+aZCPU
 ieLZWnG/aYspMlHMTyZYUNbe+GHiFw9OGs1QqrKDxtOh8yO9F06n/MUuAXrDK4TxYBFb
 Krfw==
X-Gm-Message-State: APjAAAWR6grBXafrfzdoNnPa5yzoZ1OAb1Co9JnVHU9z2yxRShpjZIyq
 eOgy3AdoAByFubNP7don0bhoympbym9R+xxMsJyvoA==
X-Received: by 2002:a92:3d49:: with SMTP id k70mr15076543ila.246.1575300858807; 
 Mon, 02 Dec 2019 07:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-10-damien.hedde@greensocs.com>
In-Reply-To: <20190904125531.27545-10-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 15:34:07 +0000
Message-ID: <CAFEAcA96yu6Uttsi6eZokjyxE8At18ADF+Q6c7Na2ArvdLME+Q@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] hw/arm/xilinx_zynq: connect uart clocks to slcr
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::144
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4frpOCKWaX9g

On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Add the connection between the slcr's output clocks and the uarts inputs.
>
> Also add the main board clock 'ps_clk', which is hard-coded to 33.33MHz
> (the default frequency). This clock is used to feed the slcr's input
> clock.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Nothing obviously wrong in the body of the patch, but as with
7 and 8, review from a Xilinx person would be helpful.

/* board base frequency: 33.333333 MHz */
#define PS_CLK_FREQUENCY (100 * 1000 * 1000 / 3)

This is interesting, because it's not an integer... I'll come back
to this topic in a reply to the cover letter in a moment.

thanks
-- PMM
