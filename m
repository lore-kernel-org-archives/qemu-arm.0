Received: by 10.25.21.96 with SMTP id l93csp363152lfi;
        Thu, 30 Jun 2016 07:07:18 -0700 (PDT)
X-Received: by 10.66.182.194 with SMTP id eg2mr22011782pac.159.1467295638001;
        Thu, 30 Jun 2016 07:07:18 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d20si4544682pfk.240.2016.06.30.07.07.17;
        Thu, 30 Jun 2016 07:07:17 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1752526AbcF3OHN (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Thu, 30 Jun 2016 10:07:13 -0400
Received: from mail-vk0-f52.google.com ([209.85.213.52]:33759 "EHLO
	mail-vk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752521AbcF3OHL (ORCPT <rfc822;kvm@vger.kernel.org>);
	Thu, 30 Jun 2016 10:07:11 -0400
Received: by mail-vk0-f52.google.com with SMTP id k68so24366830vkb.0
        for <kvm@vger.kernel.org>; Thu, 30 Jun 2016 07:07:11 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=DtYGc2cSWUGSblSxca1jV1RcIZ/q5bRZoF/1fE0yqDY=;
        b=D4kj6DluXZ8/Z0uZzB9DF2R8W5Nrf30xmSKjbsaRWm+cUs22K0Ck5bRcYMJNiix/8Y
         m8rI7Y/KwrQDg+2Mfmaoyfb7qaRRsy/5SxuI+Ckk50k/zt50/oXjDK5kd5v/kZmLsHD+
         lGegmM0o0tlqoH9OPgy8QmiUOIxXX1qjDCeQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=DtYGc2cSWUGSblSxca1jV1RcIZ/q5bRZoF/1fE0yqDY=;
        b=b5uoReq14SXnXmgHpkAUayXqiXJE/LMse+vcRSGbottFGsNL/vzby/fNHUHi9jq9Rk
         9rLjji7Ft42UKGFm99PPTQAc2cPI7yU6iMdcPntC4+QRAYs4Z+UMEuvjzkIHyfCKZ9Vh
         b7lh3fxc47pDOQHnEpDHc5NoMrl+Hm9+6IQYreAsdtvI55HAtvWvSuVT+QoHT9mqr4AO
         ou/fD82P6AdJpbubTLHwdUOstaQX0UvzpZ/8FXUV9+ZavwhdM4FXs973kSP6KJ4xAaia
         GnYt8gAx7UR16TpBphTy3YWOlZzv8atfjxRSXk3IjaNb5S4ARFpb4IKosE362BCisx9x
         VjQA==
X-Gm-Message-State: ALyK8tK5Hmqk9XWsTP4CTPK5SdrBSYaN0q6C41WQ3MHhg+5AkF4oCjFFriQqCBaIMqrUNC9vLw77m7Z9qktaSHDK
X-Received: by 10.31.152.85 with SMTP id a82mr5371681vke.47.1467295630702;
 Thu, 30 Jun 2016 07:07:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 30 Jun 2016 07:06:51 -0700 (PDT)
In-Reply-To: <1467150268-11038-2-git-send-email-andrew.smirnov@gmail.com>
References: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com> <1467150268-11038-2-git-send-email-andrew.smirnov@gmail.com>
From:	Peter Maydell <peter.maydell@linaro.org>
Date:	Thu, 30 Jun 2016 15:06:51 +0100
Message-ID: <CAFEAcA8YKL5rBvYtbg22da3x6Xg3MNnHBnjetqL0kxEKqcLXqg@mail.gmail.com>
Subject: Re: [RFC PATCH] exec: Support non-direct memory writes in cpu_memory_rw_debug
To:	Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"open list:PReP" <qemu-ppc@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:X86" <kvm@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: /2rDGuMCG/Sm

On 28 June 2016 at 22:44, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Add code to support writing to memory mapped peripherals via
> cpu_memory_rw_debug(). The code of that function already supports
> reading from such memory regions, so this commit makes that
> functionality "symmetric".
>
> One use-case for that functionality is setting various registers of a
> non-running CPU. A concrete example would be starting QEMU emulating
> Cortex-M with -S, connecting with GDB and modifying the value of Vector
> Table Offset register.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

>  static uint16_t vring_used_idx(VirtQueue *vq)
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 9f38edf..d5b4966 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -302,6 +302,6 @@ void dump_opcount_info(FILE *f, fprintf_function cpu_fprintf);
>  #endif /* !CONFIG_USER_ONLY */
>
>  int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
> -                        uint8_t *buf, int len, int is_write);
> +                        uint8_t *buf, int len, MemTxType type);
>
>  #endif /* CPU_ALL_H */
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 4ab6800..8fbaf1b 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -14,6 +14,13 @@
>  #ifndef MEMORY_H
>  #define MEMORY_H
>
> +typedef enum {
> +    MEMTX_READ,
> +    MEMTX_WRITE,
> +    MEMTX_PROGRAM,
> +} MemTxType;

We already have an enum for this: MMUAccessType.
That is currently unhelpfully located in cpu-common.h, but there's a
patch on list which should get applied soon which moves it to
include/qom/cpu.h:
 http://patchwork.ozlabs.org/patch/635235/


> +
>  #ifndef CONFIG_USER_ONLY
>
>  #define DIRTY_MEMORY_VGA       0
> @@ -1240,6 +1247,7 @@ AddressSpace *address_space_init_shareable(MemoryRegion *root,
>   */
>  void address_space_destroy(AddressSpace *as);
>
> +
>  /**
>   * address_space_rw: read from or write to an address space.
>   *
> @@ -1251,11 +1259,11 @@ void address_space_destroy(AddressSpace *as);
>   * @addr: address within that address space
>   * @attrs: memory transaction attributes
>   * @buf: buffer with the data transferred
> - * @is_write: indicates the transfer direction
> + * @type: indicates the transfer type
>   */
>  MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
>                               MemTxAttrs attrs, uint8_t *buf,
> -                             int len, bool is_write);
> +                             int len, MemTxType type);
>
>  /**
>   * address_space_write: write to address space.
> @@ -1268,10 +1276,11 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
>   * @addr: address within that address space
>   * @attrs: memory transaction attributes
>   * @buf: buffer with the data transferred
> + * @force: force writing to ROM areas
>   */
>  MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
>                                  MemTxAttrs attrs,
> -                                const uint8_t *buf, int len);
> +                                const uint8_t *buf, int len, bool force);
>
>  /* address_space_ld*: load from an address space
>   * address_space_st*: store to an address space

I think this patch would be easier to review if it was
split up, something like:
 * a patch which just converts the is_write bool parameter to the
   enum and updates all the callers, with no change in behaviour
 * a patch which makes use of the ability to pass in something other
   than 0 or 1
 * a patch which adds and uses address_space_write_debug(),
   or whatever API we go for

The important bit is splitting the mechanical "convert bool
to enum" part (which touches lots of files but makes no
behaviour change) from the part which changes behaviour
and doesn't touch many files.

thanks
-- PMM
