Received: by 10.80.166.35 with SMTP id d32csp2720004edc;
        Mon, 24 Oct 2016 09:03:21 -0700 (PDT)
X-Received: by 10.31.183.134 with SMTP id h128mr10215153vkf.124.1477325001288;
        Mon, 24 Oct 2016 09:03:21 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x3si5459928vka.196.2016.10.24.09.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 09:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byhiZ-0007gr-U4
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 12:03:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1byhSu-0005e6-M4
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:47:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1byhSq-0003b6-Pd
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:47:08 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33621)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1byhSq-0003ao-IO; Mon, 24 Oct 2016 11:47:04 -0400
Received: by mail-qt0-x242.google.com with SMTP id m5so6154750qtb.0;
	Mon, 24 Oct 2016 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=MYo/TywPjmD69kZ0TrlzH8kXdE1HNgxJWC7Wc2CBR0k=;
	b=0BvYbleqtZz3p2cyXNyc3FGvrifXa0Z5+jtEFG/6HMCZ4++s8Cjab7iCFYqg6LTxsm
	9/3Bq8al/G1zEuX6ZCvYag9Zp0/oTQ6jxV84AJqWgUbOUN7K788YLBLs74qNQ7lElzkb
	i6GJi7vcl8uYRIvzWKM4FnqCVwZxhTs+Bpxyf8VeDgs2lAC7NszkcpIApFuwXIXyi/KI
	ZP9LQ4+a8dkJHwo/rK1Hay0z6yEEUD4oZTO4QrVHrz36cT3zUww0L6/szfhGCpIQSAj/
	bK7npUlRkbch7Wjq/6BThmRF7CIilt76dfL024aZGhuRIOJG3DSewZFer974gahHBTgR
	ICcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=MYo/TywPjmD69kZ0TrlzH8kXdE1HNgxJWC7Wc2CBR0k=;
	b=FRaq7xkrIlfxEiueUguWavnSorSOkoiCmufIwAz/V5mbVbFSw5EbLzlAKZkG53nP6+
	0V5DyYVlerw/DG82EYemT2oWE2WZnY4HZ27EnXqE8jvGGcjnyv5/bphqk9+EZBLqHWOV
	NfeQr7L5SctQIBqKQjQbsk91R9WlStbfXGuUIoYPnQtl4Z90xLXenPJXJ5Cp9nn1sLhp
	Sr8wBfHgFoqOoV+WD5ZP+ukBOF+g8xIX1bMdVypHRF2rYL22MBDmdVWoLYlfGRUtFueE
	M9A6Fgs733fFm8o7ydO1xw0gyK9MgV67e9SqQ0me8KS/mFOgq/wVdDzB/xQvWH84yVtJ
	Ihhg==
X-Gm-Message-State: ABUngvdnX2as10ARqeOCt8iwg5Mznuyn0EwzSRD1T5altmOEbZi+X7CqRp1J7ctZCNZSJA==
X-Received: by 10.200.38.219 with SMTP id 27mr15964696qtp.125.1477324023395;
	Mon, 24 Oct 2016 08:47:03 -0700 (PDT)
Received: from anchor.twiddle.net (174-24-157-40.tukw.qwest.net.
	[174.24.157.40]) by smtp.googlemail.com with ESMTPSA id
	n68sm10007358qte.1.2016.10.24.08.47.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 08:47:02 -0700 (PDT)
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	pbonzini@redhat.com
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
	<1477288523-10819-3-git-send-email-vijay.kilari@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <7907e875-d1f5-af04-c268-499537579bb1@twiddle.net>
Date: Mon, 24 Oct 2016 08:47:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1477288523-10819-3-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [PATCH v3 2/3] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: qemu-devel@nongnu.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JyLANA5kfdBt

On 10/23/2016 10:55 PM, vijay.kilari@gmail.com wrote:
> +static uint64_t aarch64_midr_val;
> +uint64_t get_aarch64_cpu_id(void)
> +{
> +#ifdef CONFIG_LINUX
> +    aarch64_midr_val = qemu_read_aarch64_midr_el1();
> +    aarch64_midr_val &= CPU_MODEL_MASK;
> +
> +    return aarch64_midr_val;
> +#else
> +    return 0;
> +#endif
> +}
> +
> +bool is_thunderx_pass2_cpu(void)
> +{
> +    return aarch64_midr_val == MIDR_THUNDERX_PASS2;
> +}

Any particular reason why you want to keep midr_val and MIDR_THUNDERX private
to this file?  Seems like it would be cheaper to export those in the header.


r~
