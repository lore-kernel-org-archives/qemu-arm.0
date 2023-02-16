Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp408147ejb;
        Thu, 16 Feb 2023 03:46:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/fBZwmCFhUGIn/c84AvvbuyTV/O6g6hjkhVsyj258KsxjbFqDU7iPMJLBBWWaXw4JruuUi
X-Received: by 2002:a05:6214:5193:b0:56b:ee79:aacf with SMTP id kl19-20020a056214519300b0056bee79aacfmr9424197qvb.42.1676548000826;
        Thu, 16 Feb 2023 03:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676548000; cv=none;
        d=google.com; s=arc-20160816;
        b=gpPmz6So6V5i2U/5jLYj88Ny+HCGewme22x0pmRHw3juOnD8q4hFwtYYI7coPHz8PL
         GHNJUWig3lttpIcMgfTu+FevV2CgCGQITphX6KjeAhIlVDmdZOUNdPdvPdiu/6Cw5cXK
         N/faial2Yw+Dz3WB65gZ9ewbacwUyxd9pKzcIzBDPMzuiG2/kc6Pi6gqQ8PunYOR3ES+
         CvwrIHmVTH4+3DN3l2c+wkKJHfvgnYJ4oE/6TD/tTTq/cOmIhi6H6w4duNGmYXeV0aD5
         aEI9BDkVe0V8enV2qJgGVzf+InOBCagLLEvbZ+vRCgoQffy+HYoYNplgVF0m57pIK0Uw
         xURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=OXTLtaJcbOGZxqzET7s3E00C2yccOzv8ZhqQ1/xgB80=;
        b=rpd1zGiAuZEM/Cp0XjtHAZZuzQhf04YAruLFIRA2eFGwQ0t+midKmmtJjhbQgzDD/R
         KerazILx64evdhTKqFvQdQY7XsRLIq2gw+hC8EIgB4H01EOxzmdR542YGquQulz+6Yy+
         lI8GAxCUOAm0n7gmVkSl60BHX/r8HK1iARAUxqoDEgl/72s/SQx2b85NZK/Hwrh2AMdx
         J2JskT9yr7oFp1BircZUwp39g2B/osBfkRxWY5JQwZKLbnSPxacFvYqeSrTWBSUO3+h1
         4KsArvKHPSWmV/iMmvpzSaMFhfcwVUBm54Kz2jdR67PIBoMEWi2Iu5Xx+Nz3LvdzqGRl
         OIQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O/P3152k";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d203-20020ae9efd4000000b0071f0cdc8de1si1387211qkg.660.2023.02.16.03.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 03:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O/P3152k";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScib-0003HT-Ea; Thu, 16 Feb 2023 06:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pSciY-0003HE-Bz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:46:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pSciX-0005TV-0o
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676547984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OXTLtaJcbOGZxqzET7s3E00C2yccOzv8ZhqQ1/xgB80=;
 b=O/P3152k0JkqgZsG6xmuWhEY2TxnraNPcSxxgp1N0kfYvUch5WG9E3kmoEc+BXTDy1oEeg
 IZLRPKfwpFBDrnZ181zZ20DjRdodhOnIpPIiDe9ys/C7Z+A9WyxUvMdIWWx7Z56qcQS0JD
 ITE41FeSdnwiaLQYn7WE39L1HKVeCYw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-EwwwJv4HMcmrOAl_MKgDJw-1; Thu, 16 Feb 2023 06:46:13 -0500
X-MC-Unique: EwwwJv4HMcmrOAl_MKgDJw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14224811E6E;
 Thu, 16 Feb 2023 11:46:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3C9E492C3C;
 Thu, 16 Feb 2023 11:46:12 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 0/3] arm: enable MTE for QEMU + kvm
In-Reply-To: <CAFEAcA_QiVe=ZZ1VTVwUiGh6EL8F7qXT=3dnEb+xzUZORO_4Dw@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <CAFEAcA_QiVe=ZZ1VTVwUiGh6EL8F7qXT=3dnEb+xzUZORO_4Dw@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 16 Feb 2023 12:46:11 +0100
Message-ID: <87lekxal4s.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: qs7LVSKEsXht

On Thu, Feb 16 2023, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 3 Feb 2023 at 13:44, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> Respin of my kvm mte series; tested via check + check-tcg and on FVP.
>
> I've taken patch 1 into target-arm.next since it's a simple
> cleanup.

Thanks!

(I plan to send a respin of the remainder once we've agreed on some of
the feedback.)

