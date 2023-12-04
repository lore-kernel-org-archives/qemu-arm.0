Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2471933ejb;
        Sun, 3 Dec 2023 20:59:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeFEaI47uJAxGg2bXOthwdgxHF0HVd9AupwdWZAxqSsIuThBnCWfSZPHTOB79nDw1fwURo
X-Received: by 2002:a81:4511:0:b0:5cd:3d82:1ac6 with SMTP id s17-20020a814511000000b005cd3d821ac6mr2382432ywa.42.1701665999621;
        Sun, 03 Dec 2023 20:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665999; cv=none;
        d=google.com; s=arc-20160816;
        b=zUankfBNc+N3cccD9y6DKH+rudY2AyDezxShB9/9gnUuA1XL8cp7C/KmCVS8zfDurM
         pNQ98YTp/XUfD02HNTAy7a/bzlqpZqa+SkJlc+kJ0qN2zdaI+ErDQZfysf+gpfIv0Ih9
         FPPFYskB36c/WsNrkTudKk1nADFJZr5tvmhwdp2pbWdZhSHVGzB15F8gNeRnbO7z58vQ
         NATTWxdV5zIzamv+thjf7pq8Fh6f+/PgaK3rVnbYq9l/RU51f3Ieo8XNIpGbXfuxNV/1
         voK/V7PGGHB+WFA+NcvjMlUOyP114ITUpBsCL5mznNc//9sUDkKyFlRQlsqIdsXYAuth
         Rglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F/Iuxf53cjdF1T/3rNvFXQnDtCLaIS7rSq2CgQzFZU8=;
        fh=b35uFABD1pyfpCHKyNBBzz+pHRhWfv4SJ334YiWvp3g=;
        b=U8fjNgzevVtCNDSrWCZz5grIPdFwC8tF78hrj0g5iFoY85xt4/L5U1penF+CEiC8nR
         zqU8v23BgNLQeNjIfBmOjy9sm+kzFeyrHUiiCP4tf2wjXX1t+edOySmhb5g7SjVPQU6u
         hvdRMZDlZaLpp9z2HmfSf6dRrVV5YyL2y3JjpKXwz7jokFXc18F88+W5V2vXJLWysd2m
         XJGamui0N4hVgnxeDbtZWmveUpnvDSPXP+LYgi6GqPL9Ov3L6BfVgPD5FxlUon4lyJN4
         nUctARUE1Fqpx5JFgr2NbpuWePvf2XzxDibj2zmg3Bciv4Bm13acnMbqmmUKMepxMKaf
         y99w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T8PMblzX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85913000000b00423e85ef5fasi8981373qty.497.2023.12.03.20.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:59:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T8PMblzX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rA13f-00011k-VH; Sun, 03 Dec 2023 23:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA13e-000115-A2
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 23:59:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA13c-0006q5-TM
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 23:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/Iuxf53cjdF1T/3rNvFXQnDtCLaIS7rSq2CgQzFZU8=;
 b=T8PMblzXSDiq8cfT/ZGJJlpDCE/9nhZYIIRr7bKmbeLCc43E050WS93yq1wb/pxs/TjVTk
 C3oaWFBNqDM18q/pccShQTQmd/EvDcnmSl4GuKrmvlMV++Qj2mFXOYEUuI0yRpoe6W8Eje
 rF4xCzyQazch2CmpFT7LU+32tDa6mc4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-BohLWl4yPPutndFiP4Bong-1; Sun, 03 Dec 2023 23:59:47 -0500
X-MC-Unique: BohLWl4yPPutndFiP4Bong-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6ce50cbee7bso911002b3a.0
 for <qemu-devel@nongnu.org>; Sun, 03 Dec 2023 20:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665986; x=1702270786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F/Iuxf53cjdF1T/3rNvFXQnDtCLaIS7rSq2CgQzFZU8=;
 b=EQClVj7b7n/jqrJvWO/+xF6RhXXFkkmUQg0jTYKL/zP/fRqlQonDHDo7JEXImmEE5Z
 AdI4gkykEjcuyeyVq3D7PFGHIIvSFyMFFdxBm/McUqhdGrEWilG0nGIGjgCxyW6j8ByP
 VrzSl6RgyvRCMnXwfDMScR4J179ebZUwOmuCje3FPBmpxERX06AVwRod9HeCjO60Jjbe
 zLopAmQLqeecnCBIwC1GhDt/aSagMj30EJrbk47r0q+wTrYf84UnDkh2ZQek9vR48xAE
 yhB+cfUmsHMK3O4woSR2fLXKuf+w5GkhoG9sQcn/FMDptc6uU1WqWTULQx5JS/D4rZqC
 9y+g==
X-Gm-Message-State: AOJu0YxGQUd1V2mmvEDBKQEXqRJKJR94JWZ4HCexDt835YHhxPjoutzl
 QE3ohVuzvGM3O+1iBpLZX2AXo9GFTGzfI36dzLOkJ6ETIvuFhL4U/Kf5LXDjkF56/e1TX9WIRMx
 tIc9CM/he7gbndPc=
X-Received: by 2002:a05:6a21:32a0:b0:18d:d16:e86 with SMTP id
 yt32-20020a056a2132a000b0018d0d160e86mr4446294pzb.59.1701665986060; 
 Sun, 03 Dec 2023 20:59:46 -0800 (PST)
X-Received: by 2002:a05:6a21:32a0:b0:18d:d16:e86 with SMTP id
 yt32-20020a056a2132a000b0018d0d160e86mr4446282pzb.59.1701665985766; 
 Sun, 03 Dec 2023 20:59:45 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:59:45 -0800 (PST)
Message-ID: <56d78e0c-9b29-44d9-a89c-de05355f5f0e@redhat.com>
Date: Mon, 4 Dec 2023 14:59:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 18/25] util/oslib: Have qemu_prealloc_mem()
 handler return a boolean
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
 Peter Xu <peterx@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-19-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-19-philmd@linaro.org>
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
X-TUID: AMpb9F5sAt1U

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/osdep.h | 4 +++-
>   util/oslib-posix.c   | 7 +++++--
>   util/oslib-win32.c   | 4 +++-
>   3 files changed, 11 insertions(+), 4 deletions(-)
>

s/cpu_exec_realizefn()/qemu_prealloc_mem()

Reviewed-by: Gavin Shan <gshan@redhat.com>

