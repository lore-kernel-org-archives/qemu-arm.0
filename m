Received: by 10.182.158.201 with SMTP id ww9csp723862obb;
        Tue, 17 Nov 2015 05:31:27 -0800 (PST)
X-Received: by 10.31.21.141 with SMTP id 135mr3678526vkv.29.1447767087517;
        Tue, 17 Nov 2015 05:31:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 203si2678062vkb.70.2015.11.17.05.31.27
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 05:31:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:58450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZygM3-00042Y-5g
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 08:31:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZygM1-00041r-0N
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 08:31:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZygLx-0000hg-66
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 08:31:24 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZygLx-0000hX-1u
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 08:31:21 -0500
Received: by vkgy188 with SMTP id y188so2096962vkg.0
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 05:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Vuu9+v65SpvdCVhPoNviYF8JHSPtAwJvBXOY6QuXoFk=;
	b=TysjIuHyi9o8+8CC5c/B1GB9laI5KLWyoAGTFF/EeRU8d9swEW+hl2n0pChup+u0m6
	zlySEjkHh8rILsqlqjjoDc7SHaylhiguA1J3RDGaGRh3TykSa4r4/v5Cjqor58PBv+8s
	kt8it4M7ZpxaSdKRMz7qNlsXh9nUCSuIaXXZJY3DKdXdrnyD/jdiMoVCKFbHppkzZ56V
	VRfbx8HR/g1QRxz2DhqbKWEkXuuF4YdnSfWHhZ+SRvJqVFAS8b7l/cFEOEZT/SDJwUqz
	ZLNG1ah+cZPVYNdAB0vAngwJdi2MvDFzOOZisfOInfv8Rc3Y0tMM7ar6qERGno1HSEi5
	pmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Vuu9+v65SpvdCVhPoNviYF8JHSPtAwJvBXOY6QuXoFk=;
	b=S3lA7kvdR2hrVQGNtWL6+9IgStY1A5ki4FJk9Nuvy0moiQA/mkefLk0dH72lahO9nr
	fd6KD3swN+1YMORQwa7000Kyz1ITraslCKxgv3slgxjPVOOhD32p32Cbzxw90XA+gan3
	JiZ4i07uULshECqAPCEeJPtfM04Omy489ibF23FjdTyhVbnFQ6pD9HtTK7gnQHy4HCX0
	iDCdKCrb676ABNUyUhvEHNyZzCCjywAjHwwxa9Pm2BDZ01pYgUYvMM/tzqb5d6/ZmHzk
	bX/is7zv017Z8+VCtFp1wZyVqGSsUym/zLTZPdwVFsMqcLSMd1zzjdX+VasexU0n/TfP
	+O5w==
X-Gm-Message-State: ALoCoQnyS9NVxMwgvnA415ilbj66pFTdI483ZEaHjmrfRC/mEk6reMRfOW43NfPnfQcY1ipJgFXT
X-Received: by 10.31.138.136 with SMTP id m130mr3544601vkd.27.1447767080627;
	Tue, 17 Nov 2015 05:31:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 05:31:01 -0800 (PST)
In-Reply-To: <564B0874.3050902@gmail.com>
References: <1447702479-6997-1-git-send-email-serge.fdrv@gmail.com>
	<1447702479-6997-2-git-send-email-serge.fdrv@gmail.com>
	<564B0874.3050902@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 13:31:01 +0000
Message-ID: <CAFEAcA-CLEaRWimu2R-k9kbRvXUkfqMp4si4dai1B-DSrELWuQ@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::232
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 1/2] target-arm: Update condexec before CP
 access check in AA32 translation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dfdg/6anCxai

On 17 November 2015 at 10:59, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 16.11.2015 22:34, Sergey Fedorov wrote:
>> Coprocessor access instructions are allowed inside IT block.
>> gen_helper_access_check_cp_reg() can raise an exceptions thus condexec
>> bits should be updated before.
>>
>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>> ---
>>  target-arm/translate.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/target-arm/translate.c b/target-arm/translate.c
>> index 4351854..f1f8129 100644
>> --- a/target-arm/translate.c
>> +++ b/target-arm/translate.c
>> @@ -7210,6 +7210,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>>                  break;
>>              }
>>
>> +            gen_set_condexec(dc);
>
> Ah, there must be gen_set_condexec(s).

Yep. Are you going to resend?

thanks
-- PMM
