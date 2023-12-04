Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2468382ejb;
        Sun, 3 Dec 2023 20:47:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHC+GuIg2gsgFg3BaQLVpkgF5mb0uRkiHCNPguoljGh15uNpHNv1cGiBmVHKEPrUyNtOllm
X-Received: by 2002:a05:622a:2683:b0:423:f353:9ce1 with SMTP id kd3-20020a05622a268300b00423f3539ce1mr10718930qtb.31.1701665237176;
        Sun, 03 Dec 2023 20:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665237; cv=none;
        d=google.com; s=arc-20160816;
        b=0a1UNKC7S66NwDtkSCXC/ZKUUHH1cR+UQbpD2ycCCFOvLsRiiyrmtgVZkkKJsILT1+
         a9FGvhU6pAW6Plyxzo+/JFk2jMjr61mcVAlpzKYK67CqYMM5sMOFVQryOV3UzQQZs168
         qCqNH/r1c4TgCvsS1Ntci3iHdQwpxATPmRIF3ZPvfO533cWPhoGRjbSpCRIWo4d6TdwK
         HHg76Xc9XrG5eJCkCsWlICu2DUPRK+55LnSRclZt76iz4vFiSakjwqbyYNH2KvM7nS5C
         TGQYt/LGdxUjouT0ER2E63k1NCKrXLN3Dedh8NNNELQW9BUwCN6S/LzxdHhJIbhEQevf
         ms3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wQySVAv1RTwMbmKzuI7FV3R4Quklar5p0TTt3MosBJY=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=C2soxY5uDuaXatLro3fjDT/w8DOqqkQW+xtDjYLLv8vRj7JrDPS7XycU9khlieUHoU
         Q8/TGumZMFLM9wevhvM/05ThpxDV+2aZJnXNsI7B01ThK4AWHwpOFp2qlHB1PHqaZrpp
         VEoVJXfEQROIrlrJmXzQ9kcXILUV6TRmf5scvwW13q2fNcVRN4ef8/Jo25iPe/end6G3
         pyRCmATk2aIAdRCbQ8CopOk882IU5P3yNg6aMT5lMbFDyOveImAVYgliJApzOz3EKll0
         dSEe4+CG0RSLebgcJR/LWwT0KHcwfQ1jXliyK1dvdWUXMqpHVn93itTqmeEJDFRErSXL
         j8GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YEmNhi14;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4-20020ac85804000000b00423f3ace78csi9300083qtg.709.2023.12.03.20.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:47:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YEmNhi14;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA0qu-0006Pl-Ji; Sun, 03 Dec 2023 23:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0qt-0006P3-31
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0qr-00009E-My
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQySVAv1RTwMbmKzuI7FV3R4Quklar5p0TTt3MosBJY=;
 b=YEmNhi14mzahbegr7mLJIuxK1XYbhdJsryP066qoLo2oZVTYwGnc3pHu7ac2nCEq4EC3IK
 /RkLItNukh1mHNp8QySxLGWuUFSfB3+Bp2VZ3yHbd+YBTZ+zmXj6+/vz+UXsHXabBFWiKi
 tL70FkzrQTfSMVpTODcYrJQMl/kbgnA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-dK1bmmV5P16D0KGy4qpsVQ-1; Sun, 03 Dec 2023 23:46:35 -0500
X-MC-Unique: dK1bmmV5P16D0KGy4qpsVQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-286a93c6c1fso240224a91.2
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 20:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665194; x=1702269994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wQySVAv1RTwMbmKzuI7FV3R4Quklar5p0TTt3MosBJY=;
 b=nFqAmjJFSB0kS4ZbNSxhVDn0vpedK8shNoFgCKfPMsyBcfEtccVXU0aS0Q7RJruFZY
 W6ctSz7+bK+iyP9EDXT6HomM/eFodXqGKERC8W/lL/rc62u62XPSGw/5tJQfruTSSHqt
 gImzgARq6TUC+POCmVl/IhCbYV5+vEiarCEz0Vo4PmQvnfSDqx5Xwx7r/6elxqelVyJL
 s3044Gd22hP3CLGmBpFIG+Ixc8K/6adP1Nsvbbz2lTph6041LmgJacrpivvAl4zOJa9e
 Fn27VSGNX7ehOx+w8J75r9z2+l0SXCmlNP2VeiqRj/bIOfxIImYkUGV8JfomT0T7DYyP
 2zkg==
X-Gm-Message-State: AOJu0Ywa4LJUSyMbfYac60BfolVN6j6fT9e6ZGJ851pOKJ40gHk/0Yxi
 fB4nVveYNIkwzfCpnseYaEicX2RiFd6WFB37QO2Q1yRnhiSxEBBXVnNHOz0bgiBD1jS5ZGwvyO5
 fwDpTqzRzBuXC
X-Received: by 2002:a17:902:f54d:b0:1d0:6ffd:8342 with SMTP id
 h13-20020a170902f54d00b001d06ffd8342mr902036plf.77.1701665194542; 
 Sun, 03 Dec 2023 20:46:34 -0800 (PST)
X-Received: by 2002:a17:902:f54d:b0:1d0:6ffd:8342 with SMTP id
 h13-20020a170902f54d00b001d06ffd8342mr902027plf.77.1701665194301; 
 Sun, 03 Dec 2023 20:46:34 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:46:34 -0800 (PST)
Message-ID: <cf94943e-d4f4-4a18-a779-32476833d518@redhat.com>
Date: Mon, 4 Dec 2023 14:46:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 05/25] memory: Simplify
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
 <20231120213301.24349-6-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 6DIbOrPcTvYA

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
>   system/memory.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

