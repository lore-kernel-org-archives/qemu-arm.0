Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp594613njc;
        Thu, 8 Aug 2024 10:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQi2PS8ah1ymzczQM09FmEWGVKH3Yp640dsLZXZ07xjQFdKjucIlf/1ITBnIoarfkXFwV7r+oC+9w6mE1/udIHwhStKwIa
X-Google-Smtp-Source: AGHT+IH0jSQV0ElOu2tazS598tJhVIT4ND4Sd6KvF1nOLUaCniWWBAJg4Y2fdmc3d66559it4qoe
X-Received: by 2002:a05:620a:45a6:b0:79f:af4:66e4 with SMTP id af79cd13be357-7a3818c062fmr338636985a.57.1723137647254;
        Thu, 08 Aug 2024 10:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723137647; cv=none;
        d=google.com; s=arc-20160816;
        b=ww2xBM028uHxqxK1ZnzJhLoSNoIiKYs7sojMrSZ17suU7hEpO6IyPY8v8N8FzJwEzU
         DqBn5LGEJ6bAzQNKEESve96jIpDVQtSItfhf+HOeOVc/K2T7I2MInl6JxpdosF50RnXo
         0j6gIWeWfr/iq6H+Qboq8LlmLe1myWifu2dj3RUhPzWcC0+usVn/YSEgB0XNV17w7VRX
         i6NGq3LtDueYAUsSft0NsKQGi1qakZWjhhJYVstkgy2TvLBZxud5v2qoVp7s49+LMFzQ
         8Kq3fIAk8ozN8mFui3uwgueri1GNTlpCsTCzYkm1eXb+NlvJa14AuogERO5Tn32C784u
         T9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Se3SkB780zXr/Pc64CrwtybIMq/YGPJt9ry67ZNfY4s=;
        fh=N5HxHITUWSLOkULx7ITQ8OrnC9xUUIL/vatdVN0Rh8s=;
        b=DST6hh30AxMZgnC7GmgDA385FeoghpOghcxZOhRXVVqswFKOiltZCe9PieGwsR5dDJ
         7GAJAv1dS/omTF6JQy1qk7mUpDgWniuYtClGssyl5z7V2OAC7BMwp1b1N/BQ0YqzOFJb
         NoK10ocA9xO88YQAp79GPJr2jlCkFiLPGtCBGDe55gZ9k5coOLGOSqeCrQVh1r/0aE5n
         abWtFDv+UEc56lR74XypoIKKBtGdSP1VfY2WymElN9yj5ixRg7eqpHVu+cfOyHKoAhzJ
         XMO5QpDcdil3ymolJKqzlp5zF/Y9O2VA4gwZ2FAxlEulf0mFVtkrpMHyhnIs4+SEo1aQ
         ElcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vc2ZDssm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a37882f8c1si468001385a.480.2024.08.08.10.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 10:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vc2ZDssm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc6od-0006MZ-CN; Thu, 08 Aug 2024 13:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6oc-0006HU-4w
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6oa-00078R-HR
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723137640;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Se3SkB780zXr/Pc64CrwtybIMq/YGPJt9ry67ZNfY4s=;
 b=Vc2ZDssmnVuOKn3F1axo8+STfkY1m/iAYYHiYPJbG88h/wuT15WJ8rznHASDWXX43JHCQ4
 vZkWzTYKovleHkRfwO3rIi3AaiTydbrMN2HW4sxnmBT3MWp+FiboZm/C6poAPg4ek1OQv2
 MLReWp6H4hXHbWT494of+FBaAqEPl7o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-qUIRMfx6Mya1ECbXfMxHIQ-1; Thu,
 08 Aug 2024 13:20:38 -0400
X-MC-Unique: qUIRMfx6Mya1ECbXfMxHIQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 10F2F1944D04; Thu,  8 Aug 2024 17:20:37 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.163])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4BD6619560A3; Thu,  8 Aug 2024 17:20:34 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:20:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alejandro Zeise <alejandro.zeise@seagate.com>
Cc: qemu-arm@nongnu.org, kris.conklin@seagate.com,
 jonathan.henze@seagate.com, evan.burgess@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/15] crypto/hash-gnutls: Remove old hash API functions
Message-ID: <ZrT-XjeBHnmJMx1h@redhat.com>
References: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
 <20240807195122.2827364-12-alejandro.zeise@seagate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807195122.2827364-12-alejandro.zeise@seagate.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZLcBkWNseqNG

On Wed, Aug 07, 2024 at 07:51:18PM +0000, Alejandro Zeise wrote:
> Removes old hash implemention in the gnutls hash driver.
> 
> Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
> ---
>  crypto/hash-gnutls.c | 47 --------------------------------------------
>  1 file changed, 47 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

