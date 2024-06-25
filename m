Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp590850njc;
        Mon, 24 Jun 2024 23:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVW5yJnovaqTN49pY5KE5uKVsPufHgZE2VlnhI5d6bgp3Dm/MKAI/grmR31zac3W+Mr5OOJ8utzDV3K0b4/fnb1LJlAwdsV
X-Google-Smtp-Source: AGHT+IHSQevj32cz01LBHVPPLo7rY0osOjSF7CVePyK/0esP3Z7idABlBLTTxY0eGHOp/sr4AeTD
X-Received: by 2002:a9d:7587:0:b0:6f9:9307:4286 with SMTP id 46e09a7af769-700b12dcc13mr6930262a34.36.1719295225804;
        Mon, 24 Jun 2024 23:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719295225; cv=none;
        d=google.com; s=arc-20160816;
        b=daM8xUzKKogCql4Lb4KAgZwel8PCuuE+ABzTc5fpU/qZojIfovStdh7e2rMjt9SJeX
         sVsDs4SE3sHb69biKh9JyFS07eqztwqcuagkK89BGOCn1VgE/l5np9fF5mPlMG2u7Drl
         8DdAha8W2HRJhgPHO4X0qUAILxlllkux20pWvjd67DIObozMoFu9p48V4tv1J9JB0Dii
         5zyFp5WoU6EWVdZRGQoKXcEZUDcoAslNXHd7laJrkh7qH0U7q8Yad1z+Uxd6e8z8nG6v
         diUSZVdm3X25A2oKAHkJm8dextFZ/acZy81XcVWkuFoYRLJwFX3QTwz+uACMUT0jxEpl
         268Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kzV2R7UjISGN4klcLuozxDG84FUbG0/gq9Bmu7Iw+zc=;
        fh=35azH/2PohRGpSzKqF8omiCTaUQ0i/9geUx/QvUuUg8=;
        b=N5g5apBDfTa3+PWCos395KUtgIe6Rsk92Ddg+kr353odVcPmQg4qOKUlHP2imu+gQ8
         MkK//c/HRdj6QY5wIbKJxB1xehGnw+X98+aMJQtEFrYrcNwQGNgbDifukwq427AN3PI1
         4bkqKSVjcFzZJcxOmgFTe1gSTubKVza8RXUwjkMxGjRmT9pvHSeiYrYgNDKaw2MYvxBi
         M5KgYq1VuhIg/JZnSmv2dZhSitkUZjdOGI3xk8PxknK4SjZRGFHbXvpBWM0dySrjClmY
         yW6SD+iufgdSlrogM7ojDZuaNSBpk80Gv+cqkPCwqIbooR1tTHETTAORNK9mKZWlPcHl
         NQAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NJMAIm16;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92befbsi1021924285a.465.2024.06.24.23.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 23:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NJMAIm16;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sLzDw-0002LZ-GK; Tue, 25 Jun 2024 02:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clement.mathieudrif.etu@gmail.com>)
 id 1sLzDk-0002IK-9S; Tue, 25 Jun 2024 02:00:00 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clement.mathieudrif.etu@gmail.com>)
 id 1sLzDi-0002uP-Jj; Tue, 25 Jun 2024 01:59:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4217136a74dso42218585e9.2; 
 Mon, 24 Jun 2024 22:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719295196; x=1719899996; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kzV2R7UjISGN4klcLuozxDG84FUbG0/gq9Bmu7Iw+zc=;
 b=NJMAIm16wEjQT2vRuROcq/MqZkX7tcds7FPMIeq871DxzUm82sRTE/D64/uEz0hBxs
 HyH31L4uO2DPbdOhQttp8UZ1UgxwOkj4Dc1ds+MAKqKc1cDjoJIUdlvOOJRcDIKOt8Wa
 c7D0G/HRty6H843xejLMOQknCy3S2XOVwVjPNCfjS06y8fQtJIpZ1UtqCFsqGHF+2jsT
 x8uMd6JtiCWPB4VRa//PJh5IT46SVq8Vy+JRWwYimyKIlKgnv3YavNqGVRHMmnRj7Gug
 Mtcp/V16z+vJwDXpgkOL2jwTmoGLl7kLNEaPvi/rnNhS8gcqP6R2I5AmaT8WFQqcuzlc
 gmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719295196; x=1719899996;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kzV2R7UjISGN4klcLuozxDG84FUbG0/gq9Bmu7Iw+zc=;
 b=biI4gccH89ksAbJOcpxpTLU2YR+6gCesNS0gTYNUDeOXmCpRuclwkdNbVHviRJt7cr
 bDQeTUNghphrSCC2NsFNjRZctRlCczvZb6w19PkF0Fd0e4yg2jwppImb3gxTD5qb+Vnr
 k+K2iQc8ltfblB7mPjEELWiuWh6SF1SIkCrxMFDZrL0jdaCoAb4zlCJll7lAB6UuBbXh
 RDJCBWHJe68S8Db8fS6zOaLtiU+6Pf2OZ85Fq2NEIztf0hZjUISrcGsawCcTFw4lpRc4
 m/VcDP1BssdxXNZoHr/i+ArCUIHg8Si4aYLNHQHkASf5avENJSi7cwLxD7h0ztx40CSq
 vR1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXY6t8ZEzgH3sHCprvTze4UxdfDZ3wHa59kB5jJ9iyEwAru3T2fKDw1xfqvhLNuQGyZdNYQiknEiCoOZd41tTDSiJOLjGlg4HKXZffbqrXvFXBZ9RUFkJCt9I=
X-Gm-Message-State: AOJu0Yyz9vJjkwNHlZFRKyCWF9iacNI6ER466u6G2SDW+pTwhk/Tobc8
 mCaTZ0GQR1Iporc5QffboViu5M1ESrTjbFHu1lGIlzRy2bH0PH0A
X-Received: by 2002:a05:600c:3b14:b0:424:8dba:4a4e with SMTP id
 5b1f17b1804b1-4248dba4d43mr41758835e9.6.1719295196038; 
 Mon, 24 Jun 2024 22:59:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:136:9c60:df8c:dbac:5023:d101?
 ([2a01:e0a:136:9c60:df8c:dbac:5023:d101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366f973b7e5sm3112986f8f.14.2024.06.24.22.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 22:59:55 -0700 (PDT)
Message-ID: <24dbb79e-cdcc-4415-befa-e6351c8f29b4@gmail.com>
Date: Tue, 25 Jun 2024 08:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] aspeed/soc: Fix possible divide by zero
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20240625015028.1382059-1-jamin_lin@aspeedtech.com>
 <20240625015028.1382059-2-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: cmd <clement.mathieudrif.etu@gmail.com>
In-Reply-To: <20240625015028.1382059-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=clement.mathieudrif.etu@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Jlt68H+te0/d

Hi

On 25/06/2024 03:50, Jamin Lin via wrote:
> Coverity reports a possible DIVIDE_BY_ZERO issue regarding the
> "ram_size" object property. This can not happen because RAM has
> predefined valid sizes per SoC. Nevertheless, add a test to
> close the issue.
>
> Fixes: Coverity CID 1547113
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> [ clg: Rewrote commit log ]
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/aspeed_ast27x0.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index b6876b4862..d14a46df6f 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
>       ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
>                                           &error_abort);
>   
> +    if (!ram_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: ram_size is zero",  __func__);
> +        return;
> +    }
> +
If we are sure that the error cannot happen, shouldn't we assert instead?
>       /*
>        * Emulate ddr capacity hardware behavior.
>        * If writes the data to the address which is beyond the ram size,
