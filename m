Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp600737ejq;
        Wed, 24 Jan 2024 15:12:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQovx2wC2/kKR9++9CtdHjW7bfqn+m4aco8fYdixfoEtSWrzeeEFix6TPU9U5FPzt88+3K
X-Received: by 2002:ac8:5f52:0:b0:42a:45ee:8348 with SMTP id y18-20020ac85f52000000b0042a45ee8348mr550901qta.44.1706137941807;
        Wed, 24 Jan 2024 15:12:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706137941; cv=none;
        d=google.com; s=arc-20160816;
        b=Gm2zq7Lrn/MxZrU7jXnue9sW7pN2NVgOobVG4bUICfE5X3efV04pGaczLgKZ1joSDH
         RU/yi5L7UczeBFgwrz54GLwSd+R2DAYlFL3o0xwsE7Ce/7IJUKmKcJBzHpPl84hTDWkt
         n3RqNVJgCHnVl0yByCT8HbFguJU9QRpJkU7rinPkPgHTT50W3YO4Kgx5GSBM2i27h0GL
         3c/S3GvF+RUPY8Rd4LSbUS4K4unwTvZj4GxhN+cQYJSO3N4NAwtlUplY4Zll4fIULrCE
         0uO60ReMw3ErbOsmkCVYR8jsTNM/g7ZWFpLOpwS8HPQiQyEY5OrcO24g3l0X6qE3gOgu
         VO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XDkAiNGuU47Lf9GHTQcJgmICrLyRLIEDQVJIdDAwQeU=;
        fh=BV2EuOiWf6AH5YN8lynj7fi/DnpKhO3Y2LPVLIls540=;
        b=Wf679U0R+yNW4jbhm4hhnna8Blhe9UCWvNZ5AQuk1fxudY577x7DNB82sTZqvts1CU
         Ko/Amxh7E/i4alJW6awPEfJ8nHijNvYnRRoNWamkOr3tgTkeP4CAmJEe7Bh9DBNocOI4
         n8SyjNpnsQR095V5yUlmAGo6NjvgGW5yoUucxx+aUILANCIt/ewzeg9mAHJIYqshXFfn
         COM6R/k5+QhWloM3DAP5b6XAizjAeygWVXs8vqReRBMtHFL94DElvnh21I6ZAUXVYDpm
         mRLHt4vwZM1QQXfmGEUjWLoyKSvxxM/85MAw8/ZD3ov8oRHhDxCf+B8Ku8xx25hW99z3
         AWqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OMt0DXZI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t31-20020a05622a181f00b00429c7bfc4b2si11384995qtc.392.2024.01.24.15.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:12:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OMt0DXZI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSmPG-0006i8-Nf; Wed, 24 Jan 2024 18:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmPF-0006hO-2O
 for qemu-devel@nongnu.org; Wed, 24 Jan 2024 18:11:41 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmPD-0003up-Fb
 for qemu-devel@nongnu.org; Wed, 24 Jan 2024 18:11:40 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5c66b093b86so140991a12.0
 for <qemu-devel@nongnu.org>; Wed, 24 Jan 2024 15:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706137896; x=1706742696; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XDkAiNGuU47Lf9GHTQcJgmICrLyRLIEDQVJIdDAwQeU=;
 b=OMt0DXZIq+a7SVKYvpRmgZ7DDdEPacr7iURF2UPuOPx6FUzNWsXjE/0Cg2TD0lbj07
 3QsFYP57ebCGMFUdIdMTbVtZ8hS+5oR/CnyX/QHQPXMWIo/2vSftdJBYgSlcAeovjYtL
 vJWw/Rs7lUNyQfCJuQkmWo3s7rkOLPTNPT4uA+epPW9uoIwzTfPVT4fZwi3HdAVbq8o6
 szexNHDa0HFkkFcn/UG70kuoCXOmKi/jhshhxCkSxaWSBm9b6LFkdwN3MCn5OGsK2PCl
 dKJQTFGkRqPvvJlbCv0qqiu8GgmdtJEPE6hM36g1h31bGfi18Q/CHi1YoOvmXuuzaNmA
 2Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706137896; x=1706742696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XDkAiNGuU47Lf9GHTQcJgmICrLyRLIEDQVJIdDAwQeU=;
 b=DFLnI4Cdx6Iy+hhD3a/4BrSZ8qZzptk46kX8Oxk545+/c1XmCuExpEXDhcXOliyhrI
 LVzasgEytYd3a7xEidQ3cXsQQiav9Es8p+WKA+b7iPvrTAjtTnIfX+RcvdqEbCsM0ZV/
 6N/rmUmC4nWwGaaACe7CqTGye1tncuw2pBDjJaM3IPNOawiuoRndrjZRB2zZ8FtZNPvw
 CetmU0BbzGahzm/mre5sNEuTAy4vHW46lKoY4bRpX3tPCSPRUtpsiRu3DLf8wB2sxTKK
 s6bInTuhcUn1BVgb/xsrmM3U+ZlEglo5hSODjtXJ3uqJB7ul9RD8Yi6s3YCHhavUthcL
 a/wg==
X-Gm-Message-State: AOJu0YxqWAQgHjaOoWh3wSdKIqqbl706b1UVFjAfgC7CEPT+YOlKMYzD
 9qHNvFtTvcaN6GMYLALbKM9/LMKOvx1oRiTgz4Fu6lXZ/6G+C2V9hA2THNWv/O8=
X-Received: by 2002:a05:6a20:1454:b0:19a:a026:4e7c with SMTP id
 a20-20020a056a20145400b0019aa0264e7cmr134356pzi.49.1706137896214; 
 Wed, 24 Jan 2024 15:11:36 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a056a0010c100b006dbc750ea5asm9684090pfu.196.2024.01.24.15.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:11:35 -0800 (PST)
Message-ID: <62908ce0-da58-4f36-a88f-22487231fb08@linaro.org>
Date: Thu, 25 Jan 2024 09:11:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] hw/arm/exynos: Add missing QOM parent for CPU cores
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>
References: <20240123222508.13826-1-philmd@linaro.org>
 <20240123222508.13826-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123222508.13826-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y5SvKJB/gNRe

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> QDev objects created with qdev_new() need to manually add
> their parent relationship with object_property_add_child().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/exynos4210.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
