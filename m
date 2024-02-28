Received: by 2002:a17:906:a892:b0:a44:c09:7745 with SMTP id ha18csp319545ejb;
        Wed, 28 Feb 2024 08:08:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJ2ZSGTU7dfhMSIjc0Q4KUTyXBe7dZFYI8Skj0Avd78TJCHi0pZuGLifcTnyhbOzUS0jQK6YUjKXBqCE+TBZ8ImVbZ2Wbs
X-Google-Smtp-Source: AGHT+IGbL1Xjq5bYclShH11MzIm9IIYBxNE5l7YF8A6wJQyyqD2ITE4YPwvU7FqKF5AgZ8sNFG0d
X-Received: by 2002:a1f:cd44:0:b0:4d3:34f4:7e99 with SMTP id d65-20020a1fcd44000000b004d334f47e99mr2286331vkg.0.1709136519824;
        Wed, 28 Feb 2024 08:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709136519; cv=none;
        d=google.com; s=arc-20160816;
        b=DtAk0vFhCzLlhyG7ThbqiSyM0MSxDnr656n2AmIuEahorwQswgpzoQU4wdSe2J79Xa
         ssjfvq/SGP4X/VB95rotVIMzxgfcDE/xHFSXyNwNdSLcIXgmOz4wSY80nYwujupZb2Ga
         dgfzb0pkXVqEjRjwtxE3LXH0fnuiSWmx9wItIiPqzfjdqNTtWxMRy8lZGKmw14Sn13dk
         Akf0frcwVPZElAYEQyH1UQ5kABfXouGTPFEneQMdPJX6li+3mpSLes1YABVIdmXuBNVp
         vSuDm+jvplZY5lZk+cOOb7GBRvWufVYbajsBsiUg8lgHTNdhEoCSyMO23jLYnuqbsxJZ
         Yw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=ILhv+GjEodUGp6k6Q/8JNrMw2H+1KNk8L5USVeS7wdY=;
        fh=BrBHcMGT2zd6wwkz9NMNUdzXcq1ASswL5ye64nMitUM=;
        b=HdJj73pG4o6K0PbldxX6PFtSiU3B27w+CUlwfQEYBINQYnikb2vHsTI425rd5rTPb9
         4ccild/xlPu7sW+6IBqNK+7WoU4838HrRbkBdnvVEulsK/Zosi7tIQ13sBhh3Iiuwuvj
         qYtvsiFhPV2dtaogdYT3DPIYZ7A7ypMtzUhr1ay14siYsKO+7BiG4p0nuX/apEwMGxbp
         hqm6K8FcirSQNd1x7PWjnY6IrbbEb6EfQCSEmgmehCkuhsDlk+sOFG4fGKpe6R8+Qs/s
         ylnqpIYIpH6C/Ch97RRbxN7oZ+ne8J8fBWlkNIDZG9uObpIeZoqiSYr02bXqu8S28uh5
         4XMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ea8cSM+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y73-20020a1f7d4c000000b004d348ba5ebbsi48122vkc.198.2024.02.28.08.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 08:08:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ea8cSM+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfMTn-0006rq-5D; Wed, 28 Feb 2024 11:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rfMTm-0006ra-63
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 11:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rfMTf-00017r-6H
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 11:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709136493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ILhv+GjEodUGp6k6Q/8JNrMw2H+1KNk8L5USVeS7wdY=;
 b=Ea8cSM+iEz1rdc2maE4lXouYc+psumZlf1vs+/80bbGJiun5a8cLOompq184wJ1eNEPpKV
 FEpjK/VyZb59JGfbVB3EGjQh+YDEj1ee4vqFa7SUyFNBTduMCCghapPTOaa9ITKWCLlkHN
 OQe+DpKPggVn7Jmi4NPhD8LIS9lTTSc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-EzkXrEeJNgOaeH1-ebjCRQ-1; Wed, 28 Feb 2024 11:08:10 -0500
X-MC-Unique: EzkXrEeJNgOaeH1-ebjCRQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4788108C19B;
 Wed, 28 Feb 2024 16:08:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CC5D492BE2;
 Wed, 28 Feb 2024 16:08:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5DB6621E66F4; Wed, 28 Feb 2024 17:08:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: <ankita@nvidia.com>,  <jgg@nvidia.com>,  <alex.williamson@redhat.com>,
 <clg@redhat.com>,  <shannon.zhaosl@gmail.com>,
 <peter.maydell@linaro.org>,  <ani@anisinha.ca>,  <berrange@redhat.com>,
 <eduardo@habkost.net>,  <imammedo@redhat.com>,  <mst@redhat.com>,
 <eblake@redhat.com>,  <david@redhat.com>,  <gshan@redhat.com>,
 <zhiw@nvidia.com>,  <mochs@nvidia.com>,  <pbonzini@redhat.com>,
 <aniketa@nvidia.com>,  <cjia@nvidia.com>,  <kwankhede@nvidia.com>,
 <targupta@nvidia.com>,  <vsethi@nvidia.com>,  <acurrid@nvidia.com>,
 <dnigam@nvidia.com>,  <udhoke@nvidia.com>,  <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 1/2] qom: new object to associate device to numa node
In-Reply-To: <20240228135504.00005d12@Huawei.com> (Jonathan Cameron's message
 of "Wed, 28 Feb 2024 13:55:04 +0000")
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-2-ankita@nvidia.com>
 <8734td3uty.fsf@pond.sub.org> <20240228135504.00005d12@Huawei.com>
Date: Wed, 28 Feb 2024 17:08:06 +0100
Message-ID: <87bk80vaft.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: mAnUMtdHJbLT

Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:

>> >  ##
>> >  # @RngProperties:
>> >  #
>> > @@ -911,6 +926,7 @@
>> >  ##
>> >  { 'enum': 'ObjectType',
>> >    'data': [
>> > +    'acpi-generic-initiator',
>> >      'authz-list',
>> >      'authz-listfile',
>> >      'authz-pam',
>> > @@ -981,6 +997,7 @@
>> >              'id': 'str' },
>> >    'discriminator': 'qom-type',
>> >    'data': {
>> > +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties',
>> >        'authz-list':                 'AuthZListProperties',
>> >        'authz-listfile':             'AuthZListFileProperties',
>> >        'authz-pam':                  'AuthZPAMProperties',  
>> 
>> Jonathan, you pointed out interface design issues in your review of v2.
>> Are you fully satisfied with the interface in v3?
>
> Yes. I'm fine with the interface in this version (though it's v7, so I'm lost
> on v2 vs v3!)

Looks like I can't count to 7!

With NUMA capitalized in the doc comment, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

Thanks!

