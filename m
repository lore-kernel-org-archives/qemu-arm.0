Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4787342lfm;
        Tue, 21 Apr 2020 00:50:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypKgWK2bM19LT4PAkD19rj1ab65JFEQLImvx02T1fZvm/2q85wEi0ZziR9v5m5WlVozQyK0v
X-Received: by 2002:a37:4c4d:: with SMTP id z74mr19929207qka.53.1587455423962;
        Tue, 21 Apr 2020 00:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587455423; cv=none;
        d=google.com; s=arc-20160816;
        b=VK3ln/qJWg6Z1+wtcGVmGIfZmZaAfUtm68MiMgyAIxtB0Ro7guB8BWRUZ538NX2voC
         +ahIlLQ84q+j30S8UYvUtfP81qFWYyVz5skxVC+rUXxNp8BW2LZMLyvSF/c0X2vZagnt
         HSUBm4G8eZqTkGikUkKMnlM9rEUkMrTUTOf1cET9IExE6XsxL2Vpx7Yz7sF6N+HJh5NL
         4aOYLV2IOpqD1rSNlYzu18T17tFVvIf+mysMsY/MLpQlZKmxFgu1ifzyJeOnNxU6V7av
         yLmVH19YK+E24swIvoSpcXurRw/FMP3VUKUAHppSuyWmOPvnt8MSnWT1pySw76cYRTC1
         R5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=DmgR/ol4cIUTE4zV76diVDEM3DGOAl/uYRTRw2Si0hk=;
        b=tor1lXiO+HrN1Vkg6pSkMqEhHOJJu99kHB4mCDj6cWnlJxGcVmJoS3qKoF63kpNNJi
         eQHJOQVzlQTeUhAvjLJkzquIoIVh/cUdKezNceVjEwlDndTuJIonfhZ9LqdT5lkdSjgN
         zAW3F21ELcw3UPD1rlziw/iByb5MUgNeRltwUDsp+kg0r15Q7xnOVwN/qUTIwBPMMjl7
         c2Do8Xb0RQUMq+s/rV3P5qbtMsJanleW/RLdZRaUZDcxrs8SgQgSUvyaQZqaNgIN/QjY
         aHBjswL1PNeMLsXXkiXW8uN4Mg2biiK3/uzmX86xMcSfK7W65Vz8kXhWoGIQtDnaPjPi
         ZlRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UFMsj5Gh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si346105qtn.26.2020.04.21.00.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 00:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UFMsj5Gh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQnfj-0008J4-CW
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 03:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jQndz-0005xM-ML
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 03:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jQndz-0004Lx-7B
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 03:48:35 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:46905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jQndy-0004Le-Pu; Tue, 21 Apr 2020 03:48:34 -0400
Received: by mail-lf1-x144.google.com with SMTP id g10so9858134lfj.13;
 Tue, 21 Apr 2020 00:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DmgR/ol4cIUTE4zV76diVDEM3DGOAl/uYRTRw2Si0hk=;
 b=UFMsj5Gh9sRbXMsNUjoDhou8LVqXb2XE8LDOD1duMv349zPhf15th287k+Ooyoyhdj
 TjUWtFiDfTvgCzKsMaNHabEzQH/6b10cb1mJbW1r9rNp0/kEjgypF/DEcR5rPhpT6pXm
 xGG2E5bGkMgBVa7J9+8FwePXFc+Sx9Sxm/BGktJbo8IU2LMhDuJEpBzMRW6MiYgcO6cP
 agjvJhHCdyYGEdl5tbPNCmmBCtX+yvCk4PRtlljv21RQpJp1WcT15IBUNhFGiuhBNwO1
 uoSYKQtOkQYDH2OsPW4pWla02lvuhgbcYQOREYSH5XsPLREOfDwEaTy0HlL4sIDWhdC+
 Bqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DmgR/ol4cIUTE4zV76diVDEM3DGOAl/uYRTRw2Si0hk=;
 b=gLh1GaywF+YxpLjTiDqA9twr4Mt+NMryo+JCRNXPWW5QOTlO5pxEu2AxNqb4PjjkRa
 PXLudirnygNrMLgc9If7rkLQ9Ah97X4NZKl4UB2BepNsobr4IeCTTq+bkSOyqcKg6PI0
 by8z/yvlnPnr6E9zGjuWTvhDy+22RxfnmWP9ZN8RJF3xG1oN1m8IPF2Vyi1897+cJplp
 2XPKIIHcnvl/dx883WT47i2Cjni6M6pOnA1Run6CRSSGkho6kKhJIkeiSbg0HTBKVFHR
 X6LrQAIAs61we3RD57tlm+4s/ARKqbzggjXU50gEAGzz5HxxQZV6RA0hxOxam6n1qz+r
 mR5w==
X-Gm-Message-State: AGi0PuZTn/+v1/36euX7LD2nYTA14GxnjgXtoUJ0keGUC3cfvtg0MhjC
 CUyHggw+aOTvA98E5YuJW8Y=
X-Received: by 2002:ac2:5109:: with SMTP id q9mr12830354lfb.145.1587455311611; 
 Tue, 21 Apr 2020 00:48:31 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v17sm1439225lfe.34.2020.04.21.00.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 00:48:31 -0700 (PDT)
Date: Tue, 21 Apr 2020 09:49:41 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/4] linux-user/arm: Remove bogus SVC 0xf0002 handling
Message-ID: <20200421074941.GG2669@toto>
References: <20200420212206.12776-1-peter.maydell@linaro.org>
 <20200420212206.12776-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420212206.12776-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::144
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: omerg681@gmail.com, qemu-arm@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L3AljEULUabe

On Mon, Apr 20, 2020 at 10:22:04PM +0100, Peter Maydell wrote:
> We incorrectly treat SVC 0xf0002 as a cacheflush request (which is a
> NOP for QEMU).  This is the wrong syscall number, because in the
> svc-immediate OABI syscall numbers are all offset by the
> ARM_SYSCALL_BASE value and so the correct insn is SVC 0x9f0002.
> (This is handled further down in the code with the other Arm-specific
> syscalls like NR_breakpoint.)
> 
> When this code was initially added in commit 6f1f31c069b20611 in
> 2004, ARM_NR_cacheflush was defined as (ARM_SYSCALL_BASE + 0xf0000 + 2)
> so the value in the comparison took account of the extra 0x900000
> offset. In commit fbb4a2e371f2fa7 in 2008, the ARM_SYSCALL_BASE
> was removed from the definition of ARM_NR_cacheflush and handling
> for this group of syscalls was added below the point where we subtract
> ARM_SYSCALL_BASE from the SVC immediate value. However that commit
> forgot to remove the now-obsolete earlier handling code.
> 
> Remove the spurious ARM_NR_cacheflush condition.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 82d0dd3c312..025887d6b86 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -308,9 +308,7 @@ void cpu_loop(CPUARMState *env)
>                      n = insn & 0xffffff;
>                  }
>  
> -                if (n == ARM_NR_cacheflush) {
> -                    /* nop */
> -                } else if (n == 0 || n >= ARM_SYSCALL_BASE || env->thumb) {
> +                if (n == 0 || n >= ARM_SYSCALL_BASE || env->thumb) {
>                      /* linux syscall */
>                      if (env->thumb || n == 0) {
>                          n = env->regs[7];
> -- 
> 2.20.1
> 
> 
