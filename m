Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp777446ejc;
        Mon, 31 Oct 2022 01:19:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7eUh+fMH10xjazPhD5RDMGE/6MZkoqtrf1nBXyHC7c2hvSuGNGh/wsLEihfROpH3vzy8sM
X-Received: by 2002:a05:620a:294e:b0:6a7:750b:abf8 with SMTP id n14-20020a05620a294e00b006a7750babf8mr8043123qkp.513.1667204379614;
        Mon, 31 Oct 2022 01:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667204379; cv=none;
        d=google.com; s=arc-20160816;
        b=ox9IVncHSjHGxLSIaDhzfYPiI6f81nBU6BGqyTKWD7NSFQe3NzGoC7GNTuaA6F8QOL
         25YFWi8gXhP1e2RpR34EH8svCQoJ9p0axsx5S/z2rORhcS5KJjfFc6LeRx9tHJXYl/b8
         gzIZxWqbSSpo/AKl7J/5H5XruCtniuYOD3nCBfq2cmugtZ0IBCED9LAJ3K9je97dQ6et
         XDDxAPw7gT8VGJLYX+zvdQ/EocVHHzO6Rnm7fqdnTEDbXgrusnYMQKwrzEfM3kPjOwFV
         DUxUMV30P0O2YHWkzj7AWXbmJWYMqjLk2Q6kz75eDGbc8ccKwCGWNn3RD9sbfQddINZo
         RvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QhckKR35tUPeXDRiQIvwocDG2KhyuEnYKSoV/8pmSt0=;
        b=wd6iQrKYjITO62H7jbWR0skTswc9QLYG0LlxdNtsUm0iNa8XXw3COfeloGI00B7cQs
         RbQ0EqiNq6OaGNVPDJdndBAEPiPlrfYDtHlZf5H84shgrXDmTgIcfYxKuBpA+Qgf+4l8
         PFqxCGXZ6sSU5UGq7DvMpnC5FzrlxfY2j4/qavF+dAflU5FVUX5XRkTkxUmz3ZZX2S64
         6wV+x89TPffo1QfqHcKq9/tQUMVjYCKNDKruWrDU3wkMMLVnxt2GNtwCqYvCU8cGu8Zk
         Woo9s0bB/fY3S+xvp97u/MzvGtQa+LwMH3exWiKXUU+7U9YC65/nnzLd69++kNT38LeJ
         YG9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I3Y0vf0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24-20020ac87298000000b0035a70424231si3385180qto.690.2022.10.31.01.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 01:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I3Y0vf0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opQ16-0005PK-G3; Mon, 31 Oct 2022 04:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ0j-0005KH-2E
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:19:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ0h-0007uB-52
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:19:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so1339077wmg.2
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QhckKR35tUPeXDRiQIvwocDG2KhyuEnYKSoV/8pmSt0=;
 b=I3Y0vf0hVEFNvEBUqznk81qj8L6yrn5pdOMYyWMWYbP5QbJ/SbyiQSJ9IGkMYHc4y7
 aIwwr6U6MvBpeGLtPCuFXdzbDn+2GfS3/yoUsyQl2K4eiMyPZgUZykwNgpiCfQMGggDf
 tDi9yfcjOP4PrhF93pJv8eUrSn5nW38XAaabVZRV0QjRu70VAMT736H4BHGXqmPKuvur
 fyoeeu01AYofLMGvm1rKH4ZNQoQkP+e++WijFqPYdmHke2DGoITW2EAi75JRf4rT5WHy
 LJ54AyZjLKroxpUVJOFbGNwmGVwZqj5WaPctLGeXSrguMyKNPsuy+8CJxu3vG7bg0No9
 6jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QhckKR35tUPeXDRiQIvwocDG2KhyuEnYKSoV/8pmSt0=;
 b=h3zT2hnPZYQ2Cy+xHfQSlLoYQmb78veD/JDwZYddlUWlJJjPXj2N5plxUCG36m98U5
 zr8nqvVVCc9cOOooPJp0Bkk5mMdSGnNMb2dZn5/wApxNv3b+hMcTm345XggDLiUorJb9
 4ZE5VD6TNDLYSVHha/DZAzU7QvM09cZqbs88QHC8QXbPOiDDCEIOwuzZ3Pyep3gBeVAm
 t7hl6eWAVZ04xtovHNtwacgA71VZmlodbisDFmDGsUxosJ+vHSSN7HHLAQsf63BIGewu
 j/oJoHCjodRj5X5qicSL0jrpbliSvNs+A9LpcR7W1ro7ikeU67Z8lU/I+VLdeBIKGSfp
 Va7Q==
X-Gm-Message-State: ACrzQf1KwKPHlSAx3eyQOvabGREDcHtDC2cuD/PygTg4+cI1gvdW5rF5
 FUiEjUNRr0INak/QAfvIOXLAPw==
X-Received: by 2002:a05:600c:15c9:b0:3cf:6054:3b3b with SMTP id
 v9-20020a05600c15c900b003cf60543b3bmr9555575wmf.167.1667204344426; 
 Mon, 31 Oct 2022 01:19:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b0023657e1b97esm6396354wru.11.2022.10.31.01.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:19:03 -0700 (PDT)
Message-ID: <7f03ab9a-5f00-684a-f644-dc16b1cca7cf@linaro.org>
Date: Mon, 31 Oct 2022 09:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 04/11] hw/timer/imx_epit: remove explicit fields
 cnt and freq
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-4@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-4@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iLpgMG2kmfi0

On 25/10/22 12:33, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> The CNT register is a read-only register. There is no need to
> store it's value, it can be calculated on demand.
> The calculated frequency is needed temporarily only.
> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/timer/imx_epit.c         | 42 +++++++++++++++----------------------
>   include/hw/timer/imx_epit.h |  2 --
>   2 files changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index a79f58c963..37b04a1b53 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -77,23 +77,25 @@ static void imx_epit_update_int(IMXEPITState *s)
>    * Must be called from within a ptimer_transaction_begin/commit block
>    * for both s->timer_cmp and s->timer_reload.
>    */
> -static void imx_epit_set_freq(IMXEPITState *s)
> +static uint32_t imx_epit_set_freq(IMXEPITState *s)

Maybe rename as imx_epit_get_freq() or simply imx_epit_freq(),
otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

