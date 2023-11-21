Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp530148ejy;
        Tue, 21 Nov 2023 07:00:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX6Vt4iiPF7/yAt9MJda7taET9IkOC0/ibcUCY912xAs7s74on6OHC6wn6opJck8FHnrfZ
X-Received: by 2002:a05:6870:8e13:b0:1f5:cd37:34e with SMTP id lw19-20020a0568708e1300b001f5cd37034emr12794695oab.20.1700578838092;
        Tue, 21 Nov 2023 07:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700578838; cv=none;
        d=google.com; s=arc-20160816;
        b=NDeXj4ar5zqzLcRGiAtO0xMr+jlgUIr4cTiaHCj5Y+wW98lbNjkLcSRqu7XArKEbYf
         6jLCWPNGczzEORTNtkHnbBuQptPJP4cPBsrK56pg6PSfxQ8VNg+csWjulB6lJ5lF6uWu
         UVsqliU7ybtvGYuVXdRlB9BnsmPB4P8OSS+lwDyVaU5xhNLP63rGj/xKrdU7WyCvlF9L
         aXIeI6VtYFxkdjgMO8ugWBN4TZy6JTxEo2Xa+CnaF6b9Q9+BOsQ1XkNKVqrnxRv8rIy6
         a+dkGQ5ucZ/o/vvuwwrmaBO1j1m3GdeIgb+o2phtui9Y/wVJpJMfQ0mcqyW9x9gCtPsa
         IvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=gX7TNBdR1Ub8HS1GbOmBzOld4fPPhfpNx+G4FSWwALc=;
        fh=CsdiWNFHKpDi85bv+LYNHOHQERFxFhU1c1y9HbqB3eA=;
        b=b6QVUGdeFRXLKBC3kpLQ6r+qaB3Ihl+kFONKdmnKNhJPaqJGdegLcnIZhYr3YifZq/
         kJQN58jpPAx/MKDHRRQsLD/mnur+rcZCyO1j0LfFlSIEGTdXIV0VoVs+OaOhRTh+Hb45
         rd9cux6qSEVD2Ez8q93pn7mZeaOedD6Q5fyJnrvDq4KK6sS8k4bGQJF2cW73KIPddxx1
         WlmQGvCGhonNaWg2LSBkRDPx5bLyGzGNMM1T64dlTaB2gQH4Uktpr0ECMeR8O/CAluHI
         A2zOQrbSgAZJD74YaiEJBvpyX4A7zeXN3R6pAUE/y5lJMpr4GzaLAdZeHzAoMa8YzEEP
         uz1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KXwqya8z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp35-20020a05622a1ba300b0041098550accsi9292268qtb.209.2023.11.21.07.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 07:00:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KXwqya8z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5SEb-0006IV-80; Tue, 21 Nov 2023 10:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SEZ-0006GE-22
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 10:00:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SEX-0004X0-H3
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 10:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700578813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX7TNBdR1Ub8HS1GbOmBzOld4fPPhfpNx+G4FSWwALc=;
 b=KXwqya8zBrKoSjUNPxGeRuWVqFwsjja6PbstcvXLHxhnSOAMNUcXgBf8SdidDQtkMfh/XN
 HAp4deQak3zUWkRumDPDpJ/YXaTX1fiPuhei4rMlP4OZbCzdBKQN/ASwKTnNOsLKu8ggrU
 kJczl9mnQsFyVLnhgFNuZYlZs3TzSns=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-7Be7H220Ogy8MdePefiBnQ-1; Tue, 21 Nov 2023 10:00:11 -0500
X-MC-Unique: 7Be7H220Ogy8MdePefiBnQ-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1f93a01ef88so736334fac.1
 for <qemu-devel@nongnu.org>; Tue, 21 Nov 2023 07:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700578811; x=1701183611;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gX7TNBdR1Ub8HS1GbOmBzOld4fPPhfpNx+G4FSWwALc=;
 b=lrR7yrXtiia/+4Sm1jtlC/SgHpwdawTo+H7YcGmJ01zIziIQ3FkWKnz6koXze8XQVY
 U6av+dp0Iq+aQUb0lWBbiLu44cfsejUoKaafVZcSIZ/fq4dikB2qspO1WID+cqiejjJq
 x9ke6IrAFa0vQ6xw0kjfLhYJyhRspoFWzK6D+q59peGvhefExecRyUUsxGMRdfcVyXJa
 V94fZuzuddcJ1+E4PJELNpqcZXdqYjP/bPq3DDWKaJJMZ6+tTCoNciwSTPQzOZbPr8wT
 NGo32IXLpv3CNEKE7f689c2sXLYmt5cGNPDM4GnSd9IY1AXFIlq9QFVtbit4jdRNcKeL
 fPgw==
X-Gm-Message-State: AOJu0YwLyImRyrx3Ot5yQyxRi2TJd+me1NxaFP1BFZyPwTfYUbXj2dWP
 2K3rvZfAxGM2bWfF4FGz7wzJgLSKe+ElMMzxXP/63ClymGb5OAbZGh2oS6umME5RcG+KadY03lA
 4er00C51NieC5llQ=
X-Received: by 2002:a05:6871:2304:b0:1f9:5d11:cc7a with SMTP id
 sf4-20020a056871230400b001f95d11cc7amr4074712oab.3.1700578810757; 
 Tue, 21 Nov 2023 07:00:10 -0800 (PST)
X-Received: by 2002:a05:6871:2304:b0:1f9:5d11:cc7a with SMTP id
 sf4-20020a056871230400b001f95d11cc7amr4074696oab.3.1700578810521; 
 Tue, 21 Nov 2023 07:00:10 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 kd13-20020a05622a268d00b004181c32dcc3sm3645147qtb.16.2023.11.21.07.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:00:10 -0800 (PST)
Date: Tue, 21 Nov 2023 10:00:08 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-9.0 09/25] memory: Simplify
 memory_region_init_rom_device_nomigrate() calls
Message-ID: <ZVzF-FinQd_1-U6r@x1n>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120213301.24349-10-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: MwH2T9d+m458

On Mon, Nov 20, 2023 at 10:32:43PM +0100, Philippe Mathieu-Daudé wrote:
> Mechanical change using the following coccinelle script:
> 
> @@
> expression mr, owner, arg3, arg4, arg5, arg6, errp;
> @@
> -   memory_region_init_rom_device_nomigrate(mr, owner, arg3, arg4, arg5, arg6, &errp);
>     if (
> -       errp
> +       !memory_region_init_rom_device_nomigrate(mr, owner, arg3, arg4, arg5, arg6, &errp)
>     ) {
>         ...
>         return;
>     }
> 
> and removing the local Error variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

