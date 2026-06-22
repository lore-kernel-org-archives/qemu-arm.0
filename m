Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81EFCDB46B
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 08:42:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbaF1-0007Xw-Ej; Mon, 22 Jun 2026 04:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jic23@kernel.org>) id 1wbaEx-0007Xh-0w
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 04:42:48 -0400
Received: from tor.source.kernel.org ([172.105.4.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jic23@kernel.org>) id 1wbaEv-0007K3-AQ
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 04:42:46 -0400
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B2ECA6001A;
 Mon, 22 Jun 2026 08:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79ECC1F000E9;
 Mon, 22 Jun 2026 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782117762;
 bh=8DNrJ7xrGazJwS5U3+QWziCoPvFQKYCKjWzIcNy6Wpo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=AAPeRVdPMJIf9riv+F4PdXeab4TQzM9brLBftORBtbetVeCJdXJ96FZRbVX5XrbQD
 I7wFWAh5tByuXcvuRYoC4+lm8QQQgEFG/A4Py2EaN0wgI/Dm0mELcNUB0Me3Mfhyha
 QRfQcA9xmPUBjCgmC4TGSISEUwmCwFH4GzNRDwIaATJI5h/EBwRcfBHpnmffF4IC8X
 TFU2U//HHttlP1e+wu0nqDaPuryNRicXiHH4dkBKTlr/xMgaZQTXXnOjsNCMENW0tt
 RufyZx3G6LCId3fnxqHph2ekmK9ya+3wuZ5qVdy7a6hIPDcaLzvSICatq/pRZJMNgy
 jNWek66CGZV7g==
Date: Mon, 22 Jun 2026 09:42:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: uswg@uefi.org, taoxiaofei@huawei.com, Mauro Carvalho Chehab
 <m.chehab@huawei.com>, linux-acpi@vger.kernel.org, qemu-arm@nongnu.org,
 Dong Wei <Dong.Wei@arm.com>, Samer El-Haj-Mahmoud
 <Samer.El-Haj-Mahmoud@arm.com>, Jose Marinho <jose.marinho@arm.com>,
 wanghuiqiang@huawei.com
Subject: Re: [RESEND] troubles with ARM processor type changes on UEFI 2.11
Message-ID: <20260622094233.1088c8bf@jic23-huawei>
In-Reply-To: <20260622102518.0ad0e4de@foz.lan>
References: <20260622102518.0ad0e4de@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=jic23@kernel.org;
 helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 22 Jun 2026 10:25:18 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> wrote:

> (as I got no answer, I'm resending it, c/c some ARM people as well)
> 
> Hi,
> 
> I maintain ACPI HEST support on QEMU and I'm one of the Linux kernel reviewers
> for the RAS subsystem. I'm also the author and maintainer of Linux rasdaemon,
> responsible to handle RAS reports (including from GHES) on Linux.
> 
> There is an incompatible change at UEFI 2.11 spec at Section N.2.4.4.1,
> which, according with UEFI 2.11 changelog, it is related to this issue:
> 
> 	2462 - Fix the Type mnemonic description in the ARM Processor Error Information Structure
> 
> This is the second time the specs changed the meaning of the type field
> inside the ARM processor error info:
> 
> - Before UEFI 2.9A, the spec has a list of values for error type. 
>   From the specs, type, at offset 4 was described as:
>     
>             - Cache error
>             - TLB Error
>             - Bus Error
>             - Micro-architectural Error
>             All other values are reserved
>     
>     Yet, there was no information about how this would be encoded.
>     
> - UEFI 2.9A defined the actual expected values as:
>     
>             - Bit 1 - Cache Error
>             - Bit 2 - TLB Error
>             - Bit 3 - Bus Error
>             - Bit 4 - Micro-architectural Error
>             All other values are reserved
> 
>     However, even being an incompatible change, the spec didn't change
>     version field at Section N.2.4.4.1.
> 
>    Linux, QEMU, rasdaemon and likely several BIOS implementations
>    were updated accordingly.
> 
> - UEFI 2.11 changed the definition to:
> 
>             - Bit 0 - Cache Error
>             - Bit 1 - TLB Error
>             - Bit 2 - Bus Error
>             - Bit 3 - Micro-architectural Error
>             All other values are reserved
> 
>   Again, another incompatible change and without changing the version
>   field at Section N.2.4.4.1.
> 
> With the current mess, it is impossible for the OSPM (and RAS apps) to
> properly map ARM processor error types, as for instance, type=2 can
> mean:
> 
> 	- Bus error (up to UEFI 2.9)
> 	- Cache error (UEFI 2.9A and UEFI 2.10)
> 	- TLB error (UEFI 2.11)
> 
> Please issue an errata incrementing version number, to allow OSPM
> QEMU and rasdaemon to properly interpret this field.
> 
FWIW I fully agree that an errata is needed. (Though, even though ambiguous,
changing meaning should probably have been done by deprecating that field
and adding a new one... too late now!) 

It seems a bit odd to do it this way but Mauro, you should be able
to file a code first proposal at:
https://github.com/tianocore/edk2/issues?q=is%3Aissue%20state%3Aopen%20label%3Atype%3Acode-first

Make sure it has a code first label.  I think you also need
someone to take it through the committee though (I'm sadly not
in a position to do so at the moment).

Samer or Jose (+CC), can you deal with this one?

Thanks,

Jonathan

> Thanks,
> Mauro


