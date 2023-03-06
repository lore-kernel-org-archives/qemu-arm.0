Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4423477ejc;
        Mon, 6 Mar 2023 01:23:38 -0800 (PST)
X-Received: by 2002:a05:600c:5123:b0:3ea:ecc2:daab with SMTP id o35-20020a05600c512300b003eaecc2daabmr9131945wms.3.1678094618093;
        Mon, 06 Mar 2023 01:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678094618; cv=none;
        d=google.com; s=arc-20160816;
        b=iGQ272sLhwvjV/urrjBceRcjqSQ2S0pwjM7lpl6HqsWAK8wH17+Ru96RhOKiFabAMw
         juwRa6SJF7a+v2j6zysnNTmmQ9Tguk8iy1FxjnmItZhFo6X8CL3Oo4up5iY9GwjkiAcv
         GnSrUM/8blhR+Qc/08PRAkTEp+9DlRZOxB5u5u7ZukgmsrZBRYv/kIXr8ebXR76OICfq
         lkZNQcFGDQ+EUeh1WLDwwKlgHshFn77itk45dEo31wy3oNanir2LIiIMXfLIIu8TbjhM
         o4Bj42KqfkN0dXeAuR+1ZHGF+K9976p4jj5KOPL18LNnQvBZisdakkdR47TrNBsvI0oP
         8Idw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aM8yQzb6WKbL4bzQLxP0iSUvbhpnXZWifDlyLE6JbHY=;
        b=vfgmpbKJRtSPcDcN2+4C4c/5L9AR3DPk2g34HkV6dTb1gUIqiG0fNDAFC1pY60UTki
         cMknjUuv4KQtccG0z2oQT8CHfEXvz60dA2O11yRKqD/3+/DLjE5UPEprJGWPCUz771+h
         gGf8+MSIsKOfGi4gVJKC9w2oSIgT+/jLD8IcVZu4GpVxywzOpB+241zbscrUpU2rppgd
         /2rysWMWLXEVyUeyFo4/1b37D95Qz3t7em+2puPa0YQBq6MuxCYBI25Rn9Ji3lkgFsg3
         7NLdw6SKGAyedXtY/aoaOrXrbWMQNfSFn4lgNn30AV98FFHrv0oMxKGKQQ/OVg+XhvKo
         Emcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZxBUzWA1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j21-20020a05600c1c1500b003dc5b59a26csor3297486wms.44.2023.03.06.01.23.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Mar 2023 01:23:38 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZxBUzWA1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678094618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aM8yQzb6WKbL4bzQLxP0iSUvbhpnXZWifDlyLE6JbHY=;
        b=ZxBUzWA1U7RyUWDqxC8pGR7cVnnCrSZXVCvfwxorachb08lbZyZrYAjYalqafHALrT
         B3eNncZcnTZMDiL9RjkbXDMZOhxLRLuVt7x4iiw4UZ85K4wYAtion+vHicS1CdEu+Yag
         MYJtH98F6kQEsgRu8DtzdPCd6twm4WdaUsXoFw+2EOOt6lmj+2qvRYC6XjpBIDKwlK59
         lSnRayLtoFSZZHIHKQ2Vs0u8a06YQ1YFp+LDxIrjWDdkCZEf4jbvfePO4KKAMuuLaLs5
         a0X7dDGDc99KcilueL9vQmMnOEnUNI+HsybZrZQY4m/f0KcKhNiaDMbWeiJXutOEDU8S
         9hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aM8yQzb6WKbL4bzQLxP0iSUvbhpnXZWifDlyLE6JbHY=;
        b=tI7jze+0WcnC1p4fVP5jg2pQFrM1DKXxzAIH1UrCuBg9kto+g4hbNx/DQLlsa9OzJ8
         5bD2/BzSkKNyejLxlZFPobnJgfgIdRS5Lq4nHQATLJY42f9mh+SYCrOF+vw1KPSmYwe+
         KlOzfo4sIzazjySCV22KsjOcXEnQIVYD7iormkPWwW1+lvAiU7PkjEKXHMpdJahTrvxK
         FTc741Rjnq/SvbPavb81fAvX/IOEnsHkCr5V7NmoCqWjCdxaZnyYjg87CaAUObldd0c9
         /sZqk/rFnRJqPU3hoP9pdWifcdYVgD6F9NAwwbl50yTVWOkfJFSTcbi3pFjRwqtotDqP
         vb8g==
X-Gm-Message-State: AO0yUKU6LsjvrCoeSzPcVSAimV9U/g+eqeEk5zSHal9Xs+KDI4EYAOB5
	wg5c9qlTVPPGm9lhcROyYhcfYmzN
X-Google-Smtp-Source: AK7set/YyrDokolJUA9eTExju2L4Xl1IwIifBnQdVPnxauD6XSY0IMli53ULjRHCUm4ngW3ahZKDIQ==
X-Received: by 2002:a05:600c:3c85:b0:3ea:f05b:50cc with SMTP id bg5-20020a05600c3c8500b003eaf05b50ccmr9296892wmb.8.1678094617810;
        Mon, 06 Mar 2023 01:23:37 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id ip21-20020a05600ca69500b003eb596cbc54sm9757477wmb.0.2023.03.06.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 01:23:37 -0800 (PST)
Message-ID: <bd6266de-59c0-65c0-6e4a-04312f590dd1@linaro.org>
Date: Mon, 6 Mar 2023 10:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/5] docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306084658.29709-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0wh3U3QAJLsV

On 6/3/23 09:46, Thomas Huth wrote:
> For running QEMU in system emulation mode, the user needs a rather
> strong host system, i.e. not only an embedded low-frequency controller.
> All recent beefy arm host machines should support 64-bit now, it's
> unlikely that anybody is still seriously using QEMU on a 32-bit arm
> CPU, so we deprecate the 32-bit arm hosts here to finally save use
> some time and precious CI minutes.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
