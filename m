Received: by 10.25.159.19 with SMTP id i19csp2637573lfe;
        Tue, 19 Jan 2016 09:53:52 -0800 (PST)
X-Received: by 10.140.241.197 with SMTP id m188mr40940950qhc.49.1453226032039;
        Tue, 19 Jan 2016 09:53:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e5si38576553qkb.92.2016.01.19.09.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 09:53:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLaTX-0000FZ-LG
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 12:53:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaTV-0000FI-Ra
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:53:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaTU-0004uy-UF
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:53:49 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33187)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaTU-0004us-P7
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:53:48 -0500
Received: by mail-vk0-x22d.google.com with SMTP id e64so16498169vkg.0
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 09:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7KHumhufPfGbvkm4hj6HBwE2Tnrt22UcpSfQ8PMHzZI=;
	b=MJQbeknmEMiN0rVhrmH8/ZJiGWQVYwhabjpK0Pg9vjZUw5uhzMatcu9wQ9uTO1/IGR
	VWJCkMvbcPZPWxSheU/R79+csLX+5wRro4f440gCWof4rTZ+exjz+J6IpOFdS68umKyd
	zYNznrt2kZKgHnVasZbALwuTk8wSCmfQhtJTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7KHumhufPfGbvkm4hj6HBwE2Tnrt22UcpSfQ8PMHzZI=;
	b=SkEq1z5oTrHiYSiTErYRhBPncIZHc4Cp5NBmxijj7sFwPLdPXBOCXgWMSV7kB8jTxt
	+mETgjZ1SZWUq3Q2U319+5IDZAh9guXuqoV8unPo5QfzsP2sIUyKZswopAMP3Amzc2pY
	an92/M4nV+mypsDdU1WmgQjxGzfth3EmK80qLa4APubhxdlsfoNU53pMHYgRfcDNuEKd
	cEt9o0KmbBZANBAtTNNpZJPxWPfXlKL+XPOhUBsThd2I9WToxZCtotT2DlsqGdwTsnPX
	kX1gSDTkHTvvNDf2X5mFwH9PFo6TZm9R8AeQFkRn0QWXWFGDpENHrmFnsCydOSI1PnVF
	WVug==
X-Gm-Message-State: ALoCoQlfbjey0heYHGBSh5/Ho39yxQayxBSAW98PH85w8ekTIMHVOlvtdKWpPWvSOfeG1a7Gp8zgBeaMnDAVgUomIhGDf1cktj3bKEjramWRnMGZj46YHKE=
X-Received: by 10.31.52.147 with SMTP id b141mr21216794vka.82.1453226028392;
	Tue, 19 Jan 2016 09:53:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 09:53:28 -0800 (PST)
In-Reply-To: <e19e839cc4cf495fd7db0ab0fa5dba52657cd8ca.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<e19e839cc4cf495fd7db0ab0fa5dba52657cd8ca.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 17:53:28 +0000
Message-ID: <CAFEAcA-ENLO+YZ+b2bZi40o4qVaucdXDmLqPHXUYf9OwM1_Usw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 16/17] loader: Add data swap option to
	load-elf
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
X-TUID: UevwS1Piksmj

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Some CPUs are of an opposite data-endianness to other components in the
> system. Sometimes elfs have the data sections layed out with this CPU
> data-endianess accounting for when loaded via the CPU, byte swaps
> (relative to other system components) will occur.
>
> The leading example, is ARM's BE32 mode, which is is basically LE with
> address manipulation on half-word and byte accesses to access the
> hw/byte reversed address. This means that word data is invariant
> accross LE and BE32. This also means that instructions are still LE.
> The expectation is that the elf will be loaded via the CPU in this
> endianness scheme, which means the data in the elf is reversed at
> compile time.
>
> As QEMU loads via the system memory directly, rather than the CPU, we
> need a mechanism to reverse elf data endianness to implement this
> possibility.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 33067f8..e542575 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -35,7 +35,7 @@ const char *load_elf_strerror(int error);
>  int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
>               void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
>               uint64_t *highaddr, int big_endian, int elf_machine,
> -             int clear_lsb);
> +             int clear_lsb, int data_swab);
>  void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>  int load_aout(const char *filename, hwaddr addr, int max_sz,
>                int bswap_needed, hwaddr target_page_size);

Can we have a doc comment so we have something that defines what
values data_swab accepts? (it's not just a bool).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
