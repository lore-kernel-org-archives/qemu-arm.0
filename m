Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp302262lfg;
        Thu, 18 Mar 2021 05:13:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy1E7KiHGc/dycOJCrbZRzW3wnqSRv8oowhbQ/+lP/Lrb8BjBkZT3QmfXkLlg+RhsQ1XgG
X-Received: by 2002:a05:6e02:12c6:: with SMTP id i6mr4085567ilm.235.1616069599371;
        Thu, 18 Mar 2021 05:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616069599; cv=none;
        d=google.com; s=arc-20160816;
        b=Oc0TZb740ZNY6nFho6iFlmD0KtQx0TxHCzHwFU9gLm2Dddo6WCgXnV4CGVN4HjwP5c
         lqqJyZniydvu5cVrvnmzkFtSJ3rQJL63+QEOoX0gLSkSEpotlND9kxjHqKWAfb/pdYwP
         kDTDnXyUvJIVPtbBlCRIHM08bVC3NbGcdsrBQdBVfTsrwPkpz2KeRgwHyK3nn4Qfn3V7
         82oZIRJ53qzUZoS0OVJOGxVpoOcaHl1aJ02ErEZaE225iu5f3mhbMz46CmzfXSWsachL
         pBqoO2OUJjD3PDSZjd2CO6wfLgQcSzAxA5po7a89kgU93X48VYcaE6DY4CI0mf4Kbs1M
         Tvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=q4214Yr/DmC+fCnmkiUm0ELIn48y2d547AFPHU1RrC4=;
        b=F93+eMEHaUWicDHj/ID+bGW/G6mXpdj6vnVSMj4/g0Tq2gjD+w1MhiEG6DkGwHzeGj
         ms8i/1tpSSIajea4tx+LEji4ND5CALqCc7Dcy480kdCJkp2TKzj/8jbfh8zPjecc4ouA
         q0pc2HncCS0jlIU+STcN8e0yieTeZulPcTsT6h68WAtswy7sbwFmw/qVdEGUb+gSidhu
         DPW5jLoHG2NI1yFK6RR7fumoUQCl7ZtG4XKUlPz49AAd9OjkIm2I16vC7//nRuCwC82J
         P+/KcfDgdW5vi1uyOTbKjRhJcdBniNvaC0Z33RJRzceeUNraEesR4E5y9cdvXhNcqfhf
         Z/kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PwboBwiG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si1092069ios.101.2021.03.18.05.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 05:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PwboBwiG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMrWg-0006um-MJ
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 08:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lMrSJ-0005F1-Iz
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lMrSH-0007Om-Ue
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616069324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q4214Yr/DmC+fCnmkiUm0ELIn48y2d547AFPHU1RrC4=;
 b=PwboBwiGZMKmJN0aa0xzkooeqf0s9xEvfA0Jdz8Ae3V6u8+aBil+QLydk0Ku99fryppx+0
 y2Y/4tNXdWLVvpd1EGXrjMfadQ57MrOeTZdSqr4Q+hezAc318Gc3v/zeTvaOYGpcG+0JpV
 uWW7t2I+N8BtLVrVFgDuKAQ1lfGhBbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-PnlJr6IcOHmF6czKJ35iHw-1; Thu, 18 Mar 2021 08:08:43 -0400
X-MC-Unique: PnlJr6IcOHmF6czKJ35iHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6FB107ACCD;
 Thu, 18 Mar 2021 12:08:41 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.196.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3BBE19718;
 Thu, 18 Mar 2021 12:08:39 +0000 (UTC)
Date: Thu, 18 Mar 2021 13:08:37 +0100
From: Andrew Jones <drjones@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: arm_cpu_post_init (Was: Re: arm: "max" CPU class hierarchy
 changes possible?)
Message-ID: <20210318120837.cg4gfdpchjwiabav@kamzik.brq.redhat.com>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
 <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
 <20210311191046.ykcelkwq7orajyu7@kamzik.brq.redhat.com>
 <5467e45c-cc8e-6422-0c56-398405a7c331@suse.de>
 <c3397f29-82eb-5a1b-803d-8184c9a8d508@suse.de>
MIME-Version: 1.0
In-Reply-To: <c3397f29-82eb-5a1b-803d-8184c9a8d508@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1febxXusSoTN

On Thu, Mar 18, 2021 at 12:32:30PM +0100, Claudio Fontana wrote:
> And why do we have a separate arm_cpu_finalize_features()?

Separate, because it's not just called from arm_cpu_realizefn().

> 
> Nothing in the ARM cpu classes initializations ever seems to be "final" to me.

Some CPU features cannot be simply switched on/off at the property
parse time. For example, there could be dependencies on multiple
properties, the mutual exclusion of properties, or other aspects
that can only be known later than property parse time. That stuff
goes in arm_cpu_finalize_features().

Thanks,
drew

