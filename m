Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2552756njb;
        Mon, 9 Dec 2024 04:57:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPvS5QNSvSmperZDCxJ0+tCA07gtknkK2VAnDoVJhK1v4rYAQqBT5k1Noyn/sRk+ViZ90trer+Ls+lHw==@linaro.org
X-Google-Smtp-Source: AGHT+IF+Q1XNokhs7uJv9ekMs5vQmxqXF7IZPjjcR8kReSsKu40eIhrSrvJ3AebSR9YHJDgI1Sj+
X-Received: by 2002:a05:620a:4082:b0:7b6:dd22:31f0 with SMTP id af79cd13be357-7b6dd2233e5mr6033685a.0.1733749031184;
        Mon, 09 Dec 2024 04:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733749031; cv=none;
        d=google.com; s=arc-20240605;
        b=hQ2Tc+4H7HpIHl6vWfcQaE02bQHE3ejp14krQ8TrV8UFNVWXOrq33f1+MKvlAQJ7r9
         DN+P9zqYnCa8SLT8Z3Y+qEEStQA8xstESzpgoHo6ol0EOJzrj+3XgCZHAwUMDNsw7tSa
         7hwqnxX1zsVnyJB48SpK5FK01z9BLZzzxseh7qv0NqrJgVdR7ejNXgmWTJ1jXMSl78/B
         QJU1gDa6N8zA71CqIsZTe7x3VdDmiJQhesejKhrnhXF6eEE7YFUhGNVfMttgNWjE037c
         DXPCGlt++h/0a71Cb6D8WhRBMeltlZEnvu9mMJy/9qR3bvycudbo782i2sMNtUebNAS1
         ASeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=d+xU+U0PvtuiVYm+buUwT6NKJdv68etnZJ8WeE67S6A=;
        fh=MLXdFe/+u53eMQ0u550mg8YcFzm6pqlfschECSI7an8=;
        b=H6onTTpQKT2xbI1FMLp3jqIyGfjIeRmcYZs0VJqfqyDmmQsWdifbsXaVBSAQWALQBP
         8UPPzRi0EuSe2kWo3KKxU9cDhw+pc/g7qB330Qg74qMDHCsnq/3E8+B4Qq0wMOXEe4S9
         KLYvjWg+vmG/2D4h4J3X5GWBJBP/e6thv4n6O1wZOAN41kYgeW/cAqJFY7jKlKWgngY2
         Hn+/Z9L5gUEWpnOrTVHSkA6mtiGUcO4BH6gAVyWihoCxU8Yz9iFz43/8oPDtv0+c9CgD
         VMdI8D/rY/V8qhDshdipll6NhzvWFI+tevWXRma5PQkh3qGU07EIiI/17Hq14dvsJqjz
         SGHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=psKlawxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467705d9cccsi4725941cf.257.2024.12.09.04.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 04:57:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=psKlawxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKdJt-0004KK-Jy; Mon, 09 Dec 2024 07:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tKdJp-0004Ji-LV; Mon, 09 Dec 2024 07:56:58 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tKdJn-0001So-DF; Mon, 09 Dec 2024 07:56:57 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F2245C5B30;
 Mon,  9 Dec 2024 12:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D6AC4CED1;
 Mon,  9 Dec 2024 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733749009;
 bh=AwatSeIitxHKMVxau0ctM0Z69MO8L7GCr6CTMv35TjY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=psKlawxLvSbyTHmtZYS5hK9j6fytRvyVPx4gtyU6B34TBFtZHe2yRxcCgIAo9fkIH
 8Wq7I8O5KHnOa6ljfovXtGmXTnKBPBG2PNQVdEqMOx+oQChFuzIllDYjhJckHEAIoO
 oCWmE7+tzp4Hg4E1RpMFOSiHocCl21ZMPkNugHNDCPcV7jm1yRHoFwZt9Y+iVAavi/
 RzsstVB67o24IUATf2ZXsTrk+DHYUaGBA9E5dAkp23w3kaieRpPaVrINhQVtZTQcva
 fOT4WOfTU68J0pUe49jqIstca2ozN4LyujVMfoeindS7pIeNM8BdPeBEGzRotDbDrA
 sHcQmpN7IGfIg==
Date: Mon, 9 Dec 2024 13:56:44 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Shiju Jose
 <shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 08/16] acpi/ghes: don't check if physical_address is
 not zero
Message-ID: <20241209135644.19869834@foz.lan>
In-Reply-To: <20241209113640.000055ab@huawei.com>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
 <95c0fa3fc2969daf3b6bc1f007733f11b715a465.1733561462.git.mchehab+huawei@kernel.org>
 <20241209113640.000055ab@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: PZqppMK8fJIg

Em Mon, 9 Dec 2024 11:36:40 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:

> On Sat,  7 Dec 2024 09:54:14 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The 'physical_address' value is a faulty page. As such, 0 is
> > as valid as any other value.  
> Still not sure on what faulty pages are :)
> 
> Given I tagged previous (after you'd sent this)
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

It seems I forgot adding this tag, from Igor's review, as per:
	https://lore.kernel.org/qemu-devel/20241204141246.37a7cb9d@imammedo.users.ipa.redhat.com/
This patch was reviwed by Igor already, so:

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> > 
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  hw/acpi/ghes.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index edc74c38bf8a..a3dffd78b012 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -400,10 +400,6 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
> >  
> >      start_addr = le64_to_cpu(ags->ghes_addr_le);
> >  
> > -    if (!physical_address) {
> > -        return -1;
> > -    }
> > -
> >      start_addr += source_id * sizeof(uint64_t);
> >  
> >      cpu_physical_memory_read(start_addr, &error_block_addr,  
> 



Thanks,
Mauro
