Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z142sm24532149wmc.24.2019.09.23.16.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 16:54:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3FB3A1FF87;
	Tue, 24 Sep 2019 00:54:16 +0100 (BST)
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-2-beata.michalska@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Beata Michalska <beata.michalska@linaro.org>,
 quintela@redhat.com, richard.henderson@linaro.org, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-devel] [PATCH 1/4] tcg: cputlb: Add probe_read
In-reply-to: <20190910095610.4546-2-beata.michalska@linaro.org>
Date: Tue, 24 Sep 2019 00:54:16 +0100
Message-ID: <87ef06bmc7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IBlr9utfrl1D


Beata Michalska <beata.michalska@linaro.org> writes:

> Add probe_read alongside the write probing equivalent.
>
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/exec-all.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 81b02eb2fe..e1785700c3 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -319,6 +319,12 @@ static inline void *probe_write(CPUArchState *env, t=
arget_ulong addr, int size,
>      return probe_access(env, addr, size, MMU_DATA_STORE, mmu_idx, retadd=
r);
>  }
>
> +static inline void *probe_read(CPUArchState *env, target_ulong addr, int=
 size,
> +                               int mmu_idx, uintptr_t retaddr)
> +{
> +    return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr=
);
> +}
> +
>  #define CODE_GEN_ALIGN           16 /* must be >=3D of the size of a ica=
che line */
>
>  /* Estimated block size for TB allocation.  */


--
Alex Benn=C3=A9e
