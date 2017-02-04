Received: by 10.25.77.65 with SMTP id a62csp1033085lfb;
        Sat, 4 Feb 2017 06:14:27 -0800 (PST)
X-Received: by 10.55.146.67 with SMTP id u64mr1880925qkd.37.1486217667777;
        Sat, 04 Feb 2017 06:14:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si21423533qkl.167.2017.02.04.06.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Feb 2017 06:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ca16h-0001yl-5e
	for alex.bennee@linaro.org; Sat, 04 Feb 2017 09:14:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ca16a-0001wT-8o
	for qemu-arm@nongnu.org; Sat, 04 Feb 2017 09:14:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ca16X-00032z-31
	for qemu-arm@nongnu.org; Sat, 04 Feb 2017 09:14:20 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33406)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ca16W-00031m-RL; Sat, 04 Feb 2017 09:14:17 -0500
Received: by mail-lf0-x244.google.com with SMTP id x1so341152lff.0;
	Sat, 04 Feb 2017 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=J9q8qJ3I3oOink6L+h488z7hoROZk2IUYY0Gv+1Mzlw=;
	b=Hlmm2z9eXv1c9SHM6swR1Y+S6DGEBoPtFlOPuUmlqHu2E/U9/0t7feQbtsUdapRwK7
	xyP9WbRSLQOE6UmuWxepGFtMNZoaPM+Xg+aY7iYL6gX4EVEdK4GAa8LNRMqf0HHAOYYg
	aI4zX7v5xfnJJyBjxan4QKDsbMYI8IBIYHAKZ1Cetuqh/Qo3AAF8P/l7tEM7R/gbYyqA
	NAgj3p+SyfJ9fSi/67i3ur+Au5Y5s6RH+RX1ZucnAPoJSGkjP8bAE7jmvBEwJ6sPN+fJ
	Ip0SS3CkGomhkdaBeivyXZbzP8rU2Mdd7dq08PIO+m66V7NWiPoXNUMNTKNmRt61J0x/
	t/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=J9q8qJ3I3oOink6L+h488z7hoROZk2IUYY0Gv+1Mzlw=;
	b=qzwO79rzLM9UYdKMkGTMSXgKFHSEA1mBKqwtkw3sQkrYe5FFlFNzhZXpMkwvrME+l9
	rSTqOJMED0TW5KfSsY27NLI4nprSTdwIRsXMVcEaBYYk02ZodRfINvrtaHtBS/b9HeNd
	XQyTEgV7seC3lgiwIjrWvenTQqCRhl2u+GUyWlVlqwQvJQtAetLKJSUIWynxBebcRJHz
	NjqsRBKH7hhDl+MOW3Eh1uTnwf/4G0PLQ+VFeASbdSrgbzxaUGdNKaCxt57uo8C2I8/a
	9dLcwZIVZe3Z99OL2qoseQNtQ3xT3Lkdm5RGyWoUGRuA83bZHbItdEqJG786I11oH6wz
	DZpg==
X-Gm-Message-State: AIkVDXJJyYwoAtBCV//uPouyqMn739GtlhkNoxzdKQENYjv/2pYb6iKRjUt4uZleStq1OQ==
X-Received: by 10.46.32.31 with SMTP id g31mr833860ljg.32.1486217654949;
	Sat, 04 Feb 2017 06:14:14 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	f133sm8690296lfg.32.2017.02.04.06.14.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Feb 2017 06:14:14 -0800 (PST)
Date: Sat, 4 Feb 2017 15:14:13 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170204141413.GO9606@toto>
References: <1486144135-4894-1-git-send-email-peter.maydell@linaro.org>
	<1486144135-4894-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486144135-4894-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH v2 1/2] target/arm: Abstract out pbit/wbit
 tests in ARM ldr/str decode
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9YM8rUGC7tx8

On Fri, Feb 03, 2017 at 05:48:54PM +0000, Peter Maydell wrote:
> In the ARM ldr/str decode path, rather than directly testing
> "insn & (1 << 21)" and "insn & (1 << 24)", abstract these
> bits out into wbit and pbit local flags. (We will want to
> do more tests against them to determine whether we need to
> provide syndrome information.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/translate.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 493c627..175b4c1 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8782,6 +8782,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              } else {
>                  int address_offset;
>                  bool load = insn & (1 << 20);
> +                bool wbit = insn & (1 << 21);
> +                bool pbit = insn & (1 << 24);
>                  bool doubleword = false;
>                  /* Misc load/store */
>                  rn = (insn >> 16) & 0xf;
> @@ -8799,8 +8801,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                  }
>  
>                  addr = load_reg(s, rn);
> -                if (insn & (1 << 24))
> +                if (pbit) {
>                      gen_add_datah_offset(s, insn, 0, addr);
> +                }
>                  address_offset = 0;
>  
>                  if (doubleword) {
> @@ -8849,10 +8852,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                     ensure correct behavior with overlapping index registers.
>                     ldrd with base writeback is undefined if the
>                     destination and index registers overlap.  */
> -                if (!(insn & (1 << 24))) {
> +                if (!pbit) {
>                      gen_add_datah_offset(s, insn, address_offset, addr);
>                      store_reg(s, rn, addr);
> -                } else if (insn & (1 << 21)) {
> +                } else if (wbit) {
>                      if (address_offset)
>                          tcg_gen_addi_i32(addr, addr, address_offset);
>                      store_reg(s, rn, addr);
> -- 
> 2.7.4
> 
