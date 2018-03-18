Received: by 10.28.91.67 with SMTP id p64csp1974596wmb;
        Sun, 18 Mar 2018 15:35:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtoOdCu1/ouNSKkgw1C9aJjIjw5npa/eEqgWoqIlhA696u6dBAOpd9EnfV5Coua5dfDxvVJ
X-Received: by 10.200.35.141 with SMTP id q13mr14482621qtq.73.1521412544638;
        Sun, 18 Mar 2018 15:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521412544; cv=none;
        d=google.com; s=arc-20160816;
        b=PCsSnjbF9q10Tr2WnFV1zXFvqoJWZfwLOzLb9Y+gciiLsPps9D8sm5dEe6BeVFgATz
         7aAmTUs+3dDxAFlwFYmWHMTUr6f/6fdPAaPkzUVBsu7z9SyfpfpxV9EmIVebOLsLUKVF
         O+I547pmvyxcclDBxAtZBT5swg9wQJQgnWd+P+MlW9BvlRv0lR8cbjHGJwb2SMeU5/vt
         VnZ04FFIR2JFSq58Oz962+zJbkn2/Hqen4pwgZotyq0RH05ZOinSY7/f419yG1yWWBJF
         L9G9Ph51X41sUfgAoV3nVyyn9fOijThbbxTkb0z6+fnZa4e8JgiC4onJUxEjq+7/BvVH
         Z8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=cmAaWA6AL6pM8CaYa3U/BGzOlhseiH93CfeHcNhIAMQ=;
        b=HFSY7gyDXGeOfYW7eh5bFp8OoDb6YHTPZx4vXgkJXCmhGoVKtghC6ZnPRGHohmVElK
         Qwzby+qZSSSzUF4jHF2gf3tMY+f6Fvc9oreZ3qUYNoudbYmCVeYcQOqfW377r6N2B3je
         c3svvc7zPzSajeWlIZGNMhzlOvRKgfzNfsOx98VFafa6ggTSrUR3dDHQfgWJKHKjmkJ/
         VflR9jUTslmwYioRYr5jgCZI3kQvmqxR9nIBWXgYWC+ZWcPqpkvjPj75cbje54CqCt/D
         m6HIO2SFM9HHc88Ioj+IKRn2O1uw63kWex32DPpQFCSU/wYmnz0adB+jHVsceDEmoPDl
         C3Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I9bHrS3a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q84si487841qke.105.2018.03.18.15.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Mar 2018 15:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I9bHrS3a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exgu0-0003RX-6Y
	for alex.bennee@linaro.org; Sun, 18 Mar 2018 18:35:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exgti-0003R7-ES
	for qemu-devel@nongnu.org; Sun, 18 Mar 2018 18:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exgtf-0000BE-Aw
	for qemu-devel@nongnu.org; Sun, 18 Mar 2018 18:35:26 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:38830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exgte-0000AU-Vz; Sun, 18 Mar 2018 18:35:23 -0400
Received: by mail-wm0-x242.google.com with SMTP id l16so2765433wmh.3;
	Sun, 18 Mar 2018 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cmAaWA6AL6pM8CaYa3U/BGzOlhseiH93CfeHcNhIAMQ=;
	b=I9bHrS3a9H2K2+KIevOISn2o39BbOirVpWFDliTm2TKK0JalxzDywLRmoz8L96mKlN
	blc18In1gXDVdNeRaP0+fvM7s1hcBsk+DolHJI5mM2CEQUclAXBZTkTamwm12gCg1UWJ
	pv3yDCHlaN9WlGae0U8zC9hAQs8k0kK3PsBAE2BZ+rB0szDvk1m3zovNRbM76QRCRgwz
	DN06+FWLRFcbzr6ZCdro9ed0hHN7h/aPimQvPGjeMxvYMRC2tDr3Po2G14WWgvuttoDC
	2tbV9L9DuA7c1vzH9TttnrKDRfNko0DyDSKNrJdNSnApoYtStHmfkcnXobU2K8wyxhrD
	IwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=cmAaWA6AL6pM8CaYa3U/BGzOlhseiH93CfeHcNhIAMQ=;
	b=ReooAsVxjekb4hU6pXrzlINgmi1wZTG3/rI0r6FY/7eZOTgoTtP2XRHX6Boz6/kVS5
	59SZTCLSv0QUgDsfMqMCt8fJRlCwIqhxlsBxf08witdrN7hnhEVZDarjz+yjODGub1pi
	oSfRSXoukmOTHEFRS4VBL4HVVY/PlIvpTR83HvaAL5tROjwxv+B5HujZoFWQGdUsTV3q
	sX4rBoD6/qP4RO/bqNIE2FziOzOCzybSpXI0zxECHKhs1vZ57m4tlUs4FgyF+6QvjPaF
	8QJT3NKz5zeEnLNx2dIz/7anL0xSglHSFufxKxNoEfD14QItV5xMI1Ej8Wjh2OWbkxFr
	CCkw==
X-Gm-Message-State: AElRT7GHhStuYjaIuWyGd4simA5COyUkJuOIo4wj7Kn6Em2IzFj3MWkM
	pLY70ru7/f9Z6Yw+gs4C8Qs=
X-Received: by 10.28.41.194 with SMTP id p185mr6304167wmp.118.1521412521623;
	Sun, 18 Mar 2018 15:35:21 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	l22sm11836503wmi.39.2018.03.18.15.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 15:35:20 -0700 (PDT)
To: Aaron Lindsay <alindsay@codeaurora.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-2-git-send-email-alindsay@codeaurora.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aeacd6da-0f45-f871-9a0a-2c8a524db510@amsat.org>
Date: Sun, 18 Mar 2018 23:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521232280-13089-2-git-send-email-alindsay@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 01/22] target/arm: A53:
 Initialize PMCEID[01]
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
Cc: qemu-arm@nongnu.org, Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6j+UotKE4Inm

Hi Aaron,

On 03/16/2018 09:30 PM, Aaron Lindsay wrote:
> A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01].
> pmceid[01] are already being initialized to zero for both A15 and A57.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 991d764..8c4db31 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -201,6 +201,8 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->id_isar5 = 0x00011121;
>      cpu->id_aa64pfr0 = 0x00002222;
>      cpu->id_aa64dfr0 = 0x10305106;
> +    cpu->pmceid0 = 0x00000000;
> +    cpu->pmceid1 = 0x00000000;
>      cpu->id_aa64isar0 = 0x00011120;
>      cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
>      cpu->dbgdidr = 0x3516d000;
> 

Maybe we can move this at a single place in arm_cpu_post_init():

    if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
        cpu->pmceid0 = 0x00000000;
        cpu->pmceid1 = 0x00000000;
    }

Regards,

Phil.
