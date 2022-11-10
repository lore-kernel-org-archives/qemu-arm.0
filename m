Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp813353ejx;
        Wed, 9 Nov 2022 21:42:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM46Xo39q0IURwdsfLOqpXSBZp5ejo9M+GR8SFGtBBdkRF2M/HuLnuuscMsJUyv6DWrvKK8R
X-Received: by 2002:a0c:b295:0:b0:4ba:b9b4:5159 with SMTP id r21-20020a0cb295000000b004bab9b45159mr58695891qve.19.1668058971224;
        Wed, 09 Nov 2022 21:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668058971; cv=none;
        d=google.com; s=arc-20160816;
        b=JsMuBLXTpOI15OL8cuAZqaqR8WuXcp4NfDVdZ0+5cOQ4WH/gbrTjm5mlFLWpICG4qt
         bgpdmOKgbZmKezUZPOGp/IcI0nI4PqC0ry3qHz4nGGqxPpWRVVn3T5hxonPp/MXU2bQ0
         qEljFS1p1FBTlhjtdzebQ3nck8Pz2E6+3sX5OrVnwe9Cx9N716EoITXQYHuyjx21H8mR
         a2CEmSShFbAaswKpdvBa/YJ2vCALKlihUp6yeaMQut01GkoaaC+irGfnuiV3zRaac4GU
         DqyVZAZLOuVoHF0kDJYbjL92cMKGqimsVcye+QCuDz1ydidi4IN7Nhf1MfHbaGTUo1ZI
         /8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=0d/KNgpVFCAVde9vzsPOhOqOCMkRURoSWDK+vAYcMqc=;
        b=gdCxnUff14oWr1Fo4PlhVFSz42sTjxbaCTC1cPVGZ0KhuhZHSaxNC88DE4N6n3VHPO
         SaxsMUk78VE8YnHylA8WbrjAfQBJUpgphRO6rD35+sRYMqgscDmOZZDH8AaS55aZwSVP
         sjK2ktviF/8eHKquUjDecvi5gSnEcM3uMatct30d49D5yIWh6FXjgdIqXMWFnClznDid
         iGglScGBVhduAE5mDuyW2Oc//0e3JuDSONoHxbhjqGZNal5qSYzgVrt/ozFx8CbK5GNb
         WCqXLDnVU7UJxRLU12yI+fNmKdJa+ywti+UnBD6IyrGcfR8tT0YIM7PDza/BO/6NL5PV
         GKVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="leMKNAL/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a05622a124800b003a51fa09dd5si10343822qtx.181.2022.11.09.21.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 21:42:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="leMKNAL/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0Kk-0001lp-5j; Thu, 10 Nov 2022 00:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Kj-0001kP-9D
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:42:37 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Kh-0004PU-Ol
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:42:37 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 130so776535pgc.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0d/KNgpVFCAVde9vzsPOhOqOCMkRURoSWDK+vAYcMqc=;
 b=leMKNAL/TtOVKO1nF7U/pxuXWbQH8BuJiEV1K3YfdmDYhUe0aMzO3Bc2QiwiJod9PS
 geciAzAJ9JXzg+i5/qZaKI5VUbF9cLLH6Zgyn+aHBOZ5s1sFQY40t3xWKaatY5cUrMG6
 m9/XqieYIXYO/YQgE1SmAVuFh62tlQXKBkWzCD7KtsUKifHzXGajLvlOi1B+FAvjejNv
 IWNa9vyhZp1EzvObidSAZgNzu6h6eKbRdMiisRJe2gV09xZsR/P8chlXD4vLZeDtXyQq
 yFe6OzVN49IBZ2KbDOxOHKTebYsR/rKFZYc/L59Vjh8DDnq07EkGg5xRvZErfODpoJVT
 M0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0d/KNgpVFCAVde9vzsPOhOqOCMkRURoSWDK+vAYcMqc=;
 b=yihL9TZQ0jtjQ4iR6c6DfNPHfSU+/l5nOUIYZTbGRcxQi2O99S1/Xu8U7y+lCxIyyF
 t11ibpgHNskpdRHllkBnitb7QChpcj6vlIc/aY2KYcNV0DPF6QT3eA/kN73JMe+rox0p
 s0anFFsd60/eOBmi5BBqv/ElH7YabM5e1pTXZyI3ReJNEu28UpSQL6GxzHT8peEKYx+4
 Br8e2ex275k8BvH8eJrLrcDQeyI9hxOxGfWlKvnQ62Ct0w0WeLqId7fveUF4N9nQQAL+
 NtUN6n4UlG33WTTZJjlQc79xiI6DWqMUpa5woOaOA9E6bPBDJgIka6DYw/84Pu5DDgFL
 5vaA==
X-Gm-Message-State: ACrzQf3D9Fe3qEEsOwsMc0yMm2Dr92sfHp909+dEmNKKv+NuPqH9RddT
 I+TymAMZaGXh/jqzrlLrLdcfJA==
X-Received: by 2002:a05:6a00:e0b:b0:56c:8c13:2a54 with SMTP id
 bq11-20020a056a000e0b00b0056c8c132a54mr63180858pfb.17.1668058954082; 
 Wed, 09 Nov 2022 21:42:34 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 c27-20020aa7953b000000b0056c04dee930sm9209964pfp.120.2022.11.09.21.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:42:33 -0800 (PST)
Message-ID: <1baa27e2-0201-67f0-e465-7ea357dc277e@linaro.org>
Date: Thu, 10 Nov 2022 16:42:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 4/9] hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GXwZnlMyleMN

On 11/10/22 03:14, Peter Maydell wrote:
> Now we have converted TYPE_ARM_GIC_COMMON, we can convert the
> TYPE_ARM_GIC_KVM subclass to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gic_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
