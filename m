Received: by 10.223.161.27 with SMTP id o27csp773355wro;
        Tue, 24 Oct 2017 09:32:14 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QLCmSFobpB+kQZZJQXt9QBkpKA+lAaPZnxRNMZU9mMwMnB+EObdMu0VNN+2ehcsHnjVVAq
X-Received: by 10.13.197.6 with SMTP id h6mr6538333ywd.363.1508862734127;
        Tue, 24 Oct 2017 09:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508862734; cv=none;
        d=google.com; s=arc-20160816;
        b=pMrh1H+iB4drxxnvfNaynMFZgvbUiawzWZPOfsyfay33b1O/muO1evaZnEb91AvQAw
         SO64DIlmTHheBaMZ/X4ZR9rcC43FVyJYo8LeL7wqzVRjUSv3lNpSQb96ydDYYBFrzOat
         LGnFjcaZTussYARM7Sr37e5AL8KbqmibSwHE2Q6Ee91AWIrxRaRMo7FFp0Wl5Vlf9ZWQ
         dD9doBwD2XZWyqyHg8fd9ADbNfp316QNC9jKRhBFWv4vc97XdY6KcgKZ+JTqUXSwVXJP
         UiC7BLW0IbOO3DcsgtdShLCxusgHtSWGdhbw/y3wVVPqeK+0TMWd1q7f01bqFBbsdBnI
         8V0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QmGNPdOcodScTX3OcTbodDpyVdbapA04eZeRNVqiTt4=;
        b=Xx6aUXkAUJAc53pvWed/dGRyNtdlV2HgVG3DQTHBxEh0hnz+Ubpy6ANZz9VyhX7OcR
         inf3a3BE3gGaM/bdct7UXqRmkCSrIxT8PMtqz4NNvzRhplDZX2XpK1GA1SW0bEAfcqxA
         5z1nE7KLluuCuEPx1u1Z2djJY58jeswCvuNUbdONtHBnDeJ2eaKuxhTsKXAmuEV0fNwC
         GOt0OUoEhGnjWNMiru6xoiM5OTfJXcmGsRjtqiw7T0xPsSb0H9vqGHqakdu5W1XXi48x
         pHXgaA+Nssad0Q9n59R0UKTjNAM12qVY0FnS/bzkGE0PIuGuAQD9TKuus3SH+WlN06gJ
         ONrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XFwuf7P6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o69si97992yba.520.2017.10.24.09.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 09:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XFwuf7P6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e727h-0006IM-LP
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 12:32:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e727b-0006I1-0X
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 12:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e727a-0003ai-5z
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 12:32:07 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:52187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e727Z-0003aM-Vg
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 12:32:06 -0400
Received: by mail-wr0-x243.google.com with SMTP id j15so9151137wre.8
	for <qemu-arm@nongnu.org>; Tue, 24 Oct 2017 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QmGNPdOcodScTX3OcTbodDpyVdbapA04eZeRNVqiTt4=;
	b=XFwuf7P6iS4e3+3QRiKN0OdBlxkN7bpHKhNpWLkA89mWNi0WilKBpDFzwaoHrjt8T0
	t/Yu/qVt3SWskVOiQ2y05/+yij0LHd3YMQE0My39zm8uQqllbMpaAjze8hUvsGAOBO/2
	Lv8Lt4S5gG+arlMDgwHrzAA8bBpSxExkcWMCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QmGNPdOcodScTX3OcTbodDpyVdbapA04eZeRNVqiTt4=;
	b=AuuvKpGtkiwucJYVXBOaktclckqk660Dn5EFPNrvRNg5cGZbOq162/5W01ex8r12MH
	K61TCU3g7OATNQJwKyRowCra6kcN8lSQwdEpi1NGjapn+jpjTbwDqtgUkauea2c1qU6Y
	c8zJQ41G97y3kkAiSUBhfxwLWrw2PAg2MO7T7HU37TeGTCdRhS6iYgogeYcLOT7vBaoc
	Zf52HmnTvhAtF55LXKBMqAjEnuHWX5OwPBsh1Ihpljd9Xvqt1N/0pyYvqa9DUmR1Oltb
	x5TdXq/uje5efvmGoO4ZbYUPP/7eRp37pgR1X8TfkmQM078GJJRzVzUyg4jxsiFI+kms
	1gAQ==
X-Gm-Message-State: AMCzsaWmlVjZ6Sw3PF+s8POEpe9czbZXh+V8PMIJdoPrsELNMfq0lx17
	R53pRraaMSjR6E8pZ/8/t1PhTJHiUUjg8iuejRR9iA==
X-Received: by 10.223.151.198 with SMTP id t6mr15502225wrb.2.1508862724936;
	Tue, 24 Oct 2017 09:32:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 24 Oct 2017 09:31:44 -0700 (PDT)
In-Reply-To: <CAFEAcA_-b5kb=_jDeDbCGugmzvcuUGKvWV0myThVJuTDbg9jNA@mail.gmail.com>
References: <alpine.DEB.2.10.1710211105550.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA_-b5kb=_jDeDbCGugmzvcuUGKvWV0myThVJuTDbg9jNA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Oct 2017 17:31:44 +0100
Message-ID: <CAFEAcA9Zcm4tEbYXJhsp=ZDCoQDZjd53XuM6T+cxfL7fj5QxCw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [PATCH v2] fix WFI/WFE length in syndrome register
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 86Ce2i17y004

On 24 October 2017 at 16:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 21 October 2017 at 19:09, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 4da1a4c..a89518f 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -12325,12 +12325,15 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>>              /* nothing more to generate */
>>              break;
>>          case DISAS_WFI:
>> -            gen_helper_wfi(cpu_env);
>> +        {
>> +            TCGv_i32 tmp = tcg_const_i32((dc->insn & (1U << 31)) ? 4 : 2);
>
> This won't work, because dc->insn is only populated by the translate-a64.c
> A64 translator, not by the A32/T32 code. I guess 'principle of least
> surprise' suggests we should populate it for Thumb and ARM too.

...and also, this code path is used for both A32 and Thumb instruction
sets, so just looking at the top bit of dc->insn isn't sufficient, because
you might have the A32 encoding with a cond field with the top bit clear.
You can either look also at dc->thumb, or alternatively have a new
field is_16bit in DisasContext which you populate in arm_tr_translate_insn()
and thumb_tr_translate_insn().

thanks
-- PMM
