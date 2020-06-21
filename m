Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2601195lfm;
        Sun, 21 Jun 2020 14:05:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvEV6bqfTbWbkotj19kZ2tmoS7yWwI4wuFkuval3KhBfuePWyDe/Z5EEUgazll4l66B9db
X-Received: by 2002:a25:50cc:: with SMTP id e195mr23471746ybb.483.1592773536591;
        Sun, 21 Jun 2020 14:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592773536; cv=none;
        d=google.com; s=arc-20160816;
        b=tZqxspOvaWa24vj00znoIaLOk+cK+UeQKm+xrAAGqii0tkzjGOOKJfDvmr3VtbIBnT
         ZwKhuiejzR4zdthW40gy5z2TNxvsNmsGZ+lcipnfBWRIrqKmk7ub8NbGlrEd+iQmm5mD
         xiVYcapwZXxBwTM9FSKMtjphlh+2VnB39yFe1WogltstE1NnZ9YbFn5VCN6rkEF3sTMC
         r+LXG3bq6QlzPT6/ZoG1f+4INwr9pM5aziM5hHNs8Cy72CjmhqO8dpOw0xlUmViyY7AL
         Ntz+qUKEiY9r64itSeNcJgP/akYKXOw7oNa6PQA452bwBKYLrfDrB75BxBtfpS7w+rwJ
         PVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XY+g9fia9UMdBfz+AClix5XSepcx2vCfiUo2SbKunXI=;
        b=poujnTOITUfCRj+Wni6PaOekpn0ymIxTmx3I525YimHrGjRbQWzoyPM9a2Rz3VmXy3
         6EWNCDcOyhARu/9wjsYkX37GFHKdcEPZ3UvlbBvJhd0k3Pz9JT3Of/ArrSSg1r2ie6Jn
         6NpTZ0Nwl9cVxxZvGGaKJbxq04bqPaTWOE6f61+CScW4qJc2RHjgjyCJYwRMMGxgD5vi
         JY3+6aYJ9D5qjn0iW5E+Eb9a36VIJ3ODDF/fZOdHtuvpZtIMVwr/IDx4OsaX3hG8kMnH
         yUmGVegl1/pb7OTpsQxgfZmUwsUyrfywS+gyXlR1dkyCKyrniv0CCf5DcXo1FZZJpgJh
         dIGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DTAM1LMy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v69si11685955ybe.351.2020.06.21.14.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 14:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DTAM1LMy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jn79j-0003xo-TG
	for alex.bennee@linaro.org; Sun, 21 Jun 2020 17:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn79b-0003wR-F7
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 17:05:27 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:37243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn79Y-0006It-LM
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 17:05:27 -0400
Received: by mail-pj1-x1043.google.com with SMTP id m2so7478284pjv.2
 for <qemu-arm@nongnu.org>; Sun, 21 Jun 2020 14:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XY+g9fia9UMdBfz+AClix5XSepcx2vCfiUo2SbKunXI=;
 b=DTAM1LMyZX7L06IW5TJ6oVAepdmBwY8evZHFkDnENZjYMDt+gmEsPSrWc+JYq1L/v6
 Tc4MaVeT6Q53XCxYN51Ej+XAukSZrCqSQ/BH8EaZiDV8Zvui1+qGWn8qOC5j7LSlDYMb
 0U8EyvrEISktCJ6Fw7nq+B4Oa4VlAfA4kNwDb5FA0hlgvV2IwWDM3KzLjJsKI6P0u+uf
 POz3IzkMHaLkGdIh2e+vLBd1sIAn3m2v1urujVaMnfQmx+VBGM/1koXQrKzfKdzW8rL+
 8QuBfRefJZdnQXB4JMpLOwusyZXR1uP9IQ58ODEm9nCDSVlr49tzJigx7LyXpZV/jcTw
 s+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XY+g9fia9UMdBfz+AClix5XSepcx2vCfiUo2SbKunXI=;
 b=BCQ7SW0AcJtbEsVnE4jhrsn6Fpmg9TdTF25UiSn7aIeHzCLzLjkt0g6DjVm0HZiNQV
 shOXdUAoVLjErvdlnaG9cGMBVaKCFQ8BQ/AKD5H9xyJ4h2JyIWRY3GhYbjFb6nsveFOz
 WpF8BSsB9x4JxdUTn01iTE5nC/dbKlYqfZF8ClPpM2EnyI7mUlqRyTk2P1yJpSykUq+A
 5+QBEXuGX1RoqKPcDBvsbATEB9R2EMhrQNNL3nerQoD2Cc4U90Ko4CZqsagn4/jYyH6M
 IrsN0TWy8foL5reGkXuzT3g1UB3Fny5XEc6hddYZvw2dQ1x8F19wYkkojaBhgQftdJ1s
 JDKg==
X-Gm-Message-State: AOAM531kG5S0V4eHBGMZJshEOAP9LazA/btsuQc5Gu7+jyBhCItxKivZ
 WqcQG+Rp01wH2G23+neSkRkwrQ==
X-Received: by 2002:a17:90a:7648:: with SMTP id
 s8mr6575000pjl.205.1592773522348; 
 Sun, 21 Jun 2020 14:05:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id w203sm1971890pfc.128.2020.06.21.14.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jun 2020 14:05:21 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] hw/misc/mps2-scc: Use the LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39e9d17b-041a-2976-3188-9134e07a7ef5@linaro.org>
Date: Sun, 21 Jun 2020 14:05:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620230719.32139-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6JO4d7yTSzhs

On 6/20/20 4:07 PM, Philippe Mathieu-Daudé wrote:
> @@ -25,6 +25,7 @@ typedef struct {
>  
>      /*< public >*/
>      MemoryRegion iomem;
> +    DeviceState *led[8];

LEDState?

> +        for (size_t i = 0; i < ARRAY_SIZE(s->led); i++) {
> +            led_set_state(LED(s->led[i]), !!extract32(value, i, 1));
> +        }

No need for !!.


r~
