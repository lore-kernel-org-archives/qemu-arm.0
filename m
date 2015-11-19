Received: by 10.182.158.201 with SMTP id ww9csp1942170obb;
        Thu, 19 Nov 2015 05:08:12 -0800 (PST)
X-Received: by 10.31.16.16 with SMTP id g16mr4338533vki.138.1447938492596;
        Thu, 19 Nov 2015 05:08:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si3911003vko.70.2015.11.19.05.08.12
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 19 Nov 2015 05:08:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:41532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzOwe-0004wh-Bo
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 08:08:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzOwF-0004dl-Pn
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 08:07:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzOwE-0005Lc-Us
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 08:07:47 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzOwE-0005L0-Om
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 08:07:46 -0500
Received: by vkfr145 with SMTP id r145so16039712vkf.1
	for <qemu-devel@nongnu.org>; Thu, 19 Nov 2015 05:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EmQ3jiFN8HwLjD1tgsq1P0pDfaDnafrBsUMrNPINQNc=;
	b=T+G2JzguZChqMagyGTLQYB8pzYGEoQ91LWHAekRdHSvoJE0LtaM0NYFcbDUROr3LPC
	clpceb3Rf3tCwqKiEsNoooD5yIf5EDBlyGokh4bd3rcEoYM2Kdr7xcjdXhASLcEFHVXS
	VF9vFSxGvn8nWNoSaExSr1EMRK9i+AAzUe+diSKsn4XBrymbIg5NYF2rvsYkxwkOEAlR
	yKestO+bYcgq29RRqs8ZeR3nZyYJn8SbX+Vnx13w7qLQdBQRM865Om0sAA2AV0Z0a2Gw
	TOHQYG6iP35bUKxrz1/DhsAgXClX6ueiY2FR+Qrcc0i9FGop6xRT69Dk6AoYEoafn59P
	53mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EmQ3jiFN8HwLjD1tgsq1P0pDfaDnafrBsUMrNPINQNc=;
	b=TmrL77zR+Xb4NvVCJO9C7GoJTV8iDGdDfcOdOZCVwVOFit/sYuvOdcT7GCUXqOU7oH
	2INGp/bLZEn6gXE3Zik2ExSja0LejxJgUfKzrCG95e/eMab8gMsT7Pt/OzcRSHYM6OLl
	HhPjrT7bKzPRoJpDEfKkKRiwQ4jvfZN29zxRK0We+4dSr3nY0qyyOv3KPpXcVREtHXhI
	SY/GYFE7s1jxESP/rlwuEBSeNCpZ04kgx2rfFjVzlcDDY0jvtrLlxZFoixvPjABUW11r
	ceb7gFzrFKAHVn24TwheQv3Q1ABlBBye5JVgUsHL2z1YrkonzfpMC47wfDtoa5CRYZ4S
	HaFg==
X-Gm-Message-State: ALoCoQlzB0Rfe9B+CIQgAFmBZHyqAT7td7kGMP/bfh5bUQpSmNcH3pzhB5ml6qJ2hjrhVgjQIYQn
X-Received: by 10.31.3.155 with SMTP id f27mr4363843vki.27.1447938466010; Thu,
	19 Nov 2015 05:07:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 19 Nov 2015 05:07:26 -0800 (PST)
In-Reply-To: <1447767527-21268-1-git-send-email-serge.fdrv@gmail.com>
References: <1447767527-21268-1-git-send-email-serge.fdrv@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2015 13:07:26 +0000
Message-ID: <CAFEAcA8nUr8RM_ZUT=VE2hLwWPBmmGo7pX1_GtQkNrh9x8FPBg@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2 0/2] target-arm: Missed
	gen_set_condexec() in AA32 translation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jRhc5UgGZQCm

On 17 November 2015 at 13:38, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> Changes in v2:
>  * Typo fixed in the first patch
>
> Sergey Fedorov (2):
>   target-arm: Update condexec before CP access check in AA32 translation
>   target-arm: Update condexec before arch BP check in AA32 translation
>
>  target-arm/translate.c | 2 ++
>  1 file changed, 2 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
