Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp80580lfb;
        Mon, 11 May 2020 03:49:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypJUt1w1tEIbSqBZN2XVHX6yvszEUeSM/gRCFo5Zp8lWbYw35TEkuyvkmL4XJxux5eSdpsAe
X-Received: by 2002:a37:4e08:: with SMTP id c8mr14790032qkb.286.1589194197406;
        Mon, 11 May 2020 03:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589194197; cv=none;
        d=google.com; s=arc-20160816;
        b=m7Xeop3EcEqutfXGJT3INxkzOEYETk4Api13zi0H0WcM5MQic9EGlaVtP54rJl8md/
         DE2d0YXokm3tUJ1UnsCh3ALuHcSA3uIFkbK0lM7J4ZtIEaaW4g/B3g8onbNKfdle/nQU
         GOerfLHASoiXnxkffyRVmC8/MTe0W57H1UhxEUfIdfThmqSXu7DOBI4QcAqH3IW8dS7W
         E/YPve3VDwBFvqYvxkc63YU9VrBP3jMwMQFhG9aYaPFw33qpKqLQeoaWl7ECKEr+YYen
         nZBzafvdjl+8Ad0J1j0qAILO49obC4qA+oTqh0PH9XOXdgSQouo5do8d8yZw9gPyUZSR
         HhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=p/L8YiOMY7moj54hTlWVGnurquvkmgCcL9OxN5wRMgY=;
        b=ydCfzyL1commHzQ0Bafs658PJvTP/h2ygC8ZMyHLr3UBn9K+ylITV/Qhu+nvvVx+Hl
         OfRQlQl8ghdIO/yn/f5bcyDvnzrcQoWrkdUZlwnq4E5b0mfT/oykPJAJsOEtn+q7L26G
         rsEA2z+L2mGOCV3XUmb4Z2c/XDOrgI1Tt05yb4wJpGVlPt40jf86SmmplSlaA/GeYd//
         NRtkPbEYqrUhjG1PX3y805msEIdyoGLG3Vkl9FEQSuchCT68+Zogk1KeN7J2Se33MmhU
         AqYfZ5cyYY1vJL+T4xhxn01qxcvToyFQB7pGPxTSG79HjXdh/a/f+lj63jvLeIFVUXZL
         0hvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UxrMYuTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26si3217850qtq.384.2020.05.11.03.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UxrMYuTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY60S-00007M-QW
	for alex.bennee@linaro.org; Mon, 11 May 2020 06:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY60A-0008UL-4m
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:49:38 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY609-0000yA-0D
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:49:37 -0400
Received: by mail-ot1-x342.google.com with SMTP id g14so7123259otg.10
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 03:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p/L8YiOMY7moj54hTlWVGnurquvkmgCcL9OxN5wRMgY=;
 b=UxrMYuTVs4ja3V4pdqKqJb4BM5q2mLt2k7jkxgDNIJstfue6bI9BPVMGtmu2+jnqjE
 07SloKweRkO01mzTf0xw8zV8SLzgC3bvitlSHgKN7NxS5yefkMOGFHB61JmUhYQMPJD+
 +5o3KWb0EeCBdCMW5t5VDRDlv6qRsliks4I5VKHVfuYd3NIoOuhGauZhhL/WfwK0v4mA
 UgBYuzx5CcH+L2NTydh8kb+irzJkVjx9QxNFgJvZLoFai5u/9iMHEDIn4GkCjxksBJqL
 6d9jdYfjrV7ApxtIuoyastmqyhR2F7TGUvOTes47B9wvyKdMfQ8XrvAez7A7zQjtXqHW
 mAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p/L8YiOMY7moj54hTlWVGnurquvkmgCcL9OxN5wRMgY=;
 b=dVEczdrv4gHd+gHH7RYLhBU/vCZr0AzrmzrLfbyUcXaHne4E9kzjQhW6xS1Mf9s/zI
 MMjo17khXhOIsZ+nu49WM+dR/zDGkYUiMIZ44Ob+jCV6S9tjiR0CgqUx4cYB1ibqZ3Ep
 6US60IsL7dI1pK5MU+vdAocHPVUDLT4vjS+usJIiCWb53qsgMKeUUQrHfjz5fPvGgGy9
 /TL5AWR/VZb9GRGNoqnuKmM2kIN/s6ejqLs0Oh0su+R7woj6elv6RLTrhyCdoL4HQq3i
 u5U3n5tAfpwVYjlmScrXZNDbISkQkH8OC+KSFvnDLyUN1uHdrdyMggJyk8xQt0o7kehZ
 61UA==
X-Gm-Message-State: AGi0PuY1yaSyAgUrN1lPMnONeHbDna9wDXusIRpGUm0lph2YxUMJzAGz
 8LO4F20grpMYfocy5xNtGT7BAAgG4KzPaM5/KAnS7g==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr11510180otc.221.1589194175902; 
 Mon, 11 May 2020 03:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200505095945.23146-1-f4bug@amsat.org>
In-Reply-To: <20200505095945.23146-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 11:49:25 +0100
Message-ID: <CAFEAcA_dH+xKQegbsQkOM9YASEMZrmLO5HL-L8bWsgUq+hfTsw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/musicpal: Map the UART devices unconditionally
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /VmFJCG9r4ms

On Tue, 5 May 2020 at 10:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> I can't find proper documentation or datasheet, but it is likely
> a MMIO mapped serial device mapped in the 0x80000000..0x8000ffff
> range belongs to the SoC address space, thus is always mapped in
> the memory bus.
> Map the devices on the bus regardless a chardev is attached to it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> from 2019... found while doing housekeeping
> ---




Applied to target-arm.next, thanks.

-- PMM
