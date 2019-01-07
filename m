Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3530914wrt;
        Mon, 7 Jan 2019 06:54:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN78bTNcERJVxHsl3J+zgCbpFKuxR8dy9v4nljbCqcT+eedHZYbJHMx9WVf96b5M5PTFw+ZE
X-Received: by 2002:a1c:c58d:: with SMTP id v135mr9488400wmf.88.1546872880089;
        Mon, 07 Jan 2019 06:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546872880; cv=none;
        d=google.com; s=arc-20160816;
        b=GYjhEEiwtoK0zTnVaZySIoTedYSpbx8DsviOFhpAqVJNtQ4XGMzXSqUb3LU9t0NSXs
         em3X8f7Fn+f9+jSsfYWSDBMDsextJnZYgkW/a7W6e0H9NHNL1XIPR7UvzU3QphC4ZhDY
         YN7tD2sDQ6yynr+3KOwGf5qzQPcKJIuEHMV0rwus4NJdsOK5e4rnb0QbtAnycMpx7fex
         gxVuFHgj4gsbgSZDJXCtQ6cZjfWKIjZ2h1l7F2tymzBZg4mDOjRw1EI9P/FVM46xTb6e
         +hkqEk+XmgK/baBiGjFohqk2FI3eygVIgBgoQPyMkzYs0DAmrXQAkh4JF/qQgniibR8F
         0+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=aslO0jxEfo78ap1O6obsWtSnfPJBkFzGV8VVmb9rk8s=;
        b=cMJv/p1r52Ojh1Ixe2FSyoHGSWv9ygud1YrFHUcwTWTlHDLwgXA2PX01I8HnzEjgbv
         kfF258MJu/Uudz009qQrG/+dsQVk3p7a6AGqjUByGivKLwCE5qNn/TotuYxPssvuTcji
         CSKEi/yDZTQTMoaBT+Z+wcVDK3ZUmJ9ygfBsgK1ypRPBz0x1/h9Oz1Kkza++CJ9vA8J3
         4isygENk3X7BICr+Nwl3XlHwlTPr6rrYwUqqvcFmUFlARf6uO7yhMwh1m7VSYzqkjHDB
         PZ9HfbMnsoozd8Y5+vXuscpqDoenMcKMuQnhuOQQiBU9Y8XDVuPxOuu43P18LYt2GGSN
         YPsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Aw+JleoV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si4557873wmy.162.2019.01.07.06.54.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 06:54:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Aw+JleoV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggWIZ-0004HP-71
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 09:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggWGu-0003Wo-UJ
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 09:52:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggWGs-00005v-Tq
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 09:52:56 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36704)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggWGq-0008L7-Vn
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 09:52:54 -0500
Received: by mail-ot1-x341.google.com with SMTP id k98so529804otk.3
	for <qemu-devel@nongnu.org>; Mon, 07 Jan 2019 06:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aslO0jxEfo78ap1O6obsWtSnfPJBkFzGV8VVmb9rk8s=;
	b=Aw+JleoVZnZCtfgPnC3/yX8c83ir3bez8IUqxMNP/cX3EDL9eSr4aEUyxXlNf+i5cc
	Jjdhgs1lKVxcowm8ItfL0BmYPXEnmeRErJtd5/bzoMjgRtjhdsb0MNGQjcFqjJlbws1d
	xwgqMrSPVcmcadRMyqLgrcxRtylqeM1az7XcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aslO0jxEfo78ap1O6obsWtSnfPJBkFzGV8VVmb9rk8s=;
	b=F9Nk93vf+0ZU39NJJF/zy0Bz/BqZDJR7HBWxw/7EGQeVtKdIAtkeA/JdlzP1BWgMdL
	6OUZTaKQUVqa3rnHbjl2KTqjncUtwy0QhPrpSTFUmKiYaMuI7Q96ByxOJBEPpXzLOydG
	LVikAoHwveiflTs1OlIJP98pTrY1aQfiuflXIsQHsA2hmLvf4yDm3YqQ35seQq6g36Aw
	M/zeRSW33IxshKM/FfgMnGzAl9REn2MpeHzy6NzOLzRKXAAIwgkv8G18aWwIKwyGG94t
	3G6Z9rL96SGRlIo7PBakzh+onqPc2DX7y50HCDemO6TrLXotj9woRFL0NHKq83bn3jqZ
	Atnw==
X-Gm-Message-State: AJcUukdjpmFM29HlfYLuHM7yZMSZcRxW1e+TwJdYGi27ulvfjFIjeMH7
	B7CfQeJ988/Q/IrDM4EeRuzRXih0MHKUm2ctOj+EiQ==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr41503811otq.316.1546872765807; 
	Mon, 07 Jan 2019 06:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20190104142921.878-1-f4bug@amsat.org>
In-Reply-To: <20190104142921.878-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jan 2019 14:52:34 +0000
Message-ID: <CAFEAcA9ex7D5VQNEv+Nc2F_baFATjVZA4sJjL-S2BuPGQFD1=Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v2] hw/arm/allwinner-a10: Add the 'A' SRAM
 and the SRAM controller
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	Charlie Smurthwaite <charlie@atech.media>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W3CCbbBDrnAf

On Fri, 4 Jan 2019 at 14:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> From the "A10 User Manual V1.20" p.29: "3.2. Memory Mapping" and:
>
>  7. System Control
>   7.1. Overview
>
>   A10 embeds a high-speed SRAM which has been split into five segments.
>   See detailed memory mapping in following table:
>
>   Area          Address        Size (Bytes)
>    A1    0x00000000-0x00003FFF 16K
>    A2    0x00004000-0x00007FFF 16K
>    A3    0x00008000-0x0000B3FF 13K
>    A4    0x0000B400-0x0000BFFF  3K
>
> Since for emulation purpose we don't need the segmentations, we simply de=
fine
> the 'A' area as a single 48KB SRAM.
>
> We don't implement the following others areas:
> - 'B': 'Secure RAM' (64K),
> - 'C': Debug/ISP SRAM
> - 'D': USB SRAM
>
> (qemu) info mtree
> address-space: memory
>   0000000000000000-ffffffffffffffff (prio 0, i/o): system
>     0000000000000000-000000000000bfff (prio 0, ram): sram A
>     0000000001c00000-0000000001c00fff (prio -1000, i/o): a10-sram-ctrl
>     0000000001c0b000-0000000001c0bfff (prio 0, i/o): aw_emac
>     0000000001c18000-0000000001c18fff (prio 0, i/o): ahci
>       0000000001c18080-0000000001c180ff (prio 0, i/o): allwinner-ahci
>     0000000001c20400-0000000001c207ff (prio 0, i/o): allwinner-a10-pic
>     0000000001c20c00-0000000001c20fff (prio 0, i/o): allwinner-A10-timer
>     0000000001c28000-0000000001c2801f (prio 0, i/o): serial
>     0000000040000000-0000000047ffffff (prio 0, ram): cubieboard.ram
>
> Reported-by: Charlie Smurthwaite <charlie@atech.media>
> Tested-by: Charlie Smurthwaite <charlie@atech.media>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: Set owner=3DSoC in memory_region_init_ram() to avoid leak
>     when SoC is destroyed (Peter Maydell)



Applied to target-arm.next, thanks.

-- PMM
