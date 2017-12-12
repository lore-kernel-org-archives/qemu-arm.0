Received: by 10.223.159.74 with SMTP id f10csp4094636wrg;
        Tue, 12 Dec 2017 09:40:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBoslhKUsC1L1glA6SLWdPvo5nG2PfRg0i9IoOsq7bnqnHMIt/Axrc6qjsJShhha+VmIEkpuR
X-Received: by 10.13.253.70 with SMTP id n67mr3603299ywf.23.1513100457039;
        Tue, 12 Dec 2017 09:40:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513100457; cv=none;
        d=google.com; s=arc-20160816;
        b=mb7CbousxXDj3INJJCqb5M1V3Vl81EGzyIYz5xCMt2VKdxY6eczYiHnJIeTEAaWuUc
         vpk4lmvgpM7dO4nsV+CQac8C5zXEHkeUeNWTXtJaWICx6zJ5vVqp6HfyVCe0D4Ub76ML
         hmW/45wvzBxUcEY4wOuoWP9/rwJ8FjsJsB2Q3uAkITtkMoxx14FddspVQq/y61zu9EA7
         KLNaecPHHBM31kC8ild23Zr24JkmbuyvQPtGMt4tK20fLEXemhvFBTD8DrFL1W7s9DoO
         D/bFQ+OowsozY7lgVyeS14W8zi08AgnxewkORda/12x+2UqZqy9/zqi5Jf8Yom/kB+cX
         qXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=hkDE1nIijj+kMaBOD/3HmPC2A9os/StNIf5U8L+XMIE=;
        b=F4CStQY8o8A8vFF7dMcAlETrWeNE916QHNuinPsmDJJx+gd/8aSXTPl8/98Du6dexA
         CyQuyw+9Hsuoa/zs99a1dz9AZ/xb+qW6t/rixkbPxxmqbxsyfNpuWQ6lBK1X3TJ2G4en
         6KJZa8BRdLgRLXY0CO1Ajs/cYhe5r1rEXicxVVKhPOlpyDwa+FW7mmS9ERhcoSHXQ8S0
         ia8mWfl3CCEaHVnlbh2IQrKAWcXh1rpCpr7iTjX0oy+AH28aNiI8WMgnCfabSJMy79Vu
         PJ3aHo7bbcyGEllVKG5Ta/iT8YnHohBcpYmlhoGy++AabANw8hF9E8BP4LU4kkqD7g8X
         kmkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V/PrkGG8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j189si3512191ywc.471.2017.12.12.09.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 09:40:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V/PrkGG8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOoY4-0004uB-E5
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 12:40:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eOoWj-0003fQ-6x
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 12:39:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eOoWg-000051-4x
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 12:39:33 -0500
Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244]:34413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eOoWg-0008WI-03
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 12:39:30 -0500
Received: by mail-ua0-x244.google.com with SMTP id d26so14952705uak.1
	for <qemu-devel@nongnu.org>; Tue, 12 Dec 2017 09:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hkDE1nIijj+kMaBOD/3HmPC2A9os/StNIf5U8L+XMIE=;
	b=V/PrkGG879aelFV/LE+O7VEbMDTBHE2Kmua84W0G+hkopbrOgnJ2HKLkxFjFHmmsrJ
	wc6AsO8CKkJTHajhQ4stFzn2du80iTYO9KXcwsdiyUM3hhfBQk3Cn5MrcmfhvWse4kP+
	R1GA1igpEt1vfF0Q4AWeb/UwDLOv1YeXFyEtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hkDE1nIijj+kMaBOD/3HmPC2A9os/StNIf5U8L+XMIE=;
	b=goBYAicyBZ7hxj3SnNuKww2tJOINKpv0zyUCzz8RdfKZFIZV9YFStjLnSthrqlIMpt
	Lf7OZA4ewk6QD79pz+kc2MOK+WyTdjYGRWjZzYUPXs3LqpEukMJh3FW648sb4kgzKwAp
	3Z686h+jes3KtU4QufTqgWvFNr6fJoTWdo1EwCLFPTS1w+Yp2y3wZsGGroMU55wZCNgd
	rNDFfhsAl+8RNGga7Bh+A1pn79Fl7RtipZOMzFY+vmgyiSRoDjoEjwZVJX9ggLdKg17G
	yv4tpGLv3Pj2G8F8v6QvZiOaP4ir1vefUFXaDOPWbtsstJQ7uc4MAPgZ+8nKGVm+o/kD
	JuiA==
X-Gm-Message-State: AKGB3mL3mgfrIu4i74xUbWN1SbqwEftyMH5EpgKF3gy8rm42ZWiFoDsK
	ASNmP7KnQYUGKNc0aN0kB+OMxg==
X-Received: by 10.176.27.165 with SMTP id k37mr5102598uai.36.1513100369197;
	Tue, 12 Dec 2017 09:39:29 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.42.225])
	by smtp.gmail.com with ESMTPSA id
	t88sm4723834uat.32.2017.12.12.09.39.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:39:28 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1513080506-17703-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52515faf-f889-93ee-c0d0-4a895cfb6b13@linaro.org>
Date: Tue, 12 Dec 2017 09:39:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513080506-17703-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::244
Subject: Re: [Qemu-devel] [PATCH] target/arm: Make disas_thumb2_insn()
 generate its own UNDEF exceptions
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HKG8z+yvAhbS

On 12/12/2017 04:08 AM, Peter Maydell wrote:
> Refactor disas_thumb2_insn() so that it generates the code for raising
> an UNDEF exception for invalid insns, rather than returning a flag
> which the caller must check to see if it needs to generate the UNDEF
> code. This brings the function in to line with the behaviour of
> disas_thumb_insn() and disas_arm_insn().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This fixes the odd asymmetry of API that caused the bug fixed
> in commit 7472e2efb...
> ---
>  target/arm/translate.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
