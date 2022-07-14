Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp886421lfp;
        Thu, 14 Jul 2022 16:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFhskma91FsySD5GhRHv0zR7dltexbjxSBFIPAVRsE2qLgPptiBS0aoa22Fup4N0/CNE0x
X-Received: by 2002:ae9:dcc6:0:b0:6b5:74e6:beb6 with SMTP id q189-20020ae9dcc6000000b006b574e6beb6mr7671377qkf.347.1657840875948;
        Thu, 14 Jul 2022 16:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657840875; cv=none;
        d=google.com; s=arc-20160816;
        b=cVcnCv+HBG72kDaGk1C8YlI53KKlv2ygHQ3lKgWYiu6G7hFssqdy64+p3WsyB0Pv9k
         LR7grQGPxRBm0sOp2R2wLWMfeO3H8qP1xNcLph3gZ0D/rsIE8WyNfNIRUNNV0kwwS5nn
         kNb04N1jFaQzNZlkYy63Q+YPucKbPqT4N9NhjcfBGhZElqpZVCBDky/BMEVNwH84i74E
         q23JcL+monzPpemi33Teh+8Qgj/9dOVknQCilq1LcJKhPyFHY9/vqc4zRfLdRo3TcROD
         Sn6J3ahjPdDIZmASSfYgZM+EE6jWy/TT1+Aqff8B9F54QpeQoh4n1/VGdzpUgKcSMF/p
         1bqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ujzJGsnIWmO79bhjItobanY98BfnQMWeEqz1KoZF76M=;
        b=WZnRKLoN5nr26Q2i3uNZhHLCL3DLW17mRgRpj+XVjm+1HXgFAqr/ciMXaIX/8TEVxl
         fG6ThP+X7/eFqWERTrUR+lSTNtl9+yudgitwtet7BTv8D5fFpeFqPJFeekb8YzOXzeTq
         0H3z7+XqcAaahHjabtD4zib8Fk3cogxSBMa3Q2CLXIFTwqMl5fhgU9VpMSCcVZiNzmR2
         h9hw8BIQu/FD9qtNxEz+hKWtbTMSO38idHwaTe8i/cBqsyAyzntywi2gf/xuiW+kRJKJ
         iogUUMZYwXPQglfQgyGj7Gfgr8rOV31szHyTPNqkloCA0qqqeL5w4u5NrMqpruHqeEUS
         1fqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DtvD/NwS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05620a0d4f00b006b5bc41cb04si1818053qkl.184.2022.07.14.16.21.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 16:21:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DtvD/NwS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC88x-0006jk-FR
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 19:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC87q-0005I9-No
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:20:06 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:42525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC87o-0007a0-4l
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:20:05 -0400
Received: by mail-io1-xd2f.google.com with SMTP id h145so2683023iof.9
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ujzJGsnIWmO79bhjItobanY98BfnQMWeEqz1KoZF76M=;
 b=DtvD/NwSv8fEo2z+Awg/TcP3WG6llLGByIGrPMD6UpMhGfr9yOwi1phFLin9WkGqJJ
 7hCd3fBp4KgTJxA9I2piHGVCJg1Ljv1VM37QlhrXQdUWWZt8xkvTvyIKEk5gvrGBw5Pp
 7wKTk6EYC/T/2ill8S+rXjx+5UKsPcn4ntC0HGZYl4WycVGS9UUfvi0W+YmTrEjrozCl
 UJlWjwEjBKjki1TpUjoA6AK9AmS97w7Pjr684qnt8P7i45rORRKaykurn9XQr1tEJhd/
 pfEN7RbQpEHsvONGdudFu2jFXQh6lu4EoJHH0XLPHfjH6ziW7RmVxdMKJHblV5pkrdcE
 Qa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ujzJGsnIWmO79bhjItobanY98BfnQMWeEqz1KoZF76M=;
 b=gncQ3me9Ajcf9S1n7hKj7BwXJQb8oGNjqXNxYYIVJzS2A3pEujH7+42j/EXdFgYWK+
 LMF3t50bt/CK4e/Pquqw55ULc+JBFWnBjlMoUzmf345y+orGkKeZc/DonaytGCdPg1ax
 EhuChvtlnJXBU6bMU+gZTdtsASHzhmOQQqdYSMlTLIn3RoFUxJO2Isbn0FmmJ/EzJYQ7
 V7f1Vo0nxrypzLiRaJ2/04uOHroj/W5v2PKQwgMX1SqDEXqei6I/18esGevOdQnUgGKJ
 ScNC5Km41R/xzkZKRoqY/PBYg8B+ddt0GORO+/eRlSdo6+lVGV0Vppr5GzIylD5TyhxY
 +HIg==
X-Gm-Message-State: AJIora+3nLLctSU988gO7W/Bq8kU9ENxizjeQ/SoQRZ991v2AzzVNPFL
 i4MnIF50RAAEDhM/SrMu3AppOQ==
X-Received: by 2002:a02:2a4e:0:b0:33e:e3c8:35c2 with SMTP id
 w75-20020a022a4e000000b0033ee3c835c2mr6327179jaw.170.1657840803142; 
 Thu, 14 Jul 2022 16:20:03 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 u75-20020a02234e000000b0033f4a1114a6sm1244389jau.178.2022.07.14.16.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:20:02 -0700 (PDT)
Message-ID: <c09faa4c-d0d8-e589-1955-c674441f4b6e@linaro.org>
Date: Fri, 15 Jul 2022 04:49:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/7] target/arm: Fix big-endian host handling of VTCR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gaIs5Usf5ONT

On 7/14/22 18:53, Peter Maydell wrote:
> We have a bug in our handling of accesses to the AArch32 VTCR
> register on big-endian hosts: we were not adjusting the part of the
> uint64_t field within TCR that the generated code would access.  That
> can be done with offsetoflow32(), by using an ARM_CP_STATE_BOTH cpreg
> struct, or by defining a full set of read/write/reset functions --
> the various other TCR cpreg structs used one or another of those
> strategies, but for VTCR we did not, so on a big-endian host VTCR
> accesses would touch the wrong half of the register.
> 
> Use offsetoflow32() in the VTCR register struct.  This works even
> though the field in the CPU struct is currently a struct TCR, because
> the first field in that struct is the uint64_t raw_tcr.
> 
> None of the other TCR registers have this bug -- either they are
> AArch64 only, or else they define resetfn, writefn, etc, and
> expect to be passed the full struct pointer.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
