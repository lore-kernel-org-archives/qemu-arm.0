Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp495523wrt;
        Tue, 25 Sep 2018 03:27:36 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63J4YRMC3WZ+hXVIyNuH5ejPQPfCfBIyCtk6u0j16epwIEFYrA/AXrscJcWme0RB6695Dxi
X-Received: by 2002:ac8:3fe2:: with SMTP id v31-v6mr244408qtk.108.1537871256481;
        Tue, 25 Sep 2018 03:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537871256; cv=none;
        d=google.com; s=arc-20160816;
        b=h0ho3Moiikmcnnj3tj9SlfhoIove/aO+zIJa+bbagdCrR1qelnJaACC1/nxbfCrc8+
         VLuyI2XaSaWADLaabMlj8ZNVlpp9vjjxwOmtQSNXjcn0dNE1tLMhmKFfQKUPua4FP17w
         hoWCG3rfa3AMMUFwMXH5EO9P9yIxjlT0r79tjdLrqsOVYFtzckFtMyt0usdTQX+DyVbo
         W998tP+6TEZBkmaNbZuXvzkb6lh9MQXEVaeOdZKIkXYEg9m4STscqjx27q7zMxWGE3MS
         4xofK9FMi9wISGCFKAkYJI8UTAWelGlP+SXhYOCoWniGFIUkfgQcc3cgbEzNLp4XLrDV
         xjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=v+rUtxNXS3+Kl623UE0fNSDAkZCngY+5pFTjOTxo7IM=;
        b=fQKRJEYH1cQU0HMotWgIdaEz5KJ+k2RLbSnW9PsDd+WcELyzWSXry2gnxg+C9bvvUm
         fwSnOi2B5V6CiK1zt0X+yXkw1KMbbMK25tLBvhKLKq/FOZ4XU58BnVwlo41lGdVQ2qCR
         WXOiGTeeircsbfyWi7UOij6a6VMvqK+nPM/QDwxAyc6yNB+kTCnOgHC8xFXPYkTaazdr
         K0ediDV2ihdPQq8V03o/jRfPxCMDngL6+U6fC9Qh00FwlLmaPs1AdFXNmEF7SnewtGy7
         Y8PitHlkQyCQ7NDnbfxzrEanvzruczG1/r0oizgPr2WmMdhB53gu7MfkOuTdYeefMEYU
         Tr1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e8TAVJ5i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z127-v6si1452620qke.342.2018.09.25.03.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 03:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e8TAVJ5i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4kZ5-0003GI-Sv
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 06:27:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kYY-0003Fl-7I
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:27:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kYE-0004my-5o
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:26:43 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45029)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4kYB-0004bK-Ig
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:26:39 -0400
Received: by mail-oi1-x242.google.com with SMTP id l82-v6so1015800oih.11
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v+rUtxNXS3+Kl623UE0fNSDAkZCngY+5pFTjOTxo7IM=;
	b=e8TAVJ5i3MDBT0hpIrMkQCEcmvODPzD4jiSg/L7k7qgTL0skX9JJeqDvPxXsBcGvIm
	59ftjhxFYNETW8ZnwaSro3kDTBioGKiIzwVzLS12zXAKQ17dvNoOy7xAE/et7v2msGjz
	WpvLtMP9mgRtvAJO1hjPEMNJr3sMWZeQWXt+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v+rUtxNXS3+Kl623UE0fNSDAkZCngY+5pFTjOTxo7IM=;
	b=KMip2Z+EsAN1AaCFFiIe/GpgZsfywEgZWHsRE/+56akiUStNB3J9k9gn45NZ2M1Xs2
	PoaYN5ILi4I3lETtnjTfn46MzBsLkXCHn4jNxDXEyT+Drs6yEjGQ5Og6QbXQGbWvc1xG
	hXojmzoVpe8Mz9/2YOdezcs7r0nIJbX9EvpTLfSmviQYB78Dd8aK2muhoY2btT7+ERWD
	NnkD/Qos5foTwAUDO0hosm91WcyAJzAv/M9pYExiWh6dWch530G7aY18TRT5KaRc1Jb9
	bJu/WrNZJ7I7RTKXDMkGvNOqS1NqQCo8fplronJRb5r9ClFbZBpir4stgy8yTawEjr9d
	Qb4w==
X-Gm-Message-State: ABuFfogyb3E22s5bJi1glzWeyTKHgw1KsZy8wR54nMPGLAQKgNBF4spO
	G0Pd2G+kLgFNarkoB8LJ1hIs1Ur5DiiaUykNYPBI4KNaiFs=
X-Received: by 2002:aca:5c56:: with SMTP id
	q83-v6mr161059oib.255.1537871189558; 
	Tue, 25 Sep 2018 03:26:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 03:26:09
	-0700 (PDT)
In-Reply-To: <20180921070138.10114-1-eric.auger@redhat.com>
References: <20180921070138.10114-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 11:26:09 +0100
Message-ID: <CAFEAcA85+GJimEa82f_AWmTqZerCOvL3fZ==2fd_0Pti6M=O4A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 0/2] ARM SMMUv3: Fix event queue handling
 and memory region names
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4etYJIteQA8

On 21 September 2018 at 08:01, Eric Auger <eric.auger@redhat.com> wrote:
> This series fixes the event queue handling: the events were incorrectly
> recorded and the interrupt was not sent as expected.
>
> Also we fix the IOMMU memory region names. This last issue is minor as
> names only are used for debug/tracing. However it can be confusing.
>
> Best Regards
>
> Eric



Applied to target-arm.next, thanks.

-- PMM
