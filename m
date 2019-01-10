Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2115688wrt;
        Thu, 10 Jan 2019 10:26:44 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7zZ3aX4IeUH8QTV6PEbmDnWUY00aVrYAOj2F83h9kSTXiQIxzdapaTL8H+ak6hh1lbb+Fe
X-Received: by 2002:adf:f504:: with SMTP id q4mr10785682wro.321.1547144804330;
        Thu, 10 Jan 2019 10:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547144804; cv=none;
        d=google.com; s=arc-20160816;
        b=UCbslr9yXqKUbJO4K+u9zl7/SEy/RqQJ/Dk7hGeiyNBF0vA+SXmckdUq5f9duu7Bap
         vPcjYdnBwIb1JW1sIccvhYLi+yTwD+7dtbGJE4np9kNZTaaqk4/ahWTRkcWO3aXs3IRi
         aO0rjMVeoY6dBKqlwV+cbTazVRQlfTn4aoR/qfOl4R6OE8wT0JnwVleqNC0BZ7cRwixM
         5YBpttwasXQoUIyJIu+b/9Zv8c0avXiEypwox3odOx8RZLTlc/eT5+rk6mmzSzejptG6
         7c6eMnqniW9a30EyGSUEMFmhGPEhDzqDv7cAmXBCxhwdp7QVwhsycF1pNbAzdw5G3Z9t
         YhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8nM2dPl3r1bxqVGGKESWihC0P7+TzrtHYseQ+j21e1U=;
        b=ob0nD8C0NLUKDaEwye/QF6MNwsIednk+m6EalMlwRWuSdszTq9d+XNb7xmajny9xYP
         mJ/kcyMZdBtE1pi9wKLNIDtw9XMwtpYnpXjpuxfgtIQVgLg3CaJKsSnCMTqcG7/q49iV
         12qn5qZS3hyQBxjTvYptNrHU8+hfUzM467lQc+kljThHcxiWaeKY5/qEo8SEP6wC2wrr
         TvaQTvjgdoQw8p5786ejrz7sV+OG08D70C+AvlFQD323G2IIhVKFS5+2J/GH28OupJAB
         S0Wmhh+UAlNoVD9h7jIKRJg4qK7KrPS4EpJCFwcgxe+eiqCAvFBagP02rPShi/rXiU62
         14eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PF/Flm7l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si5293280wme.142.2019.01.10.10.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 10:26:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PF/Flm7l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghf2R-0007rL-E1
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 13:26:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghf2I-0007qO-3N
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 13:26:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghf28-0000O2-7N
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 13:26:27 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ghf22-0000Lf-M7
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 13:26:18 -0500
Received: by mail-oi1-x241.google.com with SMTP id i6so10077016oia.6
	for <qemu-arm@nongnu.org>; Thu, 10 Jan 2019 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8nM2dPl3r1bxqVGGKESWihC0P7+TzrtHYseQ+j21e1U=;
	b=PF/Flm7lmv+feZaEuvpjsmrHAHauMgkHDd0Pn3qiF2w78CmlNXWbtiN6fSay/d3KVP
	ebD7hmnQ9hbXkys06NGND+lEHTkNafm1B0PnyCC9jaBGWJ7EQwNkvnKufKxVg7EaMZbC
	ZodKaI5pPIItnBLsEFeeleqXst066b+LWpU0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8nM2dPl3r1bxqVGGKESWihC0P7+TzrtHYseQ+j21e1U=;
	b=kaO7O/OQqtGdfmtJf5z4mbBqGMzBW0yxbcwRSbftnxqKutswfW8axVDoZHHyntgAGJ
	MiETYH6LaWXoPPKENOUt90sjAXXv8Fz7At8WFlwUNsSzW2E/gCnu9hvcxDcekcaosEB1
	vJ/T26aAaw7Wd3Wv2AaurjLj9sGnQrlNyvqFDVxISv/ws/rNjag/h9wNsFmaSKDFwItb
	4lyZKbqoEmzCAwV2AYL6GvliuCgbX/7jV6oP6jJaKAaN1+Kjh1JYyqQvEX+GqYv4LgS6
	7ET+7nBsm9MlCgd6Dwt4lIBnRGLFUGKvZbh/SeEjED0rw/EdQR6SIHBb4FsAQV//xaCk
	/8zA==
X-Gm-Message-State: AJcUukfQStbpb2DmqROXfYksKX005jFegvDciz3qOG6Oia9GYuybUbyI
	Cs1ZI7ZiVzESRWesWsqBxXPDsdRuDoXMiEahEPKTTueF
X-Received: by 2002:aca:ed92:: with SMTP id l140mr6798460oih.112.1547144776808;
	Thu, 10 Jan 2019 10:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-4-peter.maydell@linaro.org>
In-Reply-To: <20190108163008.7006-4-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jan 2019 18:26:05 +0000
Message-ID: <CAFEAcA9xd-MJ7QHgYCyh0D+x_ooXYDCnKYTXELoxz3LbYO4SJw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH 3/4] accel/tcg: Add cluster number to TCG TB
 hash
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Emilio G . Cota" <cota@braap.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qDG5xWuDkSUb

On Tue, 8 Jan 2019 at 16:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Include the cluster number in the hash we use to look
> up TBs. This is important because a TB that is valid
> for one cluster at a given physical address and set
> of CPU flags is not necessarily valid for another:
> the two clusters may have different views of physical
> memory, or may have different CPU features (eg FPU
> present or absent).
>
> We put the cluster number in the high 8 bits of the
> TB cflags. This gives us up to 256 clusters, which should
> be enough for anybody. If we ever need more, or need
> more bits in cflags for other purposes, we could make
> tb_hash_func() take more data (and expand qemu_xxhash7()
> to qemu_xxhash8()).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/exec-all.h   | 4 +++-
>  accel/tcg/cpu-exec.c      | 4 ++++
>  accel/tcg/translate-all.c | 3 +++
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 815e5b1e838..aa7b81aaf01 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -351,9 +351,11 @@ struct TranslationBlock {
>  #define CF_USE_ICOUNT  0x00020000
>  #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
>  #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
> +#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
> +#define CF_CLUSTER_SHIFT 24
>  /* cflags' mask for hashing/comparison */
>  #define CF_HASH_MASK   \
> -    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL)
> +    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
>
>      /* Per-vCPU dynamic tracing state used to generate this TB */
>      uint32_t trace_vcpu_dstate;
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 870027d4359..e578a1a3aee 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -336,6 +336,10 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
>          return NULL;
>      }
>      desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
> +
> +    cf_mask &= ~CF_CLUSTER_MASK;
> +    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +

This hunk turns out not to be quite right -- it needs to move
to the top of the function, before the assignment
"desc.flags = flags;". Otherwise tb_lookup_cmp() will
spuriously fail, and execution becomes somewhat slower because
we have to keep retranslating TBs rather than reusing them.
(Surprisingly this is only noticeable in an ARM TFM image
I happen to have, not in Linux kernel boot...)

thanks
-- PMM
