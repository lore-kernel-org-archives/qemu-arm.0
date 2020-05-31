Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2464409lfc;
        Sun, 31 May 2020 12:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg2wmszugtnhli+fo8cSRu6BIdjHF1QkLrUBhzdGUuDyQWRoSPsIyAOZrWGhQFK06SToRN
X-Received: by 2002:a5b:10:: with SMTP id a16mr19388656ybp.262.1590954124765;
        Sun, 31 May 2020 12:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590954124; cv=none;
        d=google.com; s=arc-20160816;
        b=OhSH1ZV/M2PNfqFMsHRHfhHCOjyyeF6CbxrKvNil8Xaw9vhN5N5oU19d9A7eReUWre
         +7+ePF/yoM21I2ALCUpr5oPVhDG/660JFV2Gd6cCHWhpI0NJjBvBpx+6zQM1pVuiL+al
         KU3GaTz5muUV84ttBqpiVTiAAdkvKWupE17F8Luw8kIN4bT7IKg71QntshY7aTBAhq+c
         2kO5Mb+o5E2yUGikUQWnz58SGDHK8ms05WfDVEB9fj3qtoOpIJq365OH3rBgmY6jH/77
         d34rD/g9Lv79Q3ZcWa1DNxHQ9Jf2XFHKltLgRb9hy35F6Y3yJdBKiloBNxQ2jPdpFO3a
         yfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zZkAfHXymnO3BXYgTxxC7cdbgIt0XWHaxePpN/N3NYw=;
        b=K9XZYG0TGxZfB4jOfQwBV788/9xFcd3Y4SG+WHSLy8Ps80dbCIPaojIVpnHr5EExWv
         aj4dWWDoX9i8U8EYZPV0Dn/F/MDfKH/4lSGf1OUes93+Zi1RIXoAW6gntS6jDAR1KWKZ
         zoBCG1fts9wZYD3zHQlZwU56kuWhxiS+M4xWBt9xgEsQNZ9ojbzlGYZBGGjf/N7H0bb4
         pWwZuRMAeOzYiBAUzVIt2Aa0Yv5LrVtshptRkZVooqv3BLRVOVPekHgwuBj/g2l8vJ0v
         pGslX/YyK2yhl8eIY+FCdYlF7Ldn6hGegRliMIz/Bftdf0smA+LS14xYJCi0LgmOEM5p
         xtvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f15L8bkQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si12022153ybb.121.2020.05.31.12.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 12:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f15L8bkQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfTqO-0000Bn-4Y
	for alex.bennee@linaro.org; Sun, 31 May 2020 15:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTqF-00008w-0S
 for qemu-arm@nongnu.org; Sun, 31 May 2020 15:41:55 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTqA-0004up-F4
 for qemu-arm@nongnu.org; Sun, 31 May 2020 15:41:51 -0400
Received: by mail-oi1-x243.google.com with SMTP id v128so7242915oia.7
 for <qemu-arm@nongnu.org>; Sun, 31 May 2020 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zZkAfHXymnO3BXYgTxxC7cdbgIt0XWHaxePpN/N3NYw=;
 b=f15L8bkQjtQ3FzGw6fFCB3pGeOsMFHUJ5xQU5NoYAFBXlqemt98hl8YY672OTPUH5u
 xgLTRA4lydyKBEZol1G/E4B5lr/Zt0vFFPCJpZWfqLqpv+h0oSb/SHBW3cCC7pwvFW0C
 bRFOr5/kwmPdGH81r/iCz5Yb/foX+Zd6iqpZHvHe5+2gqQAj4A8wWqamEaiRoP/JvTLO
 6vUOTN1ISfxXYblYCD4sK91y4jzzeIKXKl+9uNN1reA6V8MvdcsHFtizaybmnqtFWqU5
 I7EkC42p5hyVnsfkTMxDi/f44GP+Fyos2RM6kqfURndJRlQdJ1pW0KuTsvsLH+0vlMlo
 FY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zZkAfHXymnO3BXYgTxxC7cdbgIt0XWHaxePpN/N3NYw=;
 b=mdEf72B0yqrE4RCR91EZHKxSfzh6zxLde/rr9mD2hCHwm16g1oDhtqdhueW4IDJIY8
 bLOU9+C0k0WoWNEX7T9T8eFM7vooiXlpK6BrhnZsf2wW1PeuiOzcDjFhQpPOjk85a+PF
 /usDxk3Kus8kLqo43ZRdSmt+TPybs/C83kox0G1yz+SOLPmIilpJaiBLuBTQ2EVdGM0X
 MjgW3hTdwdj3bTtnI37Z6FUD/JXRkIBu9if2if6oExirO1feuLSWzySqkHdwTQL9e7Pn
 nh1OEtQZFE7LEPM3yqzl2jkCJq2nDwBYwmjJJWCqlhkEB1/rtgAYYm9hskrtM8BASl8F
 dJyw==
X-Gm-Message-State: AOAM530hsSvDNWffS+ptzkAf7+HihwOQSaGiu/99DYGoa8KVcKkzyVyn
 NAxsGu7cJFzfZ8e0Soc0HYCng2J0u595O4SPaBraXw==
X-Received: by 2002:aca:5451:: with SMTP id i78mr7126844oib.48.1590954109071; 
 Sun, 31 May 2020 12:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200531175425.10329-1-f4bug@amsat.org>
 <20200531175425.10329-5-f4bug@amsat.org>
In-Reply-To: <20200531175425.10329-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 May 2020 20:41:38 +0100
Message-ID: <CAFEAcA9bDjiQnr7bw8QiixGtFmFszN6RuN3D-jNEL8mNmk987Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] exec/cpu-common: Do not restrict CPU to 32-bit memory
 access maximum
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /pFCk/OVoRZR

On Sun, 31 May 2020 at 18:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Most CPUs can do 64-bit operations. Update the CPUReadMemoryFunc
> and CPUWriteMemoryFunc prototypes.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/exec/cpu-common.h |  4 ++--
>  hw/usb/hcd-musb.c         | 12 ++++++------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index b47e5630e7..5ac766e3b6 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -43,8 +43,8 @@ extern ram_addr_t ram_size;
>
>  /* memory API */
>
> -typedef void CPUWriteMemoryFunc(void *opaque, hwaddr addr, uint32_t valu=
e);
> -typedef uint32_t CPUReadMemoryFunc(void *opaque, hwaddr addr);
> +typedef void CPUWriteMemoryFunc(void *opaque, hwaddr addr, uint64_t valu=
e);
> +typedef uint64_t CPUReadMemoryFunc(void *opaque, hwaddr addr);

I don't think the type of these functions has anything to do with the
CPU's capabilities, does it? The typedefs are a legacy remnant from before
the conversion to MemoryRegions:
 * before MemoryRegions, devices provided separate functions for
   byte/word/long reads and writes (64-bit writes were simply
   impossible with the ancient APIs, which required a 3-element
   function pointer array for read and the same for write)
 * the initial MemoryRegion conversion introduced the new-style
   "one read/write fn for all widths" APIs, but also supported
   old-style six-function devices, for ease of conversion, using
   MemoryRegionOps::old_mmio.
 * in commit 62a0db942dec6ebfe we were finally able to drop the
   old_mmio (having changed over the last devices using old-style).
   (I see I forgot to delete the now-unused MemoryRegionMmio typedef.)

The only remaining user of these typedefs is hw/usb/hcd-musb.c,
which is still not converted to QOM/qdev. It uses them to allow
its one user (hw/usb/tusb6010.c) to perform reads/writes on the
underlying musb registers.

There's no point in changing these typedefs to pass or return
a 64-bit data type, because their sole use is in the musb_read[]
and musb_write[] arrays, which only allow for 1, 2 or 4 byte
accesses, depending on which array element you use.

Possible cleanups here:
Easy:
 * delete the unused MmeoryRegionMmio
 * move these typedefs into include/hw/usb.h and rename them
   to MUSBReadFunc and MUSBWriteFunc, since that's all they're
   used for now
Tricky:
 * convert the hw/usb/hcd-musb.c code to QOM/qdev, which would
   include refactoring the current musb_read/musb_write so that
   instead of the tusb6010.c code calling function entries in these
   arrays the hcd-musb.c code exposed a MemoryRegion; the tusb6010
   code would access it via memory_region_dispatch_read/write

thanks
-- PMM
