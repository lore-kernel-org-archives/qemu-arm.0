Received: by 10.25.159.19 with SMTP id i19csp2595911lfe;
        Tue, 19 Jan 2016 08:33:48 -0800 (PST)
X-Received: by 10.140.155.87 with SMTP id b84mr39726981qhb.29.1453221228473;
        Tue, 19 Jan 2016 08:33:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si38140259qhq.32.2016.01.19.08.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLZE4-0004b5-0R
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 11:33:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZAT-00065H-Lt
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:30:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZAS-0007VD-JP
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:30:05 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZAS-0007V3-DO
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:30:04 -0500
Received: by mail-vk0-x230.google.com with SMTP id e64so14983243vkg.0
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zn6uqfPEPJ3X3in8qttv9RozZTnYmWiYMFGbluq/DcM=;
	b=OYWss0V/ZeY7IvUlIR93W84dEWCbG3dYPdo7c4ABO2obMdy+CEaEx1qqicI+1zrwEa
	npEsukXyJnAPpHvsQ72ANlrxQcAJTXJIG4QFvLyIiFtqBg5N+LZr5DSvLYYgxUHBzvcJ
	bD+Ja7vOvMwFiwUf1a8M8UpVu/FTeY+EeSffM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zn6uqfPEPJ3X3in8qttv9RozZTnYmWiYMFGbluq/DcM=;
	b=kGGkYBgkBoTDjOjaUVdEqc1zh9Ka91OGiHdh9yYBnYh6Va+nGeU76CqR8leXXP1dyc
	XhbwBjdoZjn5kZygeIO05wigQ3W/nWP674sSL9CVcTz4GEvz7OPTsSxuQEh0CsL7inKS
	m6WlFCJJaB9I7oZVWQRAOfyxvYw2xDBQr8PsCxzG7UzyGWBebKVtWLqMIUTrNPh6fK+U
	bFe0U/eXHYE7TeOFXNuxR3+UiMtfnZLWxLyMqMQIgWvhgD9XapNZlbe9LreE3F2GKXzM
	gjaruBjCLOPGV/WqpNFrI10FJSf9QTBXGGWNRbkzMl08hnSR1Am0T5QfRZ8uNrDPiNoJ
	9RMg==
X-Gm-Message-State: AG10YORzhACXKXWNd9hOM4PKLlkNKkHVr8onRWZLFzcAWNMvLogtG9ckAgl+yloX9zWGChF+fNBxzFmPkdpdAZ5z
X-Received: by 10.31.2.200 with SMTP id 191mr5956348vkc.6.1453221003982; Tue,
	19 Jan 2016 08:30:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:29:44 -0800 (PST)
In-Reply-To: <2e141a5f2a5c38936bdf1a06eaeb1a5595f0f833.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<2e141a5f2a5c38936bdf1a06eaeb1a5595f0f833.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:29:44 +0000
Message-ID: <CAFEAcA8StfpT8PSC7d-8Oh-Jqy3LHG=n1uoRExQvrOgaeE+=ZA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 10/17] target-arm: implement setend
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
X-TUID: BeX5uCW5g03P

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> Since this is not a high-performance path, just use a helper to
> flip the E bit and force a lookup in the hash table since the
> flags have changed.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>
>  target-arm/helper.h    |  1 +
>  target-arm/op_helper.c |  5 +++++
>  target-arm/translate.c | 16 ++++++++--------
>  3 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/target-arm/helper.h b/target-arm/helper.h
> index c2a85c7..2315a9c 100644
> --- a/target-arm/helper.h
> +++ b/target-arm/helper.h
> @@ -48,6 +48,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
>                     i32, i32, i32, i32)
>  DEF_HELPER_2(exception_internal, void, env, i32)
>  DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
> +DEF_HELPER_1(setend, void, env)
>  DEF_HELPER_1(wfi, void, env)
>  DEF_HELPER_1(wfe, void, env)
>  DEF_HELPER_1(yield, void, env)
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index e42d287..2a4bc67 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -295,6 +295,11 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
>      return res;
>  }
>
> +void HELPER(setend)(CPUARMState *env)
> +{
> +    env->uncached_cpsr ^= CPSR_E;
> +}
> +
>  /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
>   * The function returns the target EL (1-3) if the instruction is to be trapped;
>   * otherwise it returns 0 indicating it is not trapped.
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index cb925ef..192a5d6 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7726,10 +7726,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>          if ((insn & 0x0ffffdff) == 0x01010000) {
>              ARCH(6);
>              /* setend */
> -            if (((insn >> 9) & 1) != s->bswap_code) {
> -                /* Dynamic endianness switching not implemented. */
> -                qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
> -                goto illegal_op;
> +            if (((insn >> 9) & 1) != !!(s->mo_endianness == MO_BE)) {
> +                gen_helper_setend(cpu_env);
> +                gen_set_pc_im(s, s->pc);
> +                s->is_jmp = DISAS_JUMP;

Rather than manually calling set_pc_im and using DISAS_JUMP, better
to use DISAS_UPDATE, which will do the gen_set_pc_im() call for you.

(Ditto in the other hunk.)

thanks
-- PMM
