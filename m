Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp998034njl;
        Mon, 16 Sep 2024 04:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVusimAlqOhbLHBRS0shMd1VnP6YUybaBQViPSLzUfpjh9E92Cv3BNaO/L7Lb3POT3bRr5aTESvYRl0qg==@linaro.org
X-Google-Smtp-Source: AGHT+IGxUBcNPpndf/F/5/wGipEcTmb9OCae74zpsPP+vcysUQ32cdFJVBjJCypSgDjdJGLpXQ76
X-Received: by 2002:a05:620a:4150:b0:7a9:d019:f2ee with SMTP id af79cd13be357-7ab30d17b0amr2171687185a.23.1726485416459;
        Mon, 16 Sep 2024 04:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726485416; cv=none;
        d=google.com; s=arc-20240605;
        b=ftBSqRHXiBsWS7Iq2w4g1Nmqr6W7N97Uv1GbEDQJ5bS3cmUfsZ2F9A+7nLvAZrqdjT
         kJA3KxF/Ppf+CXOHh6mjslqlPL6Z4r8ezWnLvGATU52RQmcjz/IjQC+aCT446oTcakhC
         mV0lnim/qtG1XlBHO8VjJTi96E56nzdoeOMBS7vlMDcbLote8C4NwBcFUi30NrCwZi5R
         1u1P3BACCjghHxec0A1Z7HhaDVoOXYs0oWDP53nYIiRbFUm861N4FSO4tM9ORoC3SB8e
         oVOTkZfh81q40MCgKEXmwBH1Izq7ycy4iWwYT81oab+1Yk6vz1Pcf9fuvZH+FsobFqPw
         xFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=kyi0gXmnoxT6hg320Z+exO/+kWwl0GnTdJC8MFADhwU=;
        fh=YtZBvPmh2So6LCw6pihCB916D2gteeXzMj9hZxNhNic=;
        b=Kv1jXvxEBRzsYPzzDNgcklCzHpR5GW+HHx0S8pL+F5Sz0+XWmt4mFhSaMRzMQsgFLj
         QxKAysaUm4iZ3mHCBO0/HuW20LUV4XnV0rNsg9I/a/a42J11AwmXQApwb9jq+1evOX+G
         ZSjMbh6fdIb/rsc7lRIqd6sYFnqtQB/1vjDK0f4hsjNvrDnqUXaO5L3UUXRWDJ7JG7kc
         Zb5xYxJdTCLzxjtZm87VfB7wHY5Ub71pMtAi+N+zeOkQNQWuIr+rvE5NnD36O0jdIz5j
         d0hYxhjsnxznkqggqNTYdAFP+bs9H9qTYroRSbC9TU2jXsfBIVrO4z++67hKpEruOux7
         zagg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gt+bwboy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ab3eb7a4b1si557077285a.582.2024.09.16.04.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2024 04:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gt+bwboy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sq9iK-0002Xk-Qg; Mon, 16 Sep 2024 07:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1sq9iI-0002Vp-Se
 for qemu-devel@nongnu.org; Mon, 16 Sep 2024 07:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1sq9iH-0002Qt-3m
 for qemu-devel@nongnu.org; Mon, 16 Sep 2024 07:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726485372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kyi0gXmnoxT6hg320Z+exO/+kWwl0GnTdJC8MFADhwU=;
 b=Gt+bwboydbLYD+2kf8BV5cNU4aNcJewODX22RqQQoAP1FxGg9ZsofbEunJGOZ2/o6qq5Na
 XHpDUVWZDZBMkXBB+rPsVuYoljOEVS1xrORxaoRPYIJNJVj4OnMzwOa9MLoNoGbHQymf0H
 VvR8wbZcsrDMRDj1JILffHz2TXrls8Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-EQTXSc1DO2-0xx5VN1Wpfw-1; Mon, 16 Sep 2024 07:15:02 -0400
X-MC-Unique: EQTXSc1DO2-0xx5VN1Wpfw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb33e6299so26641085e9.2
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2024 04:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726485301; x=1727090101;
 h=mime-version:user-agent:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyi0gXmnoxT6hg320Z+exO/+kWwl0GnTdJC8MFADhwU=;
 b=cGDoKErjXRjpM/dtIIz0QDRlsKPRwttf10riznXnFPU4xzEpPJPKwo1Y/AMz8M0iOi
 NQqOh+1aRFaD5Pe0dZa3VORMFsDqMUxHbK74vtc+M7CeCFckrzD8FosJ2fzR8u+Q3eeq
 nWW0skyvzHUi+XxhGDbLR6K9oeRiwXeHuJWp03wCWfrsrozVRy6I5sk3uslBf5FYxtdn
 cWnFkaesF1oYlYwCpel1v2sjZs4XbepVbitXjSZUx29PxBvr+BpVMVwdN8+5zeBorsJn
 9EdOv1tjyEjovEnXhY2c9eJ+aHJmcnScDDNwh0361RxDKtKNjYNM5nTrHfQCDbnZbbJp
 yshg==
X-Gm-Message-State: AOJu0YzCwMYN9otv1S7Fq3oNfhRF131URDo7lXXMFeLleZi8LO3GJOlp
 Ol0+pHglzLxR6PYWq5recyrLgi8iJlYtzE/xqh9nSCiCblDJNyVOGwqJ+HPucwJdqV8F9KsOG1Z
 UGBP69+cG/gVcjzGAmUFWAyZMQAZdPPP3+pWu+9VoZ/RqjyCuoEBT
X-Received: by 2002:a05:600c:3b0f:b0:42c:cd7c:a196 with SMTP id
 5b1f17b1804b1-42cdb54cf19mr115742005e9.17.1726485301020; 
 Mon, 16 Sep 2024 04:15:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3b0f:b0:42c:cd7c:a196 with SMTP id
 5b1f17b1804b1-42cdb54cf19mr115741755e9.17.1726485300553; 
 Mon, 16 Sep 2024 04:15:00 -0700 (PDT)
Received: from nuthatch (ip-77-48-47-2.net.vodafone.cz. [77.48.47.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e62989024sm26841555e9.36.2024.09.16.04.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 04:15:00 -0700 (PDT)
From: Milan Zamazal <mzamazal@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  "Michael S . Tsirkin"
 <mst@redhat.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/virtio/Kconfig: Include vhost-user-scmi only on arm
 targets
In-Reply-To: <20240913131858.418407-1-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 13 Sep 2024 15:18:58 +0200")
References: <20240913131858.418407-1-thuth@redhat.com>
Date: Mon, 16 Sep 2024 13:14:59 +0200
Message-ID: <87cyl3alzg.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mzamazal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WUxROXa/V3Lw

Thomas Huth <thuth@redhat.com> writes:

> The System Control and Management Interface is specific to arm
> machines, so don't include this device in non-arm targets.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Milan Zamazal <mzamazal@redhat.com>

Thank you,
Milan

> ---
>  hw/virtio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> index aa63ff7fd4..bea5be4d4a 100644
> --- a/hw/virtio/Kconfig
> +++ b/hw/virtio/Kconfig
> @@ -109,4 +109,4 @@ config VHOST_USER_SND
>  config VHOST_USER_SCMI
>      bool
>      default y
> -    depends on VIRTIO && VHOST_USER
> +    depends on VIRTIO && VHOST_USER && ARM

