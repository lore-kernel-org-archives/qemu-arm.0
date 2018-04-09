Received: by 10.28.71.155 with SMTP id m27csp3052827wmi;
        Mon, 9 Apr 2018 15:13:38 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/0WlJS9p/Nxt62+W3e/eixvkmOVIxfN5C53hiYBFJv2SGbzzjeQT1v8UwR/7kCGOvazGvH
X-Received: by 10.55.75.205 with SMTP id y196mr52973939qka.44.1523312018827;
        Mon, 09 Apr 2018 15:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523312018; cv=none;
        d=google.com; s=arc-20160816;
        b=QgRW/KqepbD7bX985/pXu55q4MZeBbXJ56/M3RC3rSw0hN7QFUgCbgwhyPspeuaBV1
         mn3tIkkb5JJ5SPuYP3qOtqwa/I68sR6AzHZsKgfwHvThnhUpY0E0DcCAIm/FVRcIvMCg
         eD+odHXV+xvSASEU76wUxBpHlGtreEvh5Pw6p8GFdAZmxAAxj3XLKV4CSMNsjyhYoc+Z
         XmiyuZ2JKhap+HZyQ+V4QpyGRXpUeOpGtwI4jOkHSRMJxhiPP8aBTU3L0zqQk9NYPqRE
         3CutYPNfs+O9Xc2oFuj2/ke+lCrwAwPT+laFECh2fbNNbVp8PI5cuhVDBlun2/eoN0x8
         oT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XsQZxoFPdWwkO2fz0soy98qsAgyDofbvLC9aYDxvWk0=;
        b=kg3Gd+RcifIB/EVzg3pR5ugpqVxBWUVCmMYLt0pKV0L9/nCnml7NNPeBbnVq51tUNJ
         U260kUJ/bgAps+VHuJTGtti8bYZPmqcAZA1xPIKjW2ZSfINynj/aLT/ZfKbOcQErmSY7
         8KHZkzA+s/FGWwRMThMPnBPZixZQy50fYO4ofC1neqOvO+zgmj+2ZhxnGSbJ0fg5rWDj
         kU7p5h5QwXQKRRbR5JN/MxmL1moDGnSqe2NKNRc37Nu/6nggcLa8e29U3z+3xDNbXmeL
         x4+HwQ+50iFU5XXDgvwYuODbMCS1O7+SwFjLz0BLauEcGdycFsJZp+ZhJhl1N6BvWNpO
         hG2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MD52BUxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s123si1530659qke.479.2018.04.09.15.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 15:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MD52BUxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5f2g-0007hu-Bn
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 18:13:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5f2U-0007fm-VG
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5f2U-0003SY-4h
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:13:26 -0400
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:43398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f5f2T-0003S6-V6
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:13:26 -0400
Received: by mail-ot0-x229.google.com with SMTP id d9-v6so8260049oth.10
	for <qemu-arm@nongnu.org>; Mon, 09 Apr 2018 15:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XsQZxoFPdWwkO2fz0soy98qsAgyDofbvLC9aYDxvWk0=;
	b=MD52BUxMbYCkZ4zazMGmZr7roJpjgbYzaEC4lWUHrz9LnGXN/U8U3wGoSjx8R7r1qR
	i3WXluItyLnoiebQVxbzHrLn0tubHFqq18SvA6lWrvWZtGQTKIu+Gjwoi9lFmLQgVxtb
	n59ti/uTRkFBaPgbdZDhjsFCQ3axgDXdVvB44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XsQZxoFPdWwkO2fz0soy98qsAgyDofbvLC9aYDxvWk0=;
	b=pkY2QFNDhpAxAZCwskvtDR/X1funWn8zcU7e1G7oMlmQldvAvidAjBgma3lkJ16aVa
	LDKDihVjowdnMkn4IRoHFelMtZ3YLu6k23vLqRbrjlxLlm9Ucc2SwxxrCpRGIWxYQuMx
	KmrkOf6p+yqRsT+EBlWZ4pJz6Owjd69snduRPGLx+Z9z1K8ug+ZFpYLAN0XzPVhV+mNg
	CeAijK+HuC1bikF7aPts4vTJP89q8WLgjaGluNCExlMQN4ybr/6A+ACl43MrRdZzvw1/
	QcQtQIE6zkvWH54oPnMiTtHjoVGwgJC0Epb6Ddzzgcx1F5qBXyscA2C4qR1+2ugCdJ3X
	0dPw==
X-Gm-Message-State: ALQs6tC+VsGZdx+/3LJkDn+CWiOwfEXtyaJDb9EGu92lN15jQoA4T2YL
	r2ztSJL+93XOpiCYLIUMgIJQaucVCvdZC3dCg03AvQ==
X-Received: by 2002:a9d:2129:: with SMTP id
	i38-v6mr26036197otb.210.1523312005380; 
	Mon, 09 Apr 2018 15:13:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 15:13:05 -0700 (PDT)
In-Reply-To: <1f4f8003-09ed-b2f7-5709-6b74c0fa2f7e@twiddle.net>
References: <20180409103834.11285-1-peter.maydell@linaro.org>
	<1f4f8003-09ed-b2f7-5709-6b74c0fa2f7e@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Apr 2018 23:13:05 +0100
Message-ID: <CAFEAcA-35aH7KnFK+vkSAWf0i2oz44E-ov1eP0+TUfpOxdYxxA@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-arm] [PATCH for-2.12] target/arm: Don't corrupt
 insn_start arguments on 32-bit hosts
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
Cc: alarson@ddci.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zXD6Nrtmn6uN

On 9 April 2018 at 23:09, Richard Henderson <rth@twiddle.net> wrote:
> On 04/09/2018 08:38 PM, Peter Maydell wrote:
>> +#if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
>>      tcg_set_insn_param(s->insn_start, 2, syn);
>> +#else
>> +    /* tcg_gen_insn_start has split every target_ulong argument to
>> +     * op_insn_start into two 32-bit arguments, so we want the low
>> +     * half of the 3rd argument, which is at index 4.
>> +     */
>> +    tcg_set_insn_param(s->insn_start, 4, syn);
>> +#endif
>>
>
> Ouch, good catch.
>
> I think we should fix this in tcg_set_insn_param instead,
> as several other targets are also affected by this.

Are they? My grep didn't find anybody else using
tcg_set_insn_param() except the gen-icount.h code,
which isn't using target_long arguments.

If we can fix it in the tcg generic code instead that
would be nicer than an ifdef here, though.

thanks
-- PMM
