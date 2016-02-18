Received: by 10.25.208.211 with SMTP id h202csp736287lfg;
        Thu, 18 Feb 2016 09:44:40 -0800 (PST)
X-Received: by 10.55.22.211 with SMTP id 80mr10256103qkw.63.1455817480873;
        Thu, 18 Feb 2016 09:44:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w206si9019360qhc.124.2016.02.18.09.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWSd6-0000dl-CJ
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:44:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSbd-000642-Ab
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:43:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSba-0001Io-32
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:43:09 -0500
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231]:35172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWSbZ-0001Ie-RD; Thu, 18 Feb 2016 12:43:06 -0500
Received: by mail-lf0-x231.google.com with SMTP id l143so37770240lfe.2;
	Thu, 18 Feb 2016 09:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=++a+itmG5JQpScJvxdLHah6VFc3WOwOr4HX5ZeDxoBA=;
	b=GABVaOqKBNC5VzymXTLYZmimHpyYv3FfNGiRpkzlaZ/3vpbuV9WPsT+PpOK74lWdVd
	gO+Hmj3lCWLF2x3umIrQ4aSSCpegiD9+dphEcv3vALrK+F2Tpct9pO3kccQNtTgL8d8w
	8lHSEdOmS8Yx2OujSs/U4sTkot9ITPYVhpRTjnXsNTUJIX8fnO/hAthzylvdGCUrFSUU
	zFbQz5VG//1bJM2x5qcQ0PBIDRqtgyyWc64pEq1woWGTAf/XTxfBYAWdBCILF//CLm02
	H5CJFloOW9Uhk3OSughpiJc8N/pAQCpXL3pV9P6GjqnQ30nZJs0Qzcs4JutGdUGPFMt4
	6DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=++a+itmG5JQpScJvxdLHah6VFc3WOwOr4HX5ZeDxoBA=;
	b=JJho7rLe4lynQqxH7Ll3vD5popaLF4oxuj18p2y71eSuKzPjLZJlGhQa0SIMiy7Ngd
	3DNbbVBRXVMd6M49DUcRa5JJE1Wx9T6S3CC6kohfA6kgVsh1QBCoCu5NR+Ato3HZvMyf
	FgBHr9/zxqPWaz2VqUSq7bD3Seilkr3YeAfECos2OA8hm3p5qoycGvQFjZBdHNRH0RrO
	X94poTra3iyBfBUYlWnfIjuQXWlh78DwQ5UeLGUQ3w/jyuCfDFFqelntVEh0U7FF4Cjv
	LhTVr/gVElDyogF9riHjSdN0etI9BlOgV7gl+PJ8GbduAI8uqYPhtJEg5MoffJXTMcqJ
	iJYA==
X-Gm-Message-State: AG10YOTGQaxpNinRdBR50W5cS7JKS0Ln6IoYXKZWdCXq5cdiZCneTvIqTCUVD60SEZVDKw==
X-Received: by 10.25.154.14 with SMTP id c14mr3874600lfe.35.1455817385022;
	Thu, 18 Feb 2016 09:43:05 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	m8sm1065750lfe.32.2016.02.18.09.43.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:43:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-6-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C602A6.6070009@gmail.com>
Date: Thu, 18 Feb 2016 20:43:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::231
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 05/11] target-arm: In cpsr_write() ignore
 mode switches from User mode
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
X-TUID: NM+N+RN/nY8O

On 15.02.2016 20:22, Peter Maydell wrote:
> The only case where we can attempt a cpsr_write() mode switch from
> User is from the gdbstub; all other cases are handled in the
> calling code (notably translate.c). Architecturally attempts to
> alter the mode bits from user mode are simply ignored (and not
> treated as a bad mode switch, which in v8 sets CPSR.IL). Make
> mode switches from User ignored in cpsr_write() as well, for
> consistency.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index d1919bb..9998a25 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5282,6 +5282,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>      env->daif |= val & CPSR_AIF & mask;
>  
>      if (write_type != CPSRWriteRaw &&
> +        (env->uncached_cpsr & CPSR_M) != CPSR_USER &&
>          ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
>          if (bad_mode_switch(env, val & CPSR_M)) {
>              /* Attempt to switch to an invalid mode: this is UNPREDICTABLE.

