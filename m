Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4785263lfm;
        Tue, 21 Apr 2020 00:47:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypKF2+SxuqHOANyyYs6KI1kYbVBFLu5iJG9jqBJ1l5HX7pHHWjIrmfsMR1AdYHxe3bCYZvMh
X-Received: by 2002:a0c:fdc3:: with SMTP id g3mr19209941qvs.184.1587455232223;
        Tue, 21 Apr 2020 00:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587455232; cv=none;
        d=google.com; s=arc-20160816;
        b=feyyzLALqlY5sX4p8VFQZMLoqL7bJrnYVQFIwwBCSq4TGeq2T07L3zSCxDc4i8ggPx
         gCoaniQPoD4dA49a022fJfVh+HRGnKP67/tvN5SacaoxKnnQqv3/E4dbiYTwOjnoYar5
         FBTbvM92xISHRsDgbETKInZnLPUnNNsz18IxrPu0X4/LKVeyEriqm48dZAxHq00LngSZ
         of147Drdze1MJTrEDLcYGS1xyMsFtWI9guw4P63OCwaKEWrBZ9+lvT0K8PHxOIe2N7m0
         UWh7FhKmk4EJuyMsxKGooeYj/gfohj2Z/6xfXwCGZEz4yGebJ7iTnCVYB+4+njaClHLw
         uiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=PoHAvL2iCKmot5udpgodEB2iOjbkXVlGxcTV18LUAR0=;
        b=H+kRjTEjOFCAojsuxUw5rV4Z/it3aIjSTXhY9ZlPyPxqOTTQvACB3JxMNIlLuzAndg
         muGnYgZ4lq7ASb/10BfqPhnMrGLbpK/ZiHhV/S6BWrMGRCNtWpXwUJWXT92dIDAJtrhd
         nIxshRZKGahhVREmYnWhjRFMwV+bE9ix3jX+HNgCLhQExz9GzdbAqt6yMpY6xf183tRz
         MJXb/+U6m+7mdIV3zeE/B2k4G1JpOjP19St9kPD+nTxZNf6+TmjvvphU+M4B7NQdLBFW
         mDAfH4FDa43RahPcO7ZQXP7wtdbSYfI+aGXQiOHSFY4iDxcvrEZgHhnARnAlwx2jryzg
         OjJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GXf1KwLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si880374qvl.151.2020.04.21.00.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 00:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GXf1KwLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQncd-00047k-Kf
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 03:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jQnYY-0007vk-N6
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 03:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jQnYS-0001H1-PG
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 03:42:58 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:37900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jQnYS-0001Bp-Bp; Tue, 21 Apr 2020 03:42:52 -0400
Received: by mail-lf1-x142.google.com with SMTP id l11so10332255lfc.5;
 Tue, 21 Apr 2020 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PoHAvL2iCKmot5udpgodEB2iOjbkXVlGxcTV18LUAR0=;
 b=GXf1KwLRSofQFMxNrviqYfP8CnPz8/t53mfaVv8o3XhFVbxe8iMWxWNY46HQ+ppFlj
 nNaymFg4ZSbJhpP2afBJ/k5RJz7UmiIJIMQRHn3DrEtMFkgFWSOumUZBry+jfdPxnx/h
 YLVvW+0HVslaCw+CFibAYlihLIvbbdKOuyh9Rgzw3ubDVgjZlDZCmq329YSc+uE2/3pM
 G4wB6w9mcKPVbycL/a/Q7jVE8C1DB1c9jD75VNvrjPPZOlKyydE8Yd4ceDeCnHuOvTgB
 kNdkADs9LonB6T+p0wYPG8T+Q2CodQXrs1IQwUn0sdSlCIP94hBsn0LnZvhEGIxUPJUN
 H0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PoHAvL2iCKmot5udpgodEB2iOjbkXVlGxcTV18LUAR0=;
 b=ogmxSNAqBe52L+gCIqCABhSD/Zb4zm9cNY5XSjQAc1eDVyqnGrTpouHqonDP0uatMb
 eUglciXeLxwzyLb91XcNVY6iregeeKxviFiWHYFeVLoNZMk8Y5GdpOrmiDpg8JR+JkhN
 xymfyF2ur+Q7XS/beN555RDzo1sDSANeLlLP+5/qUNeQqqiReBeOk1QeI5B/ilr5Plxs
 MuPVLvU04QqAeMu27xYQ7LGebmo9/Mbidmdw9ckoyeKTojqEvXxTRj+taxJskxAo0580
 k6LdRzwR1ovjVJDwtvGU+78wfTIMDZRztdWhHPXo6MZmv8V/ScYdLnz+z71SlkrZ9DOl
 IepA==
X-Gm-Message-State: AGi0PuYSbVWV26yYnxvkdqGuvsY60QNt+mXwGItc0sOJDTHEeovYAA6A
 HiD8VteYR/XAlBaNw5ZU8Uw=
X-Received: by 2002:a19:9109:: with SMTP id t9mr13144357lfd.10.1587454970061; 
 Tue, 21 Apr 2020 00:42:50 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id c21sm1423114lfh.16.2020.04.21.00.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 00:42:49 -0700 (PDT)
Date: Tue, 21 Apr 2020 09:44:00 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/4] linux-user/arm: Handle invalid arm-specific syscalls
 correctly
Message-ID: <20200421074400.GE2669@toto>
References: <20200420212206.12776-1-peter.maydell@linaro.org>
 <20200420212206.12776-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420212206.12776-4-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::142
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
X-TUID: maQmz6xIvYXX

On Mon, Apr 20, 2020 at 10:22:05PM +0100, Peter Maydell wrote:
> The kernel has different handling for syscalls with invalid
> numbers that are in the "arm-specific" range 0x9f0000 and up:
>  * 0x9f0000..0x9f07ff return -ENOSYS if not implemented
>  * other out of range syscalls cause a SIGILL
> (see the kernel's arch/arm/kernel/traps.c:arm_syscall())
> 
> Implement this distinction. (Note that our code doesn't look
> quite like the kernel's, because we have removed the
> 0x900000 prefix by this point, whereas the kernel retains
> it in arm_syscall().)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 025887d6b86..f042108b0be 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -332,10 +332,32 @@ void cpu_loop(CPUARMState *env)
>                              env->regs[0] = cpu_get_tls(env);
>                              break;
>                          default:
> -                            qemu_log_mask(LOG_UNIMP,
> -                                          "qemu: Unsupported ARM syscall: 0x%x\n",
> -                                          n);
> -                            env->regs[0] = -TARGET_ENOSYS;
> +                            if (n < 0xf0800) {
> +                                /*
> +                                 * Syscalls 0xf0000..0xf07ff (or 0x9f0000..
> +                                 * 0x9f07ff in OABI numbering) are defined
> +                                 * to return -ENOSYS rather than raising
> +                                 * SIGILL. Note that we have already
> +                                 * removed the 0x900000 prefix.
> +                                 */
> +                                qemu_log_mask(LOG_UNIMP,
> +                                    "qemu: Unsupported ARM syscall: 0x%x\n",
> +                                              n);
> +                                env->regs[0] = -TARGET_ENOSYS;
> +                            } else {
> +                                /* Otherwise SIGILL */
> +                                info.si_signo = TARGET_SIGILL;
> +                                info.si_errno = 0;
> +                                info.si_code = TARGET_ILL_ILLTRP;
> +                                info._sifields._sigfault._addr = env->regs[15];
> +                                if (env->thumb) {
> +                                    info._sifields._sigfault._addr -= 2;
> +                                } else {
> +                                    info._sifields._sigfault._addr -= 2;
> +                                }


Am I missing some detail or are both branches of the if-else doing the
same thing?

Cheers,
Edgar



> +                                queue_signal(env, info.si_signo,
> +                                             QEMU_SI_FAULT, &info);
> +                            }
>                              break;
>                          }
>                      } else {
> -- 
> 2.20.1
> 
> 
