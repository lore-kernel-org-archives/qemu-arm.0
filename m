Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp870484lfm;
        Wed, 8 Jul 2020 16:37:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylbOaqCuG2lfqx35jpXo0YTGzgO9EUesokw4WWgh1Hv8UpC3uoMRpe1FPgyUGENrQWrzbv
X-Received: by 2002:a25:c712:: with SMTP id w18mr7257930ybe.127.1594251438311;
        Wed, 08 Jul 2020 16:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594251438; cv=none;
        d=google.com; s=arc-20160816;
        b=rQ56n8EAy0bQjiiB2GNf9rqKBqUvoJ7AjLSSL6O1DSqgLGlIYu7hkS0qr1tj0f/ss8
         E0FWnhTnLKUvhzKS4avTDEkxSt+cFZFNE8TJpLotctCzT0x+M4CUyW64JQO5PfTSc49Y
         rv64TXFAbAZvI7enOA5TT8hq7T9W2C05t+E72GyW0muPXkFDwR4bFHl0Z2aIqhiW9dEo
         Lkd3ZGR+VAcoKiof2uGnswzjxzilq5W2phsBgsmX4SGxadhJHlc0HJmHkV66KIxkAIK6
         exhX2e1PdRJokOPuaT+1CDchMLbu7l+Zhz8jhSHACciZAiddx9xgPU1Qf66GfB6uKNz5
         brfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WceBtQWSpGLTKnkZN5L7rcXzyOV0jJpQGsWGP7upb1c=;
        b=KYW29Qt+mN+YKFSrplBXLK/n2szvkOZECycKoZ92ezCMj9S5C8K94Dzw/1L3OiHvKA
         G0HhVPfQctUOpEOMwjLU0jK9SVA2Gjf72wDRDATmj0DjlWlKK8MvxPA2t/uxNiVnk/tb
         3lelQgA+UVOH6qC4IH75ZHhtko6J3HdTeQiBmHAbAhkEPdurrem8GuwQY1+jIYIlVKhi
         xAjBzWpaU8hAIQ6E66FcFCAgVoI1Gw+/ZrGLqow+i0jQCK98Vg02IF0dx0BSYeDqEFpC
         mqx6ORHKmGYPlulB9U8mNj8G6vkfgNPayEC5/NgxubJPBtX6i+77+5CluDYHOBNdEQCv
         yWyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rgh45eAc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si1067869ybc.403.2020.07.08.16.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 16:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rgh45eAc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtJcr-0007sI-Iz
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 19:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtJcj-0007s3-Gv
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 19:37:09 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:47067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtJch-0002Lv-O0
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 19:37:09 -0400
Received: by mail-pf1-x444.google.com with SMTP id i14so151990pfu.13
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WceBtQWSpGLTKnkZN5L7rcXzyOV0jJpQGsWGP7upb1c=;
 b=Rgh45eAczmk8THU3qInwYBRNdnG0PqDKJkOiTlJSesM0w4usRXwVVeTOS9Yfdv12JE
 EJi2h/uXPskS9AFHT4IS8MYdVf2NF38IXC2brDe7WwccbODCVgFHV8KFuwBazSYqq+r6
 lFDtkgeuYjsiDGTeFHvFyXYquK901mddzpIrxak0Six0Ic0QNaXTe42tpMxQlTYq80vk
 12cA+4rSgBK/AJCSVE7eiUhWaF+ja/pNWX3xncqRP34pibgOIfQmxL0/kU2N00oxY+l1
 lQjW1P0sj1pAOSsrHLvuDtSOrTkKIguY2nChXrXO+NPgMDWlcPWHohH8P6tClUJW+lnc
 TEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WceBtQWSpGLTKnkZN5L7rcXzyOV0jJpQGsWGP7upb1c=;
 b=YH4rtJr6/yXv0kBM74twmjfAl2RFkUyiHth4DnyyO1HDuxeIW+4+VZ+R7TKmQapvfA
 /UX/zGKfMvcMCnlBRLXtSHr5PR1ipWf9FDnrIA5hUiVWTCBWMgMdCGX+Jk+WCBtHFSN3
 QxOH6xcETNh8o+jXgMCH9KMJ7GNjrqKyREZ5rbwr6enkEoLuzSJZvLDIQyDw4QLiu24z
 69qu3QCwy58WjTRoabvHP/KcV0CraJIvr+WWeGq8iiQHzYB5xagkJMhnuVD7laUHIt4v
 DTPUHo6Y2DyNlQxz5K7CzfEduVfR03dgTZOCr/ePNSk68UX+0sVL5cr78c2RhnuDAJza
 NdUg==
X-Gm-Message-State: AOAM530wh/RciFe96nBC6la3tqT1ciAL1191O36qX6Hlp97jpWpxRy9h
 hRCdSzQJDAFD8MB+061UVKiBYw==
X-Received: by 2002:a63:371c:: with SMTP id e28mr50934365pga.114.1594251426167; 
 Wed, 08 Jul 2020 16:37:06 -0700 (PDT)
Received: from [192.168.7.121] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id gx23sm532481pjb.39.2020.07.08.16.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 16:37:05 -0700 (PDT)
Subject: Re: [PATCH 0/7] misc: Reduce QEMUTimer pressure by using lower
 precision when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200616075121.12837-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd72928d-04ce-6562-39cd-6f3902b49ee6@linaro.org>
Date: Wed, 8 Jul 2020 16:37:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616075121.12837-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VdJn7IAQnj41

On 6/16/20 12:51 AM, Philippe Mathieu-Daudé wrote:
> This series contains few patches resulting from the notes I
> took while reviewing Mark ADB series last Sunday, in particular:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg712078.html
> 
> I have another patch for hw/input/hid.c but I prefer to hold it
> to test it more.

How does this reduce pressure?  The resolution of the timer doesn't seem to be
affected by these patches, only the precision of the inputs.

It seems like standardizing on nanoseconds makes some things easier, and allows
the resolution of the implementation to vary to a much larger degree.


r~
