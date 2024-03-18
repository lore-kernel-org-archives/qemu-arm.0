Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp761656ejb;
        Mon, 18 Mar 2024 09:34:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHBFtfbR81/84qdImZ1z5YkeMQLjPrDZy30mkqBfGfb2RojPq/pnIkoah9hj/ptOkLmfGrY0gXBT7a7Oun3bjxrZXFYF0A
X-Google-Smtp-Source: AGHT+IHxizNNLVX9zhLUlQEjOWroive2olCuWCwlbfOm5Obs+ZQ6n/mXPO8/fssawm+QmYpkHTyc
X-Received: by 2002:a05:6214:17c7:b0:690:bb91:6ee6 with SMTP id cu7-20020a05621417c700b00690bb916ee6mr10824664qvb.17.1710779696737;
        Mon, 18 Mar 2024 09:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710779696; cv=none;
        d=google.com; s=arc-20160816;
        b=UQxaxoRDA+hYZfl4/HOtwq/8zf0T9Dyb7+SQjaIA5/WKbcrc0VH9BhbIAedlKvVD+u
         ssK6iPMBLU2eY4yisLmX17i5zFVxsuKA9QyhbwXWlShCI93iGaPktdCmp32ooet2z0yW
         Fq4VbzSha+wRJAHG7OYhjxvTpNKdL1LdP8iLtcaq+DcuGDZMdJIjNXqd9x7urwlZ/LKq
         rSHmKJ+081+6WcMc1dYiaY0CD5F0/SvLdPFtda5xnyEL5+Ku2f0N06DItFaXh5uLzcVI
         kBWKegA46aHR8e1hHNqEzk87zv3G/yyBlVpPvK2qbepWx8KL7Zs0Fx1+m2TSjOnI13My
         fEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cpPFFJa8cvDdNdwT2sHbXlHUgI/e81jfthWWDxVTtYU=;
        fh=SEGjN646R72YlhkDqnJRp+jf0eX/8sjNzL+G/1C/Jrg=;
        b=IRY6i7U4oGhGqKCk9qXSsm/ti5v3jILvCnSrCTUj6MTQHfRdTOYG8g/GjpOMI0Zy46
         Tgtli2MAmzFR6KwGlcwjYRMjuU69gSBKy1ShHuuiCz8kJ3DfnAqFYIayfOzEOaspqJCp
         4FKFUJc0rN2frDTRT0SjsLiWVYu3ybieAbu4LpWl1nuw1wNOFpYL77Wilpuir3Ps5Y29
         sM7pyrZyXD8fLnjgNeRt+lAzpueVoWFcYMqUtvHvjY5t5SWw0lRPJuKdmvXC00Ou9kP9
         ikTRabsXkxFKBeVcuxLFtt85aoGIUfXxFhTiccSbKm/uApkGfR4cEr2j7MrvaxPX6c6W
         onwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KtHfuq78;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf13-20020a0562140e8d00b00690db58ef98si9100174qvb.402.2024.03.18.09.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 09:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KtHfuq78;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rmFwe-0006tK-Mx; Mon, 18 Mar 2024 12:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmFwY-0006mv-BZ
 for qemu-devel@nongnu.org; Mon, 18 Mar 2024 12:34:37 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmFwV-00084s-VF
 for qemu-devel@nongnu.org; Mon, 18 Mar 2024 12:34:34 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41461c256c4so961405e9.0
 for <qemu-devel@nongnu.org>; Mon, 18 Mar 2024 09:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710779670; x=1711384470; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cpPFFJa8cvDdNdwT2sHbXlHUgI/e81jfthWWDxVTtYU=;
 b=KtHfuq7875KM6UsU9pKKkvNPVsfSlYrm2YybvJYL1r8v0qXqdguKh8jEd6IVJ2bZBc
 h4aCyD+F8M0LhkNF+rnS6wCh9B+kmXohC7NwS0AUWvLQKr5waBVAqxpoHEjvt3YuTaBd
 psPJumlI/KoSj5a0JAMJfGYYijCqGAwwTHeUgXIEJ7dGFnmNZ8ttqkCJuO7rXnn3RduT
 hGy8nPL9XTSvPnMQnCm86NMxaKjDL7EYYOkAIutfHncQil5LVmT123BVDW+8HatFQ5IN
 DZI1bYcp0K8hfnhUNqsT3MQYz0V+jeUEVBN76f9VFlQ811UXP/3suCf3W+pGvGXJm/Xx
 viyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710779670; x=1711384470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cpPFFJa8cvDdNdwT2sHbXlHUgI/e81jfthWWDxVTtYU=;
 b=of9B5ou7CjT0uQGtwaEOS6KtTGPAOHWlLu/IYdE+MJ/HXHvIw9KmvoXks7PSdK/DvZ
 fUNginr1YkeK5W15AMpTvY1skFDnxF5GRtJEzgqJCPNH9vVB44SNO1s/dAjo/9x5msoy
 1yjPLah9LxFPVRsB8xIyqSENgrazbeDwBXgBPsg2g/ZS5V7op7fYBedeZoo3X5wisTrj
 9wPJLZRzzsGXMn1xxKRCtxCEIdjU1FCYJCqyZXoftLd6bGqTpRXm7mVdBhQ5ICJS6zDL
 0ZHaFbcscLvHK4BM2mHc7Omw8weo+rGdPk0s6EhCMZAlyktb0IQ53ukFAoEi+YJ4LR3Y
 Tx5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxCkwTXcgnabX+2FTRh1G5K02R+qGiILQJKKZSSq7Q5Yklw1+HPabAS18f9JEvVKAX4t4/MiLk5aZWrnhPu45/XQ9XEGs=
X-Gm-Message-State: AOJu0Ywpl76NcdfS7lPT++1NN930W1guZ1PhwPVYj6sTrh+Ny8sT6aKi
 CT0Gi0jZ8fFX74u3+e2z6Y2Pi5hu9lMPYp/ut6RVEgA2UaBtKVl1k13q1JnDjZ4=
X-Received: by 2002:a05:600c:314e:b0:413:ee58:db7e with SMTP id
 h14-20020a05600c314e00b00413ee58db7emr27061wmo.3.1710779670295; 
 Mon, 18 Mar 2024 09:34:30 -0700 (PDT)
Received: from [192.168.69.100] (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 bg28-20020a05600c3c9c00b0041330d49604sm18520814wmb.45.2024.03.18.09.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:34:29 -0700 (PDT)
Message-ID: <a8598fb4-7551-4614-b9ec-5b93931c6c78@linaro.org>
Date: Mon, 18 Mar 2024 17:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] tests/avocado: sbsa-ref: add OpenBSD tests for
 misc 'max' setup
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
 <20240318-sbsa-ref-firmware-update-v3-4-1c33b995a538@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240318-sbsa-ref-firmware-update-v3-4-1c33b995a538@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1WKcy+bKEelg

On 18/3/24 15:08, Marcin Juszkiewicz wrote:
> PAuth makes run timeout on CI so add tests using 'max' without
> it and with impdef one.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index cf8954d02e..98c76c1ff7 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -203,18 +203,36 @@ def boot_openbsd73(self, cpu):
>       def test_sbsaref_openbsd73_cortex_a57(self):
>           """
>           :avocado: tags=cpu:cortex-a57
> +        :avocado: tags=os:openbsd
>           """
>           self.boot_openbsd73("cortex-a57")
>   
>       def test_sbsaref_openbsd73_neoverse_n1(self):
>           """
>           :avocado: tags=cpu:neoverse-n1
> +        :avocado: tags=os:openbsd
>           """
>           self.boot_openbsd73("neoverse-n1")
>   
> +    def test_sbsaref_openbsd73_max_pauth_off(self):
> +        """
> +        :avocado: tags=cpu:max
> +        :avocado: tags=os:openbsd
> +        """
> +        self.boot_openbsd73("max,pauth=off")
> +
> +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')

This one worked well,

> +    def test_sbsaref_openbsd73_max_pauth_impdef(self):
> +        """
> +        :avocado: tags=cpu:max
> +        :avocado: tags=os:openbsd
> +        """
> +        self.boot_openbsd73("max,pauth-impdef=on")
> +
> +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')

and also this one. Do we still expect timeout?

>       def test_sbsaref_openbsd73_max(self):
>           """
>           :avocado: tags=cpu:max
> +        :avocado: tags=os:openbsd
>           """
>           self.boot_openbsd73("max")
> -
> 

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

