Received: by 10.25.21.96 with SMTP id l93csp64832lfi;
        Wed, 22 Jun 2016 08:50:15 -0700 (PDT)
X-Received: by 10.55.18.28 with SMTP id c28mr5212053qkh.115.1466610615297;
        Wed, 22 Jun 2016 08:50:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u68si432052qka.142.2016.06.22.08.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 08:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFkPu-0001I1-MI
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 11:50:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFkPl-0001Az-TK
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 11:50:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFkPh-0001rW-Ni
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 11:50:04 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bFkPh-0001rP-IX; Wed, 22 Jun 2016 11:50:01 -0400
Received: by mail-qk0-x244.google.com with SMTP id l81so10701775qke.3;
	Wed, 22 Jun 2016 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=MssLM9E7rDcZC5K0YtPTEwu38jC9Y0AZXcq1HLGW7mY=;
	b=v8ve4jVjq9Y9G6qC0UH4vGK4hXLa+7TA9LFAofKIA0yMj+qe4q2ExmALH6pZxS/WLL
	gyc7UPLXpHhbAo5xJOFz2AOifqn65+nsEzS1kg2JHbwX4k8x3hu83SpOI9Je0xSlc7g6
	WF+U+iv5x84HHGKG6DVFTh/LoQYZYHLPrwQq8z2eTp4L1vg1zYHLuHcGPxVNpRnbJ+mb
	Ycwkp0GexsbVFkyPJSxxBFiqh4vhw1ffOSu1tc9OmMkv/MqFl81Y8puV21ApU0b7Rvf8
	QA0knOZFWiBavTi68znYHJRjh59ZAg+RRuwjrbjbEOreTss4BxgLd+L2dk51cFQAnbew
	fuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=MssLM9E7rDcZC5K0YtPTEwu38jC9Y0AZXcq1HLGW7mY=;
	b=DgylvOuXk5gq43yaWixRJ86mlpfZs1If//DedFrTouIb2qb2nSHrxhuGNm/5c9KYux
	LeIVNmN+jLyeLbrAJlMKrwikhtM914Qm0ZnN0Jt3N0rzF+nS0rz/fFSy0MJVglA70KX8
	P4CWMnqc6OIyfh+m15wI1BVz60AuKFoniVwC2B5YBZZWNnBAFDXTT/Y/nVJUnsGvaHnK
	AjNhJvECvwmFvGxE3ru58OYsBJmyy1iy/DrqaGIRbQMixkA3cJiTIkbqqTuSK4Rla+PC
	BThnWQqDZKQqt/sDCoNsK4yWz4PDv7QUEfl7swzey/LL2n+OCsHk/QH/fjz0fUIukdA/
	PoAQ==
X-Gm-Message-State: ALyK8tJKxL0vbUDiGNOmp1ZB/zhj6GuJLBCHCJFobxqm1QmA5wO95BbztJzDP3z588Dheg==
X-Received: by 10.55.70.66 with SMTP id t63mr39726388qka.162.1466610600996;
	Wed, 22 Jun 2016 08:50:00 -0700 (PDT)
Received: from anchor.twiddle.net (71-37-54-227.tukw.qwest.net. [71.37.54.227])
	by smtp.googlemail.com with ESMTPSA id
	29sm157630qtz.19.2016.06.22.08.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 08:50:00 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>, qemu-devel@nongnu.org
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
Date: Wed, 22 Jun 2016 08:49:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH v2] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D8QlV6BvWss8

On 06/22/2016 05:37 AM, Sergey Sorokin wrote:
> +/* Use this mask to check interception with an alignment mask
> + * in a TCG backend.
> + */
> +#define TLB_FLAGS_MASK  (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO)

I think we ought to check this in tcg-op.c, rather than wait until generating
code in the backend.


> --- a/tcg/aarch64/tcg-target.inc.c
> +++ b/tcg/aarch64/tcg-target.inc.c
> @@ -1071,19 +1071,21 @@ static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, TCGMemOp opc,
>      int tlb_offset = is_read ?
>          offsetof(CPUArchState, tlb_table[mem_index][0].addr_read)
>          : offsetof(CPUArchState, tlb_table[mem_index][0].addr_write);
> -    int s_mask = (1 << (opc & MO_SIZE)) - 1;
> +    int a_bits = get_alignment_bits(opc);
>      TCGReg base = TCG_AREG0, x3;
> -    uint64_t tlb_mask;
> +    target_ulong tlb_mask;

Hum.  I had been talking about i386 specifically when changing the type of
tlb_mask.

For aarch64, a quirk in the code generation logic requires that a 32-bit
tlb_mask be sign-extended to 64-bit.  The effect of the actual instruction will
be zero-extension, however.

See is_limm, tcg_out_logicali, and a related comment in tcg_out_movi for
details.  We should probably add a comment here in tlb_read for the next person
that comes along...

> diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
> index da10052..3dc38fa 100644
> --- a/tcg/ppc/tcg-target.inc.c
> +++ b/tcg/ppc/tcg-target.inc.c
> @@ -1399,6 +1399,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGMemOp opc,
>      int add_off = offsetof(CPUArchState, tlb_table[mem_index][0].addend);
>      TCGReg base = TCG_AREG0;
>      TCGMemOp s_bits = opc & MO_SIZE;
> +    int a_bits = get_alignment_bits(opc);
>  
>      /* Extract the page index, shifted into place for tlb index.  */
>      if (TCG_TARGET_REG_BITS == 64) {
> @@ -1456,14 +1457,21 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGMemOp opc,
>           * the bottom bits and thus trigger a comparison failure on
>           * unaligned accesses
>           */
> +        if (a_bits > 0) {
> +            tcg_debug_assert((((1 << a_bits) - 1) & TLB_FLAGS_MASK) == 0);
> +        } else {
> +            a_bits = s_bits;
> +        }
>          tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
> +                    (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);

ppc32 can certainly support over-alignment, just like every other target.  It's
just that there are some 32-bit parts that don't support unaligned accesses.


r~
