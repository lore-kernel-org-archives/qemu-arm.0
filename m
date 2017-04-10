Received: by 10.25.0.144 with SMTP id 138csp941650lfa;
        Mon, 10 Apr 2017 09:29:41 -0700 (PDT)
X-Received: by 10.200.55.168 with SMTP id d37mr7769780qtc.281.1491841781578;
        Mon, 10 Apr 2017 09:29:41 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188si13876738qkh.308.2017.04.10.09.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 09:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxcCA-00010y-SQ
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 12:29:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxcBO-0000jM-C9
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 12:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxcBN-0007mX-GH
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 12:28:50 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:35621)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cxcBN-0007m9-AH
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 12:28:49 -0400
Received: by mail-wm0-x22a.google.com with SMTP id w64so43550436wma.0
	for <qemu-devel@nongnu.org>; Mon, 10 Apr 2017 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oFMRzbKfAaJx7z+p3zm+JaMC4fvquTO8eqo4al+4Jgg=;
	b=FfDIZ4RRGIkcatYQePtM2y7M86cPWJB2EhfbbnL2EgkmEBSYEYyjvceLvZrhITf8+C
	nNlwX2dHJcHlnyrHxOcSuCOrJpcf47k3lHYf5b+99bYoVUZmG5KolNszcSdBRNTmkkHO
	66bc7oPkqTqYgpfgcmaIaAi1KGPf/HyuHM2Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oFMRzbKfAaJx7z+p3zm+JaMC4fvquTO8eqo4al+4Jgg=;
	b=cGXuG5emSSIyprkjLe/funRLNHktqaQSfRfnrkhn7IBXN0XdA635Xk8CM0M/pZpQTz
	ExotoxGwCKlc3WqBSNh/TW2ObYodfp9xm2Oj19r+j800xE8ceOpP7+TDUwM5fmPNAeEL
	tfI4Lbuv1zgbjgwzOQ30ew2z5gR4caL/pqcXUmukI0hQWtc9i3GcWoa77CI1Ml1gSfJC
	Pi8gV5U7lbkxcqrPAqogEEDZzljiACEg27BZwY+sdAXH/viMFINvfSagjn4s/0skXJlv
	g/KongTf7uv/sCcMsGMxS0ScnfkLCu2oSv12xDBDl9w8GtGT2GXI88+921+nkOhY9eJe
	NCGQ==
X-Gm-Message-State: AN3rC/54Ye9zuDbWcIcyJZa3Q6NWCm25r1M+Xlkuu9G1DaC+p946V2sUA0X3GADRhlDfAA6HEv6fUhJpqseKRqYD
X-Received: by 10.28.236.210 with SMTP id h79mr8155571wmi.92.1491841728064;
	Mon, 10 Apr 2017 09:28:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Mon, 10 Apr 2017 09:28:27 -0700 (PDT)
In-Reply-To: <1491820793-5348-7-git-send-email-peter.maydell@linaro.org>
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
	<1491820793-5348-7-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Apr 2017 17:28:27 +0100
Message-ID: <CAFEAcA9A60tdpYTPbm36+i2uo6E__5EjtRWu_Esnx5uASDsZ6g@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 6/7] arm: Implement M profile
 exception return properly
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: motOe/+J+vYi

On 10 April 2017 at 11:39, Peter Maydell <peter.maydell@linaro.org> wrote:
> On M profile, return from exceptions happen when privileged code
> executes one of the following function call return instructions:
>  * POP or LDM which loads the PC
>  * LDR to PC
>  * BX register
> and the new PC value is 0xFFxxxxxx.

So this isn't quite right -- the special behaviour happens only
when in Handler mode. (Handler is always privileged, but not
all privileged code is in Handler mode)...

> +static inline void gen_bx_excret(DisasContext *s, TCGv_i32 var)
> +{
> +    /* Generate the same code here as for a simple bx, but flag via
> +     * s->is_jmp that we need to do the rest of the work later.
> +     */
> +    gen_bx(s, var);
> +    if (!IS_USER(s) && arm_dc_feature(s, ARM_FEATURE_M)) {

...so we need to track "are we in Handler mode" (ie
env->v7m.exception != 0) in the TB flags and test that here
rather than testing IS_USER.

(Otherwise if you have code which executes the same 'bx' instruction
both as a legitimate exception return and as a fake exception
return while in privileged thread mode then we assert() in
do_v7m_exception_exit. I have a test case that does this but no
real code would ever do it.)

thanks
-- PMM
