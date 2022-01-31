Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2096322lfk;
        Mon, 31 Jan 2022 01:04:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2vQTqWcKSE61HAaaeDtFYdqz+rUIevWBqUX+a7mBLDXWcbxOSTwmp/YUTzau3YGsEMgtn
X-Received: by 2002:a05:620a:1351:: with SMTP id c17mr12227109qkl.460.1643619886221;
        Mon, 31 Jan 2022 01:04:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643619886; cv=none;
        d=google.com; s=arc-20160816;
        b=gYiZDVrmtvpqshY8WqJ897yj+i8zRzaKx215sRvZCWfNJnTOrgY0frINVz9cXFH5SV
         MOg6sUiAX/Xme8noPnehm4xDRbV176f4AMXl0Y3F+35k92/3viRhVBx9SV17dOEvReFQ
         5WEsGvIuILmjmfN5duXAtgXooEcFVrRKbh1h9vHlsrpAMatf4tp/KTnl35O9vmkkCr4E
         kGsjYnBoVWn2Kd/3WlFRp5SWTWk2cK6UPdEC1vvtVYUu6gEfDtgWDkRTVqpsDIPLBs55
         tu/MiVWe//YbdsxaVDO7UXiqXNj84R++4UTlpVUOjDS7pLn+dEygzVd2ffv8ZPMRjLS1
         jCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:to:from
         :dkim-signature;
        bh=/tJNqqyd7R10N2YzyaNOpnCH3qAZTzi0reSjbfLddrU=;
        b=Vn/18VlKNYQ+CYnHlFyXLwavqg7SmJNYSJsN3rh37kjV1J4S2dyh1Lnl1JQ1L+JEra
         xI8pqztDCc5do4HJfdm0+c9NGKESdwh7f1mmfYE4c032VL/fYm0mrYNxgGPlI4hmbAcS
         Eqz0bdSDj5aQUPQID1MwBvVbJDBxX+YvPNNDSVIGW+lbgv188XzqrUW2y/lgirtRywSX
         u7fv/VUxJ28VugzEXyy5QcSMjtuSHSD5dTlBPSRIP6wb1g9VDfhg2wLUZP6SWNFKXuE2
         pmRE/TJ+ZNvISAdURIkMLfQQeyCAlzDzoDG0OmFc8gipplrXdqyFox3AqoUAJa04eK4y
         gWKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R3lUFG+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl26si13828957qkb.576.2022.01.31.01.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 01:04:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R3lUFG+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nESc7-0004tZ-Nd
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 04:04:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nESbL-0004qa-OU
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 04:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nESbH-0003fD-6p
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 04:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643619825;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/tJNqqyd7R10N2YzyaNOpnCH3qAZTzi0reSjbfLddrU=;
 b=R3lUFG+sAAslcEFnJZArbMuf0135hkwOab+4uoHY5eZkU4NG0HPVv9SLqpkpe12EotfnVt
 3KBgVgC1Xu9L+KBJXPs8k83yovN301ioiNhaiLYbIAUug0biENyOTJAg8pHlcVtIBNWAmt
 81f514RkqyV4mPwHZXfuBK8UL/LTED4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-0fpesKuzNVa5taCDigZYHA-1; Mon, 31 Jan 2022 04:03:44 -0500
X-MC-Unique: 0fpesKuzNVa5taCDigZYHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 z1-20020adfbbc1000000b001df54394cebso3711407wrg.20
 for <qemu-arm@nongnu.org>; Mon, 31 Jan 2022 01:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=/tJNqqyd7R10N2YzyaNOpnCH3qAZTzi0reSjbfLddrU=;
 b=pyTPyU1E+T8+f92dEdfzhjLpPdCIR5oeraD3JJKNgUhNne+65azz9vU9m6xFxYEcll
 JJwv2Wf4iGb/qZ4F+vPttCQ43pWo6Bg1W9tQ7vM5uf8v+rkQeS4+mHeQ7snEM+kgYxhQ
 oTqv1Em4zfsoA163FkdkI1sERqqRwolhom5CvnzaL9hV9FZLU6o9IkeAwearVjuGXNUX
 +Q0A98pd1J8FtvltnnEaJyuVE68dvCBZWo9WB6BMYylpMqq2wrPW4MCaVtnWBZzNynvJ
 cVfQFsDkgEGnfXUXP9DQ1FRhpw6HvaZO+So/LIzi0jAZhZnXggMyEMSjiFFBLDyjkTDk
 R6/A==
X-Gm-Message-State: AOAM532Ea/9wVWQ9V3NK6Y34Nb+zcooJvzajiimg2KmsGI2OtxY5uGWg
 SGjK+rONeBczp8VUVwZGf44Dex/ad2WCY5WODi4ViIKk4JWm85beSgxe2lNAKiwF9mQnoPdn21C
 JwPpb8JQD5+58
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr16826526wru.182.1643619822852; 
 Mon, 31 Jan 2022 01:03:42 -0800 (PST)
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr16826480wru.182.1643619822599; 
 Mon, 31 Jan 2022 01:03:42 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id i6sm8410343wma.22.2022.01.31.01.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 01:03:42 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/38] Migration 20220127 patches
In-Reply-To: <CAFEAcA9O_nZz=4VSvh+rFE4cXepUEBeUui2WdawBjjos+pqOeg@mail.gmail.com>
 (Peter Maydell's message of "Fri, 28 Jan 2022 11:05:10 +0000")
References: <20220127150548.20595-1-quintela@redhat.com>
 <CAFEAcA9O_nZz=4VSvh+rFE4cXepUEBeUui2WdawBjjos+pqOeg@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 31 Jan 2022 10:03:41 +0100
Message-ID: <87ilu08efm.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IlzJHfPjbZ74

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Thu, 27 Jan 2022 at 15:06, Juan Quintela <quintela@redhat.com> wrote:
>>
>> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>>
>>   Merge remote-tracking branch
>> 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging
>> (2022-01-26 10:59:50 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20220127-pull-request
>>
>> for you to fetch changes up to 4e29a822de430e8d0d8bf5c61aaff0561a713d84:
>>
>>   migration: Move temp page setup and cleanup into separate functions (2022-01-27 13:37:55 +0100)
>>
>> ----------------------------------------------------------------
>> Migration Pull request
>>
>> Hi
>>
>> This pull request includes every patch ack'd on the list for migration.  In no particular order:
>>
>> - ram_transferred_add() - (Edmondson)
>> - vmstate canary (dgilbert)
>> - minimum_version_id_old removal (peter maydell)
>> - postcopy cleanups (peter xu)
>> - more cleanups (Philippe)
>> - yet more cleanups (zheng)
>> - colo and cleanups (zhang)
>
> Hi; this fails because we hit this assert in the vmstate canary check
> on some of the CI jobs, for instance:
> https://gitlab.com/qemu-project/qemu/-/jobs/2024872142
> and also on the NetBSD VM in tests/vm.

I dropped them on my PULL request, but there is something fishy on
aarch64 for migration.  It makes exactly zero sense to fail with this
patch.  Or something is missing a VMSTATE_END that only happens on
aarch64.

I will take a look.

Later, Juan.

PD.  As Dave said, the patch makes sense to drop because we need a new
libslirp before pushing for it.

