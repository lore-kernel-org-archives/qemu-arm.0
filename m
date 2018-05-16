Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1306375wme;
        Wed, 16 May 2018 09:17:21 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq+4/Mn7r7/4ZANjJ4OobeP8T60erqUTNg752nbNdHDsW9gyZgJY7t/DkDSL7AV5c3ED1du
X-Received: by 2002:aed:26c3:: with SMTP id q61-v6mr1720787qtd.60.1526487441587;
        Wed, 16 May 2018 09:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526487441; cv=none;
        d=google.com; s=arc-20160816;
        b=l1fMEI5eXutz/qyBkLqowHe0n7IkJn9xFUtgkLVLwBAZPey8Mlp5bToOvrTtJxBqZo
         5xM96AJqFcGZqFS/FU/TLhozcaho/xtWQNJoLP0hpSqWxHaXSNV2H64b7M3ABrfB9Wvf
         WYOfauiOkTNP6066Aluv0mKwp2KyHoO8CmXOgwA7GYVMgY0RzhsJDSmfuYKiFfs5bnZS
         iafpJrqjk5Ile2+Vo+O/ghWHh3LNbGsyQoaqYmeXG8WpA+1wNS+R0+xPT4MMcHpT+9eI
         8MM7MzEPxXkBnsbeVjIJwuPunfjnhHGkpu2pbnXCdrNLv1tm1Y4X7+ozxmeSjDrauXcV
         Ilaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=NTMtIYBBwPnbfy06eeXQMmGC5C76PWpUAFU3G0mX+gY=;
        b=ApeelL4WCerDjirkx1emFmRb+0KNKcrtrdrw0NDqqMbxJTAzB0Ig/kujyfDHrgwo/b
         Rg527GGF0RI65D0/BWA9rMAUAsvh2sngUpg5tnnjLadoxa8wjkVkiheVBY/pfYTefizj
         TTfin12Aet05ZLMsFWIupnbgH29Z+y33AHUlNzoot08SZKyyy1KLv9dKhlqasLx4w5nk
         PBPK/UGTehD2LDkOm6k5Vf55CbVYnYUG37k1LFJS551tNVe3KphJpbD4f0wAc5BbkjTo
         ABUWm4jzbVOndTaS/9OXWduuzmuJEdETDIfGLfLEWRZysmZ6gNsK1PR4qYXMAkWhkK8L
         DjsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c92c8ZWU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4-v6si1793388qtk.160.2018.05.16.09.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 09:17:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c92c8ZWU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIz7A-0007cL-WD
	for alex.bennee@linaro.org; Wed, 16 May 2018 12:17:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIz6r-0007W3-4f
	for qemu-arm@nongnu.org; Wed, 16 May 2018 12:17:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIz6o-0001jI-8v
	for qemu-arm@nongnu.org; Wed, 16 May 2018 12:17:01 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:45933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIz6o-0001ik-5g; Wed, 16 May 2018 12:16:58 -0400
Received: by mail-qt0-x244.google.com with SMTP id j42-v6so1763661qtj.12;
	Wed, 16 May 2018 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NTMtIYBBwPnbfy06eeXQMmGC5C76PWpUAFU3G0mX+gY=;
	b=c92c8ZWULoKmMPXA2av9Ih4iNZ/jUG5H0JV1KUa5LuXpz6NWQE5FE/yX5whZhVfwv7
	fV4f5AaaeuwMuK2yPsVJKg9saXA7nINz5CDWdUltkK1aLfvp+iyx24SiIKWFRtACYbpl
	N/qNkl9HPNpTGkMmB+Cuw3TVwBC39mQGE7lBaja1ip3VGpmtiXCAKkm7Ft11PtQow+a1
	QbXnqGeusL2Nv6rHKYl49tWL+mHW0IdrkvQ8lZanO0ImhCSTdyHeZ59Z9a4tvMRdPDZK
	0s5itOFecD0J39B14b8ZjkmBQGWLfr2IcPBvtyYaKHzZ5CfkC83exCp5/cGxTJFq1fvS
	Yz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=NTMtIYBBwPnbfy06eeXQMmGC5C76PWpUAFU3G0mX+gY=;
	b=LpS59d5YwIUe53hUQQkmlPEwbpAo0ipQcMJiWcME7oNmr8go731enxb3sP4o6iq0Su
	Tt9BxAtLkDWI/1GQGkZpl0b0jBOrLU7Ycap59HAXHvNt81qbJ1PQjKrgZYGoswl7e6m6
	R17fUBbBgSnvhcQD7Q6FoKoYaKIviv7/20FEhiy7FcbDjPykngiNWP7a5+ORqsP35B0Y
	G+04AX0B65gBJ/ag8a4S1Lh6DpN+T4non47BOLt9c8sVz+zBRdOM1t9vJN8cP5XZc/o1
	rO1x5KTyHKTmcK/6DczeGAX5zF9myBLSi2qtbuK60H9DJlEFsdoKoxy4j2LdxUFbT8+A
	SYMA==
X-Gm-Message-State: ALKqPwdEMMe7LOh3SqIJfD9o2GBne6OpTmmimy3hmENItPtfdwclI2CW
	qm3qYZCR1oH1yOsZDYzFMO4=
X-Received: by 2002:aed:2027:: with SMTP id
	36-v6mr1617929qta.275.1526487417648; 
	Wed, 16 May 2018 09:16:57 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	r32-v6sm2374406qtr.55.2018.05.16.09.16.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 May 2018 09:16:57 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
	<1526493784-25328-3-git-send-email-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <2c55370d-fa43-12a1-5baf-ec7cf824c0dc@amsat.org>
Date: Wed, 16 May 2018 13:16:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526493784-25328-3-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/smmu-common: Fix coverity issue
 in get_block_pte_address
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZfrkehQ7K+FM

Hi Eric,

On 05/16/2018 03:03 PM, Eric Auger wrote:
> Coverity points out that this can overflow if n > 31,
> because it's only doing 32-bit arithmetic. Let's use 1ULL instead
> of 1. Also the formulae used to compute n can be replaced by
> the level_shift() macro.

This level_shift() replacement doesn't seems that obvious to me, can you
split it in another patch?

> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 01c7be8..3c5f724 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -83,9 +83,9 @@ static inline hwaddr get_table_pte_address(uint64_t pte, int granule_sz)
>  static inline hwaddr get_block_pte_address(uint64_t pte, int level,
>                                             int granule_sz, uint64_t *bsz)
>  {
> -    int n = (granule_sz - 3) * (4 - level) + 3;
> +    int n = level_shift(level, granule_sz);

Shouldn't this be level_shift(level + 1, granule_sz)?
Using level_shift() you replaced the trailing 3 by granule_sz. This
means the previous code was only correct for the granule_sz==3 case.

   level_shift(level + 1, granule_sz)
== (granule_sz - 3) * (3 - (level + 1)) + granule_sz;
== (granule_sz - 3) * (4 - level) + granule_sz;
!= (granule_sz - 3) * (4 - level) + 3;

>  
> -    *bsz = 1 << n;
> +    *bsz = 1ULL << n;

For the coverity fix (patch splitted):
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      return PTE_ADDRESS(pte, n);
>  }
>  

Regards,

Phil.
