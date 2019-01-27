Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2519445wrt;
        Sun, 27 Jan 2019 10:49:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZAwdYvHik4V7yDHnfR8tAiQ7ZqhdVrg6Rz7yRk5VjeyKXLX1AKiau2mXzO05N6O97BzJGL
X-Received: by 2002:adf:f401:: with SMTP id g1mr13632047wro.103.1548614990966;
        Sun, 27 Jan 2019 10:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548614990; cv=none;
        d=google.com; s=arc-20160816;
        b=L8xSnbewrX1vCcnjQUAziakj7M7Truylq76rRZMGnjxRp3F85XVKpSxeMl0nYzRcFk
         2lNadrp94mznj1jGoriIR7k5EaF+xiDgvxp4Eaug4opVrl3qxgAZnpuCh6sHF8vJ5Hgw
         X8CwT9wBn1wGip+VKmMFLDsJ42Ugopp8a5mOtEHS6vI2etzre+xAekkBIF6k5SiK2MHj
         5rG5ho51G3E5eBjy/MRB0Dqa2Knu4sMA0vPYAxMRcAw5YVSHykGEI7d4loALULIUx3AM
         MOU3qln2/iE1zw1rJP9dLkwpeCVeg7p9ZREOg5ftGZM54r3wqDRwKlsNnRB1p6KuiEhH
         FENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=D1cG8X4P6QMBJ4ZZS2ZWHXE99VR0kSJlIjw5WtAx748=;
        b=OkCQgfx47ksf2KaU2dx9KNwYwKOLArblKOyZj5Ksky5O+dM11RtpQIKeVlqxVDVzih
         VUDrYnOZkk8bsD4AxKH+l8+67Q+QK5I7uWLe1SQ4T6MDD0bnmv2w1eo5VVARqgQwSeDQ
         jhXHzFzsgs4H4QckSkZnSOSiTCHI6OuhcsYXqozR3dWBOlowpQWfdWBJat/nSB0fG820
         +oujfdFYiz1naT6ZbVjXMdgE0B6gIfQsYNpIN0aFeAY3sWQMU6TfKwO+K5iyp4tjHZbQ
         T2tM1Rj0aG2QTc+xMTPVIllkKq7/JPgJr31sLtu/J/NUSglwNnPiEjqOCsMKDF0AnlAg
         qsmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e3Z1OcWf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u133si49038145wmb.182.2019.01.27.10.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Jan 2019 10:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e3Z1OcWf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnpV8-0001SC-2m
	for alex.bennee@linaro.org; Sun, 27 Jan 2019 13:49:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnpTC-0008Vo-Tj
	for qemu-devel@nongnu.org; Sun, 27 Jan 2019 13:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnpTC-0006Py-2R
	for qemu-devel@nongnu.org; Sun, 27 Jan 2019 13:47:50 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnpTB-0006Pi-Rs
	for qemu-devel@nongnu.org; Sun, 27 Jan 2019 13:47:49 -0500
Received: by mail-pf1-x431.google.com with SMTP id b85so6990210pfc.3
	for <qemu-devel@nongnu.org>; Sun, 27 Jan 2019 10:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=D1cG8X4P6QMBJ4ZZS2ZWHXE99VR0kSJlIjw5WtAx748=;
	b=e3Z1OcWff+Spx2WQJYkxWnsgQpOeeNLclYMCbv47p8QEaCsp0PK3ePxzpjSdEP5Y1T
	FHbakBC4yEC9UOq+ejYxRunqS8KG0oapHpVaV2ZWsMvHe1+L3/A+JbNuVej+tRoSAMwE
	/g7bjgX2fc+WkoNG7iZ2pdei1VrcfCVfsNbDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=D1cG8X4P6QMBJ4ZZS2ZWHXE99VR0kSJlIjw5WtAx748=;
	b=nxnyel9AGySnSYZaTpAMFvETGwK/bauZuulzIhiKEUoL/3y/JUBm6IT4RiqENq5TQd
	hp4UwKWhlA5meEz4p3Gfgt8SmpKjPo4ZhdQJnuOO3cgghXT1WbAs71YJrZ4OargKaX1r
	diE28SXauTgXcvalw62dEp6/PLGJ7bv/fc/4k1mKSG+xCIr2OMjJJTG+TjMlEXc/G+sy
	2Kt6fFyd9TXgWgCYotnCMDmUBHLDyZV1aXbt2ZYOCyyWx597mB6gnqNDzCEe7bNNutuC
	1r1Im3gdRhhl5QBuP8y5fsUaKuzS5egLdvYgv8r/u0o18HpPrniyNnP8eIEVb7JgT2VO
	YnsA==
X-Gm-Message-State: AJcUukdAC7bArfoJYEzLhzUk7yeJkEK2XZaXUKR0EpXcw/Ix+YU0JFOE
	3rw22dY+XKXt4OJKz8XP95GuF0JgWks=
X-Received: by 2002:a63:be4d:: with SMTP id g13mr17340563pgo.378.1548614868327;
	Sun, 27 Jan 2019 10:47:48 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	v14sm35787439pgf.3.2019.01.27.10.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 10:47:47 -0800 (PST)
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<20190126065211.3587-1-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <670acf7b-d0ce-63a0-a4e4-94b95cbab099@linaro.org>
Date: Sun, 27 Jan 2019 10:47:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190126065211.3587-1-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::431
Subject: Re: [Qemu-devel] [PATCHv2 1/3] target/arm: fix AArch64 virtual
 address space size
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XgDqoTIwLxAs

On 1/25/19 10:52 PM, Rémi Denis-Courmont wrote:
> From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Since QEMU does not support the ARMv8.2-LVA, Large Virtual Address,
> extension (yet), the VA address space is 48-bits plus a sign bit. User
> mode can only handle the positive half of the address space, so that
> makes a limit of 48 bits.
> 
> (With LVA, it would be 53 and 52 bits respectively.)
> 
> The incorrectly large address space conflicts with PAuth instructions,
> which bits 48-54 and 56-63 for the pointer authentication code. This
> also conflicts with (as yet unsupported by QEMU) data tagging and with
> the ARMv8.5-MTE extension.
> 
> Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
