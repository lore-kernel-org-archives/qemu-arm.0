Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2240739njb;
        Tue, 30 Jul 2024 02:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGKMHzwndKOo7CfA3at5ix1/ZD7zYc4QMJOrMmN64k7kOVgyLLH9YfPbJC6ENXuthpxqbMi7Bbn1q8wE7slUS4IL/5UkMN
X-Google-Smtp-Source: AGHT+IEdDtJmTUV0Bf5ReUNAE3jO1oVDpIgf+hicqNK9VIb6/iu9vaObQqGNOLTwVn4+DCaYCxI+
X-Received: by 2002:a05:6102:6c8:b0:493:d35c:b283 with SMTP id ada2fe7eead31-493fa468c2cmr11810536137.23.1722330314494;
        Tue, 30 Jul 2024 02:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722330314; cv=none;
        d=google.com; s=arc-20160816;
        b=soSaG8y6gBCC0QN1ba3pkA/wkLPzkK/5Otu0jJcJN6LVtTlkfUvL8ix1oc+p279fYO
         /PisXV421De6AjWruA+Zm/VKvlwhjuepr60BHzhkAaM4Q1wigQTcKzoMJ4PqPdLzGiYx
         7TF0fTQHBmzjBv3VHhYxcfjowQrHL+k2V34iiFJ9PtVktqbWluAt8X1zd61UrL/axoVn
         5mMmer43oqhdUWFrINzDpTfcfYEuy9k3H7vxxNbRiy5GcyPgZ3m3NET0CZP1r9whYB+k
         MZyXB880mcBJWsQvRZLM1l0CAP+BpI+fRREAV7PDaR9SPzHYl2vs4ZUXQyzVv/qcnoyr
         tZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=NZvKDZ10vluOr4JkVggkswGdfbJxzsSeMOXoQItf/Cs=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=gL3paRrAOzCIAY3uaqAFWYk+bNn1A0LmUw3ff2JmEuaxrtISgClC7+k/eRdYlEzLqQ
         vN1GdCHZPROBRlClkNzsW5xQbRZ3IQtqypMNvS9X1GMCK9S1YI4x7NdBnRiAutK/DXtt
         LqPfICmd+XQq6F1SwSSAvO1O58Nv23cxPBqLmPPa7HlEsBySzzhe3xk2OTDVXerV6Gn4
         /LXqBUxy8yY1BfYphY5NWIvxoFPd3jWflQDnZ/kQborqD1Xmb0jQqVUYTBFL0bXgvQ4J
         vWZL6K22HDLn99V/iNQzGsBG1CfWO+QNkqQfBWSc422z+mEZ1EwMQu3xy+7+Us7DQCbJ
         lGaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R+y333mQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d739b642si1226138985a.114.2024.07.30.02.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 02:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R+y333mQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYin9-0002wS-Mm; Tue, 30 Jul 2024 05:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYin1-0002RZ-Vp
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 05:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYin0-00024F-1f
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 05:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722330300;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZvKDZ10vluOr4JkVggkswGdfbJxzsSeMOXoQItf/Cs=;
 b=R+y333mQI+07apJyD0JuljdIzhPDaLIs+wo2aXvTUdWE+FA4+wWqlAY5B95pLAcrb/Mk5F
 8GRN2wxL38OcQKqnxR4MnigN7/p06+8zipc+RlAaQGu2JUtD8x2+CUhapZEaI4N1HAgX2l
 +h+xfETe7khFFPd+xrwrbBqLUWB0GOo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-330-BDKcixTcM_GH6HUaFT6nvg-1; Tue,
 30 Jul 2024 05:04:54 -0400
X-MC-Unique: BDKcixTcM_GH6HUaFT6nvg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3E0721956064; Tue, 30 Jul 2024 09:04:50 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 815541955F40; Tue, 30 Jul 2024 09:04:34 +0000 (UTC)
Date: Tue, 30 Jul 2024 10:04:31 +0100
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
Subject: Re: [PATCH 15/18] qapi/crypto: Rename QCryptoRSAPaddingAlgorithm to
 *Algo, and drop prefix
Message-ID: <ZqisnyvjHzYZUuTL@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-16-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730081032.1246748-16-armbru@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: Pl9rQlJ7Klep

On Tue, Jul 30, 2024 at 10:10:29AM +0200, Markus Armbruster wrote:
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> QCryptoRSAPaddingAlgorithm has a 'prefix' that overrides the generated
> enumeration constants' prefix to QCRYPTO_RSA_PADDING_ALG.
> 
> We could simply drop 'prefix', but then the prefix becomes
> QCRYPTO_RSA_PADDING_ALGORITHM, which is rather long.
> 
> We could additionally rename the type to QCryptoRSAPaddingAlg, but I
> think the abbreviation "alg" is less than clear.
> 
> Rename the type to QCryptoRSAPaddingAlgo instead.  The prefix becomes
> QCRYPTO_RSA_PADDING_ALGO.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/crypto.json                        |  9 ++++-----
>  backends/cryptodev-builtin.c            |  6 +++---
>  backends/cryptodev-lkcf.c               | 10 +++++-----
>  tests/bench/benchmark-crypto-akcipher.c | 12 ++++++------
>  tests/unit/test-crypto-akcipher.c       | 10 +++++-----
>  crypto/akcipher-gcrypt.c.inc            | 18 +++++++++---------
>  crypto/akcipher-nettle.c.inc            | 18 +++++++++---------
>  7 files changed, 41 insertions(+), 42 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

