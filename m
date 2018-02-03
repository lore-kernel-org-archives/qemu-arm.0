Received: by 10.28.71.27 with SMTP id u27csp893540wma;
        Sat, 3 Feb 2018 13:09:12 -0800 (PST)
X-Google-Smtp-Source: AH8x225Aab4euIkSv9H33F1/JqE5lCu17I+wly2fdqT33gWdXpymJQ6+a6bvvcHv9ldWRHGS2Xfo
X-Received: by 10.37.206.134 with SMTP id x128mr8325042ybe.83.1517692152445;
        Sat, 03 Feb 2018 13:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517692152; cv=none;
        d=google.com; s=arc-20160816;
        b=CCbkHJRJIBfx+pPClc7MuU9kkl5b7+LNU+sbTBbOJ8jRpD8m/tgaK7QH2N/xgdLTmI
         lX+yJTs7RbYxWAUVvkkqqC2GdZipFFi+lxDnpLUDV7+qtZ13d/qUnDFegYxsa9iM5R8M
         TP8do9YzOGrBSnTHs465kIOLd2X10vgM1t7hqXv/uNYVoicitegoZqRaLZhWSOb+m+cZ
         BedlWUDvevt1PptH2XSkOoRlxuJ+L60re9i9ffvqtkrnzkhgQxSeCwhFxTY0CG3yt0Zl
         Q6AaNESWUFRQICq87oitX7CqhesUsD6No7ijTrlxMtgXuSW/LOl5UXdNv6cVaY1HiDRE
         tv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=UQUFAt/++8vQL6oFGpMha7IjgAJHsX6H2bKUeSfXuvo=;
        b=0J0UuDPNaaggx1pX9mMjEAPIA7w/RiZwts7GpnUPq9YS/C8wacN1u7tRyv//AYJ9/G
         b3VIaeSx1r2BKWgMVvf33KMzL1Pew19VaCE4n6G6H7D1nSwkdbttY0irbNZIPKY2gpuk
         smA8BxkesDkivVKoWVr0vxOYFNZO1Wk5ej0hmHkriyFDCiL95dgN+pgEJuU7d2xoPom+
         l09X5C76odNqvG04i9CMEwvhd/Ug14NohqRkym6bhWy8264StwYcKbLRmZiRXrO8Byom
         XPJgy3/E/BIbnHWf8Bf9H3IrM35Fz+beUbZrAUkZAQu7H1UBV5bzuwlB7s6J7bLrwZJN
         Tbbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rm3P+PNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h63si376887yba.244.2018.02.03.13.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:09:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rm3P+PNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei53f-0004va-TH
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:09:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei53U-0004us-NW
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:09:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei53P-0004PU-P1
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:09:00 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:37730)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ei53P-0004P4-Ht
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:08:55 -0500
Received: by mail-pl0-x244.google.com with SMTP id ay8so8960812plb.4
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UQUFAt/++8vQL6oFGpMha7IjgAJHsX6H2bKUeSfXuvo=;
	b=Rm3P+PNOMwdY9nYdxF/JYk5Q1jmnBVpb1EvLbWhMhpwQte/5rqj/s+48+sTLE/BOUi
	ZMm1f40ZppnVwsA0/rkIOSCIJQUK95y4AAeihxKzAD9V0PkZqG3j4eu9Je0kkMR6ceh+
	Am6/f+0/z69SVtLXRc6dzUxaP5o+IB29e7x0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UQUFAt/++8vQL6oFGpMha7IjgAJHsX6H2bKUeSfXuvo=;
	b=n0nF3gwhA/0xsP5irn4BEJE4Lg8IE8IdcukllZd8VyDLKIc4GibY1+oHAmJqQk3XJI
	+mabfyCXRk6y4nK2yfqd2oATEBTy2O9B4GOWmBgOIDvRPa3RGA5BPTLiEpOZSzkqXUo/
	ps7eN6oIr4wK6Wv/h7XdvvCxhBjJr92s1Tk4QED26KG7dKxN91G/eQzvkjNyqsiv30X6
	WlxWb6SWBxDu3jiw/dxjCm0YRDpWLi+7al9QarHuqLJkHTtb9/GVd7krimpGOtDu38q9
	Rm4NMB+2hLxuLmtgbdlc7AHqYmOreVPD2133JmLEAbyx9vRHe8g7MVKob/Fsds/Vu5gj
	kd4w==
X-Gm-Message-State: AKwxytcsTZJNIWqVarcy9H329ZSOoJoPRo965TQG9095Wn/sz2V2Tge/
	nPOEBfjjEZ98X7zbHwwrGoVBBg==
X-Received: by 2002:a17:902:4a0c:: with SMTP id
	w12-v6mr30613394pld.17.1517692134586; 
	Sat, 03 Feb 2018 13:08:54 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	y17sm11299669pfk.67.2018.02.03.13.08.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Feb 2018 13:08:53 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-4-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9825a1c2-6f25-5b4d-c193-bd4f880fb708@linaro.org>
Date: Sat, 3 Feb 2018 13:08:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/7] target/arm: Add
 ignore_stackfaults argument to v7m_exception_taken()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LTLo/oolPvYK

On 01/30/2018 07:02 AM, Peter Maydell wrote:
> In the v8M architecture, if the process of taking an exception
> results in a further exception this is called a derived exception
> (for example, an MPU exception when writing the exception frame to
> memory). If the derived exception happens while pushing the initial
> stack frame, we must ignore any subsequent possible exception
> pushing the callee-saves registers.
> 
> In preparation for making the stack writes check for exceptions,
> add a return value from v7m_push_stack() and a new parameter to
> v7m_exception_taken(), so that the former can tell the latter that
> it needs to ignore failures to write to the stack. We also plumb
> the argument through to v7m_push_callee_stack(), which is where
> the code to ignore the failures will be.
> 
> (Note that the v8M ARM pseudocode structures this slightly differently:
> derived exceptions cause the attempt to process the original
> exception to be abandoned; then at the top level it calls
> DerivedLateArrival to prioritize the derived exception and call
> TakeException from there. We choose to let the NVIC do the prioritization
> and continue forward with a call to TakeException which will then
> take either the original or the derived exception. The effect is
> the same, but this structure works better for QEMU because we don't
> have a convenient top level place to do the abandon-and-retry logic.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
