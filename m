Received: by 10.25.0.23 with SMTP id 23csp1345084lfa;
        Fri, 16 Jun 2017 08:37:06 -0700 (PDT)
X-Received: by 10.55.215.130 with SMTP id t2mr13658044qkt.152.1497627426634;
        Fri, 16 Jun 2017 08:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497627426; cv=none;
        d=google.com; s=arc-20160816;
        b=oh3i+fMYQibOXMFITB/+uQYMgtTS07FlACs34QprP4uGkBq9hkTQVYM5xQUrx2pyqJ
         35bvc7+3FqBCJzHjn7upcR4dS1MrBGNfg9dXM8SQRmILcsjpKa5/lOfXQAmKtpSUZFWg
         ZErFUPecIT2VBCSFximBlHAqCZwNS+sRWEoze9PX+3XRvCLKA1JPc4i5kxWH5Cd+aj/E
         0IJJZnfU8i6FtH+WwtKbjKISE9UKiehtG2n5XkykcLwHgFa+61nNfL0SV4nc6NVBDMNX
         5Owt9FB4suP7ZXa3gp9LmyvPOsxSTtM9uHgo0uBtetAeHNwrE8eAyAx6gleo8IW7R75S
         Du4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=sYRZRStbvI9TCImdJ0bV5Gy05hUZKMDqbp9NkYvO5P8=;
        b=Gg+eOA76kKxrgNt2sUfCtDNZXSqrGawpESry7YWGSEGg8EazH9z5iYPRWlhSycRlco
         5a7Dcj8QXgSfF7KHFqF8Lb4AdOS9TZ4KrsE4urOStlKoD+7pmfuniXla4f/EfPxRj2Hu
         IE58r4NeNdFp2zKFJSueHNCQSq2EzM8F3ordjIs1faBw4znfy9ywlVntc6y+YVIF725W
         DZh3c0nqUVtypPsVMfsjphYsx90MF4vg09NwwcWctWK7UaXnKalksUAVI4SQIwLF4D29
         nOKx8xNm1A6RtD1NbfXttS/PzKe0phHiO9k7EhsQ7xHPKJTToneU3e4qTNgDxGMoxBTW
         2nxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lHDR3mev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h123si2242310qkf.60.2017.06.16.08.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 08:37:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lHDR3mev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLtJ1-0005A9-US
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 11:37:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dLtIu-00058M-6t
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 11:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dLtIt-0001hW-DH
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 11:36:56 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dLtIo-0001f1-4n; Fri, 16 Jun 2017 11:36:50 -0400
Received: by mail-qt0-x241.google.com with SMTP id s33so11060837qtg.3;
	Fri, 16 Jun 2017 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=sYRZRStbvI9TCImdJ0bV5Gy05hUZKMDqbp9NkYvO5P8=;
	b=lHDR3mevXavNYPZokJOkFdR5plckXXqPoZk9EQEV5TP83mLrWeUJVwPW+KpaWwNcCm
	rilNEG158GsgHCZhCylPGKhCfwKf6OU0k8dPnjHHlhuAdxIJcRZf/NVXofOfDfbARayR
	J79D+aqQppiX89wWnw73j97aQprUiZ4njg0pMzEihRumw0CIHzn94qzdINswPOWOZcKk
	vxXVtSLTjKuCgpnuRUb40pAC3wTFnt1nuJYNN8Mq4DnCQT9fMuTfcU1w/cx8ju/cvrK8
	7Ucn3gkXAPrhs17lXKPM3PWEzyxfeInQlJlMzt6/JYicB1kNYtXei+YaoTCsNrnvtqA3
	ZTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=sYRZRStbvI9TCImdJ0bV5Gy05hUZKMDqbp9NkYvO5P8=;
	b=fe0FBYRf4apiq34VS8U8l6kzRjnG4PqW6qLh2Gs+Fpr6GN/XWnUcOlUdTckIdQLB43
	MU4a+65YnCpYHFR6DfoBJj3tT3P1+AhXe+oeTDQL4yLDeuadQbOqSPYoypPMGEI8fIMU
	0FGBZezn8SOPILR2rJb47LpfoydnprMvgjgQmdjoizFZyX0B+IOGTTIzxE+GghuBUCtc
	or7iGqZRcEyhCXZAFQcyIIFZDc56Wy5Bl2M/m0Cnu8u8bm0KKac91tO5dnYWEkE9xFRF
	LxZSaI2IPXWPFuPLloGMOlUOc248gY78IoAKVcv26iDXFRdml1Z0uyNVgNgpSjtYPkJc
	fC6g==
X-Gm-Message-State: AKS2vOyIoLH9d0uU6PXyDIM9HWHwCIkDzMUOA2xe0gTAPI5AZ+aa4z0y
	e9oNNMDr08WAFjDEF90=
X-Received: by 10.55.65.22 with SMTP id o22mr13902642qka.158.1497627409015;
	Fri, 16 Jun 2017 08:36:49 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id n4sm1780961qte.65.2017.06.16.08.36.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jun 2017 08:36:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
References: <1701daf4-b2de-a9fb-7337-7aa791676516@lauterbach.com>
	<CAFEAcA_+rS8gjjU+g1e71vBBioxaWX94+SvMqVh=Ta37ZhYGjA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <186f2e99-0e78-c3be-5453-c96252f1d4e6@amsat.org>
Date: Fri, 16 Jun 2017 12:36:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+rS8gjjU+g1e71vBBioxaWX94+SvMqVh=Ta37ZhYGjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Bug fix in filling
 the cp_regs hashtable
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H4TovvcIwzkN

On 06/16/2017 11:51 AM, Peter Maydell wrote:
> On 16 June 2017 at 15:42, Abdallah Bouassida
> <abdallah.bouassida@lauterbach.com> wrote:
>> Check if the CPU supports AARCH64 before adding  the 64bit view of
>> the coprocessor's register to the cp_regs hashtable.
>>
>> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
>> ---
>> Bug description: if a register has the .state = ARM_CP_STATE_BOTH, its 64bit
>> view will be added to the hashtable even if the CPU is not 64bit.
>
> This is deliberate and required. Where the AArch64 and AArch32
> states both have a register which shares underlying architectural
> state, QEMU chooses to implement migration of that state usually
> via the AArch64 version's ARMCPRegInfo struct. If the AArch64
> version is not included in the hashtable for an AArch32-only
> CPU then the state of the 32-bit register won't be migrated.
> The AArch64 register is of course invisible to the guest because
> it is only accessible via 64-bit instructions, but it's used
> during migration.

explanation worth to go as comment in the source!
