Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2471489ejb;
        Sun, 3 Dec 2023 20:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHguGPhHbhwViQxDGwn/c6BrvSVnWppPLcihGyvW+mBtDECnigdck7BrESW3Clm08SBaPM6
X-Received: by 2002:a05:620a:398a:b0:77d:8be4:dca6 with SMTP id ro10-20020a05620a398a00b0077d8be4dca6mr3613818qkn.42.1701665905599;
        Sun, 03 Dec 2023 20:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665905; cv=none;
        d=google.com; s=arc-20160816;
        b=FQjsodBBdsHbUTaYdXmCc5C7zTevlRQS+KI9Zf0fZd1UxKlQIYDz3H5MKc0RIAbaoP
         s1kbI+2PPVgH7PBDyQJ+rGThQFSjuC0R/yDUDqEs9ZzYWRosoRxpKHVwFKAD2kY+WpKG
         frxZvJfx79Epq8HA/BptqVbLvEWuvRozqhopL/zt6tRBm/rATd2lSwaNUXC5KOXxpjxf
         TzyMoowjWwYkUX6O5Y/BC6tn7NKYq5j25cxYf8e6QD+WVn/PkTvqirmJNEZTqI4ll9VJ
         YTMbw1wBS/CZsKPy1oD95x9ZWN2cNVyHth/Kaaiuev4JzM3TU8kxmVtAT8Jwt8qE/vdq
         uE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rsvQGttsG1j4LVkaq+2g5xyJkzfY1bgtbrpiZS/u/FI=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=CRDxdGZmv6iWMQOb9BAUMxS3vnxb8C5RLSef4Id1GBn7H+XQVuKxIH1C3ih5kROnYU
         yQPu72A7xtKxLdNMR4St1+1US7ldzB37XZBOBl733JNtD8KRh11rq+z+Tlrk56djtPiv
         7jxtnmspmgK1bNdUIlPJSJW2x91qufcx+IKuHd8SJ/SAhxaIZggGwlekfoYwEm5aqQQ/
         XI1WLXY5BQUUTDNyYykFzLs4he7xK3kjHCF/Fca3dSyo/ru+SdCumWpuLOz8rRCIK+Qx
         emtYUhzov2zMDh0ogOytDNdk0RwIkr3ZlDdcbBEhjOuzfANwWa4kBINsatT9wMYKtav2
         SmAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MiLtmtS4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a05620a040400b007758479ba14si8402381qkp.435.2023.12.03.20.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MiLtmtS4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rA120-0007K9-43; Sun, 03 Dec 2023 23:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA11y-0007Jl-2g
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 23:58:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA11w-0005Yc-Nm
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 23:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsvQGttsG1j4LVkaq+2g5xyJkzfY1bgtbrpiZS/u/FI=;
 b=MiLtmtS4UzaptpHqaFrn7D8+o/zbEFvcrXj8p0skR3lCSLI3iiCrXYFbfMO9kSD9Gz31uw
 pWv8so8GRqw13b0l+o5AaxFE1Z3xft7KGG9aog7H9ruCxt2HSgcqNqBXZ139m/tspjny49
 DktAMnYIF+bav5C2iKwXzEXEp5iZePo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-BYCT6F_IP1alAwPbzP9pbg-1; Sun, 03 Dec 2023 23:58:02 -0500
X-MC-Unique: BYCT6F_IP1alAwPbzP9pbg-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-28674705fddso383217a91.2
 for <qemu-devel@nongnu.org>; Sun, 03 Dec 2023 20:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665881; x=1702270681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rsvQGttsG1j4LVkaq+2g5xyJkzfY1bgtbrpiZS/u/FI=;
 b=fgbKUpdXXQ/068a9ia+6/K3GWqyptMnZOgMCW8/4PJCfPEs4u5H+BOOp0mxGc0rvpr
 +Mn/YvbUomO80ndTi296kbNdlk7EWXbtKLfnRTvTXwdVKFVhiG7tLWEVYTL82G/CoOqt
 2iRcwD6pzT6GGmXeHV/pXTE5BwvBTuE+sm99lyVzWQJvThS506jyvrTWlXETT0KxriFb
 6ffTgj9hyr0bZrULl++CAkh3CW2uSSHQTG0rBy6zpG7xDjbft2+F9SsnG/czwMQP3YUu
 Na/Cw59DCtBsYJCP46MKEq8NqjsZvq2dxNu18eOcgKIHZ422KWlUXNbn79iqao5Dr5+E
 y73Q==
X-Gm-Message-State: AOJu0YwKD+zK7TibTJdc8ZP6Y8jvlpnwyqgX+nBm3XqHwII3+WxrIlM7
 acbfUU/YrXClkcVkkBbAt82bkVH1FFg0/v6JZ40GU61RKalL0Fltk4vVIO2yf+GdtVqgx38Vp98
 +14yt5olNCCLCFoA=
X-Received: by 2002:a17:90a:9102:b0:286:6cc1:269 with SMTP id
 k2-20020a17090a910200b002866cc10269mr753626pjo.52.1701665881582; 
 Sun, 03 Dec 2023 20:58:01 -0800 (PST)
X-Received: by 2002:a17:90a:9102:b0:286:6cc1:269 with SMTP id
 k2-20020a17090a910200b002866cc10269mr753622pjo.52.1701665881305; 
 Sun, 03 Dec 2023 20:58:01 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:58:00 -0800 (PST)
Message-ID: <af7541f7-e790-4d63-8bbb-cc9da491fe0f@redhat.com>
Date: Mon, 4 Dec 2023 14:57:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 16/25] backends: Have
 HostMemoryBackendClass::alloc() handler return a boolean
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-17-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: RatRVfRqIvPZ

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/hostmem.h | 10 +++++++++-
>   backends/hostmem-epc.c   | 11 +++++------
>   backends/hostmem-file.c  | 19 ++++++++++---------
>   backends/hostmem-memfd.c | 10 +++++-----
>   backends/hostmem-ram.c   |  9 +++++----
>   backends/hostmem.c       |  5 ++---
>   6 files changed, 36 insertions(+), 28 deletions(-)
> 

s/cpu_exec_realizefn()/HostMemoryBackendClass::alloc()

Reviewed-by: Gavin Shan <gshan@redhat.com>

