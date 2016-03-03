Received: by 10.25.208.211 with SMTP id h202csp2753979lfg;
        Thu, 3 Mar 2016 07:24:10 -0800 (PST)
X-Received: by 10.140.241.68 with SMTP id m65mr3910381qhc.98.1457018650090;
        Thu, 03 Mar 2016 07:24:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g81si4825500qkb.56.2016.03.03.07.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 07:24:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abV6n-0004oi-JE
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 10:24:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV6g-0004gP-V0
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:24:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV6d-0005h3-3Y
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:24:02 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV6c-0005gd-VV
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:23:59 -0500
Received: by mail-vk0-x234.google.com with SMTP id c3so24570979vkb.3
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JO0IW28oHOIeJmtywm24NxX823DjgqKPFR522xBd30o=;
	b=KkLGUBbFkqWt8UiREfEkXBpL5ZsTh1ZLDJEKbV6oF5YhQYxZ8tmn2Oprfi6Y/Z3+rU
	skh9y9HaymuV9EHwf9MWmoyH+Z47r7yuNgx3qhYS9bYF6c4Y7lCWSQS1XnXg2QkwBas0
	kGm3KegSdQy24y/6AnHHfmZxWhLkgA/2qouN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JO0IW28oHOIeJmtywm24NxX823DjgqKPFR522xBd30o=;
	b=lMdpY83swT4Gxz3s3qXxI4aTrcCFqA5SnoIPbgBmLWDARB0V5Wy3mxK0TaplHYacPw
	YUXuiZBl8vz7+j58vXkuekGob34EqC9cv/8470+gZaEMRf8nKbe/Mqh/uB5hwRMJK2Ke
	o1+T7NwN9WKyupy0zKEqwpnlubuAMV781FEsxhfaTzJUSrjaxNQkJm1dMo/BYY/ItnWM
	79zzvkH9yKD85AT+9y2z0LmRaYKrGotr3r2zwd2vaKNTVQmDMWluPIXh1n2Fk+cgEFt8
	4yRVNpE5QmQdZfMHQftMtvlJy0x3F4Z8RjPI3xGTN/MoJ7vVs3oA2WwPci6EmuHvrZLk
	Sivg==
X-Gm-Message-State: AD7BkJJgbAp2UI0uwcl8k4IMlaV9r/ShC8Sq+VAdWAWrhLXwc+mO63ZsArD2RsR7pNaPdGFTmjQJWU88/1YTW0Eu
X-Received: by 10.31.141.2 with SMTP id p2mr2428016vkd.37.1457018637408; Thu,
	03 Mar 2016 07:23:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 07:23:38 -0800 (PST)
In-Reply-To: <de1440818b347c6d445313aa18440ca3b8b7676e.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
	<de1440818b347c6d445313aa18440ca3b8b7676e.1456901522.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 15:23:38 +0000
Message-ID: <CAFEAcA_cJaOwHpPKKwwi+D-bxoRPsSOA631gT4uweDV_ewto-w@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v2 18/18] arm: boot: Support big-endian elfs
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
X-TUID: kfpcsx6Taq3e

On 2 March 2016 at 06:56, Peter Crosthwaite <crosthwaitepeter@gmail.com> wrote:
> Support ARM big-endian ELF files in system-mode emulation. When loading
> an elf, determine the endianness mode expected by the elf, and set the
> relevant CPU state accordingly.
>
> With this, big-endian modes are now fully supported via system-mode LE,
> so there is no need to restrict the elf loading to the TARGET
> endianness so the ifdeffery on TARGET_WORDS_BIGENDIAN goes away.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---


> +                /* In BE32, the CPU has a different view of the per-byte
> +                 * address map than the rest of the system. BE32 elfs are
> +                 * organised such that they can be programmed through the
> +                 * CPUs per-word byte-reversed view of the world. QEMU

"CPU's".

> +                 * however loads elfs independently of the CPU. So tell
> +                 * the elf loader to byte reverse the data for us.
> +                 */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
