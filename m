Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2345632ejb;
        Tue, 23 May 2023 23:19:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7M8dQWpf6TbZCGCIqgIqom9R8xuJRo7qHfb9aUbN0U5Ib8ITIH17sK3j5S9hq11dGheApC
X-Received: by 2002:a05:622a:608:b0:3f4:ec9f:95e4 with SMTP id z8-20020a05622a060800b003f4ec9f95e4mr25736086qta.6.1684909175720;
        Tue, 23 May 2023 23:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684909175; cv=none;
        d=google.com; s=arc-20160816;
        b=XfwWqYiHdMeQ5GNufVY38jCRtccpUetwbS+FcVkDxBPFnVF/YoHxV7PCMcgRtiDjly
         1D1si2nUeYmtKbDtW2fRn9YQM+Zk34Zx3v/fCEHnVXpciooJd+vU9cnk5U9OeBVURx9k
         HnUHI/wPRxUqgafkyTnp9DnY09WdhN7Q+Oi8Pjkv8wZWmWIQMR9BGbHCqwpSh+IHaxWE
         1hvpUF1wfej2wPAgFEinpAp/gPv+rOIAUemEP4QE9s2ix0s+ssu/Hg9npN8gLAazCuz+
         EQv6L21ixXGIBoEahuNBEU8WqP1JdwPpRJ3k4di9TdpUnVOBmcMkt/MV4gYu3RhoLCTP
         iy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zXP9bbbfnrujl2z83OZx0ev2hu3VaP9qwcc8H6TTGA0=;
        b=u5qtwEO+ORVfCokPKdvKykecjrVZIG0XuSrEMko1QK1Gg60JKfINsWnNnp4mf67Dyl
         MUka3WFZ/S/WUjUjniaXx8PMtpGRSIv0NrP1j0RRj3amQLPW6fYMQ+YJeUPEUwd/r5um
         gwxeLjikYfIHJMXLJOjAEOXmltZCRadiOzozzI/lhOL1sF9LVJ0sXcq1enb5U9a6aFtR
         MlEZH1sn2DaoMv1YwU0Y7tO1PcDfnEFdetfiirBHh+QUFmJYaE5nnML0T32MHtuwSI0x
         7kETQ0xiIZVjdfO2nj/AVwSRDU5oZBrEOf/43c7Vr54xBo+agZs9inqwjLXWjW2Q/5T6
         TIrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rh3iCj/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a05622a15ca00b003f69abc8e60si6413842qty.339.2023.05.23.23.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 23:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rh3iCj/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1hqJ-000386-PS; Wed, 24 May 2023 02:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1hpo-0002q8-4k
 for qemu-arm@nongnu.org; Wed, 24 May 2023 02:18:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1hpm-0004OM-LP
 for qemu-arm@nongnu.org; Wed, 24 May 2023 02:18:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30644c18072so205517f8f.2
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 23:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684909132; x=1687501132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zXP9bbbfnrujl2z83OZx0ev2hu3VaP9qwcc8H6TTGA0=;
 b=rh3iCj/WHxJvuwvSVx4YUSw8HaCMvtBI6hsxrjh9Gsef0+hPBA5cwkt3aIxXhaq9c3
 NJD5ICMCCI9RL5XDrCp6Xfv/ie4iqNJ+z8clvW2boPkVvilU7FPq9PIVJSjKghFQ7sVG
 eZ4Qj7vHVoG33Mx7GjzQDpa//6VxiWwcpoGgUJL3nh+2lGWN638MQzXY+j7BbnDmWocy
 OvkOx3pk1sYLl40lVQfw5/GChU4oEseYs3BpYoW0szd+459NLHqo9M/nMn6NkzfRbifY
 fGxI8ifEhUZ+jsl6aXx/mAFkz5TnJCIWkUrrrhzJIgw4w4fmkkJwTwFme/X7tUIE5Z9A
 /l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684909132; x=1687501132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zXP9bbbfnrujl2z83OZx0ev2hu3VaP9qwcc8H6TTGA0=;
 b=SiYLFE62Nm7KIZZX5n7zUWftjAIiu0GPux1u1ULu8Qhw+ZpVlZwcV8ir+syH/krNz5
 Sv9lAko3cLTugU9C4E/iITGDKNZlZru5SYcLwCd7g+UiKfbRMJ7A3qpXP+b0Bsp803YJ
 J5Tkq4k/mRIxCO9V0k+evYIoKGIp/j32FMJAJXbF+9q6jVdDutgTt0N5RQL2GsvWk7Ag
 E7vm9jE8qNY588dtxeibLSdYXtiX9eF2qY7Xp8IGcJMZW5jBbtXicYwJDYvAVAMdrV2Z
 JiXezT0HpTUQ5fe1fpwpKM58zs/rd8HFMLY0Gj0P2BSY3au58z1MsNZTSBoSWpaLgRYQ
 4c7A==
X-Gm-Message-State: AC+VfDyNUYY9XSV54okfWI43bV1T5F4ncBLyRxSq7J8gYNZByuEiOlSm
 x/Dz5NNDSWKhW8L4+4j06Bn9fA==
X-Received: by 2002:a5d:618d:0:b0:309:53f3:6e3e with SMTP id
 j13-20020a5d618d000000b0030953f36e3emr11707907wru.69.1684909132476; 
 Tue, 23 May 2023 23:18:52 -0700 (PDT)
Received: from [192.168.215.175] (35.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.35]) by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b00304adbeeabbsm13197162wro.99.2023.05.23.23.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 23:18:52 -0700 (PDT)
Message-ID: <9be2cb0b-307f-2f33-8c7c-d8fad36a0b98@linaro.org>
Date: Wed, 24 May 2023 08:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/3] hw/isa/i82378: Remove unused "io" attribute
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230523195608.125820-1-shentey@gmail.com>
 <20230523195608.125820-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230523195608.125820-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: Na1FfHpXDyxg

On 23/5/23 21:56, Bernhard Beschow wrote:
> The attribute isn't used since commit 5c9736789b79ea49cd236ac326f0a414f63b1015
> "i82378: Cleanup implementation".
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/isa/i82378.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


