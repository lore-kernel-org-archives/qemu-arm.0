Received: by 10.182.105.169 with SMTP id gn9csp1108558obb;
        Fri, 6 Nov 2015 06:48:42 -0800 (PST)
X-Received: by 10.31.2.193 with SMTP id 184mr13737929vkc.151.1446821322910;
        Fri, 06 Nov 2015 06:48:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i125si424471vke.54.2015.11.06.06.48.42
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:48:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:39158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuiJm-0006hW-H5
	for alex.bennee@linaro.org; Fri, 06 Nov 2015 09:48:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiJL-0006Oo-Ue
	for qemu-devel@nongnu.org; Fri, 06 Nov 2015 09:48:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiJL-0003ix-0U
	for qemu-devel@nongnu.org; Fri, 06 Nov 2015 09:48:15 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33696)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiJK-0003ir-TJ
	for qemu-devel@nongnu.org; Fri, 06 Nov 2015 09:48:14 -0500
Received: by vkbk63 with SMTP id k63so3749776vkb.0
	for <qemu-devel@nongnu.org>; Fri, 06 Nov 2015 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oAM+94T/dsrQltMQx175EKQvlxnE00BnLaakbjMDgIM=;
	b=t+u7q5G4nfSHMPGS13mQy+PCiuT/R5FdBUXabd73o8Ns4P7xPRYMw53TU3YjiaTcp9
	xRbvmhWr4TD4QVfwLMlg1yt+LSz+mSt/Ex2Gp9YMTzoCRT8CU1qJFrONYlcIG1598f3Z
	g3PIWx9CYzYpFGvh/INxl97o8LEg8GsQ6nvaZRLJYKL2tiw/fHVIBEj+FiWDN9hr7dsG
	gcWwm3W5u7dqQONuWMLQBL8vQVZ5ww2rMqHhucPDxv3/LsH6VtHmAT5xVWRvHFrMCUNw
	H+RZ/X1Nzvi4mO+X2CKsCPEP5Bp9415f2XmlQkOgYClvgSig9wkrE8S/Ke3LNrTe5s/T
	I83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oAM+94T/dsrQltMQx175EKQvlxnE00BnLaakbjMDgIM=;
	b=IvKUWLw5aEjTXOe0wsTVS1hfrOaz6WatOMALtnVeKnSJJ+2VYR7YZM9sNixXk1rnlu
	u1kcwr8DDZGkeWk5uf5KhRT2L3BdWdGTqbPNBSZCw2Dxm0UCfl3Si3aaAnyoCyhujHgs
	B7WCXtqgab64gxCqlIPnc1qetfOZ09HtMJea/+tIXfCELoTq03a69ZHlPx4JZlOl1J/O
	h6l2SCG1YG51yvWkL/ejkJ6SWPCMZvwadhTFiIcjOOB2RWiiMixn9WTVJUSrbIzzf/bM
	EkKJy2BdeJZecMilDuN0NVINXqnv+BXcJ163l87GwBr85xdMQOXlpS6EuRlMZ2H1cAz4
	at8A==
X-Gm-Message-State: ALoCoQkSd++o8gKCsT9c3X8MdkF3zaBiJpeR5Hk+snTZrtvd55o7Cy82hatI5vJG0So7vwa+r+dF
X-Received: by 10.31.160.79 with SMTP id j76mr13896475vke.37.1446821294570;
	Fri, 06 Nov 2015 06:48:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 06:47:55 -0800 (PST)
In-Reply-To: <7c00b99113acb1bf62e78f7a71a14eb3b9221ca3.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
	<7c00b99113acb1bf62e78f7a71a14eb3b9221ca3.1446428067.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 14:47:55 +0000
Message-ID: <CAFEAcA9PXVV36qTUW__nSGNudXq4YxqWa4Leg=MfrMsMu1TDog@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-devel] [PATCH for-2.5 v3 3/3] arm: highbank: Implement
	PSCI and dummy monitor
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
X-TUID: +gcDHEPMKtUp

On 3 November 2015 at 04:30, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Firstly, enable monitor mode and PSCI, both are which are features of

"both of which"

> this board.
>
> In addition to PSCI, this board also uses SMC for cache maintainence
> ops. This means we need a secure monitor to catch these and nop them.
> Use the ARM boot board-setup feature to implement this. All traps to
> monitor mode implement the nop.
>
> As a KVM CPU cannot run in secure mode, do not do the board-setup if
> not running TCG. Report a warning explaining the limitation is this
> case.

"in this case".

> @@ -371,6 +410,16 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
>      highbank_binfo.loader_start = 0;
>      highbank_binfo.write_secondary_boot = hb_write_secondary;
>      highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
> +    if (tcg_enabled()) {

This also needs to be !kvm_enabled(), so 'make check' works.

> +        highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
> +        highbank_binfo.write_board_setup = hb_write_board_setup;
> +        highbank_binfo.secure_board_setup = true;
> +    } else {
> +        error_report("WARNING: TCG unavailable - "
> +                     "unable to load built-in Monitor support.\n"
> +                     "Some guests (such as Linux) may not boot\n");

You can't have newlines in an error_report() string. I suggest

        error_report("WARNING: cannot load built-in Monitor support if KVM "
                     "is enabled. Some guests (such as Linux) may not boot.");

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
