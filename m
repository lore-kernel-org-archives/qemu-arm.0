Received: by 2002:a05:7022:6b88:b0:48:25f4:1512 with SMTP id dm8csp1143434dlb;
        Tue, 20 Dec 2022 17:21:06 -0800 (PST)
X-Received: by 2002:a05:6a00:26ce:b0:576:755a:47ff with SMTP id p14-20020a056a0026ce00b00576755a47ffmr400232pfw.16.1671585666424;
        Tue, 20 Dec 2022 17:21:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671585666; cv=none;
        d=google.com; s=arc-20160816;
        b=K2bFRj2rUTmd3pNCJ1Azoie06M9csBEF1x54mOw8yzPsSZcDhUXuE9AGAssiCn2BgM
         3hxb87MHrixg8gFiZXteBPZqWAVFwSzeBnIIrhRokxOmKmsdNHa/0h/0SppHir+pZ3qe
         O1PWXz9aAn37YmwtJ00WPLKAKmRgUjhudSTk6hhb46lE5LgBxvtEGUJsRIPQqSCmihfB
         yS3hnafG+xh44mxiByjZ1A5ZcAxYXXzhczQYK1vjMU4U+c5EaqDomAzCyXf/Awnx1u81
         0dflWVo7k/z8SsXOrb3UbunxH1MnDSBOXRyt3FDnhyRIg0hU4kRfHhP3rgSxyMXqOcyu
         P7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ofFQRv43hsfLPOcqEkWUMEYLyP4Ozl5EKkvjhfXuhpY=;
        b=VlTRtfS4tNXcZnGRivEpcVgtA4dgwrEA9AhNWhcp3HfLoy4uTAHCHhp+iKHNi4DoSR
         9dUy1hZXQsa6sCuT/jByXr88/MSPmjwyCJXmo/Xh/Bf3pwIUJeDpMRSxZYqearJTUf2C
         L1LMVFX9yRCztcQt0AaG2vtIC4uboU16OxD59JyIbI+G6++Hoj2vNK6+iAkNfKKAWclx
         np0ViQ6iuKZOdvrBcvwzD0qcSLoy8Jh6phXoEplP6d+fOhrAWsNKWK5wVRgiaHUYI0DI
         e7a60cwigaMq09p6O+/pgnNI2mMVNlO/9+5H8Y6HE1TSvEcWo8a9ZhV4rfCMv2K+HGnG
         h58w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKIsMTXx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u193-20020a6279ca000000b00576e1ba965dsor6237939pfc.64.2022.12.20.17.21.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Dec 2022 17:21:06 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKIsMTXx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ofFQRv43hsfLPOcqEkWUMEYLyP4Ozl5EKkvjhfXuhpY=;
        b=QKIsMTXx+CrpJMWuePRn8S/YH6YzIW7oFNsShRdYBv86PWpgHLDQ6uiToOAVYzuTc/
         qF6+Cd67gfWVzbzFdI4+7dMbcEUTo8z9NvFrf6nZX+WhW24akI4IOW+kLbXhI+AEeFp6
         TU1Fx1qS7+BJ3OiT4ZGB+EQVgf8l39Q3S4oG76BDPNQjcGTNCXF+yqrnFjSDdsGudxHr
         WtP5HV/AdoJksXTGtXFeQIqg0E8kAtdV5NtcUVBGB2OwRx5mZnl6j6maIWVhPLli7vT6
         /yEC4D5GH+1BUyHAp23raZ7rFDNrUlPyZI9LRNRmuoSGXlnFu0N6JcofDDQf13BE9Msy
         6KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofFQRv43hsfLPOcqEkWUMEYLyP4Ozl5EKkvjhfXuhpY=;
        b=1oaL0mSsk94gO1+SX25bidr6Qtcl+JdCqtda+3zM1oScsZESC3F1DzEGi6FkipXIOH
         tNWRo0MXYBOJB2GSxsijM7zdEbkOfgsE+wp7MM3Sai3N1S5GHxnV4i9Izm6M+YfuCr5q
         95H/4oyIL1SGEAEtfY2zuq8xYbsiRQ5ANoeonjLpwLo5qVm0u7CERhTOw2I9nN8wSJPN
         z2IGPSubTWiB6bvGfVCWxXO/ZptkA8zudG7XOdE8pESo9O1as/in0EvLnqZt5wgH5Ksc
         D+haDUeqZLLI8TDmqa+b9YV/vqAuNwQr4fSOezgqNT9go+tl4Teuy9IdnP41ovOsDtRh
         6Fbw==
X-Gm-Message-State: AFqh2krK+u/6uVFw9Zr4MX3VvQSfaLDXal27so0mqkTMZmdVOFEOA5hI
	HgSlK1DyAbdi6we2ueTe2ndTW0TQ
X-Google-Smtp-Source: AMrXdXubx/jtLcyoQ9X8iGbDIpA8q30re5eRWz+WC9Gl5YD6Vuo9fuVYZ/dYEh+/7rY/UdsrLS35BA==
X-Received: by 2002:a62:8305:0:b0:577:13f9:576 with SMTP id h5-20020a628305000000b0057713f90576mr400267pfe.24.1671585666033;
        Tue, 20 Dec 2022 17:21:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0? ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
        by smtp.gmail.com with ESMTPSA id d15-20020aa797af000000b00577c70f00eesm9280327pfq.22.2022.12.20.17.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 17:21:05 -0800 (PST)
Message-ID: <a43b92a3-1f13-e509-fbc3-6471e33d98bc@linaro.org>
Date: Tue, 20 Dec 2022 17:21:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] target/arm: Move PC alignment check
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20221220220426.8827-1-farosas@suse.de>
 <20221220220426.8827-5-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220220426.8827-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: yKSa1lc2cETX

On 12/20/22 14:04, Fabiano Rosas wrote:
> Move this earlier to make the next patch diff cleaner. While here
> update the comment slightly to not give the impression that the
> misalignment affects only TCG.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/machine.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
