Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp725520ejc;
        Fri, 13 Jan 2023 14:42:58 -0800 (PST)
X-Received: by 2002:a05:6a00:1f04:b0:582:ef:9c8c with SMTP id be4-20020a056a001f0400b0058200ef9c8cmr47102826pfb.18.1673649778488;
        Fri, 13 Jan 2023 14:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673649778; cv=none;
        d=google.com; s=arc-20160816;
        b=GSpS8sNyLcDIVI1mJlgrfYlltuSNFIQ+P8XGrdh80ATWwWswdnq8Q5PnFRo2WUxdUX
         ppOCMZLPtG+dGhLC991foartX8dAarmkMMkCKBaYXEc4iC6M/Fw6a4M+yk2U+S64c0bR
         yNoA95lMkSnuwx4FKYkvYJgIBEC9E2EsizG37FY5elgZiokOfiWQhQcf6MTKdxmNZ4yY
         sjm14DZVoPLJh5OqbwJEEcpm9SY+w77ETw7caXjn2KvQm+DHQAxcfgc4HmuCmjJnQTxU
         EKY0I2XmpvPVJvKEC8G4Rz2DQS9PkRdQRLZZzdUVT34QqimgXZ61bFqeyGbbXgBvSEI4
         YH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JFuUXodROaUAYB6ammvWLPyssFQl/W7rShYz6IWmVCY=;
        b=c2ZgiTEM3/UCa3UQ9aDXm676jX72POpO3VLS4COasm1YYu9CPx4IyeEEH6vskpOswD
         VNC+DWQGFIzvDt6wIE0kVon2uqIuLKx2nemc+LaYsj3IoIN7r1tT5zmsJJZmtBpyVxnq
         8qxhcc4l9EBgD6hKJeTbAu6nTyJIY5wyF8fq7y0bvK+DngscGN3fMZD3+goofSzJOQVz
         hkoaGC8aiYbT+jMbxER3WU4RHmOHJJTNs2sIEzXV4pPXsVqBGEdXzfO7OX+A/pZasTUV
         buoqrEmbw/zcHY+/fIFP9m0O/1kc8faXBq6PnhqVeEKFEY7Zh+6wdYUoInryybrC04m+
         MvTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AWV9KmEr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o4-20020aa79784000000b0058b99c7d48dsor4190429pfp.69.2023.01.13.14.42.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:42:58 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AWV9KmEr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFuUXodROaUAYB6ammvWLPyssFQl/W7rShYz6IWmVCY=;
        b=AWV9KmEr6IfZQzOXCg99xRh175WBtG/GCyd7qa2FtQOORF8l9NE1co4+V3sU+6/F8f
         p548pN/4iBthXqQsFh2RD3y8+xi6XSGRRvghvI445pwd92HV5MZ2XcJcxCt8WPwFP602
         TFInURKfv587jaq0uvEhAiU652OFie0j/vVWH3zQFfnCMxjHUzAa/nI2ZD7NsJ89QcxE
         /Z1e4BJDmHmzlH5idUniBJlu91nByR036jyq8tAdMJoNMwDS6nTQ3FsRqfqAhpw17H4R
         hgoZrqQxgM5bFEDtDjMWVE+A1yZQuAM9Mb9cgat9/oFYWJcnOuh0F3eY18f3iTntZV2I
         NyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JFuUXodROaUAYB6ammvWLPyssFQl/W7rShYz6IWmVCY=;
        b=FYG3sdZUBAxzKqZLj20wpI7KI23G94s+pcxQqttY9zIbVFq5GQ/LC6KQ8BZy+qFp5H
         ib9ePDtyq8l3GvVU4ocaEJ3UwyB1De0tQ8ZmZNwwjhasqG1QUKuWpwUDcKqqBdAVexa2
         Rm7Y0TaxCKLbMUffkk77owmW09Tcnh7SQHhLpEpx1uiXM3KWuPRLHGE/SR704KOLoqUC
         j1yCrUjFJPvuzJw6QUBsWg4q8CZ/gmjuxlgyst7b6pvLsWk/Ktgqyu36EfHEJc6T22Wc
         sdoxH+GWVGaovpIptJHzpAXle/vx52eof38ChobryI/3YpJC7L8qr4OC2RReW4Uartsp
         VdpQ==
X-Gm-Message-State: AFqh2koIS9yXyNrhPPAfIEc7OFBUkcx1TnUEzQ/ZT3Lwt0Mo17sNeBwf
	9ge8W6Og3VdN+bjps3nq2Meqddxj
X-Google-Smtp-Source: AMrXdXu5SKW48TWy1e8voWo/k5XDUG/vHDMevzlxxrLSDjfgn9HuGeBMqZhxD36QCpBYJmrFpH0zjw==
X-Received: by 2002:a05:6a00:2997:b0:582:1f25:5b8 with SMTP id cj23-20020a056a00299700b005821f2505b8mr51025334pfb.19.1673649777920;
        Fri, 13 Jan 2023 14:42:57 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id 4-20020a620404000000b00576ee69c130sm14094065pfe.4.2023.01.13.14.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:42:57 -0800 (PST)
Message-ID: <b4b23d67-99e3-0b79-85c3-e44943b025c1@linaro.org>
Date: Fri, 13 Jan 2023 12:42:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 28/28] arm/Kconfig: Do not build TCG-only boards on
 a KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-29-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-29-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7K1CfiEHYL0O

On 1/13/23 06:04, Fabiano Rosas wrote:
>   config CHEETAH
>       bool
> +    default y if TCG && (ARM || AARCH64)

Shouldn't need both ARM and AARCH64?


r`
