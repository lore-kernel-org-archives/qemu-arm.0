Received: by 10.25.159.19 with SMTP id i19csp2595723lfe;
        Tue, 19 Jan 2016 08:33:29 -0800 (PST)
X-Received: by 10.141.28.149 with SMTP id f143mr41410472qhe.66.1453221209527;
        Tue, 19 Jan 2016 08:33:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w80si38139162qhw.30.2016.01.19.08.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:33:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLZDl-0003VL-0Y
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 11:33:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZ3U-0001QK-Mb
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:22:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZ3T-0005kK-QR
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:22:52 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:32776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZ3T-0005k8-LB
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:22:51 -0500
Received: by mail-vk0-x22f.google.com with SMTP id e64so14847132vkg.0
	for <qemu-devel@nongnu.org>; Tue, 19 Jan 2016 08:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Bzvai6D519Q4ypaQsh03Vqp9Q74YcxTGcXDV4MgfL8Y=;
	b=TRXkqad1+L5NnXQgguB9j5mv+LKKTNNpb8/6a9R77UI9rjvzEXs65g6efL4IuR5OaQ
	MO3CSZ/Ojg1UxGttOHItcnJyuQsaJsuDiLD2V3+ztxnkzQbR4nXGF1HIiOkNc7Jt8JJ2
	RqiR5tHrsJ0OdiiHFiaUdBCDwKHl6E1z03FuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Bzvai6D519Q4ypaQsh03Vqp9Q74YcxTGcXDV4MgfL8Y=;
	b=G5/zRXaRJKzmPKO+1gkUF03edefujWNV4tX6RsH9ut+92hISP7w0zBKSV5+DdSmV5B
	IHQaCZbfJ/IIyxM6L3Oap+lvXmKY/6ZqnMs4qaeNIo1OsgTIcL3ctyKYrpRK1ge+pypE
	kucU6OIPLFrV21MdI8vPJYcw9QkLMMwDQXGvHgn9aytIif8wiquIVpYI4ZqGWcdfyTtR
	PJgXSR2QaBLMYtOejkERk0s6qRgfp3H1CGybNdoiEN+qIAZNrsaEMxA+xEMTU7l9s1BT
	KdScmFGcOMyuyvcaObG77iRc7y7KSd97yDdRkRDXds6yND0kx9CyZGLmPz9kpVKo9VPW
	+RSA==
X-Gm-Message-State: ALoCoQka/jsKbO9o6pd9Ss1LHLiGwvNFfTevS7LIFmUunfEZRQNp6BBHTBtXncMjZNFTY/g0DqE6rDqKWVekvJV1TjDge82W5xgBoW/lpE/8/Wm4shjtZok=
X-Received: by 10.31.131.203 with SMTP id f194mr21621575vkd.90.1453220571192; 
	Tue, 19 Jan 2016 08:22:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:22:31 -0800 (PST)
In-Reply-To: <4f92a762d0362bb4e75667518b60c3c719c26b8b.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<4f92a762d0362bb4e75667518b60c3c719c26b8b.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:22:31 +0000
Message-ID: <CAFEAcA_Ecqc8QHh0niji6E76cAuYFBnUoobiMZ208hUzqf5diA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-devel] [PATCH v1 02/17] linux-user: arm: set
 CPSR.E/SCTLR.E0E correctly for BE mode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H/SU5W1yYr1y

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> If doing big-endian linux-user mode, set both the CPSR.E and SCTLR.E0E
> bits. This sets big-endian mode for data accesses in AA32 and AA64
> resp.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>
>  linux-user/main.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index ee12035..4f8ea9c 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -4454,6 +4454,10 @@ int main(int argc, char **argv, char **envp)
>          for(i = 0; i < 16; i++) {
>              env->regs[i] = regs->uregs[i];
>          }
> +#ifdef TARGET_WORDS_BIGENDIAN
> +        env->uncached_cpsr |= CPSR_E;
> +        env->cp15.sctlr_el[1] |= SCTLR_E0E;
> +#endif

This looks a bit weird. Setting CPSR_E or SCTLR_E0E doesn't
make sense for BE32, and for BE8 we want to do it inside the
runtime-conditional below, I would have thought.

The commit message implies that this will work for AArch64, but
this won't have any effect for A64 binaries because it's inside
an ifndef(TARGET_AARCH64) block.

>          /* Enable BE8.  */
>          if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
>              && (info->elf_flags & EF_ARM_BE8)) {

Not sure how an AArch64 BE ELF file identifies itself, but I guess
if we're supporting it we want a similar condition for it.
Happy to leave the 64-bit support until we've got the 32-bit
stuff working though.

thanks
-- PMM
