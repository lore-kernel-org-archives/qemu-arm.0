Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5391821lfp;
        Tue, 11 Feb 2020 10:17:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCct9xzUJpqwzU2WmwNfTEh60A/RHkCL9n2Y91IIgioSmClC6kQGCVY3yE4Eo0zuww1NG9
X-Received: by 2002:ac8:7443:: with SMTP id h3mr15575897qtr.202.1581445023254;
        Tue, 11 Feb 2020 10:17:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581445023; cv=none;
        d=google.com; s=arc-20160816;
        b=r290puS0nICL1nRUATYM9P+agwISsAIlDv31tJWum3hf86LMC7gTia6utwzD9ajnxr
         6/QyHkGzIwJQtz/ulEZOMvvVHlB1Jy/aCaM1EkrY9s3TP/fyf/quf0S49Rc1gY4wYMU9
         +oDmbdyjvJjrE6031vI1CNWIkiuBE5FG23A9VNaaMvAVeqalSLGc2ErfvWqzI9whwWuI
         d3N66+OcX6JxZTcq+/REwpHulbfjvz0t+sfa/G9M4DA1ytjF+dG1KNbqOfFD0QjHfZna
         IJb0qXKDNNPviTc9SjkjEio8KAGe89HLhIOOKdArvjgLMMZlT9QxM4D4KyoI0pQKnZNo
         jJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CM3Rm3q1kjx0iJ6AQmnsy9Wo09aKIkJnR9n38UvXiDg=;
        b=WwOsMojPl/88RfwP4Qh7/CgRqO9Vbj2loG12ak6nK7tFznW+Rg2cAGINGzHqQ4O9Uh
         EctkzH1dhEXYB0dGTNHHoWRPzVNRxvUIXPjXQ97u2FOvBSGJljBmVAnELFJwaw6qeFoi
         SUbXBQMmZ6cbc8YHvSICfJ94pkm+223Uch2eOdSlhyBXhcJk1qwHTFZmD41MaqkMB73v
         IB1OydccRZLd12/nixOZe2+cl7XihmGQ0o9vB9LWiOi3M/JoRH9q/63dM7Zx8jxS2I8V
         zYC1ihWMsPcVvcF59/G9khYLZ8ix7E26yKNWDMdsB/uhmA+i+YTFY1hwOGmCG9Z6DCkX
         gaKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TzldmBXC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r187si2281756qkb.359.2020.02.11.10.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:17:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TzldmBXC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1a5m-000834-NS
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1a5e-00080J-Jo
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:16:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1a5d-0007tg-Ds
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:16:54 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44690)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1a5d-0007mi-7T
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:16:53 -0500
Received: by mail-oi1-x242.google.com with SMTP id d62so13660390oia.11
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CM3Rm3q1kjx0iJ6AQmnsy9Wo09aKIkJnR9n38UvXiDg=;
 b=TzldmBXCbYLH+62cxs4VbGSKPS3n9TpwOuZHgrRcw7H51vqgpsAbk4FCPOtGjv2dXo
 Vn1OdaGK9DRCLlcPaEYXc3pf7VDt5mkVheazGmvSEihNA4l+EdvBLlQGQBmpJUsLrMWF
 koFT1r6pnPcbtpZvwTnwKP1Y4FF0X2FyE4xI4i1EvL9cKQ0EAOw1olQQR+aXo8CO3T60
 /RuL7qGKnD5uCSWSzaxMKGmnwbC5VqPlp0Is6oz32yGOVgH2daEKWAnA/BrgyI743cRc
 OrVJd+g4Y3r3FwFYH26lApUzgT2kNIpVb3H76TRF7tHNTrEwRwJ7WRuL9Hi1WevrCZ/F
 NqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CM3Rm3q1kjx0iJ6AQmnsy9Wo09aKIkJnR9n38UvXiDg=;
 b=YcerRjXSwqwUCe5IYAqnlQi3ebKiwnJsgG3vMDdmT8XKuNvnNZ96bAfIYKPcah2r9N
 QZBO2rrIVm1o3ukO8a8tBcybf1WFoISdoz4T0YuUK4cEwnYbVrl0qRkpYvs2sVJTuNvh
 hoWDrKWUMNG/r8iifcneC+p3RiUGEUGb6nR5r8tZxrN1NAJgkTDuvrsp/lcKXnFEbB75
 oF8hFOP9/5xR/hPdcPAekKSAOPM1c7ta135F30wHePEdS9fFXMPijJvRx9DtoZ49QSoj
 jVvYDkdBD8iNfDUEMZHJqD3hVQ/zcpySebn750cpuNDfoC5uIf+RyyuTiazWp5JWHaDN
 z7rw==
X-Gm-Message-State: APjAAAVFNiaR55LlZwFQkenYT8nD8AOOPUUEtOwBfic95U+NkscUZzBt
 TSKJ9AM/V6ezXihnBr8h4XquqPlWqTdTQB7xEAe80g==
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr3573146oie.146.1581445002996; 
 Tue, 11 Feb 2020 10:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20200204014325.16279-1-guoheyi@huawei.com>
In-Reply-To: <20200204014325.16279-1-guoheyi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 18:16:32 +0000
Message-ID: <CAFEAcA_O10vtj341KGRc7BmBJWo8SEqG92qktfJCwWip+cYM-g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Some cleanup in arm/virt/acpi
To: Heyi Guo <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rwxw3OUBzXpi

On Tue, 4 Feb 2020 at 01:45, Heyi Guo <guoheyi@huawei.com> wrote:
>
> Remove conflict _ADR objects, and fix and refine PCI device definition in
> ACPI/DSDT.
>
> History:
>
> v3 -> v2:
> - update commit message for patch 4/7.
> - remove diff keywords in commit message of patch 7/7 to avoid applying patch
>   failure.
>
> v1 -> v2:
> - flow the work flow in tests/qtest/bios-table-test.c to post ACPI related
>   patches.
> - update commit messages for removing "RP0" and "_ADR".
> - add 3 more cleanup patches.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org



Applied to target-arm.next, thanks.

-- PMM
