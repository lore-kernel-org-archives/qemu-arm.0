Received: by 10.28.173.206 with SMTP id w197csp3753556wme;
        Tue, 9 Jan 2018 06:23:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBosh1acvwY7NGT0M3kS5qbtZLnFcGY36xELrPi6TZW519T7iLlRtl3oEDEJoFIg5xrZ8AQPx
X-Received: by 10.37.97.142 with SMTP id v136mr1628837ybb.14.1515507789907;
        Tue, 09 Jan 2018 06:23:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515507789; cv=none;
        d=google.com; s=arc-20160816;
        b=Sgro9vDoPhSb6IhUuPtZIiO1WOzVjDMD8IaU975U/OPXIW/k2N3WSAilipclunAeQc
         EmtqeqWq8Zyab6yawY4jw1uwBZweRKl1ikM0cwj+6RtP9dxfL1vIh4Qz/kLCRFZ0YFlI
         XMo3np5YjxJHion44XCqUbF7ygIUwy1XuRTSCVO6cYd958filPor6Q9fzca/fuYNOCog
         e/AaWyl5N7fgJhT8XHxO1XmTFtRYNKLYrOwzg0SFYxOZ8DeYUxYYWlkVvUF5TmDzmXbs
         papvamSQKzcRly0o59fTKeAK6NIaAJ3sLxXyc6FvEuKu1L1FlYXPh+TbX4h7+3tiFwOz
         mtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=e3SkH4fXTSyiYdJVYeLk/L+bzpjRCO1/kSVWe+FMSvM=;
        b=aovYw//1Y3gu2SkOPmzOxbO+iZIQ661q+enXXljZ8O6+l1QpHZrnfVGaY34MSgwEsz
         23qvSagVT6tZBiSuui45C04HJ2ylh9UdXoMCc0MAz8ckgo4MvrD5ZFvGHScWRJllqHNS
         BgKi/ISNurbBoBtDZ7kahE9azpUvzwNSFWVcD7Kmop82wEJj1P8ZBhJRcUPYYLrsSWbc
         3KXfc5w7mIkCjIhaDt402lvDOdlFhUsBju/AZ9rVEHcxHFkNkw8pPaJnUqLrUii5R4Er
         q6gKG5VBugfFiRg70uA6TDp+ZQ0CmBO8IvXycRsMT0R/gbBrxM+x+Eoku9/j/lQFcrqJ
         CF+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RpTG3fFQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c131si3046635ybb.118.2018.01.09.06.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:23:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RpTG3fFQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYuo1-0000Fh-BS
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:23:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYund-0000Cz-Cj
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 09:22:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYunc-0007GZ-Cr
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 09:22:45 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:38402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYunc-0007FA-8t
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 09:22:44 -0500
Received: by mail-ot0-x243.google.com with SMTP id h2so11448741oti.5
	for <qemu-devel@nongnu.org>; Tue, 09 Jan 2018 06:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e3SkH4fXTSyiYdJVYeLk/L+bzpjRCO1/kSVWe+FMSvM=;
	b=RpTG3fFQzxlOosaJZvpOXrYogmn7H8769B7GXewVF8i/LuGRySC/nF5qA5GASAsvcY
	F3Y1T+9MC+sBRH04irw3FYKpGMI7wlZmgdImy6F+lOOFAwGpi4l4sF8mSd/6FoyecIZb
	TUpcKRx+h2iwG7HDiJLv0yaqonmHA2Zc219Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e3SkH4fXTSyiYdJVYeLk/L+bzpjRCO1/kSVWe+FMSvM=;
	b=XGGn4p0Rva4fjpdMNu76YNuMjhn9x8ilpT1GS5znpI3HbHyeSfJ416An+OR+8YRXzH
	+UoDQ9StXpPqoeozMFFJNhC7v+M54bkUjTArSroFG7Jq9Z7eqyGXVWokueYYqb808K8v
	xWTjm7BQn0/s8kRTk6SfaNWBiRwCPTDrkIksF2an0IYdauuKAFih9oi2zA2oek5i/PeY
	8PGIk7jjXfmKWzE6DdwGfHrNGhdbCU/nxtTLjoPOqQUtm+z6qMquESBlNrVxE4kEsVR5
	pWMpU4C2TQa5RydZOIhwsEVStqqefGXZCyPqxQA6Pg1ICN3LhEOi3NIxl71zIdD+M0uS
	Ei1w==
X-Gm-Message-State: AKwxytdUZx36jwKyyHHk4rIScShr7aSCSFIlxtct+bBOiai8lq9nBX2J
	fy8ZJKGucYAkgPVA4ouhBXoaRO1V/FXXlxPJ3eHXOA==
X-Received: by 10.157.2.175 with SMTP id 44mr7912920otl.335.1515507763558;
	Tue, 09 Jan 2018 06:22:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 06:22:23 -0800 (PST)
In-Reply-To: <52515faf-f889-93ee-c0d0-4a895cfb6b13@linaro.org>
References: <1513080506-17703-1-git-send-email-peter.maydell@linaro.org>
	<52515faf-f889-93ee-c0d0-4a895cfb6b13@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 14:22:23 +0000
Message-ID: <CAFEAcA-J4MwnyusPgB7V3LK2c4G-OCJx3ReVO27riM761mv9jg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Du76IZYeavUm

On 12 December 2017 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 12/12/2017 04:08 AM, Peter Maydell wrote:
>> Refactor disas_thumb2_insn() so that it generates the code for raising
>> an UNDEF exception for invalid insns, rather than returning a flag
>> which the caller must check to see if it needs to generate the UNDEF
>> code. This brings the function in to line with the behaviour of
>> disas_thumb_insn() and disas_arm_insn().
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This fixes the odd asymmetry of API that caused the bug fixed
>> in commit 7472e2efb...
>> ---
>>  target/arm/translate.c | 23 ++++++++++-------------
>>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; applied to target-arm.next.

-- PMM
