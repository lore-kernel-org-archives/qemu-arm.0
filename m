Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3729649ejb;
        Tue, 21 Feb 2023 15:59:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+JkIJ/0BOYd2Y8JquhngL5djJFKCF7OWGZXqWgWmFz+5RPdaOyAaT8PU537rljy2c5/HOI
X-Received: by 2002:ad4:5cad:0:b0:56e:9c74:74b7 with SMTP id q13-20020ad45cad000000b0056e9c7474b7mr13926292qvh.23.1677023939931;
        Tue, 21 Feb 2023 15:58:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677023939; cv=none;
        d=google.com; s=arc-20160816;
        b=y2nT/msrg8estSNFsrCJxu744li65rPtnxwFkamL0lpWNcCnB+ZZxxbAtLjluCJonk
         TVSMeR0lo95i/fYS2C/PsSSK5EezndxiAYaQ/SVxu1tw3vgiXZhvCM6uB+19uF2EyOl6
         3TKyOYclwd/A9goOw2fHqtLriLQShDbmUe59Ul/Dgxt/FTTSg1O59xvL/bC+/n31IuDT
         ks9el1p4KtaCSk7koFTCu8QHhB6OoH0CGVETih+7/doBGdXm2nLN7ssyFUCkP+dhwicU
         W8NFCVNXgwQPTM7LOzu6EN3mHDGADyVtc1zj7GNkQaS8WPeSdoSVz2eeb0bhnK+mIrGn
         G1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=y6gizhSVpDQr8UfyjYme+jRyarI7qBKUWaghtebGrko=;
        b=wqUBxAM1JRwmN5eFnLN4UaoR0dUYfjzyJazxWsT1cZjnLzCkWy3iVJN0Uo7A1K1dgc
         HaqnRmai6J2Yr8I0156LA86KLNdrhZfkTSMRsxLNiGpR0DrFc3dx8fOC1T3cjJVQ9sSA
         puiSG+QwpeY3tChrDY/3+y7eUwATrG2IepwlU/6Wu0NZooa7jfvy/WOYGDTxZ2D71c2W
         eMlFCynLaVIutgpTrXrGfoScXJdTJN106ZN4ihXyi/JHhTBIRtmJAVfvigDLOiMrDYkx
         mx4Nnh0c4rB/Vo0N6VgWQGdH3uKHLDn/CFwqpb4eogxWAWdrqWzcK0+/7FFpgmyNOBom
         1jGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RE+dQIZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0cb4c2000000b0056c20827442si7184799qvf.485.2023.02.21.15.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:58:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RE+dQIZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUcWi-0001L3-Fb; Tue, 21 Feb 2023 18:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUcWd-0001KI-UZ
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:58:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUcWb-00018W-Tz
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677023900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y6gizhSVpDQr8UfyjYme+jRyarI7qBKUWaghtebGrko=;
 b=RE+dQIZxheV7x7cWuAvw5pgF1/Qfthtg1pLUN/nLWBhk+1CfyDhebNOEFGgyl5z3IYqm1U
 8b/KJ635qUH8vn7G9FBqrO0nzP4haBqwJVPCegy5M4U8RBW1oAtAodCfBehbVdvOwvW1SN
 kmsvu5Zq22pLvV0PEWBWdNhsQfGk5x8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-db4q7YMrMHi2pgAPLfmq_Q-1; Tue, 21 Feb 2023 18:58:19 -0500
X-MC-Unique: db4q7YMrMHi2pgAPLfmq_Q-1
Received: by mail-qk1-f199.google.com with SMTP id
 bk15-20020a05620a1a0f00b00741d6880f38so1862847qkb.18
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 15:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677023899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y6gizhSVpDQr8UfyjYme+jRyarI7qBKUWaghtebGrko=;
 b=4/4LtvWYabtI/VT3/5S3VG9waYrAntOAjGtySGl2Q+Y+CSPmTSA47gpoR7pklyea41
 ivb6cpENOEw93t6BhDAuBIj8Xbe9ZHi1//mV0/ie4XB7PRtjmEMLj7uFnn91p/2zkwHm
 /jsYF11eJz408Yur3tAjqNfrxSJtnaP3MRr327VQ/ZkLk4XSHiOr9Hvn2UohboM/qaaR
 +CxbP/9yuKHJK4EqYmHfhxcl7XlhZBiBxjs2pJutqCTxRc3mASjau+ZcdiAhoSOXPHGb
 uQrHD3zGqLZeIgNiLcPCDOBIHtVms0ktzZiR6w1IFZ/21iLws69Gc8pFz2Qx6TctbZyI
 v/Yg==
X-Gm-Message-State: AO0yUKWAZaDtOgwNscKmPviSm7HtzyeOOwv9RbJyhlND4tXF879HufA0
 Z8P2vcgnfwdmEGVbtvhXmH5il39x4tt+ix/1I9B9lBx2kBQTpFrraG6TSbljFBQjgYFuKQ/SoVP
 ddfXqAmYv9IS5
X-Received: by 2002:ac8:5748:0:b0:3b8:36f8:830e with SMTP id
 8-20020ac85748000000b003b836f8830emr12493386qtx.6.1677023898964; 
 Tue, 21 Feb 2023 15:58:18 -0800 (PST)
X-Received: by 2002:ac8:5748:0:b0:3b8:36f8:830e with SMTP id
 8-20020ac85748000000b003b836f8830emr12493297qtx.6.1677023897716; 
 Tue, 21 Feb 2023 15:58:17 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t22-20020a05620a0b1600b0073917fae4f8sm11740850qkg.25.2023.02.21.15.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 15:58:16 -0800 (PST)
Date: Tue, 21 Feb 2023 18:58:15 -0500
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v1 3/6] kvm: Synchronize the backup bitmap in the last
 stage
Message-ID: <Y/Val7mrVHHE8Bsb@x1n>
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-4-gshan@redhat.com> <Y/UDbqyB2N/OWWi5@x1n>
 <08c954d7-f4e4-4d63-28fc-50128f4bc2d7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <08c954d7-f4e4-4d63-28fc-50128f4bc2d7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: h5x0n2Yl7jO+

Hi, Gavin,

On Wed, Feb 22, 2023 at 10:44:07AM +1100, Gavin Shan wrote:
> Peter, could you please give some hints for me to understand the atomic
> and non-atomic update here? Ok, I will drop this part of changes in next
> revision with the assumption that we have atomic update supported for
> ARM64.

See commit f39b7d2b96.  Please don't remove the change in this patch.

The comment was just something I thought about when reading, not something
I suggested to change.

If to remove it we'll need to remove the whole chunk not your changes alone
here.  Still, please take it with a grain of salt before anyone can help to
confirm because I can miss something else here.

In short: before we know anything solidly, your current code is exactly
correct, AFAICT.

Thanks,

-- 
Peter Xu

