Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp133439ejx;
        Tue, 21 Nov 2023 23:10:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Tg2xdra7DemSPZ07YnXVoC9EWkH3DsdgAo5huvN9WG26B1Wq4RE6YunlkL377/pbmAL4
X-Received: by 2002:a05:622a:1744:b0:421:c3a9:1e43 with SMTP id l4-20020a05622a174400b00421c3a91e43mr1897300qtk.56.1700637036438;
        Tue, 21 Nov 2023 23:10:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700637036; cv=none;
        d=google.com; s=arc-20160816;
        b=qeZ/TnzZRgkDEeu6zYnGqhJj0GMuG3yBR6NwUxAciyzE9lg5k1NuwovrJ2g2+21tOu
         jCbTANYNuQc3D6Bt0GePM1Zdh/g5YOyj2Gq3qCmHlW/UJLabPA5r9mxoyDFCi4nvB1pW
         UXKEi/HKywZ/eeZxI/GVWwLsaCSMfACJBZyzNS88pyxdtZEk7bXb4xWmrapEoGxKeLwm
         8PWN1FenP0t1aLCzRiHlDpDclOlgg07Y3VUE+7WpOqYDQwlOQAOaOlAGGmiomygg8Ne9
         J7BoPRhwAJ+WKk8dbXbENfWfs3rLqOXoWKXqXCo/lbNnGUmZfHRPCh6jbEUGSjurSry/
         qIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=iI2AN7bLsD/0pRvuIOpWL6/ny3ZU7AtowJj8Ak7rJow=;
        fh=UJNoRMXvawh+Nz90wsqCB4hLiJ339wMcpkkSd2G8ai0=;
        b=xriR5dwzYBgXZTODlyMZw4i/P58lEj49KvtR9ZypA2bIPVlgFvdc44UOJSI31yGPjY
         Ke4zVZ6WlslOyw7plcKiIIRXajv7svO2cbGp689EYXnZgOFDxdQ1fBshsz5H2GCJ+gg5
         zwhzBqgePzBeZZmgwF96/UzqKHLu4zvIbtg4VBgcZTvCtJ8Fl+s0YUs8AcWO36KEc1+C
         sGPjzXMWOduErVOAfZD07YuVy1QEPEcLeJq/fxxtHJte3dBb30tNPYViZZYcW4Ej8Rnn
         4BFhyaEKRn+p8PtbqmmTECBTAKbk5gCc/RIvSm9vpvSINxAcuYvWXrCivonBzYHulOOs
         voHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gX2kBjtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ex19-20020a05622a519300b004237dadb330si586489qtb.464.2023.11.21.23.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:10:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gX2kBjtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5hN9-0004JV-D1; Wed, 22 Nov 2023 02:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hN7-0004J6-R3
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:10:06 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hN5-0006M1-Jb
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:10:05 -0500
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c875207626so48272041fa.1
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700637001; x=1701241801; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iI2AN7bLsD/0pRvuIOpWL6/ny3ZU7AtowJj8Ak7rJow=;
 b=gX2kBjtCVxAEaLeApfd3XHEMurBKABSxc31nsRKX8OY3+SV1QA24xu2MT08kqoekJ+
 PQel7CJzv6M6QN/cklF1ZF6FAPxARxvjRJnXukvqP3NORujNGdFiC/WrKIiNcIeR5rru
 uTBNtpFfjoikbG5w8gZj1s3N4oFG09S2QRJKhmiMjy35ibuvheIEQHAJar4WWhqppPbk
 foHjdoeBqTYevnE/cMvDrlxg8ILwbktePjtxe3y33pgsDPk4b3/braFaiLyvIrC3Nw58
 5xz8YdWVyefN1UrSDBtV6j1uEb7QsNiJQVoClpL0zPAbPaZYlH31G1Wx2jg9Rdae7RKh
 r5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700637001; x=1701241801;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iI2AN7bLsD/0pRvuIOpWL6/ny3ZU7AtowJj8Ak7rJow=;
 b=YNbeOcUrG+jd/Yf338t84vkcGkOymf47z2AjyFWOWJzvdbZAYdCXB6aFmwEKL4o7WM
 L9cheJ8GwIzTL3R3YX1foImjgT5r6cexkksXuGUKClfxE1/k7jRc8RGEdg6NzdmvksKK
 Hs4gryOILl59NvW0DppNoKqk2c7WXOPrMXTXGMzbNzaj3Rsj4ii7BPJUXVIZwSQzG+RJ
 ftPeeM5urXVJ/w0KJpWwQoy6BCx8WcLGh9h0P6zRsj2FSe5dw22L9vdAxE+M1mF2XlcR
 HvKgGrCqyuMfZ5Z74razFX4Jl+UfZse6CT79oBRDjweidIXnsVdKcqZstotpZoDkJcGH
 BzpA==
X-Gm-Message-State: AOJu0YzT2iwouUO+WKEpZaLuHuGGRHm/e4/HtvSMXMo1iEVzf9B7YzEy
 bjvurbLFx8UFIQAh3VUaB0GBIg==
X-Received: by 2002:a2e:9250:0:b0:2c8:6f42:e2f8 with SMTP id
 v16-20020a2e9250000000b002c86f42e2f8mr975176ljg.16.1700637001284; 
 Tue, 21 Nov 2023 23:10:01 -0800 (PST)
Received: from meli.delivery (adsl-27.37.6.163.tellas.gr. [37.6.163.27])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c4ecf00b003fefaf299b6sm1155752wmq.38.2023.11.21.23.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:10:00 -0800 (PST)
Date: Wed, 22 Nov 2023 09:09:36 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 14/25] backends: Use g_autofree in
 HostMemoryBackendClass::alloc() handlers
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-15-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-15-philmd@linaro.org>
Message-ID: <4ijwm.ioplbxwzwzjo@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: 767jDKJXUj0I

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>In preparation of having HostMemoryBackendClass::alloc() handlers
>return a boolean, have them use g_autofree.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

