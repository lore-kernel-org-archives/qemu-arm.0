Received: by 10.25.44.15 with SMTP id s15csp2546618lfs;
        Thu, 27 Jul 2017 15:50:33 -0700 (PDT)
X-Received: by 10.237.56.135 with SMTP id k7mr7777080qte.134.1501195833018;
        Thu, 27 Jul 2017 15:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501195833; cv=none;
        d=google.com; s=arc-20160816;
        b=YT5FwmvCU3O4fGW0xMhUn/vM3DDv01vyZC2DQcNtDDdTajn8a9QqH+xQgksBsxMW0p
         EfVjkVkdYgt0HlmEkBUNYbIIaP+WNbP1y1OjfAA86z2VkA4bLapAl7uoIaCY9G3IlMt/
         +dF0/Pncl4At9zlhngkUerdPZW1lbsRR/25FlQZI8Ghw2p7W2ExsgwjWMVNAGjl1JIgX
         RI5pcRxrtBALhkBwauIktHfH0+jnyi7xKuyCDfSFcCOOeRh5x3Ken5NLYn2HnHMDRJDZ
         C2dpyGT3Hmn6+RBmNvC5qJsm31sGyBy3TsTQj/rWOb826ttaGJKCn7hWt+PYZRExRHXu
         rNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Tn1BK0EKhKdGqY/r56+9TiaTnUEpq6GEXNhXsKzUtZI=;
        b=Imrvc1wDnHKtI6waZgRjrUWrmC/9yzg5UsJwcjaUdhUcUkW8gx042FqZxIBh+jWerh
         tAaIdM+HJGT8/H8TFa6W5oPIRedgvCxoJJwlLiatSTlohFB4N6eRF60E62AF3OpSulT+
         Oa08lpnHvG7Rcxfn6sJf3lKsA9/eCIkmxyrs58Rz7HBT7NM+5mNXf0XHeA2jZ4HPvf9m
         QPk30CKrvo2pT0kr7/m5QLHi7lk4KNgxeV/RIcohOJqxmvKjntprmpw+41lnxB2n4nFZ
         IY0KGBc1rXOR8y4cPsBhyE9cTipNw1wa+ZA9keXpsA4XdstK25b+mA7fWo1nmXEdLLZB
         wtig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lZ8Bq+y8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 125si11519030qkf.478.2017.07.27.15.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 15:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lZ8Bq+y8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1darby-0001mE-9q
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 18:50:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darbq-0001kz-Rv
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 18:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darbq-00059r-1J
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 18:50:22 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36259)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darbm-00057N-37; Thu, 27 Jul 2017 18:50:18 -0400
Received: by mail-qt0-x244.google.com with SMTP id c15so5995852qta.3;
	Thu, 27 Jul 2017 15:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Tn1BK0EKhKdGqY/r56+9TiaTnUEpq6GEXNhXsKzUtZI=;
	b=lZ8Bq+y8H24DOio5+c/5QdjhurR3p47kA0LQzaR6rEUkJJKq5GF4yq+rM5UoBv5DyV
	ytYkGs6Wsm9/bNspdcl0qDD6Ovt2UgKAeLe2BYcAj7043H/9iS0DWxpXG/woAvn9A8oj
	AKx+WC+EM367h79M2kTpwwxc+3qlxBVvYIwj7O11rcJYJLb6/SvuQgA4FhLhtr0bGIlj
	k47hZ9CbLlfJF3H0Qe6hZ/PGKeuFcNDYGmwzbEdliVTWQvlrYSsR7DmB0k2vlfX6PUKG
	CswX11xnOEVDWAKMYi2/vFot15/R6+2+va1nR7pmKYnhYp2qG5Qz7KBRJniprPHR8iE+
	vj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Tn1BK0EKhKdGqY/r56+9TiaTnUEpq6GEXNhXsKzUtZI=;
	b=TdlKLRZt4i2LQYhDObC1qottgkYId4xv0pQB5xHciK9KpI7UmYzYI/8aYDSb3kObgr
	n+YQhaVgXgmGEIMRpXLJqa/dnDWCi/Zmbmk3J8sSjd/2sSqWTg1eSlLfcYoqYQIx/CV7
	2tWNrchfMfgM+OoA3cPhrPxxXbI1wfL1e6fvFXvTjBRVy+LC/TRqKVAb3AMIt0xfoWqq
	1l7KwVhtbANnCBp3engd61AmVIxPOk6LjOkFnpRpIcrngk2xMNhF47w0lyXsSQ6nRRb6
	uRMtCtn/aoJi479dlLEDrjDCHsWwavQ2LQ5RUjmPWow/sYfD084WcyDCPGO0y6xbTMfW
	Gn8Q==
X-Gm-Message-State: AIVw112lzKgghI5IxrhVhTHRwZMt7mv0A0uMv3rGR1vL7PKE8jbgzemY
	sX2ic1VtCRFvwA==
X-Received: by 10.200.47.93 with SMTP id k29mr8310547qta.18.1501195817430;
	Thu, 27 Jul 2017 15:50:17 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	k127sm11390126qkf.59.2017.07.27.15.50.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 15:50:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-6-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1c5fa88b-5945-ae88-69b3-9663739b906f@amsat.org>
Date: Thu, 27 Jul 2017 19:50:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501153150-19984-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH for-2.10 5/5] target/arm: Migrate MPU_RNR
 register state for M profile cores
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0UKoswf2zsHa

On 07/27/2017 07:59 AM, Peter Maydell wrote:
> The PMSAv7 region number register is migrated for R profile
> cores using the cpreg scheme, but M profile doesn't use
> cpregs, and so we weren't migrating the MPU_RNR register state
> at all. Fix that by adding a migration subsection for the
> M profile case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/machine.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 93c1a78..1f66da4 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -171,6 +171,29 @@ static const VMStateDescription vmstate_pmsav7 = {
>       }
>   };
>   
> +static bool pmsav7_rnr_needed(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    CPUARMState *env = &cpu->env;
> +
> +    /* For R profile cores pmsav7.rnr is migrated via the cpreg
> +     * "RGNR" definition in helper.h. For M profile we have to
> +     * migrate it separately.
> +     */
> +    return arm_feature(env, ARM_FEATURE_M);
> +}
> +
> +static const VMStateDescription vmstate_pmsav7_rnr = {
> +    .name = "cpu/pmsav7-rnr",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pmsav7_rnr_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(env.pmsav7.rnr, ARMCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
>                       VMStateField *field)
>   {
> @@ -377,6 +400,11 @@ const VMStateDescription vmstate_arm_cpu = {
>           &vmstate_iwmmxt,
>           &vmstate_m,
>           &vmstate_thumb2ee,
> +        /* pmsav7_rnr must come before pmsav7 so that we have the
> +         * region number before we test it in the VMSTATE_VALIDATE
> +         * in vmstate_pmsav7.
> +         */
> +        &vmstate_pmsav7_rnr,
>           &vmstate_pmsav7,
>           NULL
>       }
> 
