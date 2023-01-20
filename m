Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp892243ejc;
        Thu, 19 Jan 2023 23:19:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtN+T4PFJ2c/Nlc03jTvQgOjFeK+khPGajh7QyAH3VC0ioV3Pxp4yawhHCpJJ+qkEs3dGEV
X-Received: by 2002:a05:6214:4287:b0:535:2d28:bf1d with SMTP id og7-20020a056214428700b005352d28bf1dmr20259046qvb.33.1674199198950;
        Thu, 19 Jan 2023 23:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674199198; cv=none;
        d=google.com; s=arc-20160816;
        b=MSkn43DGSLCJdBuUsfxlIJV+gJJUwKXRYCmqS/MI7gGFYdlqtxNG4AbRlFWJzye9Db
         4V9+9+p+XjDqUzTiLzX/uUUKfqMmgpkVL56UJgaLt9Q0evZqMayh4xzINF85C0wtAupa
         25LTenfYJCboWcTI2dKxKryA0YNykrD0NAnEMf9kBYfJdJHDZo9qSMgyWCyjfmpHP+ro
         hwx+XjpFsde84nz9zwtFNkelqZX01Wux1qhfn+4aaZTOGSp1Ba/vGp4E4QVnHawrFpSq
         38LrE8CKAis1XxLdjBTW5TREboogFjhsUNTdVpTkExZfSVG5gsyK2TA7c9j9GfYWM9fF
         oc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=6md71e2jNUouzTwyHjKhVyyvi8603ELUx+xgbZE07Qo=;
        b=s1E69bEcYYcxNR8x4kx0JWIGy40iqmf4Rrg/8i/z6mez1Wvy3DRmj0HqqF0bcu7jjp
         oYUZ+EEi5ocy7Fr3ua2fNBKgsQCnjJ5A/ZCCBoz4fMByl2MBIPFa5T/q2Hbse+MzAvkd
         xtIdfShYHXtg3ehIxc0Rp+08MSISGwVulVwS0xX+JtuZXsZhbjImc0aoNU00IGQbBVG2
         IYwaPXTy/ZWDpCTGAoAzI9gNGEJJH54BbB0KKwo6Kmj3esJkkFLqSAAmv2HRKxpIWmW2
         os3Obf+99RIKl093J+o1OfPRIjdOBVq6fhk1z+TQLU1r+FZTA45SkAMWgtjbKvBnLHND
         3NmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SDg4BsGM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk11-20020ad45d4b000000b004c6ebc735c5si12134259qvb.422.2023.01.19.23.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 23:19:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SDg4BsGM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIlgS-0006Nd-PA; Fri, 20 Jan 2023 02:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlgA-0006Dn-Hh
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 02:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlg8-0000MH-Q6
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 02:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674199152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6md71e2jNUouzTwyHjKhVyyvi8603ELUx+xgbZE07Qo=;
 b=SDg4BsGMiw33Bywaev0jY3kSLA8OlujHvO2Ocanq5uwy7yWp6/j3STHgmK7mIeIp1eP9ZS
 RHDWoUX1ODyRPNgIEDZ2UDZnAP1nY5RnAskVadErJfGyNXW8MiyVxxosQspHyiBPWWaKvh
 PGrThXJNPS7GAwRxTuY514ZpkwwkS1M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-dYftd6rBM2OUinGqeKSM9Q-1; Fri, 20 Jan 2023 02:19:07 -0500
X-MC-Unique: dYftd6rBM2OUinGqeKSM9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C14B03802B82;
 Fri, 20 Jan 2023 07:19:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E696D1415113;
 Fri, 20 Jan 2023 07:19:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CACB421E6A28; Fri, 20 Jan 2023 08:19:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  quintela@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 10/19] migration: Clean up includes
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-11-armbru@redhat.com>
 <Y8kOj6m4jhtUVg+A@work-vm> <87wn5ivmru.fsf@pond.sub.org>
 <Y8ktYMfKahtAZ83A@work-vm>
Date: Fri, 20 Jan 2023 08:19:04 +0100
In-Reply-To: <Y8ktYMfKahtAZ83A@work-vm> (David Alan Gilbert's message of "Thu, 
 19 Jan 2023 11:45:36 +0000")
Message-ID: <87wn5hoeqf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-TUID: 660hawfa4wU/

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>> 
>> > * Markus Armbruster (armbru@redhat.com) wrote:
>> >> Clean up includes so that osdep.h is included first and headers
>> >> which it implies are not included manually.
>> >
>> > That change doesn't seem to match the message; the patch is removing the
>> > osdep.h include.
>> 
>> It's the commit message scripts/clean-includes creates :)
>> 
>> I can throw in another patch to the script so it mentions it also
>> removes qemu/osdep.h from headers.
>
> Oh hmm it would be clearer;

What about

    $GITSUBJ: Clean up includes

    Clean up includes so that osdep.h is included first in .c and not in
    .h, and headers which it implies are not included manually.

    This commit was created with scripts/clean-includes.


>                             but OK then, so 
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!

