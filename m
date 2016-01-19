Received: by 10.25.159.19 with SMTP id i19csp2622097lfe;
        Tue, 19 Jan 2016 09:21:57 -0800 (PST)
X-Received: by 10.55.77.216 with SMTP id a207mr39050477qkb.80.1453224117797;
        Tue, 19 Jan 2016 09:21:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a18si38445592qkb.114.2016.01.19.09.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 09:21:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLZyf-0003tn-66
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 12:21:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZyb-0003rg-UP
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:21:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZya-0005Sk-U6
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:21:53 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZya-0005SL-PQ
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:21:52 -0500
Received: by mail-vk0-x229.google.com with SMTP id n1so197602681vkb.3
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 09:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=r47khd6Ak9SnsaX91HZu3niAsHYTafMLq9sHX7GHdF4=;
	b=Vh5L0Nf+4wGTmUSyjgI5xdY5NHk/flrAMSP1WzqnCRcsC+avy75MYH7XfXFqY5pLax
	kPkLQITbbJFgiqJu1hoBtg8MLAUHkfJ9bo8dXVfAVHFG6Xyl+Go7NPkRSmgLHZdv+Rdv
	Mb71QnGUMvP1Ghb9w43IGjPqSbkUtVGFkNO9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=r47khd6Ak9SnsaX91HZu3niAsHYTafMLq9sHX7GHdF4=;
	b=fe4TmHKWLHAuhphkDbG505S1M67EJBqLkkOJTwDRhJgkILOXZFqgrfQlxIuXNjTu5s
	7l4AWw63xln2qJsHyQyKrkJu6ixKgFvCulwAWRIjNWmU97+EqTXxePbiMgY2LCHB9Gep
	/gO0MLasrFpBSuxtm+pz/zOX6zUzw4fzg7vlJhYCPtBXO+YJT7Ds4y1wlPbflLXzgVh6
	nByvAzhwRyk1b6jNgozIkM10UckbR0vaXx8/TxTFZKTDwbVAj3vZFNUn1PcA2jzYrNvg
	Q2XPma2UTLtHwjkg2lxrYj4KzBEYuZPexZIeTNdnKCoE+d/EzkrXrXxnExubWnHFcDy+
	/UrQ==
X-Gm-Message-State: ALoCoQm+rSeu84ct6W84mNULR5Am6NvCAwl0GTVo3Se8iwa3Klh4ECnpC1XinlVVXgHH6WncVS9PWAD2i/YbabBpkBWGbUHiZLPi9Pa3gO6q+wXOm4bGkiY=
X-Received: by 10.31.180.145 with SMTP id d139mr18668923vkf.83.1453224111050; 
	Tue, 19 Jan 2016 09:21:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 09:21:31 -0800 (PST)
In-Reply-To: <923e454020ea0b713a1225ab81ff0db636c76a4f.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<923e454020ea0b713a1225ab81ff0db636c76a4f.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 17:21:31 +0000
Message-ID: <CAFEAcA_sPRg8Bby5EAKhwEtEXN1yjV=i5rDgE_U34HeiWpFeqw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 12/17] target-arm: implement SCTLR.B,
	drop bswap_code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JaKl6pRzlv7e

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> bswap_code is a CPU property of sorts ("is the iside endianness the
> opposite way round to TARGET_WORDS_BIGENDIAN?") but it is not the
> actual CPU state involved here which is SCTLR.B (set for BE32
> binaries, clear for BE8).
>
> Replace bswap_code with SCTLR.B, and pass that to arm_ld*_code.
> The next patches will make data fetches honor both SCTLR.B and
> CPSR.E appropriately.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [PC changes:
>  * rebased on master (Jan 2016)
>  * Dropped comment about CPSR.E being unimplemented
>  * s/TARGET_USER_ONLY/CONFIG_USER_ONLY
>  * Use bswap_code() for disas_set_info() instead of raw sctlr_b
> ]
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>
>  linux-user/main.c          | 13 ++++++++-----
>  target-arm/arm_ldst.h      |  8 ++++----
>  target-arm/cpu.c           |  2 +-
>  target-arm/cpu.h           | 47 ++++++++++++++++++++++++++++++++++++++--------
>  target-arm/helper.c        |  8 ++++----
>  target-arm/translate-a64.c |  6 +++---
>  target-arm/translate.c     | 12 ++++++------
>  target-arm/translate.h     |  2 +-
>  8 files changed, 66 insertions(+), 32 deletions(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 2157774..d481458 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -441,7 +441,7 @@ void cpu_loop(CPUX86State *env)
>
>  #define get_user_code_u32(x, gaddr, env)                \
>      ({ abi_long __r = get_user_u32((x), (gaddr));       \
> -        if (!__r && (env)->bswap_code) {                \
> +        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
>              (x) = bswap32(x);                           \
>          }                                               \
>          __r;                                            \
> @@ -449,7 +449,7 @@ void cpu_loop(CPUX86State *env)
>
>  #define get_user_code_u16(x, gaddr, env)                \
>      ({ abi_long __r = get_user_u16((x), (gaddr));       \
> -        if (!__r && (env)->bswap_code) {                \
> +        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
>              (x) = bswap16(x);                           \
>          }                                               \
>          __r;                                            \
> @@ -4489,14 +4489,17 @@ int main(int argc, char **argv, char **envp)
>              env->regs[i] = regs->uregs[i];
>          }
>  #ifdef TARGET_WORDS_BIGENDIAN
> -        env->uncached_cpsr |= CPSR_E;
>          env->cp15.sctlr_el[1] |= SCTLR_E0E;
> -#endif
>          /* Enable BE8.  */
>          if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
>              && (info->elf_flags & EF_ARM_BE8)) {
> -            env->bswap_code = 1;
> +            env->uncached_cpsr |= CPSR_E;

...ah, this is fixing the problem I noted in the earlier patch.

> +        } else {
> +            env->cp15.sctlr_el[1] |= SCTLR_B;
> +            /* We model BE32 as regular BE, so set CPSR_E */
> +            env->uncached_cpsr |= CPSR_E;

...but we still set CPSR_E for BE32, which is wrong.

>          }
> +#endif
>      }
>  #elif defined(TARGET_UNICORE32)
>      {

The rest of this patch is all OK.

thanks
-- PMM
