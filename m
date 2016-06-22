Received: by 10.25.21.96 with SMTP id l93csp102204lfi;
        Wed, 22 Jun 2016 10:12:21 -0700 (PDT)
X-Received: by 10.55.119.66 with SMTP id s63mr15326042qkc.63.1466615540942;
        Wed, 22 Jun 2016 10:12:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189si832206qke.53.2016.06.22.10.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 10:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFlhM-000143-CF
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 13:12:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFlhI-00012I-PU
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 13:12:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFlhD-0005t7-QY
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 13:12:15 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:32869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bFlhD-0005t3-MD; Wed, 22 Jun 2016 13:12:11 -0400
Received: by mail-qk0-x242.google.com with SMTP id a186so11177232qkf.0;
	Wed, 22 Jun 2016 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=RkBAgl+pfJ941GddLiVpWQRM5gwNfevIbPea6EauU7E=;
	b=V0w5FfNQhMpXlIh7BqDxQ0CEX1H98bA7ZssjEf+ZyBCCPNIBSwcUlDGhZqd9KCwzW+
	vhQBqGCw0ajAb939EpG0C9VXcqTLPzNp8r5Jxafxc0pg7YMe3s5UnTq0f2XKG6wPL1Tt
	u5CUU5b6L098mDe/jmkGDWeNRl/j+eL8L+qRJC4lr2yXYEbShE8H3rpwiiu8Z2zEALDe
	nHWXy5Hk7vcQAIOL2LbFnsTLJYZEBrIEj+SFfg9FeebwLR8sz+Ju4mRCDV3MT/xqgW0o
	jGhQmUE+ZMriAdaJUgH/8hNQxtpnQnSMa/sLQ483DRFD5F5M6OJqNIH025hnjoycontl
	AYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=RkBAgl+pfJ941GddLiVpWQRM5gwNfevIbPea6EauU7E=;
	b=XN2ZT8az55ICziebmiWOLe8ymw5Dmplzoymm3lAaVVyDbtP3wiyce8+tZQEcj/m7lL
	A1MF04haz+/8mrqZha0dJb2UXBCHvLM0+bUYo7cVyvQeMIw7dsaDasMP6gkDHU75M3SV
	LGrN/GBoUjp21AphEU5v7PcWDUYoBr9Yfa26IVvCwneH+2YQOyObLmO5LjvOclqgCAKO
	Fj3wR8Tz8Ptqx0RfJHAMwl5bpwS2Zl1jA/r/zpKxVedgJvdj0V+b1jAASaRGGPntOKXq
	K4jw9DBwP+8ok3XBI7yVlkrSaQ3FQPHOuABgfY9b5LLninnFKAA5OfuL3i0LhbcaPQJA
	HpMQ==
X-Gm-Message-State: ALyK8tJvSarzDebsaBBsfMmsV0hjIxUhsBQlHea/tYU68XgOEUdAVMlB0XMG0s1JLx81Zg==
X-Received: by 10.233.237.14 with SMTP id c14mr37049116qkg.88.1466615531167;
	Wed, 22 Jun 2016 10:12:11 -0700 (PDT)
Received: from anchor.twiddle.net (71-37-54-227.tukw.qwest.net. [71.37.54.227])
	by smtp.googlemail.com with ESMTPSA id
	m63sm377725qkf.34.2016.06.22.10.12.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 10:12:10 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
	<1793281466613020@web5h.yandex.ru>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
Date: Wed, 22 Jun 2016 10:12:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1793281466613020@web5h.yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
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
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ljvRHJb4sJoI

On 06/22/2016 09:30 AM, Sergey Sorokin wrote:
>>      diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
>>      index da10052..3dc38fa 100644
>>      --- a/tcg/ppc/tcg-target.inc.c
>>      +++ b/tcg/ppc/tcg-target.inc.c
>>      @@ -1399,6 +1399,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s,
>>     TCGMemOp opc,
>>           int add_off = offsetof(CPUArchState, tlb_table[mem_index][0].addend);
>>           TCGReg base = TCG_AREG0;
>>           TCGMemOp s_bits = opc & MO_SIZE;
>>      + int a_bits = get_alignment_bits(opc);
>>
>>           /* Extract the page index, shifted into place for tlb index. */
>>           if (TCG_TARGET_REG_BITS == 64) {
>>      @@ -1456,14 +1457,21 @@ static TCGReg tcg_out_tlb_read(TCGContext *s,
>>     TCGMemOp opc,
>>                * the bottom bits and thus trigger a comparison failure on
>>                * unaligned accesses
>>                */
>>      + if (a_bits > 0) {
>>      + tcg_debug_assert((((1 << a_bits) - 1) & TLB_FLAGS_MASK) == 0);
>>      + } else {
>>      + a_bits = s_bits;
>>      + }
>>               tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
>>      + (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
>>
>>
>> ppc32 can certainly support over-alignment, just like every other target. It's
>> just that there are some 32-bit parts that don't support unaligned accesses.
>>
>  
> I don't understand your point here.

ppc32 can support a_bits > s_bits.


r~
