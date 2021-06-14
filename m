Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2227157lff;
        Mon, 14 Jun 2021 11:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrk3NY0XNwprA0JxNRzE/sip1CutdDBGxWLZDm0l+HLP5Tg87G63TOAHkz9+/xsv+dOlwV
X-Received: by 2002:ab0:751a:: with SMTP id m26mr13929358uap.133.1623696613472;
        Mon, 14 Jun 2021 11:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623696613; cv=none;
        d=google.com; s=arc-20160816;
        b=OiivoXO07saezaKkokN9KrrJSPEnc9sn1IINWacUbkGG6Aid/UTUbQS1rKNoItWEYQ
         dikJM8pjT2i3AiCe7MFSmd1JZhTrmvdvd+tRNTRkH4NeHaipjK+VCuT9II0fRVGLfhq3
         vT/vk8M6UhFNF5CuIz6llHMh8bnxVNgF8A+p7yTOXUdg3yzyNnyr+7kbYZo2JStSEY4Q
         1QPlVhT/yfVAWuhwwMgK21jfCzXXvx+Zfr2OVnjeiEnbhOCCskXU8rTAAbshkzcqcH5K
         mkP+tcY3ihE8MSUyGv3ZR7sP6UQHZkk1ZPj1xA99ERC4gi+vvu2dw05clbK4pWnhIqpR
         4yuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Vdpi5ArXyBRQyVAGkXqW36tewpzKO9e4nxaovchJzpY=;
        b=BC7HTcXgulgwmH2b2sz5Yiz0zdKvkIvG68IIwTH6mH0Lz/NJSIuiDB4sHRf+C1I4jv
         AMt7xFJbF5j/tvXMduuLSrkq/gowvVHkswAtwAkP015KmvOu5Tl6htmMKItlJD5Y9reb
         QrbOEGx/VzHdcMDkWW8o1JjlHeYRFTZBckpY7k6xL2/HiHL8prH25J6x4DEn4jBPbgGC
         BknJsmVe2SQEBjBNQcOeeF8CiTeTJeqyDRde+ioUPnkiRRmSMbQgd6vdfmlzfhvTYlLo
         1Z+agelSdgfhw1yFqfW8S6mlOZ1CKjvb4tVEBE1MXgkI1q9JDnjmU2JPIn4HDHyp4PJ8
         VF1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=f3OnIVCG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25si6957090uaw.42.2021.06.14.11.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 11:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=f3OnIVCG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsrf2-0005Qg-QE
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 14:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lsrdy-0004cd-Vw; Mon, 14 Jun 2021 14:49:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lsrdw-0002oy-H8; Mon, 14 Jun 2021 14:49:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D345E61009;
 Mon, 14 Jun 2021 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623696541;
 bh=tU2oFmaDq1kF+jzWDv5sgbEhM3iqJ8hgpzFGQblZ96M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3OnIVCGp1lnr6KPrCcR5k1AHSjw3tFWROlE+B9Xc/w24a4J4NCajmgRxc7oH1tEG
 nLCTvAbZi6nmEXD0luvbDv+YDcowZIOdxCIIYzfG19wagXYa1hYsdxqUgyh6cXwlhb
 gcJLOe1fjrxO6uQC2GsC2pl/jwvdm3CmKuPg5AskkrmvPF1xeuXmhTnGnSbrYagk/n
 kemzfaV2GsvXwUFnIZjSiU1KblofxMx5QQcWV+XivrrxPp6mah/nhN8U2Krot/+dvR
 OG7R+BgHm/dALAUxtmfvggj0gGULZ0OJpQp4uyuitlhX/M9mK98VLj5LOgRGGtH/ll
 62JESQdVXoFxg==
Date: Mon, 14 Jun 2021 11:48:58 -0700
From: Keith Busch <kbusch@kernel.org>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH v2 2/3] hw/nvme: namespace parameter for EUI-64
Message-ID: <20210614184858.GA646050@dhcp-10-100-145-180.wdc.com>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
 <20210611234631.81314-3-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611234631.81314-3-xypron.glpk@gmx.de>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F0ekugAmfMJw

On Sat, Jun 12, 2021 at 01:46:30AM +0200, Heinrich Schuchardt wrote:
> +``eui64``
> +  Set the EUI-64 of the namespace. This will be reported as a "IEEE Extended
> +  Unique Identifier" descriptor in the Namespace Identification Descriptor List.

This needs to match Identify Namespace's EUI64 field, too. The
Descriptor List is really just a copy of what is reported in that
structure.
