Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3992657ejb;
        Tue, 21 Mar 2023 05:20:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set8P26JAVO0vY4dWfIpSdxIEAx+CsQ+rp6T6whuM4HEp/I8c0pwyg89urW1Du+x3oqWUGnLC
X-Received: by 2002:a05:622a:54e:b0:3bf:d0b1:433d with SMTP id m14-20020a05622a054e00b003bfd0b1433dmr3680631qtx.60.1679401245307;
        Tue, 21 Mar 2023 05:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679401245; cv=none;
        d=google.com; s=arc-20160816;
        b=sZLj19deBo1PT2KwwUYfWetyqbS2wINuKA61naw7/3ei41aQnvwtBRivEzofpCvzv6
         qRJ3YVn2avqKZ3nqSPJfUSzc6iEVV04jZJQKcceK/ZkZy8Gt1P/zhdU5L5a6I+Jq1IxN
         C/hXWVuGPYvp2YvUNvxX6RqV+rbwaopH6SA/9sRxkcNWlE7J+rgF5TPaPOLQMUx6Q1Ha
         EQykNN5m7IJe+FEZrbzF5f7dsWmvxkHeb88f+05UiLqPyhs6MzoCXF9fLsJ+a04o3dW+
         ojIhS4ckNQphK6bbhjkLq+m3Fh3iu1oyJWygncbHdBfn8kpcc4FBoXRWC99V232ykR0a
         DfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=QE5GoVD0IH4U/UQ3GeDl5ElsrlukHkKmEvjc3rNTb00=;
        b=VlzBbgmo4yYmu4rbXUzHO1QsqkO1yyzCGWLdNenjb7tSJGST09744rn9Avcare9Qmp
         WB0OTsC0ZHQ/6grKw0z2Isdtj0poAkjnZeQyfH+zZilVXhY+9SyKPLQs2N9LrqnXidCc
         HJg0YNDRrpzkeQhSJsrvuSuPIPEmCtR0X0+pQqVwSNyYoqVDuUPVr365JaPaL4ztieJL
         SGCsUEbqYIQX5iWFokrwbD9hfU4sb/LhoZ0LDwFnIP3p0e9bKv8ulnVGex/wrLwU3syo
         CkNZbEQEWXLaBPyZHoa0qT8wjg/kOsQjyE8lCJSI/sjGJjbuONfICNK/kbGiDi/CxUQS
         QD3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pcu7Xj48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm33-20020a05620a1d6100b00725375894b5si4067314qkb.519.2023.03.21.05.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 05:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pcu7Xj48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peayg-00080W-2z; Tue, 21 Mar 2023 08:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1peaye-0007yj-Dk
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 08:20:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1peayc-0000FN-7l
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 08:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679401229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QE5GoVD0IH4U/UQ3GeDl5ElsrlukHkKmEvjc3rNTb00=;
 b=Pcu7Xj48afC+0vB5iCEslJA04ITNjTm/CGqHvjFxlMO1iKQ1u2bHaiTphDx3gcmV9SKDn7
 SB5Htz+NAGjUc/5CQYbWBpGyfQVf2JohoGsu5Tj4nHJZEplD0Z/lxf4UU1IDf6JAUAGWlg
 QuUxG3/CwE8aYMyH2T5q6EtsZdZMcUc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-lAZJaAUDObu7HARAKXg15A-1; Tue, 21 Mar 2023 08:20:25 -0400
X-MC-Unique: lAZJaAUDObu7HARAKXg15A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EBE3101A550;
 Tue, 21 Mar 2023 12:20:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D9BD2027047;
 Tue, 21 Mar 2023 12:20:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0] docs/system/arm/cpu-features.rst: Fix formatting
In-Reply-To: <CAFEAcA_qQ_iRQWgdLoYeQh3tjMRbqqJ+C49==aed7n7S_xZFYA@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230316105808.1414003-1-peter.maydell@linaro.org>
 <87h6ul0x4m.fsf@redhat.com>
 <CAFEAcA_NiizU4RjRDNFU2==sHSAMZxYJm9dkAXw6M1AZGGyA0w@mail.gmail.com>
 <CAFEAcA_qQ_iRQWgdLoYeQh3tjMRbqqJ+C49==aed7n7S_xZFYA@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 21 Mar 2023 13:20:23 +0100
Message-ID: <87mt46mh2w.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VZqZoD2dF4F3

On Tue, Mar 21 2023, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 16 Mar 2023 at 11:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Thu, 16 Mar 2023 at 11:11, Cornelia Huck <cohuck@redhat.com> wrote:
>> >
>> > On Thu, Mar 16 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >
>> > > The markup for the Arm CPU feature documentation is incorrect,
>> > > and results in the HTML not rendering correctly -- the first
>> > > line of each description is rendered in boldface as if it
>> > > were part of the option name.
>> > >
>> > > Reformat to match the styling used in cpu-models-x86.rst.inc.
>> > >
>> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
>> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> > > ---
>> > >  docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
>> > >  1 file changed, 30 insertions(+), 38 deletions(-)
>> >
>> > (...)
>> >
>> > > @@ -217,16 +210,15 @@ TCG VCPU Features
>> > >  TCG VCPU features are CPU features that are specific to TCG.
>> > >  Below is the list of TCG VCPU features and their descriptions.
>> > >
>> > > -  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
>> > > -                           *impdef* (Implementation Defined) algorithm
>> > > -                           is enabled or the *architected* QARMA algorithm
>> > > -                           is enabled.  By default the impdef algorithm
>> > > -                           is disabled, and QARMA is enabled.
>> > > +``pauth-impdef``
>> > > +  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
>> > > +  Defined) algorithm is enabled or the *architected* QARMA algorithm
>> > > +  is enabled.  By default the impdef algorithm is disabled, and QARMA
>> > > +  is enabled.
>> > >
>> > > -                           The architected QARMA algorithm has good
>> > > -                           cryptographic properties, but can be quite slow
>> > > -                           to emulate.  The impdef algorithm used by QEMU
>> > > -                           is non-cryptographic but significantly faster.
>> > > +  The architected QARMA algorithm has good ryptographic properties,
>> >
>> > You dropped a 'c' here ----------------------^
>>
>> Well spotted...
>
> There weren't any review comments other than the typo, so I'm going
> to fix that and apply to target-arm.next.

In that case, please also add my

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

