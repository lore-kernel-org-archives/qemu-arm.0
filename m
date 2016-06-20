Received: by 10.25.21.96 with SMTP id l93csp1511552lfi;
        Mon, 20 Jun 2016 08:45:40 -0700 (PDT)
X-Received: by 10.55.87.194 with SMTP id l185mr23476248qkb.204.1466437538898;
        Mon, 20 Jun 2016 08:45:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y124si48350009qke.213.2016.06.20.08.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 08:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bF1OM-0006NM-6k
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 11:45:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bF1OD-0006Jp-SO
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 11:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bF1O9-0003WJ-QC
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 11:45:28 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:35742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bF1O9-0003WC-K4; Mon, 20 Jun 2016 11:45:25 -0400
Received: by mail-qk0-x22c.google.com with SMTP id c73so167232948qkg.2;
	Mon, 20 Jun 2016 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=EFTWy4qRRuoUq6QATcfSTEBkv33g0wLm9qCvVbqUfsk=;
	b=dvnxzGpbJW/b8w/48TjrMtWjXTeBi078XEM7toiJdq4aLgWPh2wqJ19KXL4t6cmtDD
	Um5PxYD7+pGd+lelT7Z054e3slS/D63V0v5Yrnr20kBwOvbQNosgXnuMCUHSroiUw79w
	ysWmguTqgb5ucWbpbVZy+21PbftF1OJ6ycf7p24wx8WOqewb5wxOGSevCI6ZaI7319x1
	8K8ejSNEfSpxnFqm3nvdYi8TxE9h117FKzgPuKY2lcit3Miub39g0PtcHXzgdxv0nFZt
	NofIpwhrtUX0PLUzPVyC5A6NNZTgYv9HGD4sPqMvnY40baRQgFb+TFwBLe9uG5bekczb
	1Log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=EFTWy4qRRuoUq6QATcfSTEBkv33g0wLm9qCvVbqUfsk=;
	b=Pa/PQt5KX7AZhw63JfNajwyO1mpVeIamNNpQ0dF/Fc3KttWkA/ucDaOoDrWAJm2/SB
	xkcJzbaVrapko9CXdRk2IEz/2xzYnBh35FmfeV9fM3gXIYID5XqAKXUgYxEQsquVVNtc
	g2J5quqN+rti2J/IZ/JfUdN7qmV2Q/Tg1Xr09m78CNJjpQa4VD5aFQS7LWxaP6FmOEv2
	CWAhWY0So65bxMBOFYpa4Skyftm+21gFEKf377cqHh+9N5PCAqangNubNCmCSuMFSccz
	uEwdoaHA82vqRGCznkcqLU25SjlzljQRhZP26L4G66aYmFKliXeEzMGpy0p3PK3M7Djh
	LCCA==
X-Gm-Message-State: ALyK8tIy+aLhBdu9Ce4jlSxT9+PYRQGXRDHMXO9Pl4pojkxhiIhUfFfCvmHal8lihXS3IQ==
X-Received: by 10.55.18.215 with SMTP id 84mr2765511qks.128.1466437525109;
	Mon, 20 Jun 2016 08:45:25 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	56sm15341351qtt.31.2016.06.20.08.45.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 08:45:24 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>, qemu-devel@nongnu.org
References: <1466431017-123868-1-git-send-email-afarallax@yandex.ru>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <ace0b2e6-613b-cc8e-aa05-f583ed43857b@twiddle.net>
Date: Mon, 20 Jun 2016 08:45:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466431017-123868-1-git-send-email-afarallax@yandex.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: Re: [Qemu-arm] [PATCH] Improve the alignment check infrastructure
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
	"Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cAk4V4ggic27

On 06/20/2016 06:56 AM, Sergey Sorokin wrote:
>  /* Flags stored in the low bits of the TLB virtual address.  These are
> -   defined so that fast path ram access is all zeros.  */
> + * defined so that fast path ram access is all zeros.
> + * They start after address alignment bits.
> + */
> +#define TLB_FLAGS_START_BIT 6
>  /* Zero if TLB entry is valid.  */
> -#define TLB_INVALID_MASK   (1 << 3)
> +#define TLB_INVALID_MASK    (1 << (TLB_FLAGS_START_BIT + 0))
>  /* Set if TLB entry references a clean RAM page.  The iotlb entry will
>     contain the page physical address.  */
> -#define TLB_NOTDIRTY    (1 << 4)
> +#define TLB_NOTDIRTY        (1 << (TLB_FLAGS_START_BIT + 1))
>  /* Set if TLB entry is an IO callback.  */
> -#define TLB_MMIO        (1 << 5)
> +#define TLB_MMIO            (1 << (TLB_FLAGS_START_BIT + 2))

I think we may need to assert that TLB_FLAGS_START_BIT + 3 < TARGET_PAGE_BITS. 
Or perhaps start from TARGET_PAGE_BITS-1 and subtract?

I'm thinking of the AVR target currently under review which requires 
TARGET_PAGE_BITS == 8 in order to support the memory device layout.


> @@ -1195,8 +1195,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
>      TCGType ttype = TCG_TYPE_I32;
>      TCGType tlbtype = TCG_TYPE_I32;
>      int trexw = 0, hrexw = 0, tlbrexw = 0;
> -    int s_mask = (1 << (opc & MO_SIZE)) - 1;
> -    bool aligned = (opc & MO_AMASK) == MO_ALIGN || s_mask == 0;
> +    int a_bits = get_alignment_bits(opc);
> +    uint64_t tlb_mask;

tlb_mask should be target_ulong.


> @@ -1099,9 +1109,15 @@ void tcg_dump_ops(TCGContext *s)
>                          qemu_log(",$0x%x,%u", op, ix);
>                      } else {
>                          const char *s_al = "", *s_op;
> +                        int a_bits;
>                          if (op & MO_AMASK) {
> -                            if ((op & MO_AMASK) == MO_ALIGN) {
> -                                s_al = "al+";
> +                            a_bits = get_alignment_bits(op);
> +                            if (a_bits >= 0) {
> +                                if ((op & MO_SIZE) == a_bits) {
> +                                    s_al = "al+";
> +                                } else {
> +                                    s_al = alignment_name[a_bits];
> +                                }

I think perhaps we should be more explicit about what's actually encoded here. 
Eg only print "al+" if (op & MO_AMASK) == MO_ALIGN.  So if an explicit al4 is 
encoded for size 4, print that.  Which does simplify all this code to

+static const char * const alignment_name[MO_AMASK >> MO_ASHIFT] = {
+    [MO_UNALN >> MO_ASHIFT]    = "un+",
+    [MO_ALIGN >> MO_ASHIFT]    = "al+",
+    [MO_ALIGN_2 >> MO_ASHIFT]  = "al2+",
+    [MO_ALIGN_4 >> MO_ASHIFT]  = "al4+",
+    [MO_ALIGN_8 >> MO_ASHIFT]  = "al8+",
+    [MO_ALIGN_16 >> MO_ASHIFT] = "al16+",
+    [MO_ALIGN_32 >> MO_ASHIFT] = "al32+",
+    [MO_ALIGN_64 >> MO_ASHIFT] = "al64+",
+};

s_al = alignment_name[(op & MO_AMASK) >> MO_ASHIFT];


> +        /* Specific alignment size. It must be equal or greater
> +         * than the access size.
> +         */
> +        a >>= MO_ASHIFT;
> +        assert(a >= s);
> +        return a;

tcg_debug_assert.


r~
