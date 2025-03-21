Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp388759njc;
        Fri, 21 Mar 2025 08:14:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyiWpsl8PRqhFwTVIsZFGjAzMt6geBIXugmKU/su6uPl0j5g6t0OaM/7j9c4SqHtZUzgns1NoA/uCZvA==@linaro.org
X-Google-Smtp-Source: AGHT+IHoGitLBJeDgY3W9y2ZqAtd1+5XF+BURxwixGymwMOR4/BxdH6d4Q9ZBG5CFesCkXsfTcIO
X-Received: by 2002:a05:620a:4055:b0:7c5:4c49:7697 with SMTP id af79cd13be357-7c5ba1355d2mr596931485a.6.1742570063102;
        Fri, 21 Mar 2025 08:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742570063; cv=none;
        d=google.com; s=arc-20240605;
        b=hfe8NQrWx+DNjUlZGwJIg+rwBHUM4MVGxlKFZWHDKHzm56aNGyGKbUAmVDrKMYZDNz
         nvzDrYYAeOhFbpEQGlvjkWdT2CbYJuGb9NfHs+yeJ43t/AZGaqALuMqnDmOwBIFfaX+E
         FXALFb4/Wd9MXbwZ5WNY2lWd956o4ggbT2zVPWa2DjMdXe5PQocrtzRzz2ure4DahGKT
         r42XERF4iPU264cihJYkZPgqbdwJjwDFOz3cbTnHyj8yFwbOCwbpNq0MchbAPRXvzilm
         Q2wjKb3JTz4CEiIM+4D3bXENXDMez3hY7SrcHHihf7sc5h9zdaMgh5VA5sElWkpqwL22
         2A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:to:from
         :dkim-signature;
        bh=rPupw8CosAXQ7cMnzUG05hJe8aL+7GdH3+3uzrcSG8s=;
        fh=aYiF/zCfbWb8ljJdclTVJwTYeSlmEWG6r6gfpqjlBns=;
        b=d7RXzYc2JlBT8Y8TT6smAvH7yuGcn57Z4HCDGvgfrjbatjXAurMo2PFLpnyYJcBUGu
         4LGALqFFeURSKqP5lgeRrWJ/gLti21Zu5hGHwzHwM/dEeuGxSkkFGjOwmprh8BwUslmu
         dgnZGwSlHx1Cu5ST+oktYkBUcePtOFTcK+gxhewxKlgITPhEMxfHw76FSFlUIC1MraMm
         D3T6+tzizCrNsxqWdxafwBeygJCULKe2wgJ3RMmvCZSSkUt5Drgvk3WOHBmyTmYkIz4v
         A6mt5X4+vmwMqB2+7bn4yym/Rs7pOKFN+RMEGnYpIHRrup29QUHMKkVhQk1KU1WN32Gb
         JaUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=URd5TfqR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9356153si204759185a.410.2025.03.21.08.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 08:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=URd5TfqR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tve4B-0005Fv-ET; Fri, 21 Mar 2025 11:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1tve48-0005En-UB
 for qemu-arm@nongnu.org; Fri, 21 Mar 2025 11:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1tve45-0005pa-1H
 for qemu-arm@nongnu.org; Fri, 21 Mar 2025 11:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742570017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rPupw8CosAXQ7cMnzUG05hJe8aL+7GdH3+3uzrcSG8s=;
 b=URd5TfqRLttSkOhPGSHsbCmV6UyL2UAWbc8FBuaY+NwHuLHI7DGgkM/yCTsCvJCpwIrjVX
 p0BiRm9QlFxC+0F3Rdqm2Gjyk6ygZVFjAW0ewlczq+ie9glrb4G1p6VyDQNhz2yKA+kKGW
 aX7d3u7RDHov9ALyL39B+M7w9FDq2sk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-fq52eXB2N2etE_5c0DpYiQ-1; Fri,
 21 Mar 2025 11:13:33 -0400
X-MC-Unique: fq52eXB2N2etE_5c0DpYiQ-1
X-Mimecast-MFC-AGG-ID: fq52eXB2N2etE_5c0DpYiQ_1742570012
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0F3701933B48; Fri, 21 Mar 2025 15:13:32 +0000 (UTC)
Received: from localhost (unknown [10.67.24.51])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 42A2B1800944; Fri, 21 Mar 2025 15:13:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 01/14] arm/cpu: Add sysreg definitions in cpu-sysregs.h
In-Reply-To: <3b8c9531-b770-4ab2-8c33-8d3bfce03eb6@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy Ross"
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-2-cohuck@redhat.com>
 <3b8c9531-b770-4ab2-8c33-8d3bfce03eb6@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 21 Mar 2025 16:13:24 +0100
Message-ID: <87y0wyto17.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UH95hqGW6Bgk

On Tue, Mar 11 2025, Richard Henderson <richard.henderson@linaro.org> wrote:

> On 3/11/25 09:28, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>> 
>> This new header contains macros that define aarch64 registers.
>> In a subsequent patch, this will be replaced by a more exhaustive
>> version that will be generated from linux arch/arm64/tools/sysreg
>> file. Those macros are sufficient to migrate the storage of those
>> ID regs from named fields in isar struct to an array cell.
>> 
>> [CH: reworked to use different structures]
>> [CH: moved accessors from the patches first using them to here,
>>       dropped interaction with writable registers, which will happen
>>       later]
>> [CH: use DEF magic suggested by rth]
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>   target/arm/cpu-sysregs.h     | 37 +++++++++++++++++++++++++++
>>   target/arm/cpu-sysregs.h.inc | 35 ++++++++++++++++++++++++++
>>   target/arm/cpu.h             | 49 ++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu64.c           | 22 ++++++++++++++++
>>   4 files changed, 143 insertions(+)
>>   create mode 100644 target/arm/cpu-sysregs.h
>>   create mode 100644 target/arm/cpu-sysregs.h.inc
>> 
>> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
>> new file mode 100644
>> index 000000000000..b95320b5b595
>> --- /dev/null
>> +++ b/target/arm/cpu-sysregs.h
>> @@ -0,0 +1,37 @@
>> +#ifndef ARM_CPU_SYSREGS_H
>
> All new files should have a SPDX-License-Identifier tag.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thx, will add.

