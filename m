Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3302863ejc;
        Wed, 15 Nov 2023 23:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd6Kg/TWo4ZR7pMQ/fKwvR6M4RpPiKeVniJZje7eZP5CS56QItZ8Pp/F/ANIIFhE60GKE6
X-Received: by 2002:ac5:c259:0:b0:4a1:7278:3bf5 with SMTP id n25-20020ac5c259000000b004a172783bf5mr14579397vkk.4.1700118603454;
        Wed, 15 Nov 2023 23:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700118603; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPUGC6IERc9NoS+py023ws2gOG4BwIY6jOUYP3KI3qi+XKZKm9vrCImtvTZQJSVlyz
         Ylg2YGttzSDungrzPRfvna3TNG2cz/efnyi0QK9s6t1qqYewHhQQjz8iFpeCS1ZXj8I+
         8ZvNN7GOAklzi15GoJtDtO0xQ6H4MhN1IAXe2EOP/x9IPfzuxD4j3b4QBU48jt117OF9
         SkMCUL/ybVvkv9cPlBv1nGOUYrP4O2BM/BHLAeFLbg20LcJ5ghjprSVGAvdo58cR3h7i
         JHjESfbEfYh9ALWGH+udBV1rXG/T9AUo0uz1oDAsSKVqKrawciCTbE9hNKlO9gRueb7w
         a+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=itpIvRPGh2BcrSYp0/DZr3YvPo92ZkJr+NW6dvwhfQQ=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=zkDJcX99jA3sQnCsmopXw52G5HNsXx/iJxz5Pi1TYqABouxxqIedjvz4a0fHUer//w
         Vlo3yrvtoDDttfq/LtH1KMuN+KWvPLwLjNoNIMYW3t14wqpZh1d5Pg30GtbbnMeswPGj
         A4XVdRyoqYDC162JBy5DsyzS3wyPEIJNELKLpMGI0yZcAOrGjtWpoeg+tpb7VL+8W+dS
         nbWIRON59isuiX0c0g8wFRwugtoPSEhOd4Mq5uQt9jBNiiiBTkIK9SntBo7NIcAXI4nx
         rwOpsGOOByKwnjrSZlcAymZjiY5/fgEp7z6fHhMDkfKuelAMSwcX3WFNNO2x2Lm7J8Fx
         900Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wRB+St32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f31-20020a05622a1a1f00b00419767946aasi10672747qtb.113.2023.11.15.23.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 23:10:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wRB+St32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3WVI-0004xW-HI; Thu, 16 Nov 2023 02:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3WVG-0004wv-QR
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:09:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3WVA-0000Kw-Il
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:09:27 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32da9ef390fso338629f8f.2
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 23:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700118562; x=1700723362; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=itpIvRPGh2BcrSYp0/DZr3YvPo92ZkJr+NW6dvwhfQQ=;
 b=wRB+St32uRwPzpGnPYEXbyP6aElvOhQu5HaqcM1+QmrZ1aDpU7MsOkyC9v62S+8Ayj
 cXIQ3pjr4rub6XNOGQLl+5KAou7TLEQc7TGIx7V9RQipglh4xkoK7BEkCIuZlJi8wQ1M
 LxkVzuRigy0nW+nGNomvyC5fXu7PnR1hqXuhNdPUCHFEklWEpQvqRghAtI7aRr7xklP/
 8p5qLFg9I5DY9hJODaoCyGIPQX031gwaRM3pD05GcW8llK9cArFi+n43Xmtg1D9ExGWr
 hzugvb7ZHnH2YAVGh2LxWfkm0HGaUTP5sFdJNojbDZigrTY8/PCrfqP6u55O27c0KRvO
 wwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700118562; x=1700723362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=itpIvRPGh2BcrSYp0/DZr3YvPo92ZkJr+NW6dvwhfQQ=;
 b=OAL/oDl/YSuOJiQVtnKwizlbWidw0d592V1dTsCkBeLIF0ZXMPX1DzmFSCCZ5xwt+M
 8wOqFAnJy5B3V3NMHIm21Etsf1A0bT2UpbTDu17kHFW2zK9c0QG3oPkxRonSEx8L6tCC
 G6DWMaS6Y34M29PTWxdvTz56Puqs8bMk5BqIIea6VpZHenOHx6FZrXvdv7R9Hf8/MwYg
 L+Xss1mFf4vYn9wuaUi9UXPk++Qu/kyJYvHVt7IM4KUOkhUz+9n8NL7C5ZBCnVBTSHvm
 pMSoqb7OVu/2EkM3/dyIp3qJMoWQm+bscWmEbgIy2K/M3CP3ykLieSMI6OHArHAz5PyF
 S/9Q==
X-Gm-Message-State: AOJu0YyNw/aKysYv7Qft1xSMJ5vVOGQNJkL9/PfOyv/xvzwfSYa4OK7x
 DeQgE2oNVokhxcJQdkWF0Zsjww==
X-Received: by 2002:a5d:6483:0:b0:32d:9876:571c with SMTP id
 o3-20020a5d6483000000b0032d9876571cmr12918721wri.63.1700118562235; 
 Wed, 15 Nov 2023 23:09:22 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4847000000b0032d88e370basm12580260wrs.34.2023.11.15.23.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:09:21 -0800 (PST)
Message-ID: <54a0922f-c10a-44a6-9a5e-26acab83f096@linaro.org>
Date: Thu, 16 Nov 2023 08:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/31] target/hppa: Remove object_class_is_abstract()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-3-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: K5/m3Md3x7wi

On 15/11/23 00:55, Gavin Shan wrote:
> No need to check if @oc is abstract because it has been covered
> by cpu_class_by_name().

Since commit 3a9d0d7b64 ("hw/cpu: Call object_class_is_abstract() once 
in cpu_class_by_name()") ...

> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/hppa/cpu.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

