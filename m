Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1916813njc;
        Mon, 24 Mar 2025 05:47:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTqJICOJ92bS27sPV3tGVTER7By+lZnYq7ri6Q5fWtYSEfVByf2nAwTLZ48gq1dTUob2RwaOA3xAqLTg==@linaro.org
X-Google-Smtp-Source: AGHT+IF+KKXqjFczrXgyTOfBaDORI1ry83mdfHCMtnoNJjeiVBl61OWxBvpFa3PKf+f6R2Cp2s6Q
X-Received: by 2002:a05:620a:318a:b0:7c5:6ef2:275d with SMTP id af79cd13be357-7c5ba1fc57fmr1891230685a.52.1742820447259;
        Mon, 24 Mar 2025 05:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742820447; cv=none;
        d=google.com; s=arc-20240605;
        b=jj0jokwFIpXPlNXC4kmV18YEKvinpTC3TFObGuHbxQHtQQX5os/TbtF5bE4oo9GBjR
         wWonclhNhkleB+lqqWnHcBT7kpWG3+lTO+M2l/wuQ3vbY+PxvlKkbHojxg7jjcRs1980
         2IRj6UmJmn5yT3ERGhuzCCavEslAwXEQyFCouGvONHpfC+2MluGp4Y3c0cCPn3lRVHNF
         ZkXcAT+Ej4MS75xgGR/QpbQ0F+tIbw4/Mxwf01KWCGcPx5KEtthGSkub1M5rihkIjvJA
         VXQrZOj/TChjjYUVKlTizhxXQS0SU+3oJm+uAvhKHODkpCywH/ueUxEDHBTunP5tLZra
         g/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vlaejTW49+2SQl8bTiBjt5+klb0qChEYp1HvZ26ZB5I=;
        fh=jCbaFznAZWEznT+7926db/ZBBvBZP9LMEzpvicghg9o=;
        b=dOzg0KnaciC1j81i2QjS9Nc0Ww5s8o/pgJIwCzo4XAiyUy4ElOJCFZ9v86imz3fh3n
         8Wvynj1XIgb5mQvZ20Fq75U/Ms0HR+QIU1vxLSNBO1UtjB/U8kYJzD7bKvoCH1YdSGlr
         YQfNrCPlV/RpeFqhqKe32pIsyd+UMyH5v6GG0FgpaidzwUjHZdHmjGlA5JY60LuKDOQu
         tgsO5tbrwEHZUzC7CdE5mbrA4NVi0sAqPUKZHwYy2kEkNFiuH0f+ziJHVal3QezhnRHz
         0fOxonNAIwdBLsJdXUUJ1JtrsZryAVRiHlrPaXioafjqd9jMXuWqGC2nqgDYTd+XGj36
         zhpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OF3wOceD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9362ab1si734269185a.570.2025.03.24.05.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 05:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OF3wOceD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twhD0-0007qt-W4; Mon, 24 Mar 2025 08:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1twhCP-0007dg-N2
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 08:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1twhBt-0001u1-HJ
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 08:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742820361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vlaejTW49+2SQl8bTiBjt5+klb0qChEYp1HvZ26ZB5I=;
 b=OF3wOceDRIT5v0LrM59x1dpLZiJs+BTMrTC6op19j8OLEd2OzhtZdbB1KkLy6+aDXEb1fU
 ppSb9lig9UTd+/Jxs2byPTNpfh1rE+v84g6qMhZrEkpG1vNQR4nME65fc7BHDQLSOU6uC7
 YpqJShopBkqSMJpki4b3y3GhLqLJCiU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-391-7-c_HLBGNle4_7JUBAERkw-1; Mon,
 24 Mar 2025 08:45:57 -0400
X-MC-Unique: 7-c_HLBGNle4_7JUBAERkw-1
X-Mimecast-MFC-AGG-ID: 7-c_HLBGNle4_7JUBAERkw_1742820356
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2F1FC196F400; Mon, 24 Mar 2025 12:45:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.56])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9F410189C310; Mon, 24 Mar 2025 12:45:47 +0000 (UTC)
Date: Mon, 24 Mar 2025 12:45:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH] tests/functional: Add missing require_netdev('user')
 statements
Message-ID: <Z-FT-NE712WMZWA7@redhat.com>
References: <20250324123450.111307-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324123450.111307-1-thuth@redhat.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MGkqwW2OuxuJ

On Mon, Mar 24, 2025 at 01:34:50PM +0100, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> A bunch of tests are using "-netdev user" but fail to check
> for the availability of SLIRP in the binary, so these tests
> fail if QEMU has been configured with "--disable-slirp"
> (most of the tests are disabled by default with a decorator,
> that's likely why nobody noticed this problem yet). Add the
> missing self.require_netdev('user') statements to skip the
> tests if SLIRP is not available.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/functional/test_aarch64_rme_sbsaref.py | 1 +
>  tests/functional/test_aarch64_rme_virt.py    | 4 +++-
>  tests/functional/test_arm_bpim2u.py          | 2 ++
>  tests/functional/test_arm_cubieboard.py      | 2 ++
>  tests/functional/test_arm_orangepi.py        | 4 ++++
>  tests/functional/test_ppc64_hv.py            | 3 +++
>  tests/functional/test_x86_64_kvm_xen.py      | 1 +
>  7 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

