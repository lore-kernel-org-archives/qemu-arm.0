Received: by 10.80.163.71 with SMTP id 65csp348661edn;
        Fri, 30 Sep 2016 10:35:34 -0700 (PDT)
X-Received: by 10.55.217.218 with SMTP id q87mr7602579qkl.285.1475256934369;
        Fri, 30 Sep 2016 10:35:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u126si12668821qkc.66.2016.09.30.10.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 10:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bq1if-0003Q5-Ta
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 13:35:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq1hi-00031I-OK
	for qemu-devel@nongnu.org; Fri, 30 Sep 2016 13:34:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq1hh-0006Ug-M5
	for qemu-devel@nongnu.org; Fri, 30 Sep 2016 13:34:34 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:34598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq1hh-0006UN-He
	for qemu-devel@nongnu.org; Fri, 30 Sep 2016 13:34:33 -0400
Received: by mail-ua0-x22e.google.com with SMTP id l16so81829407uaa.1
	for <qemu-devel@nongnu.org>; Fri, 30 Sep 2016 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eIJj8zbptfo3EPA8TocGo3yKyKKzMZO/BLY6DL3qP/0=;
	b=NBAVFLOVLdQho7KpHfgN5MA9yKpoQaYoY49RUMJ4QjuT1gBRGih9aeOARClZSQG5D3
	jYavvTRBUHVmvStvgvPD38iC2e/7IgxXYqvymPtRl5oZHGkJPlZVQroRSKmuqa1PvSny
	Ot6sqNTCOz5TJIjq2TzuHGMjWtjncsw1VgGBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eIJj8zbptfo3EPA8TocGo3yKyKKzMZO/BLY6DL3qP/0=;
	b=mrdHaWen/aUrQ5zgFudqwgrdYj5nIzp9epLwf4DrnzihQcEak4FL5fS/WEyH0Gzu8b
	gnRiKkm5+nselZDVsjF88gerZ2pMlj4Nms4fX5ng3eVZV+h4UNOkJW4eVAsLrKNLiXuf
	bkrqw5t4zdYeo1awkoM/sgFdr4IejnQW5lxCXrdk9BLJAA6rW0og6ijwTIA8tG6DHMiW
	MB2sxyNMpQFTY5YmoT+7q6D7X6NGVkTyRbGrQ2EFKdxevciQaycujMEGwZy6MUAy71Ra
	e2AyrrILjRk9EV5ax53xSAI5sR7d86Gy6MIq0jsq3WY7T1qIBABSBdjR7kR1TVnwkE0Y
	kC2w==
X-Gm-Message-State: AA6/9RmPOdBk67qkSyt4zjWthfm6qCeYEBooM+2lNm2qryb7rufF+DSww91Ju2KX6WZ2ZSNhsABl/27a2PhofFpB
X-Received: by 10.159.55.138 with SMTP id q10mr6180863uaq.131.1475256873100;
	Fri, 30 Sep 2016 10:34:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Fri, 30 Sep 2016 10:34:12 -0700 (PDT)
In-Reply-To: <20160930104909.GD9606@toto>
References: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
	<4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
	<20160930104909.GD9606@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2016 10:34:12 -0700
Message-ID: <CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix decoding of
 iss_sf in disas_ld_lit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u57jRhxpsq16

On 30 September 2016 at 03:49, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Fri, Sep 30, 2016 at 12:42:27PM +0200, Thomas Huth wrote:
>> On 30.09.2016 12:19, Edgar E. Iglesias wrote:
>> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>> >
>> > Fix the decoding of iss_sf in disas_ld_lit.
>> > The SF (Sixty-Four) field in the ISS (Instruction Specific Syndrome)
>> > is a bit that specifies the width of the register that the
>> > instruction loads to.
>> >
>> > If cleared it specifies 32 bits.
>> > If set it specifies 64 bits.
>> >
>> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> > ---
>> >  target-arm/translate-a64.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
>> > index ddf52f5..eae25c3 100644
>> > --- a/target-arm/translate-a64.c
>> > +++ b/target-arm/translate-a64.c
>> > @@ -2025,7 +2025,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
>> >          do_fp_ld(s, rt, tcg_addr, size);
>> >      } else {
>> >          /* Only unsigned 32bit loads target 32bit registers.  */
>> > -        bool iss_sf = opc == 0 ? 32 : 64;
>> > +        bool iss_sf = opc == 0 ? false : true;
>>
>> You could simplify that to:
>>
>>       bool iss_sf = !(opc == 0);
>
> I don't really see how that is simpler/clearer.
>
> I considered:
> bool iss_sf = opc != 0;
>
> but felt the expanded one was clearer in particular as a patch for review.

I would probably personally have written it without the ?:, but
I don't think it's significant enough to bother respinning.

thanks
-- PMM
