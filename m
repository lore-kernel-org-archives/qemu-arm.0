Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1737618njc;
        Sun, 3 Nov 2024 12:25:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8Qzrnw7JMc1nLBplKwDgGc9M2MFdnnXal8SQQfmm0SZnJjZfzQyod433fvtTsrZofI1+JfD1CG87T7g==@linaro.org
X-Google-Smtp-Source: AGHT+IGaqA/Vhx5O0pBXVjZ0enqzGRNHiTamGlyfOpoiKEIHtkzzBHaAc0e7UAhawcY/+vspDyJJ
X-Received: by 2002:a05:622a:8e:b0:462:b36a:73b8 with SMTP id d75a77b69052e-462b36a7729mr172184311cf.43.1730665547755;
        Sun, 03 Nov 2024 12:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730665547; cv=none;
        d=google.com; s=arc-20240605;
        b=gCIu6PWRQAd3b3VBStmgJq5dbl2xou9G0jXUhuSXhWso6ERudF7+lH5gqN0kQyfoha
         9hNOfdsCWdhubn3BZZGuwjMiPEzRdDop1eXIzBr8rrF/GsUIbBdLa36Tv7Shu/d6+XNm
         j19IIsHsGo9AhDXkd3dFdxzots9Z/4u0b81x334FJi01w7gZrzCPIgpt5V1M6bX/9vPJ
         JIe/cMPYHmUjronE4ht3gYORXohUPOFSOe7f5n/eUnWjIcEy0ESSYfhGTBhK1Pt2/Ypa
         RrfH8fpnpBKLmft+oHqBKZetUupbEEXmqNhp4QbPZPlMvahHuLoo9+kTweKP0t+pPdF8
         MHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9TO72BhcoqjDvsGnFAHcCIAG7XdTsEpDaHkOPHIanKE=;
        fh=H7pRGEq1rhNcAglnQ1Vab63zSJFZPd5k4sqDMjkDgHc=;
        b=XKLXaNnm6J/eQsJM82F0YPUYrUetSYWmLOt8r6jz2/hNFfNIX4SkFhAHjS4MRoyBTU
         Nyq9Dg2Q4k6JKi7/th3RBkotdN9pWv7+7PazNQAqAdGmdsBq6b7B7HaoWvIeVcKdP5vC
         GrEeERKPJK4VX+Pf6rMwj9Wr/BQbXcJrLBbAjdssDCUk+ICLHOpc5k1A2JMvWUph9w69
         5BFBE/wKJbanP5KhkUcdf26gZ170iHn+ycEr8MgtiBky+mbszlHBk0MKtTu08WexFfjt
         QtHN3rXEXuZzRoy+q9cYe9+p2cgymmBttSpoVbN6EpHaH1y0DbCJ9zdpqVSJjkpA6YGE
         EtBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgGzDzx4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1a1196si89296041cf.321.2024.11.03.12.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 12:25:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgGzDzx4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7hAC-0006Do-5G; Sun, 03 Nov 2024 15:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7hA6-0006C7-Ix
 for qemu-arm@nongnu.org; Sun, 03 Nov 2024 15:25:28 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7h9y-0001nv-88
 for qemu-arm@nongnu.org; Sun, 03 Nov 2024 15:25:20 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cb74434bc5so4229526a12.0
 for <qemu-arm@nongnu.org>; Sun, 03 Nov 2024 12:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730665515; x=1731270315; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9TO72BhcoqjDvsGnFAHcCIAG7XdTsEpDaHkOPHIanKE=;
 b=OgGzDzx4g6E8zA+2PuM3I9ZlWRkb9Ja40auM7nX4QCh5j+0AwwuzmZoZ1NrY7FaE8r
 9xAIehcNbZh7hpOLdX1uvWRLuNZ8n8xkyMfdqOwa4vPf+JoQLJRhJdDgYRKIKF1wKSlW
 ScVVx8KOtpBWntvt0852Sf6X60llE6+1tDMLhgBZ3PtUhyBiQAf4L/U6jyZ48Pni0/v3
 fMxIMbJwaAPJSS0AHNbbJvu+CZd9whAIP9clc47qoVwTAXw7qzmQ1CF9qJscdyhfmR5e
 7qdctycGmHtUSsNNu0h5IzVWph9JAlNHdqLJX1cSoA/tP1tw3q1i3y92ekQtB6Wr00NY
 xcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730665515; x=1731270315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9TO72BhcoqjDvsGnFAHcCIAG7XdTsEpDaHkOPHIanKE=;
 b=N/OOIEy36Hy3mn5HnAZJ0/0ErVSiMLhFnFWQltJpFN6riOHrhTc4HLBGhbto6x9rHF
 Ejhdlwjz+ZEu2Ki4jGr+xjhkIGytvP/QMpU4978tMUyzV6E8O7aYAP+VldxFRv7+mIG/
 UblfgudJHK1ORhJWKTz8f+QIHd4L0UInsyFNnVdnDpyjctlMWZWsOkWKrzwJrV3rLbsM
 02LX2CezpR+1ik1JXgXLhD+FKk1CX7+PflDHFBn0dZGAr6atYdlz0t2tcfnxXy8cDoG7
 s2u3poqBJES5w8AHddZsNMm3F+RAWlsRz+bxTUeB1sUZisA60NZXqy5KtBbOUWRCHegm
 yXEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiDi5SKW0wv8i4K3lRCJ3gMskBvN6m7S5xfkyhRSvfLGbcy9rDbF9W/dcmikYIPtFUiPXlz+xNPQ==@nongnu.org
X-Gm-Message-State: AOJu0YxM1ljesWk1ZmeScIhTLWAxK7rA2/bylxjhdg9USHIpqAI1pVvt
 9IGJaMskLKaj4tdd8bzPu9NYTmkuFOvzCqauV+jCsnpNsyq1PNp/9Qpd+5T9FPs=
X-Received: by 2002:a17:907:72ce:b0:a99:35eb:1301 with SMTP id
 a640c23a62f3a-a9e654cdcd7mr988323366b.18.1730665515234; 
 Sun, 03 Nov 2024 12:25:15 -0800 (PST)
Received: from [192.168.69.126] ([176.176.145.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564c4f12sm458172866b.55.2024.11.03.12.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Nov 2024 12:25:14 -0800 (PST)
Message-ID: <07c00f31-508d-4a43-a0ca-0ee31ae7409a@linaro.org>
Date: Sun, 3 Nov 2024 21:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] hw/sensor/tmp105: Convert printf() to trace event, 
 add tracing for read/write access
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org
References: <20241103143330.123596-1-shentey@gmail.com>
 <20241103143330.123596-5-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241103143330.123596-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: fl04wyVbm0wv

On 3/11/24 11:33, Bernhard Beschow wrote:
> printf() unconditionally prints to the console which disturbs `-serial stdio`.
> Fix that by converting into a trace event. While at it, add some tracing for
> read and write access.
> 
> Fixes: 7e7c5e4c1ba5 "Nokia N800 machine support (ARM)."
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   meson.build            | 1 +
>   hw/sensor/trace.h      | 1 +
>   hw/sensor/tmp105.c     | 7 ++++++-
>   hw/sensor/trace-events | 6 ++++++
>   4 files changed, 14 insertions(+), 1 deletion(-)
>   create mode 100644 hw/sensor/trace.h
>   create mode 100644 hw/sensor/trace-events

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

