Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2116767wrq;
        Thu, 7 Jun 2018 06:40:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLnm2WyZybjioud2d/9kcsd5RFnCka5x5PZHK3ueBnqoDae80o0DVg1es3OqlwdZjmXma9M
X-Received: by 2002:a0c:cc91:: with SMTP id f17-v6mr1637485qvl.239.1528378820219;
        Thu, 07 Jun 2018 06:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528378820; cv=none;
        d=google.com; s=arc-20160816;
        b=a7VfxA8+rzp7hLUzB9rjh996N1jkFFYZH9/Jcjlo6rVHoCpU9buX4DHaWyFZur8Hkr
         0o+3FKhGNp2A0nSjPkpev459qQYKjNSByhT129gxR4aVnx7LiFI9yfTypx2LQEalfOS2
         SYbwnmkF5RvDq+BhGjaQnlhQJtWtcEdEA24nBqaSRty8fOTeVbYVLQv3eUhoWNjdUEqC
         gZtBYZ0p/CdpZlR/eEiSvO7lMfSPGG3Pg05MsJryusibENwEZNt3kyFbhrOM436rzTcK
         YAeOs0SReiExLAhmrt4olBPZll6AX5SiOlBVogZqF+1yHLvjM9VBQBWqor4a/9CLUKyx
         8lmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1vrhyT8HF44cLZdJwR7N9x8zVeEaOpAcxXNO5utbPcg=;
        b=fMspbD+EpWrABYRLb24PguPJ3Y7ax4pPkwAQvjs/P5gocczH5hmHhtMIK5d7o91nWq
         DG8ll+50t40Y8d+jlKZGh1IdmdIaGci1h+3KWpX1P6SoU6kbmkWKbou0fy//UmST6qEt
         A71S3+gLMwgMVljt1Kb1jgJVmsNgkWwSZb/4a08sASY5l5Da5Xe1YNvk7xB1JVwtrCW4
         ZXiu5Wh9+c8Dmlyn5Z5gGorEv0RzMG5AhwqjknGsbqYR6qEL+0bXpN+rlUorMkMAmJPe
         5HWrZKiZ4yhBc5qj5w/6jnlYwatNGbxs9APTWzUGb6iWpuULHweFrbaM5U1YGLcJYptH
         v8ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6/6LFJv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64-v6si1013297qkf.210.2018.06.07.06.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 06:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6/6LFJv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQv9H-0007Zk-Pf
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 09:40:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQv8y-0007Wm-88
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 09:40:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQv8x-0006BZ-G3
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 09:40:00 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQv8x-0006BA-AF
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 09:39:59 -0400
Received: by mail-ot0-x244.google.com with SMTP id h6-v6so11572927otj.0
	for <qemu-devel@nongnu.org>; Thu, 07 Jun 2018 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1vrhyT8HF44cLZdJwR7N9x8zVeEaOpAcxXNO5utbPcg=;
	b=R6/6LFJvSW+qhd89nJJIIxNThvzQTfdVX1KeQ5VHMgXN6tpLKPor4et4o8BycGzbnh
	p5ULgz7165HnyDFitR54kHuDeAy/wpkNDNgbJdalFrWntQUTE5nJLiRQ9yFlEDhc2xMc
	PfJLh3+yFQprNBET6K5tgE37s00b9tpWJ5qZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1vrhyT8HF44cLZdJwR7N9x8zVeEaOpAcxXNO5utbPcg=;
	b=pMRds9pY841JqQ4MWly1xluy46Chj9fHBtila4ai2MeC9D9yKMU7T4i9KByYvh9xkd
	/7CmL+LHmtvF2zv/0zcM7GhHeU7ODogdi5cUK8LZhSFRfuRKNW6Xzfa0B+pQkJUQQ+UD
	gs0HPart2N+7uxqVA6gY+HCkuLS/JWHxOgZxMAeZiB6p4uh/eDTYB9ubpi+xhX1QZmIy
	Arsb9tSTc6cskONqvgOKwdzSYvn1aPzLYYxMDr2f5XuvFyPzE6gYCJOIZGRripjDkxpG
	u3l+LQ8tQSGBoGoYMGrubQwK84LUPMXxkpSlDHGpDBBPHF9ou0KtBSJZgdegDJFE+8bc
	CCxQ==
X-Gm-Message-State: APt69E2uvC1WWwqwRpz16sUWcqw4Lvb16S5n8M+x8pUCPpmaj7D9i/HQ
	xiwT3I36hHGKa3rp2bx8SZfPDFeqqn2+Kzd/0+/oVw==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr1120519otd.316.1528378798544; 
	Thu, 07 Jun 2018 06:39:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 06:39:38 -0700 (PDT)
In-Reply-To: <1528378684-14487-1-git-send-email-hejianet@gmail.com>
References: <1528378684-14487-1-git-send-email-hejianet@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 14:39:38 +0100
Message-ID: <CAFEAcA__8bZEku0vUAVQzheb8kjgZeRbKw_TXy6bY9RnKi+U9A@mail.gmail.com>
To: Jia He <hejianet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH] hw/arm/smmuv3: fix smmu emulation when
 guest smmu is in passthrough mode
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
Cc: jia.he@hxt-semitech.com, Eric Auger <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G8xc8/i1cYg/

On 7 June 2018 at 14:38, Jia He <hejianet@gmail.com> wrote:
> There is an exception when I passes iommu.passthrough=1 to guest's
> kernel boot parameter(host QDF2400 kernel 4.17, guest kernel 4.14).
> The guest will be hang when booting up.
>
> When guest smmu is in passthrough mode, entry.perm will not be assigned
> to flag in smmuv3_translate. It seems not be correct.
>
> After this patch, I have tested in 4 cases and all passed.
> host smmu on/passthrough + guest smmu on/passthrough
>
> Signed-off-by: jia.he@hxt-semitech.com
> ---
>  hw/arm/smmuv3.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 42dc521..5c46102 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -560,6 +560,12 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      }
>
>      ret = smmuv3_decode_config(mr, &cfg, &event);
> +
> +    if (cfg.bypassed) {
> +        ret = 0;
> +        goto out;
> +    }
> +
>      if (ret) {
>          goto out;
>      }
> --
> 1.8.3.1
>

Ccing Eric as the author of the smmuv3 code.

thanks
-- PMM
