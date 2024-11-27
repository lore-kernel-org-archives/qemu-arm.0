Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp574347njb;
        Tue, 26 Nov 2024 22:24:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1+RlzfdbMbI/RhSl3sOZp5zpK8KYxYRJ0r/MHw7h1h4UnS/ZsPqm6t5jFYDP14ODYMV+k4lZrR30yQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEBUdYbaT89BLQcPnxmypw4unxU0w916LfIrhQMd25lAg8w9SOj/0+lPMNDWQVmSzAOZqcg
X-Received: by 2002:a67:ead2:0:b0:4af:490d:7218 with SMTP id ada2fe7eead31-4af490d76e6mr1008068137.15.1732688689508;
        Tue, 26 Nov 2024 22:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732688689; cv=none;
        d=google.com; s=arc-20240605;
        b=ePMD9FStDOQIRvN89m/i5I3IzEiwc82qDwGRVUCXTUFT5V77SseBI8ZQYRDwxR4iwt
         42rugqw/E1gLVLGYax2MER7J9xKzJFCRETfDEjSuFBdBU7O1+wdbB80W63T/aBe3W9Ms
         nm73irvdxuVTCQmih1/j9MWtngCxmBEvZ+6+w1MZfPXItc5J4mCITBoXfupWNTRvNeNE
         k7wmTswV80rLunG/qRCkcoxkKcGBi1pUQZWNaNRsHWPFF58gr6DeqWHVRVRR0lN4ZJks
         6/hmW72zvUSBklVtA8DTiQegPOueQV25VEtGhzAx9prMvKmP7oF/i7whKyQshc6YMjIy
         OQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dGGrwJiv/92AaY57YgAv1EnTt9DUIcibsCKpBBlQNr4=;
        fh=IA+OBlgrzBbEfVnmNICc9IVz0nMlW47sPlZN+QN6rXA=;
        b=XEBd7JSTnb59EqBueS+UM/oZv4uK482ZZfUfHMCgUWzwJ8dwT+XgQIHwEo3/umVATx
         10bqSh+hRosLZmErUyX5AhHFI4R3XJYucnK3nTfhhtQHlJp+ItzdtOn8Hx6fqMLJqfKb
         MPXvG99FwWGj1YEUvKCv+R8N2BteXsKb686l2Zul0fEs+2pvCwyw2B5ta+6qYH7lzGuA
         W0qXwGK5jU5o+Cr/t+gjaj5b9JUxqnfUF4Hi+JKJGho8CkVqX+mGsjeZUO7/GrBJzA+Z
         PrcRhQIXlXo3f05QGP12qtPpapbPHByDRsXOIGDMgQtxkQocFOT/lLMnmo7U9OPdN1YZ
         ljEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Sx6gSb2u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4668c7d5325si75916061cf.601.2024.11.26.22.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 22:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Sx6gSb2u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tGBTP-0002Kp-SN; Wed, 27 Nov 2024 01:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tGBTO-0002Jp-I4
 for qemu-devel@nongnu.org; Wed, 27 Nov 2024 01:24:26 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tGBTN-0001o7-5M
 for qemu-devel@nongnu.org; Wed, 27 Nov 2024 01:24:26 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-7ee7e87f6e4so5286789a12.2
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2024 22:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732688663; x=1733293463;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dGGrwJiv/92AaY57YgAv1EnTt9DUIcibsCKpBBlQNr4=;
 b=Sx6gSb2u8rc/Xcw3ZUH8fGSXXDDA+G9VnCNdHi6fmQVeHihEIBk2G8F64HXpcEPHN8
 RJlxaY10B3zRIt9tt9tnv+NEyKWSWn44s3pQcg8ypJM6t5qvvtAnT8oCzIfocmILiw4p
 5X6S6patmHsWVutbLcVIDqZxuKu6FYg+l0arOQk0U+HmKPoKlU01TRPsXOfJ1vYUe1FV
 QyGeiYJ2Ai8ZiGW5mq4AsB0DDHRYJmW1UDMtSuonNDBF+bipypG13VqJiVtS4mydCwgd
 M0lYoeV8T7BOA+lZ5wO/A832s2FaQ8ZX1vty2oM8zdAThh3W/lHVSvhrRsyLD/mQoGeA
 3W6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732688663; x=1733293463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dGGrwJiv/92AaY57YgAv1EnTt9DUIcibsCKpBBlQNr4=;
 b=StfD5cGqaTAYkhSaFoYf4dzylQJjbyHwVuJMaN0pGIOZCT/3wVvoNiN4q8d1w8Oej1
 fcQoN2S/O+WUUna1Krtu/QcqrDMBM+g9eFk0Pz9bcn5Hv7jn7AXNXEZygXpEv+5ekNvV
 sghIPCcOKHhEsw2i0M9B5mht0TsRJaPRup3bBgyxscyQHaP1abBaPomrbnxTGeTwqmUB
 dE6dVT1FnfTMJT6tSx7Algf5QTh5nnWU205MWh6/AEwfXMKLryGyzxOEiNp9aDyfVcRf
 PIsRAGd704QbRGUhpckGWnEYqxzLA0Ezqwsygp8YUWZcbtCH1XpAJEf90XdXD9v6l5r6
 TF/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWV1stA+ZpXwehOaU2HI89QQbz7vaclBf4mD/Z8VN9nTOLh+utqQKYx3I9T8x9J1lJ5NQ/cjy56B0+@nongnu.org
X-Gm-Message-State: AOJu0YxHXaEXSbvJrnyCe6EcsQ7tcSp9k5Gs7NsdzNOGrpnRcQD/DI1g
 qeZibxIO3C8ZteMFPYorA34u1ipjso14ol2YykivLo39zVUEC3B3w7c4nTGu0JQ=
X-Gm-Gg: ASbGncs4Y/RUw8opI/OaPF831AUTkqegDVFVZU7J1ifzd4QDrvJXvIJia8/rs9erXMa
 yy6+Lu7O1iUUKY205rj9P96ZgFZFQ8BOUGAdBYT2L/KNBdpzkBk1iYpnFloZ6F2COD5YiSZlhkH
 mHLgF3UjpkBSrpRc9AxSp2DK6DTAeFgxx7Sho7fsvgo66kT4aYKCTe2lRiGWsWaWfGNt+yF1mSY
 7hZ9yCG5TnfW385txInEy9W7BJorR3fP9fSnWxZvRBDc1/b5D7dNmT2vaAdwDs=
X-Received: by 2002:a05:6a20:4388:b0:1db:ec6b:ba13 with SMTP id
 adf61e73a8af0-1e0e0ac3899mr2868389637.12.1732688663402; 
 Tue, 26 Nov 2024 22:24:23 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ee0fa48134sm665651a91.18.2024.11.26.22.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 22:24:23 -0800 (PST)
Message-ID: <0835ea77-2002-4a68-9c06-c0158fdad3b5@daynix.com>
Date: Wed, 27 Nov 2024 15:24:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/15] hw/vmapple/aes: Introduce aes engine
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241113142343.40832-1-phil@philjordan.eu>
 <20241113142343.40832-11-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241113142343.40832-11-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 7gEVMVmNg1PJ

On 2024/11/13 23:23, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> VMApple contains an "aes" engine device that it uses to encrypt and
> decrypt its nvram. It has trivial hard coded keys it uses for that
> purpose.
> 
> Add device emulation for this device model.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
