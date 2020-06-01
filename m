Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3546855lfc;
        Mon, 1 Jun 2020 16:38:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfeYhyZ9beJTi/fdWNoV/iRCqU2yR/zAC5JhHAXdBWuUpArzUaqmeSWIejw8XKMOZ03hTW
X-Received: by 2002:a25:cac7:: with SMTP id a190mr18306056ybg.223.1591054712780;
        Mon, 01 Jun 2020 16:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591054712; cv=none;
        d=google.com; s=arc-20160816;
        b=OCYqKQspU6aLjVDZPuMt5fil//ZDneFFJlCZ8zyu+IsmJfUEISDOfB39QrM8LOe5Wz
         2yY+zEba1mol9XEbhGCwOlwsjIiKlM1lng40Jl2AdiP7un//uhoexrvEx29NSLmmjOns
         otjh+dYCK4lxisMs4ggsjzxa6VmwNT8KzBN1XcVII40/G8BEm8Bmm4Xa1O/ah3SSY7MA
         jWBAkVJl1bTsxk7r9s/NNS9GpLbJVf1XQ8iCBW2mccQGPswtnFlGvooDvS8lEBqskXXK
         pJoJ3aOZDDpP+SG6vKXUNm7yF49X5Gz60Wwg6Jrs0fyW4hQDB+B9Iz97UOsLPwp4uqab
         alBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HfFhYalJY0owExcssF2oPatU+OO5rT0/qJC/uP661lE=;
        b=issH5w2T7TNf44hjhhEWFUMzEQTdE2Nd6XKx5jzNfKTe3Pk4b1TcdD2CjWxdxklgpt
         xSLTSUV+SMMqQC7Pn8EzphvDg0w6wknYKuYI3kfDtrETmj2eWq40kWIAIRU3uoiD9adO
         mo1LMFeNxFlVCig2K1IDn+HK37xedm3qxqYbchqSBOvFjIkgMkQKjiQazDu7G3Rj9bn1
         1D4LR3vlkPtzUgXGmcWSKv8jHs3koAaAM1k8eTvPJPD0jtuCM6QJ8NhIe1AakrMLhyTh
         VQD6/UKwPMD+aBhQbSHOSdI/mYMQOvEdEl17UxYG/vDXV0VihvHx5q115hjfhnC8axXk
         nEXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D6RFiyd3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si666293ybo.213.2020.06.01.16.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D6RFiyd3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfu0m-0003cm-4I
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfu0G-0003ZI-DP
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:38:00 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:52859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfu0F-0006hJ-6t
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:37:59 -0400
Received: by mail-pj1-x1044.google.com with SMTP id k2so495425pjs.2
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HfFhYalJY0owExcssF2oPatU+OO5rT0/qJC/uP661lE=;
 b=D6RFiyd3vhs4PAjso9chbZyN90KGj+KGNss4NJQQ8ZtfXqYr8rob/58LqdkivyQ18S
 l8MM5DCaRgDBwmpNMqKrdYLfNRH4UDuLUbWD+FrxdZlCs7oRa7NWFLsPTWt+x02Cg+Y8
 cq/LBMagSbGn+1O9fmyA2upRrb1DRGWB3KkOBS4QZLb8bwrISwNs2qMqtQ5CMDZRh+fI
 HSymYViN4Vz251sbBkoz7+QKOmlsXmmdPwlsLYqWFEzzYkaFl1BQKctLNlp4pOMzWc6H
 lAQS+t6tOCAJf70J2cbezgmakkny+l09OEdidLQyiADzbfoocJWYEiW1gmFcQPbIpryA
 8FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HfFhYalJY0owExcssF2oPatU+OO5rT0/qJC/uP661lE=;
 b=MijYRcTcf1rgGyzNYcRVf4PkiS4giJTStvDvXiYPNvpWsiLYrX0ZOl9rnXw/fVx3qP
 U3hODGINBudLTaNXg6rAMdtKkM+BU+PIeLQ/CxF2ixGlUozZUmzyQ/ZxwJ+wr+fFHubC
 fdAb6FnyrKujDsrSu66+OyjUSoZSXJ3dI8jN77BZvbc8TFAErd25HhSYSnj+hf54nHUe
 frYFlsaa2IMubcMhs7JfVUd57yO/k6L6HYwySoKCajbPob4BuKOeXP7+oFoDbzZ/2Jqd
 9Is41M8IMu6EsDG0E6PQ9T9BfXnOmGD9uW66WQKPJMUvj0EwhCYacKj+QjS+CRwY5TAG
 mLqw==
X-Gm-Message-State: AOAM530eODRbJjcZtpRQrdV+XlL2rNuCeMF1P3Y+oRSN9BcsiOSjF7+N
 6uMtAm5XETh4Ml+osnPUpkUDaQ==
X-Received: by 2002:a17:902:bf43:: with SMTP id
 u3mr21921053pls.240.1591054677830; 
 Mon, 01 Jun 2020 16:37:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h13sm444790pfk.25.2020.06.01.16.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:57 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] target/i386/cpu: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc1a89c0-c631-505d-f901-6a7821c74c2b@linaro.org>
Date: Mon, 1 Jun 2020 16:37:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cHAd0jUruPnK

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/i386/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

