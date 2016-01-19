Received: by 10.25.159.19 with SMTP id i19csp2636032lfe;
        Tue, 19 Jan 2016 09:50:53 -0800 (PST)
X-Received: by 10.140.42.139 with SMTP id c11mr40099570qga.5.1453225853430;
        Tue, 19 Jan 2016 09:50:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p133si22591828qhp.53.2016.01.19.09.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 09:50:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLaQe-000738-Qa
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 12:50:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaQd-00072E-6g
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:50:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaQc-0004J2-6I
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:50:51 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaQa-0004Gk-VV
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:50:50 -0500
Received: by mail-vk0-x229.google.com with SMTP id e185so13385514vkb.1
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EsijEymz6eZfPIemgz5ZCBC3w1PCHd9vkhnz4+oyGxo=;
	b=DEbvf6+DRPA2BBc7V5Yi69wSb295QysudQWq+ojYsU57zndri4O2Q6TyH2TZn5qx11
	n5XaS+f3umXl07tOGq6gePYPGpBdXCy48kpkxzske6JGYhtR0ZQYlmvJGtA6j9ELFlbE
	vigYQQPxlRyhzcal768mhDVcogE7tk61HpBd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EsijEymz6eZfPIemgz5ZCBC3w1PCHd9vkhnz4+oyGxo=;
	b=BqVkaF5pBleSKF/LTeaRoSNMfz72bTKK9O4rR1HcS+eas38ghZS16A22w01IfgYOgN
	D5NbixZ+MY+UPZ2PHOmQ30vtOSjwqSmqB5ug6HxyqSgFiWksuL+L4zkWFrI4op3wsjXH
	ByMR1E0IehWvjI5jfdujzkPu8SqFCNv6RMr3FaT6v38AxbR0AR8kq6hTsDWpKITt6MKM
	hq+Y6JWKAf+F0BCxwoDO1KLWNQ7VQprXxcz6dwzEUKOmV28GhE6PNSCTNgMKTE4WT5oe
	fNfUtDWavcwSt8Pw1O1RENwAxUHY5g80PXFPBmZWsCimTu37hNeT77xAHLS1whzAl45N
	FzMw==
X-Gm-Message-State: ALoCoQmwK0FVp8nYpihYcU9sf5m5csEdC4gkG2G45AaRymcYvZeVhkA+fv6xSp6oz2J1tM8Jqfu43uCcEHdDrAzpEhw/QOH1IhUaTEt5phnSX6Df3IOmWCI=
X-Received: by 10.31.131.203 with SMTP id f194mr21933704vkd.90.1453225848388; 
	Tue, 19 Jan 2016 09:50:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 09:50:28 -0800 (PST)
In-Reply-To: <06401b2d276819d87a81058279e1d05d4e9ec7b7.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<06401b2d276819d87a81058279e1d05d4e9ec7b7.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 17:50:28 +0000
Message-ID: <CAFEAcA-CQZNV8OvHL22TzQFoR9n1yeadYnmjvhad5UbxNctJUQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 15/17] loader: add API to load elf header
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
X-TUID: i7u8THmm4g3C

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Add an API to load an elf header header from a file. Populates a
> buffer with the header contents, as well as a boolean for whether the
> elf is 64b or not. Both arguments are optional.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>
>  hw/core/loader.c    | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/loader.h |  1 +
>  2 files changed, 49 insertions(+)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 6b69852..28da8e2 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -331,6 +331,54 @@ const char *load_elf_strerror(int error)
>      }
>  }
>
> +void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
> +{
> +    int fd;
> +    uint8_t e_ident[EI_NIDENT];
> +    size_t hdr_size, off = 0;
> +    bool is64l;
> +
> +    fd = open(filename, O_RDONLY | O_BINARY);
> +    if (fd < 0) {
> +        error_setg_errno(errp, errno, "Fail to open file");

"Failed" (also below).

I don't think we end up with the filename anywhere in the
error message; it would be helpful if we could include it.

> +        return;
> +    }
> +    if (read(fd, e_ident, sizeof(e_ident)) != sizeof(e_ident)) {
> +        error_setg_errno(errp, errno, "Fail to read file");
> +        goto fail;
> +    }
> +    if (e_ident[0] != ELFMAG0 ||
> +        e_ident[1] != ELFMAG1 ||
> +        e_ident[2] != ELFMAG2 ||
> +        e_ident[3] != ELFMAG3) {
> +        error_setg(errp, "Bad ELF magic");
> +        goto fail;
> +    }
> +
> +    is64l = e_ident[EI_CLASS] == ELFCLASS64;
> +    hdr_size = is64l ? sizeof(Elf64_Ehdr) : sizeof(Elf32_Ehdr);
> +    if (is64) {
> +        *is64 = is64l;
> +    }
> +
> +    lseek(fd, 0, SEEK_SET);

You're not checking this lseek for failure (and you don't
need it anyway, because you could just copy the magic bytes
into *hdr and read four fewer bytes).

> +    while (hdr && off < hdr_size) {
> +        size_t br = read(fd, hdr + off, hdr_size - off);
> +        switch (br) {
> +        case 0:
> +            error_setg(errp, "File too short");
> +            goto fail;
> +        case -1:
> +            error_setg_errno(errp, errno, "Failed to read file");
> +            goto fail;
> +        }
> +        off += br;
> +    }
> +
> +fail:
> +    close(fd);
> +}
> +
>  /* return < 0 if error, otherwise the number of bytes loaded in memory */
>  int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
>               void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index f7b43ab..33067f8 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -36,6 +36,7 @@ int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
>               void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
>               uint64_t *highaddr, int big_endian, int elf_machine,
>               int clear_lsb);
> +void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);

Doc comment, please.

>  int load_aout(const char *filename, hwaddr addr, int max_sz,
>                int bswap_needed, hwaddr target_page_size);
>  int load_uimage(const char *filename, hwaddr *ep,
> --
> 1.9.1

thanks
-- PMM
