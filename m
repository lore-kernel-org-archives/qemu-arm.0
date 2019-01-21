Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6434612wrt;
        Mon, 21 Jan 2019 12:05:41 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6+YSlumLXlq8Iew4PPZ5dw8uTXwECqkk7zXZlwnxqUzeOaakwuQla84YVoPE7WSbC6XFCR
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr750283wmf.117.1548101141425;
        Mon, 21 Jan 2019 12:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548101141; cv=none;
        d=google.com; s=arc-20160816;
        b=XgbOAeT77Hm4B6NOuuUOlfTjyOlDDJJhL1oUrN9O2wU++40LACuFf07rFM6pCmlvas
         NrSsHqWMYf0oCrYG9OsgRUYX2ZmeGd+S1RtAXKwUGpt/rDfvERYHerI6JjmS1yDFKUvF
         O3EuudjkacKLGQeIDfJc/FdTVIA5PvjnDrULgqmlyAqCiRZzaWTHouhxukSEdvi7nAfD
         YTgP1IG/7Q1iY6T8Koby8a7lt/WSOYr0gZQ4sNUH4zJWWTxMItK4MxHgJ2WsaCz2VaA6
         KuNaywcenB/Ha/szHhmKlGPYpO23YBwp0VbyOsGkZhyEBd30Xxj4JuaDnZ2IleGjvzy6
         wDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Mn7wn0uyj12n7vb8MBDFepqfbpzmikKcYZ/+T05Zs0k=;
        b=WBo5Nleh+sjver9VXi/+TxvkVbpWpZK4FDj4jHvRmoaWqjB8fm5meH983hk+l27P9/
         VfSG2+GgZgeVfIN2hieXozPuwNIYFsNR7HWdNvcAbWZNbQCf//mwHeBXqmasjI6YNgoE
         e4+T1EVWJ2e2pTEQqtCPV4piYZx2yJxwTsA38AEqzCirViLlm28MN7xeRx4+4hI/LJ6P
         PUtHIGQa0vGau8d2zbjcbB1FROk9JSQq47ObNVF8pEsML2RNVK7TcB2GZJtn1OPYipaA
         H3Bbj1tVI6NqvCACtUXxneKSJ3ehewJJ1cjZDaBVWdlNYzmfaOeKQRyOk8iN0olG/GoV
         d+Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qgu+feWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o142si25290240wmd.1.2019.01.21.12.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 12:05:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qgu+feWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:59222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfpE-0004b5-HZ
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 15:05:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glfp2-0004aw-3b
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:05:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glfp0-0002gU-JT
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:05:27 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38817)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1glfoz-0002eT-S1; Mon, 21 Jan 2019 15:05:26 -0500
Received: by mail-ed1-x541.google.com with SMTP id h50so17523286ede.5;
	Mon, 21 Jan 2019 12:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Mn7wn0uyj12n7vb8MBDFepqfbpzmikKcYZ/+T05Zs0k=;
	b=Qgu+feWHxulF34ggSWSARcxocuW8L8kgWfEgskELmKHvEVftW3ynVyfzGaNFR5wPAJ
	Zxg7QuVSajnCxbvs5hbirAGiqNdsJ/CuGNN7avl6p8mo+qieHyC+Ys08UH6tXVkA05Nq
	MjOb8eVhFRbReoos9Tz+RYH/dRdR2JPA+HkuW76X8XFwdYtmyfbEU64RQ3GxUP/gSlEZ
	k+DXaUDMYZfPPlB0Iq4F9if1s6T0BKs7thnYoxz+XYTjK4C0dennTNPiYp7e86a5SyKk
	Z6g3husEaK+hex6pasCXL2tLPfmXHmhYj/xTvLu2nnf5LPre9Znx5S+LLQ77KzeBjWzr
	xiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Mn7wn0uyj12n7vb8MBDFepqfbpzmikKcYZ/+T05Zs0k=;
	b=kvwMshEuXH7h+1R0AziWi50Utz9tT66BJeoavcPtq5YFybCiAySP2nPj7Bi2G1Vrzu
	EExjXntOuzlwNGvyeVQ1Ytzwe93nTC3oQmniI53fPkxFt7U6gHEwMelLEvUc09zOpnfa
	I/oNMQsQcxWmpWTL7/YBt5o42ky9NCOElDPWMezN19NFAegRFOi5aHTqtrm7K6q2bdJE
	7RE1SfShEtomDHo8AE7NVbbFLDirKQEcZNP36epmVGnVc2VKfl3t8ZbH7c3+5NsMH7Xr
	cq/ElJ+vT3eNvpv6jLK4Jvi2LjyMHtOsNXhSQeAEOJOsziIgLcIypt8nUng11AI6SgCn
	TswQ==
X-Gm-Message-State: AJcUukfmjobqdeFirW91/i8AuAtErirjknMoG5y2C6DhF+rOWp9uAYnf
	WIyq9mmRmz6ICiGuDR8EW4o=
X-Received: by 2002:a17:906:77c1:: with SMTP id
	m1-v6mr24315356ejn.233.1548101122585; 
	Mon, 21 Jan 2019 12:05:22 -0800 (PST)
Received: from localhost ([149.199.80.131])
	by smtp.gmail.com with ESMTPSA id d2sm9232032eda.92.2019.01.21.12.05.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 12:05:21 -0800 (PST)
Date: Mon, 21 Jan 2019 12:04:50 -0800
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190121200450.GB21062@toto>
References: <20190121152218.9592-1-peter.maydell@linaro.org>
	<20190121152218.9592-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121152218.9592-4-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-arm] [PATCH v3 3/4] accel/tcg: Add cluster number to TCG
 TB hash
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
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	"Emilio G . Cota" <cota@braap.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oWG70EhPbkv2

On Mon, Jan 21, 2019 at 03:22:17PM +0000, Peter Maydell wrote:
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
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
> v1->v2: move the setting of the cluster index in
> cf_mask in tb_htable_lookup() up to before we
> set desc.cf_mask from it...
> ---
>  include/exec/exec-all.h   | 4 +++-
>  accel/tcg/cpu-exec.c      | 3 +++
>  accel/tcg/translate-all.c | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)
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
> index 870027d4359..6c4a33262f5 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -325,6 +325,9 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
>      struct tb_desc desc;
>      uint32_t h;
>  
> +    cf_mask &= ~CF_CLUSTER_MASK;
> +    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +
>      desc.env = (CPUArchState *)cpu->env_ptr;
>      desc.cs_base = cs_base;
>      desc.flags = flags;
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 8cb8c8870e6..7364e8a071f 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1688,6 +1688,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>          cflags |= CF_NOCACHE | 1;
>      }
>  
> +    cflags &= ~CF_CLUSTER_MASK;
> +    cflags |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +
>   buffer_overflow:
>      tb = tb_alloc(pc);
>      if (unlikely(!tb)) {
> -- 
> 2.20.1
> 
