Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1129388wrq;
        Wed, 20 Jun 2018 12:22:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJbD1yWvNKB++haki78Ic0qc0S4se/mD/s8bvE31RkVKa2OueCwdSuP4wio/rJYfBsTbd/t
X-Received: by 2002:aed:24fa:: with SMTP id u55-v6mr19338660qtc.400.1529522564787;
        Wed, 20 Jun 2018 12:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529522564; cv=none;
        d=google.com; s=arc-20160816;
        b=BzKIyKVL3UmPmUoylVocj2ubeECgwpEnqlc7wWoWSuCOltR7jHGcObxAzY6coY15Je
         fiBX8B3apaVsGdKCBQhn8lnTP48OfsYkdatjBzEFE3K/5KLWXgNkYxS/EM/Uyy23XAWV
         3XFm1Ry/bzTP/urhIB5iI9QgFH1uogUFOsmTigPTRMYdfReOCEwecMid9mzMDi43AYBL
         /CIigpd4UxLFqUbpXTDlSHgGNIEwJh5XvVhCBQQoYKcYQ4Ch+S6R+7OCP+bEu9IqSo9G
         E4zgqEc8CxAtXsb/65mtpPtmfmfvxZftaj+d/E9uTI67i1hHs2Qr6+LQF2ttLGmv0I+1
         shfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=MCdB8ERgbmCJ+DA5vD0FVi5gDwPs6SgAwzaev614fwI=;
        b=C0hHqxDyihOkt4Slo40B7GoLOGReNNZuUQDK9hegYmLO7zHStMyudq5VuibNgP8Muk
         jleYbx4ztWMxGbIgcZgv070MhvSU8ltLHzSGysjdPMZfZychJUtyroXnCkimICInKkBd
         rM8gAmea47pokpA67YSJ9VYRiQ/bBRFKjiO+ad4c/OfZw35zxPy5DS72P8pezLCnICfv
         OwNekoc0FulkYADwU4hgP5VZhcQd3HtxgNxC4ub9UHABXQOGYXfVjhX7cI8rrYvv78dm
         KbOEbl7/gmM6cwPH0puk+xMhLfGQrZK1jnwXQS9upAQIrYIXcxTRGNzXgXw+QzdgNEgo
         5log==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E+kTVs5Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u25-v6si3044923qtk.313.2018.06.20.12.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 12:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E+kTVs5Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVigm-0005R7-7t
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 15:22:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fVigZ-0005PD-Fo
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 15:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fVigY-0000Tz-G8
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 15:22:31 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:44458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fVigT-0000R1-M4; Wed, 20 Jun 2018 15:22:25 -0400
Received: by mail-pg0-x243.google.com with SMTP id g26-v6so252065pgn.11;
	Wed, 20 Jun 2018 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MCdB8ERgbmCJ+DA5vD0FVi5gDwPs6SgAwzaev614fwI=;
	b=E+kTVs5YurrEs6BL+6l+aKGliy+H/ppxZeJDfkfpnkw7sqWCmdR/6DQXFjnA2cPBUE
	lLAmoT6xFHID3exElILaqgi/6jz8N/4Px0m5JLXnWBbGI+04mBtmuwQItFSumn8ZIx1Y
	mHPOcalRoh+1YVNY9mYJ0Hpmhai/uFmI0onQUkq27o7cNfFyenRzwgqPueCjVsq4UBGY
	KRSUF61s8C4Ms0jCz+voKOM6jSuuGlJYGLcbCLxcjX9DhZlezRm/X/KklLsuyXt36xOt
	D/GIEjmdxQYAWhKfuPLJ868MhWDp1pw4iB+7qA2blOJPcypI0snt97GBnCyp82EmXGKg
	tOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MCdB8ERgbmCJ+DA5vD0FVi5gDwPs6SgAwzaev614fwI=;
	b=p0e+ufaPd8KsK8TtdiCebLVDfrVdPom0keYfcPi7InpEJzOVSK4sDZhTG4QMZ35DWL
	aWVTg0kJ1YGlZOE23CJjF8mul5RKh8iuMsm1mPu4Lzdymjd4ehOcfhH30oTjbHMK3crM
	l5UGbf4RTAlfmtCtEj7rulmjiEtAly990DP+3ScqW4NVLwj3/bsmYeubrG+ugbcvk07S
	lqNY30Y//b4T5W1lMI/5inXtliC2h4X3DJitwnikYZMCklMOrrUv6i9HIFoKFov5I2jk
	kflmhlRBJ11Wgp29QNEcUDeWQNNFDrvCqpqeL0bfBtsqOva+9psbYgUZ1DRehaENjoGS
	m2hg==
X-Gm-Message-State: APt69E0+W6tSrkocuHqijVqZcSOm10FAyT9sKqtE3bQSRcMKVfS0EBZr
	E7U8/kYeyRJ9ViYtkMIMPuM=
X-Received: by 2002:a62:1747:: with SMTP id
	68-v6mr23874918pfx.69.1529522544438; 
	Wed, 20 Jun 2018 12:22:24 -0700 (PDT)
Received: from cloudburst.twiddle.net (mta-98-147-121-51.hawaii.rr.com.
	[98.147.121.51]) by smtp.googlemail.com with ESMTPSA id
	f30-v6sm9957821pgn.76.2018.06.20.12.22.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 12:22:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180620130619.11362-1-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <a5c5975a-0860-01d4-8ff9-b69fcc91dac8@twiddle.net>
Date: Wed, 20 Jun 2018 09:22:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180620130619.11362-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-arm] [PATCH 0/3] Support M-profile MPU regions smaller
 than 1K
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dDJQyaGtH6Sh

On 06/20/2018 03:06 AM, Peter Maydell wrote:
> The Arm M-profile MPU allows the guest to specify access
> permissions at a very fine granularity (down to a 32-byte
> alignment for region start and and addresses). Currently
> we insist that regions are page-aligned because the core
> TCG code can't handle anything else.
> 
> This patchset relaxes that restriction, so that we can handle
> small MPU regions for reading and writing (but not yet for
> execution). It does that by  marking the TLB entry for any
> page which includes a small region with a flag TLB_RECHECK.
> This flag causes us to always take the slow-path for accesses.
> In the slow path we can then special case them to always call
> tlb_fill() again, so we have the correct information for the
> exact address being accessed.
> 
> Patch 1 adds support to the accel/tcg code. Patch 2 then
> enables using it for the PMSAv7 (v7M) MPU, and patch 3
> does the same for the PMSAv8 (v8M) MPU and SAU.
> Because we don't yet support execution from small regions,
> the PMSA code has some corner cases where it retains the
> previous behaviour so we don't break previously-working
> guests:
>  * if the MPU region is small, we don't mark it PROT_EXEC
>    even if the guest asked for it (so execution will cause
>    an MPU exception)
>  * we ignore the fact that the SAU region might be smaller
>    than a page
> 
> (Unfortunately the old code *intended* to make small-region
> accesses non-executable but due to bugs didn't actually
> succeed in doing that, so this might possibly cause some
> previously working-by-accident code to break.)
>  
> I would ideally in future like to add execution support, but
> this is somewhat tricky. My rough sketch for it looks like:
>  * get_page_addr_code() should return -1 for "not actually
>    a full page of RAM" (deleting all the current tricky code
>    for trying to handle it being a memory region or unmapped)
>  * its callsites in the TB hashtable lookup code should handle
>    -1 by returning "no TB found"
>  * the weird call to get_page_addr_code() in the xtensa itlb_hit_test
>    helper should be replaced by a call to tlb_fill() or some
>    xtensa-internal function (I think all it is trying to do is
>    cause the exceptions for MMU faults)
>  * tb_gen_code() should in this case generate a one-instruction
>    TB and tell its caller not to cache it
>  * the translate.c code for targets that need this probably needs
>    fixing up to make sure it can handle the case of "the load
>    code byte/word/etc functions might return failure or cause
>    an exception"
> 
> This would also have the advantage that it naturally allows
> you to execute (slowly) from any MMIO region, and we could drop
> the broken request-mmio-pointer machinery.
> 
> In any case that is too much for 3.0, I think; I'd like to get this
> R/W small-region code into 3.0, though.
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>   tcg: Support MMU protection regions smaller than TARGET_PAGE_SIZE
>   target/arm: Set page (region) size in get_phys_addr_pmsav7()
>   target/arm: Handle small regions in get_phys_addr_pmsav8()

Whole series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I assume you'll take this all via target-arm.next?


r~
