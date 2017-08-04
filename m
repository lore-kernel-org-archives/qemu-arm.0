Received: by 10.25.221.202 with SMTP id w71csp2509925lfi;
        Fri, 4 Aug 2017 13:10:25 -0700 (PDT)
X-Received: by 10.237.41.65 with SMTP id s59mr4452110qtd.223.1501877425619;
        Fri, 04 Aug 2017 13:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501877425; cv=none;
        d=google.com; s=arc-20160816;
        b=FaVXgFH64xncpMwYbwLWb5GHey9G7nAP9v/q68oLHayJkfZdBpk20BjkW5BoyRTtkK
         9LFX3/Eks54GorBx4c3BnRad+ssnBVu02Ao44ufQq39IFFVJtY7ep+ciTo360uFHZyf/
         PAF7P4DjsKpRWYnXiFQ6CCCIopWmyZkH/4C+j+nsyjYHw2tRwvCqUVJpxjVFy/xDorzT
         QrvCWgM/oG3zEclZ1o6bXHTAqu8Yx2AT1gncnTqkhJ7+LTst4w2Yr/P6RMehC74S+16m
         X8/jGb/tewfuNf3MQLxvVq7to9XUDr6OXcHv9aCD85RRRXznfr/AImvsEwOvg9qyck1A
         9NcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=pW06FYdLkisvvIt/Jwv6Hr5WLRJKKWmdCmc2tt9AF+Q=;
        b=E75vI9LzqDSlO283qzxSKIc7tQDKqMu79i/SZvYx2+2UleL7VqNcdRdHDlKdHT6caI
         4Ki02H42atyqEGB+P8xVcqoQP/JR+Qqg1heFp3/KRQa/kYAgx7gvImEyq67eZauuzkCV
         nitij+x4Cg1y0zU53Ro3tA2EygGzx//l0ymE2pYCTcfDAtrweg82U/hW1hasTRPBGxEo
         aCbi5d2XxiOfNNo9Ih88aal8BSB8TMxyXcTuUI6IzpcQgpyDLL1/ftgIQzx/JDHfnB9b
         J1UPP9Pv70wGWPZAvtGHYTdHlTLdfNlgI8XOymWHg6/tOY/8SmOI4ym6bkCdelYxMt4d
         Rpfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Qe2V+5Pw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si2306469qty.275.2017.08.04.13.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 13:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Qe2V+5Pw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddivO-0003OY-PP
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 16:10:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddivD-0003O2-Sm
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:10:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddivA-00064Q-NP
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:10:11 -0400
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:34481)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ddivA-00060c-HS
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:10:08 -0400
Received: by mail-pf0-x22f.google.com with SMTP id o86so11735196pfj.1
	for <qemu-arm@nongnu.org>; Fri, 04 Aug 2017 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pW06FYdLkisvvIt/Jwv6Hr5WLRJKKWmdCmc2tt9AF+Q=;
	b=Qe2V+5PwKy1ZpwARxXuE7OogyYdr8lp4ncv1lEM9FUeUJQv+omq3hmxcgvUgmMoEK2
	oKFol0QS1QYm3nDsqMMtuflc1tYUpIOLlD83bGWqdH74wL+fjLrndWmwWZfE5tyHq3jV
	cgXGKjbtFTWqFfctcJy+hpNzZzblPD3UG+puI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pW06FYdLkisvvIt/Jwv6Hr5WLRJKKWmdCmc2tt9AF+Q=;
	b=cgL8USCccyZkrWI7+fjA5q5VK00EcDLB6Q5Um+aT83areghJ4YEkFhUqfoKWlzgVUH
	oadLoWZh27SuhZ16pYDLj5Iqh4/7fHYa5N1gzAHWcPzdK4GZnhEu9OYCYUiI+OLf6AlR
	bbPA4uLqjUQu8X5ntks3s1krr2JBCjd+Kfrb3DMtHePdVIltM9+bMISNV+gNchkyJARo
	nJRsRCexmayW8F3wCMwuwRUx1beN1mzunhuq3opoG6fDbwbojsBm7dvjDFK+5BzmYfj7
	Y+DtxP1qnmx6o1k5hTIAFRee8ghpnnI2Bn3+/B6j5dfNuggQdn89coXhSvmLPQrRIPgS
	5YYg==
X-Gm-Message-State: AIVw112+2qwOjkm2ZdqizqVk1lS6iltlLBojINY6WpDnUI5CkP+cTXhN
	bnmZbpJVxKzQR2tE
X-Received: by 10.99.123.76 with SMTP id k12mr3466056pgn.277.1501877407322;
	Fri, 04 Aug 2017 13:10:07 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	184sm3998423pfg.16.2017.08.04.13.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 13:10:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83c6b830-d15a-633a-c310-e3e541f1a6e2@linaro.org>
Date: Fri, 4 Aug 2017 13:10:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501867249-1924-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22f
Subject: Re: [Qemu-arm] [PATCH 6/8] target/arm: Factor out fault delivery
 code
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
X-TUID: GlLGxmknR5va

On 08/04/2017 10:20 AM, Peter Maydell wrote:
> +    if (fsc == 0x3f) {
> +        /* Caller doesn't have a long-format fault status code. This
> +         * should only happen if this fault will never actually be reported
> +         * to an EL that uses a syndrome register. Check that here.
> +         * 0x3f is a (currently) reserved FSR code, in case the constructed
> +         * syndrome does leak into the guest somehow.
> +         */
> +        assert(target_el != 2 && !arm_el_is_aa64(env, target_el));
> +    }

I see that this is just code movement, but there appears to be a typo in the
comment, confusing fsc vs fsr and the 0x3f reserved value.

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
