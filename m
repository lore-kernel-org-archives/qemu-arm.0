Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4459786wrt;
        Tue, 9 Oct 2018 02:30:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60gt+XThpJq1zKepRrS/qeZE7GvUriogWdJsxfee4UA2Ijj6k4ZrQ/5NAXY7srX03j33uPL
X-Received: by 2002:a37:7a87:: with SMTP id v129-v6mr20822282qkc.266.1539077444975;
        Tue, 09 Oct 2018 02:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539077444; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVrUYsuRgNrmYLCS3scIHmk8dXhPmvInp6/ZuQMu2dMwTIjTQJlhW/O3wa9nsdfLNT
         4fDQBG6aLXcm/jA5W/7P64r+VA1razOTX8mIalJ2RPmnPuLKTUFPNWtLbQDPlMlqK7Xf
         vrYdgaxbt2JSAUNqlkhiD6QCqGu+DSAyf0a77Mweqn2X8beB1flO7RfGrHxJv887wIXK
         8HL22Dl98qzJqXzB/rlBH7hUS76YMmRKsJcIerWsd/x6ApDVoYUcNXTfTIqOs1ZDWAWa
         oikR6QG7gXvBnOveG7+KEXigcO31Tdoci7Z7cc3OAdtPSA6vthPOI9LqMosWyUycEjBA
         nVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=en1/8HIZG44kwvLwpF9PIpCE9m0IjxvcPxESVdwOHTo=;
        b=ZKBR6cdC2y8V6Ap/1lgfouPscjMIeBkUul4RtSl/vL2HTwwDt37s3hReytORa9Zo6v
         +xmr2pEl5uy0zjWZ5lc1/A1taLnwn8ys9abW0jPyyXZ56TKBb4GWkx2a8IvxFinn/3qp
         Ghl5J9ytJj/qWNWJbgXfQu7N7iyVEK1DYMo9kuXqtZR2X91qlDDkghHtb0jlPGCk8Tv0
         407v0gip18WdrIpL0RN8EiEqJd8vyKWtP6Rqp6cIFy+mLr6tQbsohIaY1Lc2eki3rE78
         TQHztrZbZhsDIozmUfUfgRTcTiLyvGyEIj5LFOJ4su0I3zEjzrCjq8rcYkpD31jUa0ZL
         Z9cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hq5o91A1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l124-v6si862408qkf.206.2018.10.09.02.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Oct 2018 02:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hq5o91A1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9oLk-0007VF-GJ
	for alex.bennee@linaro.org; Tue, 09 Oct 2018 05:30:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9oLW-0007Ta-UY
	for qemu-arm@nongnu.org; Tue, 09 Oct 2018 05:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9oLV-0003Nz-VP
	for qemu-arm@nongnu.org; Tue, 09 Oct 2018 05:30:30 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9oLR-0003JS-UK
	for qemu-arm@nongnu.org; Tue, 09 Oct 2018 05:30:27 -0400
Received: by mail-ot1-x342.google.com with SMTP id o14so913213oth.4
	for <qemu-arm@nongnu.org>; Tue, 09 Oct 2018 02:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=en1/8HIZG44kwvLwpF9PIpCE9m0IjxvcPxESVdwOHTo=;
	b=hq5o91A131CNgiQJlDIG4V9LliXs6o/KvhYZr6KR5eJvLrwuiP63Rq2KyY56it3E0W
	kvjSKZwGVvvxHPT8KmSZp9yLTyH7Zn7GZTOCTL1DkwnXu30BWe42wOfvRVgjpIrkCDsq
	OqpGlQPkziex9CyZ9FMDcmrytAdCVTm8NnXto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=en1/8HIZG44kwvLwpF9PIpCE9m0IjxvcPxESVdwOHTo=;
	b=b50WRDgLMUheaJxFc+JPchnb/l6lULdXzAEAe9wHxIHK49pxeDRbbjLJ/PbzusfUPt
	UlMvtpdPByLRhGRtz7wBoxoMsvQ0BbiVCa9gmJfiCDT9dBpUO/WiaJR/5lligshz0bhh
	9f7Pk+pIgk52SZwWdktVPzHE9FPrPMcOkUnMGS1482tappnqLbLk73Uv6kXQhnRvEDZc
	JQIJmnktPhFocWERfniTUSDOn6ta08DuYr1Gm0tJOn6W29FwJnGqDVNI1SOpFoZuRyDK
	/6YajVw2NdmqvZQsmaP7G3KqbwreZHTI28nA79AkRNybWeu1k7Koz/VD5wSNpHbQx2Gr
	ms3A==
X-Gm-Message-State: ABuFfoibuzh06aIxXcPvTLqi+7rk5OyPuotKPP3X3lx769KyoL0icEiF
	wNn2tRt83GgaV6ddezOeFriWABI5fIoE1v+Im+vcVw==
X-Received: by 2002:a9d:2377:: with SMTP id k52mr16654176otd.238.1539077422509;
	Tue, 09 Oct 2018 02:30:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Tue, 9 Oct 2018 02:30:01 -0700 (PDT)
In-Reply-To: <20181008213407.GF4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-11-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9b4O4HrMwNTgbZ7JYdO=S3dnzC8ayabBEpKY5=DyBMog@mail.gmail.com>
	<20181008213407.GF4229@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Oct 2018 10:30:01 +0100
Message-ID: <CAFEAcA__7wJ-4mNe3rKe4T+gDUbdBH+rB-DHE+fddmjVzG2=Eg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v1 10/12] target/arm: Add the Cortex-A72
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gIgtu01wcrsB

On 8 October 2018 at 22:34, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> On Mon, Oct 08, 2018 at 02:10:29PM +0100, Peter Maydell wrote:
>> On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>> >
>> > Add the ARM Cortex-A72.
>> >
>> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

>> > +    cpu->midr = 0x410fd083;
>> > +    cpu->revidr = 0x00000000;
>> > +    cpu->reset_fpsid = 0x41034080;
>> > +    cpu->mvfr0 = 0x10110222;
>> > +    cpu->mvfr1 = 0x12111111;
>> > +    cpu->mvfr2 = 0x00000043;
>> > +    cpu->ctr = 0x8444c004;
>> > +    cpu->reset_sctlr = 0x00c50838;
>>
>> Do you happen to have the hardware to hand to check what the
>> top 4 bits of the reset value of SCTLR_ELx are? I think they
>> should be 0x3 -- the Arm ARM says that [29:28] are RES1 (as
>> does the A72 TRM, though its top level summary table lists
>> 0x00c50838 as the reset value for some of the SCTLR_ELx.)
>>
>> QEMU may have the wrong value for A53/A57 here too, I suspect.
>
> I don't have access to the A72s at the moment but looking at logs
> it seems to be 0x00c50838 for both the A53 and A72.
> Looking at "Table 4-118 SCTLR bit assignments" in the A72 TRM,
> bits [30:28] seem to have been allocated. Bit 30 depends on
> configuration inputs to the core and [29:28] seem to be hard-coded
> to zero.

Ah, this is a 32-bit view vs 64-bit view thing. In 32-bit,
SCTLR[28] is TRE (TEX remap enable), and SCTLR[29] is AFE
(access flag enable), and both are resets-to-zero.
HSCTLR[28] and [29] are both reserved, RES1.
In 64-bit, SCTLR_EL1[29:28] are RES1 in ARMv8.1 and v8.0, and
have new meanings assigned in v8.2 and v8.3.
SCTLR_EL2[29:28] and SCTLR_EL3[29:28] are reserved, RES1.

For QEMU at the moment we don't deal with this, and so we
have only the one reset value, cpu->reset_sctlr, which we use
for both the SCTLR_EL1 and SCTLR_EL3 resets. Our HSCTLR/SCTLR_EL2
resets to zero, and we don't allow for the 64-bit and 32-bit views
not necessarily being the same value.

thanks
-- PMM
