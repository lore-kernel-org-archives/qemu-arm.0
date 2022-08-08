Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2404333ejf;
        Mon, 8 Aug 2022 02:43:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7NTRFrLcOvqkg0v5QfDjmMh2oat3Y9jphjiFc6XEQZDocooJ5b4A8l/qh2ospSddISYpps
X-Received: by 2002:a05:622a:18a1:b0:342:e94b:2889 with SMTP id v33-20020a05622a18a100b00342e94b2889mr9879896qtc.544.1659951819778;
        Mon, 08 Aug 2022 02:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659951819; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0OBSfbFwS146BLLFGHW5jYHScvoprVYD7AgOuE9znURt2guA1LFAeSlm6FqftkZXt
         9Mwa6o0fbmHrzl9Auq9bhD5jZBwS9340jHkkv/Uv8eTrG3BM+IEiXL9JSe1zez4gsRqg
         yjJbTHQ/d5tw4P71suOeBui6vklvUFykBV9eShYbxPWtQrmaxAM8zNwEfoIF7yAlTdsU
         M6DLeCpOXChbYfuXkKGHNWrFy0nrUEM9CeYzcBy/Ut7pf9WVhkNrQ7wed7x0jpcbTIjf
         keEjY81PEk1VDDAynRhPdRivclBXof6/rCJk648oUj475dJ0jeUv05wcCrYG2AmLq0ca
         865w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ioLWArzZWXWzPS54EqFAQc0XvNcyTQtC1Wh4rQ2MSuA=;
        b=U5ytIC/AyEPMBCJUuBvK70lp0SnkfN6wI5EA/vANbSprMT5JR6Jqf1nAqJZhkgNkr6
         VC9OMvvNsxLWKOYGQI0eP9OIdWkiLKuPiDe3xYjEFUOQUSEJ9BSwhCIqEQXy9XMEMa5A
         qtjrP7Aa9KoWRuj7FcaO0zEkyPnGf7DEm/9OG8AcDB1+RdJYUgL/wUu2iEq46PdK9niC
         6146CbyCAbbgOAqUfM0CTKjxJMr3Ct1joTcv7rK2wZumaA/S5tcZFFSHGYtKs9otg/Y/
         DttOyI7Hf86+vk/rkHzJHdiF+UPaqBZxEd5uQqBvLOQrhYcMYKSnH7BbVwg5faywig6o
         qjcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020ac856f2000000b0031ece6e0f15si7797082qtu.561.2022.08.08.02.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Aug 2022 02:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oKzIR-0003fZ-9g
	for alex.bennee@linaro.org; Mon, 08 Aug 2022 05:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oKzGd-000237-TF; Mon, 08 Aug 2022 05:41:48 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:34197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oKzGc-00025g-5O; Mon, 08 Aug 2022 05:41:47 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5wc7-1oJaM93RFb-007RuU; Mon, 08 Aug 2022 11:41:34 +0200
Message-ID: <d7345d10-9c66-acdd-d36d-dd210fb84db6@vivier.eu>
Date: Mon, 8 Aug 2022 11:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
Content-Language: fr
To: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Frederic Konrad <fkonrad@amd.com>
References: <20220808080116.2184881-1-cyruscyliu@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220808080116.2184881-1-cyruscyliu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j1u7grAcY7d0vEyhZXEDTTXfwvEN+hdR+70ar4VUlou1YyOZmvZ
 8x6ny1DhoaA9iwxWsXNSN+BwInYm8u9IoV1uluN8xJ6MF73MzaISJY+rBaMW4x/9nZEv7Tk
 YRqL1fbxhjnHwvh+Mmr701WudEHRxrZHjTyei5uwKymieEtdsuYy/mqdfzl/dKBB74s3GT4
 P8NIkuT5IwyVTbO02NF1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Loh/asGwEqk=:mcQhKeaD/Ergm47r7CRVWY
 brehe+a7Ox/t3m4OXfpgEAM69pxJQqnX47xnoZQXKZptqBGO5iiAyF8b/Tz3LI2HU9r7Z2igT
 Yz+xQDy8QpTfWXd2UmdyZ4I+bpY/ZRlZ7v5u3slvySUPSF1T8d//m1wL96tjmnHfe1ZOaIeUB
 yCH9qZVkJQXA5QuVqgXXc2fS8GtOv/X18pL7GL9vgyCC0VtQuIbFrC4hlRsdl5AYJe8hDJsvA
 pLrIStvu8kJ1ed0Iy9B3WqIRTw1l7Kb8RRd8Eyt3JPIe5N56yivkcM1LybPNSllktjN/Xlqve
 d7iOFGRAv5xuU9Q7TvERsCtv+TY4aEROvqeQiLtg+E1jbu8nXTN1cvtYdMHiOXunLomf0axhW
 UBUhtjWHFoOd0Fm9DXYIgmCi/A1aAmzOfwp0OXVTy2cmvcfglRFmUKXWrDsqnAfKiJC7QKdJa
 p2Hz2U6sCuwB2eyl+saI/yFDyTtKD1CCTJ9paKAuXaJUUr1RXur0WbWSJLi+l3KCNzYbt37xW
 ww3dvnhMs8y6lROav13yewfaBlB7axb0BT8qgVVS6brzscmNc6MrW+3kjjiNWv97lPkmz/thv
 dyiiEQvLY0Fu2162W8g5DBBUj8ZyMfuGTvLl+wn87P8O7R7txxOjbP/E2KCMBe0j/Ma6fwM3U
 JjHMmHpETdO6lXsGwB8+thge/zsNqcDa02keUTYZB95TQqSyBieWJ/T2OeejzZHr6vKij3Shr
 kxh65YUz2OXaFgcOAPNFCor/8K84UouV/X8jOQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Rqor9P3Yaag9

Le 08/08/2022 à 10:01, Qiang Liu a écrit :
> In xlnx_dp_aux_set_command, when the command leads to the default
> branch, xlxn-dp will abort and then crash.
> 
> This patch removes this abort and drops this operation.
> 
> Fixes: 58ac482 ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/411
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>   hw/display/xlnx_dp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index a071c81..b0828d6 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -532,8 +532,8 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
>           qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
>           break;
>       default:
> -        error_report("%s: invalid command: %u", __func__, cmd);
> -        abort();
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid command: %u", __func__, cmd);
> +        return;
>       }
>   
>       s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;

Applied to my trivial-patches branch.

Thanks,
Laurent
