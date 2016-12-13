Received: by 10.25.205.13 with SMTP id d13csp2171895lfg;
        Tue, 13 Dec 2016 04:33:35 -0800 (PST)
X-Received: by 10.237.59.6 with SMTP id p6mr92377990qte.217.1481632414936;
        Tue, 13 Dec 2016 04:33:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id w30si28042067qta.180.2016.12.13.04.33.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 04:33:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGmGy-0003g4-8Z
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 07:33:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmFf-0002sR-B5
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:32:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmFZ-0004Lq-Re
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:32:11 -0500
Received: from mail-vk0-f48.google.com ([209.85.213.48]:33496)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cGmFZ-0004LU-NQ
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:32:05 -0500
Received: by mail-vk0-f48.google.com with SMTP id 137so58838522vkl.0
	for <qemu-arm@nongnu.org>; Tue, 13 Dec 2016 04:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=BJJWs4nZmmrhRsmPgTvtLVpJocMMiCWo7txeX2J6dcU=;
	b=EwhwHtw+HoDwg5w0FG/XIyQMwo0TkKi7IZnf+oHf7jxotvq4jkfsO99CcYZjXjOtZp
	ZrGoYWAQpyLOKotx5+h2I9tqtTtuiLu+t3bd05gqswiW4bMC9xwIW/e5G5jIIySl7gK+
	OGhVU97wElL65iB+QwZ6aZxR+2GvBIE7PDSYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=BJJWs4nZmmrhRsmPgTvtLVpJocMMiCWo7txeX2J6dcU=;
	b=i85vNl2Slw6F+pcDxgweEHtPrPjuvtSMWST9IuOdETK3HfQgMj8mjtqHoJjlTxG9Kg
	7RTaRHozG/grPqki/sgNC0a2UhY9BPpKgnZgEpWsmZvRgcO9dMktVzaOAGVPtwWq23MS
	JOh6fxAy7UAAu+J7f7JC+za8DRlnnVwyq92hiGPHRVFs90K21l6U9CqtnSnDa2o9iubF
	++z3Mwkc3vukUVxbkOY9nHnlPJ4QxeAiF1cwWGA+tUSWdB+/o0d+oy98KwuGWleS9ImT
	sRY9XokFPiaOVNC886/7FthNIzOgBmCkV1kuuLl0SvFXNup9aIJXmj571Dh44Zshc4EI
	a9/g==
X-Gm-Message-State: AKaTC01j41pDFCP+1imimU4nAMZPHHC+gBY4+cMn++jcq9YoYwwlmbuc4wpD4PQw9FjK8ckqRf96/NiEbMAwLjrR
X-Received: by 10.176.83.12 with SMTP id x12mr80425558uax.131.1481632264933;
	Tue, 13 Dec 2016 04:31:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 13 Dec 2016 04:30:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2016 12:30:44 +0000
Message-ID: <CAFEAcA_D9wx=EZWE_ypAFPkQcYBhM+7NJaOt7rg=ed-0fExo8w@mail.gmail.com>
To: Andrew Gacek <andrew.gacek@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.48
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-trivial] [PATCH] cadence_uart:
 Check if receiver timeout counter is disabled
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uaI04kZY/qfe

On 8 December 2016 at 11:21, Andrew Gacek <andrew.gacek@gmail.com> wrote:
> When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
> 0, the receiver timeout counter should be disabled. See page 1801 of
> "Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
> such a check before setting the receive timeout interrupt.
>
> Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/char/cadence_uart.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Thanks; I've applied this to the target-arm.next queue for 2.9.

For future patches, if you send a revised version of a patch it's
best to send it as a standalone new thread (with a subject that
says "[PATCH v2]"), not as a reply to the thread that started with
the original patch. Otherwise our automated scripts and tooling
for handling patch emails tend not to notice it.

thanks
-- PMM
