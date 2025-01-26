Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2091685njk;
        Sun, 26 Jan 2025 13:13:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKPhF8shNNn/pqDN3BjDl2vGqw9lobXUfr9OoTtZR7Fv1OY1KVry6KwPF8YMb5tFum5fVkTZ/Gp0N8LQ==@linaro.org
X-Received: by 2002:a17:902:d2d2:b0:216:2e6d:baac with SMTP id d9443c01a7336-21c3554b4d7mr632516845ad.29.1737926031997;
        Sun, 26 Jan 2025 13:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737926031; cv=none;
        d=google.com; s=arc-20240605;
        b=TI0epsDnwygrNPRv86cJ1K778TaIfXPZnp+jmXfy4cvowvlDhFjWWVl6hP0Qm+Ab21
         ITzDqEeXxS5R3qqz7vt6FKQmBJn+1El+BLwAWuWcAMmRyug4psJ/Cwuls1JwjGF3lTGM
         +8nOV0Hy0eKKAChXpfDTqZBoUPKHres5lZr2FdpFk4EVkxWHBKnOZgkBanvHn4T3DqP1
         rvlb7VhG/A+VEiw5H1zptMXfFw4Q+AcBQPeCCXTL7zq+oIPw6Omx5pHe+uuxE4zYQIKD
         Ymsg3fsbjZDCqUlBEpKNa7UhOiNnkYRGiwH4UXTiXc6+IODqu4KIkUWMsK9b9npDoBMe
         OZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=M9kpcRwj4XMG8ftG4wmZyZnxF1iU/ErySCW5MvOqlTU=;
        fh=kPE2tpbfylztsAQ1iuvn66AxVQanjLCNZipqixNIvCY=;
        b=TXo7mub9Zq3VTvVhS/Kbp216ntcp3oUvk1omEenyULe20yEiknZJKjt4UDnPhJRra1
         nVr1iogrk6YAU/WrcwCWURIVQwoJYebWwUXyABYzRVVuwN7/Pv66S53iByryIa/IpHNh
         so8b2WrzS6hTk5bLeqfYGjk3m8uZlvkL7nhFlgDJmoVuIj36TeA7g6ywHSsc3WerLWND
         CxPGtwnrAlo7FT5P2WkCD0GvACcLf1j7+u5lYhBcQsBhW2w+5WVKIGM6X4uimwF2C4qi
         625vqB7HKfnInTb8JgnmWd8x3eXJZ3KAuBehmAR1Ib/UIZHIkTZ6GZ/RrnZt/b5x+wjT
         Er9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2db2d+q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da411cc46sor37847815ad.12.2025.01.26.13.13.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 13:13:51 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2db2d+q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926031; x=1738530831; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9kpcRwj4XMG8ftG4wmZyZnxF1iU/ErySCW5MvOqlTU=;
        b=P2db2d+qYczdnKVybtaeTpqFWjd89zgN4pnnBEEYTtb2nBun2ggouFK7vf3atZdjL4
         bmDlav66H3JHJzjkxgECsICN0umgm7GXvwqJtWw+Uz7sei/hLf8Cv/2ggiuO4K7Jcjjq
         8cGB6C17JpWMMZIayAcJXRYHbMrndqTxmVMzjV+I2eDQ/HfH2sPkkKx0sCvsqnlV2JvL
         6FcHV2HQVu8V9ZCGvxIsE5XhKRpvvNHMGHA9g8xTzURfxD5m86oQlO31QJqQZ65Z8T6R
         soUZFEoUOKVcO27ZnHVCFZPv8YhWcq9obzcHcCwdHOwuDAXUP0azqcwTEOq/sXUd3rXb
         YL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926031; x=1738530831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9kpcRwj4XMG8ftG4wmZyZnxF1iU/ErySCW5MvOqlTU=;
        b=B3/nxZVC+LPSlmHK+UrYm/x8EpFivSbpSaQFb+9z9yWPHjUTMV1TjGLQ0JAQ/kKXCU
         4sJWXnZKJ4y43HLju/YkI6/Y9eqwWg6AtMCE4XhbS6QPAHqxLdNPGRSRIcIGRf9h1+XM
         OiExn4cEsxrMNustSRFdAFycqc4arzPB86aJ7/TkwyRGfPNS8fozmH0ltsjgpCV/6do8
         E2ZFU7REAW7R+iQgE/3PCAO1o+jmhwe/x9IuBqW2FbKcZ6eNc+tRw7RYqVBDoNqlWL5G
         mWrhfFgiDkGTSAbUerq3gKyR5q6uArOLfI9tCmThfn8SmfI1iZ/schpwLpStYmEsKf3G
         o8lA==
X-Forwarded-Encrypted: i=1; AJvYcCWk8dA/1rsMRkLDdyebWB9j7KdZpxtxR0M8+PNJP+WgpMNTijL1MtB0l7YWRIqZgZEybaI7vaM13XXYVA==@linaro.org
X-Gm-Message-State: AOJu0Yx2jfj+3W/yRWfuKQL9NEkn+T02HedGKqUQ5WAWt7UyEZgFWcJC
	FyzGaBMrT5PmOKk4cWgG57SWtDG3lSw1ONyuNMSxclmjKtsZFjr76cMaK8q+koh6Cg==
X-Gm-Gg: ASbGncvNKWHeUnB4ARD9bgaTK+VsOHt9h5CWB9A+Se/EUUHOxy+m989i9j1JoleIcX8
	XQZ556QzF4R//u1YTtZU2BvO7ikp+sh1UvsqvnXrCq/E1WIFdK5DTx4hqMVAAjII91VtaKBdcS6
	KnudDjHgtQUWJi2tfbCcqYU7Po2qYm0snLXtRbWFFjvzCj9tcGFfsRw+WJjIgni+rPHVb+9j6Hz
	vamz1OmwljazLfN2vT2Rxe9GAuPbRiQQCsDfRY2iROFSbdYMuPVLmZowHAUhV+tIDqxWcc53NNF
	TXU29Ux/nTS8I8ps93vxG0KYzee0G3oNHpAAKuGk/PRtgPI=
X-Google-Smtp-Source: AGHT+IEZs0zeKB5IzyrVqsgjZQ8Qgr6yuUndfoZR9xIIrSSkISsRSLWzsvON9msLe4CFxT+Ly8wqnw==
X-Received: by 2002:a17:902:f551:b0:215:431f:268a with SMTP id d9443c01a7336-21c3556016amr565306785ad.31.1737926031507;
        Sun, 26 Jan 2025 13:13:51 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3bb9sm50157355ad.92.2025.01.26.13.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 13:13:51 -0800 (PST)
Message-ID: <c844b086-b3fd-438d-a4ce-6571094e5e14@linaro.org>
Date: Sun, 26 Jan 2025 13:13:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] accel/tcg: Move cpu_memory_rw_debug() user
 implementation to user-exec.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-15-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wGnZoMoWKXgd

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> cpu_memory_rw_debug() system implementation is defined in
> system/physmem.c. Move the user one to accel/tcg/user-exec.c
> to simplify cpu-target.c maintenance.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/user-exec.c |  92 +++++++++++++++++++++++++++++++++++++
>   cpu-target.c          | 102 +-----------------------------------------
>   2 files changed, 94 insertions(+), 100 deletions(-)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index c4454100ad7..e7e99a46087 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -19,6 +19,8 @@
>   #include "qemu/osdep.h"
>   #include "accel/tcg/cpu-ops.h"
>   #include "disas/disas.h"
> +#include "exec/vaddr.h"
> +#include "exec/tswap.h"
>   #include "exec/exec-all.h"
>   #include "tcg/tcg.h"
>   #include "qemu/bitops.h"
> @@ -35,6 +37,7 @@
>   #include "internal-common.h"
>   #include "internal-target.h"
>   #include "tb-internal.h"
> +#include "qemu.h"

What is required from *-user/qemu.h?
We really should not be including that in accel/tcg/.

> +            if (flags & PAGE_WRITE) {
> +                /* XXX: this code should not depend on lock_user */
> +                p = lock_user(VERIFY_WRITE, addr, l, 0);

Ah, here it is, complete with comment.

Indeed, I don't think lock_user is required at all.  page_get_flags() and g2h() are 
sufficient.

> +                mmap_lock();
> +                tb_invalidate_phys_range(addr, addr + l - 1);
> +                written = pwrite(fd, buf, l,
> +                                 (off_t)(uintptr_t)g2h_untagged(addr));
> +                mmap_unlock();

We probably want to own mmap_lock for the entire function.


r~
