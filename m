Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp344192lfu;
        Mon, 4 Apr 2022 10:08:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcbIZM9sY4SuDAbRgOxGKNAj3xCO5Zq0pC+XTpZeACwdC4oNiOHD9ESseJ+Wjz/dnvsOPw
X-Received: by 2002:a81:f10f:0:b0:2d6:935e:c3f8 with SMTP id h15-20020a81f10f000000b002d6935ec3f8mr924182ywm.325.1649092084596;
        Mon, 04 Apr 2022 10:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649092084; cv=none;
        d=google.com; s=arc-20160816;
        b=QVwNLIkGfwnwnc+3M5O//YOznaD164UhP3hfhUx4LhVhJyz0i+yV8mCaTECKNFjw+E
         GSS5q5B3KkF18O6TmOkDUPRqHIqTkuJSj9oHKmAWaRrQNbMeNM11dinvcQUbe26NW436
         YXGMfxJ7IKcTQZQ4YLxfpO6Z5nX+LTvqtkfJSm4ODvSgCB27DLh2Aohy/vXIHJC3hXVN
         CFbpFUylVVnTfYb1skc9hlLH4++mCGch7PU9MVf4OJAeve8VGfjw0CHLgB9qVfhKYtSd
         pFqhXakHnG1khwsqlaN4ZSYLQ6se1LBOwAqruay/EsUI3Z9z2/2kltQu4x/hWpLzaMM8
         CD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kJJy9m7lsy/qsyEM04bal1kIR2bn06vN7EkfU1nyj9k=;
        b=rm/HV0nJObkQvdRekYsMlCZIE+XQifE+rBtFnS/A4ase8RF6ARvFYDsvcaPp0IzUea
         XN3DY4UAKQZVFnRtOkJoRQKowPXfnP20rZPGgz/HHhJJqM+jGWPdoLvs+7cPsdTBW6U2
         0SZlBZ1C1Vili4HxX+GHWrAW8R3W5cjtvrKJdUPtv9A6E+DRDzTeBDvyZoBvesPygPEU
         RBznicrcj/kaLcvXFm5M5Jv7PTpxnz8z8tvbFsGCSQNo4MAXjXXgzVlcmfIqIPZhWBU9
         S2h1IGK2CdNVXJH88pWlQSRjR8a8LModjW2pucRVG5Xk8z9T8BKbU8yUsl0CgHNmEZjO
         gYRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DAA31Yvn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a814707000000b002dc3c591dcasi8240181ywa.1.2022.04.04.10.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 10:08:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DAA31Yvn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbQBQ-0006nj-2E
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 13:08:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nbQBG-0006mr-Vo
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 13:07:55 -0400
Received: from [2a00:1450:4864:20::636] (port=44724
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nbQBF-0004mr-3t
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 13:07:54 -0400
Received: by mail-ej1-x636.google.com with SMTP id qh7so11296353ejb.11
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kJJy9m7lsy/qsyEM04bal1kIR2bn06vN7EkfU1nyj9k=;
 b=DAA31YvnH4FxOLBuQ24Mt+d2YzruiK5HGteAE26E/6XLXTrbHt1JzHXNUFWSv5HuiF
 G3GNFhx9D5JHHCzt63sYRujN61c2oPn5F3y0ljft9eFjjQ0QdDxIUox4374vENGZHns+
 nWCUkzKX/wsMRmsSN7oORxmun2vMGYGVhFkh2Y3bBZ66SIvtsD2rD5glIM9Iq/jsJO/W
 /gSCLWtmsQ9PkYwaBqo11VHelD54w6Gr4z5mqceurSYtWoKnqurB0OzlFsRuyZmMTLse
 1EP4ZIUJOaiVZyEu3vn819f5rRKmAwRvzDGNcoIm8Iu4Uki+XvGjFeDCIGvbM84XvdDD
 yA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kJJy9m7lsy/qsyEM04bal1kIR2bn06vN7EkfU1nyj9k=;
 b=HwHIWrj4ANYAQn4vIMmC5uiGwdlzl8mNJf9SKq2NKPPK5VpGDzRhREH64MqDVHAtI2
 VjznAt21mtOfq5xWJsnwmrEuehoxuEedIAQfLzhNpnXuowVrvrq8sOrBnXxqbGGh8yQ5
 U+Gfc5M0Qiblj7EbI71F0DPjtlWMoqR6Npz22rDOISup/vPnrVwKf+AA5zIwm1m20USr
 AJitNmlcE/rFO30Lt01pz43uPL9leR15yaBLmTFM9/n0wEgEwajAng2j7PjZhxOKBPnp
 ZP2vH+W9PJeidRX7loGY5f1jDQMvUwxNhoXHgETNXWoLr53YUhWeYd5Krlat2luG+IXd
 orrA==
X-Gm-Message-State: AOAM533iBN5Mco8v/QgqS5wJYW0yEkRwa2A3BMcd4+ud3obC1PQl/4VU
 YLc11rOvbRrd9/TWkkzQMPbL9Q==
X-Received: by 2002:a17:906:4787:b0:6e1:409f:8deb with SMTP id
 cw7-20020a170906478700b006e1409f8debmr1108939ejc.80.1649092067928; 
 Mon, 04 Apr 2022 10:07:47 -0700 (PDT)
Received: from [192.168.3.227] ([185.81.138.21])
 by smtp.gmail.com with ESMTPSA id
 go40-20020a1709070da800b006dfc3945312sm4577095ejc.202.2022.04.04.10.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:07:47 -0700 (PDT)
Message-ID: <e9fbf63c-1e22-f5be-3552-ac28206e4d7b@linaro.org>
Date: Mon, 4 Apr 2022 12:07:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1] hw/arm/virt: Check for attempt to use TrustZone
 with KVM or HVF
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404155301.566542-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404155301.566542-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wZrbPCCPeMwR

On 4/4/22 10:53, Peter Maydell wrote:
> It's not possible to provide the guest with the Security extensions
> (TrustZone) when using KVM or HVF, because the hardware
> virtualization extensions don't permit running EL3 guest code.
> However, we weren't checking for this combination, with the result
> that QEMU would assert if you tried it:
> 
> $ qemu-system-aarch64 -enable-kvm -machine virt,secure=on -cpu host -display none
> Unexpected error in object_property_find_err() at ../../qom/object.c:1304:
> qemu-system-aarch64: Property 'host-arm-cpu.secure-memory' not found
> Aborted
> 
> Check for this combination of options and report an error, in the
> same way we already do for attempts to give a KVM or HVF guest the
> Virtualization or MTE extensions. Now we will report:
> 
> qemu-system-aarch64: mach-virt: KVM does not support providing Security extensions (TrustZone) to the guest CPU
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Not a regression, so not worth fixing in 7.0.
> ---
>   hw/arm/virt.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
