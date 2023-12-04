Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2474401ejb;
        Sun, 3 Dec 2023 21:05:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjXjBqQQ9KGPPf7r+VBjsunT/bfULlx73uP+iAtfmNdXab+WE6NfItSxtXwuT1YTtQIuuf
X-Received: by 2002:a0c:db0b:0:b0:67a:359:a82c with SMTP id d11-20020a0cdb0b000000b0067a0359a82cmr4925210qvk.22.1701666345613;
        Sun, 03 Dec 2023 21:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701666345; cv=none;
        d=google.com; s=arc-20160816;
        b=AvWKUMy40D8cCm17lJdRSG0jGxkJ4vPP7/ghWcw2iMbi0ylqAkwi9t2YzTFR/YZwJA
         PVQ+FDm01QRaInewRcUkY+B3L2Xu7tnbW3uWUYv97TQx8siwBGrEYmG0xY8r+uBrf8tV
         dXOBXyTjaMCSrMSxdltgwoKevcRgL7aGKgNEN28vyqtHX1rwfFrlgJi7EEsk32iLifCc
         AWIFCeFV45pyVCCZdDsBR99cL37em5MOWHhrbdLTvuGISbgl8JBJsZMZbMX/Xr3pIqSR
         yzgRTrvxeSw8CIOC+e76YywjBwDrgNu8WNcG7uK0s1STuU96DlvbFq/xvM/2NZapXx+R
         3Nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EQVBgghTw1IkrIC7RUvLQ9NlqSvSwNrEhXnaeQmAb8E=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=RlZZ2ijlUXlRVy+fn4NfKdJW0hyuavaeGRNi/RMdrXa0kzkidkFinfOJFQxOeu3uLz
         DWys3aEDSKgXqwv76G4XJcvtO0DYYQlTi7lkBQh7mr++eaM4OkoM1NPMnkqNEpgi6dDx
         Nx9WoAGp6SwWTmxyW/zR1OGenwbJlWTU7Yu3oQfqD5542XusRYqd55latgIbmf+bZJEk
         cpse2eYzIcYW74fd1gE2z1z8Utg6yEXHlm/5uuli2EAL359JzsHito1/LOqM+PhmzG9e
         RAUDBs26bK7dKgOiksYMOgD9m2tSlnQtQEXt07TBMlR8l3oTglvBR2AKiSEXFdWyfJDv
         tCeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jDx+8nrz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020a0562140d8d00b0067a5bf09533si9249752qve.239.2023.12.03.21.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 21:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jDx+8nrz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA195-000578-Cc; Mon, 04 Dec 2023 00:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA16U-0003FZ-J1
 for qemu-arm@nongnu.org; Mon, 04 Dec 2023 00:02:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA16S-0001fi-Vu
 for qemu-arm@nongnu.org; Mon, 04 Dec 2023 00:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701666164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQVBgghTw1IkrIC7RUvLQ9NlqSvSwNrEhXnaeQmAb8E=;
 b=jDx+8nrz6gai2/6lQmRuO9IUfAZFDBHOPKp1pRPosRbQMsQbOJ1NFfmx2PAOrt5Vj8zlM/
 r/+Rnko3hJWXCpofVOltLivTT2BYzxtJRnflJzFuDXAhko1OHM9uvgQy9OKDVNmuVZQAVu
 tqRVg1h8s3CAVICONV+NT25wJLbPiNY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-GYMA9FwRN2GaSm2yV_U0yQ-1; Mon, 04 Dec 2023 00:02:43 -0500
X-MC-Unique: GYMA9FwRN2GaSm2yV_U0yQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1d03b873765so20369325ad.1
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 21:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701666162; x=1702270962;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EQVBgghTw1IkrIC7RUvLQ9NlqSvSwNrEhXnaeQmAb8E=;
 b=pa3ZU6AYZ8Fb0Ylnncqe1jZKla3TWMxJPa+jHsv1H9uxnOlDAFtSEF7NmtDpY4WaiK
 LbieCkbGoe0YRh5hnhva/W+EwDz9BQJLaLg0aTw7p8w5ADpkg4DnhY7kKRFnwm3/pPMc
 tv8HFFzHzDLyLpr6NWYoFFYo0VHPUQCVCPNFcZ3eZ+TiacG6nqazcSCFH/tDOm0hKCCx
 qrkehPGn4KFC1ga2gC2ALul3pHQjzkmq1gNlY7Bl1YQQ25Psj10dve2tr7EHNyeS+eh0
 ZLc29CviojatWAEoB3lRQ4mzsTyOU7ironnVHcYn7ztOZX2N/AyoSFvwaA9EE3g+9zzq
 +FYg==
X-Gm-Message-State: AOJu0YxTuu/Qy8lDuhfqKUnXPddo6zQvANCXi5NceBSUC2Zvr2jjP92r
 NW+gV9coJaLooYLDipBgkEUa9D4tMv886YtdQo1eKtEIRArIOrigFxxcY3SFbi86TYnGVRKPjL7
 /At4+reBQMQbE
X-Received: by 2002:a17:902:e845:b0:1d0:af63:2403 with SMTP id
 t5-20020a170902e84500b001d0af632403mr703484plg.50.1701666162054; 
 Sun, 03 Dec 2023 21:02:42 -0800 (PST)
X-Received: by 2002:a17:902:e845:b0:1d0:af63:2403 with SMTP id
 t5-20020a170902e84500b001d0af632403mr703474plg.50.1701666161842; 
 Sun, 03 Dec 2023 21:02:41 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.21.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 21:02:41 -0800 (PST)
Message-ID: <7f9928a0-62cc-4d11-9e02-c4c62f6be7a3@redhat.com>
Date: Mon, 4 Dec 2023 15:02:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 23/25] hw/misc: Simplify
 memory_region_init_ram_from_fd() calls
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
 <20231120213301.24349-24-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-24-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
X-TUID: J9rSu5MIBhuH

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Mechanical change using the following coccinelle script:
> 
> @@
> expression mr, owner, arg3, arg4, arg5, arg6, arg7, errp;
> @@
> -   memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp);
>      if (
> -       errp
> +       !memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp)
>      ) {
>          ...
>          return;
>      }
> 
> and removing the local Error variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/misc/ivshmem.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>    

