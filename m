Received: by 10.25.221.202 with SMTP id w71csp1323205lfi;
        Fri, 11 Aug 2017 12:59:59 -0700 (PDT)
X-Received: by 10.55.185.2 with SMTP id j2mr22383818qkf.158.1502481599122;
        Fri, 11 Aug 2017 12:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502481599; cv=none;
        d=google.com; s=arc-20160816;
        b=VFuv8NWdRybYuKK+Bub76OC+M0IKNe3u0WhXHYUR6iECusLItMbUvriI9Qu3aEejZV
         vTlnBlH7+glGzIvRDp/+6k9zWu9mIQDVDyjSm4QXqX7O32+FeGTRXLlgz8R4n4dDOK0N
         G4FA/kC86IcnTuFSfOcQ21zHC6mJSMa8uq/twNZS9XvdO7OdTKNZdVsFF3LHZvaFJ6Wk
         x1jSgdV50TVWTd7DHMsw+znAcBk1eIXW6Jt/5u5Aynx474TWH1q4wue7r0n8nv9cbCKn
         8OIhi9S60KG272G6iXlMvzIuMnRDCm/GMTuQ0qS9YxhfGGNqpa4HKql2BrtKxXn+Ls0C
         CuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=On6t3Kng1PIIRgcpqVi3bPboeiDdxt4pKj+VE5Qe7ug=;
        b=D0D+OlS0LKECemiuiE7ZvPPMbfK23huKxJvH//bZ2Cbu1TdPdHGtpuIX4r/YGeh4fn
         rByQjDHE9/3DspiBE7z+EY80l9QwUl55KUDWEzlFE3fYorZPl829aDIjvkWX6vdJ15lY
         GH50gwAMpNw5dl8PZwWsOTgyZlSko/aVwfhVYpm2jHE+uPu43kFQ0yn+W4/5T9odg0Ow
         SvJVeB9jvbNe4Dbng0fj50V2mxi7ghGD+OcZI9u8H9Cv4OW1AeLKbQgCOzgBagyeusIm
         27kbYwq9Ol3fPFeHHPDR0VMm6gvQx3O2WpiYZadUKHBYBU7mAMOh6alsTD3nlU/ghGTD
         gC/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EDU0aMqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5si1431246qtf.39.2017.08.11.12.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 12:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EDU0aMqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgG68-0002cb-J1
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 15:59:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgG63-0002Zf-HL
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 15:59:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgG60-0002Zm-Bx
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 15:59:51 -0400
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:34744)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgG60-0002ZH-4R
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 15:59:48 -0400
Received: by mail-pf0-x22c.google.com with SMTP id o86so19671181pfj.1
	for <qemu-arm@nongnu.org>; Fri, 11 Aug 2017 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=On6t3Kng1PIIRgcpqVi3bPboeiDdxt4pKj+VE5Qe7ug=;
	b=EDU0aMqAKWZeEZxbIzhevc2IxMIj4jeuj4qda6PsLz/260SzKzAUlb5jktgB6+4Duv
	NU0lFpfawENdYCDl5PkSAsxIwAXc5UBazo0jXuqRqNrW+3DC9pD/eWaZo7IVhekYemxh
	5dxBkL2+LCOP7PhCB+6EAXW1GmgyYlQNXIT/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=On6t3Kng1PIIRgcpqVi3bPboeiDdxt4pKj+VE5Qe7ug=;
	b=Yetos7Fi041GsS9zJqK+jSiPcX1ODDtc5URWVd81kwi2K02KVTKds4vmo6Y3v2Im7t
	YiHGr0Ic0o8r4QI115hRFqzKG9VudAckVrBDBk9zMv6/w1JeDqSO1wS+kqkp6+8auhPW
	8dM+LPX9gg+SXIOgJapV/Yjcqvy0KW6QusM8gtvW0fK6r52iD8ZEYIQ+0H3sbv46gkXD
	8trn7dtmsZFijhnuKuMUrdJiIXIJBJsGM6v1S3eGMFX7rO+LA2779grwpWfcQC4tYKjg
	hcBqtStoTUesGe2IgeAteOu66NDRP8j7lxCsgX1rF/kXucXDqQ51+6qQixuOBnANSgKr
	aJOw==
X-Gm-Message-State: AHYfb5igWHL+izHb+/5v0t5g9AO3k5skW/wjf5UH28xbLYq5Bd4zqPeD
	H7rSaLGduJwRF6vE
X-Received: by 10.98.193.5 with SMTP id i5mr17463121pfg.317.1502481586996;
	Fri, 11 Aug 2017 12:59:46 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id r82sm4552909pfe.0.2017.08.11.12.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 12:59:46 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	peter.maydell@linaro.org
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<20b283f7eaf100783b291de3830dd226ec286b6a.1502474835.git.alistair.francis@xilinx.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <202d07a5-b1a5-cd37-2a31-de45dc0690da@linaro.org>
Date: Fri, 11 Aug 2017 12:59:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20b283f7eaf100783b291de3830dd226ec286b6a.1502474835.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v1 1/3] target/arm: Update the
 memops for exclusive load
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JQfn8LFCrfTY

On 08/11/2017 11:19 AM, Alistair Francis wrote:
> Acording to the ARM ARM exclusive loads require the same allignment as
> exclusive stores. Let's update the memops used for the load to match
> that of the store. This adds the alignment requirement to the memops.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> 
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
