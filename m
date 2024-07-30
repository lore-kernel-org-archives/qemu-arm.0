Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2240165njb;
        Tue, 30 Jul 2024 02:03:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8xErOQD+iplMxCYFQL96wE8vSuorF9EgqV56Z2cBwZbZnP2BEJARev4qqLk2WwT5adkzKx9adFVksBYIEa6vshDUXcVB3
X-Google-Smtp-Source: AGHT+IH1+dVIJK3abjADU3MwipHVYH+QgspvUNd9eJ8mDl7H5LQGtnwvT74fn/ROP48HBLZVyhN6
X-Received: by 2002:a05:6359:4c82:b0:1ac:f144:2b16 with SMTP id e5c5f4694b2df-1adf1e76cb9mr1280728255d.26.1722330234173;
        Tue, 30 Jul 2024 02:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722330234; cv=none;
        d=google.com; s=arc-20160816;
        b=KmSSqda4SnSBEjNNzYMvnsapAVoczZJx6hR9oAQOUYaQg1eBaamqkTMCQN+4GMW4ec
         cVCoHNC8YDSDl1+z8x66eAPl+6PpiUIJSqd8B7zIaeA42uDyJ4wXVbG8l4OsLmxzGK2M
         YhVg6GNaQSSjbKzMYCotGSHyCZUFTYMbCaXqKdyjCBAEzRyuFFrN3eGIBCXr6DE5gth3
         vGTVMRmSkbUYsaA9vVoGADOl2h9ROKp6JUY4BSHhkt88XYz9N4Wf8Ga36XMfyRaj6Fif
         Qn384GBAshSspWGNgP4H2isfCPQN+8ePVWqrSk4wG9whkpjPVNwUCwfdaQRdFW4iBr/6
         9FrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5CJI1iBaARoQHF7n545LUBlg3UPJ4WTV6fVy3e6SNBA=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=ren/9cctTldBimVw6S5vEvZKWjNhak2OJT9gh3DzJVmL2bhaMBclD5NaZqgB1E5VL6
         843PtfAhXqxsISVWLXi7UevsBqlr/y/Wt12kolKJWXYsHaqTPj71oAhkhhRdgmmj3np0
         L/1P13w9LszFicpSl3lbQXBDfss97MizzKhuF2bYJaHfwqztQVkcSYyAd7YXAHahaJsE
         Z8/JlkaRbN6lHEwvnUxfwDOmbkogINPdSp9zz3YC9fl8aITD/mAy/09xW9NYaIio6ZBo
         oGtnrsLIlDeFDL+2OsNrdrdtOAkSQdafPraq6+SO2KHVnjnU4Fw7xd1pqzGfrfYsJPvZ
         HTNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q12gusIC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3f8cb98asi125228496d6.7.2024.07.30.02.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 02:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q12gusIC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sYilf-00037z-4s; Tue, 30 Jul 2024 05:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYilZ-0002ne-0C
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 05:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYilX-0001tc-4j
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 05:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722330210;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5CJI1iBaARoQHF7n545LUBlg3UPJ4WTV6fVy3e6SNBA=;
 b=Q12gusICKT6T4Ui3ZUPmDKU6viHbl00qnUdn5XjlUflGIAYMTzPTuw0XiT5fiEt0uQKNY3
 fZO1GJ6BPN9okOI3vUHGH3jBPpmy1llc57b3x2Q4FEZPF0yzPjTUizv2/uw1UuUq5M9nB2
 +SimAE4yc6ITozuXHggMtIkbgrOaKZM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-481-HHTbthWNNB-J10lqS1v_vQ-1; Tue,
 30 Jul 2024 05:03:25 -0400
X-MC-Unique: HHTbthWNNB-J10lqS1v_vQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 875441955D44; Tue, 30 Jul 2024 09:03:20 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 92C001955E89; Tue, 30 Jul 2024 09:03:04 +0000 (UTC)
Date: Tue, 30 Jul 2024 10:03:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, alex.williamson@redhat.com,
 andrew@codeconstruct.com.au, andrew@daynix.com,
 arei.gonglei@huawei.com, berto@igalia.com,
 borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com,
 den@openvz.org, eblake@redhat.com, eduardo@habkost.net,
 farman@linux.ibm.com, farosas@suse.de, hreitz@redhat.com,
 idryomov@gmail.com, iii@linux.ibm.com, jamin_lin@aspeedtech.com,
 jasowang@redhat.com, joel@jms.id.au, jsnow@redhat.com,
 kwolf@redhat.com, leetroy@gmail.com, marcandre.lureau@redhat.com,
 marcel.apfelbaum@gmail.com, michael.roth@amd.com, mst@redhat.com,
 mtosatti@redhat.com, nsg@linux.ibm.com, pasic@linux.ibm.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 philmd@linaro.org, pizhenwei@bytedance.com, pl@dlhnet.de,
 richard.henderson@linaro.org, stefanha@redhat.com,
 steven_lee@aspeedtech.com, thuth@redhat.com,
 vsementsov@yandex-team.ru, wangyanan55@huawei.com,
 yuri.benditovich@daynix.com, zhao1.liu@intel.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH 13/18] qapi/crypto: Rename QCryptoIVGenAlgorithm to
 *Algo, and drop prefix
Message-ID: <ZqisRRREEA5Q3uIk@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-14-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730081032.1246748-14-armbru@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2TC/DQz9V8ra

On Tue, Jul 30, 2024 at 10:10:27AM +0200, Markus Armbruster wrote:
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> QCryptoIVGenAlgorithm has a 'prefix' that overrides the generated
> enumeration constants' prefix to QCRYPTO_IVGEN_ALG.
> 
> We could simply drop 'prefix', but then the prefix becomes
> QCRYPTO_IV_GEN_ALGORITHM, which is rather long.
> 
> We could additionally rename the type to QCryptoIVGenAlg, but I think
> the abbreviation "alg" is less than clear.
> 
> Rename the type to QCryptoIVGenAlgo instead.  The prefix becomes
> QCRYPTO_IV_GEN_ALGO.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/crypto.json               |  9 ++++-----
>  crypto/ivgenpriv.h             |  2 +-
>  include/crypto/ivgen.h         | 14 +++++++-------
>  crypto/block-luks.c            | 16 ++++++++--------
>  crypto/block-qcow.c            |  2 +-
>  crypto/ivgen.c                 | 10 +++++-----
>  tests/unit/test-crypto-block.c | 14 +++++++-------
>  tests/unit/test-crypto-ivgen.c | 22 +++++++++++-----------
>  8 files changed, 44 insertions(+), 45 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

