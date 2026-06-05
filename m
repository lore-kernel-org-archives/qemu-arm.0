Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E37CD6E75
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Jun 2026 00:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVIMa-0004n0-L2; Thu, 04 Jun 2026 20:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wVIMZ-0004mC-BB
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 20:24:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wVIMX-0001OR-Jd
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 20:24:39 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-68ced97b6eeso1887949a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 17:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780619076; cv=none;
 d=google.com; s=arc-20240605;
 b=HGUQrPNruPXcsvqMwgefain+nAlvLwZyBYwVXZXWaZtqH3sOmUU/4WxPZvAm0GncRU
 o/dM218JwoI33EL1dYHKKtUL3jaYMlDb7iEmMKA+JlF6NIKb6W/O/PikU10n9+ZMsrcy
 ow6uG8vIrAfWNtQDfIS4llpDMlNU1TDpM3onlisT5RNGzc/PhbYF/T/m/QUhjqShG4ua
 U8TG1nefmjE34UmERBzB2encNcTAlXxujqAa3/IuYn7KJ15xCI6JsloqwBZW9XP2JUmy
 AzSMvlLlMmAcmvLduKL0asx6gIs25XlhKZ1qkH4wBEFiiKv6K+Xck/rRVW89Kb+CGIyl
 mztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5PENnKPIUyscqOJXAJJYOCoPRLH4XUM9LEFtE/s6m6w=;
 fh=uYq885iqfia/qUeUv55v+AWhy0MB/U6PGA+tR5Cc8Qk=;
 b=WyzWlB/M74GaI47+z0+g/gYW0PlLajFrXJkBqKdFXYDk/Dgp2mtKOMEE7sPND4eH6O
 2pJBfKxOAKHcYkip8Grjn5GEcmWunmRQBNR3V2Cww/BEG8LpF55zPDcRGXRK8qn6Vxxq
 TVyxqJOXv6sX8d+lOye4gtlCergfizZF81mkFueWQYsreY/az8cMEIZAXNjgmEmHHa6x
 CFInGmMAp7ONJnLBKy8KfHHP4OuQ4rR+Ly8ZQJvNCMjyD7m2Do3gS8JhDUFfIUIrEgWk
 jGMLSEjrNagp/we27E7VJe/ZS3VVg3it3dtLFrqt0nvCgCkRNVMOYtzftUg54g+d23JK
 p2qA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780619076; x=1781223876; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PENnKPIUyscqOJXAJJYOCoPRLH4XUM9LEFtE/s6m6w=;
 b=TMfAVL4w652PqrBL9tErH9S2kO1KuE6seSCPTLdTNlUhIYI8phxyEYUsftTEuT2vf6
 E3XDANf15j7jAY/+Y70DKotMEvQX6NVcCE+ovXEEz7iyQGllxGwxHWZRntmGHDD4S1Kb
 7GAghcpcgy+M3SYA2Obfv8zsg5bAhW/sQsXO5ndHRd6YoUZLWEk5wC/vimNSgUb7j3kf
 +JXZBc3QprGo8gRZZoVluEhUbRq/s00FewZaHXXeT7sOtaz/9Kk2g9Xoiri4RGmdfsJ7
 gbWd0xrQyinnNiIiMaDiqGtWLocABIzweM2s7efYkqnRVh3oNENmtw8oF2U7nlKLZ7aP
 0DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780619076; x=1781223876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5PENnKPIUyscqOJXAJJYOCoPRLH4XUM9LEFtE/s6m6w=;
 b=qobmXMhVL1vAFBCI5a/n+WSyL5qhC8DFS4HuMpDJJGGJc8okJlrZV49su0NRKFvAwo
 s/KyFROOZfaJvGaFAjlGtBxtlQMNnrU/xUQQv09HJIKlqYjT0yqpt/a6/hoXBTet2sCr
 iusGy3d4IfqaMvYm5LyYOr2sZHFYdOTu9bWJ+dD/QuXvC39pglr0bwCJJEaQTOxOENf0
 z2Ej/Te2MMg+0F0AC+0FLhB5hoepCpC/qI5wdbPKAjFav5lfP6+kdw4E6eiPGDsxsIny
 P3yvGPAK9S0S3d9FLqUgq44TLdrbFhDrQzzcb190Rg6ZAbRCCMR+pV6pf+PP7VXAkVD/
 oj/A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+fJMZueLNpnrR8QsrdPUJrPmVXPCrT6PUjL7SMRFMhHgQi8HcJIny/y03uki0ePNWhpeCvwVyyrg==@nongnu.org
X-Gm-Message-State: AOJu0YxMBly+2CZ1Fneic0kG5mcJW7eajio7yFvDODLD/14eEYKinqhx
 CEYyQpZJH6H8uCM5xz18nQ8Ox5Icd4HE6919hwla4c+iEeBYjY/bI4cQZZKYhACKJx4CkQcxKQ7
 ONDxKOZOKaeChg3zQ4OZZAx/Js8aEyiA=
X-Gm-Gg: Acq92OGcemjnBLcg6qZNfZbFfvf+Bijwy25t5rMAFqFxiq7NSnk5gPdMB0pwypo7w7J
 5PQl8XwKEsUhlXmN3rcMQS157Ywijg1EnZNeGonCEw9njHJpqlmwdMoC3jbRiXDd4yTuL71dVXw
 ck5YPthtg3fNQkxpp5UyVulgsbR6X2YwPQj2hpBCzen8Y1V6yWN9iHCT0hnn/zc3R13xb0nGfeN
 AFDakDu1cVKa71QDVFq+toHIQWpH0EvMig7Om4SRoVA4+oEUWp/JyFOh73OEGM1OeQ9PZ7YLPly
 EhdRizdVDuQKOXTco0+/Q/PE4JeKXoeQRU2CY+uZ5tn2Hb57
X-Received: by 2002:a17:907:944e:b0:bde:137a:45a8 with SMTP id
 a640c23a62f3a-bf372d29f23mr47163966b.39.1780619075645; Thu, 04 Jun 2026
 17:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260603064032.3733394-1-armbru@redhat.com>
 <20260603064032.3733394-15-armbru@redhat.com>
In-Reply-To: <20260603064032.3733394-15-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jun 2026 10:24:08 +1000
X-Gm-Features: AVVi8CdbCwkhYmPCJYT4NHTP6-7dhs4qihrryP9IWiwWfAlwNkJkqNuIyBun1ZQ
Message-ID: <CAKmqyKMjFD00b5Px4Ma76+UMi8Ne1+oRcBWWb4E+x3mgae4OiA@mail.gmail.com>
Subject: Re: [PATCH v2 14/38] MAINTAINERS: Drop bad F: from "Xilinx Zynq"
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@mailo.com, pierrick.bouvier@oss.qualcomm.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jun 3, 2026 at 4:44=E2=80=AFPM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> include/hw/misc/zynq_slcr.h never existed.
>
> Fixes: 246f530cdb (adc: Move the zynq-xadc file to the adc directories, 2=
021-05-18)
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 367d37f40a..8b28a21fe4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1141,7 +1141,6 @@ F: hw/misc/xlnx-zynq-ddrc.c
>  F: hw/misc/zynq_slcr.c
>  F: hw/adc/zynq-xadc.c
>  F: include/hw/misc/xlnx-zynq-ddrc.h
> -F: include/hw/misc/zynq_slcr.h
>  F: include/hw/adc/zynq-xadc.h
>  X: hw/ssi/xilinx_*
>  F: docs/system/arm/xlnx-zynq.rst
> --
> 2.54.0
>
>

