Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp842412lfb;
        Wed, 6 May 2020 02:58:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypI4l0f3kkCPlRq28rXFU5mzFUl4Jx30qkOnOH2Vh4YQA49TX5yGbRO7JMHSnHaz6r7dKHVB
X-Received: by 2002:ae9:ef07:: with SMTP id d7mr7930057qkg.229.1588759123574;
        Wed, 06 May 2020 02:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588759123; cv=none;
        d=google.com; s=arc-20160816;
        b=iRAHZ6caNFqcbjjeEqcjkSJke//QnxqRxyl/vdZT24LmKTl4sG78whRvlgh/d8CHvZ
         MnLoWXAJ81VbKvr87ZX2flxwr3PM3opxb9fYcF8mLbtB1szbB2fUup6MZ83/FqKWQynH
         4XJ39sYKdGcOFkRqJGdwMpzpCiNVaJYGSSX2ssCnD039IYLxeINQ532CgeqOWR6SfcF4
         hZNEYxF3SKlUOQCjiwffwZHLXIBhlno7hc9KPMyUdX1MrROsFUhW+qFoJU4HV41WSk3j
         sRFxqHvBBGLcYpHDQmH2xFS67DhM1jyGGh0mer3+r+6Lspl1LOGuofMwrKQv1OOnYfhO
         7WnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=VTQ2zZbAUkCiQOtJoMzyx7tooV4XfYYcQpIyI7xQuwY=;
        b=PvKDHXlbzqkGOFTrmUnaKIEXEmGA0EHKV6R1E2YHAXcS4ZX3f2p2eB/iqXNDR2JjsW
         9sNQK0KlXMBPJU382fy+tNQM295HV/LZEKqSTZsHFqvJn3ma9WgEjVwaVlNUwWouY3u2
         tctUdpbLBrDm/9J2mt3yb1dbI/23QEyR/+iZMY1HM2p2nH5lt04HTvdeEhYqNygA5LQI
         tSTO5cbT9YgLQT69tsPrgfYefzxngZprwg6FvMXUXUqi06JuopKDuF+57xGNAfGG1vPd
         CkoAKLMPH9oe9yvZmC9BfejRn182BGn4h6iWGKWcSEhvpzl2ueu29B4EKVasGOXQIH75
         QTwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TN6QI5b8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id z21si652986qtz.3.2020.05.06.02.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 02:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TN6QI5b8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWGp9-0002Ju-0p
	for alex.bennee@linaro.org; Wed, 06 May 2020 05:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jWGp1-0002Gq-1n
 for qemu-arm@nongnu.org; Wed, 06 May 2020 05:58:35 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46553
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jWGoz-0007mC-Bd
 for qemu-arm@nongnu.org; Wed, 06 May 2020 05:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588759111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTQ2zZbAUkCiQOtJoMzyx7tooV4XfYYcQpIyI7xQuwY=;
 b=TN6QI5b8dXRyPv1FbqH2NVJ42PJyOVwP8OgJjas/8cpHdgwMbgISK27FAOpz19BYiO9G3W
 wdu4onrc8fNgmEwbKBxDkfAjenSCvAy1yH7XoodqQWfteJr7pN5YhnIl7bXmIWi0J/wk6B
 1SwjEJPVjsIJqrH0RW4yO88bMs60o3o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-5Z5U30ExM3SyomWnbzO0wA-1; Wed, 06 May 2020 05:58:30 -0400
X-MC-Unique: 5Z5U30ExM3SyomWnbzO0wA-1
Received: by mail-wm1-f72.google.com with SMTP id f81so524630wmf.2
 for <qemu-arm@nongnu.org>; Wed, 06 May 2020 02:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NRlhaJxOsTWvjcE0SIFi7KX4jHXlWQZ1YFHZy35Rr+8=;
 b=AKyGdi0OjpZmwPgj8sT3qU0XiRyrgd9JtXKyhVLheaNur9AC3YpU6Kk/NsdLQOnhjC
 zgORyZ+wyDXE+7+zrCVY2FqbmoWXu+9bzGdhfpy1DtHEOSplsSWc0ugpcmPgpDBVuj0v
 IGsS5o6v7Y6E5KxTrHIDbGOE/0YE2MpwIPuZZqp2q0k3b7fvO6gFNRydlLXQPqZ7MQlv
 VV4eLWjjKAw6C4CilaUlMtFGhiIboPmwcX+pZr9wwXYonRJZ/oGZE4vKCyZNaWC9CBOk
 r8PCSCro6L65bSR+AMWCU8PxpQY7TbYHSUknQqY2rYBPWvi2zRm2O3NTR4hW4+R8Tnka
 oEUQ==
X-Gm-Message-State: AGi0PubdseOJs1MYpVjbz7mB+2t/kjG6+09ic6qfAhKn57W16bZLoMwa
 BcrvdsRNm7xGuk36wN+JdDoSwNDEiBfA8AkryoQEaOfk5nugS6eAdUsmXMtYne4Edgro8O/WYPZ
 lJg8x2MYjkojo
X-Received: by 2002:a5d:6503:: with SMTP id x3mr9535762wru.153.1588759109228; 
 Wed, 06 May 2020 02:58:29 -0700 (PDT)
X-Received: by 2002:a5d:6503:: with SMTP id x3mr9535716wru.153.1588759108917; 
 Wed, 06 May 2020 02:58:28 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id 1sm2298804wmi.0.2020.05.06.02.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 02:58:28 -0700 (PDT)
Date: Wed, 6 May 2020 05:58:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH v2 1/3] acpi: Move build_tpm2() in the generic part
Message-ID: <20200506055747-mutt-send-email-mst@kernel.org>
References: <20200505144419.29174-1-eric.auger@redhat.com>
 <20200505144419.29174-2-eric.auger@redhat.com>
 <20200506063314.4qvnyfonjixcknuj@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200506063314.4qvnyfonjixcknuj@kamzik.brq.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 02:39:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, gshan@redhat.com, shannon.zhaosl@gmail.com,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, imammedo@redhat.com, eric.auger.pro@gmail.com,
 lersek@redhat.com, ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XLiEKzlOb9FT

On Wed, May 06, 2020 at 08:33:14AM +0200, Andrew Jones wrote:
> I realize this function is just getting moved, but maybe it should get
> converted to the build_append* API while being moved?

I'd rather refactoring was done in a separate patch -
easier to review.

--=20
MST

