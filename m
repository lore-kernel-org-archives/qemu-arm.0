Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1313078lfp;
        Thu, 7 Oct 2021 05:03:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSijxPwFiCxyrup8zXOywmJn8PB/SRbtpFYxMyd5Kx0qN4kiAZoDlmDB2edGibew1pxzM3
X-Received: by 2002:a6b:3f55:: with SMTP id m82mr2746310ioa.145.1633608214181;
        Thu, 07 Oct 2021 05:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633608214; cv=none;
        d=google.com; s=arc-20160816;
        b=KsQpCqipwUKPvcG3CGhrV/DCeFYBT0v/P+bsAeXbrVk/xojvIr4zKhsXFIJ8cSAny0
         hNT4Xe/mqygcfKWo/10rqMv2E6YrkH+AHuV9NHlcjyAMX79Sp9DCZcZ2UK25G5hGJtZ+
         +ymSQPoE7SSAcN8ZG0o9xW1qo76RkX6uoo5KsHJp5T9T2NXTKBQ5SxucAeb6s1bNOAyh
         FwPlSz4IMAOdApi7NsLUmm1ELhRhinMHLEFT4ZZmOQN4g6/v7H3WjMuXa0E/EnRtDoso
         y4cMxytlUFppPmmsoDscCev+JFSJhw11bQNrY4GJP41vAZ5FuXjihXJ2FsyZbXMwAO4H
         X4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=u1Ma2xmq07klZmRSKyPISiqu9mzkiNykNozpatsLAq8=;
        b=tZPI1cnUjnQhQg2L8Ur1DjW4qef+ZBrf66MOhMYoQM5z3RaYz2LYfbwXr6P4nkhI6m
         DYvpc3hxbLwtEBxJ+gOUTwU8OHVOW+n37rUIH5upHxN+m4pe+ol9iJImZfPM18dvayMk
         Owsye5RTpO+vS8sAijwURvP4mOwKkVVQiPPY6mgRSTNTBh4EeuuzGI86n0Gj2Q6f3TDa
         2sZ/1wKDnlaiKbe2MDaf2H6Mki25bz3XS8ikxhgIyW5Q9xsBraK3LJ4pUNCVavAz5XKy
         RPhwulKzi8VeK3CZbSwvHf64uU4hQ/BHRTuZwGVnP7sUNSIO02Hu8z5NbsW07WuiS72f
         Rw9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jG/RiI2b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si25818435ile.17.2021.10.07.05.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 05:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jG/RiI2b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYS7Z-0003fg-GV
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 08:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mYS7N-0003df-5N
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 08:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mYS7K-0004WF-IX
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 08:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633608198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u1Ma2xmq07klZmRSKyPISiqu9mzkiNykNozpatsLAq8=;
 b=jG/RiI2bZDDexYxhMYLNJMDDZeplVwJf+8SmZRFiNgCwu3o/IbEpQmt9ipef2/VMKPUsl+
 jVL6hMQMSTkQqKwRP5n/VWVWY0D2bIouuh7T38r1YDBOl/Snc4XOhxhyZrolowHemFzBnj
 EKHBbyyt7qTsFVTx+kzjUnMeUraOTEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419--p0upWkuOi-zp4WJa_FJYw-1; Thu, 07 Oct 2021 08:03:17 -0400
X-MC-Unique: -p0upWkuOi-zp4WJa_FJYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A51BD100C664;
 Thu,  7 Oct 2021 12:03:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5775B10013D7;
 Thu,  7 Oct 2021 12:03:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B2FF2113865F; Thu,  7 Oct 2021 14:03:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
 <YVdCRYvRHIio6MZe@redhat.com>
 <afa63e10-2999-4073-e440-a5d87fd6da49@redhat.com>
 <87bl47ll9l.fsf@dusky.pond.sub.org>
 <7ecf30ae-9fdb-2fec-de0f-c542b51cbbb7@redhat.com>
Date: Thu, 07 Oct 2021 14:03:00 +0200
In-Reply-To: <7ecf30ae-9fdb-2fec-de0f-c542b51cbbb7@redhat.com> (Paolo
 Bonzini's message of "Thu, 7 Oct 2021 10:29:34 +0200")
Message-ID: <87k0ipghzf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j69V7wQh+E1m

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 02/10/21 13:27, Markus Armbruster wrote:
>>> The "return a boolean" rule adds some complexity (and
>>> a possibility for things to be wrong/inconsistent) to the function for
>>> the benefit of the callers.
>>
>> Yes, but returning something is only a minor burden.  It also makes
>> success vs. failure obvious at a glance.
>
> Fair enough; I'd still prefer to have an exception to the rule for
> virtual functions.  In that case, I really find the benefit to be
> negative.

No rule without exceptions :)

