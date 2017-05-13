Received: by 10.25.0.6 with SMTP id 6csp824772lfa;
        Sat, 13 May 2017 15:41:21 -0700 (PDT)
X-Received: by 10.200.45.157 with SMTP id p29mr9532530qta.139.1494715281372;
        Sat, 13 May 2017 15:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494715281; cv=none;
        d=google.com; s=arc-20160816;
        b=XeNUkrwI29ZgNB19i2Qq+oetlIkDUzj3LeVsmFZ1RYo17NJ/eOUvl4cv84uizE3Ahz
         Rz23MbLUz2Ccnuhu+0liyYT2v8W2wwD3Sg/LW2t+/huKMdqb1EaH+xAq5EHKL3E7dj0d
         TykeoXUuMRzOKIYYt11g1xZoxucL6oFjw9KUM7Adfkzw/xSbJ4rcUWAwCLgVEGmboaDw
         9791bbSQhF0JDkqbXCW61I6I/7a0QOoh2aJCQ71ql/bCwTjoVMp+YITD++tdSctWF/OE
         yp1ghHJZ/OBDyZV45ozTiNCigmXSQyhjKDWzwWewFwmvppTpMmMMDbZo/u8nbB2R71he
         80ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=4+BE//V3h/Bh3miig/skl2aU/0jBJQ+wXdSqEoAxaSE=;
        b=wTO2k4gLA8Yd9gVq2r418sJlEKUm/eQaLNi46FsIPcBEuPnAauRRNmgk0kqiwW/PSj
         SfXawGitxEWEx/zVzVceCuTtGxU7kRL/FPndkDBKKvH+lucN/4QSObWehZpaGpW97FN4
         VVZpv0tHxQ9AbiDhFhcapgI0USzp+GgzIKxoRsnoiK/0oaXZqY6l6hfVcjLNXIJSzIGi
         geqp9hUSuPyTr9Qs4SKJsV4G4ksl5NIGdB964ROX9WpR3Y5haqEkwkCR9M/ucUg96RDA
         IHGKH4aHjoF+ITOXZCdGhN3+VH7hGm5kT4TcGfT3PtHhgjOPkfUhAjXHX2spR9+WPtlE
         U3GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1si6928192qtg.163.2017.05.13.15.41.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 15:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9fiw-0005AF-LG
	for alex.bennee@linaro.org; Sat, 13 May 2017 18:41:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fhp-0004Vo-CX
	for qemu-devel@nongnu.org; Sat, 13 May 2017 18:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fhm-00071l-BY
	for qemu-devel@nongnu.org; Sat, 13 May 2017 18:40:09 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fhm-00071h-6s; Sat, 13 May 2017 18:40:06 -0400
Received: by mail-qk0-x241.google.com with SMTP id k74so12470381qke.2;
	Sat, 13 May 2017 15:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=4+BE//V3h/Bh3miig/skl2aU/0jBJQ+wXdSqEoAxaSE=;
	b=nxlP1UUnjhd9c4OVpJHr9rArDha2MxJD/aWln/GPk8/JtwjHg6WzbEV7yS/wrGQJ5N
	sNthjTz9cFnCQ9IMFIFnBcTkGoGZwLvTIKSqwt60MakXwXHVt2JWTsLC5C5O/HL5HjwH
	3CGA3A3PPUz3ZNBP8eGr0aTyGcn+3zAsdQDGMTw5nuIaG1HD96NHIdQ4tA6jNSiV0z3H
	SdTbOIazG3EVK1rCcC9L/lOnkjpG6k7v9zqkqniNSGsizXjkcGQ+EBYoTfHSdv2B/u/+
	akpBYuXjsCeSXCr8VGj52P44Nw8S1UCeF897TbgmrX3kVrO58UaDjVCs8IiZffFtgl3p
	5Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4+BE//V3h/Bh3miig/skl2aU/0jBJQ+wXdSqEoAxaSE=;
	b=LpUmTqVGhqvztLIXpdBx3jRQalcpeSSe4npqpl2GO66rJTBenGYQWInUV6CDPX25dM
	a25Cw00oX2lCqL+z0bW2LFhtqZYCH40WM8HpVoZsyoMuwo5EY6sIIiZDcbnrGZlsdPQu
	oCzxPkauiMToDSNjyb+QiBNqst87V6w8DtXsgMjYvJT1oRKTJvOuQDMyQT/fDp7IqrZu
	Sg/nZy1VPbBBGqKL5069Co2jQhFVZM3zz/YpDWM/ftxBmPKZ31bxkb1P7g1t04mEnFs8
	ssT2G9PBdJsH21HmyrSv0pIKKoB05NFE0Tk2/IQK25wi3Mxycr/5URmlgYa3yyLK9eHT
	5HZA==
X-Gm-Message-State: AODbwcBs1j2TJDmbPUmX3bLOHb9UEHUvmJidEFUZmKqvwal34ymJcquV
	pWdPIBLDNFc1K12+tiNx1w==
X-Received: by 10.55.74.133 with SMTP id x127mr6646676qka.57.1494715205580;
	Sat, 13 May 2017 15:40:05 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	q200sm5192013qke.64.2017.05.13.15.40.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 15:40:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-11-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <793b8c30-6f1b-a104-b43f-3cac77dc23d4@amsat.org>
Date: Sat, 13 May 2017 19:40:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493122030-32191-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 10/13] arm: All M profile cores
 are PMSA
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
Cc: patches@linaro.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GDuHCTyIvV1u

On 04/25/2017 09:07 AM, Peter Maydell wrote:
> All M profile CPUs are PMSA, so set the feature bit.
> (We haven't actually implemented the M profile MPU register
> interface yet, but setting this feature bit gives us closer
> to correct behaviour for the MPU-disabled case.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 8e57498..df8b835 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -543,6 +543,14 @@ static void arm_cpu_post_init(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>
> +    /* M profile implies PMSA. We have to do this here rather than
> +     * in realize with the other feature-implication checks because
> +     * we look at the PMSA bit to see if we should add some properties.
> +     */
> +    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
> +        set_feature(&cpu->env, ARM_FEATURE_PMSA);
> +    }
> +
>      if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
>          arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_cbar_property,
>
