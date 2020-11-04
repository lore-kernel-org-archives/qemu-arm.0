Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5577316lfa;
        Wed, 4 Nov 2020 02:35:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzheEft29pXaKWKupIQQBlKsIC5qbi682h5pssplaFSNNvCXocOArAL8Gx1ToGTf7KzvY9q
X-Received: by 2002:a25:b7cf:: with SMTP id u15mr9498235ybj.34.1604486135075;
        Wed, 04 Nov 2020 02:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604486135; cv=none;
        d=google.com; s=arc-20160816;
        b=aoMBWN80ZHqbRLIaV8/iq2TwdSlWctJ/P/0LQjSqFAatrvX+Ghx/IUvIc+s8kvdsMM
         ps+qGoVfFDdskfwagspta/mUddzCF5PY3DUD62RBCMLi5g/61lytTue79O0epprnk4TD
         lJ0anff/R+RMH/XjICIz3uK5HG4RIj+nZNuMIRK9x2qqQ8C5dO66CQhjRYDR7YQBb1vd
         vMduMuktMOaSTLz9iyRxIu1564TWYmeGzxLYyAIGMwcWGjaOfxt06HkS2DZn5O8Bq6NJ
         itQgBIp8qCqJKq5vjh708O4uB6AbYxjxpBjUe71okqNUL6xLJm3er5f5FlsWgMRQNePp
         h9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fGNT/70qolte6mM+NlqyT3dkRNj2S7oGbGFpEZAnCIE=;
        b=PD2CdTs3o8mmaMbfEi4dCbUvr02U/L+zwnSbWrdIwzEJZhwESoFV40x1xmFSNXj8pE
         9imsYoqphtE8A6U4/RprSL2zeaUd2PAFA+uu9Dv2d/uAkalcNSS5xTld69fSTlSKg5mc
         yXzF2tHNvwFK8/INOalj7Sx7Bsh6tYGMiuDOAEC6rKMmzUbrCDVBsyaMOVArVGXKPUNd
         QcbNcW6a+xrY/mVBQaggHItlNkOJUhazLBAh5V3fw+Cpw6942q4GcopumsAskTilBdNN
         WEvH+U76y9Kh8UWUZhLPqGjpybsKsK8C9JPyDzx3h7FXETrxCNPsedczYN9Nf5OiTMQd
         z12g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eSx+r5CX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si2000571ybp.400.2020.11.04.02.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 02:35:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eSx+r5CX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaG8c-0005p7-DA
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 05:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaG8U-0005oZ-43
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 05:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaG8S-0003qH-IA
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 05:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604486123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGNT/70qolte6mM+NlqyT3dkRNj2S7oGbGFpEZAnCIE=;
 b=eSx+r5CXPcKp90ui3R/ysti7oCt+eh90SAgcnAw+cmE7kgUNqo0hk75dsdCp/lyvWMVVyl
 wb7MtUTwXuRztfDAktaQV9SqDmAPzkhfdm3EVZt4bGs1FrmA4fiMPiRQdZwxHzU5Rlms9S
 Sj9Jf0zov9qGWNnbgFT2l0XmkOnTTIM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-NVE0nOLZP5S5U4OtNOGtpA-1; Wed, 04 Nov 2020 05:35:21 -0500
X-MC-Unique: NVE0nOLZP5S5U4OtNOGtpA-1
Received: by mail-wm1-f72.google.com with SMTP id f70so1035879wme.7
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2020 02:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fGNT/70qolte6mM+NlqyT3dkRNj2S7oGbGFpEZAnCIE=;
 b=YNyzNb19tDazpW+PrOcgyAlFkLMIMjRi6EDKhZ6AvLS5ZI8FBxipSDwQdlnKWUv7uw
 Qs7taLx1JdJRI3lD3Hn4wM8VvOE7pSMc01kagCjEAGSWQrASgwEO4uqYevmgy/yqWQe2
 uL/kpvsq/e9VjixNeD8bYGsPEktm9bGCO7Qd1+CJ9y6AEJdmMkuhIoZk/hijjqtoHFzw
 6+00BT/tpT6Zfy8HvrnS9u+ajLWjQ/A5dW51B1NfESg8uX9td7bPRuiMKFY4TlQaNE92
 1hcHDVSCG5UYQHoJe0yqeemvStSXe7sTwMaK+srfPNkHT1amT8MiVd7ajPZsGWgkxL6G
 hdJA==
X-Gm-Message-State: AOAM531vIMZAcnIO1k4f0IFBZaBpoMbP/oRDASs/DqttpKs3GsKAIyq6
 UJkzqZEgWscr32c3p/BW2ReXFiA9Ow+N2ufoOE1/p427ZdAM3H4zBpV4POPWUW4M+CRmKn9VPJb
 IUVV5sw9kQ5Dt
X-Received: by 2002:a05:600c:21c4:: with SMTP id
 x4mr3786850wmj.74.1604486120471; 
 Wed, 04 Nov 2020 02:35:20 -0800 (PST)
X-Received: by 2002:a05:600c:21c4:: with SMTP id
 x4mr3786824wmj.74.1604486120209; 
 Wed, 04 Nov 2020 02:35:20 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g131sm405687wma.35.2020.11.04.02.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 02:35:19 -0800 (PST)
Subject: Re: [PATCH] hw/arm/Kconfig: ARM_V7M depends on PTIMER
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20201104103343.30392-1-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <612eaae4-6e05-568e-01cc-a191bbb7c835@redhat.com>
Date: Wed, 4 Nov 2020 11:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201104103343.30392-1-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wcq+YK8rNryr

On 11/4/20 11:33 AM, Andrew Jones wrote:
> commit 32bd322a0134 ("hw/timer/armv7m_systick: Rewrite to use ptimers")
> changed armv7m_systick to build on ptimers. Make sure we have ptimers
> in the build when building armv7m_systick.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

