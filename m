Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp602342ejn;
        Thu, 13 Oct 2022 07:46:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM566KJ3DDSdgMEpKWKieLtRrtrB3wHwd89NChv58+RYJ6Wp6GokWjsXbl2Fzy+Mh+pBzQ3D
X-Received: by 2002:a37:b885:0:b0:6cf:4bb1:f056 with SMTP id i127-20020a37b885000000b006cf4bb1f056mr187062qkf.167.1665672382264;
        Thu, 13 Oct 2022 07:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665672382; cv=none;
        d=google.com; s=arc-20160816;
        b=as/TEGY8bJjE13dcZVIwjvNiov7N8HuZSjY2HM/PniTSeozHwMWlz99XLLMpvO3QAN
         wIVtMgabfMu4xb6PfmaZfLRAeKaP1+zOs3E1p4m4rw9B3kD3mSN22bJ2tDwD52ntRRZP
         hPjEr7eCupIaQNHtDBacx62J9XrF4iRU8QSWAgQpJrN41s4sQvKRgjCj3E6Ru992vl36
         QxxqMTdHGT4o7Cv3Tx0qvttraK0uULzMziyiiPQ6UhAHpi/OdIkMKpIRiV19Miflv56B
         94ZN3dyRI512WWEhdC7gAfFKwiiStQx8YXqhcWgzovRQTaWM6lefYHksUXy0jrcq5+Vc
         fAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=b8oynY8R8Pm4AyFPWfMTbFzup+Tk6ESkp1QmIAvc0G4=;
        b=ARp50lndSIzAjFatK2rko4i91S+WrjoLwY5j7FWioQDFPAN/wgxgTYESdE7t2uSrhi
         lqQ3SB4TT8LPEFclDNwQsUyHLGIYctc4iUqmg9UkZoWfq2cmP8I/NFXb7KOhbbHrylKE
         3i7dEkKON40gusZ2znJC2bJnrn4whxWDFYsLPmM4gDcXCF0kZeylLnnZRQrYhDf0T+DJ
         sifIu6TUEQxDBjjfarSxQaW/SxVjmcgQP+RAOa8f6yZgzdwsXC3PpgFZ9IB5SCnyFF0B
         iixyE8GExRnMFhlVFZDHu7yW0CIvOTWisevb/8P4ES6RUr68Y7ggvUvdnMNQbTaMq6bf
         xptA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FJzRVnUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020ac87589000000b00393a3edfab4si35838qtq.194.2022.10.13.07.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Oct 2022 07:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FJzRVnUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oizTZ-0002vr-Qe
	for alex.bennee@linaro.org; Thu, 13 Oct 2022 10:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oizSv-0002si-AC
 for qemu-arm@nongnu.org; Thu, 13 Oct 2022 10:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oizSs-0004xm-Ms
 for qemu-arm@nongnu.org; Thu, 13 Oct 2022 10:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665672337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8oynY8R8Pm4AyFPWfMTbFzup+Tk6ESkp1QmIAvc0G4=;
 b=FJzRVnUXOZWpRRKeNam3G19y4ltuD8Ineowoe0K2GEhC2DaWBXRdElg5d0SvKDEZOqp/oA
 h1+jvGcBipuwjJYjrienDhxqALiY0ZNIB9fR3QxeGUv+MQOZhd72KirYNFIGxTFwaJrbTd
 pN8dHDOOc+6xxWkHGvFn0hhSBMo0lD4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-3yKB5IlGOPmw_qPlv_wtUQ-1; Thu, 13 Oct 2022 10:45:35 -0400
X-MC-Unique: 3yKB5IlGOPmw_qPlv_wtUQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 q28-20020adfab1c000000b0022e0399964dso647914wrc.8
 for <qemu-arm@nongnu.org>; Thu, 13 Oct 2022 07:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8oynY8R8Pm4AyFPWfMTbFzup+Tk6ESkp1QmIAvc0G4=;
 b=N2BNyijwRpmM/PBZfaISAqU/S7C8t5WwSsu7sh/a45f4tHN7IDjYoWkT3OhyPOpIK9
 +Us7vTpzImqDklPtRXMTfUj0j6FpxuoW99T7PVKLOSFDgJJdgvoDNgJCfEIYdZWpp1AB
 qP4hcntVo/0F3NmvzXC4t+KUp+eIoWv8N8mg9XeVzUgxK3DozOArwXbzgH7IrDFwAWY4
 QchcNByGdE7Owv6VSLLH1lCTO8Yc31LrWGIL5iKLQ6E4nYCXSo3piE9dcNvTmRdOTyvY
 2gF0bMKbH6TqpPhUxZ37eHxE5SxJcCZix+Rf5obFtt6q1oRnclgMGIX80OizU3r1kUK6
 sggw==
X-Gm-Message-State: ACrzQf1TNPDm+XPkYj2648++YiVxIRI+zA2o1nDSFPgWk78n5YlRZSyT
 ood282pvPfBNMczPKjSEtNvf9DyhlQbH1lsPTRhEC4P2M2yRdfAUVSmgohM91Y8RGunju5AOpZH
 nVE3vHXxXhgzE
X-Received: by 2002:a05:6000:1562:b0:231:1b02:3dbb with SMTP id
 2-20020a056000156200b002311b023dbbmr204903wrz.685.1665672334848; 
 Thu, 13 Oct 2022 07:45:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1562:b0:231:1b02:3dbb with SMTP id
 2-20020a056000156200b002311b023dbbmr204888wrz.685.1665672334647; 
 Thu, 13 Oct 2022 07:45:34 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 bn24-20020a056000061800b0022a297950cesm2274413wrb.23.2022.10.13.07.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 07:45:34 -0700 (PDT)
Date: Thu, 13 Oct 2022 10:45:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
Message-ID: <20221013103756-mutt-send-email-mst@kernel.org>
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
 <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
 <875yi2mat1.fsf@pond.sub.org>
 <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
 <87mtaitpph.fsf@pond.sub.org>
 <CAE=JJXcbioK4Nod0mSuRY1Mpj8nAYJvgX62cGyG8_MDfVgjyOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE=JJXcbioK4Nod0mSuRY1Mpj8nAYJvgX62cGyG8_MDfVgjyOQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qNEASVtiSTHt

On Thu, Oct 13, 2022 at 02:39:27PM +0900, Akihiko Odaki wrote:
> Yes, I'd like to hear your ideas on how it should be split up. The
> main challenge here is that it changes the signature of a function
> without changing its name.

Lots of ways to do it, e.g.:


1. add a new api with a new name
2. change code to use new name
3. drop old api
4. add new api with old name
5. change code to use old name


or we can stop after 3, it's not too hard to come up
with a slightly different name.

Since all you are doing here is dropping an argument,
other hacks may be possible such as making the function
use variadic arguments temporarily.

-- 
MST

