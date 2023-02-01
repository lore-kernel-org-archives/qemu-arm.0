Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp540309ejb;
        Wed, 1 Feb 2023 05:14:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8masx2jCgkN/2V7NnD70Tiz18WHdnZ3fXlQmUhv7W0Txs2paRJunsEPu9FMb1GYwAPBtl3
X-Received: by 2002:ac8:4e81:0:b0:3a5:d1a:8f1d with SMTP id 1-20020ac84e81000000b003a50d1a8f1dmr3685902qtp.27.1675257276840;
        Wed, 01 Feb 2023 05:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675257276; cv=none;
        d=google.com; s=arc-20160816;
        b=mQX5zlhCEPmwStTaMgOm7tf737v/L9OHT/kUc/WGYmLF/YMm03J6RQypzDxXe+WZny
         6Xxxnt/oLAKuJiyRU1jbn1NnCg588oq/DZoW5wvlXMT1dHvfXMOsUBP/Ow4LWqeg+zdm
         tdBik8WeOKWhHecLpo8maDEhgGyJm0VGPl8DMkl1VDUXPdF127au+z3M4egE9/vL2Kd/
         73Z/X9c/0CI7c/ipVo15Wztv/VtRHdx3cfdjiYhrF7XIRr2aPWT0tsHCf7Ccl0kkNYsL
         WnRUExvroXmUPnp0Is4ttzNc5IJ84WASfy+0o255jgFPUVCUWkZcbYDzUY4fK9aU/9I1
         VmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=CBnIdrigAg4xq9Nn0pkiCzy+TzCK0IYmPxCBJAeioM4=;
        b=iCBiAEji8LHqtg2BZHZb/VvNQjHK4iLa918ulSKaDqyJZnpKxgxfR5verJue2v2rJ/
         qsg4gsz2x/0EuEdOdlGIArFwRUSIaxoJPdIf0cr6kif+/SQG2qKTgRzV05wvy94DY7C9
         DdxrjXUIqJcst3mdb3/MNrmTTtrB1AdMAo24IGn7kEgiH9EEFrB0Hv/7RUjsd85UDsuH
         u/NzERGgeZJb/RbZhhLXw/YF1lazaOPN0o+NjpXj8c/Hn6o5GrPnPJaB0r87L4WEX4hU
         Enk9Yei+lehCjeIKqJmVtfVH2A6HAjecFvDXVa4dXIEzh5oivJPQZ7+N1OPp8F79j4Uq
         lUhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NvgPNr56;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o30-20020a05620a0d5e00b007091983f544si10199635qkl.503.2023.02.01.05.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Feb 2023 05:14:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NvgPNr56;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNCwW-0003EZ-0l; Wed, 01 Feb 2023 08:14:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCwU-00039c-Hp
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 08:14:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCwS-0002Xt-Ir
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 08:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675257263;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CBnIdrigAg4xq9Nn0pkiCzy+TzCK0IYmPxCBJAeioM4=;
 b=NvgPNr566Qpa+7PVCbhSeieFGMdMwHvhGazV+XMFs6kt4WvbKK3Mq1yOcdylKuhs9zZHHE
 N2VAsugeI4zHA2iAU5UOTkN1FKddNMcF/gX/qFJ+93g4eV48xQvLlw6lFrZjE1BBK2b3BD
 jdyDKiCpE8010XtN3PeQBOd+q5HfcA8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-Ulz332yDOoetllaBHlymwA-1; Wed, 01 Feb 2023 08:14:22 -0500
X-MC-Unique: Ulz332yDOoetllaBHlymwA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003deab30bb8bso840311wms.2
 for <qemu-arm@nongnu.org>; Wed, 01 Feb 2023 05:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBnIdrigAg4xq9Nn0pkiCzy+TzCK0IYmPxCBJAeioM4=;
 b=3eiRjiXQAUCgDn8tNZxVHOH7u4zNab5wGAQ7pLGWqOGOI6cst38/L4sZczI+6ArxbI
 V+cU80tymozriKwzhsbANj6NmCdBVUgAGNR/YAzBxEKldp9u2RQwezHP30V92ILBaIMX
 9kmKCRDktXxgSs2gHVEwl/LRBcefbVHolWgJ46bpEEUmyIXVNas1hv/0s98JOMdVDhMs
 Qh+Lv5iSAh/QyIL/xZWBMgllt6g8R7kCLImAkdxmVUKa6h9KEpxYNsOQj8bgCIPikgZ2
 WRZANzY2AgjsAeZhPenjMTK6uEjwOZXPem7YboZ9k/eVkNXbYQGSsaaAWD3NvNB34NKl
 A/Lg==
X-Gm-Message-State: AO0yUKWN2UG1Cg8/7LGd97jnRHClGgthpnlEfWRtjDhbySVZTcfMIjsP
 f9vDDH+sf33U0pzNa6kPXM/37t5FDzPM8NCKHr4rBwVkIG7DVXRStNZsG0XMyMTbLB++ISNtzZ6
 o9QJftpdTcR2V
X-Received: by 2002:a05:600c:4f03:b0:3dd:e86e:8827 with SMTP id
 l3-20020a05600c4f0300b003dde86e8827mr1890227wmq.4.1675257261453; 
 Wed, 01 Feb 2023 05:14:21 -0800 (PST)
X-Received: by 2002:a05:600c:4f03:b0:3dd:e86e:8827 with SMTP id
 l3-20020a05600c4f0300b003dde86e8827mr1890191wmq.4.1675257261254; 
 Wed, 01 Feb 2023 05:14:21 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 v2-20020a05600c15c200b003dc54eef495sm1643451wmf.24.2023.02.01.05.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 05:14:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 04/20] scripts/clean-includes: Improve --git commit
 message
In-Reply-To: <875ycly2h5.fsf@pond.sub.org> (Markus Armbruster's message of
 "Wed, 01 Feb 2023 13:49:58 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 14:14:19 +0100
Message-ID: <87bkmdfrys.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i+2d8FqP4ChM

Markus Armbruster <armbru@redhat.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> Markus Armbruster <armbru@redhat.com> wrote:
>>> The script drops #include "qemu/osdep.h" from headers.  Mention it in
>>> the commit message it uses for --git.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  scripts/clean-includes | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/clean-includes b/scripts/clean-includes
>>> index f0466a6262..f9722c3aec 100755
>>> --- a/scripts/clean-includes
>>> +++ b/scripts/clean-includes
>>> @@ -193,8 +193,8 @@ if [ "$GIT" = "yes" ]; then
>>>      git commit --signoff -F - <<EOF
>>>  $GITSUBJ: Clean up includes
>>>  
>>> -Clean up includes so that osdep.h is included first and headers
>>> -which it implies are not included manually.
>>> +Clean up includes so that qemu/osdep.h is included first in .c, and
>>> +not in .h, and headers which it implies are not included manually.
>>
>> I give a tree.
>>
>> Clean up includes so qemu/osdep.h is never used in .h files.  It makes
>> sure that qemu/osdep.h is only used in .c files.  Once there, it assures
>> that .h files already included in qemu/osdep.h are not included a second
>> time on the .c file.
>>
>> What do you think?
>
> Neglects to mention qemu/osdep.h goes first in .c.

/me tries again

What about:

The file qemu/osdep.h should only be included in .c files.  And it has
to be the first included file.

This script does several things:
- Remove qemu/osdep.h from .h files.
- If qemu/osdep.h is included in a .c file it is moved to the first
  included position if it is anywhere else.
- Remove from .c files all include files that are already present in
  qemu/osdep.h.

Later, Juan.

