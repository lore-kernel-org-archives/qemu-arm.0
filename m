Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4269091wrp;
        Mon, 16 Sep 2019 10:24:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQHPBRnodOiURnk8oQQgR81a/1TX9pKqgT20bZ2chBW5v0IUjosBBFTz4aqvWQVKgvGmxO
X-Received: by 2002:a50:d903:: with SMTP id t3mr393416edj.117.1568654695764;
        Mon, 16 Sep 2019 10:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568654695; cv=none;
        d=google.com; s=arc-20160816;
        b=fPzYy+jiXEhmY9pYCDJgfLdCBSw56SGOiANJIvkWwEQFiKq1MvtaqxXUgDVhqY3L5a
         KpoE44Z4Rnmy5zH4Bngz4G08nFCPn54WSnGkssmyP3a5NKKaMVf6CyGzqP5t6CKvDd9l
         xHBPTskWX98/cHZPGuzRRQd2TpDGTNYHTeLm6sChn+EkeUIC5Iqb2NJBwl+X2QKRdOap
         5Kacq6LLh3fosd68bMLdzAQR0lsIWjJYdEdcxx+ACpOuFu7Rmg6t6YB4+su3a8FjV06G
         SV7GZrO0Ve6Xop40xf/mUZiaR6gZWanDrMZOpoqnsZpIZASFJbRJWRpeNCJ1nf8hhWUn
         hblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CY22UNP6yFufzlwejS8ujvWC8hMwA9I2XgMR+WHc10Y=;
        b=Eemj8ERIX8eEyxNwXd0UvD0Po9pKPEiAsvuVL4XTw/IV7sD94uWFccamTXX2DrOia9
         6LqEAB13s/+fChccea81ePpwEY1zIqrBa0ME6sWQ+eiFZ2KpIpx8ozKKvQ8hxiovd79d
         KmjZyKsCIYBDwGJh1BDIcn9YubXA4X8cSToq7I41ebUMhpUC3ZHQxF3QInjwIfO5vXQq
         VwPoan02xyniIpFq8Twq0B8gAxgCg6EDImrzt7FukxbkUNfPxRWefX2oWa4FrBO1HOgD
         V0F9wVjNOsKaM8xM9KiwYzqW5b1ZqPnacrbBELlVgJOyvbABYzboxS459/uk9xfX7S6M
         hQyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAme2RJq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si6011531ejv.96.2019.09.16.10.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 10:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAme2RJq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9ukA-0007Fi-Lg
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 13:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i9ujx-00079y-Fm
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i9ujr-00047g-JQ
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:24:41 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:40342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i9ujr-00046k-DC
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:24:35 -0400
Received: by mail-ot1-x32a.google.com with SMTP id y39so548629ota.7
 for <qemu-arm@nongnu.org>; Mon, 16 Sep 2019 10:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CY22UNP6yFufzlwejS8ujvWC8hMwA9I2XgMR+WHc10Y=;
 b=NAme2RJqjmPRO5mWykkhnG0NjmRu54i8cacLXtVdHasiysiHehUoY2K5K85a/m1eOS
 LlSiDy68DVzrvTLYN1AKW1EZm34PgFTHZh9DRi+ccHehRPr0pxg4AtY0OJrogJKiwBtp
 B2iEIBQGr19C/DDN+lZUxZ7Ml6oLEEjJuY676bWeR1Nmw3YXM+cwonuwRqkTJAzZyeS2
 7uUbj80rXkD1YtR0+ptuNvxxWenWFpv2W9iRdhIRrv+MNB2zX6SwEu6Hz+jya3tVaRld
 NwJcl5SDzsoXr8qgiUhEo8O8je/BrrzJexrs3c4ApfqAs4y/9dknPCyMFfhf1B81LE0t
 hAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CY22UNP6yFufzlwejS8ujvWC8hMwA9I2XgMR+WHc10Y=;
 b=K5WemiC/4zbUMJ2Bc6XSuDri/PIjN8cN4DNpi99E6IWilG9c5TgIuXf0+RPTNHRwdA
 dTW2qUXmGUvSdf9bWYYgP32kF5fPGmvJmG3egGUMaLkdbaIM44Pozr2ppFDma3J4Hd+L
 5InUCSJDj09IzW/8e74C4MxlL33oUFJwLXeZny7inQKUimB5YcqbfD9oMgFPVseHHshC
 hkUdPBv4cd8WLSD4snShnkprEevortPPKfZfYpnYmCREnUBpXBO4prVsFy4X3ARw9uCC
 aWH4SzbEZ3hNLerczfwG1BDp/dD9Tu/iE07xAO/pACPlDjFH8Q263MhSVYioPukWrlif
 F3IQ==
X-Gm-Message-State: APjAAAVepuEiQaW6z87Y0jBMPk+yIebGkQlcepH018R3Cygkcyq1FthN
 eTwxu6dPa1A+RDMZyYpauDUZp8mUKq301KwgMB0t/g==
X-Received: by 2002:a9d:562:: with SMTP id 89mr238435otw.232.1568654674605;
 Mon, 16 Sep 2019 10:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <f2c90efa-1412-9c41-ba76-ebad90745f4d@linux.microsoft.com>
In-Reply-To: <f2c90efa-1412-9c41-ba76-ebad90745f4d@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Sep 2019 18:24:23 +0100
Message-ID: <CAFEAcA9S7Kj5sJVM0Ot6KKpe9z3BfQWyZwUv-Vx_+g5sRbxqmA@mail.gmail.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32a
Subject: Re: [Qemu-arm] Adding /dev/tpm0 to qemu-system-aarch64
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8IUoZb4/tlYQ

On Mon, 16 Sep 2019 at 17:31, Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> Hello,
>
> I am trying to add a TPM device (/dev/tpm0) for qemu-system-aarch64.
>
> I have a TPM simulator implemented as a Trusted Application (TA). The
> device /dev/tee0 interfaces with the above TA.
>
> Have a TPM driver that interfaces with /dev/tpm0 and talks to /dev/tee0
> in the backend.
>
> Am trying to add /dev/tpm0 through qemu-system-aarch64 command line
> arguments like below:
>
>    -device tpm-tis,tpmdev=tpm0
>
> I see the following error:
>
> qemu-system-aarch64: -device tpm-tis,tpmdev=tpm0: 'tpm-tis' is not a
> valid device model name

This is because QEMU only supports TPM device emulation on x86.
To add it to aarch64 somebody would have to investigate what the
hardware interface for TPM ought to be on aarch64 hardware, and
then implement an emulation of it and add that to the 'virt'
board. (It would probably share a lot of the implementation with
the current x86 TPM, obviously.)

thanks
-- PMM
