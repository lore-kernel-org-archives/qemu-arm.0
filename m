Received: by 2002:a05:7022:12b:b0:6b:57c3:147a with SMTP id 43csp197322dlk;
        Thu, 7 Sep 2023 02:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCQWFXchem+C2f5mGrLkL9hDiov/LG7zFPSnXWLBBoN6H3aOOodxixD/1TXsgcsI015WpJ
X-Received: by 2002:a0c:f594:0:b0:651:94b2:8d87 with SMTP id k20-20020a0cf594000000b0065194b28d87mr17587980qvm.6.1694077688341;
        Thu, 07 Sep 2023 02:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694077688; cv=none;
        d=google.com; s=arc-20160816;
        b=wnnxJaJLmI5/Y7Ksnj9LLjEKQEqiBjOYMeD7pGUttYC/OInDzNLoPZ4I5T2SKTk3fz
         nih5GU2gxL8jm8ims5eT06fiFJdGtV3C0pTJPwvVztnJvOgsg2tCfzIyC2iWwZpllq90
         +X1AR5FXsdqw7HFF1tSnffF4y9ZAxKdklYsh102sYDhRReEkuBuAd06lmy1TkUBGM4yW
         OFcf2EAQtGIrD4fBhKA1uJA8rcoIcTik4upDLyBNBqRTJ1xsZPZYTGJ36/dwweVBKKLE
         d2QHGtLCaQ2Ow0zdCaY03bAYYhF19bKuZ3GLWYxX/CjVBuS7an8FYelxSWNJMySnGGV0
         l4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=e+0LeLWheEZo2jx/tfksWwMPjBz6FAD9QINK4UCiU0s=;
        fh=IgOkjrcilc0xkoP5YFLtGNcQdAFJIcpaUjEHlrWyehA=;
        b=PYe/FO7bqU2uz0P2PQfpolwrY3ly9EkEyweLgH8zC+bs9aHUVzEOcon8/MuG51aFaO
         JYZJtF322PSRbARa+y1qdvQIqfKZomlnokSbwP7fG0MNg0sJ8xZry2zFNbqwqagwjJu4
         UjQHTcve26dan3gi6wrDivQZEY+NNXrF37KJFhn4tWvqeiQaZXEKxDU9ns5r6GUcjJrL
         B/Cf2lDt+yF5HIc9Dj1oHHgP2/PLTdnyoABdHaTfKfFmK/+RTMwk5rz5Bc6xgYFuQ0BM
         eJ6F9uCz+XeSsglVfZpLgP9btHSfOQnwtZsHb8X1RF8KdTdHTK1WtmcVtZyehnbmG/Sv
         8y/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zp6QgQaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05620a288600b00765de3bf495si11486298qkp.621.2023.09.07.02.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 02:08:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zp6QgQaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeAzX-0006ii-I1; Thu, 07 Sep 2023 05:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAzV-0006eR-3Z
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 05:07:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAzE-0002ch-I8
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 05:07:56 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so8077265e9.1
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694077653; x=1694682453; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e+0LeLWheEZo2jx/tfksWwMPjBz6FAD9QINK4UCiU0s=;
 b=zp6QgQaBHXOtXQvCv1vaY9xh/fIPXqPGoHZfhlsuSwQ3q5x0hTN17t8vk4usxh97Ik
 kInnUkLXA+s/lxwgxi5w1aoi+2AON9O48upTFPKjBJ4P6SGd0SgwHR0QxY6YNa00CXHp
 TUzY0mZ/VmeCaY5hnm0cP+eB8vcOYn4PGKGSncQ+w57gvf9DpBdPgxrn2jTKuwRcLzMs
 sHc4S0GfhsPhorL19uWlgv6vPWHMTYif8tG86ABue2nZRrauLywFXVbM0HrX5dzTxA5n
 H47QGAV26wnj5qLUWo6+obmKbbDf3b4+J8hj5MTMmJsKRsAZBfJUncIRvZr5mxHqkpvE
 17BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694077653; x=1694682453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+0LeLWheEZo2jx/tfksWwMPjBz6FAD9QINK4UCiU0s=;
 b=fJkMl8VJQABazi1oqQtut70JO6rpQH1xwgVOo3R2l9Kw4XNf32tsMk3XEgyCrPXHrk
 q0l63dklvAD0HQVnz2FtTk+IOKqB3CqBYZCx/T2HjnRxAyF34wmsxYrsKoanHoH4wWfZ
 UPTLlZT/5AV7OiGImd7emOIS0Dhnt6TZKQnNDnTu+8twF1KWnwsVvQem5xkycfpmgm2H
 rWYMCvMqVr0Xn+Y8g81sWXOYQvuwT3KnKXPhkPMQetFUPUfT2A8m1HPBS9Dud1JZPayU
 T1sJTVnYtzirDbGy9osHkIIxX24Ouq6dsS21bJq3WoY8mHSGoO/DBZRFtQrPctyHZKuw
 cJzg==
X-Gm-Message-State: AOJu0YyfPlkcx8SPyaJVMVKkpeyqTiGhj1/VPFuC3klCFXq62yRMfvxA
 EQBwpPLotpxPWYdleIUpWpdBTQ==
X-Received: by 2002:a7b:c7c7:0:b0:402:cc9a:31a7 with SMTP id
 z7-20020a7bc7c7000000b00402cc9a31a7mr3997937wmk.19.1694077653219; 
 Thu, 07 Sep 2023 02:07:33 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-226.abo.bbox.fr.
 [176.131.222.226]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c204700b003fed630f560sm1896685wmg.36.2023.09.07.02.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 02:07:32 -0700 (PDT)
Message-ID: <c74ace91-b1be-9a12-c428-a59fd4ffcf1a@linaro.org>
Date: Thu, 7 Sep 2023 11:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 32/32] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-33-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907003553.1636896-33-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.473, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: arpOEEpKLefe

On 7/9/23 02:35, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it
> by ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/riscv/shakti_c.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

