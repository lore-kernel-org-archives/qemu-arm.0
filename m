Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp263396ejc;
        Thu, 19 Jan 2023 03:46:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuHRbOT6ErqmontFkJG2w0G4j0TxadpejxH7TOQv8UQY2H7fNTI5Vrk2CyhWp11akvSIeXK
X-Received: by 2002:a05:622a:207:b0:3ac:e03e:f93f with SMTP id b7-20020a05622a020700b003ace03ef93fmr21293146qtx.2.1674128768644;
        Thu, 19 Jan 2023 03:46:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674128768; cv=none;
        d=google.com; s=arc-20160816;
        b=dZOBF3mkBlVdJYjN2cC+gklSDI2nFP0qn+szLrcvihjKE2Vk8yq/GQGP4RXNBOhRIJ
         l6KA2sIqU6R33LTqqyeq70rUpaJ9NJN4xXefQPiBRvLplimzS9MEvNVDSVaZa58juIyM
         JDw+WIJoAODP2/GpZPyyCtHOqJgxBmGc3qKVvDbgIu0fQQ4GIUeRPECWNpgYwWGd98Bn
         ApbLSr5h3txMc9vkkuvntwiTKevLpApUXYFBCK5Wc2nbkIrIpj8Hlg4vRBFtKFQGz20h
         TzRk6zZOjn1jOfCPPw/PKGThw/0RgT+Mx+P32hvc6Vaqs9ArrQZ9MbE9wuuoM5WSpBaG
         ngsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=P78m2bxRvKQ56Scy0mxTJdk2vWI6fJdUGvOt38e9eUg=;
        b=H4dqgvdkahoQPn3Shjq4kZbOMTxr5HljmKJlPnJ+acgBSrTw5USOufs5yqORWI41zk
         jGkGyoWQV0x0DupOB/e3ohjv25SXVgTizKEhR8DRFF2ZjcKATc4qLlWl//uw89ZfIHcD
         URL0BkVqEV+LobZlGyo+0msjI4Fgho3afA7C+Feiwe/jzx1Lr4mJsamqsHpPLnJEGTZe
         8jgkOn0gir6kLoxzOug8rXz2KeO3rNEUrdCdud8QoJwa1Y0nJVl0RtK8/OcM6loMPenV
         juzJOKUm+N9Yd6qAfygjM2tCYWNGBvo/vVrwtCdT0X9eNqkGNCFyp7klJWpoaJQiHhO8
         c1tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiXd4nBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12-20020ac8670c000000b003b694f0b24fsi19057qtp.635.2023.01.19.03.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 03:46:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiXd4nBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pITMY-0007c0-CQ; Thu, 19 Jan 2023 06:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pITMW-0007XG-K2
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pITMU-00076U-2C
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674128741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P78m2bxRvKQ56Scy0mxTJdk2vWI6fJdUGvOt38e9eUg=;
 b=QiXd4nBQYA3OTLlHdXft/Dt1VQhjdRlnygadiAakA0mG7Jbm8xHU9c/bJ20vACEenIvlP7
 s0yEDXuLA2JLlvlPAjwoYh5Rx/4wvELae6R9gXiivFAX241fUVVxNmEbQ72zNhITc4mszw
 XQkzRpIG0DbjerlLS2DFEwBX1RX0Gvg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-9tsOLJdnOQqgnUNO-0gfGQ-1; Thu, 19 Jan 2023 06:45:40 -0500
X-MC-Unique: 9tsOLJdnOQqgnUNO-0gfGQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m10-20020a05600c3b0a00b003dafe7451deso1086113wms.4
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 03:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P78m2bxRvKQ56Scy0mxTJdk2vWI6fJdUGvOt38e9eUg=;
 b=a4BdjI/ZDZK47W4ssiPg16maSENnLYFY42RI1qsk8SN1KU6gCyyihJnQfLtbCFUwFR
 b2CaW90SOElKUSnL7VPwoK3xf7cjpjl9Jqq4OB+hX1Cgcdh5a27ohIQZiz34MtyGzjfY
 DKYuf/PGGy96rjgwlCDpkp/XD7fv3UvbPb4stxwKHqZVOtjWTM+AVNeQyETz/vslTHjw
 k8PRrW5iOS9rcA2wSmFDWIBa4vYmivzDtEq7Vmw6EsPTWQtZ4Ov6UMZtTfiV/cKg4aQD
 Oje8Z55CFZzWBpXVNedvMdAv8QBqvhxplTWZHzQvDHwZK2fPdSL7gCMktaESJffynWyk
 rCkg==
X-Gm-Message-State: AFqh2kpM7axWCiWMRVHn7eHNCVsqf8Mh4+LDUwJNZJBJnbAcgDWdzwcd
 qj4+QPxjho0Qyva+5ZEgbronPiqUuEfeR8JPkqrc8p5vtrm5SHZl/q8UhAEmnOZaz/6aijgiz1j
 SWB7U2amRyzQq
X-Received: by 2002:a05:600c:214f:b0:3d9:ecae:84f2 with SMTP id
 v15-20020a05600c214f00b003d9ecae84f2mr9637808wml.25.1674128738967; 
 Thu, 19 Jan 2023 03:45:38 -0800 (PST)
X-Received: by 2002:a05:600c:214f:b0:3d9:ecae:84f2 with SMTP id
 v15-20020a05600c214f00b003d9ecae84f2mr9637775wml.25.1674128738765; 
 Thu, 19 Jan 2023 03:45:38 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a1c7c17000000b003d974076f13sm4504208wmc.3.2023.01.19.03.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:45:38 -0800 (PST)
Date: Thu, 19 Jan 2023 11:45:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com, tsimpson@quicinc.com,
 palmer@dabbelt.com, bin.meng@windriver.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 10/19] migration: Clean up includes
Message-ID: <Y8ktYMfKahtAZ83A@work-vm>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-11-armbru@redhat.com>
 <Y8kOj6m4jhtUVg+A@work-vm> <87wn5ivmru.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wn5ivmru.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RY+37dekMOq/

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> Clean up includes so that osdep.h is included first and headers
> >> which it implies are not included manually.
> >
> > That change doesn't seem to match the message; the patch is removing the
> > osdep.h include.
> 
> It's the commit message scripts/clean-includes creates :)
> 
> I can throw in another patch to the script so it mentions it also
> removes qemu/osdep.h from headers.

Oh hmm it would be clearer; but OK then, so 

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> >> This commit was created with scripts/clean-includes.
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  include/qemu/userfaultfd.h | 1 -
> >>  1 file changed, 1 deletion(-)
> >> 
> >> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> >> index 6b74f92792..55c95998e8 100644
> >> --- a/include/qemu/userfaultfd.h
> >> +++ b/include/qemu/userfaultfd.h
> >> @@ -13,7 +13,6 @@
> >>  #ifndef USERFAULTFD_H
> >>  #define USERFAULTFD_H
> >>  
> >> -#include "qemu/osdep.h"
> >>  #include "exec/hwaddr.h"
> >>  #include <linux/userfaultfd.h>
> >>  
> >> -- 
> >> 2.39.0
> >> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

