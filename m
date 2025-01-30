Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp271564njl;
        Thu, 30 Jan 2025 05:03:35 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUMAhOOhUvvd4QFoIPnTVQff0kEcR9LrZpx0vQZdcP+XGma29m0Bnkpm1oo/l987fOT6+4WyQwEPShJ8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHmQ8HmxEcuQbVcET/9FwGclgZpZXCFX2ZLve1peSeyW2vFQp8c1L57DLqOdywtEeH6Wn07
X-Received: by 2002:a05:6402:414c:b0:5dc:1ec6:12bc with SMTP id 4fb4d7f45d1cf-5dc5effc2ecmr7611493a12.28.1738242215386;
        Thu, 30 Jan 2025 05:03:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738242215; cv=pass;
        d=google.com; s=arc-20240605;
        b=CGWPQxMp3Y0aieCgGMV61GiORrIwKlX+WOniP4hjfZlwmNudjq2XHQNYrStsw44OFK
         oq9lE0D13dmp0q9KP+gKYhBLAuJSNDe4YiIgl4fzdp4ZID25YwP1qlS3pyL+CPgImNJ7
         bOPEGomUi8JU2dPGQ3vV3Go3aIoVJYeRlG19nx16muTfN78piamQgVuOXmBZfCxNifab
         bgBzFUnHClOhS+ggtN/j+4wUv8dDzz/6aSaT5n/aO6v/WhTdroNQphcklkN+Y/CC7PZw
         JQz3Ds364bdPP5ar1Slv4HTWGBK4SU5oa4SVsQl2HXfmCZszA4FT4HKhWDDmoPU5kk4c
         KG9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=N9XnGHXlGiYuBFvuGEpZBKTX7f5kuRY5+8Rnx0tmroA=;
        fh=Qe1Z/MD0vjI9Zl9s5p7E7+jjEbdm3kdir/Riz6VYbdE=;
        b=Xl3mOtq/P8aDGD5dMQl4ivfj3uEBGwurBrynN2hZOHXWF8bYGhyUlUKpgLNE4EPexn
         u32W3iecVQ2r+MsUnw8N0tPxBKiHqRsMxp5fXAfcUaqe+euF+/t9iwx8iRyILeuFOujp
         Uqouan/OcwuVvjDR+TJz72azcIaY8hWXJkVTaBi9a7o272La2+F/Up+KO5JMWl1KCHsZ
         UDJKMxLwSvklTTGneWLwOys5fJHrvMeUNmVoC57PquXLJ++cMZpnra7OsbD2UMm8pxlb
         QkqcBQOJkkqWE+/S5Avkp3ptDHw85t92nI7miWBGKa9woWlMq6Wqhl2wQRF9TaQhmaSl
         LKbg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ldiUcwj7;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-493567-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-493567-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-493567-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5dc725600edsi962273a12.562.2025.01.30.05.03.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:03:35 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-493567-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ldiUcwj7;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-493567-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-493567-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD8A18899A0
	for <alex.bennee@linaro.org>; Thu, 30 Jan 2025 13:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F24F1DED4B;
	Thu, 30 Jan 2025 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldiUcwj7"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1629B1D88DB
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242210; cv=none; b=c6ykvaAkd+odfhAJorVoQt/o6vRtzJdLQYIPggqfbikwTgY5HwacM1QSYZqgVp1CPt8sxr/HnfTeov1harJeYM4/uaPfo4YXht1iXsviOworVvc3SWOz/VhG62H5vP2P/kR9LwO1u6EsRrgH/wLvL3IIybx59qapzTA0EiTVwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242210; c=relaxed/simple;
	bh=+Up349YLSg8MuPlubCkn8JkyDzqkqi4ZAU9amDg1JZY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHNwwSOtZs5nBiT9oMuYB2rToBoRXFK7aeuN691fFnal8dptHI6Zpr8VcykNxPBYZ0T+Es5q4dv62qEC9e7nIBIh41sJB5iB7jRwc6LKEzsStQnCcOwSkFQ5QZb5e9dvs3lT22Hf5A9ibkqEQ1rzz0iMr6WadRZFxSF0Z3wCGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldiUcwj7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C7FC4CED2;
	Thu, 30 Jan 2025 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738242209;
	bh=+Up349YLSg8MuPlubCkn8JkyDzqkqi4ZAU9amDg1JZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ldiUcwj7+mlSryfXQ8CyCeNyv/WKDJecIQgOcj4+6JQ8JSDmf9ZfDCprPA08mxtps
	 FwIu5eu4yozoAuxHIC8Jd7Mnnj5UZak3eJInHEfb7bh73AT1fYR3YLI/0txrgrH3Kx
	 V/M4cuVl9XJoNwXaQ9DoXPvDmyKEICL8fh7E6t5BtizTcaZxpC+o+seRccoDWjgiUz
	 uf1DqVtPBPNchEc9r6wjZhGd/MqYfKKBwxG5eDd2KHOhdYQs+qVDjn+EX0EPw0HaRf
	 4bYjvApIwjR7bF7LzDN8/qWt56reYpajnBKV10GV8tIHIHhQFRE6f+zXcdJXntdFle
	 baumsAwstZNEg==
Date: Thu, 30 Jan 2025 14:03:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] tests/acpi: virt: allow acpi table changes for
 a new table: HEST
Message-ID: <20250130140324.06cdd4bf@foz.lan>
In-Reply-To: <20250129160328.2f66584c@imammedo.users.ipa.redhat.com>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<1390b46682f2bac3587239d03a0ba22d18a9a044.1738137123.git.mchehab+huawei@kernel.org>
	<20250129160328.2f66584c@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: H7kgkng3yZOL

Em Wed, 29 Jan 2025 16:03:28 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Wed, 29 Jan 2025 09:04:08 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The DSDT table will also be affected by such change.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> move it right before the patch that would actually make changes to tables (10/13)

Table changes happens on two patches:

- patch 03/13: acpi/ghes: add a firmware file with HEST address

	HEST table was added here

- patch 10/13: arm/virt: Wire up a GED error device for ACPI / GHES 

	DSDT changes happen here.

If the idea is to avoid make check to fail between those two patches,
we need either to split them on 4 patches (one before/one after each
change) or do like I did on this series: whitelist before patch 3,
update after patch 10.

Regards,
Mauro

> 
> 
> > ---
> >  tests/data/acpi/aarch64/virt/HEST           | 0
> >  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
> >  2 files changed, 2 insertions(+)
> >  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> > 
> > diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8bf4..46298e38e7b8 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,3 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/aarch64/virt/HEST",
> > +"tests/data/acpi/aarch64/virt/DSDT",  
> 
> the list in not complete so 'make check-qtest' still fails
> [12/13] has complete list of changed files
> 



Thanks,
Mauro
