Received: by 10.25.0.198 with SMTP id 189csp291889lfa;
        Wed, 3 May 2017 14:31:17 -0700 (PDT)
X-Received: by 10.107.138.193 with SMTP id c62mr6992515ioj.32.1493847076927;
        Wed, 03 May 2017 14:31:16 -0700 (PDT)
Return-Path: <alistair23@gmail.com>
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com. [2607:f8b0:4001:c06::244])
        by mx.google.com with ESMTPS id l184si10242itb.84.2017.05.03.14.31.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 May 2017 14:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4001:c06::244 as permitted sender) client-ip=2607:f8b0:4001:c06::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4001:c06::244 as permitted sender) smtp.mailfrom=alistair23@gmail.com
Received: by mail-io0-x244.google.com with SMTP id l196so4243148ioe.0;
        Wed, 03 May 2017 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=dqfsEh/ZbW6nHhTzde518J0DwGu+iCSYyxN+MPpygwE=;
        b=aSLgyjLleQhzt01uTqC0tSJqKjG7Z5el6EjYPRWMmqQoGyKpirhVGQ54ifPzwEcMRN
         goJkyyKXFHTPV5ZlY13jy5pHUCRQZ4xwI6jQuh8gzCn419fXKTMdWgj8sQBsuNle6BY1
         /Ebh+Z/kZGc8lRJq7ARVMC1QBN2//cNfkmH+94DBL60IW+LY66/7ws+j1CCahTmMEMeC
         1GTNkag/k7eT84NUECFWQOmzsOEqW69eYI2qZDaXunXuq6b7GsHcJsl6BZ2HQvxKsAPm
         S+9mtsnKpncqFCzHVUacI/Xz2R7o2Hf0Ip2Nfdn/qXAQ3+Oywd6sIoUV8YUF1wIqTEu3
         G7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=dqfsEh/ZbW6nHhTzde518J0DwGu+iCSYyxN+MPpygwE=;
        b=RXJ2UelvUxGFNI4H98IS8r8Hr+AMeo4X4QbLNhAueb5Sbl7J2hRf/1n/JJUtBJrzZw
         Kx8xi0DpBS90/wVlZwPKTC1fu+PMvlojZ26u3saLs3qrPhZrlksE7ZkC9ikjTEYiXGVC
         TgefrLOTlmyLqt+eCi4jO03LR6AK15f+fnY5d+oq3pMIh9KAHTcz5d0fIqTttJpCyALB
         z6EasYBqo2VHOBj3CRiw75fDHRh3DdInZjyG2dZrUhx0xmWyG50bVTlzXB83lwn7m6Xj
         LaB4hcnV7Hqt6L+fMXjKoMidkbKs7lExXvC7FdO0VtWh1OcmRe58kqA3g8aCZUVcqiJo
         hoeQ==
X-Gm-Message-State: AN3rC/48NQCW+Nl1JY65lO7/99LobGOKUiQXXeGCTY24jhhOYnlMjZJf
	AgMTUaOEmyKByHdBtPphOjE2ZpVQ8A==
X-Received: by 10.157.82.87 with SMTP id q23mr13453179otg.52.1493847076413;
 Wed, 03 May 2017 14:31:16 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.72.162 with HTTP; Wed, 3 May 2017 14:30:46 -0700 (PDT)
In-Reply-To: <1493122030-32191-9-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org> <1493122030-32191-9-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 May 2017 14:30:46 -0700
X-Google-Sender-Auth: umi5jCEdJObBFcvSLmdc9z0g3fM
Message-ID: <CAKmqyKPTXPZUkWsTzTV7rZ02QNAC2j9h_1eWqNs67KHM1Jkgrw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 08/13] armv7m: Improve "-d mmu" tracing for
 PMSAv7 MPU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@xilinx.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: vswrBEomlcCY

On Tue, Apr 25, 2017 at 5:07 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> Improve the "-d mmu" tracing for the PMSAv7 MPU translation
> process as an aid in debugging guest MPU configurations:
>  * fix a missing newline for a guest-error log
>  * report the region number with guest-error or unimp
>    logs of bad region register values
>  * add a log message for the overall result of the lookup
>  * print "0x" prefix for hex values
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: a little tidyup, report region number in all messages
>  rather than just one]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  target/arm/helper.c | 39 +++++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5c044d0..9e1ed1c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8169,16 +8169,18 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>              }
>
>              if (!rsize) {
> -                qemu_log_mask(LOG_GUEST_ERROR, "DRSR.Rsize field can not be 0");
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "DRSR[%d]: Rsize field cannot be 0\n", n);
>                  continue;
>              }
>              rsize++;
>              rmask = (1ull << rsize) - 1;
>
>              if (base & rmask) {
> -                qemu_log_mask(LOG_GUEST_ERROR, "DRBAR %" PRIx32 " misaligned "
> -                              "to DRSR region size, mask = %" PRIx32,
> -                              base, rmask);
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "DRBAR[%d]: 0x%" PRIx32 " misaligned "
> +                              "to DRSR region size, mask = 0x%" PRIx32 "\n",
> +                              n, base, rmask);
>                  continue;
>              }
>
> @@ -8215,9 +8217,10 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>                  }
>              }
>              if (rsize < TARGET_PAGE_BITS) {
> -                qemu_log_mask(LOG_UNIMP, "No support for MPU (sub)region"
> +                qemu_log_mask(LOG_UNIMP,
> +                              "DRSR[%d]: No support for MPU (sub)region "
>                                "alignment of %" PRIu32 " bits. Minimum is %d\n",
> -                              rsize, TARGET_PAGE_BITS);
> +                              n, rsize, TARGET_PAGE_BITS);
>                  continue;
>              }
>              if (srdis) {
> @@ -8251,8 +8254,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>                      break;
>                  default:
>                      qemu_log_mask(LOG_GUEST_ERROR,
> -                                  "Bad value for AP bits in DRACR %"
> -                                  PRIx32 "\n", ap);
> +                                  "DRACR[%d]: Bad value for AP bits: 0x%"
> +                                  PRIx32 "\n", n, ap);
>                  }
>              } else { /* Priv. mode AP bits decoding */
>                  switch (ap) {
> @@ -8269,8 +8272,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>                      break;
>                  default:
>                      qemu_log_mask(LOG_GUEST_ERROR,
> -                                  "Bad value for AP bits in DRACR %"
> -                                  PRIx32 "\n", ap);
> +                                  "DRACR[%d]: Bad value for AP bits: 0x%"
> +                                  PRIx32 "\n", n, ap);
>                  }
>              }
>
> @@ -8448,9 +8451,21 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>       */
>      if (arm_feature(env, ARM_FEATURE_PMSA) &&
>          arm_feature(env, ARM_FEATURE_V7)) {
> +        bool ret;
>          *page_size = TARGET_PAGE_SIZE;
> -        return get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
> -                                    phys_ptr, prot, fsr);
> +        ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
> +                                   phys_ptr, prot, fsr);
> +        qemu_log_mask(CPU_LOG_MMU, "PMSAv7 MPU lookup for %s at 0x%08" PRIx32
> +                      " mmu_idx %u -> %s (prot %c%c%c)\n",
> +                      access_type == 1 ? "reading" :
> +                      (access_type == 2 ? "writing" : "execute"),
> +                      (uint32_t)address, mmu_idx,
> +                      ret ? "Miss" : "Hit",
> +                      *prot & PAGE_READ ? 'r' : '-',
> +                      *prot & PAGE_WRITE ? 'w' : '-',
> +                      *prot & PAGE_EXEC ? 'x' : '-');
> +
> +        return ret;
>      }
>
>      if (regime_translation_disabled(env, mmu_idx)) {
> --
> 2.7.4
>
>
