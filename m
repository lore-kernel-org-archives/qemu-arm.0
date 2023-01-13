Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp710413ejc;
        Fri, 13 Jan 2023 14:09:10 -0800 (PST)
X-Received: by 2002:a17:902:a984:b0:192:9a7d:c38a with SMTP id bh4-20020a170902a98400b001929a7dc38amr55599502plb.9.1673647750296;
        Fri, 13 Jan 2023 14:09:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673647750; cv=none;
        d=google.com; s=arc-20160816;
        b=l7+k2GxVWYKNbYvY7kH9MuM4BnFs1Nw32iChK9jKngH+CT+r+tvJrc/zTRuQEoGIJw
         5tIemNPQ3i1/n5vjkDWuCIeyFY3FO+DZU8P1LivxK2n9WzxSoXD+M1yUa3/Z+ITV6ZzO
         PgpYioAuO4yiCcq4DpKc6W+B/jCsBRsXZBgYLPQKgHUgbygnI0KQgyr6GWwZ4ZrMx4rv
         14p6bGhrLaDR4n6A2dTFwYwkz/QNdiodKqsXx1rSiRaVLSbNUb4kMIcGi2YPUUE6ZbFg
         +6yRvW+Z4f9MoP4XeAI57R4VPA9DVq4+Xu1Q4gOZgnV5BcQozApsTZk7ZKJ2iWNWqXXE
         Co+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Qcq2EZLOb5aNSFGz2N0m4y4IHwpRjOcqwcp5ceuj9ZI=;
        b=ntLQDTtoaeWOQvnTYOCcBZG2ByyevdrOD8LivnIuDEwM+wJI77SAZXM6EhrdmCaKmI
         uWIxjrQx0R0HEzTZYqB8oCiJtJAAASZssHGBuFjGOFVPFBcc4sAw3bt1gd8vcZHt03Gc
         l6T1/Ih4dQcfd88TiNipr9cM9HLOw1QzDbpcOH6aIGSN1ys87WJrVfUFWNWMOdAd2v/g
         /JMmrU4UE2Fnc2LzDwfCpCWts5VH1E/wirUsZeGvwiJQl13BVNmAr+s7PjOpiZ4aWcVB
         ZUglFIFnPVHZlikvDhM2CfiAouA6MwTm7L6fpnOij9bioD7YmroqWx2DsYWHnV9YHwm3
         npKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e4cBYqrD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c19-20020a170902c1d300b0019301002abesor10942245plc.50.2023.01.13.14.09.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:09:10 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e4cBYqrD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qcq2EZLOb5aNSFGz2N0m4y4IHwpRjOcqwcp5ceuj9ZI=;
        b=e4cBYqrDJY548Y1oc4368J+PR5a+EEgomx0RjlfpLROOzk0iS8T8qm2LkA5twJa2al
         5+U8GSZaAZI4++NebkH5iIoaeYJ4HNwkpljb4HwsQku0iYH26s1urdrqXMA0mRHCLipD
         bG1VRFHW/x4lZkumGGMOpHai4jkbqY9z5nFL0lShNwHEwecD8c01Y7slRoEXCWYNvMpc
         ddJio7WGAaRcb+20VgnWl27Oe+GCIoKnV0k8TzwbDeKECt0RQCqLlVvFdNLcSb6vOXXy
         E2tojrbenGFnvG2O2pETIjJKDoANJUVjDxPj1UHgmnc1IKFKa1HmmFxvZN3LZvoBCA1w
         RIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcq2EZLOb5aNSFGz2N0m4y4IHwpRjOcqwcp5ceuj9ZI=;
        b=doHt0jVXorrDXlaB+OESqnxxSE25dcn+5e3+3Re+LTAKIflRQTOnLFF4OfGl5Tx2kG
         xw92q5os6FnfHWloP/pfrzbRT8vtoFMHX1vq83Kryfc9iMghWb94qZB7R5bqh3kovdXT
         fB0Ca5vsU2Rpc+6+BdNh1ZUenuTpFWVz0nVm2yMCLp5GAXk8XDlyF2aKoiZqrzY6uWB+
         hOJj8ZWD24+ZmDS/Pi1QF+H/BhGavAL/uU19xfXsRhZ1pN4FbavQ8BHdqAPpgwoyYepQ
         C65AY1TT3vBEHJZGXLoViq+al3LQ1sU4kTgvuv9Gvo9gp4GycF2A418AKr4zi319AMgt
         +Iyg==
X-Gm-Message-State: AFqh2kpkGig3WSDG+PeACnDxhLu7vK9WHjpPZUu+75aJtfjv0SlT3POy
	I1zfvvRFYOLHQhpSDUvxI9SWG8r8
X-Google-Smtp-Source: AMrXdXsFW58kXI8hYxFScDNsPipI1sflCdpIbXbgSf9NSgZXqRutJomnQctg1OKpzpyhzgtEeJHh5A==
X-Received: by 2002:a05:6a20:7b0a:b0:b7:cdfd:9415 with SMTP id s10-20020a056a207b0a00b000b7cdfd9415mr1616033pzh.32.1673647749891;
        Fri, 13 Jan 2023 14:09:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id f127-20020a623885000000b00588cb819473sm9854339pfa.39.2023.01.13.14.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:09:09 -0800 (PST)
Message-ID: <870053e2-f9e1-3048-c80e-687a13ccdf9f@linaro.org>
Date: Fri, 13 Jan 2023 12:09:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-22-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 3QeN51uI2Gan

On 1/13/23 06:04, Fabiano Rosas wrote:
> @@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
>   {
>       QTestState *qts;
>   
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support is disabled in this build");
> +        return;
> +    }
> +
>       qts = qtest_init(MACHINE "-cpu max,sve=off");
>   
>       /* SVE is off, so the map should be empty. */

This should work with kvm as well.
It should always be ok to turn off an unsupported feature.


r~
