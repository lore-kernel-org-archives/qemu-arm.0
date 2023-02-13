Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp5954ejb;
        Mon, 13 Feb 2023 00:04:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+4PBvmBz/fMzI+db4QuYHlsUGAJ3xmU6YAL38CWjMdodvX132ItISNNDiMfMnH+3BJyFNw
X-Received: by 2002:ac8:5e92:0:b0:3b9:bc8c:c20a with SMTP id r18-20020ac85e92000000b003b9bc8cc20amr18971310qtx.21.1676275491761;
        Mon, 13 Feb 2023 00:04:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676275491; cv=none;
        d=google.com; s=arc-20160816;
        b=LHwvM2h2xhPTy/caBwIBKYiGReF1Z1MY5JkfeTfzIsa556NvzPZQ8gD3yJ0d8PPtv8
         ZeUzk8ZUvRMuAatLJlPVBDkdazLTBQAZTsL5V3ua+zFFYgwz/Wib/Zdq3pWCYBXafLiI
         KylZJuNySUiWpan99GVDXMsZ/zy74Xr95c10jCm0fE1NveKyBVIMTEj/54yBw0JoBvWL
         q+/sF951L5h6gjLRcXYbKRjcFfPxjZE8KfC9DjTNpsii63H9FC5o9i1uMi9yVA0cYb4t
         r34P4yKgpPGjG0UHzlCDrMbVXclNRFTF/+SomFUbJQ9ZVBN9KThcsOaZPoXAEegmvCA7
         tJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=t7JjOAt5zC/6UobAE8ewOg3NSBkoogYLHNe9rs4o5Vs=;
        b=PTryqzPaz2wtTTcVy9wJ89tzw8uT18RSdS2D/HBe3l6oT4I/ht1hzy5rEiMPp68UuS
         XImYWEVhNSJ1ji9kAzS63ZG+b0bWnTJMft0cFRoNx3UUh2/jFFptccx7qHlRrDTo4x56
         6CBcgcc2W5gqRBc2a2yKRRS9jZ1UN3VwLi4Yh0OGYsfhmx2EuMwhnfF3CuFM5t05aRS3
         5ZDkcPyCHFH3jlDowB69eqavKnvX877EYWdqhohElLQ/uGNzapSqjeQfCojmSWJtsHBH
         zc3hfRC1EjVUkBG/bt5glCi143RQwFpmCyWrksF89gYVIpasbznwW+2O/kVLPFRo597U
         UJsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=efvTwuPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o185-20020a37bec2000000b0073911cf01f9si5455981qkf.705.2023.02.13.00.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Feb 2023 00:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=efvTwuPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRTpI-0002PV-Jz; Mon, 13 Feb 2023 03:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTpD-0002Ff-TC
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 03:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTpC-00014X-C5
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 03:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676275473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7JjOAt5zC/6UobAE8ewOg3NSBkoogYLHNe9rs4o5Vs=;
 b=efvTwuPoqWJwMfouRb1ch3w51CG0Mll4K7oVXpeNr1Q7RMxw3+5hSdimeWkSFLdEXxW5id
 rt/vnp2U9h4OhZ76orK4JmGaAyejJZj/x90TURCNjG/yTV6MvT7q3ZhYhOnk2Cbryb/J3E
 FPEXdV3d0UgA90Nj6MhyrZU4t9MReEw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-LIOm88m1N3GMlqBxtRc-QQ-1; Mon, 13 Feb 2023 03:04:32 -0500
X-MC-Unique: LIOm88m1N3GMlqBxtRc-QQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso7118195qkp.20
 for <qemu-arm@nongnu.org>; Mon, 13 Feb 2023 00:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7JjOAt5zC/6UobAE8ewOg3NSBkoogYLHNe9rs4o5Vs=;
 b=2YsU7DKZ8K/EoAjMTMVKcfb7iLIuPQrA0ke5m9nw4Z/U+UjT5aCacx4YoYaZM5ZWJK
 I4KQXB1lGGlppkQPTpeBZ9z2JGJ7AtscS6gMH+ks+AwNk+qA85cOhbC7JPSLXhu1oFjo
 Roa2Kz6LgFbHU6Pv5Tn0zLSYRKInTLer4a4XwmoD91GQNMM4IVO+jiLUL1zFLrmlBFwe
 FGBqe3c5S9BdWxVMFUutx0CyJe1jnPDPpT2Nsht/tesIJLZCySwvl/a4QuGR8XAXGpNH
 8qqRGmGPEFbdX4AooGHraEVq8IqURFzrmUaGEsCYcg/+UPEZDJvME7Ob8jSxorMQTXd5
 qJ7A==
X-Gm-Message-State: AO0yUKWVwb1T5VZNQwPF3cfb2VZSzpbHB2N7OHh4/onustv5nYBBMCsv
 eoSroymwsTPh7iiWO5JgH0mhaRec3IKg+mGu+Gn4uNw0Fc+5DFmyObc4bfV14/tuKcsNVHxmLAZ
 DlTTRJ9RL2iHw
X-Received: by 2002:a05:622a:4c14:b0:3b9:bc8c:c1ff with SMTP id
 ey20-20020a05622a4c1400b003b9bc8cc1ffmr24807133qtb.10.1676275471968; 
 Mon, 13 Feb 2023 00:04:31 -0800 (PST)
X-Received: by 2002:a05:622a:4c14:b0:3b9:bc8c:c1ff with SMTP id
 ey20-20020a05622a4c1400b003b9bc8cc1ffmr24807107qtb.10.1676275471755; 
 Mon, 13 Feb 2023 00:04:31 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 t187-20020ae9dfc4000000b0073902217c00sm8082433qkf.23.2023.02.13.00.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 00:04:31 -0800 (PST)
Message-ID: <5f068ef1-87af-4f9a-43c3-6388e1c041c8@redhat.com>
Date: Mon, 13 Feb 2023 09:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] io: use closesocket()
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230212204942.1905959-3-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VRkWrahZiwtb

On 12/02/2023 21.49, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Because they are actually sockets...
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   io/channel-socket.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 7aca84f61a..2040297d2b 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -159,7 +159,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>   
>       trace_qio_channel_socket_connect_complete(ioc, fd);
>       if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
> -        close(fd);
> +        closesocket(fd);
>           return -1;
>       }
>   
> @@ -233,7 +233,7 @@ int qio_channel_socket_listen_sync(QIOChannelSocket *ioc,
>   
>       trace_qio_channel_socket_listen_complete(ioc, fd);
>       if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
> -        close(fd);
> +        closesocket(fd);
>           return -1;
>       }
>       qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_LISTEN);
> @@ -310,7 +310,7 @@ int qio_channel_socket_dgram_sync(QIOChannelSocket *ioc,
>   
>       trace_qio_channel_socket_dgram_complete(ioc, fd);
>       if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
> -        close(fd);
> +        closesocket(fd);
>           return -1;
>       }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

