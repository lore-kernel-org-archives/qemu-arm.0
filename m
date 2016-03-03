Received: by 10.25.208.211 with SMTP id h202csp2754470lfg;
        Thu, 3 Mar 2016 07:25:15 -0800 (PST)
X-Received: by 10.55.212.130 with SMTP id s2mr3663434qks.74.1457018715567;
        Thu, 03 Mar 2016 07:25:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l90si41438355qge.69.2016.03.03.07.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 07:25:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abV7q-0005lP-Jd
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 10:25:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV7o-0005iE-0I
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:25:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV7n-0005xz-3i
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:25:11 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:36266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV7m-0005xg-Vn
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:25:11 -0500
Received: by mail-vk0-x236.google.com with SMTP id c3so24611161vkb.3
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 07:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1BawHCo09A3tX16T60t3eBNHa+x6ZX0q2QE9hKzrK7E=;
	b=kQSU2rJMpwRYKG2mQAsLQOiTaNlB2UqfemrtojtltP+eiOZ6ry1H2ASrLU3oi33rDv
	MA9pfKJM9ROWvfgkr3xMninPaymhFOwz6PRmegRiZTyCqETukZc3r6GTQvb9AyQoYoFb
	aAHF1vGZhjYUFpcC83RDrb4KNF59tbll+kL7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1BawHCo09A3tX16T60t3eBNHa+x6ZX0q2QE9hKzrK7E=;
	b=hISmHYVLFN4bUFuq42BQNHwW1B2UwWHzG5KmYf9MczjAZzXCRYTZ1QYr2nrwdyKE5Q
	NUpcFnDd0OJDW4wBzxqY/PCe9TIcjuIs+zm3pXS4BRzwWuR37jYRdN4nI+wgpsG6xCgu
	6u7sVflbMPazvTtLOl5pwqlppNOpFs0m2FqJcf+u1kLPXmhSG9CuyZbkJ4ZymegtFagW
	POWHtLM9iCI9rS+N119XTTCJXTRy2VGtglj4ybqfWq5DOzfU2h54T4mN4RMVrrJW07gZ
	5da7b8bw7XS3YLKYtdEt1jIHGDpWccnpvlo8sxBRVCJk9P5lCmXqFrMmskwbNOB2DbCZ
	tUIg==
X-Gm-Message-State: AD7BkJLbwsgYuu3mBlJfmCsYfuUOzfZ/RcoRDdw508qBwW5hT8z1Bt6qJOZnUNkz7gZxU5yu0/2lc1yA32/U8D+z
X-Received: by 10.31.107.194 with SMTP id k63mr2054597vki.27.1457018710523;
	Thu, 03 Mar 2016 07:25:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 07:24:51 -0800 (PST)
In-Reply-To: <368ecb8c07deff822a1115b4df3e33e4e4a35524.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
	<368ecb8c07deff822a1115b4df3e33e4e4a35524.1456901522.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 15:24:51 +0000
Message-ID: <CAFEAcA84AfVshX5K5juEq3r_VPKjk5qOzi-q59zyZO=g_uFOJw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v2 15/18] loader: add API to load elf header
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L9OEmEODcNbf

On 2 March 2016 at 06:56, Peter Crosthwaite <crosthwaitepeter@gmail.com> wrote:
> Add an API to load an elf header header from a file. Populates a
> buffer with the header contents, as well as a boolean for whether the
> elf is 64b or not. Both arguments are optional.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> Changed since v1 (PMM review):
> Add filname to error messages
> Remove unneeded lseek()
> Add doc comment
> +/** load_elf_hdr:
> + * @filename: Path of ELF file
> + * @hdr: Buffer to populate with header data. Header data will not be
> + * filled if set to NULL.
> + * @is64: Set to true if the ELF is 64bit. Ignored if set to NULL
> + * @errp: Populated with an error in failure cases
> + *
> + * Inspect as ELF file's header. Read its full header contents into a

"an".

> + * buffer and/or determine if the ELF is 64bit.
> + */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
