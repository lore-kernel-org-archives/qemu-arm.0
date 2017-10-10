Received: by 10.223.197.9 with SMTP id q9csp45406wrf;
        Tue, 10 Oct 2017 16:36:34 -0700 (PDT)
X-Received: by 10.55.148.194 with SMTP id w185mr16480327qkd.354.1507678594498;
        Tue, 10 Oct 2017 16:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507678594; cv=none;
        d=google.com; s=arc-20160816;
        b=FJpzyz0BLXTcEJQxRMgIkSL6hLW+Yfd7n75Z19ljPFA069iKEZUNXtuUIk0RSRqt9a
         P4XWMStThR3SV7BBCBsVvTosNIaukEYzgl7I2u27SSQBHPlL73wUxqEoBw4DY9PE8unn
         ZHphfUgoYaFLoTLoXIhQKZxfbjj15qI/36gBZvYg74INdPQafRHG5YY7QPlfqUZiKpNA
         t6KClzdjyesil43ovCxqn+XrwdoXw4v+Uk753skNHx1kn1oKWOo6Lxb7DIPgjLPDLCEO
         MRXFpAuZvm6IJ7tNw887AnMib4gVCHc+JEr/uZUAmiFe53yDmN1fQLgbgeyryzvHZfA6
         hmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=lioHmKZo6648LvHIRgZxiqDvUXXDH+LreVXUOuPswTU=;
        b=zyNtTkPwBg+Ihj5yNxfy/pAJvSDBMowG/kRRqlfHw6yA7hhtgcuALzZNtmBSh29o9x
         jHZtAaBcs2SwP2MzXq8xITmy0KIOEwvDxs2CrVad3+gXXi1uR5Sg5nqEgE6hbwPtbB8F
         0YLAh47oTZeixIsM5XNPXz8g2f91xB6k4VocvFRlMl9XvrbnRZ13NBJnKkdt5eD095W+
         StbJ+fHSbyt42OQa87IBQHc+RJgXvqn6UIsUN6y7fp0ijsA5ni3p8pGAdsQZwBKkyOGE
         +NP1N6QnCYXleljeiOqejhiyZClD2jZd3eLELoOfXD1T9OX6PAZnng1GfexE+vr9cpNJ
         5WgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PHmFB1AL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x5si5365089qtd.228.2017.10.10.16.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 16:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PHmFB1AL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e244e-000612-82
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 19:36:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e244V-00060W-D4
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 19:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e244S-0007oo-3C
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 19:36:23 -0400
Received: from mail-pg0-x22b.google.com ([2607:f8b0:400e:c05::22b]:48822)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e244R-0007mO-Rb
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 19:36:20 -0400
Received: by mail-pg0-x22b.google.com with SMTP id v78so14986pgb.5
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lioHmKZo6648LvHIRgZxiqDvUXXDH+LreVXUOuPswTU=;
	b=PHmFB1ALRAx8vS+IufQU7dx/5oigW59VgfqgRHdD+inJZrrx9jcbWreHNcnKAGgB5I
	tg+f9KyvJ3UwQCb9U8fn7quSoRxhhZyoH9msdYDBM4G4OVuzFSHUmP4aWO/2uEhbTa7S
	6fWbug/Npw4+qUGaLmCwAEwfnkyWATlkxe6T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lioHmKZo6648LvHIRgZxiqDvUXXDH+LreVXUOuPswTU=;
	b=EsWb3+x3U2TxKv46q0UQJjtnjzcZ95Gl593JfmCThu/tDYWQjMaeflZJTQ8NefsIVY
	lbh0ej2tJ8yH/JSNl/1bI1wSbRrqNLlCpHIQYsTRnG7/QLNmCHNgi5qEsGJHZPdid+G4
	E/3t7q1lLpvcTbK/GxDH7QiLU0Ca+n7JaI1pDcuOXwqFWh1U1KYuMbz6+zkabNn1x/Cq
	gnBm8Fhdg6VjL2W131qfaaWrNubf4CtjBLVPPjpIXsia0FVtcaNftfFJGVLPDc1aZ5OK
	O9Zan7OuZMqG7Lh7nn/kAdS0d1CsfoS8rlKpGs/Wp4JxhLtyFvpeOgeyB+aMhfxrrXQN
	44zA==
X-Gm-Message-State: AMCzsaUp6kPOl/1CCZJ8VEturcCCD0LdXmYe1ecBLd9Fvkj8jMnTcS8b
	xYogPganeNm7rpj1igzsL6qElA==
X-Google-Smtp-Source: AOwi7QAdL8n20EJztE2Iaj//W7KzVflDYY7RTuNG+whEOPdTHgni9jpp5Pa/i7OQ3h+nrrIVgJkuUg==
X-Received: by 10.84.198.164 with SMTP id p33mr13458339pld.89.1507678577150;
	Tue, 10 Oct 2017 16:36:17 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	z1sm20908533pge.45.2017.10.10.16.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 16:36:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82dbe23c-9023-ad60-5386-c29dd4022c54@linaro.org>
Date: Tue, 10 Oct 2017 16:36:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507556919-24992-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/9] target/arm: Add M profile
 secure MMU index values to get_a32_user_mem_index()
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u18KZiMRyEyp

On 10/09/2017 06:48 AM, Peter Maydell wrote:
> Add the M profile secure MMU index values to the switch in
> get_a32_user_mem_index() so that LDRT/STRT work correctly
> rather than asserting at translate time.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
