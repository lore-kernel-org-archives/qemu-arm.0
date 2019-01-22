Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7656515wrt;
        Tue, 22 Jan 2019 12:32:09 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4d4ipvb0J1LHS7Q5k+krYGF2VIrai0ptTIbHCvNMGYe9l89uRpknigYaJxVlW8HT5OVgMr
X-Received: by 2002:a7b:c399:: with SMTP id s25mr16398wmj.90.1548189129358;
        Tue, 22 Jan 2019 12:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548189129; cv=none;
        d=google.com; s=arc-20160816;
        b=MTtgH1rcrB3jnI76e3Ed9/fLiNbUtF/bT0MOQDM+A8Yx5diVCC0OTzrQlnaMdOZpbz
         BWJQwCo2eVLcwGYKb6QAFGZT+4t/VHWxuPJliIt7XhDbTEKBB/wQbdr6aoVK6UsbSBUt
         Rjq6J1kbWBMcTwJ2tsZpuDKIhAuqdxF7MOrntF9q1aleMov1KWIvaeOZiQlcT+jfh2aQ
         +uDUvKodEsBGSCmWkmo+x2kIgoQ/0quZFEpApAgDi3KusKlT6DVU7oKOveoXG3PPH4ap
         m8mtE60rHJHYuHuj3gol20Bo14GVUfdJW8BfmR7FsWNFfPl9yjNHzRzvUI7HWy7sQrMh
         xa+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=derxNwREXJVLhpcgzBtLo+y8ip9/PXJ50CLHTrkDOl4=;
        b=aU001GPKO46i6pSVdTmy+4n0PGXxmMbILB057w/9l5WeddNV3uWuRwNvXw1ykutHps
         bfyQVBqBDgtINpc9pL5WKtC1cciEaoU+ynxUxpC/fX8IdTcaYCiv8nigDZsdC+Zxq5z4
         WQQSzCVYPyOA9ERUfB2Z+MaXiy1sNzLfZdkX9zWnsrq0ULrCuZokCIV7WSVsNv2rNJW0
         l/xd6hmY0xtWKhiMJW12lf9C/EwqTKWDc6jStApPbYUARX/GcWFmkZhNd19Rc5IjftSV
         06HYFJnQwOEzAGrXe4RPpjdqzwE0Ytlkyh/jvoaJ1MEwBm7SCQpnFo89AMWArNIF1cVa
         qVPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MAzeFL2u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si66652990wrj.427.2019.01.22.12.32.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 12:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MAzeFL2u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gm2iO-0002XF-Cr
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 15:32:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gm1nG-0007pp-OM
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 14:33:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gm1l7-0004Yb-45
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 14:30:54 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gm1l3-0004Rz-6m
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 14:30:52 -0500
Received: by mail-ot1-x343.google.com with SMTP id e12so24738916otl.5
	for <qemu-devel@nongnu.org>; Tue, 22 Jan 2019 11:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=derxNwREXJVLhpcgzBtLo+y8ip9/PXJ50CLHTrkDOl4=;
	b=MAzeFL2uDjIL0M4y6EKy/kavX8/An3OfrfBlSxZB7lOP/CVU/2ET+CXgLIKQuWjirS
	tmGdI5G0l3J5QNPLda5M5zwhC1zfUNOlN5Fxilh6fN+Z21bZgQxPOzi+AlbeZwLf3vQb
	ajI+x3i6dwbQTQn7yudFfxQF2K2mdSQ/Vt4Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=derxNwREXJVLhpcgzBtLo+y8ip9/PXJ50CLHTrkDOl4=;
	b=FoHYaW5goWKAj1DVUd5bWytliNIJeUvfIHr5eb4Ktj6wh9forvYYGki2PxSOlnBMu3
	mogvlC6uRaeE3YcmSDwWTbtnu3Gy1E5m8mKw8QazbjlSz37qoPTSgbqVr5sk73GzCo5p
	8YU5DVWCfZlcn+5xZ7hQ+LtYDr2MMtvVWvD0FEZ+9sKgre5mOJ434n2UGInNTNucPUbB
	7ngFgDuR5/xZSOjzKSusF7ZpH7jeAznuD6dYX7Hnpmo4YQAfvG6YBFy5EaU7KI3DH+h3
	qbiom8/xSwIGxCZ9Yc8hy7uV47AV2jdUh1TbOGMb6A/bxFNhHxkxIB2GsfdTyzBTWGwe
	//2A==
X-Gm-Message-State: AJcUukegCdO/fSCHal3VtqwouDMOZ8hPzyZr31Jt3mTm1XBRIE8MQ9Nk
	GCT6uS9b9dMfVChPKEy9TIvhJKiX7RTGJexK0RAjXg==
X-Received: by 2002:a9d:4b0f:: with SMTP id q15mr8673342otf.201.1548175008566; 
	Tue, 22 Jan 2019 08:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20190120143452.21683-1-stefanha@redhat.com>
	<20190120143452.21683-2-stefanha@redhat.com>
In-Reply-To: <20190120143452.21683-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jan 2019 16:36:36 +0000
Message-ID: <CAFEAcA9KkYC7MHquASjoghuDrvkkE_brnM6teLknj1H-waM_0A@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 1/4] memory: add
 memory_region_flush_rom_device()
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JM7U7i4j1GsS

On Sun, 20 Jan 2019 at 14:35, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> ROM devices go via MemoryRegionOps->write() callbacks for write
> operations and do not dirty/invalidate that memory.  Device emulation
> must be able to mark memory ranges that have been modified internally
> (e.g. using memory_region_get_ram_ptr()).
>
> Introduce the memory_region_flush_rom_device() API for this purpose.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/exec/memory.h | 18 ++++++++++++++++++
>  exec.c                | 12 ++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index cd2f209b64..abe9cc79c0 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1344,6 +1344,24 @@ bool memory_region_snapshot_get_dirty(MemoryRegion *mr,
>  void memory_region_reset_dirty(MemoryRegion *mr, hwaddr addr,
>                                 hwaddr size, unsigned client);
>
> +/**
> + * memory_region_flush_rom_device: Mark a range of pages dirty and invalidate
> + *                                 TBs (for self-modifying code).
> + *
> + * The MemoryRegionOps->write() callback of a ROM device must use this function
> + * to mark byte ranges that have been modified internally, such as by directly
> + * accessing the memory returned by memory_region_get_ram_ptr().
> + *
> + * This function marks the range dirty and invalidates TBs so that TCG can
> + * detect self-modifying code.
> + *
> + * @mr: the region being flushed.
> + * @addr: the start, relative to the start of the region, of the range being
> + *        flushed.
> + * @size: the size, in bytes, of the range being flushed.
> + */
> +void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwaddr size);
> +
>  /**
>   * memory_region_set_readonly: Turn a memory region read-only (or read-write)
>   *
> diff --git a/exec.c b/exec.c
> index 895449f926..105ff21e74 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -3162,6 +3162,18 @@ static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
>      cpu_physical_memory_set_dirty_range(addr, length, dirty_log_mask);
>  }
>
> +void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwaddr size)
> +{
> +    /* In principle this function would work on other memory region types too,
> +     * but the ROM device use case is the only one where this operation is
> +     * necessary.  Other memory regions should use the
> +     * address_space_read/write() APIs.
> +     */
> +    assert(memory_region_is_romd(mr));
> +
> +    invalidate_and_set_dirty(mr, addr, size);
> +}
> +
>  static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
>  {
>      unsigned access_size_max = mr->ops->valid.max_access_size;

API and implementation make sense to me, but better that Paolo reviews
this I think. I guess we should add calls to this to the pflash device
models too...

thanks
-- PMM
