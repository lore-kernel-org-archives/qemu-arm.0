Received: by 10.25.221.202 with SMTP id w71csp3869367lfi;
        Tue, 8 Aug 2017 01:19:47 -0700 (PDT)
X-Received: by 10.159.62.147 with SMTP id x19mr1981777uai.179.1502180387894;
        Tue, 08 Aug 2017 01:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502180387; cv=none;
        d=google.com; s=arc-20160816;
        b=TRzP9n/xIwdU3Dl3TYHCNB3n8fb7opXZA085fFeGCHztZZ1SFrbbDnQY6L2d4Kthr5
         3UYJdgRvdBWgn5zrfFApTugm7/7qf6+WuuQTn2Ibm4s4d/KpOR2h2dQ8x+fYZbXkiXU6
         ydPL6sdrkI8fTpugUTKjRVTscNFI4IR4M2HfDaKGb90TFkKwoCG1j4VMQNd5ntRxrHyJ
         Y+ziOcVPPAR70C2ZTPlbptHqofy5uWwtybN2c1H/8rcYy0Qer+CMSZfoHCM8fOnBPSXj
         ovgS4AM6Ll3mvQG1iOk7A5ZCwY1NZt4geICpvT1X7Cw2FjlsJIMvySw++Xz8NXZJQZ7v
         GtcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lQt5pVMCUzGsSM2qvKfKeUJ5zvDnDWsRIMlNlidPyqw=;
        b=TqjYAEyJ45mkZgj58skwePq+NnLxTpM3PwfVtCaF5auEtODTmACn31wD4L2sH/d03u
         UI1tu+sOEQzNoD/fZHLvb/VMnOLASucBs8PJ09in4T44xvhKEIGiArjkbZkt3kxIvX3U
         8vKhkD2VK1zPrPffW4irZKkEaR7d77N4vNw4QtC6ivA7d9QWOpDJ4OQ5uPDDdfo2dEzo
         LDTEaEA4yalc0put9NeBtdvIZPD4E//sg3R1yNMHMUm+iNQn4VGJ85Pu4TpKR5flO6WI
         IRghPXSkOYPXYgS/wd+zoLs4pEWltgO2webUk5a/ZLMeAicUpvqlrgPmSayAmsWXC3z2
         5X2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlhTagLt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t207si435273vkb.227.2017.08.08.01.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Aug 2017 01:19:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlhTagLt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dezjv-0000Hm-Br
	for alex.bennee@linaro.org; Tue, 08 Aug 2017 04:19:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <huayanghao@gmail.com>) id 1dezj3-0008Py-9R
	for qemu-devel@nongnu.org; Tue, 08 Aug 2017 04:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <huayanghao@gmail.com>) id 1dezj2-0003G5-4r
	for qemu-devel@nongnu.org; Tue, 08 Aug 2017 04:18:53 -0400
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:33914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <huayanghao@gmail.com>)
	id 1deziz-0003Ct-Dr; Tue, 08 Aug 2017 04:18:49 -0400
Received: by mail-yw0-x241.google.com with SMTP id t139so1896968ywg.1;
	Tue, 08 Aug 2017 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lQt5pVMCUzGsSM2qvKfKeUJ5zvDnDWsRIMlNlidPyqw=;
	b=hlhTagLtkHS4Nc59S2nZhyc8kMhp3kW2PWjF33+/PaSRCnsEQ/kQ9Rf00NX5HmMXmo
	Nyq6y9E66KmeF3aEGMBpTyctbcDla7egQjQ9VUWmpWihnmvXxD7A0JiaBMZ9b4iTMbk4
	tvGsY5THX2zd/YbeuI4dViG+gjcVSeTBftZAI+UJMAseqZ7zAiAGRBPPekjGPkQmz6oF
	XboomWR2FtX1Ko7fKh4+AqCEUKRC7UUU98OIyiemgQIsfQFCyKg0cqVpYDRRnx7IRiSh
	/acehTX08yIMdYnhN+9/zRln3pExR926Ts+r98eQ+cTTwKn6xJtQimf4OTkrD96q8LTA
	hhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lQt5pVMCUzGsSM2qvKfKeUJ5zvDnDWsRIMlNlidPyqw=;
	b=SCQ2rH+9qr/C6b7KUXn593hQODaNAjLjDU0KMXOCcaaVNyLol7Tkcb4J1Uo4GNdEEC
	iK4KIxZ4+idsHu1hz4JbZ2zy/o/mcz4jONJn/kXhUq6FbFs8iXA6pN6KWEYKdAFmDk/m
	HRxbloLS4o6vlwOkkqo00l6HnUZbFZF1MfqZPmGZSwUdAXkW+Jd9LsRRdC6dEkTscQCJ
	EtaiOVj51TeUXqd911dD1iRQiM6zIjEVxjenOT59HgUmsxDfpMGJ2/nK0/jzVjCk04Nj
	SYEYjrYD3A2qfGiaai8vEzsOagLeNoix3oRJ4iCxUIWh/e8c3JtSEOIMILc0uN0VuhSp
	q5TA==
X-Gm-Message-State: AHYfb5j7ssBSizMNnysG/SW8OKNvsY/w/WRNknbgkZvZCJyOh4Ac7rpy
	29fE8pwRQWc0BDhRusNwa2A769Hleg==
X-Received: by 10.129.74.7 with SMTP id x7mr2627395ywa.193.1502180328551; Tue,
	08 Aug 2017 01:18:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.229.130 with HTTP; Tue, 8 Aug 2017 01:18:47 -0700 (PDT)
In-Reply-To: <1502116754-18867-3-git-send-email-peter.maydell@linaro.org>
References: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
	<1502116754-18867-3-git-send-email-peter.maydell@linaro.org>
From: Hua Yanghao <huayanghao@gmail.com>
Date: Tue, 8 Aug 2017 10:18:47 +0200
Message-ID: <CAPTzt1DVmyLtvq6819Jmqm3p2AyXLV9F6rCRKCycBEYjQ1NYFg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::241
Subject: Re: [Qemu-devel] [PATCH 2/2] loader: Ignore zero-sized ELF segments
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LfXRfU3nTcPh

Tested-by: Hua Yanghao <huayanghao@gmail.com>

On Mon, Aug 7, 2017 at 4:39 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Some ELF files have program headers that specify segments that
> are of zero size. Ignore them, rather than trying to create
> zero-length ROM blobs for them, because the zero-length blob
> can falsely trigger the overlapping-ROM-blobs check.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/elf_ops.h | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 2e526d3..d192e7e 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -451,14 +451,24 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>                  *pentry = ehdr.e_entry - ph->p_vaddr + ph->p_paddr;
>              }
>
> -            if (load_rom) {
> -                snprintf(label, sizeof(label), "phdr #%d: %s", i, name);
> -
> -                /* rom_add_elf_program() seize the ownership of 'data' */
> -                rom_add_elf_program(label, data, file_size, mem_size, addr, as);
> -            } else {
> -                cpu_physical_memory_write(addr, data, file_size);
> +            if (mem_size == 0) {
> +                /* Some ELF files really do have segments of zero size;
> +                 * just ignore them rather than trying to create empty
> +                 * ROM blobs, because the zero-length blob can falsely
> +                 * trigger the overlapping-ROM-blobs check.
> +                 */
>                  g_free(data);
> +            } else {
> +                if (load_rom) {
> +                    snprintf(label, sizeof(label), "phdr #%d: %s", i, name);
> +
> +                    /* rom_add_elf_program() seize the ownership of 'data' */
> +                    rom_add_elf_program(label, data, file_size, mem_size,
> +                                        addr, as);
> +                } else {
> +                    cpu_physical_memory_write(addr, data, file_size);
> +                    g_free(data);
> +                }
>              }
>
>              total_size += mem_size;
> --
> 2.7.4
>
