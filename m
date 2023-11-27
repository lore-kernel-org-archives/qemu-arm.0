Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp660016ejt;
        Sun, 26 Nov 2023 16:15:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQQHu4bmH0Xd0K16MaV3DGNSEL/Fpw9J7mZWobQ+7EGa7TPqBnSQyjJXgUjO9MZU6jiWJS
X-Received: by 2002:a0c:e9c1:0:b0:67a:ba2:bd3e with SMTP id q1-20020a0ce9c1000000b0067a0ba2bd3emr9410258qvo.26.1701044135230;
        Sun, 26 Nov 2023 16:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701044135; cv=none;
        d=google.com; s=arc-20160816;
        b=w0AD0A0md9jF+q+at2jvQPMwBkC1F0PTJsCMxwXA1mTiEPtBlf0O1lmA+dNgZ2PYT8
         A0Jknwxn3L0tyEbh61pllQ/Ux1DbuUrdOXinyrimDe3G5yDpZiE7LOaVZWHhi5xcHxTq
         H0oSDT7I8oRIWYFpbdOHFofqGUh74FMov2kXQI1usSNF3jDSTfA0uCA8q5ZCLbPijC5u
         bp9foS2sjJb1wwjUiJlNGPGb9INOc6NhcbLlZlFzDMs78u5owagQSadmdFd8vwevjCTy
         8pgePfuvtdymaLxtnb+BSK6vrzHBHNAkMpPWRUZBg242f3SAgYEOpWG6KHOdlVNyMn+L
         Q3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yRJ5jXl6tck+tu66/ZGulwwqt94sxCAUwTAfJhhAslE=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=s6TQIMvHVpqY92F4TaQEuV2j+Mq7WX2DhqFu70t5IdbmiEeCkPQQJIBARR/0iO5xu4
         OzQ5NOftk749x7YwOjhNrISlrnghq2lQFNQkysn9/leQRUCketp6qYV8NsspxZSx/CYi
         /Lhwt8Iyz2z2pSRXCfKLwqSDV+qKsLpeiLXZgBf74EK/K0xhOXUbD5vBC41JLASFi8fM
         4gHUcY6t5vyvbIFgXsabRilJlI07W6o1/rgRU6km2daiXNORBefE7VkWoWPpE5rTjwPh
         i1PSEVQ0L49xOMWgVWQQoDeF7TZA6OK+AdqYo7868RBzY8r4E84IkbESTu888N8m9okR
         pzDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=URJ3gt4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd18-20020a056214401200b0067a1b1d5b32si6106229qvb.448.2023.11.26.16.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 16:15:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=URJ3gt4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7PHc-0001tp-DQ; Sun, 26 Nov 2023 19:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PHX-0001rl-4w
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:15:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PHU-0007Vn-JP
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701044108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRJ5jXl6tck+tu66/ZGulwwqt94sxCAUwTAfJhhAslE=;
 b=URJ3gt4HTvgjUQZBRIe5q3MC8234xlfWtQ6XIrjlaoXyPC8mV3DT4HX7E3/mf1dS6w1Naj
 SjuTyETZPtDDgAIetsFU7tezZpTBrbNWPVVlZtA/wxlIH4L0PG69KHdn5IPFPoH5AYHcdD
 O2pKJthbInMWtggfHCcU2tlO88BykT8=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-KuPi1NZRMfugMm6FbCkoWA-1; Sun, 26 Nov 2023 19:15:06 -0500
X-MC-Unique: KuPi1NZRMfugMm6FbCkoWA-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-6bd00edc63fso5222137b3a.0
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 16:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701044105; x=1701648905;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yRJ5jXl6tck+tu66/ZGulwwqt94sxCAUwTAfJhhAslE=;
 b=n/lSHAWe+ssGNOWZYDW/9x/gmwWH8JECjNrTeDUbSdL/6QPMrBh75SD6yp2mcwCFM9
 dADijWYOrkcE9Lm8X3MLX+R5PV0JIDtKYmPUiyiIYaVYd9HInhn02Pl6c8RXWP4ahAOH
 wZc/b1Dwulb/CNRj2hvhc7Y2Hni56gOf94ITRX96WVyoo7OJ6gQPooyZhyyNAnTwf2i/
 y8iB9woPA/9XSs63i9ldih32SHwD0gInX0hxSXv6ugbSdRVkfwOYRradbCPGoogjbbM+
 CZqLEf27Y7lfvXpT8EKGdvCX4ov4Qhqg5UbRkkJodAbcwQPOjCCMP+8wnCVU6ILVrr+x
 8NBw==
X-Gm-Message-State: AOJu0YxSknm9h79Br7sEH9YOUPWQieVEyUykcAeFQzCGxy/kZHaooPIY
 vT6XG1J57pe7a/VpD2aqcjAixhaYjUSVZsyCyvh/RqbyEaKWZjxQ/fsdfl2+wBk65YFlaGMW6VP
 SlbrhwSGKmHl93aYOZOOl
X-Received: by 2002:a05:6a00:99e:b0:6c5:e1f:184a with SMTP id
 u30-20020a056a00099e00b006c50e1f184amr13206779pfg.28.1701044105403; 
 Sun, 26 Nov 2023 16:15:05 -0800 (PST)
X-Received: by 2002:a05:6a00:99e:b0:6c5:e1f:184a with SMTP id
 u30-20020a056a00099e00b006c50e1f184amr13206764pfg.28.1701044105132; 
 Sun, 26 Nov 2023 16:15:05 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a056a00098c00b006cd88728572sm1292054pfg.211.2023.11.26.16.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 16:15:04 -0800 (PST)
Message-ID: <4857dd95-e152-49f2-8ccc-05179767d28f@redhat.com>
Date: Mon, 27 Nov 2023 11:14:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] target/arm/kvm: Merge kvm64.c into kvm.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-15-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-15-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uIHTII4tFaHr

On 11/23/23 15:42, Richard Henderson wrote:
> Since kvm32.c was removed, there is no need to keep them separate.
> This will allow more symbols to be unexported.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm.c       | 789 +++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm64.c     | 820 -----------------------------------------
>   target/arm/meson.build |   2 +-
>   3 files changed, 790 insertions(+), 821 deletions(-)
>   delete mode 100644 target/arm/kvm64.c
> 

With Phil's comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

