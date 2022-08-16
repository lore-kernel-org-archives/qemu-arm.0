Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1501451ejf;
        Mon, 15 Aug 2022 17:49:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6mQkkeMtwSpaX7yvXmYTKimslZYpBzwN+DKLn7l17GNOdQ9m4SZoxsfBNcTNzHFSq5j8Rm
X-Received: by 2002:a05:622a:6098:b0:2f0:f0d2:b5f0 with SMTP id hf24-20020a05622a609800b002f0f0d2b5f0mr16496253qtb.583.1660610990233;
        Mon, 15 Aug 2022 17:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660610990; cv=none;
        d=google.com; s=arc-20160816;
        b=RnZrCbzfV13PU3vi0Uss7sQJZpsdYEdueGSHR8WeODFGjnwgvKAoSflY9gZo8O9oz7
         5V22jTtqQsbXPVkus8yNy7I4fcLLOhOhAvVjFV0D+sKDm7lFaRrGEJ6DVGycmgiNoeJf
         GtCvR7/vxKGs6Lb1HdRR/zJi7SQ16SRWg10dgwtHomMgiQxWfPuRx5qIcB4iOc/kuwp4
         EpGNHMRc4J+h3DjGj+5Aze1RGsKkTjeq/Q53ReWs3MKtZYxEVNPewbTcfvplAVDqqfvs
         5BQ/5qzc+9VKdoT34Py9D66G2XQrxmFrS/bH7aeq+tKbfKDd71abojnHIEoEJxFWOauP
         Ynjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=t975Nu1FkWMj/KCnwWT4Vq62/hvJRjgmm6CErW+TC4A=;
        b=x34LhFXsxays8fBDuXJzsxjJBAB+PAduEbbrpIipHZV05POE6KUrZbocZ6WXgaE6YT
         3HaNlUEjzR/LrzgBb2WdrOSquJS6/nAf1D/2zlJnfTI3HqL1Iz097/vZzLeJm4ME6wk6
         ktuG7Q/z+Ijzs+i/13dLNu1WvZRC5n/hSUOOc1f+lsC/5HSx8VhCWwt6QGD5Hb0vjjDj
         qbONz5ti8hiwF6nZPHNEuO4G+4K5Xo6StMHVwDcxTvd+NHk3uWR8XH9QNMJLA2Pf69r+
         BoAeaXuGnWKBOHmvpE0rNtW2ejpKzs02I8k33l4kdarA7lxJRqKYXRDq6Z06vVFIo8M5
         eDWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=KlHj1Qmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f27-20020a05620a20db00b006b554b09de5si3984281qka.160.2022.08.15.17.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Aug 2022 17:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=KlHj1Qmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:55114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNkmD-0006lM-NH
	for alex.bennee@linaro.org; Mon, 15 Aug 2022 20:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkle-0006k2-4P; Mon, 15 Aug 2022 20:49:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkla-0005yx-4N; Mon, 15 Aug 2022 20:49:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z16so10798267wrh.12;
 Mon, 15 Aug 2022 17:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=t975Nu1FkWMj/KCnwWT4Vq62/hvJRjgmm6CErW+TC4A=;
 b=KlHj1QmgJQjAb1E9fnyQHtQEgLtcly3kvvalq4+ZLpoHb6vqc3WG4einBjuSXZH9W2
 N2gv/6th5aQ36xzMkvml9tSWNE+M02VS8bW6D5rbpT0Z1QCXEUGTzRdM/Vtdd1nC8FH8
 3SE9NQuFmGDjjZ+oQCf4lYn/DgC/qFvJ0TJJ9DMvyGqnQOrcdCHqCM0WamWTB0Bn66Yf
 zbE5fwuWF5e57+i/iQXZ4yWhH77VGB8dZ/oVt8VFgK1R5cRXZJ1CjcA12CV5cjLHt/mF
 kjaPDmxKzquuhYBznPhs6Gvme4HTuZ0FPsf8+2HCLbNTFG8TAVyj4nh9hc7i06N5Os/u
 1vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=t975Nu1FkWMj/KCnwWT4Vq62/hvJRjgmm6CErW+TC4A=;
 b=2AQwGLgXDFyV94Tq+uVRqmqI36t/G14LUpjrmLzWAhT/SIr4AW9Sg4QV2O/p3joCTP
 UUin4WRPC/CdcCAEBga3N65pQ68IadYDjtD9IrEsXPFlByQmWTdGlAcmTeLHxncMdd5G
 +5amB12lk3V3TBupRNPVQ5PxKDDbfz3uSc+eUm+0SWWxSRSzunMzvHdbm+JDIl2blTUb
 BWSkmOedAFMS5SIWyzI+rYU5aSRp0XGBu6AsBkpkje1vmX+UbEOU1E/VPKcP+C+uqosL
 HdXBoyRTBSa5Y/ZHl7z+n21tXudJMhGD3Et16zMabfUasIWhfIHw3h18IAOXLDoQGUE9
 zOfw==
X-Gm-Message-State: ACgBeo2MICVIDAyT8KLQ7Fj2lzVzHoP1p6UTixMQ3fz51Yn/77L6SYzJ
 /ip6DS2XZstwsmCh0NtmOg65TZvh2Mo=
X-Received: by 2002:a05:6000:1a89:b0:222:c186:ca8a with SMTP id
 f9-20020a0560001a8900b00222c186ca8amr10128757wry.333.1660610947270; 
 Mon, 15 Aug 2022 17:49:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600010c800b0022062459ce5sm8553958wrx.30.2022.08.15.17.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:49:06 -0700 (PDT)
Message-ID: <b436b27a-186b-d5aa-585d-904ce8228fa8@amsat.org>
Date: Tue, 16 Aug 2022 02:49:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] hw/arm/bcm2835_property: Add support for
 RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS
Content-Language: en-US
To: Enrik Berkhan <Enrik.Berkhan@inka.de>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
In-Reply-To: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: eeopLdjKEbjk

On 12/8/22 16:35, Enrik Berkhan wrote:
> In more recent Raspbian OS Linux kernels, the fb driver gives up
> immediately if RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS fails or no
> displays are reported.
> 
> This change simply always reports one display. It makes bcm2835_fb work
> again with these more recent kernels.
> 
> Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
> ---
>   hw/misc/bcm2835_property.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index e94e951057..890ae7bae5 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -270,6 +270,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>               stl_le_phys(&s->dma_as, value + 12, 0);
>               resplen = 4;
>               break;
> +        case 0x00040013: /* Get number of displays */
> +            stl_le_phys(&s->dma_as, value + 12, 1);
> +            resplen = 4;
> +            break;
>   
>           case 0x00060001: /* Get DMA channels */
>               /* channels 2-5 */

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
