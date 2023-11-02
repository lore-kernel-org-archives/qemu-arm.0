Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp384439eja;
        Thu, 2 Nov 2023 06:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhdqtybxEja2qnX7WFAwDfFtVM4IdM1oy3caZzX86mjhpK7dwxR856glCgCjzxi/y/gvPg
X-Received: by 2002:a2e:984d:0:b0:2c6:eea4:3cfb with SMTP id e13-20020a2e984d000000b002c6eea43cfbmr1800371ljj.50.1698931365287;
        Thu, 02 Nov 2023 06:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698931365; cv=none;
        d=google.com; s=arc-20160816;
        b=obJxlS2loohao9Vn9ICryuAPdobASXAGkxLYbdXlYtf2Gygwy/H2HDru5QTGb95Bp2
         lcO0+7HLyqATQ6RPSRtkw3Cwh6J/kkgMpblzWkhL/drANkt7a9BhGIlHMfcDtgG1IAGG
         H18hyYixqlQUDafikzA/xPzOAn7//ypZrOcuWeLvjwg2UdvxNChBjEJ8eh6VkHrhrUDv
         BGKDx81Nk6/cVFoM/MhSrcdGPma2buDLArEkbrOKn246sMbL2qNFi7nUzGCfAX539XNM
         eB4QFUEgZVX49ZYyDhezG2Vgap/6vKUiCP++Lwrd5ZA4wRW59gO7qZwFd9eLUa080VcM
         ncOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3LzL2SUEcCWnA7oEvwvUvGvIzPJ+8BZI5QRG0zzFwEo=;
        fh=SvHDuYAzdQV5U08zdZH97tLIUUiEaLY00f4mdxmyTQw=;
        b=nv7aJMSV3Gn1rL2pZ7IkDuhD4IIDYjO7jaFr2ctyixwcHUUOKnNYtdrTcxmhHFOctJ
         GxIG7UFHFG4cd/ktd/ZMVSQzCt95ziOr8ua2X0ufoF42bKBMTTrb4NrolKEayzDZq4ac
         y4J4czmrRPiaZEq8OuniuVRUU5fZD2cEzilYFqM55KW/fSQYtnHfDIzo0JkGwSVoDSLA
         AJGEnHh0CssnO6rtHko1JHWZemWJyjcBbHBCdCyQEWNBGn1EEenQKQKQQTqmocPwH9bq
         /WVYtQL2ian52U4kiPF9jcihQ5GXnGNYUhF4a138tlUfafiGApXgscxTHJzxIL8jmEjO
         ZJsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aI7YM10q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020a7bc8c7000000b004085a02297dsi1505853wml.61.2023.11.02.06.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 06:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aI7YM10q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyXeb-0000Fl-1o; Thu, 02 Nov 2023 09:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyXeX-0000EZ-0Y
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 09:22:29 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyXeS-0000OB-RU
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 09:22:27 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5437d60fb7aso1515416a12.3
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698931330; x=1699536130; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3LzL2SUEcCWnA7oEvwvUvGvIzPJ+8BZI5QRG0zzFwEo=;
 b=aI7YM10qpe3uVTijKvZzw/9WjsUYJ2/PGfd2BtS4zqruBGW+D+Eq4+UDQmJbwIvR4X
 uvgsspehYVXAYH8va4YhGX64T71Px7HhOs0otdVFfUwKDslRtgbwLiHr7sr1GaA/YLMv
 1PamR6WwueOMF+IM3FzbKGcOGjRj74pRLUnMpf7eXIFvmX2kV21CQ6DnYFDAMbc5Vpeo
 SeH5naVodZH01DeSUA/YAhnKYeI01GF9rmbuOWxHPvVed0NpLTiuaNFzyDxmHeWvEQUu
 mwfYkMWOXBs+6OmhSeYXArL1R/XK+aOXIVesq7qtoeQGvNGMbduFD2fXPZTdcBGJLmgf
 xzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698931330; x=1699536130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3LzL2SUEcCWnA7oEvwvUvGvIzPJ+8BZI5QRG0zzFwEo=;
 b=LF8VKdVnJgPTec7NgNqf61KJc055WAICMsiBigm9bGiREcbZWsPBl5NVij/1V1/qFa
 278ifdDZIFkPzIeGC/Ibq2ESvtTI35hsYNfjBOsrEEEltCpSaVTjIj36u7tpiIWbq40D
 g329uChS0wj7sxNv7kupvIRy3Vgp8yJD4Hzpx6ZhlIwQmR8ZqsSF6BT3XG/iEkRQcCOf
 /S4Q+EEeu4TrgOTA6C8QuYrqkyePqExsS0IA29ZMxj/fS3Aa2qhBuazeKb5gzGWYRbrn
 xTAH4KFXWr9KTzW6wN5ZMbi/2fIBLCyf3ZEXljw5Ekto5mK0aNLiwEvZZS3JA0FMDBpO
 ndDw==
X-Gm-Message-State: AOJu0YydQJzeNfSsQsXE8jpe8ijy5atR7bczr3KUQJCQ610oKeU2c+jT
 dLNfZEogSNdtlJ5Wm9DYHbd3on2qL7DiKaBhg1cBuA==
X-Received: by 2002:a50:9b1d:0:b0:543:b9ae:a0d5 with SMTP id
 o29-20020a509b1d000000b00543b9aea0d5mr3380105edi.4.1698931330419; Thu, 02 Nov
 2023 06:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231031184611.3029156-1-tong.ho@amd.com>
In-Reply-To: <20231031184611.3029156-1-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2023 13:21:59 +0000
Message-ID: <CAFEAcA_c5PoxBEHvnc8WfKhy2pVQ8uBSH9TwaTyitWpJUCKOYA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] AMD/Xilinx Versal TRNG support
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.com, richard.henderson@linaro.org, 
 frasse.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: VCgDdjBrAJ25

On Tue, 31 Oct 2023 at 18:46, Tong Ho <tong.ho@amd.com> wrote:
>
> This series adds support for the True Random Number Generator
> (TRNG) in the AMD/Xilinx Versal family of devices.
>
> The series starts by introducing a non-cryptographic grade model
> of the TRNG controller in the Versal family of devices, followed
> by instantiating the model in Xilinx Versal machine.
>
> The series ends with a q-test for sanity check of the TRNG model
> in the Xilinx Versal machine.

Applied to target-arm.next, thanks.

-- PMM
