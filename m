Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4737387lfg;
        Tue, 23 Mar 2021 10:19:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB7KvY1G//lbx3YyBtdDIroIDkLee9M7Y1n2zEXqC6bcyZ08C9XL27Yhzf69/6jpdYrZaC
X-Received: by 2002:a02:b39a:: with SMTP id p26mr5550343jan.20.1616519964681;
        Tue, 23 Mar 2021 10:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616519964; cv=none;
        d=google.com; s=arc-20160816;
        b=ulyF7wrHUUMYONutMxHyNb0Ku6aWQNyt9/HgvvDU1mL9f1GvcCGu5nheS6zPjqTeCD
         ANsvmglWI5CxKV50dCEkkXj5cYqQOrMTRNYle151Wrpyy7u5ryusMbpZriqesBvr37Bx
         3u2oduO6qWsRJMrhVbPs2OzChHgAuQA9/0WbBZtFTZEzomZhJZpSpk0lNNwkFapSZ14t
         7EBW8rRnfNZagp94FtJtfIIu1kw/Pe79q/lI8hL/GbdJHQ7jLoAeqMSW68HWJZbXE3Zh
         H+26TbjVR64ofr/fx5uqhmuuda/gUNSv1DVxj+Cq9tmjyYM+Eyi4AQq2RJF+JOFM+SXf
         Q8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=y1s0EmkqTk4APxyBcUHHHZTUgyRDUT7xF9yh6r8qZZk=;
        b=RKtBJ2b2QDTN6ombQnYJKftqKWSgiQfTdi2xlrC79dnc+obBDD93BGSiqgEjYQpH54
         i2air1mchAbiSxihWy2+ef3Chuy3mGPVvScgTr7Rq5XP9+e8UGSZG/sL20lFmLlagMlP
         SN599MItYFtv+n0v7vKTJ67kwntpwiRY9o3/+M/YJfMNQgDdOrJCq4hgeuWFoDPxt2un
         y+7cOPcQnzvF83mQ3TPxt1iZJrQqVLbD3ISBPD0k+0ZH+AY4JkQXJodEIZo6aTXKWDGX
         t80grvIaI6Q7ot8jKdmPrqgrCMwADTEBVMb8yHopEPxBonh1CLFXoJJhmk0Rxj+D/Q5M
         yZDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NLbiAxM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w29si11004197iox.12.2021.03.23.10.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Mar 2021 10:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NLbiAxM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOkgd-0000wR-VF
	for alex.bennee@linaro.org; Tue, 23 Mar 2021 13:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOjuT-0000Gj-P0
 for qemu-arm@nongnu.org; Tue, 23 Mar 2021 12:29:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOjuS-0007Aq-8s
 for qemu-arm@nongnu.org; Tue, 23 Mar 2021 12:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616516975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1s0EmkqTk4APxyBcUHHHZTUgyRDUT7xF9yh6r8qZZk=;
 b=NLbiAxM+jyNzh5N+ijQ9bf8//0vY5pRHvoOz2DhV8qwosVXgIH8VFKoEsiQiTPv8lMp+hR
 nzrF0MZWgE5/E1Nc/zKPpzH9NgxW1ZUwEzvWaVBJYud7Z4K7tw5cL7boW/3k1Pj5jEqfW+
 +k4V3sJ5yGkg0UPCG1SHfTtWNDAN8tg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-TKkvSi55P8GFNqc2j0reaw-1; Tue, 23 Mar 2021 12:29:34 -0400
X-MC-Unique: TKkvSi55P8GFNqc2j0reaw-1
Received: by mail-wm1-f72.google.com with SMTP id v5so968830wml.9
 for <qemu-arm@nongnu.org>; Tue, 23 Mar 2021 09:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y1s0EmkqTk4APxyBcUHHHZTUgyRDUT7xF9yh6r8qZZk=;
 b=R5tzL+TEoJQe8pWPEEfdTHC8lRGeHjyCWly+h1y1tpMI26mdI1opxJMF+pxGeQLcm2
 7+ID7H8qWFJtoz+jUEpP3EgdPVaovCgu+dgD5E5FbRIIvC+k8wFXF+q6P5jPq3ZNewRC
 e72Rlnj2D9Ew0sOkdS5GXOGBfYpSOww5bQjHxBI/AJWGNn/xNjjCH+ZA5+C//ohfL6Fu
 Oo8+0SSZ/jp5CHMs3uVLlWfNClBfwAYE2WN7Nn/I3u+tXLhovfVN6oC7CZAC4DdzoDYb
 LsB9QoaXsyaREhfwjYJYHr/mp1NV6M706PCKHPFSPaFHKXtI9X16tOYhHGAMEVxFj5F1
 tUPQ==
X-Gm-Message-State: AOAM5324rTGJ9w9rkGNomYZKZYyiFYXTyy+CZ8Q9inuFtkmXJZ1Bip6q
 mVLtuDu0kH+tmmNpXK/byvFtyuq3td/9xf/y2H7k9nu1rCvu5GW5waKbQ3bNJfbhNqy5xUa93cn
 DzlBi+JoEkCs/D2XRHtuRgwwqs/yf98Q/hDfErNfn0YpX9NBgDQULToYXA9X0O5p/
X-Received: by 2002:a5d:628c:: with SMTP id k12mr4823143wru.316.1616516972828; 
 Tue, 23 Mar 2021 09:29:32 -0700 (PDT)
X-Received: by 2002:a5d:628c:: with SMTP id k12mr4823124wru.316.1616516972627; 
 Tue, 23 Mar 2021 09:29:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p17sm2835912wmd.42.2021.03.23.09.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 09:29:32 -0700 (PDT)
Subject: Re: [RFC PATCH 05/13] blobs: Only install npcm7xx bootrom if ARM
 system targets are built
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-6-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c491282f-5872-86f6-33a0-d385a2fb6b85@redhat.com>
Date: Tue, 23 Mar 2021 17:29:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-6-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FlwPoJ22984z

On 23/03/21 16:51, Philippe Mathieu-Daudé wrote:
>       install_edk2_blobs = install_edk2_blobs or target in edk2_targets
>       install_blobs_alpha = install_blobs_alpha or target in ['alpha-softmmu']
> +    install_blobs_arm = install_blobs_hppa or target in ['arm-softmmu', 'aarch64-softmmu']
>     endforeach

Typo (hppa instead of alpha).

Paolo

