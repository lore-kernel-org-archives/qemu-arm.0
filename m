Received: by 10.25.0.144 with SMTP id 138csp820842lfa;
        Mon, 10 Apr 2017 04:44:59 -0700 (PDT)
X-Received: by 10.55.39.138 with SMTP id n132mr8450139qkn.25.1491824699510;
        Mon, 10 Apr 2017 04:44:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f40si5999154qtc.140.2017.04.10.04.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 04:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxXke-0002VO-QA
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 07:44:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXjI-0001lU-0i
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 07:43:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXjE-0003S2-VD
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 07:43:32 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXjE-0003Rl-Qm; Mon, 10 Apr 2017 07:43:28 -0400
Received: by mail-qk0-x241.google.com with SMTP id p68so18725322qke.1;
	Mon, 10 Apr 2017 04:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=UjYHl1R5wAZKfbSpQrjY216HV4jFP+jq2vbD2/dlUOw=;
	b=FkHl+RYx1m7pRID6zmSEmbVSggVOPjz+P7gFOKtyox4QL5tO4Lcns9F8HCqy5eYLdT
	Pv4TbYT0r7yKVfFTTxp0HxGiNQEPACs1DiU5v/WtRpOv9O3G/7xfkErqRhdzey5CT4tR
	mFwOSM3jeHjCgzD/CoUmJlTWyqoAeI75TfUo3qqjWvyf1Ff3LhfMSod9JDio/uFul7CO
	kQB4c4WfHrSVnK+qZaoIThu3C4FlxZ7h+opwZ8eEcrCxiB1TeTc4hbYtee5o16rqkYR/
	EcHKtYcYLCP4S85GleRy1voD+wDkYsoOqcFzi21H0UnGEIjQ2w1TQ5zEAAY0tl7H/4d7
	mLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=UjYHl1R5wAZKfbSpQrjY216HV4jFP+jq2vbD2/dlUOw=;
	b=i+/2FAVEBjqXI56zMRPlEfcbZFlmNCdEamBSohDyNzXWE0ncdfnCQpuKec903I6Lyy
	pdqa5JZm6DSjsNYVsPs0X2d0MhbNgltxxmdWvyClL8Zk2xxzTgXZBnN9nwrjx6DXYHSM
	KidDYbbIDjsqPw0mKJd8+luV4b1RiNXOiazujlQyOrKaZmTDnCg0mz23ETC712Okadzu
	u5Np4hnFvmMvFuyPrGR2cG0nBIu8jvUBkRljCf+VFGg5gext1zGNck6acse4K458Vvt0
	kIeDxdq6qrM20a/0aZ//6KQDNkraMzSCANcWXdWEpX5lUaeymY83UUQdGeh7aEtTIeMy
	opCg==
X-Gm-Message-State: AN3rC/5ys3hUzQQlpHCf92BtaEKielDUhqbBjKeqVv0wY1wKFCspUfijyIAsXZ9ReKA+sw==
X-Received: by 10.55.96.133 with SMTP id u127mr16115785qkb.105.1491824608248; 
	Mon, 10 Apr 2017 04:43:28 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id z4sm8578845qkc.68.2017.04.10.04.43.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 04:43:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
	<1491820793-5348-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <264eb0ef-168b-487e-3911-a2f1beafcd68@amsat.org>
Date: Mon, 10 Apr 2017 08:43:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491820793-5348-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/7] arm: Don't implement BXJ on
 M-profile CPUs
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 75j7D5CChLOY

On 04/10/2017 07:39 AM, Peter Maydell wrote:
> For M-profile CPUs, the BXJ instruction does not exist at all, and
> the encoding should always UNDEF. We were accidentally implementing
> it to behave like A-profile BXJ; correct the error.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index e32e38c..fe3f442 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10485,7 +10485,12 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                          }
>                          break;
>                      case 4: /* bxj */
> -                        /* Trivial implementation equivalent to bx.  */
> +                        /* Trivial implementation equivalent to bx.
> +                         * This instruction doesn't exist at all for M-profile.
> +                         */
> +                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
> +                            goto illegal_op;
> +                        }
>                          tmp = load_reg(s, rn);
>                          gen_bx(s, tmp);
>                          break;
>
