Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6883227wrt;
        Thu, 31 Jan 2019 05:44:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN51g2Q1E+nFsVhu5DX3AQ2U+1mTdsnZhZRR761K/UDz/w/FOzS9uSsPtX2RAN9uqJZObeNE
X-Received: by 2002:a81:c93:: with SMTP id 141mr33573926ywm.356.1548942297679;
        Thu, 31 Jan 2019 05:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548942297; cv=none;
        d=google.com; s=arc-20160816;
        b=Lbw0imB82X+AWjr8X/UeVX1W5lbT2yGXz30/okkJixwnFnSc754O+GRuvebYNYJnOS
         QG84hhyucM/1WN1p/CymuZZuRdu8VTmpvIyMmMLDHxzw7QIIi49tObAPYF1uclUtJJgG
         9em+FlF7jNI//GJguS3NpOOPq1UYQfxRDXBCXkMNQcIr/zjH6l5SnwoZV93+QVPUftdn
         mY2lJBKNJPCmj2/Fd6f00JlTYS6i8BLDb9FCRo69DGdIlGV9llxSEdQhAODkJWdMdeeu
         P++/31yAmTTmIQTBs+MY6eF7xc/zrhWJprmA0n1JpezghMZnYVNK7iQwZZn1jI71ttXK
         LMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OLe9mwOvjaN5LFKGZZO2u/wXJwCEtchGsCM2ax4ykg8=;
        b=P0m0poF6zGka/w+7UFZ2unVZJb8O2IWaaARsjXuR3Kb9nIb2TFo8NGNrSK7EhNpusB
         EtbYtHjKU8rbkWrIMbEhbUKlgJJzMa5Rv1NwqEgSeeYRdYvO92A0XvOI4bfN3M8qhHZF
         EEft4US1z5cV2KiqxbP/9yfK5L7TxTcUSJPLRHFIJhlysXpSFdV+ospDI6UIWsJwbNzc
         iXqB1TEqP8RzEUaxIIpCetwTqbwnCiUY2EZVdDhooWsfzbKQAo+a9WL4+xzDAn4iYX3m
         8lSnNckkxCkaHs/cqc/8cbdKxlmlk2pUL2a9jQ7uYUm4lMXy6tvh2KB1GfPtXhsrP4DW
         X0Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ghVw16mn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z29si2833747ywj.18.2019.01.31.05.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 05:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ghVw16mn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpCeH-0003CF-3U
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 08:44:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpCKZ-0003Du-OM
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:24:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpCKX-00077g-NJ
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:24:35 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:34094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpCKV-0006wM-Is
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:24:31 -0500
Received: by mail-ot1-x32e.google.com with SMTP id t5so2802372otk.1
	for <qemu-devel@nongnu.org>; Thu, 31 Jan 2019 05:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OLe9mwOvjaN5LFKGZZO2u/wXJwCEtchGsCM2ax4ykg8=;
	b=ghVw16mnQCp6essNOdfNEvlZqwXx5UyDjgtWI6mISPymKQ1CivFqLAo5LUs+tKmQ6V
	iprFOaMgrABi2xRMPqxBg1YG1DqgRintxXyVuYjfQ0Pqsvp7ghxfwInF+zqwE5NOQ3ef
	V/2Kw9zun8FqyrUcGKC4mBTSkG2nFro6tNrww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OLe9mwOvjaN5LFKGZZO2u/wXJwCEtchGsCM2ax4ykg8=;
	b=ddK6TUv3JJM8BKJtNG3rBLIJ8kGP/YIoOx3XUUBWa/SsdjwV1SQkFi6zDTKW2XCn8/
	7Ulr0hplUY15gPvR0q3VAErOIPqpGfl7nPdfuTaRZJUVgnpfdBoRKt63+eK9oJcC/GRG
	1AWvVKPxWhNOBCdNNTjBJN9xVJQRzENNkVXtTjqdvAX/ROrwF/C7t6FioNJY7lRD6F5/
	Sf4VmuISqHPyNiuBRL0jQuVq8i+hjl5eh0gGsgrXj9Z9A4EszRyZ8YE0pDHWUkHPLJ2g
	nqbacqxo5fQ9vmUDGLjv/mkDvlWqrwsTXkCp7+mntGDENT2aqNEYV05xNGMovMHP/ieC
	4v3g==
X-Gm-Message-State: AJcUukcu/N9warDXzt5AsmbuXSyNm9KcdkG+uLeLHLScL/wvEJ9bFApy
	L/+5M6Q6qp7S8AGpzWXwxxg/XwPBpL+wg5Yhxzwbjg==
X-Received: by 2002:a9d:7855:: with SMTP id c21mr24124163otm.363.1548941053634;
	Thu, 31 Jan 2019 05:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20190130072131.13247-1-stefanha@redhat.com>
	<20190130072131.13247-2-stefanha@redhat.com>
In-Reply-To: <20190130072131.13247-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jan 2019 13:24:02 +0000
Message-ID: <CAFEAcA_L3OxUCnNsWy_-CRuuQ9MtWct2S82MEdm2jTBWO+vxKg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32e
Subject: Re: [Qemu-devel] [PATCH v3 1/3] hw/nvram/nrf51_nvm: Add nRF51
 non-volatile memories
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQKtgx1ckHG7

On Wed, 30 Jan 2019 at 07:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> +static void flash_write(void *opaque, hwaddr offset, uint64_t value,
> +        unsigned int size)
> +{
> +    NRF51NVMState *s = NRF51_NVM(opaque);
> +
> +    if (s->config & NRF51_NVMC_CONFIG_WEN) {
> +        uint32_t oldval;
> +
> +        assert(offset < s->flash_size);

This would be better as "offset + 4 < s->flash_size", since we're
going to be reading 4 bytes, not just 1. (Or "offset + size",
though our MemoryRegionOps fields guarantee that size == 4.)

> +
> +        /* NOR Flash only allows bits to be flipped from 1's to 0's on write */
> +        oldval = ldl_le_p(s->storage + offset);
> +        oldval &= value;
> +        stl_le_p(s->storage + offset, oldval);
> +
> +        memory_region_flush_rom_device(&s->flash, offset, size);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: Flash write 0x%" HWADDR_PRIx" while flash not writable.\n",
> +                __func__, offset);
> +    }
> +}

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
