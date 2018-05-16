Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1333366wme;
        Wed, 16 May 2018 09:39:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpqsainpBNJd0jAAMyT558TqaCHvPlqZ7QoDb7KNfe7KaesSpDsaI8hmujfgEwOrT6BbWPY
X-Received: by 2002:ac8:1752:: with SMTP id u18-v6mr1763200qtk.177.1526488798267;
        Wed, 16 May 2018 09:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526488798; cv=none;
        d=google.com; s=arc-20160816;
        b=FFy9jrpY0+4cSYwdh8PP7gPU5H7uLSA0KSGiCEpMJR7EBgMeSha0eXHXP1IQ0UbEEl
         P1a/lg1shlo6f2IdI8SHYXr8QHFgjnGVfxWPBuaPFmd9wYDGMawVyKLWFYGH8hNRy7YY
         ZZYaLt7hx5ie0q9x7lBbznVOYTHOFqyQ5gvbMWJIRSWayrk1ReMgJNCT7yRnFzTsz8or
         qYOOCrC8LOhwE0iyl+Bi97I8pIXjzR+Z1picdvSRtZMwgYkRDt5gJs8289y4g08vOxEE
         YgN0HGu6Xp7BU+fjTr2U45UVVf16Ia1KXPiiEvVnybRGTLbHUSsXyVXqRuayT2EFMLC9
         /xQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=DVUzCSajGfac5jPPOXqfL9WmFgAxg8BGs6gXtUjX4uQ=;
        b=eD48znOVQAFwIBkjWtcAu5xrcA2N9Jse//wV+Zy8iEDsEFtgSQqBZVa2I/JPi5zuDB
         u1eeDfQU94w/LzOcYOlDhG5M/0XpENG3qf/X9YBQ80Qqxs8lRUnOyaHTACLp8fyuuku/
         mn3VF5CFD/piMPSOhGNlixAM/hXQg+ZSCWFL0Qls4eKImyTUz/fnCn8P2qomGGfsn2VF
         ElxdLdaO/YWmYMjVZhCtWvISXZPJgUvPlbH027Bao6gGIltJtK1elO98tkcN6FIw4vqT
         lLlSG/nfjNCcW9d5CsdadvHuxSzmnzxxGHVG+CLNKzYHNb4xmJekxXJYpjs00HRZxZSI
         kklA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=guC0u9Fo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2-v6si3059909qtj.183.2018.05.16.09.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 09:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=guC0u9Fo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIzT3-0008C2-QU
	for alex.bennee@linaro.org; Wed, 16 May 2018 12:39:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIzDD-00045g-J5
	for qemu-devel@nongnu.org; Wed, 16 May 2018 12:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIzDC-00056r-Tk
	for qemu-devel@nongnu.org; Wed, 16 May 2018 12:23:35 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:33405)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fIzDC-00056Z-OI
	for qemu-devel@nongnu.org; Wed, 16 May 2018 12:23:34 -0400
Received: by mail-oi0-x243.google.com with SMTP id k5-v6so1275542oiw.0
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DVUzCSajGfac5jPPOXqfL9WmFgAxg8BGs6gXtUjX4uQ=;
	b=guC0u9FooJ40FxPRrohdFfkv0AQ6YcCqf4yYFbUfvcTndziX77dhmVx7T3NjEmSfTp
	oNfEAKNcVoEPiRZJRapaRPUAzZnsjDHMf8PaWY0Ri35HgciT0/gTSmb3FMejtjH8RLzo
	EwITyHDMMvUw1AInt6/C/EOWbcKaALjtRPYVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DVUzCSajGfac5jPPOXqfL9WmFgAxg8BGs6gXtUjX4uQ=;
	b=rgBoGIWV4pn3K9icF+9aOUurmUDVCsxG/zEQXCyz8N9/NS2nOP+UaEt3lTvoCCwmYp
	YC8XtSjORWr6wbSSOFJWtibR3h6k81I9c9ereSdlCGTyLP+3MObizFGfbcP/vhIkoedW
	vbCWbKrrmftxu47MmAj6XUIk1ehWMgkLwFmOqRGXdxTb8dHet/AGP8jhf7xHkTuFpEb7
	T+zC+6Pu7Nt56iGx4r7HdIJvugboAW/QKzZOAKk6tFUCJ3xegg3ZIo1hfvZYvLdXT+7A
	VmtXttRak0aSIKO5PUrMyhNzvvOhMOdqAWbuXFvYe79bJHiwgq79Stc8Rf/irlIlSQn7
	qXFg==
X-Gm-Message-State: ALKqPwdw/MqAMXpiRn4zaxxucFpwZl/14ewygifNwYSCEZFz8M4killX
	k8vThzPQoA8xsJA37OQvNasjlP6bJGrkImYaYZsLPQ==
X-Received: by 2002:aca:4ac7:: with SMTP id
	x190-v6mr943183oia.11.1526487813860; 
	Wed, 16 May 2018 09:23:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Wed, 16 May 2018 09:23:13
	-0700 (PDT)
In-Reply-To: <2c55370d-fa43-12a1-5baf-ec7cf824c0dc@amsat.org>
References: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
	<1526493784-25328-3-git-send-email-eric.auger@redhat.com>
	<2c55370d-fa43-12a1-5baf-ec7cf824c0dc@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 May 2018 16:23:13 +0000
Message-ID: <CAFEAcA-GxScM9StKESYAqJ2sbiSH+hWjJXvF7COjJPojs5J5QQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 2/2] hw/arm/smmu-common: Fix
 coverity issue in get_block_pte_address
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5GuM7LK1TxBK

On 16 May 2018 at 16:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Hi Eric,
>
> On 05/16/2018 03:03 PM, Eric Auger wrote:
>> Coverity points out that this can overflow if n > 31,
>> because it's only doing 32-bit arithmetic. Let's use 1ULL instead
>> of 1. Also the formulae used to compute n can be replaced by
>> the level_shift() macro.
>
> This level_shift() replacement doesn't seems that obvious to me, can you
> split it in another patch?
>
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmu-common.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 01c7be8..3c5f724 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -83,9 +83,9 @@ static inline hwaddr get_table_pte_address(uint64_t pt=
e, int granule_sz)
>>  static inline hwaddr get_block_pte_address(uint64_t pte, int level,
>>                                             int granule_sz, uint64_t *bs=
z)
>>  {
>> -    int n =3D (granule_sz - 3) * (4 - level) + 3;
>> +    int n =3D level_shift(level, granule_sz);
>
> Shouldn't this be level_shift(level + 1, granule_sz)?

No. The two expressions are equivalent, they're
just arranged differently:

   level_shift(lvl, gsz)
      =3D=3D gsz + (3 - lvl) * (gsz - 3)
      =3D=3D gsz + (4 - lvl) * (gsz - 3) - (gsz - 3)
      =3D=3D gsz - gsz + (4 - lvl) * (gsz - 3) + 3
      =3D=3D (gsz - 3) * (4 - lvl) + 3

thanks
-- PMM
