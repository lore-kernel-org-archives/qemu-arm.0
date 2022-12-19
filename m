Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3514265ejb;
        Mon, 19 Dec 2022 06:13:54 -0800 (PST)
X-Received: by 2002:a05:6000:1082:b0:25c:bb30:600f with SMTP id y2-20020a056000108200b0025cbb30600fmr6339419wrw.7.1671459234799;
        Mon, 19 Dec 2022 06:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671459234; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5QNFSNvdBhFebgved1B8JFkV/7f2Ftva/nOozJcZXiN7N6kjnEnSX4jRI+YddWQ5w
         /M4OvBvoXO23Ktqxj2+82o0IOd+E9DyN3EEkd6D+uJAcMeRFO0nwrREZTsXQWxHaE7Tg
         VCkQtIGr4tdV63YGc3oUa9mNna2PpAwV9nOdKcr5YwOMdS7p5a/2rcB6pGyl8hzz/wLS
         Xp4Bu/r/bioMET7SiscftaIYJReetkc7SW19dHlIDg4OiRV5V1t45S7t2NhiEfrbbjYj
         5JEJQhXm3neyVhNoWZEojP6MOEOjdNWZQZiNIK0tfXT7CbTeVZkmTmVYRfN8XDAGkN1L
         xyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nl4BGj1PyLBerZrWWS1NwXWllkrPCT7tq7b1VOTopDg=;
        b=IjQ+2GYPK/QQ9mSxP05pJVbbMqHq/nwfFKf08bXbe5eQ30hOPPS2RVtfVdpL0v77kv
         /zRXNsqtvsx6VOQiFxckELXY/5VMbNNVLGIyZdHwW1isDsJCeuixeCFaON9W6UHL1LO8
         gTrS/3hxN9JNlE3dIBmBrLGbRb2mMbVeeoYsRkxOMkBt3IgG7HevdK43Dax0EeqzgYLq
         9djd3wfJFc74Ox0tXO+IbblC34RFm5mOucZsy2xNxuHPnPHaRvSHEbmfWm1FZRNR4An0
         r7iuc30doAAQHHxzANQLfkFVPHNKAM/ntHZ0assUBZRj7i/j1RKkEe6xCiBYt7KoBpgO
         ioIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qoq1oc3W;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e6-20020adfa746000000b0023196a37fa6sor3497368wrd.36.2022.12.19.06.13.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Dec 2022 06:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qoq1oc3W;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nl4BGj1PyLBerZrWWS1NwXWllkrPCT7tq7b1VOTopDg=;
        b=Qoq1oc3WR/h+dr5nNxVF0P7U/ZkhFAEPkpf+fYnizATJ+5xL7j35kQRZlFPbDPYY6c
         xJ87qjQrF4tMPIewqjhAqQrO83nQpxuUaIk8jNhy/p3QqhwSRIlWhzki+GNhGPPoG5C0
         CNYt5ZkwEwcQIgYOHRqOtrZ+AXFqI9J/6J5r+RJ4DODPoxNNmlTVzRYWOtbR3RO7h6dH
         arAMC6XqWrhiNElK5I5Y8veR6sltuaZK3dnQXQHLIaG+vT7nPYnivs1S3YALat+eBHQf
         ZANg1H+/TYJ3rRMn24mhTyfWr76k9AvneEMnhGGVK7lIH9aqaGPda+t73IjSWL2d4qQa
         eNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl4BGj1PyLBerZrWWS1NwXWllkrPCT7tq7b1VOTopDg=;
        b=5/FV/Q1RnyCvJx7sXRtBFBSmi4K5ET7QN3xQVQQ526ELEyBBzPvA0QRrrTw/jQhwtD
         OU50oJgcRYNEKh6smjBsvtxcDSymL1v45VbDZB2LooDYoM4iC8PDYCc2OMivy/7/XE6S
         yCHmZRqWRLxMaNNXdQwGYkJ3T0hPeauN2XbEAJ8I5zOlMPtWck7E8hH9jrz3LYaOgkQE
         lhINeySpFYsBH5nCqVYwZLCfLhQTC1VXzzkJxxoyCW10QxfDuZHAM9UaDSLAzxmPOZsp
         x8vQ+5JUpJ/msKycKHq5k92z6wWXlTA0igbFom/adhqS+qDl0IqZsiEEIQA2QXKCbBZg
         PLEw==
X-Gm-Message-State: ANoB5plfbc0P7WBZq/U8Q8l3hMZGhGz3E+kANNeD6ejz6S49g4QlbnBC
	THsr8yUWuxnQNMoUWdCJE8ctyxt8
X-Google-Smtp-Source: AA0mqf5JZ3r27fj5zYU0NkvBmgVgehhQjiBRs8UlsMH+e7JchlrgCR43+KyfXv8Tqx1/1uR9NmQ+jw==
X-Received: by 2002:adf:e992:0:b0:242:4035:622 with SMTP id h18-20020adfe992000000b0024240350622mr28575482wrm.31.1671459234482;
        Mon, 19 Dec 2022 06:13:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id u18-20020adfeb52000000b002423dc3b1a9sm10072017wrn.52.2022.12.19.06.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 06:13:54 -0800 (PST)
Message-ID: <542d86b6-3ca7-a1c4-51b1-af73d5434f57@linaro.org>
Date: Mon, 19 Dec 2022 15:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/6] util/error: add G_GNUC_PRINTF for various functions
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-5-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221219130205.687815-5-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0bbHwBjcMBnR

On 19/12/22 14:02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/error-report.c | 1 +
>   util/error.c        | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

