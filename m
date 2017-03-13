Received: by 10.25.77.4 with SMTP id a4csp1303404lfb;
        Mon, 13 Mar 2017 12:28:23 -0700 (PDT)
X-Received: by 10.237.39.222 with SMTP id m30mr32909211qtg.21.1489433303762;
        Mon, 13 Mar 2017 12:28:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s138si1183265qke.102.2017.03.13.12.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 12:28:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnVdl-000287-4V
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 15:28:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVdg-00024y-HC
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVdf-0005y0-HS
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:28:16 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVda-0005wT-CC; Mon, 13 Mar 2017 15:28:10 -0400
Received: by mail-qk0-x243.google.com with SMTP id o135so38468776qke.2;
	Mon, 13 Mar 2017 12:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=prRc5rODItlNr4Z/d/LQKMi/gKuv6DwWB/fNckwUt74=;
	b=HXrUzA+8EyXVL7n1rrgJfmM7gDnNDXLIVdU4SgiwBwICp0FGkZy9n+NiK0ITUtO/PN
	I8hTzjPHSigJR+I0P6XDff0PB0ogCK2d9qkngvPWqBkakSTMkrTDVKSCWiaem3cYmY4O
	GeVXxL09FCUVba+foa6N82xUc/Gsl7fS/M3neYzkLAgTUGzm/0FCjlqKgzLM2VYNjSIR
	MajvS4mZpJqDJlbuG0JWASniP7DzH32j5kQiov5570wQ0H9rbDCyk6mI0GZte46xTPXs
	hBLqCFvSg1MqQhhTxm5kbtD+bFWqS9iTUuaG6JyTfB/gW10MUdPJP5UKtyMRVIqElHbj
	hguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=prRc5rODItlNr4Z/d/LQKMi/gKuv6DwWB/fNckwUt74=;
	b=hCdkLlK/LJhd0lZiwyeqGssl4EGWhD8EtpXsDBepd69S+zUl+zUhB1tQqIcUBI4+GU
	Acg0nzjbRsZuJfORJYSsuMVPgK+po8Hmg0bNekauj9DhjtPMV/+S9OElfogrziJcjY+4
	fYzc/gp0bpPEXYk5Lij6VkJqt7gS50xnurgexWBS2tWg/QPqa99YlmpyHorGS9+s9yzE
	8XCAG8+fV9naJFVegC7lVnF82pmkEHqf/z7B/kNoc2zWjy8DNNJIeAQt5gcaFd/R8Bq1
	Q6JyHBe6tpEIc7Lg7ux6xelNf4KsCjsEoJ4s8YijBklaqnviJB9GkLIW2De3sb14alOR
	HncQ==
X-Gm-Message-State: AMke39mNdgKMQMChVm5IzD9+hD72tpulHvlR8qekLeETEySwDyzMMXQy5fcJUf2YunxXog==
X-Received: by 10.55.200.81 with SMTP id c78mr30957544qkj.253.1489433289739;
	Mon, 13 Mar 2017 12:28:09 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	j20sm12823923qke.14.2017.03.13.12.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:28:09 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170313184750.429-1-krzk@kernel.org>
	<20170313184750.429-4-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65adff21-6f04-f27b-08bc-5a731da58604@amsat.org>
Date: Mon, 13 Mar 2017 16:28:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170313184750.429-4-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v3 3/3] hw/misc/exynos4210_pmu: Reorder local
 variables for readability
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
Cc: eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sKudDvgz95+N

On 03/13/2017 03:47 PM, Krzysztof Kozlowski wrote:
> Short declaration of 'i' was in the middle of declarations with
> assignments.  Make it a little bit more readable.  Additionally switch
> from "unsigned" to "unsigned int" as this pattern is more widely used.
> No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/misc/exynos4210_pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
> index e30dbc7d3d83..63a8ccd35559 100644
> --- a/hw/misc/exynos4210_pmu.c
> +++ b/hw/misc/exynos4210_pmu.c
> @@ -401,8 +401,8 @@ static uint64_t exynos4210_pmu_read(void *opaque, hwaddr offset,
>                                      unsigned size)
>  {
>      Exynos4210PmuState *s = (Exynos4210PmuState *)opaque;
> -    unsigned i;
>      const Exynos4210PmuReg *reg_p = exynos4210_pmu_regs;
> +    unsigned int i;
>
>      for (i = 0; i < PMU_NUM_OF_REGISTERS; i++) {
>          if (reg_p->offset == offset) {
> @@ -420,8 +420,8 @@ static void exynos4210_pmu_write(void *opaque, hwaddr offset,
>                                   uint64_t val, unsigned size)
>  {
>      Exynos4210PmuState *s = (Exynos4210PmuState *)opaque;
> -    unsigned i;
>      const Exynos4210PmuReg *reg_p = exynos4210_pmu_regs;
> +    unsigned int i;
>
>      for (i = 0; i < PMU_NUM_OF_REGISTERS; i++) {
>          if (reg_p->offset == offset) {
>
