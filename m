Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp795651njb;
        Fri, 28 Feb 2025 01:44:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrtuHa0qRXgEVyKmjVRY8AvZ4x0BuqnGDd7S9ZCwBCimD6rXQRWOnG91ZNzKKSkssAhM0xI1wUm7NmAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHrHMQJOjsMaSaKcryF734CtT/89ePPDzHmzn80z+DeQYuCIKBL6XBb2BsTgjplZ4MAewId
X-Received: by 2002:a05:620a:4552:b0:7c0:ac01:ae7c with SMTP id af79cd13be357-7c39c4ce3f2mr449195485a.25.1740735895305;
        Fri, 28 Feb 2025 01:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740735895; cv=none;
        d=google.com; s=arc-20240605;
        b=Y6X+Lx7JPhmXcTpd5EI3P8+x51SAEVlKWHvEXJwmOM7D4A/ZAcgpRdB2o0ZubvORQL
         6ahN3qT95Gk8VaRjsA7K51ZhYlXuVVANmbIqJVNNGvFlayaqL+2Fw8ivPR6dzQO2KSaq
         7PjX/Ki5V9YSKMvA1Jg9n09kbz4YUiZNb/snIn1hL5D1UGc2fp4fVVXQEUXOfMvfiqiO
         k15AZ6qA7L9nko5GrPIXN9rhFiPBHZkuAIceFWoERgCrTuFg4HYHUsdTIiG2X5d2EDnL
         m+9gnpqJoewBqhpuCECOkZ2QL9ofjAG8R/gpVJKhmwQRsesw3dzXDMB+hWyqcvYs4al7
         FRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=NbsoIgfjFvKxDTAI12eO5HRRzKRHRlCfQlzIyGN6N/U=;
        fh=/HMuy9b4frsEhrIymG7Aci/jqJikI6qqjosptNZ9XMY=;
        b=a81qGwOBrqFmkW1AHnePLi3vprwddq2vcd/6+mJhn5EqOEjRZuqTANLZ9t/WUUPo+B
         6B2xzNU4LdDGOIs+R1eWwNPr4ovLOsqOoRN2ES/5XSSri6Z4QobL+MJwM0RkowlUrL1I
         mVYGtyaHMX0BWVwluQ9wgGp7tWMWQm5o9pHGYJ7aHX+VVs6VDY4ztQWDtczy86CZX4mK
         WM3QWrb6y9z/eUx8XuEOs4isC3MhtdXX7aaOCBifo3hZuBhZoDXFoFX1KKlKZec/D8p6
         MPBqEbjnq8TrFHEQeiMgHJ+XcY1+UnDAly6GhMLbP+cswktS4IySFYqWWKABXVuAZboF
         RwEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=H5pY+nBr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378da64d8si281953285a.484.2025.02.28.01.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 01:44:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=H5pY+nBr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnwvD-0001SI-Df; Fri, 28 Feb 2025 04:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnwv8-0001QR-W3; Fri, 28 Feb 2025 04:44:39 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnwv6-0005cd-VP; Fri, 28 Feb 2025 04:44:38 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 426A461F45;
 Fri, 28 Feb 2025 09:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE332C4CED6;
 Fri, 28 Feb 2025 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740735872;
 bh=JH6UA1mw+4atmhJk6yRKhgzgsoNCKH5UZqtfwPXNeG4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H5pY+nBrl24ANrQjC3Qdl/ZqOs8EPOSyEJNqtCeLIuNO/E6Y53/ct9fzpKLqFemD6
 BDDHbf5rZmszdCEbQ60RXwIqvVIHGT8ELfIsyudYnuonDbR8ovqJrRk747zmIWOxkY
 eTy4CwWGRlLUwjmuvBvO7dy7QTvF4wRks4qghUGEbb/dOzMKm215PWWKZ3+fCKes57
 QCYxndRTOPSRTf+R3z8DNmB+Sa6z9wLhkxjMFNaRuXnufxyHaTD90UuHM4cDJpL166
 x+VNHnkxHuwo9jD7SYx5JPJ+C0DN64gYDi+0RRH8Ew/2IIrNoe6UuY06/GHmeHnaRY
 3EhYOtONOidoA==
Date: Fri, 28 Feb 2025 10:44:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Ani Sinha
 <anisinha@redhat.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 17/19] tests/acpi: virt: update HEST and DSDT tables
Message-ID: <20250228104400.5ac2f7b1@foz.lan>
In-Reply-To: <20250228173318.00000f9d@huawei.com>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
 <7a6a1a1ba78f7dac2be6b7335280c1d0b380a175.1740671863.git.mchehab+huawei@kernel.org>
 <20250228173318.00000f9d@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BTVbaLs6Vgtw

Em Fri, 28 Feb 2025 17:33:18 +0800
Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:

> On Thu, 27 Feb 2025 17:00:55 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > - The HEST table now accept two sources;
> > - The DSDT tables now have a GED error device.
> > 
> > @@ -1,39 +1,39 @@
> >  /*
> >   * Intel ACPI Component Architecture
> >   * AML/ASL+ Disassembler version 20240322 (64-bit version)
> >   * Copyright (c) 2000 - 2023 Intel Corporation
> >   *
> > - * Disassembly of tests/data/acpi/aarch64/virt/HEST
> > + * Disassembly of /tmp/aml-DMPE22  
> This is an artifact of where you happened to get file
> from so if we are being really fussy drop the change 
> diff in the patch description for it.  I don't really care though.
> >   *  

True, but on the other hand, this is the only place at the diff
saying what table the diff is against (HEST, in this case), as I had to
remove the information before @@, as it was causing troubles when Igor
were trying to apply the patch (plus on checkpatch).

That' why I opted to keep this hunk.

Regards,
Mauro


Thanks,
Mauro
