Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp661038ejt;
        Sun, 26 Nov 2023 16:17:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+MIyG9SQnZ1t0deIBDu72/BbI+opMqBn2e4hjuvao686WDF/G2alUBR836/egWH9ScSiP
X-Received: by 2002:a05:6358:6f8a:b0:16e:3803:9cf2 with SMTP id s10-20020a0563586f8a00b0016e38039cf2mr4504393rwn.13.1701044271735;
        Sun, 26 Nov 2023 16:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701044271; cv=none;
        d=google.com; s=arc-20160816;
        b=z/vtM7CQroMK9kgyinZwaC4rV4qfZxojJTO7VJEO9flp/TQpd8/ZH75BefXR+ulpsa
         RuvOVTEznEpTNTtKZKFL3xpxVJM5Izd8Zm9hm0dfJ9X885RiN377vY8z9+xQrLBq8knd
         oh9Wu3+roMLGTa6o8mAwQ1xDfkeXaJKpKVYX+QyP1tEQz2o/9DcgRi4nvl10zhOfGZcK
         0uNIqz9cemGSRVDK13HzjRmARcQxruUGFvgmlUUdjMA4cua6gWmt7gXe8256Hno+LI9Z
         AskumuOFY6QGkOg9g5/9a/7lDOPqZeXatbwnHnLnNwtAfPYxh+WCq8ZrnW2P7ctA2nP1
         yxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NIrDtKWLp27JenwO0XHwGY8rObXNUmaetAoeUhPuVb8=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=NrUJ+MaI4FbvxaPnQJCL0c/+dJpV9CNNvGneh9d8J8ueW6Vs9kLCc0501ooDjwOMW4
         IW8v2kWY1sgtx2fVe4QalU41KAEuzEdFGFmmmpY+kncVST9kTls9rOB+HVRJSlE1cO5O
         hYZ2gJBzoFPR0Se5PCodwk3zg7ByliFKe1xt+cPQ5OOcFnDlnh/y/iGcwhe0kg6e5UpP
         fAdvlUxZPdRz/r5/jrvy2dkGEOBZmYOCcWLFD9Yt3aWPpDIum2rXLdQf4PgeCGViD/DJ
         BfpWkvJqTqM1s3kJika2TCikmCtHLIe73mVkZqIqrgUt6Hd5liuWPsNQbocUI7CJWIGg
         pAMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K+eupT9H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dr11-20020a05621408eb00b00679f5ae0a43si3427490qvb.579.2023.11.26.16.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 16:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K+eupT9H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r7PJd-0002kD-Bi; Sun, 26 Nov 2023 19:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PJc-0002ix-1y
 for qemu-devel@nongnu.org; Sun, 26 Nov 2023 19:17:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PJa-0007ox-4g
 for qemu-devel@nongnu.org; Sun, 26 Nov 2023 19:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701044249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIrDtKWLp27JenwO0XHwGY8rObXNUmaetAoeUhPuVb8=;
 b=K+eupT9HmvLDHtUthBS6P7zQ0FDSqHDR0zruZT4ipsiz7wwmtmDdUgQCKn7EFxSiZ+ECTe
 39+X93Zzs000bt0dDbrSFFziCfnDTPXB4cadXLZSt3sTYSlo4vK3mruPQFP17ojD+EHAEM
 Tp9f7g/+GdUBUJGQns4bA6n+h6yhZD8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-uD1OlDFGOX6W5zNeRAYgKQ-1; Sun, 26 Nov 2023 19:17:28 -0500
X-MC-Unique: uD1OlDFGOX6W5zNeRAYgKQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1cfa392a13eso26768465ad.2
 for <qemu-devel@nongnu.org>; Sun, 26 Nov 2023 16:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701044247; x=1701649047;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NIrDtKWLp27JenwO0XHwGY8rObXNUmaetAoeUhPuVb8=;
 b=IvwWNNUVO93gG5GbHzToTTtLbKtl4JeEYAFQ8UsvyJc3pW/6qWjtZ49JhnFok6O48o
 ahIrQRVPQeXVMVBQOHNDk5yQBv9pocrNhIeivRDifox+/LfOXzyIhkzC3t9dtP6dMyNS
 nBmOVA5xtDLXdwxZMP0CWt4sPhVPfB/BrHwdh4NfW9Em1h32H6GWBU58A+RyKnGZyL0C
 VdM4kDIO+Og0MIGBAubMZvqDgvsUmk64Mdd6FJLV0qHpX4G1+1TDxGfWv5hHX30uYCoS
 QlRx2BpoNHKqS7KKyKfSzehSvDLaUl3PbApf7E3gJB6V+GNpJNYMVBh/UDWhbSucNW2h
 4aSA==
X-Gm-Message-State: AOJu0YwfBBi1WuedVeDjxA0/q1n4pbwadCOA+Jiw3C2LtSYSaYxQFvUB
 ycuBSkBYFV1RJeVQjmvpkaKf+19xUkem5woadVen6XBsDTvufaKs6s4mEEbazpem/Jv8kPbroe7
 ozNB6x300QWyGzws=
X-Received: by 2002:a17:902:6b09:b0:1cc:2456:c17a with SMTP id
 o9-20020a1709026b0900b001cc2456c17amr8086753plk.33.1701044246748; 
 Sun, 26 Nov 2023 16:17:26 -0800 (PST)
X-Received: by 2002:a17:902:6b09:b0:1cc:2456:c17a with SMTP id
 o9-20020a1709026b0900b001cc2456c17amr8086744plk.33.1701044246468; 
 Sun, 26 Nov 2023 16:17:26 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 ik3-20020a170902ab0300b001cfc67d46efsm1386073plb.191.2023.11.26.16.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 16:17:26 -0800 (PST)
Message-ID: <13704541-c175-425e-a475-731621f9e938@redhat.com>
Date: Mon, 27 Nov 2023 11:17:22 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] target/arm/kvm: Unexport kvm_arm_vcpu_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-16-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-16-richard.henderson@linaro.org>
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
X-TUID: 01ouABWuk/ce

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 12 ------------
>   target/arm/kvm.c     | 12 +++++++++++-
>   2 files changed, 11 insertions(+), 13 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

