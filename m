Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp4189788lfy;
        Tue, 18 Aug 2020 14:44:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlhvbgMUUu5sOJYrA7wf3zYp9Bu62/EIgm2x6+zCQBtyu2s2OD5vDRFMRBeTGjIM+x6rXT
X-Received: by 2002:a25:aa89:: with SMTP id t9mr30277598ybi.313.1597787067988;
        Tue, 18 Aug 2020 14:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597787067; cv=none;
        d=google.com; s=arc-20160816;
        b=Inm7rR7IBt4NdLXOXHxs7ys7dmcmMY4AfaggR/J3J4lrUb5+tKzm2pmQ1G/d2hv9eS
         ObG7jejMkP96XrX9hMYrwJ2L53CP9th7a4fPsd0QTxlrTxsTsGOC/W9+0iiW0pNyX98l
         4XfEePKRmeKHJbVZ54AvNI0O84KfVYeDgv5HYs6ZC113n7Z8MO8V8eHIvFt2QKZeQ2yZ
         RQMzRFQHB0MsL5VJX63G9C0oJaOEtTH5GJGJ/ZsecWfcDz32uuFai4Ovd4LPmTXFTBGG
         VYZ7twqhcUbr8QmvrBpcrx2Jc/D6+HsnUam+e+yCXodken+mOF8HUVyYEK+DuVESkv9N
         F43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NIcUBY8rv8ol3h9XS1cXSqqY9ofHs1ExTA2icmkSVOg=;
        b=LxtHDXfFrJ8Kj25IIiJeMOPDXwY7Ova6EFu8Fh7pMYfhNzNEG57Y7b+ZuPtgmdN/h+
         uUyJx3285hhLhlz25ndm1e3X7L7BMI4WTSL6ehWUQ6WtnHG03HvNPGj2gekO/0vIy1Yf
         MYffLA6S55lXTM7eRfopPlqDZdwUB3k4xhQNPXWZ2m9bUnRQBEqKRaJZ/hiZAmBljbna
         8sSOCxMREIsdRORMAaHu20k15XPeUeoHr8/zRW+PwT8yQfzYGEytgM56IQh/xn/joAEj
         Vc0JqSdRkpXqbgzW8jfL+lgp5URDGz6mzxSxK89usPbX0AczLSZCe1M5sqi3UCi4Mrum
         THmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bptgHZUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f76si26443498ybg.34.2020.08.18.14.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 14:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bptgHZUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k89P9-0007Uu-9K
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 17:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k89Ol-0007E3-8E
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 17:44:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60281
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k89Oi-0006FV-Cn
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 17:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597787038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NIcUBY8rv8ol3h9XS1cXSqqY9ofHs1ExTA2icmkSVOg=;
 b=bptgHZUMN/lTC/r6yzrf9yLSsU2fLOCuE5ZWghlpjSPP8WF1xP2afgBJ0mQLLo15G+Ee70
 VgJTRE0YyRuRHWD+Jtv6FVLP9EjaSUY2esJirGBwNmnjVtmWzAMiT+p832/IXd7oOHQxBK
 2+kEMOo4V9gG8uzIoyV/Xp3DPAKEolw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-bFsF8iH9PsCR16tM1hjTdA-1; Tue, 18 Aug 2020 17:43:56 -0400
X-MC-Unique: bFsF8iH9PsCR16tM1hjTdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7788D1DE0E;
 Tue, 18 Aug 2020 21:43:55 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EFEE7E302;
 Tue, 18 Aug 2020 21:43:55 +0000 (UTC)
Date: Tue, 18 Aug 2020 17:43:54 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [PATCH 06/41] allwinner-h3: Rename memmap enum constants
Message-ID: <20200818214354.GC500103@habkost.net>
References: <20200813222625.243136-1-ehabkost@redhat.com>
 <20200813222625.243136-7-ehabkost@redhat.com>
 <6ff80e86-2499-f1af-787b-e22043756d7e@amsat.org>
 <CAPan3Wq94G7Nd6segi-JnrL6Zbkb-ygeykkL4zbvRv7rCQ8a2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPan3Wq94G7Nd6segi-JnrL6Zbkb-ygeykkL4zbvRv7rCQ8a2g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 16:56:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LFQU6PlaD7yh

On Mon, Aug 17, 2020 at 09:07:58PM +0200, Niek Linnenbank wrote:
> Hi,
> 
> Interesting suggestion Philippe. I modelled the initial code of the H3 SoC
> mostly in-line with the aspeed SoC,
> to let it use commonly applied code structures where possible. And it looks
> like in this series, aspeed_soc.h is also
> getting the same change. I'll see if I can find some time to make a small
> patch to move the enum to the local allwinner-h3.c file like you
> suggested.
> 
> For Eduardo's work, I'm OK with a rename for now to AW_H3_DEV_*. I see it
> is also done like that in aspeed_soc.h and similar files.
> I do have one follow-up question: which value(s) from the enum are actually
> in conflict? Could you add that in the commit message perhaps, for clarity?

For allwinner-h3, the conflicting macros are: AW_H3_CCU,
AW_H3_SYSCTRL.

v2 of the series will have the conflicting macros mentioned in
the commit message in all the "rename enum constants" patches.

> 
> With that answered:
>   Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Thanks!

-- 
Eduardo

