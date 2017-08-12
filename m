Received: by 10.25.221.202 with SMTP id w71csp2214686lfi;
        Sat, 12 Aug 2017 08:02:07 -0700 (PDT)
X-Received: by 10.237.36.6 with SMTP id r6mr26846343qtc.159.1502550127097;
        Sat, 12 Aug 2017 08:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502550127; cv=none;
        d=google.com; s=arc-20160816;
        b=VONeKmp5t6yTiFzd9CAd59TAsUXar3pcppsAPogSlzZAzp8eUNTUTRaraQHDNl0igo
         ZkOE15NBm5ODLB/gOVuoGTe4KlOSCJ3c6itqrDm1FGng/I9bNRy+PL0Clp9uir8Y2eD/
         tIh1sa+hQy0XwWQGQPqzIftiD/q6SAWA4mV/nwp3uJj8cQZ0aUtK3r60Nv9ewUmiDl1n
         RInmdOyF1/Y4A4V06Fvzm7hl21jGj3fBBA6PWBpEyn9iptmlmFNj4SwCYEdBvu50aO4t
         4KLM5VhRvNDPPdB0q3wVW1HTrw5HPlIJAljHHAOFNhY5SQxUwezprrdnHckNBWmgoCtJ
         8ucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=SzsO6xKjoLv/GZNVCAo2NbcJipTyUYgxDb1PhmGc6m0=;
        b=wMLMVTgTz/3mUzTGmL07lTcawEzXEH7varnMT138/zluX9wto8l21095pbNoUKBz0Y
         4EH+J7/u7n1U1KBL5vvlUQLjM1hUSZiaA62X37Fezj/nWaGq+rE3J0M09F0obTzkfuet
         KYMqaNtnSn52jT7IRBf8waIOxpe8is9Vjcs+N7Pyn/JZV/EPIzOqyLQTBvBoTGOBcBh3
         1x4suTpA8Aj4kerOGUvEj8qPbdorGXe5Wjq95a+JrmHcRtuAVm8UPq64n1t16t3HBAHa
         pFUA07ksom8gOgMN3iHZNVMAiKdc5ipauObFgDwUXwg9m1WfwO0aQvaQtpXv6UMllYvT
         tSYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FjNuOMIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x8si2938879qtx.118.2017.08.12.08.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 08:02:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FjNuOMIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgXvQ-0003cy-If
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 11:02:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgXvM-0003cb-Mk
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 11:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgXvI-0005Zf-2j
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 11:02:00 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:34308)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgXvH-0005Z9-QO
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 11:01:55 -0400
Received: by mail-pf0-x229.google.com with SMTP id o86so26450453pfj.1
	for <qemu-arm@nongnu.org>; Sat, 12 Aug 2017 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SzsO6xKjoLv/GZNVCAo2NbcJipTyUYgxDb1PhmGc6m0=;
	b=FjNuOMIfkFONeTXrhBYRmtqIRfT9+xuqkEJdk3DAtBENEWTJsTKIUegZswNf0McKti
	SpU+TM/8NDh+O3XVMcSLAtgr+GwCuQtvqBVR9KVu+aXU56PHvTKGGeewUbkflvsvSeTv
	hTlCxi44r9qAiaqUeMvkGGJmvldJuqJP6P6uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SzsO6xKjoLv/GZNVCAo2NbcJipTyUYgxDb1PhmGc6m0=;
	b=nvu9sCOVs/WIH4p6rU1Bu6mNEL9bG/YhpWLMEyEP3Finb7bnf7ai1Ci8fWI0bJVQwT
	CSSUBoD/83RHTd7Yc0wAGRm/FcKR+wXKLshztdH1Ey7ect+PUDHyMp8Xh+zGP/uaUwrO
	z+8Y/AWSCfvwyB4GAln73Iq3hLntm/xONnaBkGNJBL4aiKjHKBwO3RF3D0tZtNBvSVnh
	VWinPo7Y40oX8dUubB6UNm61neYYGDQJTZM8FuEbCNKo4z35GN959qa5pEJ8kOL6ksUW
	QLoQUK7wnxjwrcJfnE8JNQd4o5U6hyAKavERwfgKyuh+reB6WhMuc03cox/7/yJKuw01
	L5sA==
X-Gm-Message-State: AHYfb5g9wVDmO9Asy7YmRQHN73n61nQ/r9M1LrRt2ZdM5yTSo62eUCOE
	XaLdeb89xd0XuDRr
X-Received: by 10.84.248.69 with SMTP id e5mr21856252pln.38.1502550113033;
	Sat, 12 Aug 2017 08:01:53 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	y25sm7108429pfk.162.2017.08.12.08.01.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Aug 2017 08:01:52 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	peter.maydell@linaro.org
References: <cover.1502488636.git.alistair.francis@xilinx.com>
	<bc18dddca56e8c2ea4a3def48d33ceb5d21d1fff.1502488636.git.alistair.francis@xilinx.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b916859a-2ce6-24ae-5310-e07651c8acfe@linaro.org>
Date: Sat, 12 Aug 2017 08:01:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <bc18dddca56e8c2ea4a3def48d33ceb5d21d1fff.1502488636.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 3/3] target/arm: Correct
 exclusive store cmpxchg memop mask
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hA2kgkckDRyk

On 08/11/2017 03:17 PM, Alistair Francis wrote:
> When we perform the atomic_cmpxchg operation we want to perform the
> operation on a pair of 32-bit registers. Previously we were just passing
> the register size in which was set to MO_32. This would result in the
> high register to be ignored. To fix this issue we hardcode the size to
> be 64-bits long when operating on 32-bit pairs.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> 
> This was caught with an internal fuzzy tester. These patches fix the
> Xilinx 2.10-rc2 tree. I tested with the fuzzy tester (single CPU) and
> Linux boot (4 CPUs) on the Xilinx tree. I don't have a good test case to
> run on mainline, but am working with some internal teams to get one.
> Also linux-user is fully untested.
> 
> All tests were with MTTCG enabled.
> 
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 245175e2f1..49b4d6918d 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1913,7 +1913,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
>              tcg_gen_concat32_i64(val, cpu_exclusive_val, cpu_exclusive_high);
>              tcg_gen_atomic_cmpxchg_i64(tmp, addr, val, tmp,
>                                         get_mem_index(s),
> -                                       size | MO_ALIGN | s->be_data);
> +                                       MO_64 | MO_ALIGN | s->be_data);
>              tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, val);
>              tcg_temp_free_i64(val);
>          } else if (s->be_data == MO_LE) {
> 

Reading the ARM pseudocode again, especially wrt SetExclusiveMonitors, I think
there are other bugs here wrt 32-bit LDXP/STXP.

Since SetExclusiveMonitors is invoked only with address + dsize, one should be
able to write

	ldxp	w0, w1, [x5]
	stxr	w3, x2, [x5]
or
	ldxr	x0, [x5]
	stxp	w3, w1, w2, [x5]

However, the LDXR and LDXP above do not store the cpu_exclusive_* metadata in
the same format.  Fixing this is simply a matter of ignoring cpu_exclusive_high
for 32-bit pair operations and store it all in cpu_exclusive_val, as the 64-bit
single-register operation does.

In addition, 32-bit LDXP must be single-copy atomic, and we're issuing 2 loads,
this is trivially fixed with the rest of the required changes, but perhaps
worth noting.

I'll post a patch shortly.


r~
