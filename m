Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp821681wrt;
        Fri, 25 Jan 2019 14:44:59 -0800 (PST)
X-Google-Smtp-Source: ALg8bN65jwczB0zla5pSzFiuMrpsYNlp7VTnEWioQE4677Lw7d+lGn706steAoA92RfM+YaEK0V6
X-Received: by 2002:adf:8231:: with SMTP id 46mr9299567wrb.327.1548456299362;
        Fri, 25 Jan 2019 14:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548456299; cv=none;
        d=google.com; s=arc-20160816;
        b=ov61NlCngQZME8CJzJji9YBp/IbmjxTExTYJiXjf4Yd9J9+nI2yaLVmYkuoHrfrr/+
         JGAhDhwpX0Yv6wrGl3olzlVBF6BC0Od7qxNBtIA51lO3Pn8wi8TLbYi5Gc7hd9ocA0rq
         CbZYvf+Dsd2mI9Wz8c/qgDEI7SQfZbuj0XIY274f7biPdLIr69e+cp46pmpkd+dj+k77
         Cvj9NoSk3FEgFU8+T+6M/1zHHj75HxYwK27eRsSzAUWMs13x8D2ToHbj7gQB07P0hRGq
         bURYJgOsqf5EtVTXKuOxjFCChNZFF04RDE9JYzo/sTcKYzvXpK/NDt8IVJH06Hnq/rLP
         hPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=tsLQIMrwkYxobOfqc7xfgsjHByEJF/2RmmmnzjpRSGY=;
        b=lTTWPc3KUZaFWWOe12ps0dry0UR5q3BrjZfxKb6Hr2JSbO35gvjCAxrUMDIjZV2ic8
         HUA8a//nWcKs6HL8u6hO3go1jFMqnQAZct/4o/q7hs/24FhSGyZLs0U5BeSoaVJWW16H
         4TMRn2aV28adfsjMtXjndwRKFtD46v1IRmn35zeTwonYi0on5ze5DCGFfdyrRn6PQWBF
         zwXg7JAodAr9UZNNxWJ8QuKZnVX6LqaedY4JsNS2fz5ZzD1tY6W2phAS1nNpc4ROSDQ6
         hJWoZJYKDKLdGbdW6vdRdxKE5JjeKRGK+ncN2RVrzIebO5BFsduh10uQ+LrvOyoiYVH8
         71mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YTwuDm0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j65si41984555wmj.102.2019.01.25.14.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 14:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YTwuDm0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:51929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnADa-0006qk-E8
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 17:44:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gnADP-0006pj-CM
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 17:44:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gnADO-0002qs-Bs
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 17:44:47 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38773)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gnADI-0002jF-Ur; Fri, 25 Jan 2019 17:44:41 -0500
Received: by mail-pg1-x542.google.com with SMTP id g189so4780383pgc.5;
	Fri, 25 Jan 2019 14:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tsLQIMrwkYxobOfqc7xfgsjHByEJF/2RmmmnzjpRSGY=;
	b=YTwuDm0qPWwPErQ5J3dpk2ZJdGf3BK8NK3wcBN+wQv+CpZDGvZjmRnuNDVKbIz8bir
	uEi9vket2ZbesKzuU5nI+g/m5lstkZUrVNv/h/Cfa0neUXnP0uhcP5YEMuV6cO3LlGdh
	9AukxO9ebbcsBCo8OlTeHQTSNFUXYonNavgV2q3iHYCBXR0UQMR3Vy3X1JGdxGP1VFdI
	Xc6D953B+JvqfzJ8dF7AUs4kp3InSK1TOcjjuXaqxx4RjHUYc44V26Yj7PGMyOBZl7bC
	0hN37OFeRvaO9mQbjl9qveSntDLsrD02J2cONbLttoQcTHTAdEQD1xOPXlX7BT0gBpJH
	Q5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tsLQIMrwkYxobOfqc7xfgsjHByEJF/2RmmmnzjpRSGY=;
	b=b8E6SmKAp78uyZIRvepLO7SNby/wcablZiaArF6QUv2M+exghhGe0lGfaxklATNlVo
	5tLhK2FN4f0+SS82uh+kLH+uYbt3M/KdHzoQR3MI5Je3tl+kc/cOlO5Wd0Iq3wcGKGWG
	FVQxepVkZPsMJW9R7HRiBhr4r7mhBnYE5625V35PIZXjtsk1yqywb9XHOCOmy+dMkIrR
	n4hBHPmLtj9uggVvvkNrUlM0ZDoJnoa3hY9fn745YxP65aGoGkZV5ltuTDZU4PYqbmfX
	4q/9/wCWIAFGmMKzqNhxpcbLWK72yCKZOhml58CUV5vMU71aj4pnfkdTEeT/wzYVFF3z
	dGFg==
X-Gm-Message-State: AJcUukdO2320ijWi7XzQWmlTiucEOoOgm6ka5oRyZrtGVJIc1LfEAXi/
	vxeAzRgmzO8BLYnnSGWlOJs=
X-Received: by 2002:a63:ef04:: with SMTP id u4mr11706120pgh.197.1548456276239; 
	Fri, 25 Jan 2019 14:44:36 -0800 (PST)
Received: from [10.196.159.136] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	b5sm50019142pfc.150.2019.01.25.14.44.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 14:44:35 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121152218.9592-1-peter.maydell@linaro.org>
	<20190121152218.9592-4-peter.maydell@linaro.org>
From: Alistair <alistair23@gmail.com>
Message-ID: <238b1d52-b0b4-6fbb-18be-d70bf9b1c4b4@gmail.com>
Date: Fri, 25 Jan 2019 14:44:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121152218.9592-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 3/4] accel/tcg: Add cluster
 number to TCG TB hash
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
	"Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rLrL2E9wcVcX

On 1/21/19 7:22 AM, Peter Maydell wrote:
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v1->v2: move the setting of the cluster index in
> cf_mask in tb_htable_lookup() up to before we
> set desc.cf_mask from it...
> ---
>   include/exec/exec-all.h   | 4 +++-
>   accel/tcg/cpu-exec.c      | 3 +++
>   accel/tcg/translate-all.c | 3 +++
>   3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 815e5b1e838..aa7b81aaf01 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -351,9 +351,11 @@ struct TranslationBlock {
>   #define CF_USE_ICOUNT  0x00020000
>   #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
>   #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
> +#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
> +#define CF_CLUSTER_SHIFT 24
>   /* cflags' mask for hashing/comparison */
>   #define CF_HASH_MASK   \
> -    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL)
> +    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
>   
>       /* Per-vCPU dynamic tracing state used to generate this TB */
>       uint32_t trace_vcpu_dstate;
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 870027d4359..6c4a33262f5 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -325,6 +325,9 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
>       struct tb_desc desc;
>       uint32_t h;
>   
> +    cf_mask &= ~CF_CLUSTER_MASK;
> +    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +
>       desc.env = (CPUArchState *)cpu->env_ptr;
>       desc.cs_base = cs_base;
>       desc.flags = flags;
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 8cb8c8870e6..7364e8a071f 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1688,6 +1688,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>           cflags |= CF_NOCACHE | 1;
>       }
>   
> +    cflags &= ~CF_CLUSTER_MASK;
> +    cflags |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +
>    buffer_overflow:
>       tb = tb_alloc(pc);
>       if (unlikely(!tb)) {
> 
