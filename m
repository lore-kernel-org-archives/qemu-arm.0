Received: by 10.223.150.237 with SMTP id u100csp1229052wrb;
        Wed, 8 Nov 2017 04:37:49 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TCu1tk6yYFRIY4jae1jxhHq6N+aoOkRgLoGVVyyMzRJnsK3uRCtVNSHSVFaVHkfbCHUSWk
X-Received: by 10.37.171.229 with SMTP id v92mr208575ybi.499.1510144669775;
        Wed, 08 Nov 2017 04:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510144669; cv=none;
        d=google.com; s=arc-20160816;
        b=0sxWzAMWNhQtJ18c/9N+BbwXB8NgxgZaYNI/n6A+PFutqkEiiMDGeBI+hkFzEJ3y+L
         Vax43n7F1AinNnFWE4NfuBrLe+mhqWVCKyca3Eb9f+4GxR3s4NFprfvyuPApPAwh9Luj
         YRoOFtIjibQeKR5cSK8bvshwipNaoEzvuHwN1aBlDm77wBsFwDDUPH0E/yEuZjlLzcyX
         kvBAIvptr2RgxANOUF7atklJBWt6EmLNMRaqxqG8QMUFoqAb+SaZxnxvHR98+Z7RUy3k
         FHde2d6itmr+9TkCv0gTO369Q2cA6S77YKEAtTgZ0ZI0ADR3QkddiRhIX0huex8qSjjD
         s7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=5IMo+8EO+DRFrdfjdGkmCayjczUGEoFz+KZfpAv6Eho=;
        b=Syzh/4VMJgHijPIk05sYD/MaTnzhY/Rw5tWz6/eAOJhUd14zfmoUYW1woo5nYQAlBc
         8hW9JMPbpnxIwXVumNHB1Ielcn1j+4BEKNGh65E4EgJL0p4nyxDT16ameXNWFIZdkTYT
         xS8HLGBXKzNGN9F7xXbGdievaiojTxuxhZAUAtRPHDFZidiTLL5d+pJeH/0vb726yl9Q
         A4aYGqT223vpW3+TIhybhTNBxWAN8SLyiM/RUAgSpg/ACoC5mXFsX/uUW6P6dySIW0Xo
         IItYjIzd+EtI5zo7qlaCLuairAbshOanXEFIn08ZWHN3rA++v+eZ/BzcGSTjxZgG5uRY
         g5iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bQlKuQJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h6si876128ybm.152.2017.11.08.04.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 04:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bQlKuQJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCPc5-0004qo-8w
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 07:37:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPbx-0004nd-7w
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 07:37:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPbt-0003fl-Di
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 07:37:41 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:50850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPbo-0003d8-2Y; Wed, 08 Nov 2017 07:37:32 -0500
Received: by mail-qk0-x233.google.com with SMTP id p7so3061224qkd.7;
	Wed, 08 Nov 2017 04:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5IMo+8EO+DRFrdfjdGkmCayjczUGEoFz+KZfpAv6Eho=;
	b=bQlKuQJslIaaZ8GXAzarKFelCPxbe1EBYbWi19TfRBqeuZk+L2kDgWTCOB2wEFw9XF
	N3bl0VDJEYci1iEcL3GwgRSBGqpCetpFhGPPRnMXYixfUawDTs/q85/z3olJhjYISb9n
	F/YtlJEKldpCDGnZv9rfLMbSRDB5A/jffUcRJ/+LKS6jTsqBzvJirg4qRBtBBfxinCYK
	QCbYPv62451nwN027TAh81dvsSCK4hl+KWwmVvslJGba1RE8GyPu1b7C6bHPrBV+2LJe
	aHOiS/t6R3dVGSXySTgx67bac6QAb7krADSBxLtyfD84K+lwXGKgjkLlLO5z/f/Pq0Nt
	5LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=5IMo+8EO+DRFrdfjdGkmCayjczUGEoFz+KZfpAv6Eho=;
	b=fPhWjw66UuhsI05rexHg4+3dyyCEqKq0Qp9VruRvpTLUOaPdv/gMcM3PBkW79VKL0P
	YS78+pYIQ9Bpi+fWgos+i1KKqtDSpDZFr65A52/d3eEgnT4LBs8q7RonqbKPUyiHy7bq
	/WDrfqRT/nYfoQlBGgfmU+ECEMLJIEBpRzhiaq2Tg/TIbFoUj8wJkpBKVJyGhFtzkHLh
	ABenEdXt4rSyy6b02sLPcvCTprHirsv3Fz+dcR7PVMVVXA3NJumNrE8Klcr3/CX7CKLU
	Vi7lp1ttP5SJizOUSo3v/+1tOzdYNuE0/e6TqXAO3p6eUa5IYyYEoutPTBHaQQKfnUlk
	8yzA==
X-Gm-Message-State: AJaThX587VtWqBAQrNvo2X4mUNj6CEdr9S4c8hF22/NHDGyDNXgl/yUr
	FrUBxL7TpPqgssbG9eXgC0RfYQUenqM=
X-Received: by 10.233.221.66 with SMTP id r63mr502959qkf.79.1510144651101;
	Wed, 08 Nov 2017 04:37:31 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id j7sm2555766qth.25.2017.11.08.04.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:37:30 -0800 (PST)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1510087611-1851-1-git-send-email-cota@braap.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <49151b79-7ec4-b728-1ea9-d5c393a5bada@amsat.org>
Date: Wed, 8 Nov 2017 09:37:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510087611-1851-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::233
Subject: Re: [Qemu-arm] [PATCH] arm/translate-a64: mark path as unreachable
 to eliminate warning
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4kImfojmqUkY

On 11/07/2017 05:46 PM, Emilio G. Cota wrote:
> Fixes the following warning when compiling with gcc 5.4.0 with -O1
> optimizations and --enable-debug:
> 
> target/arm/translate-a64.c: In function ‘aarch64_tr_translate_insn’:
> target/arm/translate-a64.c:2361:8: error: ‘post_index’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      if (!post_index) {
>         ^
> target/arm/translate-a64.c:2307:10: note: ‘post_index’ was declared here
>      bool post_index;
>           ^
> target/arm/translate-a64.c:2386:8: error: ‘writeback’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      if (writeback) {
>         ^
> target/arm/translate-a64.c:2308:10: note: ‘writeback’ was declared here
>      bool writeback;
>           ^
> 
> Note that idx comes from selecting 2 bits, and therefore its value
> can be at most 3.
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index caca05a..625ef2d 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -2340,28 +2340,30 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
>      switch (idx) {
>      case 0:
>      case 2:
>          post_index = false;
>          writeback = false;
>          break;
>      case 1:
>          post_index = true;
>          writeback = true;
>          break;
>      case 3:
>          post_index = false;
>          writeback = true;
>          break;
> +    default:
> +        g_assert_not_reached();
>      }
>  
>      if (rn == 31) {
>          gen_check_sp_alignment(s);
>      }
>      tcg_addr = read_cpu_reg_sp(s, rn, 1);
>  
>      if (!post_index) {
>          tcg_gen_addi_i64(tcg_addr, tcg_addr, imm9);
>      }
>  
>      if (is_vector) {
>          if (is_store) {
>              do_fp_st(s, rt, tcg_addr, size);
> 
