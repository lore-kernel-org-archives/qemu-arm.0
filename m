Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2241358njb;
        Tue, 30 Jul 2024 02:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKZZr7qIYmXYyqyHx+O0WU1mR/sm6L6Z1Hfvp0xgRuv6vKoBxRNnQXMQ2LP5LBGL3HZJLYtXHeYA7N78xtvKYgpfjECRm5
X-Google-Smtp-Source: AGHT+IEL9z3IFwVsiHHTP0AP004n//8YYpJy31zBr024JzMhx300n355uyLRvAIOVMN3VaA0gTPY
X-Received: by 2002:a05:6122:1e02:b0:4f5:21da:9b98 with SMTP id 71dfb90a1353d-4f6e68dd41cmr7658608e0c.5.1722330413091;
        Tue, 30 Jul 2024 02:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722330413; cv=none;
        d=google.com; s=arc-20160816;
        b=eZdOZvbbo5qeSu/RuNZdPdr/D+LhNAMJ9AVmJc8OuG4sdN1R7492nBoqy36s/+rNmF
         zjbbc01dVswZJq+qhRLkM+P05i4nJrL+3nLeB74R2KH9Kxdwtlhf2w947PjqViBKa6Jd
         4pgH+5W93qpubNs0GgM4wAOMdfDvWl1dMK6bcFFJHvZXi4pCFvA+F3c4EbVEie+9/43g
         /rhNFqvttYnm+HcAzdC27lVSfAI7VMaEARxrA5o2WJ3MpFGC2tFelZs15Binifd3y2Xh
         eNH962xw5KIIznmP7bKO9bDbltTHf8/Lx/4x4ywNHG7yl4Jt2AwjYqw1RIluHetH/lfZ
         PmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hD2wuqxPh2jNWtI+P8UeiNp+i2th2ceGYiWyfsYeooo=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=yByJx4WAm0RirtU2HmwpXMzACXh5vu1OHuwSO95OFby0uogOMyjq+XZroIKmBKO1aE
         YtRODfvt0fu2WkWig7/7jPqJINaz3mYDMggb8+0QycpQmqJ2mr4Lcn0svqoArrobxadY
         lWo1GYkIbeReuHp/GQVS4FQtTgoFoBHEVb9mc6NxVSPJAR+dc7804syqJoqFXXNFrE5C
         jEdBOi0AWO6dVECeugnlyp0k4V3PXIHSqx42MqnxSqPFICeZ1NizTAW6/18I3zluWQLK
         G1h60XChfvy3Moveet6mZgtt9iJtSQkUAFqDzZMyv7sumGlu1p5DCLs+7sM2mnp7k4co
         QmKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AR/veFBZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8533dacsi128554141cf.716.2024.07.30.02.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 02:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AR/veFBZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sYioi-0002Kt-SD; Tue, 30 Jul 2024 05:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYioh-0002EW-Cr
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 05:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYiof-0002eX-Bl
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 05:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722330404;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hD2wuqxPh2jNWtI+P8UeiNp+i2th2ceGYiWyfsYeooo=;
 b=AR/veFBZujbjFNJ1erZrErmMSGOJ9SUIaWDncLNOz0ZB3u9VRF6Ho1h6g8hW4W0eDtWXUd
 fIAL49GsyzQNYVYEo8/E6X1Zps3Z1sn9427NIntINgTfRdkg5xKGpbKcZ6bGqvW5U7iq1k
 7NdYcnJMLYImP2cXsuVsNcBOzYB2wzI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-216-W961CZLiMsejrsAvp2KgOQ-1; Tue,
 30 Jul 2024 05:06:41 -0400
X-MC-Unique: W961CZLiMsejrsAvp2KgOQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 547981955BEE; Tue, 30 Jul 2024 09:06:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 763D11955D42; Tue, 30 Jul 2024 09:06:20 +0000 (UTC)
Date: Tue, 30 Jul 2024 10:06:16 +0100
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
Subject: Re: [PATCH 17/18] qapi/cryptodev: Drop unwanted 'prefix'
Message-ID: <ZqitCCTOc_U0NRms@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-18-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730081032.1246748-18-armbru@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
X-TUID: NZJHQFNjBQet

On Tue, Jul 30, 2024 at 10:10:31AM +0200, Markus Armbruster wrote:
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> QCryptodevBackendServiceType has a 'prefix' that overrides the
> generated enumeration constants' prefix to QCRYPTODEV_BACKEND_SERVICE.
> 
> Drop it.  The prefix becomes QCRYPTODEV_BACKEND_SERVICE_TYPE.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/cryptodev.json             |  1 -
>  backends/cryptodev-builtin.c    |  8 ++++----
>  backends/cryptodev-lkcf.c       |  2 +-
>  backends/cryptodev-vhost-user.c |  6 +++---
>  backends/cryptodev.c            |  6 +++---
>  hw/virtio/virtio-crypto.c       | 10 +++++-----
>  6 files changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

