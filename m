Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4787208lfm;
        Tue, 21 Apr 2020 00:50:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypIHyCKRzblToWS18y+Irbn5g/ohEULMmfCp4eELho5N4YuLyeMe/BaSdO8PnAxeczQOPszP
X-Received: by 2002:a05:6214:15d1:: with SMTP id p17mr19385026qvz.45.1587455412638;
        Tue, 21 Apr 2020 00:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587455412; cv=none;
        d=google.com; s=arc-20160816;
        b=QqvXrsFh1gYJ+0sNr1KHloqFlfiNmAr4Mbn+OE1xlCDVydfaaxnkCrmMaIjZ8ZegGG
         pWjNZeaRc+VqY5RIXPUblEtU7wDvxH6ak0haVYiHdxt5UdXM8AS3KSIRxCq4e/8s5LLV
         0cpi+KXztq2SpuDmCUYj6Evuv5ECw4la6+ZjTLpcuRsc6TyzKyswyIzfnmWNn+cu4zqX
         TW2v2C9ONFl4wwioad2RymKN260TA3tVy1y758PaLeIy6bUxfC+hioWd0GIPKAC1ro4O
         6IvGOc30q0xVQrftfneqiDxW32OYTO9FA0W8ILrJ11Wbif+wI2GZw164jDcsNe8Xk3Cz
         tLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=xfhIKdHs7m1jDBOFfnAgfme0YalFSd3WwpqXIfEBcCI=;
        b=PokRrPptq3tcYYVoFcrqLHDSNPdoK0b0RSLKTxx8PGDLwWOhfBZRDDxhqkcxHM5xt6
         X5i9ksWddRRd1ff5McKX5D+eN7Das9sVOD20W+/M5+W0V9rgKsdxOGfh5uWQzPEzYMed
         o/uGOhJKvBMWVvwlYyby5vS5p38rIcP7LMpet4sCtYN0R+Y9OruFZLjiozGiJ+OvEIjA
         sJrQoAFX+aa+U+8EyePa0v56zRLi//fwC+FEBYfDWrwf39//xYU2/hhGPgusqnEogXXj
         zq8prvj0+giaVtFrS2RprwWgT9nKP0mOa8UyrS4QNCgBRZrXM2tQIaRebofcxZGeZ2/l
         wvxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TmtFLLSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r38si994305qte.152.2020.04.21.00.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 00:50:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TmtFLLSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQnfY-0007ys-1Y
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 03:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jQnck-0004aQ-Pj
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 03:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jQncj-0003DC-18
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 03:47:18 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:36791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jQnci-00039Q-Jt; Tue, 21 Apr 2020 03:47:16 -0400
Received: by mail-lf1-x143.google.com with SMTP id w145so10320166lff.3;
 Tue, 21 Apr 2020 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xfhIKdHs7m1jDBOFfnAgfme0YalFSd3WwpqXIfEBcCI=;
 b=TmtFLLSo5SWPYL7dDh2qYQSqtq4Z8KVaLrIAA1uewvBIDFBHW+RUJ3uIL8S7dgF5K/
 kU82DWFGXGy+AhNSMW5TIteeHxGvEJSX/3ov7bnI1O3TPlckFUeKJ/7RnfeXqa/wBG0t
 hjFnNwLR8Gd5dlQwOhLZBYYDBphCGO+ihiiczhKvMWxpLXlZAeSV2rgAV30wd9Sqg37T
 5AtOr6B0QGV+NIfoi9gPkkiu6k7P3iEUF+6NWpGlWxH6NqYyFYgbSAcBeSAhXf/kFK+F
 TnvsyGTdkXeaLKmdWmy84qhYkSkSFU9wN63C2CDlZiZtWjPhtAEwwCC9EpIgcLzRSFRb
 1bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xfhIKdHs7m1jDBOFfnAgfme0YalFSd3WwpqXIfEBcCI=;
 b=HPcN8MLpg/JfqFPTSRJVkgkPvkQgOhoXaxLiV0+r2xeSVoWqRjAv8psD5+TwklZcCC
 /L/3zotTH6e+Bl93F3bSoj+sX5AE4JGJoYfLDVEcYUliXhCVB20vsQzxntM5cfAEdaeC
 sYtY9mUe+xOq2r5RDE3K3+g9I/OmA1cbpphfXAwg3bbtmIA/C/8ImElZ52zNKnqvUu/2
 A+xiowBzlNkAJUZjFFlz7z7Y50dwn1xiaoLIdo8a1PLRsoB6hxL2oJfN0bdw4v4BOHRf
 3LfeZrfwT5JGgksptMHQhmbgBgvumPvFycfc5d8N4ElF02nNLeCOBvF8KqTH/Ln5ujAM
 A30w==
X-Gm-Message-State: AGi0PuaJTuG60H6oawtRMsTy0zPm1sra5EnrfPfgiGylUp2yNWMAXw9w
 txweGXLzOlAzCGvN6DqtoC4=
X-Received: by 2002:ac2:4187:: with SMTP id z7mr12941684lfh.113.1587455234510; 
 Tue, 21 Apr 2020 00:47:14 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id t8sm1475806lfe.31.2020.04.21.00.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 00:47:13 -0700 (PDT)
Date: Tue, 21 Apr 2020 09:48:24 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/4] linux-user/arm: BKPT should cause SIGTRAP, not be a
 syscall
Message-ID: <20200421074824.GF2669@toto>
References: <20200420212206.12776-1-peter.maydell@linaro.org>
 <20200420212206.12776-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420212206.12776-2-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::143
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
X-TUID: agiPK9/jAUR1

On Mon, Apr 20, 2020 at 10:22:03PM +0100, Peter Maydell wrote:
> In linux-user/arm/cpu-loop.c we incorrectly treat EXCP_BKPT similarly
> to EXCP_SWI, which means that if the guest executes a BKPT insn then
> QEMU will perform a syscall for it (which syscall depends on what
> value happens to be in r7...). The correct behaviour is that the
> guest process should take a SIGTRAP.
> 
> This code has been like this (more or less) since commit
> 06c949e62a098f in 2006 which added BKPT in the first place.  This is
> probably because at the time the same code path was used to handle
> both Linux syscalls and semihosting calls, and (on M profile) BKPT
> with a suitable magic number is used for semihosting calls.  But
> these days we've moved handling of semihosting out to an entirely
> different codepath, so we can fix this bug by simply removing this
> handling of EXCP_BKPT and instead making it deliver a SIGTRAP like
> EXCP_DEBUG (as we do already on aarch64).
> 
> Reported-by: <omerg681@gmail.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1873898
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  linux-user/arm/cpu_loop.c | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index cf618daa1ca..82d0dd3c312 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -295,32 +295,17 @@ void cpu_loop(CPUARMState *env)
>              }
>              break;
>          case EXCP_SWI:
> -        case EXCP_BKPT:
>              {
>                  env->eabi = 1;
>                  /* system call */
> -                if (trapnr == EXCP_BKPT) {
> -                    if (env->thumb) {
> -                        /* FIXME - what to do if get_user() fails? */
> -                        get_user_code_u16(insn, env->regs[15], env);
> -                        n = insn & 0xff;
> -                        env->regs[15] += 2;
> -                    } else {
> -                        /* FIXME - what to do if get_user() fails? */
> -                        get_user_code_u32(insn, env->regs[15], env);
> -                        n = (insn & 0xf) | ((insn >> 4) & 0xff0);
> -                        env->regs[15] += 4;
> -                    }
> +                if (env->thumb) {
> +                    /* FIXME - what to do if get_user() fails? */
> +                    get_user_code_u16(insn, env->regs[15] - 2, env);
> +                    n = insn & 0xff;
>                  } else {
> -                    if (env->thumb) {
> -                        /* FIXME - what to do if get_user() fails? */
> -                        get_user_code_u16(insn, env->regs[15] - 2, env);
> -                        n = insn & 0xff;
> -                    } else {
> -                        /* FIXME - what to do if get_user() fails? */
> -                        get_user_code_u32(insn, env->regs[15] - 4, env);
> -                        n = insn & 0xffffff;
> -                    }
> +                    /* FIXME - what to do if get_user() fails? */
> +                    get_user_code_u32(insn, env->regs[15] - 4, env);
> +                    n = insn & 0xffffff;
>                  }
>  
>                  if (n == ARM_NR_cacheflush) {
> @@ -396,6 +381,7 @@ void cpu_loop(CPUARMState *env)
>              }
>              break;
>          case EXCP_DEBUG:
> +        case EXCP_BKPT:
>          excp_debug:
>              info.si_signo = TARGET_SIGTRAP;
>              info.si_errno = 0;
> -- 
> 2.20.1
> 
> 
