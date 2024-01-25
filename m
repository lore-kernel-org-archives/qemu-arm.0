Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp673274ejq;
        Wed, 24 Jan 2024 18:24:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKyXcfU9PXdJ5lI0/lHWo9c2oK6v5UVLV0tacMRvebUnd0aYOLuqp/Wuwtw4ZZ30dUppId
X-Received: by 2002:a05:6214:ac9:b0:686:aaad:d40c with SMTP id g9-20020a0562140ac900b00686aaadd40cmr293143qvi.119.1706149455490;
        Wed, 24 Jan 2024 18:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706149455; cv=none;
        d=google.com; s=arc-20160816;
        b=BkAg6Vlb6M21WpeHP+vC2EiVCh+Q03WQHXlsjjGVh5PPNn7quoiOrrXpn+iF3dbhJ1
         8ZvIyYyZc5e99AwMXa6e2tKsv9a2OROrZSawcHU70zEWnSQx6QKAaMgsHXF4aUcOV8Df
         8OkTwHrNkg9woMXjbY7Z9/X1So97jc1YlIlTZt1954wJbmXJlXNFeFX0wVGv2loagnps
         xRiB69RY6zrhZzveCXkNqKrhnRHXQ0u7dR9TZy90clKXxLhgQuGMF8HiifQXnO+onY7n
         yARVeALBM/bWqcCHUv74wBJAlm4U7LZysgh/GkhKQAhR0xX3lsCcXIBfLgTGmPskgFYl
         K6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xBlUJJKBjRQwIANZliBvEHpvGwj2JRdLrwpq1MUBFKM=;
        fh=tvSoKfKG0C5+rZg70buX4YLSasjjtzKPCVsIOCyBYc8=;
        b=i2dCJgICyY/wQVHX3kFyQdoXwHqEccnSsKMRDzx6bfp1l5onMY4k/Yqtxt0OI0UqKg
         rxd5dFQ5Wh+/JDsmuto90fQFuSee51+xDaIgmr4cVxeKArKKUxaKBWrARH1+vWwAN9yB
         eK9OUMSiVNPgPpk6i/M5magMxpIyj0nw63h+G4BE3cZVycJT4YRoIWLx6DfyIC42zq4J
         aHkH5kKOCCPh2z82y4Af+98bE7RIhQSxLp/IeC+JzUnh6hmchI744dZqx4EqvupxxfGu
         lLOAh0fqo4A7IjebBo3i+PoJhwtHosaWhAc5uB1RB7sMG7T8EmqK2A3NPtBLGKxhBKAB
         5kqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AYW0R+GB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020a0c9c06000000b0067f60ad441bsi11818302qve.88.2024.01.24.18.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 18:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AYW0R+GB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSpPU-0007DP-F2; Wed, 24 Jan 2024 21:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpPT-0007DF-Dz
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpPS-0000v6-59
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706149445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBlUJJKBjRQwIANZliBvEHpvGwj2JRdLrwpq1MUBFKM=;
 b=AYW0R+GBWi+giLfUrRZTm2nR1poCC7UPqBKGE71fMCiZfN3lw9emETKYOGTZm30BJ7Vsn+
 3VIsj/rIP4+hkQ16yTSCBit1zUW8+S43WlCV8iXx5MmO/Vcuozs2JmtIyxxg6vuVEdbCs/
 OR5JPyXSefX00vKiP8Ut6IbjE+3e7g4=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-KYsU-xTZNAqK5TfzpyhMhA-1; Wed, 24 Jan 2024 21:24:03 -0500
X-MC-Unique: KYsU-xTZNAqK5TfzpyhMhA-1
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3bb87fc010fso7834114b6e.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 18:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706149443; x=1706754243;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xBlUJJKBjRQwIANZliBvEHpvGwj2JRdLrwpq1MUBFKM=;
 b=KDNsPkbANgtJRue6PJPrFRdwvpJgJX5S9aFtVe49lZZ4RB4y/OVNfvk7SxNrlexYVn
 rQ0SxUY9HhBsKpZSXEKee/mhqEk9XwXaCJw9LbSSUvdTKxR4huf3Ta0NGtcWNw8AHh6w
 HBCwJyXJgc1K464i1N3Vm9ludB4ueqRmR8hCnP/1Q1nxQvrdoP4XD/G79BhDdu+bBRPW
 Thbdfnappnaimag/2RimbFiVypnqs43pvqn8ORK5LHehvhI3hK4rOIq1OXsf2v7emRs8
 4m4HM+foebNZLdDczp1VOFdgY3MEzeY1F5BaZL5kBMV4BdQVj+QhoKXxf7pHa2gIwt0J
 CH8A==
X-Gm-Message-State: AOJu0YzDSDo0eK+KaxJZ2y+5oOpNnjCR2PA8osB+vyfbhr0nmTR40sKg
 gQfrCT8yEZDu/Lzpudo98ibVA//+pHMdW9vwiXxyF5t7elYFct8j++3f1QUOzbGKGutoCvqfRnt
 3hwvRZq0p64WzPUEnIv9DnkjNaSTACEGqaIoXWCW5NlumAKJ7Fw==
X-Received: by 2002:a05:6871:2318:b0:214:2725:4d7a with SMTP id
 sf24-20020a056871231800b0021427254d7amr295999oab.37.1706149442999; 
 Wed, 24 Jan 2024 18:24:02 -0800 (PST)
X-Received: by 2002:a05:6871:2318:b0:214:2725:4d7a with SMTP id
 sf24-20020a056871231800b0021427254d7amr295987oab.37.1706149442776; 
 Wed, 24 Jan 2024 18:24:02 -0800 (PST)
Received: from [10.72.112.202] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p64-20020a634243000000b005cf6e5feeb4sm12589874pga.38.2024.01.24.18.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 18:24:02 -0800 (PST)
Message-ID: <e11a1e2f-eb6d-4ad9-ba5c-f72fbaac12a3@redhat.com>
Date: Thu, 25 Jan 2024 12:23:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] hw/arm/aspeed: Set default CPU count using
 aspeed_soc_num_cpus()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-3-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240123224842.18485-3-philmd@linaro.org>
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
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: NZMCV5c6BSDn

On 1/24/24 08:48, Philippe Mathieu-Daudé wrote:
> Since commit b7f1a0cb76 ("arm/aspeed: Compute the number
> of CPUs from the SoC definition") Aspeed machines use the
> aspeed_soc_num_cpus() helper to set the number of CPUs.
> 
> Use it for the ast1030-evb (commit 356b230ed1 "aspeed/soc:
> Add AST1030 support") and supermicrox11-bmc (commit 40a38df55e
> "hw/arm/aspeed: Add board model for Supermicro X11 BMC") machines.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

