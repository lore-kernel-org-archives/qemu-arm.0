Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2250760lfo;
        Tue, 8 Mar 2022 03:09:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuhlPlz8aC+rljXc/22R4aoN9aBgTgr7Z/F20+op9cPF5Aqh6VrzniHTivb5Xcq/y+iAgG
X-Received: by 2002:a25:fc26:0:b0:628:689c:df81 with SMTP id v38-20020a25fc26000000b00628689cdf81mr11089221ybd.183.1646737776277;
        Tue, 08 Mar 2022 03:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646737776; cv=none;
        d=google.com; s=arc-20160816;
        b=t08At3nTx9L0CVO2vlDV4l4qT03f7yZTgy8eIlodgvcKLkwy2ask3i+f5zalt2ycyU
         OK4QU146v/jPJgGq6gRbVckHiu9wiEHjwHWPN+5ZITlsz235jv0WlfKSWAkTRkRKW/Lm
         Q8yUiVnorD58lb31c+hwg9J9XrosnIxfVsqHiLnVVqXI3CRNdK4iuQQ7NtuhOZw5kOWP
         TfA1gvw4cjWDugtHggjV+FRbKAlClbONFsgep70o/UQt9KzrhioWcgz+YTbpH0ymCOWl
         Zi+ccHZZSTk4CiFxtaB8Ebtl9XWR5W7XuwfiysqWQ4DUu7BWOKay8fm8NlWLjNQQyQ2f
         5UNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=KBp2gp1abaxUnkN7haiud1YSCDwr9/GGkjgmdW66tLc=;
        b=AshujvoTX5FnLuToQtVFOqdp7BekYZA1zVriOras55JnwvTsqcs3qWvJBtfcSTC4JT
         UE2mE1TTREZfnuRKBfM5vN1VhP3Bcg48rw44pcH9bf4wgvZhpdtBxzqt7kE3OBP73r+y
         OASvKrLw6qvSmoUk1XrdbLQAMM0MImioss3cczL/j8246D37ftSllACVNsciVk3MFIZw
         0lXtejD3ImaX52vLBkErWWkloll6u0q/KWZEWYz4QStEThF786AA7DUFof6fI5BHjKki
         L5M/zGxuyTAhFtZKpixuD3X9Ymjv0Oyaao/dF712Z9s7MfViKSq0X5E2/RezrZFlskye
         cBMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Cl9zRI/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a81790f000000b002dbdfda4ea4si9351580ywc.111.2022.03.08.03.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 03:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Cl9zRI/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRXih-0005g0-MA
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 06:09:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXiV-0005cz-8F
 for qemu-arm@nongnu.org; Tue, 08 Mar 2022 06:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXiT-0001HJ-H1
 for qemu-arm@nongnu.org; Tue, 08 Mar 2022 06:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646737760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KBp2gp1abaxUnkN7haiud1YSCDwr9/GGkjgmdW66tLc=;
 b=Cl9zRI/CqiJqt6/+alruuueZhod9ZuwbIhe87q9PF17su/HQRCgbItyJkv6J++tnBC9SQs
 UzE7Sr1fZFK1jT8dM3y7FFgyPRZRlNnIFDN/7mANnPGPnR3qqC1A/k6lkjzUiI8RTZ1/oz
 Wc9jhFgV+lkaKT9mXCphNdLEOBNuknc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-0lRwj51DOJSNqwuB_35zYw-1; Tue, 08 Mar 2022 06:09:19 -0500
X-MC-Unique: 0lRwj51DOJSNqwuB_35zYw-1
Received: by mail-ed1-f69.google.com with SMTP id
 cm27-20020a0564020c9b00b004137effc24bso10421335edb.10
 for <qemu-arm@nongnu.org>; Tue, 08 Mar 2022 03:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KBp2gp1abaxUnkN7haiud1YSCDwr9/GGkjgmdW66tLc=;
 b=h2XZJoghoCbTpe2qYg08v/DV9rjiqS2V6oGUyPDTxnZA2bUYzymnBD/xJvPIpjQqIj
 g8avoljAoywDwJJh8MCS0Kgx+qWvNIU2emDIhHBnlhLtVCkZRiaKR8JGjB06TWOpXnMp
 UqUS4+d1ddStsn7i0xmBe190gUv+0AQIyBTtTFydkfTnwhOwFVQ4zMHwDFdt89W13X4a
 9EPudhEkInrkE+ANTuxJA1gF3wqvTOovAft7t4LBHa2IEdn24xu7HY8DZCB6XsV6okOm
 UR91iWDVT5pbiIZTZKBVpkqdm9/gsgBZMFN7NQHSBAbGjUJAMj6Mi7cwrtB4EaB4+lCv
 NmYA==
X-Gm-Message-State: AOAM530J5lNR2jqBD83y1cSxx2xfCnw1DlB/cFdxkzqTKEYmkpnjCw9f
 0NUpHe7gBv9XYfNZZfYq5+PbIp0HAujYOPbuPj88ufyYk0zGM1Ldq4JgbLpyRGvvyadCPUp7Ecq
 xlNoGQAMVinhd
X-Received: by 2002:a17:907:96a8:b0:6db:4c68:1393 with SMTP id
 hd40-20020a17090796a800b006db4c681393mr1799717ejc.87.1646737758201; 
 Tue, 08 Mar 2022 03:09:18 -0800 (PST)
X-Received: by 2002:a17:907:96a8:b0:6db:4c68:1393 with SMTP id
 hd40-20020a17090796a800b006db4c681393mr1799691ejc.87.1646737757975; 
 Tue, 08 Mar 2022 03:09:17 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm5709789eje.183.2022.03.08.03.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:09:17 -0800 (PST)
Date: Tue, 8 Mar 2022 06:09:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 3/4] tests/qtest/vhost-user-blk-test: Temporary hack
 to get tests passing on aarch64
Message-ID: <20220308060823-mutt-send-email-mst@kernel.org>
References: <20220307211439.213133-1-eric.auger@redhat.com>
 <20220307211439.213133-4-eric.auger@redhat.com>
 <YicprIn75glZ0zYe@stefanha-x1.localdomain>
 <d85bd084-2856-87d6-3b98-148b2a7fa03a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d85bd084-2856-87d6-3b98-148b2a7fa03a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: eesposit@redhat.com, jean-philippe@linaro.org, qemu-devel@nongnu.org,
 Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com,
 eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vnnKijsSYGNF

On Tue, Mar 08, 2022 at 11:09:13AM +0100, Eric Auger wrote:
> Hi Stefan,
> 
> On 3/8/22 11:02 AM, Stefan Hajnoczi wrote:
> > On Mon, Mar 07, 2022 at 10:14:38PM +0100, Eric Auger wrote:
> >> When run on ARM, basic and indirect tests currently fail with the
> >> following error:
> >>
> >> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
> >> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> >> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
> >> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> >>
> >> I noticed it worked when I set up MSI and I further reduced the
> >> code to a simple guest_alloc() that removes the error. At the moment
> >> I am not able to identify where ths issue is and this blocks the
> >> whole pci/aarch64 enablement.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> ---
> >>  tests/qtest/vhost-user-blk-test.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> > What is the plan to identify the root cause?
> To be honest, I have no precise plan yet. However I commit to work on it
> within the next weeks.
> 
> If maintainers prefer to delay the introduction of qtest libqos
> pci/aarch64 tests until this gets fixed, I would understand though.
> 
> Eric

Given soft freeze sounds like a good plan.

> >
> > Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

