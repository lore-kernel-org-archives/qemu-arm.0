Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6327836ejq;
        Mon, 15 May 2023 00:13:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6U3RxBpbL/yBgMDyMkI+dp/SltS2C5pKbIdTrm/jU3nVyOGG747cmJCtmqGTG0Oosw03kF
X-Received: by 2002:a05:6214:62b:b0:621:431e:5409 with SMTP id a11-20020a056214062b00b00621431e5409mr40277349qvx.16.1684134811202;
        Mon, 15 May 2023 00:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684134811; cv=none;
        d=google.com; s=arc-20160816;
        b=ovY5Rb8d5g511+dkMzLrVNI6NXEmvl5KoP9qlfDlVkW5yW2cmijRGWYbYuKlIM3oIC
         hp+eYNxFOzn4NtkUmPXNvC5/3guNFuIzM8LzYbvVPqGLmUZ/qb5EO5xZ1aq7o0grMYYb
         oyPzEdX1/U4vh3BIpaaqy3cXFRSdGaYk14kRzHxQcq05214XSKq8xwMSAyAaoT0NChKX
         MdbjIl6UGlHHWv1XE7H8B9juLKHrR0XW4CT3o8QsI/rGmfqtqoQSxVQu211dBTHkhjOm
         fhGWf3QqL93xRWaFbCz6aDCUprnAbgzIy0jTRZ0M4t07HzUbK0YKaNw7DEysz9WWjHpq
         4S6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=b/oiEmPQIkeFpASoq4XTupg+lFlgGViG0MiItQ8ZB6M=;
        b=Lz5NvEvsQv9ydlluT8TDrmrrm87aBkxoaGS4mYPrMHF14TyukVxsLtTrAgOhXd1Uk8
         u0hQgwUrE7NYVk4kc61XJjfkHwS0V2ryN16D1Gm4ixX2S78tusIj6N8kNHCv4hhKBHGL
         ImTZLEpY22P2pwVVl4qaPZ6CSoWx58nYrCuW6Z9SOXsO7qgp7fwYufxLMZCpJaCjPrAC
         v0tQUF0CcAGE1XsCh1Que4kY/kXf1QkxhhubG9Cvt4j03ONeorFLtbxLGQXX//YbXzle
         vEIHocVJPACdeWplOOBHiGr50SmYfOkAp2qjNfapEfowbNpi2wKphAoOFfFxmq/cKgQ1
         o0Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M2y9VdKC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10-20020ad45f4a000000b005a10f30efd6si9393489qvg.472.2023.05.15.00.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 00:13:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M2y9VdKC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pySOJ-0004Dl-KU; Mon, 15 May 2023 03:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySO3-0004Bn-Io
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:12:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySO0-0001KG-V2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:12:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3078d1c8828so9186405f8f.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684134764; x=1686726764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b/oiEmPQIkeFpASoq4XTupg+lFlgGViG0MiItQ8ZB6M=;
 b=M2y9VdKCVU9ytFgykqm69QkwQsHlim8azhrzBL3DVs6byZmmoniwEm99CVTICws2VO
 vyoOnHsoQo4OeLUawDQ+L6fSX41ULOWhJGJAM85fADipSnZBMUHa6TwRzegNNbBKHnCZ
 TrnR9xJiSj/ObVScsox18zmz0nuzZN19wIvq0lrCZvYnFn4UuRq6lU4QpSbheZEtROBs
 6Q8rBed5FzsLjCf+O3ANNt4IWH5scvmRj+5lu4xQgBIsRL70d3+fnXQU14ZGUIltHMfJ
 FnvljRjAYsAgxiWqva8Jib9V1FQ03/zdkbAzy3yOnhXEUM/xqR5fbgtXFSQGwFuizkqy
 M7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684134764; x=1686726764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b/oiEmPQIkeFpASoq4XTupg+lFlgGViG0MiItQ8ZB6M=;
 b=Lu17bC7Tn0CDwU8n1KdTExR3u7iaTjvu2gUoUsRLWdKWXu+7CkGE0TNjB5DdOh+Bnl
 U/uWs0RIIpFiCU47hMe+MoS0rUT6+MPSSOwWopDofCYwM65eX3CFFRYN9521PtWEz8C1
 pwKLQTIehP9SspDhA26b37mqLZ2Qwss/VBt/Cz6U696bJZavioko7Zx6Hf4ow62TvipR
 r+RVBmqnFuHklIpk20P2Wj1wl3suA0TFK6tu8yqvBGj00XZbY6GH8VbMJ5RGxSn9C0A+
 Aw2JJ2PlCGHwPyYDC5Tq8IvUrpETzNwnMEFb6lcWRmu8A8o1jIE7AlmVfGzkoeDSgS8h
 fs2g==
X-Gm-Message-State: AC+VfDwj/yKxfSQbY2jSDG2V3h99LKxI7UVv+LCx/y9WiiAPgVSFMTNG
 cn37Sz7WjTIKFe4+zzCoHM0kXl2dzHRLzztoKyPJug==
X-Received: by 2002:adf:e4c7:0:b0:2f1:e162:d48 with SMTP id
 v7-20020adfe4c7000000b002f1e1620d48mr21606234wrm.47.1684134764629; 
 Mon, 15 May 2023 00:12:44 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l18-20020a5d4bd2000000b003078bb639bdsm27184552wrt.68.2023.05.15.00.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:12:44 -0700 (PDT)
Message-ID: <e7cae245-b496-c8bf-9158-f4d86ba0f8ba@linaro.org>
Date: Mon, 15 May 2023 09:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] hw/timer/i8254_common: Share "iobase" property via
 base class
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230513100906.46672-1-shentey@gmail.com>
 <20230513100906.46672-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230513100906.46672-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XGJLTRzJZi7y

On 13/5/23 12:09, Bernhard Beschow wrote:
> Both TYPE_KVM_I8254 and TYPE_I8254 have their own but same implementation of
> the "iobase" property. The storage for the property already resides in
> PITCommonState, so also move the property definition there.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/kvm/i8254.c     | 1 -
>   hw/timer/i8254.c        | 6 ------
>   hw/timer/i8254_common.c | 6 ++++++
>   3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

