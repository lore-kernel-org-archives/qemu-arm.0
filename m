Received: by 10.182.105.169 with SMTP id gn9csp530942obb;
        Thu, 12 Nov 2015 11:23:55 -0800 (PST)
X-Received: by 10.129.154.138 with SMTP id r132mr16124892ywg.195.1447356235480;
        Thu, 12 Nov 2015 11:23:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o127si10500151ywe.300.2015.11.12.11.23.55
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 12 Nov 2015 11:23:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@roeck-us.net
Received: from localhost ([::1]:49388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwxTP-00074X-17
	for alex.bennee@linaro.org; Thu, 12 Nov 2015 14:23:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1ZwxSs-0006WM-J2
	for qemu-devel@nongnu.org; Thu, 12 Nov 2015 14:23:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1ZwxSo-00025q-Hw
	for qemu-devel@nongnu.org; Thu, 12 Nov 2015 14:23:22 -0500
Received: from bh-25.webhostbox.net ([208.91.199.152]:44746)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>)
	id 1ZwxSo-000259-Bk; Thu, 12 Nov 2015 14:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net;
	s=default; 
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=8uLVvb0qCWJt1sPCIl1yZES23fxJGJytVPTml0dj5fE=; 
	b=EJW7cUYBD7Gjk8SnCt0POs2og4HA1pEdm/viGwL1i/wxiGDXPnXFDJ2H1aVmaEBo+CFP0jnjGlslQWL834y5bb6P51ucd+jxA3dLQpJH71xFU4CW9kwvfK0DV+RojC7BdvaY2VNXLXDkKZf9R2qtRWg2TL/u9ZxnXY1/S2nN59o=;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:56367 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.85)
	(envelope-from <linux@roeck-us.net>)
	id 1ZwxSr-003sOs-Fv; Thu, 12 Nov 2015 19:23:21 +0000
Date: Thu, 12 Nov 2015 11:23:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Message-ID: <20151112192313.GA31667@roeck-us.net>
References: <da12a1acf1328d40eec6ca59c9e1baa150b7f18a.1447350661.git.crosthwaite.peter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da12a1acf1328d40eec6ca59c9e1baa150b7f18a.1447350661.git.crosthwaite.peter@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 208.91.199.152
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair.francis@xilinx.com
Subject: Re: [Qemu-devel] [PATCH for-2.5 v5 1/1] hw/misc: Add support for
 ADC controller in Xilinx Zynq 7000
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
X-TUID: KTwV8S9cb84F

On Thu, Nov 12, 2015 at 09:54:55AM -0800, Peter Crosthwaite wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Add support for the Xilinx XADC core used in Zynq 7000.
> 
> References:
> - Zynq-7000 All Programmable SoC Technical Reference Manual
> - 7 Series FPGAs and Zynq-7000 All Programmable SoC XADC
>   Dual 12-Bit 1 MSPS Analog-to-Digital Converter
> 
> Tested with Linux using QEMU machine xilinx-zynq-a9 with devicetree
> files zynq-zc702.dtb and zynq-zc706.dtb, and kernel configuration
> multi_v7_defconfig.
> 
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> [ PC changes:
>   * Changed macro names to match TRM where possible
>   * Made programmers model macro scheme consistent
>   * Dropped XADC_ZYNQ_ prefix on local macros
>   * Fix ALM field width
>   * Update threshold-comparison interrupts in _update_ints()
>   * factored out DFIFO pushes into helper. Renamed to "push/pop"
>   * Changed xadc_reg to 10 bits and added OOB check.
>   * Reduced scope of MCTL reset to just stop channel coms.
>   * Added dummy read data to write commands
>   * Changed _ to - seperators in string names and filenames
>   * Dropped ------------ in header comment
>   * Catchall'ed _update_ints() in _write handler.
>   * Minor whitespace changes.
>   * Use ZYNQ_XADC_FIFO_DEPTH instead of ARRAY_SIZE()
> ]
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

For v5 (same configuration as above):

Tested-by: Guenter Roeck <linux@roeck-us.net>
